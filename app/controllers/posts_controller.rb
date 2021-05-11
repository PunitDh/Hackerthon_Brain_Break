class PostsController < ApplicationController
# before_action @post = Post.find(params[:id])
    before_action :authenticate_user!
    
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
        account_sid = 'AC171419d3605386d42ba0f90bf14c390d' 
        auth_token = '8669f3b301bba35b8691f1b6feddee06' 
        @client = Twilio::REST::Client.new(account_sid, auth_token) 
         
        message = @client.messages.create(         
                                     to: '+61468757015' 
                                   ) 
         
        puts message.sid


        # puts params[:body] += 1
        # @post.body = @post.body.to_i + 1
        @post.update(post_params)
        redirect_to root_path
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
