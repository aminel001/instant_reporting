class ImpersonationPolicy < Struct.new(:user, :record)
  def create?
    user&.admin?
  end
end
