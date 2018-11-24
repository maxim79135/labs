program firstprogram;

{$mode objfpc}{$H+}

uses
  gl, glu, glut, Classes, Windows, Crt, sysutils;

type
	ImagePixelData = record
		ImageWidth, ImageHeight: GLsizei;
		data : pointer;
	end;

var
  // размеры окна
  WindowWidth : integer = 640;
  WindowHeight : integer = 480;
  // угол поворота
  angle : integer;
  //  x1, y1, z1 - ось, вокруг которой поворачивается объект
  //  xp, yp, zp - смещение (перенос) объекта по каждой оси
  //  xs, ys, zs - коэффициенты масштабирования по каждой оси
  x1, y1, z1, xp, yp, zp, xs, ys, zs : real;
  // используется для анимации, равна -1 когда сценка уменьшается и 1 когда увеличивается
  ScaleDirection : integer = 1;
  // скорость полета
  moonspeed:real;
  airplanespeed:real;
  // координаты спрайтов
  moonx:real;
  airplanex:real;
  // включение комбинированного преобразования
  p:bool;
  //текстуры объектов
  bg_texture, moon_texture, airplane_texture : GLuint;

  //загрузка изображения в текстуру
  procedure ReadBitmap(const AFilePath: string; var Atexture :GLuint);
  var
    // высота и ширина изображения
    AWidth, AHeight: GLsizei;
    // размер данных, включающих цвета пикселей
    DataSize: Integer;
    // поток для чтения/записи данных из файла
    FileStream: TFileStream;
    // запись с заголовком bmp файла
    FileHeader: TBitmapFileHeader;
    // запись с информацией о bmp файле
    InfoHeader: TBitmapInfoHeader;
    // указатель на RGB данные
    RGB_Data: ^byte;
    // указатель на RGBA данные
    RGBA_Data: ^byte;
    // Общее число пикселей в картинке, номер байта в массиве RGB, номер байта в массиве RGBA
    PixelCount, RGB_Byte_Number, RGBA_Byte_Number:integer;
    const
    FileTypeBitmap = $4D42;
    FileHeaderSize = SizeOf(TBitmapFileHeader);
    InfoHeaderSize = SizeOf(TBitmapInfoHeader);
  begin
    FileStream := TFileStream.Create(AFilePath, fmOpenRead);
    FileStream.ReadBuffer(FileHeader, FileHeaderSize);
    if (FileHeader.bfType <> FileTypeBitmap) then writeln('Invalid file type!'+AFilePath);
    FileStream.ReadBuffer(InfoHeader, InfoHeaderSize);
    if (InfoHeader.biBitCount <> 24) then writeln('Invalid bit depth!'+AFilePath);
    DataSize := FileStream.Size - FileHeaderSize - InfoHeaderSize;
    GetMem(RGB_Data, DataSize);
    GetMem(RGBA_Data, (DataSize div 3)*4);
    FileStream.ReadBuffer(RGB_Data^, DataSize);
    AWidth := InfoHeader.biWidth;
    AHeight := InfoHeader.biHeight;
    RGB_Byte_Number:=0;
    RGBA_Byte_Number:=0;
    // расширяем каждый RGB пиксель до RGBA
    for PixelCount:=0 to (AWidth*AHeight) do
    begin
         RGBA_Data[RGBA_Byte_Number]:=RGB_Data[RGB_Byte_Number+2];
         RGBA_Data[RGBA_Byte_Number+1]:=RGB_Data[RGB_Byte_Number+1];
         RGBA_Data[RGBA_Byte_Number+2]:=RGB_Data[RGB_Byte_Number];
         // делаем черный цвет прозрачным
         if  ((RGBA_Data[RGBA_Byte_Number]=0) and (RGBA_Data[RGBA_Byte_Number+1]=0) and (RGBA_Data[RGBA_Byte_Number+2]=0) )  then RGBA_Data[RGBA_Byte_Number+3]:=255 else RGBA_Data[RGBA_Byte_Number+3]:=0;
         RGB_Byte_Number:=RGB_Byte_Number+3;
         RGBA_Byte_Number:=RGBA_Byte_Number+4;
         end;
    // создаем текстуру
    glGenTextures(1, @Atexture);
    // выбираем её как текущую для всех операций
    glBindTexture(GL_TEXTURE_2D, Atexture);
    // генерируем текстуру из данных изображения
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, AWidth, AHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, RGBA_Data);
    // устанавливаем режим фильтраци итекстуры
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_Nearest);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    //освобождаем память
    freemem(RGB_Data, DataSize);
    freemem(RGBA_Data, (DataSize div 3)*4);
    FileStream.Free;
    end;

  procedure Init(tmp: Boolean);
   begin
        // по умолчанию анимация отключена
        p:=false;
        // создаем 3 текстуры из изображений
        ReadBitmap('bg.bmp',bg_texture);
        ReadBitmap('moon.bmp',moon_texture);
//        ReadBitmap('airplane.bmp',airplane_texture);
  ReadBitmap('1.bmp',airplane_texture);
        // задаём начальные коэффициенты - поворот вокруг оси Х, все коэфф. масштабирования равны 1
        x1:=1; xs:=2; ys:=2; zs:=2;

        // задаем скорость движения спрайтов
        moonspeed:=0.005;
        airplanespeed:=0.05;

        // цвет очистки
        glClearColor (0.0, 0.0, 0.0, 0.0);

        // включить проверку на глубину
        glEnable(GL_DEPTH_TEST);

        // включить проверку альфа-канала
        glEnable(GL_ALPHA_TEST);
        //выводить только пиксели с альфа-каналом равным 0
        glAlphaFunc(GL_EQUAL, 0);


        // вклюбчаем использование 2Д текстур
        glEnable(GL_TEXTURE_2D);
        // настройка текстурирования GL_MODULATE - учитывается цвет фрагмента или предыдущая текстурная стадия
        glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE);

        // создание дисплейного списка для вывода четырехугольника с текстурой фона
        glNewList(1, GL_COMPILE_AND_EXECUTE);
        // выбираем первую текстуру для наложения
        glBindTexture(GL_TEXTURE_2D, bg_texture);
        //создаем первый четырехугольник
        glBegin(GL_QUADS);
        glTexCoord2f(1, 1);
        glVertex3f(4, 3, -1.1);
        glTexCoord2f(0, 1);
        glVertex3f(-4, 3, -1.1);
        glTexCoord2f(0, 0);
        glVertex3f(-4,-3, -1.1);
        glTexCoord2f(1, 0);
        glVertex3f(4,-3, -1.1);
        glEnd;
        glEndList();

        // создание дисплейного списка для вывода четырехугольника с текстурой луны
        glNewList(2, GL_COMPILE_AND_EXECUTE);
        glBindTexture(GL_TEXTURE_2D, moon_texture);
        glBegin(GL_QUADS);
        glTexCoord2f(1, 1);
        glVertex3f(-3, 2, -0.5);
        glTexCoord2f(0, 1);
        glVertex3f(-4, 2, -0.5);
        glTexCoord2f(0, 0);
        glVertex3f(-4,1, -0.5);
        glTexCoord2f(1, 0);
        glVertex3f(-3,1, -0.5);
        glEnd;
        glEndList();

        // создание дисплейного списка для вывода четырехугольника с текстурой самолета
        glNewList(3, GL_COMPILE_AND_EXECUTE);
        glBindTexture(GL_TEXTURE_2D, airplane_texture);
        glBegin(GL_QUADS);
        glTexCoord2f(1, 1);
        glVertex3f(-1, 0.5, 0);
        glTexCoord2f(0, 1);
        glVertex3f(-3.5, 0.5, 0);
        glTexCoord2f(0, 0);
        glVertex3f(-3.5,0, 0);
        glTexCoord2f(1, 0);
        glVertex3f(-1,0, 0);
        glEnd;
        glEndList();
  end;

procedure Display; cdecl;
begin


     // очистка цветового буфера и буфера глубины
     // т.к. включен режим двойной буфферизации, то очищается не отображаемый цветовой буфер
     // в буфере глубины координаты z всех пикселей предыддущей сцены, их надо обнулить и посчитать заново
     glClear (GL_COLOR_BUFFER_BIT OR GL_DEPTH_BUFFER_BIT);

     // сохранение матрицы преобразований до наших манипуляций с объектом
     glPushMatrix();

     // задаём коэффициенты матрицы масштабирования
     glScalef(xs,ys,zs);
     // задаём коэффициенты матрицы поворота
     glRotatef (angle, x1, y1, z1);
     glCallList(1);

     // задаём коэффициенты матрицы переноса
     glPushMatrix();
     glTranslatef(moonx,yp,zp);
     glCallList(2);
     glPopMatrix();


     // задаём коэффициенты матрицы переноса
     glTranslatef(airplanex,yp,zp);
     glCallList(3);

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
     gluPerspective(60.0, w/h, 1.0, 20.0);
     // переключение на модельно-видовую матрицу
     glMatrixMode(GL_MODELVIEW);
     // присвоить текущей модельно-видовой матрице проекции единичную матрицу
     glLoadIdentity();
     // установить параметры камеры наблюдателя (афинные комбинированные преобразования)
     // наблюдатель (камера) в точке x=0, y=0, z=5
     // центр сцены в точке x=0, y=0, z=0
     // верхний вектор (куда направлен верх камеры) x=0, y=1, z=0
     gluLookAt (0.0, 0.0, 15.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

end;


procedure Animate(value: Integer); cdecl;
var
       previousTime, currentTime : real;
begin
     previousTime:=glutGet(GLUT_ELAPSED_TIME);
     if (p=true)   then
     begin
          // смещаем спрайты
          moonx:=moonx+moonspeed;
          airplanex:=airplanex+airplanespeed;
          // если спрайты вышли за область фона, то возвращаем их на начальную позицию
          if  (moonx>6) then  moonx:=-4;
          if  (airplanex>6) then  airplanex:=-4;

          // увеличиваем угол поворота на 10 градусов и находим остаток от деления этого значения угла на число 360
          angle := (angle + 1) mod 360;
          // если объект выполнил поворот на 360 градусов, т.е. отаток от деления ug на 360 равен 0 то
          // меняем знак d - знак приращения к коэффициентам масштабирования
          if (angle=0) then ScaleDirection:=ScaleDirection*(-1);
          // постепенно увеличиваем (или ументшаем в зависмости от знака d) коэффициенты масштабирования
          xs := xs + 0.005*ScaleDirection;
          ys := ys + 0.005*ScaleDirection;
          zs := zs + 0.005*ScaleDirection;
     end else
     begin
          moonx:=moonx+moonspeed;
          airplanex:=airplanex+airplanespeed;
          if  (moonx>6) then  moonx:=-4;
          if  (airplanex>6) then  airplanex:=-4;
          xs := 2;
          ys := 2;
          zs := 2;
     end;
     // процедура сообщает текущему окну о необходимости перерисовки (вызове процедуры display)
     glutPostRedisplay();

     // вызов функции Animate каждые 40 мс, в функцию передается параметр 0
     glutTimerFunc(40, @Animate, 0);
     currentTime:= glutGet(GLUT_ELAPSED_TIME);

     //отладочная информация
     write('angle='+inttostr(angle)+'  airplaneX='+FloatToStr(airplaneX)+'  moonX='+FloatToStr(moonX)+' fpst='+FloatToStr(currentTime-previousTime));
     GotoXY(1,1);
end;

procedure Keyboard(Key: Byte; X, Y: Longint); cdecl;
begin
     // выбор кода клавиши, которую нажал пользователь
     // коды клавиш языка С можно посмотреть, например, тут http://www.expandinghead.net/keycode.html
     case Key of
     // включение комбинированного преобразования
     88,120:
            begin
            ScaleDirection:=-1;
            p:=true;
            end;
     // запуск анимации
     76: begin
              angle := 0; x1 := 1; y1 := 1; z1 := 0;
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
     glutInitDisplayMode(GLUT_DOUBLE OR GLUT_RGBA OR GLUT_DEPTH);
     // установить размер окна приложения
     glutInitWindowSize(WindowWidth, WindowHeight);
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
