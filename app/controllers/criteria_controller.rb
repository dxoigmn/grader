class CriteriaController < ApplicationController
  before_filter :get_assignment

  def get_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end
  
  def index
    @criteria = @assignment.criteria

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @criteria }
    end
  end

  def show
    @criterion = @assignment.criteria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @criterion }
    end
  end

  def new
    @criterion = @assignment.criteria.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @criterion }
    end
  end

  def edit
    @criterion = @assignment.criteria.find(params[:id])
  end

  def create
    @criterion = @assignment.criteria.new(params[:criterion])

    respond_to do |format|
      if @criterion.save
        flash[:notice] = 'Criterion was successfully created.'
        format.html { redirect_to([@assignment, @criterion]) }
        format.xml  { render :xml => @criterion, :status => :created, :location => @criterion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @criterion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @criterion = @assignment.criteria.find(params[:id])

    respond_to do |format|
      if @criterion.update_attributes(params[:criterion])
        flash[:notice] = 'Criterion was successfully updated.'
        format.html { redirect_to([@assignment, @criterion]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @criterion.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @criterion = @assignment.criteria.find(params[:id])
    @criterion.destroy

    respond_to do |format|
      format.html { redirect_to(assignment_path(@assignment)) }
      format.xml  { head :ok }
    end
  end
end
