#-- copyright

# OpenProject is an open source project management software.
# Copyright (C) 2012-2023 the OpenProject GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See COPYRIGHT and LICENSE files for more details.
module DemoData
  class GroupSeeder < Seeder
    include ::DemoData::References

    attr_reader :seed_data

    def initialize(seed_data)
      super()
      @seed_data = seed_data
    end

    def seed_data!
      print_status '    ↳ Creating groups' do
        seed_groups
      end
    end

    def applicable?
      Group.count.zero?
    end

    private

    def seed_groups
      seed_data.each('groups') do |group_data|
        create_group group_data['name']
      end
    end

    def create_group(name)
      Group.create lastname: name
    end
  end
end
