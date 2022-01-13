module Visible
    extend ActiveSupport::Concern
  
    VALID_STATUSES = ['produto', 'serviço']
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
  
    class_methods do
      def public_count
        where(status: 'produto').count
      end
    end
  end
  