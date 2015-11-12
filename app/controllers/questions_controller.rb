class QuestionsController < ApplicationController
 def index
  	@questions = Question.all
  end

  def new
  	@question = Question.new
  end

  def show
  	@question = Question.find(params[:id])
  end

  def edit
  	@question = Question.find(params[:id])
  end

  def create
	  	@question = Question.new
	  	@question.title = params[:question][:title]
	  	@question.body = params[:question][:body]
	  	@question.resolved = params[:question][:resolved]

	  	if @question.save
	  		flash[:notice] = "Your question has been posted!"
	  		redirect_to @question
	  	else
	  		flash[:error] = "Your question could not be saved"
	  		render :new
	  	end
  end

  def destroy
  	@question = Question.find(params[:id])
  		if @question.destroy
  			flash[:notice] = "\"#{@question.title}\" was deleted successfully"
  			redirect_to questions_path
  		else
  			flash[:error] = "There was an error deleting your question"
  			render :show
  	  end
  	end

  def update
  	@question = Question.find(params[:id])
  	@question.title = (params[:question][:title])
  	@question.body = (params[:question][:body])
  	@question.resolved = (params[:question][:body])

	  	if @question.save
	  		flash[:notice] = "Your question was updated"
	  		redirect_to @question
	  	else
	  		flash[:error] = "Your question could not be updated"
	  		render :edit
	  	end
	end
end
