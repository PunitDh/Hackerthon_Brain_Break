module TwilioHelper
	def parse_sms(sms)

        body = sms[:Body]&.strip&.upcase
        from = sms[:From]

        case body

        when "HELLO"
            return "Hello world"

        else
            return "Sorry I didn't get that."
        end

end
end
