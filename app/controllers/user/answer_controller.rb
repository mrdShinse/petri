class User::AnswerController < User::Base
  def create
    @answer = Answer.new(post_params)
    @answer.post_id = params[:post_id]
    if @answer.save
      flash.notice = '回答を投稿しました。'
    end
    redirect_to user_post_url(@answer.post_id)
  end

  private
  def post_params
    params.require(:answer).permit(
      :content
    )
  end
end
