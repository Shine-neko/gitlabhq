# Shorter routing method for project and project items
# Since update to rails 4.1.9 we are now allowed to use `/` in project routing
# so we use nested routing for project resources which include project and
# project namespace. To avoid writing long methods every time we define shortcuts for
# some of routing.
#
# For example instead of this:
#
#   namespace_project_merge_request_path(merge_request.project.namespace, merge_request.projects, merge_request)
#
# We can simply use shortcut:
#
#   merge_request_path(merge_request)
#
module GitlabRoutingHelper
  def project_path(project, *args)
    namespace_project_path(project.namespace, project, *args)
  end

  def edit_project_path(project, *args)
    edit_namespace_project_path(project.namespace, project, *args)
  end

  def issue_path(entity, *args)
    namespace_project_issue_path(entity.project.namespace, entity.project, entity, *args)
  end

  def merge_request_path(entity, *args)
    namespace_project_merge_request_path(entity.project.namespace, entity.project, entity, *args)
  end
end
