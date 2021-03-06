function [V]=Abs1R3(A,B,c,OrientPoints,transparency,varargin)
%
% Функция Abs1R3 рисует множество решений 
% для системы неравенств  Ax+B|x| >= c.
%
% Обязательные входные аргументы:
%   A,B - вещественные матрицы, у которых m строк и 3 столбца;
%   c - вещественный вектор длины m;
%   OrientPoints - параметр для рисования точек-ориентиров, 
%     его значения: 0 - не рисуем, 1 - рисуем;
%   transparency - параметр прозрачности реальных граней, 
%     его значения: 0 - непрозрачные, 1 - прозрачные.
%
% Дополнительные входные аргументы:
%   varargin - брус принудительной обрезки, 
%     вводится как 6 чисел  xb,xe,yb,ye,zb,ze, где 
%     xb,yb,zb - нижний конец, а  xe,ye,ze - верхний конец бруса.
%
% Выходные аргументы: 
%   V - список точек-ориентиров 
%     (вершин пересечений множества решений с ортантами).
%
% автор: Шарая Ирина Александровна (Институт вычислительных технологий, Новосибирск)
% дата:  13/12/2013

   % перейдем к интервальному включению [uC,oC] x \subseteq [ud,od]
   % в арифметике Каухера
   uC=A+B;
   oC=A-B;
   ud=c;
   m=size(A,1);
   od=ones(m,1)*Inf;

   % нарисуем множество решений включения [uC,oC] x \subseteq [ud,od]
   var=(length(varargin)==6);
   if var % если пользователь задал брус как дополнительный аргумент, 
      [V]=CxindR3(uC,oC,ud,od,OrientPoints,transparency,varargin{1},varargin{2},varargin{3},varargin{4},varargin{5},varargin{6});
   else
      [V]=CxindR3(uC,oC,ud,od,OrientPoints,transparency);
   end

end
