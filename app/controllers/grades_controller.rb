class GradesController < ApplicationController
  def show
    @grade = Grade.find(params[:id], :include => { :marks => :criterion }, :order => 'criteria.id')
    
    respond_to do |format|
      format.html
      format.pdf { send_data make_pdf(:template => 'grades/show', :stylesheets => ['application', 'prince']), :filename => "#{@student.name} - #{@assignment.name}", :type => 'application/pdf', :disposition => 'inline' }
    end
  end

  def edit
    @grade = Grade.find(params[:id], :include => { :marks => :criterion }, :order => 'criteria.id')
  end

  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if @grade.update_attributes(params[:grade])
        flash[:notice] = 'Grade was successfully updated.'
        format.html { redirect_to(@grade) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @grade.errors, :status => :unprocessable_entity }
      end
    end
  end

  def email
    @grade = Grade.find(params[:id])
    @gradesheet = make_pdf(:template => 'grades/show.pdf', :stylesheets => ['application', 'prince'])
    
    Notifications.deliver_grade_email(@grade, @gradesheet)
    
    respond_to do |format|
      flash[:notice] = 'Email was successfully sent.'
      format.html { redirect_to(@grade) }
      format.xml  { head :ok }
    end
  end
end
