# frozen_string_literal: true

class PolicyFilter
  def self.return_filtered_scope(user, scope)
    # rubocop:disable Style/HashSyntax
    user.admin? ? scope.all : scope.where(user: user)
    # rubocop:enable Style/HashSyntax
  end
end
