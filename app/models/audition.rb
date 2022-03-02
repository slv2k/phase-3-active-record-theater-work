class Audition < ActiveRecord::Base
	# 1: returns instance of role associated with audition
  belongs_to :role

	# 2: changes 'hired' attribute to true
	def call_back
		self.hired = true
		self.save
	end
end