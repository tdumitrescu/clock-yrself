'use strict'

# jasmine specs for services go here

describe "service", ->

  beforeEach(module "clockApp.services")

  describe "version", ->
    it "returns current version", inject((version) ->
      expect(version).toEqual "0.1"
    )
