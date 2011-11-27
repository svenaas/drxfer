class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  devise :ldap_authenticatable, :trackable#, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :email, :first_name, :last_name, :admin
  
  before_save :get_ldap_data
  
  default_scope :order => 'admin DESC, last_name ASC, first_name ASC'
  
  def get_ldap_data
    return if Rails.env == 'test'
    self.email      = Devise::LdapAdapter.get_ldap_param(self.username,"mail")[0]
    self.first_name = Devise::LdapAdapter.get_ldap_param(self.username,"givenname")[0]
    self.last_name  = Devise::LdapAdapter.get_ldap_param(self.username,"sn")[0]
  end
end
