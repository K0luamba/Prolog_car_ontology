list_min([L|Ls], Min) :- list_min(Ls, L, Min).

list_min([], Min, Min).
list_min([L|Ls], Min0, Min) :- Min1 is min(L, Min0), list_min(Ls, Min1, Min).

% определение классов=компаний
sub_class(audi, volkswagen_group).
sub_class(bentley, volkswagen_group).
sub_class(lamborghini, volkswagen_group).
sub_class(porsche, volkswagen_group).
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
instance_of(r8, audi) :- !.
instance_of(a8, audi) :- !.
instance_of(q5, audi) :- !.
instance_of(continental, bentley) :- !.
instance_of(bentayga, bentley) :- !.
instance_of(huracan, lamborghini) :- !.
instance_of(aventador, lamborghini) :- !.
instance_of(911, porsche) :- !.
instance_of(cayenne, porsche) :- !.
instance_of(panamera, porsche) :- !.
instance_of(fabia, skoda) :- !.
instance_of(yeti, skoda) :- !.
instance_of(maybach_57, maybach) :- !.
instance_of(maybach_62, maybach) :- !.
instance_of(gelenvagen, mercedes-benz) :- !.
instance_of(cla, mercedes-benz) :- !.
instance_of(fortwo, smart) :- !.
instance_of(smart_roadster, smart) :- !.
instance_of(logan, renault) :- !.
instance_of(fluence, renault) :- !.
instance_of(latitude, renault) :- !.
instance_of(xray, lada) :- !.
instance_of(vesta, lada) :- !.
instance_of(x-trail, nissan) :- !.
instance_of(kicks, nissan) :- !.
instance_of(pathfinder, nissan) :- !.
instance_of(outlander, mitsubishi) :- !.
instance_of(lancer, mitsubishi) :- !.
instance_of(pajero, mitsubishi) :- !.
instance_of(clubman, mini) :- !.
instance_of(mini_roadster, mini) :- !.
instance_of(paceman, mini) :- !.
instance_of(i8, bmw) :- !.
instance_of(x5, bmw) :- !.
instance_of(ghost, rolls-royce) :- !.
instance_of(wraith, rolls-royce) :- !.
% избегаем лишней рекурсии
instance_of(Company, _) :- sub_class(Company, _), !, fail.
instance_of(Concern, _) :- sub_class(_, Concern), !, fail.
% если считаем, что экземпляр можно называть
% представителем класса самого верхнего уровня
instance_of(Car, BigClass) :- instance_of(Car, Class), sub_class(Class, BigClass).

% считать ли авто "спорткаром"
% принцип наследования - значение по умолчанию
sports_car(r8).
sports_car(lancer).
sports_car(i8).
sports_car(Car) :- instance_of(Car, lamborghini), !.
sports_car(Car) :- instance_of(Car, porsche), !.

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
body_type(_, unknown).

% число дверей в авто
% вычисляется в зависимости от типа кузова (нет наследования)
number_of_doors(Car, 2) :- body_type(Car, coupe), !.
number_of_doors(Car, 2) :- body_type(Car, roadster), !.
number_of_doors(Car, 4) :- body_type(Car, sedan), !.
number_of_doors(Car, 4) :- body_type(Car, limousine), !. % возможны варианты, исключения писать отдельно
number_of_doors(Car, 5) :- body_type(Car, suv), !.
number_of_doors(Car, 5) :- body_type(Car, crossover), !.
number_of_doors(Car, 5) :- body_type(Car, hatchback), !.
number_of_doors(Car, 5) :- body_type(Car, station_wagon), !.
number_of_doors(_, unknown).

% мощность автомобиля (л.с.)
% нет наследования
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
engine_power(_, unknown).

% страна происхождения
% наследование - от родителя (явно не указан ни для одной модели)
country_of_origin(audi, germany) :- !.
country_of_origin(bentley, great_britain) :- !.
country_of_origin(lamborghini, italia) :- !.
country_of_origin(porsche, germany) :- !.
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
country_of_origin(_, unknown).

% когда положено начало: для авто - впервые представлен/старт продаж
% для компании - создание фирмы
% для концерна вычисляем, как год создания самой старой компании в нем
year_of_beginning(r8, 2006).
year_of_beginning(a8, 1994).
year_of_beginning(q5, 2008).
year_of_beginning(continental, 2002).
year_of_beginning(bentayga, 2015).
year_of_beginning(huracan, 2014).
year_of_beginning(aventador, 2011).
year_of_beginning(911, 1963).
year_of_beginning(cayenne, 2002).
year_of_beginning(panamera, 2009).
year_of_beginning(fabia, 1999).
year_of_beginning(yeti, 2009).
year_of_beginning(maybach_57, 2002).
year_of_beginning(maybach_62, 2002).
year_of_beginning(gelenvagen, 1979).
year_of_beginning(cla, 2013).
year_of_beginning(fortwo, 1998).
year_of_beginning(smart_roadster, 2002).
year_of_beginning(logan, 2004).
year_of_beginning(fluence, 2009).
year_of_beginning(latitude, 2010).
year_of_beginning(xray, 2015).
year_of_beginning(vesta, 2015).
year_of_beginning(x-trail, 2001).
year_of_beginning(kicks, 2016).
year_of_beginning(pathfinder, 1985).
year_of_beginning(outlander, 2001).
year_of_beginning(lancer, 1973).
year_of_beginning(pajero, 1981).
year_of_beginning(clubman, 2007).
year_of_beginning(mini_roadster, 2011).
year_of_beginning(paceman, 2012).
year_of_beginning(i8, 2013).
year_of_beginning(x5, 1999).
year_of_beginning(ghost, 2009).
year_of_beginning(wraith, 2013).
year_of_beginning(audi, 1909).
year_of_beginning(bentley, 1919).
year_of_beginning(lamborghini, 1963).
year_of_beginning(porsche, 1931).
year_of_beginning(skoda, 1895).
year_of_beginning(maybach, 1909).
year_of_beginning(mercedes-benz, 1926).
year_of_beginning(smart, 1994).
year_of_beginning(renault, 1898).
year_of_beginning(lada, 1966).
year_of_beginning(nissan, 1933).
year_of_beginning(mitsubishi, 1870).
year_of_beginning(mini, 1958).
year_of_beginning(bmw, 1916).
year_of_beginning(rolls-royce, 1904).
year_of_beginning(BigClass, X) :- findall(Class, sub_class(Class, BigClass), Classes),
    maplist(year_of_beginning, Classes, Y), list_min(Y, X), !.
year_of_beginning(_, unknown).

not_unknown(unknown) :- !, fail.
not_unknown(_) :- !.

% "русификация" вывода программы
show_bool(Bool) :- Bool, write("да"), !.
show_bool(_) :- write("нет").

% решает проблемы отличимости типа:
% "dif(family_car(yeti),family_car(fabia))"
dif_bool(Bool1, Bool2) :- Bool1, Bool2, !, fail.
dif_bool(Bool1, _) :- Bool1, !.
dif_bool(_, Bool2) :- Bool2, !.
dif_bool(_, _) :- !, fail.

show_body_type(sedan) :- write("седан"), !.
show_body_type(station_wagon) :- write("универсал"), !.
show_body_type(coupe) :- write("купе"), !.
show_body_type(crossover) :- write("кроссовер"), !.
show_body_type(suv) :- write("внедорожник"), !.
show_body_type(hatchback) :- write("хэтчбек"), !.
show_body_type(roadster) :- write("родстер"), !.
show_body_type(limousine) :- write("лимузин"), !.
show_body_type(_) :- write("неизвестный тип [ERROR]"), !.

show_country(germany) :- write("Германия"), !.
show_country(great_britain) :- write("Великобритания"), !.
show_country(italia) :- write("Италия"), !.
show_country(czech_republic) :- write("Чехия"), !.
show_country(france) :- write("Франция"), !.
show_country(germany) :- write("Германия"), !.
show_country(russia) :- write("Россия"), !.
show_country(japan) :- write("Япония"), !.
show_country(germany) :- write("Германия"), !.

% создаем "пользовательский" вывод предикатов - выводит строку
% в конце всегда вернет успех
get_attribute("спорткар", C) :- write("спорткар: "), show_bool(sports_car(C)).
get_attribute("представительский класс", C) :- write("представительский класс: "), show_bool(executive_class(C)).
get_attribute("семейное авто", C) :- write("семейное авто: "), show_bool(family_car(C)).
get_attribute("двухместное авто", C) :- write("двухместное авто: "), show_bool(two_seats(C)).
get_attribute("четырехместное авто", C) :- write("четырехместное авто: "), show_bool(four_seats(C)).
get_attribute("пятиместное авто", C) :- write("пятиместное авто: "), show_bool(five_seats(C)).
get_attribute("тип кузова", C) :- body_type(C, Type), not_unknown(Type), write("тип кузова: "), show_body_type(Type), !.
get_attribute("тип кузова", C) :- body_type(C, unknown), write("тип кузова: не определен").
get_attribute("число дверей", C) :- number_of_doors(C, N), not_unknown(N), write("число дверей: "), write(N), !.
get_attribute("число дверей", C) :- number_of_doors(C, unknown), write("число дверей: не определено").
get_attribute("мощность двигателя", C) :- engine_power(C, N), not_unknown(N), write("мощность двигателя: "), write(N), write(" л.c."), !.
get_attribute("мощность двигателя", C) :- engine_power(C, unknown), write("мощность двигателя: не определена").
get_attribute("страна происхождения", C) :- country_of_origin(C, X), not_unknown(X), write("страна происхождения: "), show_country(X), !.
get_attribute("страна происхождения", C) :- country_of_origin(C, unknown), write("страна происхождения: не определена").
get_attribute("год начала", C) :- year_of_beginning(C, N), write("год начала: "), not_unknown(N), write(N), write(" г."), !.
get_attribute("год начала", C) :- year_of_beginning(C, unknown), write("год начала: не определен").
get_attribute(_, _) :- write("Нет такого атрибута (возможно, Вы задали атрибут без кавычек).").

get_attributes(C) :- get_attribute("спорткар", C), nl, get_attribute("представительский класс", C), nl,
    get_attribute("семейное авто", C), nl, get_attribute("двухместное авто", C), nl,
    get_attribute("четырехместное авто", C), nl, get_attribute("пятиместное авто", C), nl,
    get_attribute("тип кузова", C), nl, get_attribute("число дверей", C), nl,
    get_attribute("мощность двигателя", C), nl, get_attribute("страна происхождения", C), nl,
    get_attribute("год начала", C), !.

show_if_different(V1, V2, Attr, C1, C2) :- dif(V1, V2), get_attribute(Attr, C1), write(", "), get_attribute(Attr, C2), nl, !.
show_if_different(_, _, _, _, _) :- !.

% аналогичный, но решает проблему подачи аргумента вида "attr(obj)"
show_if_different2(V1, V2, Attr, C1, C2) :- dif_bool(V1, V2), get_attribute(Attr, C1), write(", "), get_attribute(Attr, C2), nl, !.
show_if_different2(_, _, _, _, _) :- !.

show_diff_attr(C1, C2) :-
    show_if_different2(sports_car(C1), sports_car(C2), "спорткар", C1, C2),
    show_if_different2(executive_class(C1), executive_class(C2), "представительский класс", C1, C2),
    show_if_different2(family_car(C1), family_car(C2), "семейное авто", C1, C2),
    show_if_different2(two_seats(C1), two_seats(C2), "двухместное авто", C1, C2),
    show_if_different2(four_seats(C1), four_seats(C2), "четырехместное авто", C1, C2),
    show_if_different2(five_seats(C1), five_seats(C2), "пятиместное авто", C1, C2),
    body_type(C1, V1), body_type(C2, V2), show_if_different(V1, V2, "тип кузова", C1, C2),
    number_of_doors(C1, V3), number_of_doors(C2, V4), show_if_different(V3, V4, "число дверей", C1, C2),
    engine_power(C1, V5), engine_power(C2, V6), show_if_different(V5, V6, "мощность двигателя", C1, C2),
    country_of_origin(C1, V7), country_of_origin(C2, V8), show_if_different(V7, V8, "страна происхождения", C1, C2),
    year_of_beginning(C1, V9), year_of_beginning(C2, V10), show_if_different(V9, V10, "год начала", C1, C2), !.

% реализация формата пользовательского ввода
start :- write("Выберите действие из следующих: \"Вывод атрибута\", \"Вывод всех атрибутов\", \"Вывод отличий\""), nl, read(X), process_action(X).

process_action("Вывод атрибута") :- write("Для какого объекта вывести атрибут?"), nl, read(C),
    write("Какой атрибут вывести? (\"спорткар\",\"представительский класс\",\"семейное авто\",\"двухместное авто\",\"четырехместное авто\",\"пятиместное авто\",\"тип кузова\",\"число дверей\",\"мощность двигателя\",\"страна происхождения\",\"год начала\")"), nl, read(A), get_attribute(A, C).

process_action("Вывод всех атрибутов") :- write("Для какого объекта вывести атрибуты?"), nl, read(C), get_attributes(C).

process_action("Вывод отличий") :- write("Какой первый объект хотите сравнить?"), nl, read(C1), write("С каким объектои хотите сравнить?"), nl, read(C2), show_diff_attr(C1, C2).

process_action("Отмена") :- !.

process_action(_) :- write("Нет такого действия (возможно, Вы ввели действие без кавычек)."), nl,
    write("Введите действие еще раз или введите \"Отмена\":"), nl, read(S), process_action(S).
