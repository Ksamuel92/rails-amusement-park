class Ride < ActiveRecord::Base
    belongs_to :attraction
    belongs_to :user

    def take_ride
        user_has_enough_tickets, user_is_tall_enough = user_meets_requirements
        if user_has_enough_tickets && user_is_tall_enough
        start_ride
        elsif user_has_enough_tickets && !user_is_tall_enough
            "Sorry. #{tall_message}"
        elsif !user_has_enough_tickets && user_is_tall_enough
            "Sorry. #{ticket_message}"
        elsif !user_has_enough_tickets && !user_is_tall_enough
            "Sorry. #{ticket_message} #{tall_message}" 
    end
end

    def start_ride
        new_nausea = (user.nausea + attraction.nausea_rating)
        new_happiness = (user.happiness + attraction.happiness_rating)
        new_tickets = (user.tickets - attraction.tickets)

        user.update(
            happiness: new_happiness,
            nausea: new_nausea,
            tickets: new_tickets
        )
    end

    def user_meets_requirements
        user_has_enough_tickets, user_is_tall_enough = false
        if (user.tickets >= attraction.tickets)
            user_has_enough_tickets = true
        end
        if (user.height >= attraction.min_height)
            user_is_tall_enough = true
        end

        return [user_has_enough_tickets, user_is_tall_enough]
    end


    def tall_message
        "You are not tall enough to ride the Roller Coaster."
    end

    def ticket_message
        "You do not have enough tickets to ride the Roller Coaster."
    end

end