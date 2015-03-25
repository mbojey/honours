@users = User.all.uniq(:studentnumber)

@userary = [];
@marksary = [];
file = File.open("results.csv", "w+")
file.write("" + "Student Number" + ", " + "Score" + "\n")
@users.each do |u|
	@scenes = Scene.where("creator_id = ? or collab_id = ?", u.id, u.id)
	@score = ((2*@scenes.where(correct: true, hint: true).uniq.pluck(:question).count + 
			 4*@scenes.where(correct: true, hint: nil, collab_id: 0).uniq.pluck(:question).count + 
			 5*(@scenes.where(correct: true, hint: nil).uniq.pluck(:question).count - 
			 @scenes.where(correct: true, hint: nil, collab_id: 0).uniq.pluck(:question).count))/80.0)*30
	@userary.push(u.studentnumber)
	@marksary.push(@score)
	begin
  		file.write("" + u.studentnumber.to_s + ", " + @score.to_s + "\n") 
	rescue IOError => e
  	#some error occur, dir not writable etc.
	end
end
file.close unless file == nil