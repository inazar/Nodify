BaseChild = require 'nodify-shopify/lib/resources/base_child'

class Asset extends BaseChild
  parent: "/themes"
  slug: "asset"
  child: "/assets"

  constructor: (site) ->
    super(site)

  fetch: (parentId, params, callback) ->  
    [params, callback] = [callback, params] if typeof params is 'function'
    url = @resource.queryString "#{@prefix}/#{parentId}#{@child}", params
    @resource.get url, "#{@slug}", callback

  update: (parentId, fields, callback) ->
    callback new Error 'Key is required' unless fields.key?
    url = @resource.queryString "#{@prefix}/#{parentId}#{@child}"
    @resource.put url, @slug, fields, callback

module.exports = Asset
