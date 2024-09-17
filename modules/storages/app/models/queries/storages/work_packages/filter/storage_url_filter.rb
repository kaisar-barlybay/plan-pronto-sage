#-- copyright
# OpenProject is an open source project management software.
# Copyright (C) the OpenProject GmbH
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
#++

module Queries::Storages::WorkPackages::Filter
  class StorageUrlFilter < ::Queries::WorkPackages::Filter::WorkPackageFilter
    include StoragesFilterMixin

    def filter_model
      ::Storages::Storage
    end

    def filter_column
      "host"
    end

    def permission
      :view_file_links
    end

    def where_values
      prepare_host_values(values)
    end

    def joins
      [{ file_links: :storage }, { project: :project_storages }]
    end

    def additional_where_condition
      "AND #{::Storages::FileLink.table_name}.storage_id = #{::Storages::ProjectStorage.table_name}.storage_id"
    end
  end
end
