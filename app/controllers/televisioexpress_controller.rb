class TelevisioexpressController < ApplicationController
	def admin
		
	end

	def tvshows
		@tvshows = Tvshow.all
	end

	def seasons
		@seasons = Season.all
	end

	def episodes
		@episodes = Episode.all
	end
end
