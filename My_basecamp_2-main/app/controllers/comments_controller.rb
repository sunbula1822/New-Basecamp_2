class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_message
  
    def create
      @comment = @message.comments.create(comment_params)
      @comment.user = current_user
  
      if  @comment.save
        redirect_to message_path(@message), notice: 'Comment has been created'
      else
        redirect_to message_path(@message), alert: 'Comment has not been created'
      end
    end
  
    def  destroy
      @comment = @message.comments.find(params[:id])
      @comment.destroy
      redirect_to message_path(@message)
    end
  
    def update
      @comment = @message.comments.find(params[:id])
  
      respond_to  do | format |
        if @comment.update(comment_params)
          format.html { redirect_to message_url(@message), notice: 'Comment has been updated' }
        else
          format.html { redirect_to message_url(@message), alert: 'Comment was not updated!' }
        end
      end
    end
  
    private
  
    def set_message
      @message = Message.find(params[:message_id])
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end