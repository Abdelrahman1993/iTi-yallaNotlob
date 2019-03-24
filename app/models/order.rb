class Order < ApplicationRecord
    enum status: {
        waiting: "waiting",
        finished: "finished"
      }


end
