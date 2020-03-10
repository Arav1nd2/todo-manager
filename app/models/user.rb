class User < ApplicationRecord
  def to_string
    "#{id}.  #{name}  #{email}"
  end
end
