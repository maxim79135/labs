program firstprogram;

{$mode objfpc}{$H+}

uses
    gl, glu, glut;

const
    CubeSize = 1;
var
    // размеры окна
    Width : integer = 640;
    Height : integer = 480;

procedure Display; cdecl;
const
    SquareSize=200;

var
   // координаты вершин квадрата
   left, right, top, bottom : Integer;


begin

   left:=(Width - SquareSize) div 2;
   right:= left+ SquareSize;
   bottom:=(Height - SquareSize) div 2;
   top:= bottom + SquareSize;

   // задание цвета очистки
   glClearColor(0.7, 0.7, 0.7, 1);

   // очистка цветового буфера и буфера глубины
   glClear (GL_COLOR_BUFFER_BIT);

   // задание цвета вершины
   glColor3ub(0,0,0);

   // задание параметров вершин четырехугольника
   glBegin(GL_POLYGON);
     glVertex2f(left,bottom);
     glVertex2f(left,top);
     glVertex2f((left + right) / 2, top / 2);
     glVertex2f(right,top);
     glVertex2f(right,bottom);
   glEnd();
   // блокирование выполнения приложения, пока все openlg команды не выполнятся
   glFinish();

end;

procedure Reshape(W, H: Integer); cdecl;
begin
    // установка области ыидимости внутри окна приложения
    glViewport (0, 0, w, h);
    // выбор матрицы проекции для выполнения операций над ней
    glMatrixMode (GL_PROJECTION);
    // присвоить текущей матрице проекции единичную матрицу
    glLoadIdentity ();
    // задать коэффициенты ортографической проекции - координаты левой нижней и правой верхней вершины параллелепипеда
    glOrtho(0, w, 0, h, -1.0, 1.0);
    // переключение на модельно-видовую матрицу
    glMatrixMode(GL_MODELVIEW);
    // присвоить текущей модельно-видовой матрице проекции единичную матрицу
    glLoadIdentity();
end;

procedure Keyboard(Key: Byte; X, Y: Longint); cdecl;

begin
    // выбор кода клавиши, которую нажал пользователь
    // коды клавиш языка С можно посмотреть, например, тут http://www.expandinghead.net/keycode.html
    case Key of
      // выход
      27: Halt(0);
    end;
end;

procedure glutInitPascal(ParseCmdLine: Boolean);
var
    // массив указателей на параметры командной строки
    Cmd: array of PChar;
    // CmdCount - число параметров командной строки, которое будет передано в процедуру glutInit
    CmdCount, I: Integer;
begin
    // функция ParamCount() возвращает число параметров командной строки
    // в Delphi нумерация параметров с 0, поэтому увеличиваем число параметров на 1
    CmdCount := ParamCount() + 1;
    // выделяем для каждого параметра указатель (адрес на этот параметр)
    SetLength(Cmd, CmdCount);
    // для каждого параметра получаем адрес функцией PChar() и записываем его в массив Cmd
    for I := 0 to CmdCount - 1 do Cmd[I] := PChar(ParamStr(I));
    // вызываем glutInit, передаём в неё число параметров командной строки и указатель на массив с указателми на параметры
    glutInit(@CmdCount, @Cmd);
end;


begin
    glutInitPascal(True);
    // установка режима отображения окна
    // двойная буферизация, цвет в формате RGB, использовать буфер глубины
    glutInitDisplayMode(GLUT_RGB);
    // установить размер окна приложения
    glutInitWindowSize(Width, Height);
    // создать окно с именем Red_square_example
    glutCreateWindow('Red_square_example');

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
