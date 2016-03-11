###### COMMENTS ON ANSWERS ########

#view all comments for an answer
get '/answers/:id/comments' do
	@answer = Answer.find(params[:id])
	@comments = @answer.comments
end

#Form to comment on an answer
get '/answers/:id/comments/new' do

end

#Create new 'answer' comment route
post '/answers/:id/comments' do
	if session[:id]
		@comment = Comment.create(content: params[:content])
	else
		redirect '/'
	end
end

#View a specific 'answer' comment
get '/answers/:answer_id/comments/:id' do
	@comment = Comment.find(params[:id])

end

#Form to edit an 'answer' comment
get '/answers/:answer_id/comments/:id/edit' do
	@comment = Comment.find(params[:id])		
end

#Route to edit an 'answer' comment
put '/answers/:answer_id/comments/:id' do
	@comment = Comment.find(params[:id])
	@comment.update_attirbutes(params[:content])

	redirect '/answers/#{params[:answer_id]}/comments/#{params[:id]}'
end