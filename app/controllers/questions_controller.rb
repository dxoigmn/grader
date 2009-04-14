class QuestionsController < ApplicationController
  before_filter :get_assignment

  def get_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end
  
  def index
    @questions = @assignment.questions

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @questions }
    end
  end

  def show
    @question = @assignment.questions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question }
    end
  end

  def new
    @question = @assignment.questions.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question }
    end
  end

  def edit
    @question = @assignment.questions.find(params[:id])
  end

  def create
    @question = @assignment.questions.new(params[:question])

    respond_to do |format|
      if @question.save
        flash[:notice] = 'Question was successfully created.'
        format.html { redirect_to([@assignment, @question]) }
        format.xml  { render :xml => @question, :status => :created, :location => @question }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @question = @assignment.questions.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        flash[:notice] = 'Question was successfully updated.'
        format.html { redirect_to([@assignment, @question]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = @assignment.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to(assignment_questions_url(@assignment)) }
      format.xml  { head :ok }
    end
  end
end
