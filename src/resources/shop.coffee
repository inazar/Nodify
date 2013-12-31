Base = require 'nodify-shopify/lib/resources/base'

class Shop extends Base
  slug: "shop"
  prefix: "/shop"

  constructor: (site) ->
    super(site)

  # override to fix a bug in the original
  get: (callback) ->
    url = @resource.queryString "#{@prefix}", {}
    @resource.get url, @slug, callback


module.exports = Shop
