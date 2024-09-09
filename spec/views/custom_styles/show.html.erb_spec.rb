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

require "spec_helper"

RSpec.describe "custom_styles/show" do
  let(:user) { build(:admin) }

  before do
    login_as user
    allow(view).to receive(:options_for_select).and_return("")
    render
  end

  context "interface tab" do
    before do
      allow(view).to receive(:options_for_select).and_return("")
      render
    end

    it "doesn't show an upload button" do
      expect(rendered).not_to include "Upload"
    end
    it "doesn't show a replace button" do
      expect(rendered).not_to include "Replace"
    end
    it "shows advanced settings" do
      expect(rendered).to have_text I18n.t(:label_advanced_settings)
    end
  end
end
