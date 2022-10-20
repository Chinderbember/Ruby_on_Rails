# frozen_string_literal: true

module ParamsHelper
  extend Grape::API::Helpers

  params :filters do
    optional :all,
             type: Boolean,
             desc: 'весь список, включая завершённые'
  end
end
