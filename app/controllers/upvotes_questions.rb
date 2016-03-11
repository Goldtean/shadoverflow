
#Route to upvote

post '/questions/:id/upvotes' do
	if session[:id]
		@vote = Vote.new(user_id: session[:id], votable_id: params[:votable_id], votable_type: "Question")
		@question = Question.find(params[:id])
		if @vote.save && request.xhr?
			p "AJAX received"
			# erb :_question_box, layout: false, locals:{question: @question}
			@question.to_json
			#This is what happens if the user is upvoting for the first time - maybe make the arrow some color?
		else
			#If they have already upvoted, they get redirected back to the question
			redirect '/questions/#{params[:id]}'
		end
	else
		redirect '/'
	end

end
