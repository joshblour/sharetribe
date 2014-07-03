# Helps passing JSON data to JavaScript
class JSAdapter
  include BaseController::DefaultURLOptions

  # Due to the way Rails includes the url helpers, this has to be AFTER DefaultURLOptions.
  include Rails.application.routes.url_helpers
end