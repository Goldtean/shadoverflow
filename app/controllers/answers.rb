#view answers to a specific question
get '/questions/:id/answers' do
	@question = Question.find(params[:id])
	@answers = Answers.where(question_id: params[:id])
end

#Form to answer a question
get '/questions/:id/answers/new' do

end

#Create new answer route
post '/questions/:id/answers' do
	if session[:id]
		@answer = Answer.create(content: params[:content])
	else
		redirect '/'
	end
end

#View a specific answer
get '/questions/:question_id/answers/:id' do
	@answer = Answer.find(params[:id])
end

#Form to edit an answer
get '/questions/:question_id/answers/:id/edit' do
	@answer = Answer.find(params[:id])
end

#Route to edit answer
put '/questions/:question_id/answers/:id' do
	@answer = Answer.find(params[:id])
	@answer.update_attributes(params[:content])

	redirect '/questions/#{params[:question_id]}/answers/#{params[:id]}'

end