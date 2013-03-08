Chaplin = require 'chaplin'
Layout = require 'views/layout'
mediator = require 'mediator'
routes = require 'routes'

# The application object.
module.exports = class Application extends Chaplin.Application
  # Set your application name here so the document title is set to
  # “Controller title – Site title” (see Layout#adjustTitle)
  title: 'Brunch example application'

  initialize: ->
    super

    # Register all routes.
    # You might pass Router/History options as the second parameter.
    # Chaplin enables pushState per default and Backbone uses / as
    # the root per default. You might change that in the options
    # if necessary:
    # @initRouter routes, pushState: false, root: '/subdir/'
    @initRouter routes

    # Initialize core components.
    @initDispatcher controllerSuffix: '-controller'
    @initLayout()
    @initMediator()
    @initComposer()

    # Start routing.
    @router.startHistory()

    # Freeze the application instance to prevent further changes.
    Object.freeze? this

  # Override standard layout initializer
  # ------------------------------------
  initLayout: ->
    # Use an application-specific Layout class. Currently this adds
    # no features to the standard Chaplin Layout, it’s an empty placeholder.
    @layout = new Layout {@title}

  # Create additional mediator properties
  # -------------------------------------
  initMediator: ->
    # Add additional application-specific properties and methods
    # e.g. mediator.prop = null

    # Seal the mediator.
    mediator.seal()
