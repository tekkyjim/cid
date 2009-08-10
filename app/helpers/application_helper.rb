# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def newest_member
      return @newest_member if defined?(@newest_member)
      unless User.last.nil? || current_user.nil?
        @newest_member = "Newest Member: " + User.last.login
      end
    end
end
