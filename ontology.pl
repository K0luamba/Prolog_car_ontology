% ����������� �������=��������
sub_class(audi, volkswagen_group).
sub_class(bentley, volkswagen_group).
sub_class(lamborghini, volkswagen_group).
sub_class(porshe, volkswagen_group).
sub_class(skoda, volkswagen_group).
sub_class(maybach, daimler).
sub_class(mercedes-benz, daimler).
sub_class(smart, daimler).
sub_class(renault, renault_group).
sub_class(lada, renault_group).
sub_class(nissan, renault_group).
sub_class(mitsubishi, renault_group).
sub_class(mini, bmw_group).
sub_class(bmw, bmw_group).
sub_class(rolls-royce, bmw_group).
% ����������� ����������� �������=�������
instance_of(r8, audi).
instance_of(a8, audi).
instance_of(q5, audi).
instance_of(continental, bentley).
instance_of(bentayga, bentley).
instance_of(huracan, lamborghini).
instance_of(aventador, lamborghini).
instance_of(911, porshe).
instance_of(cayenne, porshe).
instance_of(panamera, porshe).
instance_of(fabia, skoda).
instance_of(yeti, skoda).
instance_of(maybach_57, maybach).
instance_of(maybach_62, maybach).
instance_of(gelenvagen, mercedes-benz).
instance_of(cla, mercedes-benz).
instance_of(fortwo, smart).
instance_of(smart_roadster, smart).
instance_of(logan, renault).
instance_of(fluence, renault).
instance_of(latitude, renault).
instance_of(xray, lada).
instance_of(vesta, lada).
instance_of(x-trail, nissan).
instance_of(kicks, nissan).
instance_of(pathfinder, nissan).
instance_of(outlander, mitsubishi).
instance_of(lancer, mitsubishi).
instance_of(pajero, mitsubishi).
instance_of(clubman, mini).
instance_of(mini_roadster, mini).
instance_of(paceman, mini).
instance_of(i8, bmw).
instance_of(x5, bmw).
instance_of(ghost, rolls-royce).
instance_of(wraith, rolls-royce).
% ���� �������, ��� ��������� ����� ��������
% �������������� ������ ������ �������� ������
instance_of(Car, BigClass) :- instance_of(Car, Class), sub_class(Class, BigClass).

% ������� �� ���� "����������"
% ������� ������������ - �������� �� ���������
sports_car(r8).
sports_car(lancer).
sports_car(i8).
sports_car(Car) :- instance_of(Car, lamborghini), !.
sports_car(Car) :- instance_of(Car, porshe), !.

% ������� �� ���� "������ ����"
% ������� ������������ - �������� �� ���������
executive_class(a8).
executive_class(panamera).
executive_class(cla).
executive_class(i8).
executive_class(Car) :- instance_of(Car, bentley), !.
executive_class(Car) :- instance_of(Car, maybach), !.
executive_class(Car) :- instance_of(Car, rolls-royce), !.

% ������� �� ������ ��������
% ������� ������������ - �������� �� ���������
family_car(q5).
family_car(xray).
family_car(outlander).
family_car(pajero).
family_car(clubman).
family_car(x5).
family_car(Car) :- instance_of(Car, skoda), !.
family_car(Car) :- instance_of(Car, nissan), !.

% 2-������� ����������
% ������� ������������ - �� ��������
two_seats(r8).
two_seats(mini_roadster).
two_seats(i8).
two_seats(lamborghini).
two_seats(smart).
two_seats(Car) :- instance_of(Car, Class), two_seats(Class).

% 4-������� ����������
% ������� ������������ - �� ��������
four_seats(continental).
four_seats(911).
four_seats(panamera).
four_seats(paceman).
four_seats(maybach).
four_seats(rolls-royce).
four_seats(Car) :- instance_of(Car, Class), four_seats(Class).


% 5-������� ����������
% ������� ������������ - �� ��������
five_seats(a8).
five_seats(q5).
five_seats(bentayga).
five_seats(cayenne).
five_seats(clubman).
five_seats(x5).
five_seats(skoda).
five_seats(mercedes-benz).
five_seats(renault).
five_seats(lada).
five_seats(nissan).
five_seats(lada).
five_seats(mitsubishi).
five_seats(Car) :- instance_of(Car, Class), five_seats(Class).

% ��� ������ ������
% ������� ������������ - �� ��������
body_type(r8, coupe).
body_type(a8, sedan).
body_type(q5, crossover).
body_type(continental, coupe).
body_type(bentayga, crossover).
body_type(911, coupe).
body_type(cayenne, crossover).
body_type(panamera, hatchback).
body_type(fabia, station_wagon).
body_type(yeti, crossover).
body_type(maybach_57, sedan).
body_type(maybach_62, limousine).
body_type(gelenvagen, suv).
body_type(cla, sedan).
body_type(fortwo, coupe).
body_type(smart_roadster, roadster).
body_type(xray, crossover).
body_type(vesta, sedan).
body_type(x-trail, crossover).
body_type(kicks, crossover).
body_type(pathfinder, suv).
body_type(outlander, crossover).
body_type(lancer, sedan).
body_type(pajero, suv).
body_type(clubman, station_wagon).
body_type(mini_roadster, roadster).
body_type(paceman, coupe).
body_type(i8, coupe).
body_type(x5, suv).
body_type(ghost, sedan).
body_type(wraith, coupe).
body_type(lamborghini, coupe).
body_type(renault, sedan).
body_type(Car, Type) :- instance_of(Car, Class), body_type(Class, Type).

% ����� ������ � ����
% ����������� � ����������� �� ���� ������ (��� ������������)
number_of_doors(Car, 2) :- body_type(Car, coupe), !.
number_of_doors(Car, 2) :- body_type(Car, roadster), !.
number_of_doors(Car, 4) :- body_type(Car, sedan), !.
number_of_doors(Car, 4) :- body_type(Car, limousine), !. % �������� ��������, ���������� ������ ��������
number_of_doors(Car, 5) :- body_type(Car, suv), !.
number_of_doors(Car, 5) :- body_type(Car, crossover), !.
number_of_doors(Car, 5) :- body_type(Car, hatchback), !.
number_of_doors(Car, 5) :- body_type(Car, station_wagon), !.

% �������� ���������� (�.�.)
% ��� ������������
engine_power(r8, 540).
engine_power(a8, 340).
engine_power(q5, 249).
engine_power(continental, 507).
engine_power(bentayga, 550).
engine_power(huracan, 610).
engine_power(aventador, 700).
engine_power(911, 540).
engine_power(cayenne, 340).
engine_power(panamera, 330).
engine_power(fabia, 105).
engine_power(yeti, 110).
engine_power(maybach_57, 550).
engine_power(maybach_62, 550).
engine_power(gelenvagen, 422).
engine_power(cla, 150).
engine_power(fortwo, 71).
engine_power(smart_roadster, 82).
engine_power(logan, 113).
engine_power(fluence, 139).
engine_power(xray, 106).
engine_power(vesta, 106).
engine_power(x-trail, 144).
engine_power(kicks, 114).
engine_power(pathfinder, 230).
engine_power(outlander, 146).
engine_power(lancer, 150).
engine_power(pajero, 178).
engine_power(clubman, 122).
engine_power(mini_roadster, 122).
engine_power(paceman, 122).
engine_power(i8, 231).
engine_power(x5, 381).
engine_power(ghost, 563).
engine_power(wraith, 624).

% ������ ������������
% ������������ - �� �������� (���� �� ������ �� ��� ����� ������)
country_of_origin(audi, germany) :- !.
country_of_origin(bentley, great_britain) :- !.
country_of_origin(lamborghini, italia) :- !.
country_of_origin(porshe, germany) :- !.
country_of_origin(skoda, czech_republic) :- !.
country_of_origin(renault, france) :- !.
country_of_origin(lada, russia) :- !.
country_of_origin(nissan, japan) :- !.
country_of_origin(mitsubishi, japan) :- !.
country_of_origin(mini, great_britain) :- !.
country_of_origin(bmw, germany) :- !.
country_of_origin(rolls-royce, great_britain) :- !.
country_of_origin(daimler, germany) :- !.
country_of_origin(Class, C) :- sub_class(Class, BigClass), country_of_origin(BigClass, C), !.
country_of_origin(Car, C) :- instance_of(Car, Class), country_of_origin(Class, C), !.










