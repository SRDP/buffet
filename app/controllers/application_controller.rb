class ApplicationController < ActionController::Base

@dashboards = Dashboard.all

 @select = @dashboards.last.attributes.keys - ["id","created_at","updated_at"]

end
