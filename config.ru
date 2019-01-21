require_relative './config/environment'

use Rack::MethodOverride
use FileController
run APIController
