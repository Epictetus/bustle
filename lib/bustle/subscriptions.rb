module Bustle
  class Subscriptions
    RESOURCE_NAME = 'Bustle::Subscription'

    include Concern::Filterable
    include Concern::ByPublisher
    include Concern::ForSubscriber

    class << self
      def add(publisher, subscriber)
        Subscription.to_adapter.create!(
          :publisher_id  => publisher.id,
          :subscriber_id => subscriber.id
        )
      end

      def get(publisher, subscriber)
        Subscription.to_adapter.find_first(
          :publisher_id  => publisher.id,
          :subscriber_id => subscriber.id
        )
      end

      def remove(publisher, subscriber)
        get(publisher, subscriber).destroy
      end
    end
  end
end
