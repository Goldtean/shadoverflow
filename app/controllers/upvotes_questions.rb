
#Route to upvote 

post '/questions/:id/upvotes' do
	if session[:id]
		@vote = Vote.new(user_id: session[:id], votable_id: params[:id], votable_type: "Question")
		if @vote.save
			#This is what happens if the user is upvoting for the first time - maybe make the arrow some color?
		else
			#If they have already upvoted, they get redirected back to the question
			redirect '/questions/#{params[:id]}'
	else
		redirect '/'
	end
	
end