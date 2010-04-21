class CoursesController < ApplicationController
  def index
    @courses = Course.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @courses }
    end
  end

  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @course }
    end
  end

  def new
    @course = Course.new
    18.times do |i|
      hole = @course.holes.build
      %w{ black white yellow blue red }.each_with_index do |color, diff|
        hole.hole_informations.build(:color => color, :difficulty => diff+1)
      end
      hole.position = i+1
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @course }
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        flash[:notice] = 'Course was successfully created.'
        format.html { redirect_to(@course) }
        format.xml  { render :xml => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        flash[:notice] = 'Course was successfully updated.'
        format.html { redirect_to(@course) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url) }
      format.xml  { head :ok }
    end
  end
end
