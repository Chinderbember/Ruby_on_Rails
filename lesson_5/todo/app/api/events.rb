# frozen_string_literal: true

class Events < Grape::API
  helpers ParamsHelper, FiltersHelper, Pundit

  resource :events do
    desc 'Список дел'
    params do
      use :filters
    end
    get '/' do
      authenticated_user
      present event_scope, with: Entities::EventIndex
    end

    route_param :event_id, type: Integer do
      before do
        @event = event_scope.find params[:event_id]
      end

      desc 'Получить информацию о деле'
      params do
        use :filters
      end
      get '/' do
        authenticated_user
        present @event, with: Entities::Event
      end
    end
  end
end
