class MoviesController < ApplicationController

  def initialize
    super
    @all_ratings = Movie.all_ratings
  
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    session[:ratings] ||= Movie.all_ratings
    #redirect_to movies_path(@ratings = session[:ratings]) if @ratings.nil?
#redirect_to movies_path([:sort => session[:sort]]) if @sort.nil?
    redirect_to movies_path([:sort => session[:sort], :ratings => params[:ratings]]) if params[:sort].nil?
    session[:sort] = @sort unless @sort.nil?
    @sort = session[:sort]

    @ratings = params[:ratings]
    logger.debug(@ratings)
    @ratings_ary = @ratings ? @ratings.keys : @all_ratings unless @ratings.nil?

    @ratings_ary = session[:ratings] if @ratings_ary.nil?
    logger.debug(@ratings_ary)
    session[:ratings] = @ratings_ary if @ratings_ary.length > 0
    logger.debug(session[:ratings])
    @movies = Movie.where(:rating => session[:ratings]).order(session[:sort])
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
end
