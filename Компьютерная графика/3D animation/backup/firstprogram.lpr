program firstprogram;

{$mode objfpc}{$H+}

uses
  gl, glu, glut, Classes, BMPcomn, Windows;

const
  CubeSize = 1;
var
  // размеры окна
  Width : integer = 640;
  Height : integer = 480;
  // угол поворота
  angle : integer;
  //  rotationaxisx, rotationaxisy, rotationaxisz - ось, вокруг которой поворачивается объект
  //  shiftx, shifty, shiftz - смещение (перенос) объекта по каждой оси
  //  xscale, yscale, zscale - коэффициенты масштабирования по каждой оси
  rotationaxisx, rotationaxisy, rotationaxisz, shiftx, shifty, shiftz, xscale, yscale, zscale : real;
  // используется для анимации, равна -1 когда куб уменьшается и 1 когда увеличивается
  ScaleDirection : integer = 1;


  procedure Init(tmp: Boolean);
  var
     // положение источника света
     light_position: array[0..3] of GLfloat = (1.0, 1.0, 1.0, 0.0);
     // интенсивность фонового освещения по каждому каналу
     lmodel_ambient: array[0..3] of GLfloat = (0.6, 0.6, 0.6, 1.0);


  begin
    // задаём начальные коэффициенты - поворот вокруг оси Х, все коэфф. масштабирования равны 1
    rotationaxisx:=1; xscale:=1; yscale:=1; zscale:=1;

    // цвет очистки
    glClearColor (0.0, 0.0, 0.0, 0.0);

    // установка параметров источника света GL_LIGHT0
    // установка позиции источника света
    glLightfv(GL_LIGHT0, GL_POSITION, light_position);
    // установка интенсивности фонового освещения источника света
    glLightfv(GL_LIGHT0, GL_AMBIENT, lmodel_ambient);

    // включить освещение
    glEnable(GL_LIGHTING);

    // включить источник света с номером 0
    glEnable(GL_LIGHT0);

    // включить проверку на глубину
    glEnable(GL_DEPTH_TEST);

  end;

procedure Display; cdecl;
var
   // параметры материала объекта
   // коэффициент фонового отражения материала поверхности объекта
   mat_ambient: array[0..3] of GLfloat = (0.5, 0.5, 0.5, 1.0);
   // коэффициент диффузного отражения материала поверхности объекта
   mat_diffuse: array[0..3] of GLfloat = (1, 1, 1, 1.0);
   // коэффициент зеркального отражения материала поверхности объекта
   mat_specular: array[0..3] of GLfloat = (0.1, 0.1, 0.1, 1.0);
   // коэффициент распределения зеркального отражения материала
   mat_shininess: array[0..0] of GLfloat = (50.0);
   // коэффициент интенсивности света, излучаемого самим объектом
   no_mat: array[0..3] of GLfloat = (0.1, 0.1, 0.1, 1.0);

begin
// очистка цветового буфера и буфера глубины
   // т.к. включен режим двойной буфферизации, то очищается не отображаемый цветовой буфер
   // в буфере глубины координаты z всех пикселей предыддущей сцены, их надо обнулить и посчитать заново
   glClear (GL_COLOR_BUFFER_BIT OR GL_DEPTH_BUFFER_BIT);

   // установка параметров материала объекта
   // установка коэффициента фонового отражения
   glMaterialfv(GL_FRONT, GL_AMBIENT, mat_ambient);
   // установка коэффициента диффузного отражения
   glMaterialfv(GL_FRONT, GL_DIFFUSE, mat_diffuse);
   // установка коэффициента зеркального отражения
   glMaterialfv(GL_FRONT, GL_SPECULAR, mat_specular);
   // установка коэффициента распределения зеркального отражения
   glMaterialfv(GL_FRONT, GL_SHININESS, mat_shininess);
   // установка коэффициента интенсивности света, излучаемого самим объектом
   glMaterialfv(GL_FRONT, GL_EMISSION, no_mat);

   // сохранение матрицы преобразований до наших манипуляций с объектом
   glPushMatrix();
   // задаём коэффициенты матрицы переноса
   glTranslatef(shiftx,shifty,shiftz);
   // задаём коэффициенты матрицы масштабирования
   glScalef(xscale,yscale,zscale);
   // задаём коэффициенты матрицы поворота
   glRotatef (angle, rotationaxisx, rotationaxisy, rotationaxisz);
   // Нарисовать куб
   glutSolidOctahedron(1.0);
    // восстановление матрицы преобразований до наших манипуляций с объектом
   glPopMatrix();
   // замена текущего отображаемого буфера на тот, в котором мы рисовали всё выше
   glutSwapBuffers();

end;

procedure Reshape(W, H: Integer); cdecl;
begin
  // установка области ыидимости внутри окна приложения
  glViewport (0, 0, w, h);
  // выбор матрицы проекции для выполнения операций над ней
  glMatrixMode (GL_PROJECTION);
  // присвоить текущей матрице проекции единичную матрицу
  glLoadIdentity ();
  // задать коэффициенты перспективной проекции - усеченный конус видимости
  gluPerspective(60.0, w/h, 1.0, 10.0);
  // переключение на модельно-видовую матрицу
  glMatrixMode(GL_MODELVIEW);
  // присвоить текущей модельно-видовой матрице проекции единичную матрицу
  glLoadIdentity();
  // установить параметры камеры наблюдателя (афинные комбинированные преобразования)
  // наблюдатель (камера) в точке x=0, y=0, z=5
  // центр сцены в точке x=0, y=0, z=0
  // верхний вектор (куда направлен верх камеры) x=0, y=1, z=0
  gluLookAt (0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);
end;


procedure Animate(value: Integer); cdecl;
begin
     // увеличиваем угол поворота на 10 градусов и находим остаток от деления этого значения угла на число 360
     angle := (angle + 10) mod 360;
     // если объект выполнил поворот на 360 градусов, т.е. отаток от деления ug на 360 равен 0 то
     // меняем знак d - знак приращения к коэффициентам масштабирования
     if (angle=0) then ScaleDirection:=ScaleDirection*(-1);
     // постепенно увеличиваем (или ументшаем в зависмости от знака d) коэффициенты масштабирования
     xscale := xscale + 0.05*ScaleDirection;
     yscale := yscale + 0.05*ScaleDirection;
     zscale := zscale + 0.05*ScaleDirection;
     // процедура сообщает текущему окну о необходимости перерисовки (вызове процедуры display)
     glutPostRedisplay();
     // вызов функции Animate каждые 40 мс, в функцию передается параметр 0
     glutTimerFunc(40, @Animate, 0);
end;

procedure Keyboard(Key: Byte; X, Y: Longint); cdecl;

begin
  // выбор кода клавиши, которую нажал пользователь
  // коды клавиш языка С можно посмотреть, например, тут http://www.expandinghead.net/keycode.html
  case Key of
    // выбор оси вокруг которой выполняется поворот
    88,120: begin
        angle := 0; rotationaxisx := 1; rotationaxisy := 0; rotationaxisz := 0;
        end;
    89,121: begin
        angle := 0; rotationaxisx := 0; rotationaxisy := 1; rotationaxisz := 0;
        end;
    90,122: begin
        angle := 0; rotationaxisx := 0; rotationaxisy := 0; rotationaxisz := 1;
        end;
    // поворота
    97: begin
        angle := (angle + 10) mod 360;
        glutPostRedisplay();
        end;
    65: begin
        angle := (angle - 10) mod 360;
        glutPostRedisplay();
        end;
    // перемещение по оси X
    115: begin
        shiftx := shiftx + 0.1;
        glutPostRedisplay();
        end;
    83: begin
        shiftx := shiftx - 0.1;
        glutPostRedisplay();
        end;
    // перемещение по оси Y
    100: begin
        shifty := shifty + 0.1;
        glutPostRedisplay();
        end;
    68: begin
        shifty := shifty - 0.1;
        glutPostRedisplay();
        end;
    // перемещение по оси Z
    102: begin
        shiftz := shiftz + 0.1;
        glutPostRedisplay();
        end;
    70: begin
        shiftz := shiftz - 0.1;
        glutPostRedisplay();
        end;
    // масштабирование
    103: begin
        xscale := xscale + 0.1;
       	yscale := yscale + 0.1;
       	zscale := zscale + 0.1;
        glutPostRedisplay();
        end;
    71: begin
        xscale := xscale - 0.1;
       	yscale := yscale - 0.1;
       	zscale := zscale - 0.1;
        glutPostRedisplay();
        end;
    // анимация комбинированного преобразования
    76: begin
        angle := 0; rotationaxisx := 1; rotationaxisy := 1; rotationaxisz := 0;
        glutTimerFunc(40, @Animate, 0);
        end;
    // выход
    27: Halt(0);
  end;
end;

procedure glutInitPascal(ParseCmdLine: Boolean);
var
  // массив указателей на параметры командной строки
  ArgArray: array of PChar;
  // ArgCount - число параметров командной строки, которое будет передано в процедуру glutInit
  ArgCount, I: Integer;
begin
  // функция ParamCount() возвращает число параметров командной строки
  // в Delphi нумерация параметров с 0, поэтому увеличиваем число параметров на 1
  ArgCount := ParamCount() + 1;
  // выделяем для каждого параметра указатель (адрес на этот параметр)
  SetLength(ArgArray, ArgCount);
  // для каждого параметра получаем адрес функцией PChar() и записываем его в массив ArgArray
  for I := 0 to ArgCount - 1 do ArgArray[I] := PChar(ParamStr(I));
  // вызываем glutInit, передаём в неё число параметров командной строки и указатель на массив с указателми на параметры
  glutInit(@ArgCount, @ArgArray);
end;


begin
  glutInitPascal(True);
  // установка режима отображения окна
  // двойная буферизация, цвет в формате RGB, использовать буфер глубины
  glutInitDisplayMode(GLUT_DOUBLE OR GLUT_RGB OR GLUT_DEPTH);
  // установить размер окна приложения
  glutInitWindowSize(Width, Height);
  // создать окно с именем Lab12
  glutCreateWindow('Lab12');

  // выполнить начальную инициализацию
  Init(true);

  // указать основные функции OpenGL
  // функция вывода изображения - Display
  glutDisplayFunc(@Display);
  // функция, вызываемая при изменении размера окна - Reshape
  glutReshapeFunc(@Reshape);
  // функция, вызываемая при нажатии клавиши клавиатуры - Keyboard
  glutKeyboardFunc(@Keyboard);
  // запуск основного цикла обработки событий
  glutMainLoop;
end.
