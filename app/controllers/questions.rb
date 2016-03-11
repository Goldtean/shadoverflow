#Create new question route
post '/questions' do
	if session[:id] && request.xhr?
		@question = Question.create(user_id: session[:id], content: params[:content])
		erb :_question_box, locals: {question: @question}, layout: false
	end
end




#Browse all questions / Trending questions
get '/questions' do
	@questions = Question.all
	erb :index
end

#Form to create new question
get '/questions/new' do

end



#View a specific question
get '/questions/:id' do
	@question = Question.find(params[:id])
end

#Form to edit a question
get '/questions/:id/edit' do

end

#Edit question submit route
put '/questions/:id' do
	@question = Question.find(params[:id])
	@question.update_attributes(params[:content])

	redirect '/questions/#{params[:id]}'

end

