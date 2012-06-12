# geo location for Place model, gps field 
# center에서부터 반경 r 만큼 거리 안에 있는 place들 반환
# in model Place.rb
# field :gps, type:Array
# index[[:gps, Mongo::GEO2D]], min: -180, max: 180 
latitude = 37.12112 # center latitude
longitude = 127.23232 # center longitude
R = 6371 # earth radius, km 
PI = 3.141592 # pi
r = 2 # distance radius, km
r_to_radian = (r / R) * (PI / 180) 
Place.where(:gps => {"$within" => {"$center" => [[latitude, longitude], r_to_radian} })
