class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :attraction

	def take_ride
		if self.user.height < self.attraction.min_height
			if self.user.tickets < self.attraction.tickets
				return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
			else
				return "Sorry. You are not tall enough to ride the #{self.attraction.name}."
			end
		elsif self.user.tickets < self.attraction.tickets
			return "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
		else
			#binding.pry
			self.user.tickets -= self.attraction.tickets
			self.user.nausea += self.attraction.nausea_rating
			self.user.happiness += self.attraction.happiness_rating
			self.user.save
			return "Thanks for riding the #{self.attraction.name}!"
		end
	end
end
