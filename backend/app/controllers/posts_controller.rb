class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_user!, except: [:index, :logged_in_info, :manual_sign_in, :manual_signup]

  def index
    respond_to do |format|
      format.html {
        if user_signed_in?
          redirect_to "https://rails-to-break.vercel.app/", allow_other_host: true
        else
          redirect_to new_user_session_path
        end
      }
      format.json {
        @posts = []
        puts @posts, "is happening here"
        if user_signed_in?
          @posts = Post.order(created_at: :desc)
        end
        render json: { posts: @posts, current_user: current_user || nil }
      }
    end
  end

  def logged_in_info
    if !user_signed_in?
      render json: { current_user: nil, user_signed_in: false }
      return
    end
    @user_info = {
      current_user: current_user, user_signed_in: user_signed_in?,
    }
    render json: @user_info
  end

  def show
    if !user_signed_in?
      render json: { post: { body: "401", title: "Please log in" } }
      return
    end
    @post = Post.find_by_id(params[:id])
    if @post == nil
      render json: { post: { body: nil, title: nil } }
      return
    end
    render json: { post: @post }
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated."
      redirect_to root_path
    else
      render "edit"
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.user_email = current_user.email
    if @post.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Post was successfully created."
          redirect_to "https://rails-to-break.vercel.app/", allow_other_host: true
        }
        format.json { render json: { post: @post, current_user: current_user, user_signed_in: user_signed_in? } }
      end
    else
      render "new"
    end
  end

  def manual_logout
    sign_out current_user
    redirect_to "https://rails-to-break.vercel.app/", allow_other_host: true
  end

  def manual_sign_in
    redirect_to new_user_session_path
  end

  def manual_signup
    redirect_to new_user_registration_path
  end

  private

  def post_params
    if !(params[:post])
      new_post = ActionController::Parameters.new(post: {
                                                    title: params[:title],
                                                    body: params[:body],
                                                    private: params[:private],
                                                  })
      params = new_post
    end
    params.require(:post).permit(:title, :body, :private)
  end
end
