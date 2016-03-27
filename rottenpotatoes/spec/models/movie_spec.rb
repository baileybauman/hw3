# spec/models/user_spe.rb
require 'spec_helper'

describe Movie do
    it "is valid with a title, rating, director, and release_date" do
        movie = Movie.new(
            title: 'Test',
            rating: 'PG',
            director: 'Random',
            release_date: '2016-03-18')
        expect(movie).to be_valid
    end

    # other user tests here
    it 'should call Movie with director' do
        movie = Movie.create :title=> 'Test', :rating=> 'PG', :release_date=> '2016-03-18', :director=> 'Random'
        Movie.by_director('Random').first['director'].should eq('Random')
    end

    it 'should give ratings' do
        ratings = ['G','PG','PG-13','NC-17','R']
        ratings.should == Movie.all_ratings
    end

end