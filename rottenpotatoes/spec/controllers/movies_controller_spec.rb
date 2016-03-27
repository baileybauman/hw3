# utilized https://github.com/xialiangzhen/bdd-tdd-cycle 
require 'spec_helper'

describe MoviesController do
  describe 'templates' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
    it "renders the show template" do
      { :get => movie_path(1) }.
        should route_to(:controller => "movies", :action => "show", :id => "1")
    end
    it "renders the edit template" do
      { :get => edit_movie_path(1) }.
        should route_to(:controller => "movies", :action => "edit", :id => "1")
    end
    it "renders the director template" do
      { :get => movies_director_path(1) }.
        should route_to(:controller => "movies", :action => "director", :id => "1")
    end
  end
  describe 'create and destroy' do
    it 'should create a new movie' do
      MoviesController.stub(:create).and_return(double('Movie'))
      post :create, {:id => "1"}
    end
    it 'should destroy a movie' do
      movie = Movie.create
      delete :destroy, :id => movie
      flash[:notice].should =~ /deleted/i
    end
    it 'should update a movie' do
      movie = Movie.create
      put :update, :id => movie
      flash[:notice].should =~ /updated/i
    end
    it 'should show directors' do
      @m=double(Movie, :title => "Star Wars", :director => nil, :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
      get :director, :id => 1
      flash[:notice].should =~ /no director/i
    end
    it 'should sort on title' do
      @m=double(Movie, :title => "Star Wars", :director => nil, :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
      get :index, :sort => "title"
      session[:sort].should  eq("title")
    end
    it 'should sort on release_date' do
      @m=double(Movie, :title => "Star Wars", :director => nil, :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
      get :index, :sort => "release_date"
      session[:sort].should  eq("release_date")
    end
    it 'should sort on ratings' do
      @m=double(Movie, :title => "Star Wars", :director => nil, :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
      get :index, :ratings => ["G"]
      session[:ratings].should  eq(["G"])
    end
    it 'should show a movie' do
      @m=Movie.create :title => "Star Wars", :director => "Test", :id => "1"
      get :show, id: @m
      assigns(:movie).should == @m
    end
    it 'should edit a movie' do
      @m=Movie.create :title => "Star Wars", :director => "Test", :id => "1"
      get :edit, id: @m
      assigns(:movie).should == @m
    end
 
  end
end



