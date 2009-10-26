module Remarkable
  module Authlogic
    module Matchers
      class BeAuthenticMatcher < Remarkable::ActiveRecord::Base        
        assertion :be_authentic?

        def be_authentic?
          @subject.class.new.respond_to?('reset_persistence_token!')                  
        end
      end

      def be_authentic
        BeAuthenticMatcher.new.spec(self)
      end
    end
  end
end