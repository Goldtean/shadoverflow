#Browse all questions / Trending questions
get '/questions' do
	@questions = Question.all
end

#Form to create new question
get '/questions/new' do

end

#Create new question route
post '/questions' do
	if session[:id]
		@question = Question.create(content: params[:content])
	else
		redirect '/'
	end
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

