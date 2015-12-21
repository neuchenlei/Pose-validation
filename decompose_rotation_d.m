function [x,y,z] = decompose_rotation_d(R)
	x = (atan2(R(3,2), R(3,3))/pi)*180;
	y = (atan2(-R(3,1), sqrt(R(3,2)*R(3,2) + R(3,3)*R(3,3)))/pi)*180;
	z = (atan2(R(2,1), R(1,1))/pi)*180;
end