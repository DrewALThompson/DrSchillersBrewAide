module Slugify
    module InstanceMethods
        def userslug
            username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end

        def recipeslug
            name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            self.all.find{ |name| name.slug == slug }
        end

    end
end