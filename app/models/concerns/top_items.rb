module TopItems
    extend ActiveSupport::Concern

    def top(item_array, amount)
        sorted_by_rating_in_desc_order = item_array.sort_by{ |b| -(b.average_rating || 0) }
        sorted_by_rating_in_desc_order.slice(0, amount)
    end
  end