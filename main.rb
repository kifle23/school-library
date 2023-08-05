require_relative 'lib/presentation/app'

# The `main` method is the entry point for the application.
# It creates an instance of the `App` class and enters
# a loop that presents the user with a list of options to perform.

def main
  app = App.new
  app.start
end

main
