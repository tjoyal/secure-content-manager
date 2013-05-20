class HomeController < ApplicationController

  skip_authorization_check

  def show

    respond_to do |format|
      format.html
      format.json do

        tree = Group.all.sort_by(&:name).map do |group|

          children = group.servers.sort_by(&:name).map do |server|

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
