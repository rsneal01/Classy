class Teacher < ApplicationRecord
    has_many :students, through: :enrolled_courses
    has_many :enrolled_courses
    has_many :courses
    has_secure_password
    validates :name, presence: true
    validates :password, presence: true
    validates :bio, length: { minimum: 5 }

    def self.find_or_create_from_auth(auth)
        teacher = Teacher.find_or_create_by(provider: auth['provider'], uid: auth['uid'])
        teacher.name = auth['info']['name']
        teacher.save
        teacher
    end
end
