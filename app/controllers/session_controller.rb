class SessionController < ApplicationController

  $current_user = nil

	 protect_from_forgery
	
  def homepage
    @user = $current_user
  end


  def profile
    @user = $current_user
    @user_info = User.find_by_id(@user.id)
  end

  def tvshows
    @user = $current_user
    @all_shows = Tvshow.select(:name,:year,:image,:rating).uniq
  end

  def log_user
    
  end

  def login_user
  	user = User.authenticate(params[:email_log], params[:password_log])
  	if user
  		# log_in user
      session[:user_id] = user
      $current_user = session[:user_id]
  		redirect_to :controller => 'session', :action => 'homepage', :notice => "Logged in!"
  	else
  		flash[:notice] = "Invalid email or password"
  		render :controller => 'session', :action => 'log_user', :notice => "Invalid email or password"
  	end
  end

  def destroy
  	# log_out
    session[:user_id] = nil
    $current_user = nil
    flash[:notice] = "Logged out"
  	redirect_to :controller => 'session', :action => 'homepage', :notice => "Logged out!"
  end

  def team
    @user = $current_user
  end

  def session_a_show
    @user = $current_user
    @this_show = Tvshow.find_by_name(params[:id])
    @category_id = Tvshow.where(name: @this_show.name)
    list = Array.new
    @category_id.each do |cat|
      list.push(cat.categories_id)
    end
    @genre = Category.where(id: list)
  end

  def season
    @user = $current_user
    @this_season = Season.where(tvshows_id: params[:season_id])
    @tvshow_name = Tvshow.select(:name).where(id: params[:season_id])
  end

  def episode
    @user = $current_user
    @tvshows_id = Season.select(:tvshows_id).where(id: params[:episode_id])
    tv_id = []
    @tvshows_id.each { |row|  tv_id.push(row.tvshows_id) }
    @tvshow_name = Tvshow.where(id: tv_id[0])

    @this_episode = Episode.where(seasons_id: params[:episode_id])
    @this_season = Season.where(id: params[:episode_id])
  end

  def a_episode
    @user = $current_user
    season_id = Episode.select(:seasons_id).find_by_id(params[:a_episode_id])
    tvshow_id = Season.select(:tvshows_id).find_by_id(season_id.seasons_id)
    @tvshow_name = Tvshow.find_by_id(tvshow_id.tvshows_id)
    @this_episode = Episode.find_by_id(params[:a_episode_id])
  end

  def view_review
    @user = $current_user
    @review_this_show = Tvshow.find_by_id(params[:view_review])
    @review = TvshowReview.where(tvshows_id: params[:view_review]) 
  end

  def give_review
    @user = $current_user
    @review = TvshowReview.new
    @review_this_show = Tvshow.find_by_id(params[:give_review])

    # @user_reviews = User.select("users.username, users.id, tvshow_reviews.review, tvshow_reviews.tvshows_id").joins(", tvshow_reviews").where("users.id = tvshow_reviews.users_id")
  end

  def create_review
    @user = $current_user
    @username = @user.username
    @tvshows_id = params[:tvshows_id]
    @check_success = TvshowReview.create(tvshows_id: @tvshows_id, users_id: @user.id, review: params[:review], username: @username)
    if @check_success
      redirect_to :controller => 'session', :action => 'tvshows', :notice => "gave review"
    else
      render :controller => 'session', :action => "give_review", :notice => "unsuccess"
    end
  end

  def season_view_review
    @user = $current_user
    @tvshow_id = Season.find_by_id(params[:season_view_review])
    @review_this_show = Tvshow.find_by_id(@tvshow_id.tvshows_id)
    @review_this_season = Season.find_by_id(params[:season_view_review])
    @season_reviews = SeasonReview.where(seasons_id: params[:season_view_review])
  end

  def season_give_review
    @user = $current_user
    @review = SeasonReview.new
    @tvshow_id = Season.find_by_id(params[:season_give_review])
    @review_this_show = Tvshow.find_by_id(@tvshow_id.tvshows_id)
    @review_this_season = Season.find_by_id(params[:season_give_review])

  end

  def create_season_review
    @user = $current_user
    @username = @user.username
    @seasons_id = params[:seasons_id]
    @check_success = SeasonReview.create(seasons_id: @seasons_id, users_id: @user.id, review: params[:review], username: @username)
    if @check_success
      redirect_to :controller => 'session', :action => 'tvshows', :notice => "gave review"
    else
      render :controller => 'session', :action => "season_give_review", :notice => "unsuccess"
    end
  end

  def episode_view_review
    @user = $current_user
    @season_id = Episode.find_by_id(params[:episode_view_review])
    @tvshow_id = Season.find_by_id(@season_id.seasons_id)
    @review_this_show = Tvshow.find_by_id(@tvshow_id.tvshows_id)
    @review_this_season = Season.find_by_id(params[:episode_view_review])
    @review_this_episode = Episode.find_by_id(params[:episode_view_review])
    @episode_reviews = EpisodeReview.where(episodes_id: params[:episode_view_review])
  end

  def episode_give_review
    @user = $current_user
    @review = EpisodeReview.new
    @season_id = Episode.find_by_id(params[:episode_give_review])
    @tvshow_id = Season.find_by_id(@season_id.seasons_id)
    @review_this_show = Tvshow.find_by_id(@tvshow_id.tvshows_id)
    @review_this_season = Season.find_by_id(params[:episode_give_review])
    @review_this_episode = Episode.find_by_id(params[:episode_give_review])
  end

  def create_episode_review
    @user = $current_user
    @username = @user.username
    @episodes_id = params[:episodes_id]
    @check_success = EpisodeReview.create(episodes_id: @episodes_id, users_id: @user.id, review: params[:review], username: @username)
    if @check_success
      redirect_to :controller => 'session', :action => 'tvshows', :notice => "gave review"
    else
      render :controller => 'session', :action => "epsiode_give_review", :notice => "unsuccess"
    end
  end

  def tvshow_view_rating
    @user = $current_user
    @rating = TvshowRating.where(tvshows_id: params[:tvshow_view_rating])
    @rating_this_show = Tvshow.find_by_id(params[:tvshow_view_rating])
  end

  def tvshow_give_rating
    @user = $current_user
    @rating = TvshowRating.new
    @rating_this_show = Tvshow.find_by_id(params[:tvshow_give_rating])
  end

  def create_tvshow_rating
    @user = $current_user
    @username = @user.username
    @tvshows_id = params[:tvshows_id]
    @tvshow_name = Tvshow.find_by_id(@tvshows_id)
    @check_success = TvshowRating.create(tvshows_id: @tvshows_id, users_id: @user.id, rating: params[:rating], username: @username)
    if @check_success
      @count_ratings = TvshowRating.select(:tvshows_id).where(:tvshows_id => params[:tvshows_id]).group(:tvshows_id).count(:tvshows_id)
      @sum_ratings = TvshowRating.select(:tvshows_id).where(:tvshows_id => params[:tvshows_id]).group(:tvshows_id).sum(:rating)
      
      @average_rating = @sum_ratings[Integer(params[:tvshows_id])]  / @count_ratings[Integer(params[:tvshows_id])]
      @average_rating = '%.1f' % [ @average_rating.round(1) ]
      @check_success = Tvshow.where(:name => @tvshow_name.name).update_all(:rating => @average_rating)

      if @check_success
        redirect_to :controller => 'session', :action => 'tvshows', :notice => "gave rating with new update"
      else
        render :controller => 'session', :action => "season_give_rating", :notice => "unsuccess new update"
      end

    else
      render :controller => 'session', :action => "season_give_rating", :notice => "unsuccess"
    end
  end

  def season_view_rating
    @user = $current_user
    @rating = SeasonRating.where(seasons_id: params[:season_view_rating])
    @tvshow_id = Season.find_by_id(params[:season_view_rating])
    @rating_this_show = Tvshow.find_by_id(@tvshow_id.tvshows_id)
    @rating_this_season = Season.find_by_id(params[:season_view_rating])
  end

  def season_give_rating
    @user = $current_user
    @rating = SeasonRating.new
    @tvshow_id = Season.find_by_id(params[:season_give_rating])
    @rating_this_show = Tvshow.find_by_id(@tvshow_id.tvshows_id)
    @rating_this_season = Season.find_by_id(params[:season_give_rating])
  end

  def create_season_rating
    @user = $current_user
    @username = @user.username
    @seasons_id = params[:seasons_id]
    # @season_name = Season.find_by_id(@tvshows_id)
    @check_success = SeasonRating.create(seasons_id: @seasons_id, users_id: @user.id, rating: params[:rating], username: @username)
    if @check_success
      @count_ratings = SeasonRating.select(:seasons_id).where(:seasons_id => params[:seasons_id]).group(:seasons_id).count(:seasons_id)
      @sum_ratings = SeasonRating.select(:seasons_id).where(:seasons_id => params[:seasons_id]).group(:seasons_id).sum(:rating)
      
      @average_rating = @sum_ratings[Integer(params[:seasons_id])]  / @count_ratings[Integer(params[:seasons_id])]
      @average_rating = '%.1f' % [ @average_rating.round(1) ]
      @check_success = Season.where(:id => @seasons_id).update_all(:rating => @average_rating)

      if @check_success
        redirect_to :controller => 'session', :action => 'tvshows', :notice => "gave rating with new update"
      else
        render :controller => 'session', :action => "season_give_rating", :notice => "unsuccess new update"
      end

    else
      render :controller => 'session', :action => "season_give_rating", :notice => "unsuccess"
    end
  end

  def episode_view_rating
    @user = $current_user
    @rating = EpisodeRating.where(episodes_id: params[:episode_view_rating])
    @rating_this_episode = Episode.find_by_id(params[:episode_view_rating])
    @rating_this_season = Season.find_by_id(@rating_this_episode.seasons_id)
    @tvshow_id = @rating_this_season.tvshows_id
    @rating_this_show = Tvshow.find_by_id(@tvshow_id)
  end

  def episode_give_rating
    @user = $current_user
    @rating = EpisodeRating.new
    @rating_this_episode = Episode.find_by_id(params[:episode_give_rating])
    @rating_this_season = Season.find_by_id(@rating_this_episode.seasons_id)
    @tvshow_id = @rating_this_season.tvshows_id
    @rating_this_show = Tvshow.find_by_id(@tvshow_id)
  end

  def create_episode_rating
    @user = $current_user
    @username = @user.username
    @episodes_id = params[:episodes_id]
    # @episode_name = Season.find_by_id(@tvshows_id)
    @check_success = EpisodeRating.create(episodes_id: @episodes_id, users_id: @user.id, rating: params[:rating], username: @username)
    if @check_success
      @count_ratings = EpisodeRating.select(:episodes_id).where(:episodes_id => params[:episodes_id]).group(:episodes_id).count(:episodes_id)
      @sum_ratings = EpisodeRating.select(:episodes_id).where(:episodes_id => params[:episodes_id]).group(:episodes_id).sum(:rating)
      
      @average_rating = @sum_ratings[Integer(params[:episodes_id])]  / @count_ratings[Integer(params[:episodes_id])]
      @average_rating = '%.1f' % [ @average_rating.round(1) ]
      @check_success = Episode.where(:id => @episodes_id).update_all(:rating => @average_rating)

      if @check_success
        redirect_to :controller => 'session', :action => 'tvshows', :notice => "gave rating with new update"
      else
        render :controller => 'session', :action => "episode_give_rating", :notice => "unsuccess new update"
      end

    else
      render :controller => 'session', :action => "episode_give_rating", :notice => "unsuccess"
    end
  end

end
