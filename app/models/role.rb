class Role < ActiveRecord::Base
	# 1: returns all auditions associated with role
  has_many :auditions

	# 2: returns array of names of actors assoc. with role
	def actors
		self.auditions.map do |audition|
			audition.actor
		end
	end

	# 3: returns array of locations from auditions assoc.
	# with role
	def locations
		self.auditions.map do |audition|
			audition.location
		end
	end

	# 4: returns first instance of audition hired for
	# role or returns string 'no actor has been hired'
	def lead
		self.auditions.find_by(hired: true) || "no actor has been hired for this role"
	end

	# 5: returns the second instance of the audition that
	# was hired for the role or returns string 'no
	# actor has been hired'
	def understudy
		self.auditions.where(hired: true)[1] || "no actor has been hired for this role"
		# OR: self.auditions.where(hired: true).second
	end
end