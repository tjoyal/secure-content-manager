class HomeController < ApplicationController

  def show

    respond_to do |format|
      format.html
      format.json do
        render :json => get_tree
      end
    end

  end

  def profile

  end

  private

  def get_tree(parent = nil)

    entries = []

    if parent
      scope = parent.children
    else
      scope = Group.root
    end

    children = scope.accessible_by(current_ability)

    entries += children.sort_by(&:name).map do |group|
      {
          :attr => {
              :id => "group_#{group.id}",
              :rel => 'group'
          },
          :data => {
              :title => group.name,
              :attr => {
                  :href => "#"
              }
          },
          :children => get_tree(group)
      }
    end

    if parent
      servers = parent.servers.accessible_by(current_ability)

      entries += servers.sort_by(&:name).map do |server|

        {
            :attr => {
                :id => "server_#{server.id}",
                :rel => 'server'
            },
            :data => {
                :title => server.name,
                :attr => {
                    :href => group_server_path(parent, server)
                }
            }
        }

      end

      if can?(:create, parent.servers.new)
        entries << {
            :attr => {
                :id => "group_#{parent.id}_server_new",
                :rel => 'server'
            },
            :data => {
                :title => '+ new',
                :attr => {
                    :href => new_group_server_path(parent)
                }
            }
        }
      end

    end

    entries

  end

end
