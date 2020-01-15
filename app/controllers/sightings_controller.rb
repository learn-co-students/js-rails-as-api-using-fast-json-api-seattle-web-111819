class SightingsController < ApplicationController

  def index
    sightings = Sighting.all
    options = {}
    options[:include] = [:bird, :location]
    render json: SightingSerializer.new(sightings, options).serializable_hash
  end

  def show
    @sighting = Sighting.find(params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
    # render json: SightingSerializer.new(sighting)
    # render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
  end

end


#   options = {
#     include: [:bird, :location]
#   }
#   render json: SightingSerializer.new(sighting, options)

# results in:

# {
#   "data": {
#     "id": "2",
#     "type": "sighting",
#     "attributes": {
#       "created_at": "2019-05-14T16:39:37.011Z"
#     },
#     "relationships": {
#       "bird": {
#         "data": {
#           "id": "2",
#           "type": "bird"
#         }
#       },
#       "location": {
#         "data": {
#           "id": "2",
#           "type": "location"
#         }
#       }
#     }
#   },
#   "included": [{
#       "id": "2",
#       "type": "bird",
#       "attributes": {
#         "name": "Grackle",
#         "species": "Quiscalus Quiscula"
#       }
#     },
#     {
#       "id": "2",
#       "type": "location",
#       "attributes": {
#         "latitude": 30.26715,
#         "longitude": -97.74306
#       }
#     }
#   ]
# }





