json.extract! review, :id, :school_id, :user_id, :rate, :content, :created_at, :updated_at
json.url review_url(review, format: :json)
