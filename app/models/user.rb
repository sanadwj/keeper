class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :doorkeeper, :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable

  has_many :access_grants, class_name: "Doorkeeper::AccessGrant", foreign_key: :resource_owner_id, dependent: :delete_all # or :destroy if you need callbacks
  has_many :access_tokens, class_name: "Doorkeeper::AccessToken", foreign_key: :resource_owner_id, dependent: :delete_all # or :destroy if you need callbacks

  has_many :notifications, as: :recipient
  has_many :services

  # has_many :access_grants, class_name: "Doorkeeper::AccessGrant",
  #          foreign_key: :resource_owner_id,
  #          dependent: :delete_all
  #
  # has_many :access_tokens, class_name: "Doorkeeper::AccessToken",
  #          foreign_key: :resource_owner_id,
  #          dependent: :delete_all

  # has_many :access_grants,
  #          class_name: 'Doorkeeper::AccessGrant',
  #          foreign_key: :resource_owner,
  #          dependent: :delete_all # or :destroy if you need callbacks
  #
  # has_many :access_tokens,
  #          class_name: 'Doorkeeper::AccessToken',
  #          foreign_key: :resource_owner,
  #          dependent: :delete_all # or :destroy if you need callbacks
end
