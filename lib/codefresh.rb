require "typhoeus"

class Cf
  def initialize(apikey)
    @apikey = apikey
    @url = "https://g.codefresh.io/api"
  end

  def projects
    res = Typhoeus::Request.get(
      @url + "/projects?limit=10&offset=0",
      headers: {"Authorization": @apikey}
    )

    return JSON.parse(res.body)["projects"]
  end

  def project(id)
    res = Typhoeus::Request.get(
      @url + "/projects/" + id,
      headers: {"Authorization": @apikey}
    )

    return JSON.parse(res.body)
  end

  def pipelines(project_id, limit = 10)
    res = Typhoeus::Request.get(
      "#{@url}/pipelines?limit=#{limit}&projectId=#{project_id}",
      headers: {"Authorization": @apikey}
    )

    return JSON.parse(res.body)
  end

  def pipeline(pipeline_id, limit = 100)
    res = Typhoeus::Request.get(
      "#{@url}/pipelines/#{pipeline_id}?includeStatistic=false",
      headers: {"Authorization": @apikey}
    )

    builds = Typhoeus::Request.get(
      "#{@url}/workflow?pipeline=#{pipeline_id}&limit=#{limit}",
      headers: {"Authorization": @apikey}
    )

    return [JSON.parse(res.body), JSON.parse(builds.body)]
  end
end