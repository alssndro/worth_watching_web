
class Movie < ActiveRecord::Base
  validates :title, :plot, :cast, :rt_rating ,:rt_url, :imdb_rating, :imdb_url,
            :metacritic_rating, :metacritic_url, :director, :genre,
            :release_date , presence: true

  #has_attached_file :poster, styles: {small: "344x519#", big: "667x1082#"},
                    #default_url: ActionController::Base.helpers.asset_path(":style/default_poster.png")

  has_many :reviews, dependent: :destroy

  def average_rating
    ratings = [].push(rt_rating/10, imdb_rating, metacritic_rating/10)

    ratings_sum = ratings.inject(0) { |sum, rating| sum += rating }

    average_rating = (ratings_sum / ratings.count).round(1)
  end
end
