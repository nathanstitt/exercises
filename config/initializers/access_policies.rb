require_relative 'doorkeeper'

# User
OSU::AccessPolicy.register(User, UserAccessPolicy)
OSU::AccessPolicy.register(Deputization, DeputizationAccessPolicy)

# API
OSU::AccessPolicy.register(Exercise, ExerciseAccessPolicy)
OSU::AccessPolicy.register(List, ListAccessPolicy)
OSU::AccessPolicy.register(ListExercise, ListExerciseAccessPolicy)
OSU::AccessPolicy.register(Publication, PublicationAccessPolicy)
OSU::AccessPolicy.register(Solution, SolutionAccessPolicy)

# Doorkeeper
OSU::AccessPolicy.register(Doorkeeper::Application,
                           Doorkeeper::ApplicationAccessPolicy)
