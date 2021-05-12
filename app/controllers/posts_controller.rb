class PostsController < ApplicationController
# before_action @post = Post.find(params[:id])
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, only: [:about]
    
    def index
        @posts = Post.all
    end
    
    def show
        @post = Post.find(params[:id].to_i)
        render 'posts/show'
    end

    def new
        @post = Post.new
        @post.body = 0
    end

    def create
        @post = Post.new(post_params)
        @post.save
        # message = "A post was just added."
        # TwilioTextMessenger.new(message).call
        redirect_to root_path
    end

    def edit
        @post = Post.find(params[:id].to_i)
        render "posts/edit"
    end

    def update
        @post = Post.find(params[:id].to_i)
        client = Twilio::REST::Client.new
        # raise params[:post][:body].inspect
        client.messages.create(from: "+17206053308", to: "+61468757015", body: "#{params[:post][:title]} now has #{params[:post][:body]} chocolates.")
        # puts params[:body] += 1
        # @post.body = @post.body.to_i + 1
        @post.update(post_params)
        redirect_to root_path
    end

    def about
        render "shared/about"
    end

    def destroy
        @post = Post.find(params[:id].to_i)
        @post.delete
        redirect_to root_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
