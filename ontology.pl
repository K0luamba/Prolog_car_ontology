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
% определение экземпл€ров классов=моделей
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
% принцип наследовани€ - значение по умолчанию
sports_car(r8).
sports_car(lancer).
sports_car(i8).
sports_car(Car) :- instance_of(Car, lamborghini), !.
sports_car(Car) :- instance_of(Car, porshe), !.

