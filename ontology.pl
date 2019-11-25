% определение классов=компаний
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
% определение экземпляров классов=моделей
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

% считать ли авто "спорткаром"
% принцип наследования - значение по умолчанию
sports_car(r8).
sports_car(lancer).
sports_car(i8).
sports_car(Car) :- instance_of(Car, lamborghini), !.
sports_car(Car) :- instance_of(Car, porshe), !.

% считать ли авто "класса люкс"
% принцип наследования - значение по умолчанию
executive_class(a8).
executive_class(panamera).
executive_class(cla).
executive_class(i8).
executive_class(Car) :- instance_of(Car, bentley), !.
executive_class(Car) :- instance_of(Car, maybach), !.
executive_class(Car) :- instance_of(Car, rolls-royce), !.

% считать ли машину семейной
% принцип наследования - значение по умолчанию
family_car(q5).
family_car(xray).
family_car(outlander).
family_car(pajero).
family_car(clubman).
family_car(x5).
family_car(Car) :- instance_of(Car, skoda), !.
family_car(Car) :- instance_of(Car, nissan), !.

% 2-местный автомобиль
% принцип наследования - от родителя
two_seats(r8).
two_seats(mini_roadster).
two_seats(i8).
two_seats(lamborghini).
two_seats(smart).
two_seats(Car) :- instance_of(Car, Class), two_seats(Class).

% 4-местный автомобиль
% принцип наследования - от родителя
four_seats(continental).
four_seats(911).
four_seats(panamera).
four_seats(paceman).
four_seats(maybach).
four_seats(rolls-royce).
four_seats(Car) :- instance_of(Car, Class), four_seats(Class).


% 5-местный автомобиль
% принцип наследования - от родителя
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

% тип кузова машины
% принцип наследования - от родителя
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















