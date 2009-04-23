class GradesController < ApplicationController
  before_filter :get_student
  before_filter :get_assignment
  before_filter :get_question

  def get_student
    @student = Student.find(params[:student_id]) rescue nil
  end
  
  def get_assignment
    @assignment = Assignment.find(params[:assignment_id]) rescue nil
  end
  
  def get_question
    @question = Question.find(params[:question_id]) rescue nil
  end

  def show
    respond_to do |format|
      format.html
      format.pdf { send_data make_pdf(:template => 'grades/show', :stylesheets => ['application', 'prince']), :filename => "#{@student.name} - #{@assignment.name}", :type => 'application/pdf', :disposition => 'inline' }
    end
  end

  def edit
    @grade = Grade.first(:conditions => { :student_id => @student.id, :assignment_id => @assignment.id, :question_id => @question.id })
    @grade ||= Grade.new
  end

  def create
    @grade = Grade.new(params[:grade])
    @grade.student    = @student
    @grade.assignment = @assignment
    @grade.question   = @question

    respond_to do |format|
      if @grade.save
        flash[:notice] = 'Grade was successfully created.'
        format.html { redirect_to([@student, @assignment]) }
        format.xml  { render :xml => @grade, :status => :created, :location => @grade }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @grade.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @grade = Grade.first(:conditions => { :student_id => @student.id, :assignment_id => @assignment.id, :question_id => @question.id })

    respond_to do |format|
      if @grade.update_attributes(params[:grade])
        flash[:notice] = 'Grade was successfully updated.'
        format.html { redirect_to([@student, @assignment]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grade.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def email
    @gradesheet = make_pdf(:template => 'grades/show', :stylesheets => ['application', 'prince'])
    
    Notifications.deliver_grade_email(@student, @assignment, @gradesheet) if @student && @assignment
    
    respond_to do |format|
      flash[:notice] = 'Email was successfully sent.'
      format.html { redirect_to([@student, @assignment]) }
      format.xml  { head :ok }
    end
  end
end
