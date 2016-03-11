###### COMMENTS ON ANSWERS ########

#view all comments for and answer
get '/answers/:id/comments' do
	@answer.comments
end

#Form to comment on a question
get '/answers/:id/comments/new' do

end

#Create new comment route
post '/answers/:id/comments' do

end

#View a specific comment
get '/answers/:answer_id/comments/:id' do

end

#Form to edit an comment
get '/answers/:answer_id/comments/:id/edit' do

end

put '/answers/:answer_id/comments/:id' do
	
end