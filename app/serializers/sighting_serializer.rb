class SightingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at #, :bird, :location
  belongs_to :bird
  belongs_to :location
end

# @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])

# attributes :created_at, :bird, :location                          #attributes :created_at
#=>
# {                                                                 #{
#   "id": "2",                                                      #   "id": "2",
#   "type": "sighting",                                             #   "type": "sighting",
#   "attributes": {                                                 #   "attributes": {
#     "created_at": "2019-05-14T16:39:37.011Z",                     #       "created_at": "2019-05-14T16:39:37.011Z",
#     "bird": {                                                     #   }
#       "id": 2,                                                    #}
#       "name": "Grackle",
#       "species": "Quiscalus Quiscula",
#       "created_at": "2019-05-14T16:39:36.917Z",
#       "updated_at": "2019-05-14T16:39:36.917Z"
#     },
#     "location": {
#       "id": 2,
#       "latitude": 30.26715,
#       "longitude": -97.74306,
#       "created_at": "2019-05-14T16:39:36.942Z",
#       "updated_at": "2019-05-14T16:39:36.942Z"
#     }
#   }
# }


# belongs_to :bird
# belongs_to :location
# {
#   "id": "2",
#   "type": "sighting",
#   "attributes": {
#     "created_at": "2019-05-14T16:39:37.011Z"
#   },
#   "relationships": {
#     "bird": {
#       "data": {
#         "id": "2",
#         "type": "bird"
#       }
#     },
#     "location": {
#       "data": {
#         "id": "2",
#         "type": "location"
#       }
#     }
#   }
# }

# relationships neccessary b/c can do this in sightings controller:
