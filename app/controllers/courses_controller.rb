class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i(show public_index)

  def index
    @courses = Course.all
  end

  def public_index
    @courses = Course.all

    render layout: 'public'
  end

  def show
    sparql = SPARQL::Client.new('http://data.open.ac.uk/sparql')
    @query = sparql.select(:think, :description)
                .distinct
                .where(
                  [:think, RDF::URI.new('http://purl.org/dc/terms/description'), :description],
                ).filter('regex(str(?description), "data\\\s+mining", "i" )')

    @bibo = sparql.select(:think, :description)
                .distinct
                .where(
                  [:think, RDF::URI.new('http://purl.org/ontology/bibo/abstract'), :description],
                ).filter('regex(str(?description), "data\\\s+mining", "i" )')

    ssparql = SPARQL::Client.new('http://sparql.data.southampton.ac.uk')
    @squery = ssparql.select(:think, :description)
                     .distinct
                     .where(
                       [:think, RDF::URI.new('http://purl.org/dc/terms/description'), :description]
                     ).filter('regex(str(?description), "data mining", "i" )')
    @sbibo = ssparql.select(:think, :description)
                     .distinct
                     .where(
                       [:think, RDF::URI.new('http://purl.org/ontology/bibo/abstract'), :description]
                     ).filter('regex(str(?description), "data mining", "i" )')

    # msparql = SPARQL::Client.new('http://data.uni-muenster.de/sparql')                     
    # @mbibo = msparql.select(:think, :description)
    #                  .distinct
    #                  .where(
    #                    [:think, RDF::URI.new('http://purl.org/ontology/bibo/abstract'), :description]
    #                  ).filter('regex(str(?description), "data\\\s+mining", "i" )')

    render layout: 'public'
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_url, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to courses_url, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :bootsy_image_gallery_id, course_tags_attributes: %i(word))
  end
end
