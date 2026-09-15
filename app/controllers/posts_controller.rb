class PostsController < ApplicationController
 def index
  @posts = Post.all
 end

 def show
  @post = Post.find(params[:id])
 end

 def new
  @post = Post.new
 end

 def create
  @post = Post.new(post_params)

  if @post.save
   redirect_to posts_path, notice: "予定を登録しました"
  else
   flash.now[:alert] = "スケジュールの登録に失敗しました"
   render :new, status: :unprocessable_entity
 end  
end

 def edit
  @post = Post.find(params[:id])
 end

 def update
  @post = Post.find(params[:id])

  if @post.update(post_params)
    redirect_to posts_path, notice: "スケジュールを更新しました"
  else
    flash.now[:alert] = "スケジュールの更新に失敗しました"
    render :edit, status: :unprocessable_entity
  end
 end

 def destroy
  @post = Post.find(params[:id])

  @post.destroy
  redirect_to posts_path, notice: "予定を削除しました"
 end

private

 def post_params
  params.require(:post).permit(:title, :body, :start_date, :end_date, :all_day)
 end

end
