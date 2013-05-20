class HomeController < ApplicationController

  skip_authorization_check

  def show

    respond_to do |format|
      #format.json {
      #
      #  tree = Group.all.map do |group|
      #
      #    children = group.servers.map do |server|
      #      view_context.link_to(server.name, group_server_path(group, server)).html_safe
      #    end
      #
      #    children << view_context.link_to('+ new', new_group_server_path(group))
      #
      #    {
      #        :id => "group_#{group.id}",
      #        :data => view_context.link_to(group.name, '#'),
      #        :state => :leaf,
      #        :children => children,
      #        :state => :open
      #    }
      #
      #  end
      #
      #  render :json => tree.to_json
      #}
      format.html

      format.json do

        tree = Group.all.map do |group|

          children = group.servers.map do |server|

            {
              :attr => {
                :id => "server_#{server.id}",
                :rel => 'server'
              },
              :data => {
                :title => server.name,
                :attr => {
                  :href => group_server_path(group, server)
                }
              }
            }

          end

          children << {
            :attr => {
              :id => "group_#{group.id}_server_new",
              :rel => 'server'
            },
            :data => {
              :title => '+ new',
              :attr => {
                :href => new_group_server_path(group)
              }
            }
          }

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
            :children => children
          }
        end

        render :json => tree

      end
    end

  end

end
