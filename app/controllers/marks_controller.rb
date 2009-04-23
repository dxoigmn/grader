class MarksController < ApplicationController
  before_filter :get_student
  before_filter :get_assignment
  before_filter :get_criterion

  def get_student
    @student = Student.find(params[:student_id]) rescue nil
  end
  
  def get_assignment
    @assignment = Assignment.find(params[:assignment_id]) rescue nil
  end
  
  def get_criterion
    @criterion = Criterion.find(params[:criterion_id]) rescue nil
  end

  def show
    respond_to do |format|
      format.html
      format.pdf { send_data make_pdf(:template => 'marks/show', :stylesheets => ['application', 'prince']), :filename => "#{@student.name} - #{@assignment.name}", :type => 'application/pdf', :disposition => 'inline' }
    end
  end

  def edit
    @mark = Mark.first(:conditions => { :student_id => @student.id, :assignment_id => @assignment.id, :criterion_id => @criterion.id })
    @mark ||= Mark.new
  end

  def create
    @mark = Mark.new(params[:mark])
    @mark.student    = @student
    @mark.assignment = @assignment
    @mark.criterion  = @criterion

    respond_to do |format|
      if @mark.save
        flash[:notice] = 'Mark was successfully created.'
        format.html { redirect_to([@student, @assignment]) }
        format.xml  { render :xml => @mark, :status => :created, :location => @mark }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mark.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @mark = Mark.first(:conditions => { :student_id => @student.id, :assignment_id => @assignment.id, :criterion_id => @criterion.id })

    respond_to do |format|
      if @mark.update_attributes(params[:mark])
        flash[:notice] = 'Mark was successfully updated.'
        format.html { redirect_to([@student, @assignment]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mark.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def email
    @gradesheet = make_pdf(:template => 'marks/show.pdf', :stylesheets => ['application', 'prince'])
    
    Notifications.deliver_grade_email(@student, @assignment, @gradesheet) if @student && @assignment
    
    respond_to do |format|
      flash[:notice] = 'Email was successfully sent.'
      format.html { redirect_to([@student, @assignment]) }
      format.xml  { head :ok }
    end
  end
end
