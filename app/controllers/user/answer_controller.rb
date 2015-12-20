class User::AnswerController < User::Base
  def create
    @answer = Answer.new(post_params)
    @answer.post_id = params[:post_id]
    @answer.user_id = session[:user_id]
    if @answer.save
      flash.notice = '回答を投稿しました。'
    else
      flash.now.alert = '入力に誤りがあります。'
    end
    @post = Post.find(params[:post_id])
    @answer = Answer.new
    render 'user/posts/show'
  end

  private
  def post_params
    params.require(:answer).permit(
      :content
    )
  end
end
