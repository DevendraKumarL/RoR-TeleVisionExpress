class DiscoverController < ApplicationController

	protect_from_forgery

	def discover_shows
		@categories = Category.all
	end

	def discover_by_category
		category_name = params[:category]
		@category_id = Category.find_by_category_name(category_name)
		@cat = @category_id.id
		@all_shows = Tvshow.all
		@shows = @all_shows.where(categories_id: @cat)
		@count = @shows.count
	end

	def discover_by_year
		year = params[:year]
		@shows = Tvshow.select(:name, :year, :rating, :image).where(year: year).uniq
		@count = @shows.size
	end

	# def discover_a_show
		
	# end
end
