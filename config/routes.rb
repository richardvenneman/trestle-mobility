# frozen_string_literal: true

Trestle::Engine.routes.draw do
  controller "trestle/mobility/translations" do
    post "translate"
  end
end
