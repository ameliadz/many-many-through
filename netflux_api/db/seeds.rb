helen = User.create(name: "Helen")

thor = Movie.create(title: "Thor: Ragnarok")

Subscription.create(tier: 'monthly', user: helen, movie: thor)

# to access: User.joins(:subscriptions).where(subscriptions: {tier: 'monthly'})
