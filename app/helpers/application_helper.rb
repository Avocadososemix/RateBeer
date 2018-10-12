module ApplicationHelper
  def edit_and_destroy_buttons(item)
    if current_user.admin?
      edit = link_to('Edit', url_for([:edit, item]), class: "btn btn-info")
      del = link_to('Destroy', item, method: :delete,
                                     data: { confirm: 'Are you sure?' },
                                     class: "btn btn-danger")
      raw("#{edit} #{del}")
    else unless current_user.nil?
        edit = link_to('Edit', url_for([:edit, item]), class: "btn btn-info")
        raw("#{edit}")
      end
    end
  end
end