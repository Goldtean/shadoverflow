###### COMMENTS ON QUESTIONS #######

#view all comments on a question
get '/questions/:id/comments' do
	@question = Question.find(params[:id])
	@comments = @question.comments
end

#Form to comment on a question
get '/questions/:id/comments/new' do

end

#Create a new 'question' comment route
post '/questions/:id/comments' do
	if session[:id]
		@comment = Comment.create(content: params[:content])
	else
		redirect '/'
	end
end

#View a specific 'question' comment
get '/questions/:question_id/comments/:id' do
	@comment = Comment.find(params[:id])
end

#Form to edit a 'question' comment
get '/questions/:question_id/comments/:id/edit' do
	@comment = Comment.find(params[:id])
end


#Route to update a 'question' comment
put '/questions/:question_id/comments/:id' do
	@comment = Comment.find(params[:id])
	@comment.update_attributes(params[:content])

	redirect '/questions/#{params[:question_id]}/comments/#{params[:id]}'
end

