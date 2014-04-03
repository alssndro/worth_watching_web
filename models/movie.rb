require 'paperclip'

class Movie < ActiveRecord::Base
  include Paperclip::Glue

  validates :title, :plot, :cast, :rt_rating ,:rt_url, :imdb_rating, :imdb_url,
            :metacritic_rating, :metacritic_url, :director, :genre,
            :release_date , presence: true

  has_attached_file :poster, styles: {small: "344x519#", big: "667x1082#"},
                    default_url: ("public/img/default_poster.png")

  validates_attachment :poster, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  validates_attachment_file_name :poster, :matches => [/png\Z/, /jpe?g\Z/]

  has_many :reviews, dependent: :destroy

  def average_rating
    ratings = [].push(rt_rating/10, imdb_rating, metacritic_rating/10)

    ratings_sum = ratings.inject(0) { |sum, rating| sum += rating }

    average_rating = (ratings_sum / ratings.count).round(1)
  end
end

module Paperclip
  module Interpolations
    # Returns the Rails.root constant.
    def rails_root(attachment, style_name)
      FreshPopcornApp.root
    end

    # Returns the Rails.env constant.
    def rails_env(attachment, style_name)
      'test'
    end
  end
end
