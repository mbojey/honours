@users = Scene.where.not(submitted_at: nil)
p ("" "Creator id" + " , " + "Collab id" + " , "+ "Created at" + " , "+ "Submitted at" + " , "+ "Question" + " , "+ "Correct" + " , "+ "Hint" + " , " + "Time Spent")

@users.each do |u|
	responses = "INSERT INTO Scenes VALUES("
	responses += "" + u.creator_id.to_s + ","
	responses += "" + u.collab_id.to_s + ","
	responses += "" + u.created_at.to_i.to_s+ ","
	responses += "" + u.submitted_at.to_i.to_s + ","
	responses += "" + u.question.to_s + ","
	responses += "" + u.correct.to_s + ","
	responses += "" + u.hint.to_s + ","
	responses += "" + (DateTime.parse(u.submitted_at.to_s).to_time - DateTime.parse(u.created_at.to_s).to_time).to_s + ");"
	p responses
end
