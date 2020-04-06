# Be sure to restart your server when you modify this file.
#
# +grant_on+ accepts:
# * Nothing (always grants)
# * A block which evaluates to boolean (recieves the object as parameter)
# * A block with a hash composed of methods to run on the target object with
#   expected values (+votes: 5+ for instance).
#
# +grant_on+ can have a +:to+ method name, which called over the target object
# should retrieve the object to badge (could be +:user+, +:self+, +:follower+,
# etc). If it's not defined merit will apply the badge to the user who
# triggered the action (:action_user by default). If it's :itself, it badges
# the created object (new user for instance).
#
# The :temporary option indicates that if the condition doesn't hold but the
# badge is granted, then it's removed. It's false by default (badges are kept
# forever).

module Merit
  class BadgeRules
    include Merit::BadgeRulesMethods

    def initialize
      grant_on ['products#create','products#update','products#delete'],  badge: 'thrifter101', temporary: true, to: :user do |product|
        product.user.second_hand_percentage < 0.5
      end

      grant_on ['products#create','products#update','products#delete'],  badge: 'thrifter102', temporary: true, to: :user do |product|
        product.user.second_hand_percentage >= 0.5 && product.user.second_hand_percentage < 0.8
      end

      grant_on ['products#create','products#update','products#delete'],  badge: 'thrifter103', temporary: true, to: :user do |product|
        product.user.second_hand_percentage >= 0.8
      end

       grant_on ['proportions#create','proportions#destroy'],  badge: 'eco101', temporary: true, to: :owner do |proportion|
        proportion.product.user.organic_recycled_materials < 0.3
      end

      grant_on ['proportions#create','proportions#destroy'],  badge: 'eco102', temporary: true, to: :owner do |proportion|
        proportion.product.user.organic_recycled_materials >= 0.3 && proportion.product.user.organic_recycled_materials < 0.5
      end

      grant_on ['proportions#create','proportions#destroy'],  badge: 'eco103', temporary: true, to: :owner do |proportion|
        proportion.product.user.organic_recycled_materials >= 0.5
      end

      grant_on ['products#update'],  badge: 'recycler101', temporary: true, to: :user do |product|
        product.user.recycler < 1
      end

      grant_on ['products#update'],  badge: 'recycler102', temporary: true, to: :user do |product|
        product.user.recycler >= 1 && product.user.recycler < 4
      end

      grant_on ['products#update'],  badge: 'recycler103', temporary: true, to: :user do |product|
        product.user.recycler >= 4
      end
    end
  end
end
