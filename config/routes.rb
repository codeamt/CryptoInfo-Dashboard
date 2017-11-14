Rails.application.routes.draw do
  root "currencies#show", id: "bitcoin"
end
