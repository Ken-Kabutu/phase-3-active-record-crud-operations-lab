class Movie < ActiveRecord::Base
      # Validations
  validates :title, presence: true
  validates :release_date, presence: true
  validates :director, presence: true
  validates :lead_actor_actress, presence: true
  validates :in_theaters, inclusion: { in: [true, false] }
     
  # Create
  def self.create_movie(title)
    movie = Movie.new(title: title)
    movie.save
    movie
  end

  # Read
  def self.first_movie
    Movie.first
  end

  def self.last_movie
    Movie.last
  end

  def self.total_movies
    Movie.count
  end

  def self.find_movie_by_id(id)
    Movie.find(id)
  end

  def self.find_movie_by_attributes(attributes)
    Movie.find_by(attributes)
  end

  def self.movies_released_after(year)
    Movie.where("year > ?", year)
  end

  # Update
  def update_movie(attributes)
    update(attributes)
  end

  def self.update_all_movies(title)
    Movie.update_all(title: title)
  end

  # Delete
  def destroy_movie
    destroy
  end

  def self.destroy_all_movies
    Movie.destroy_all
  end
end