unit Utama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ExtDlgs,
  StdCtrls,About;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonClear: TButton;
    ButtonSave: TButton;
    ButtonOrnament: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LabelAbout: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    OpenPictureDialog2: TOpenPictureDialog;
    OpenPictureDialog3: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure deteksitepi();
    procedure FormShow(Sender: TObject);
    procedure LabelAboutClick(Sender: TObject);
    procedure smoothing();
    procedure ButtonOrnamentClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
uses
  windows;
var
   img1,img2,img3 : bool;
   bitmapHasil : array [0..1000, 0..1000] of byte;
   bitmapRB, bitmapGB, bitmapBB : array [0..1000, 0..1000] of byte;
   bitmapTR, bitmapTG, bitmapTB : array [0..1000, 0..1000] of byte;
   bitmapR, bitmapG, bitmapB : array [0..1000, 0..1000] of byte;
   bitmapHasilR, bitmapHasilG, bitmapHasilB: array [0..1000, 0..1000] of byte;


procedure TForm1.Image1Click(Sender: TObject);
var
 x, y : integer;
begin
 img1:=true;
 if OpenPictureDialog1.Execute then
 begin
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  for y:=0 to image1.Height-1 do
  begin
   for x:=0 to image1.Width-1 do
   begin
    bitmapR[x,y] := GetRValue(image1.Canvas.Pixels[x,y]);
    bitmapG[x,y] := GetGValue(image1.Canvas.Pixels[x,y]);
    bitmapB[x,y] := GetBValue(image1.Canvas.Pixels[x,y]);
   end;
  end;
 end;
 Label1.Visible:=false;
 Label4.Visible:=false;
end;

procedure TForm1.ButtonOrnamentClick(Sender: TObject);
var
 x,y : integer;
begin
deteksitepi();
smoothing();

for y := 0 to image1.Height-1 do
begin
  for x := 0 to image1.Width-1 do
  begin
    if (bitmapHasilR[x,y] > 150) or (bitmapHasilG[x,y] > 150) or (bitmapHasilB[x,y] > 150) then
    begin
       bitmapHasil[x,y]:= 255;
    end
    else
    begin
       bitmapHasil[x,y]:= 0;
    end
  end;
end;

 for y := 0 to image1.Height-1 do
 begin
  for x := 0 to image1.Width-1 do
  begin
  if(img1=true) and (img2=true) then
  begin
    if (bitmapHasil[x,y] = 255) then
    begin
     Image4.Canvas.Pixels[x,y] := RGB(bitmapTR[x,y], bitmapTG[x,y], bitmapTB[x,y]);
    end
   end
  else
  if (img1=true) and (img3=true) then
  begin
   if (bitmapHasil[x,y] = 255) then
    begin
     Image4.Canvas.Pixels[x,y] := RGB(bitmapHasil[x,y], bitmapHasil[x,y], bitmapHasil[x,y]);
    end
    else
    begin
     Image4.Canvas.Pixels[x,y] := RGB(bitmapRB[x,y], bitmapGB[x,y], bitmapBB[x,y]);
    end;
  end
  end;
 end;
end;

procedure TForm1.Image2Click(Sender: TObject);
var
 x, y : integer;
begin
 img2:=true;
 if OpenPictureDialog2.Execute then
 begin
  Image2.Picture.LoadFromFile(OpenPictureDialog2.FileName);
  for y:=0 to image2.Height-1 do
  begin
   for x:=0 to image2.Width-1 do
   begin
    bitmapTR[x,y] := GetRValue(image2.Canvas.Pixels[x,y]);
    bitmapTG[x,y] := GetGValue(image2.Canvas.Pixels[x,y]);
    bitmapTB[x,y] := GetBValue(image2.Canvas.Pixels[x,y]);
   end;
  end;
 end;
 image3.Visible:=false;
 Label2.Visible:=false;
 Label3.Visible:=false;
 Label5.Visible:=false;
 label6.Visible:=false;

end;

procedure TForm1.Image3Click(Sender: TObject);
var
  x,y : integer;

begin
   img3:=true;
  if OpenPictureDialog3.Execute then
   begin
     Image3.Picture.LoadFromFile(OpenPictureDialog3.FileName);

     for y := 0 to Image3.Height-1 do
     begin
       for x := 0 to Image3.Width-1 do
       begin
       bitmapRB[x,y] := GetRValue(Image3.Canvas.Pixels[x,y]);
       bitmapGB[x,y] := GetGValue(Image3.Canvas.Pixels[x,y]);
       bitmapBB[x,y] := GetBValue(Image3.Canvas.Pixels[x,y]);
       end;
     end;
   end;
  image2.Visible:=false;
  Label2.Visible:=false;
  Label3.Visible:=false;
  Label5.Visible:=false;
  Label6.Visible:=false;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
   Image1Click(sender);
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
   Image2Click(sender);
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
   Image3Click(sender);
end;

procedure TForm1.deteksitepi();
var
  gray: real;
  x, y, a, b, nilaiX, nilaiY: integer;
  bagianR, bagianG, bagianB: integer;
  filterX:array[-1..1,-1..1] of integer = (
    (-1,0,1),
    (-2,0,2),
    (-1,0,1)
  );
  filterY:array[-1..1,-1..1] of integer = (
    (1,2,1),
    (0,0,0),
    (-1,-2,-1)
  );
begin
  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      gray := (bitmapR[x,y] + bitmapG[x,y] + bitmapB[x,y]) div 3;
      bitmapR[x,y]:= round(gray);
      bitmapG[x,y]:= round(gray);
      bitmapB[x,y]:= round(gray);
    end;
  end;

  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      bagianR := 0;
      bagianG := 0;
      bagianB := 0;

      for a:=-1 to 1 do
      begin
        for b:=-1 to 1 do
        begin
          nilaiX := a + x ;
          nilaiY := b + y ;

          if nilaiX > image1.Width-1 then
          begin
            nilaiX := image1.Width-1;
          end;

          if nilaiX < 0 then
          begin
            nilaiX := 0;
          end;

          if nilaiY > image1.Height-1 then
          begin
            nilaiY := image1.Height-1;
          end;

          if nilaiY < 0 then
          begin
            nilaiY := 0;
          end;

          bagianR := bagianR + bitmapR[nilaiX, nilaiY] * filterX[a,b];
          bagianG := bagianG + bitmapG[nilaiX, nilaiY] * filterX[a,b];
          bagianB := bagianB + bitmapB[nilaiX, nilaiY] * filterX[a,b];

          bagianR := bagianR + bitmapR[nilaiX, nilaiY] * filterY[a,b];
          bagianG := bagianG + bitmapG[nilaiX, nilaiY] * filterY[a,b];
          bagianB := bagianB + bitmapB[nilaiX, nilaiY] * filterY[a,b];
        end;
      end;

      if bagianR > 255 then
      begin
        bagianR := 255;
      end;

      if bagianR < 0 then
      begin
        bagianR := 0;
      end;

      if bagianG > 255 then
      begin
        bagianG := 255;
      end;

      if bagianG < 0 then
      begin
        bagianG := 0;
      end;

      if bagianB > 255 then
      begin
        bagianB := 255;
      end;

      if bagianB < 0 then
      begin
        bagianB := 0;
      end;

      bitmapHasilR[x,y] := bagianR;
      bitmapHasilG[x,y] := bagianG;
      bitmapHasilB[x,y] := bagianB;
    end;
  end;

  for y:=0 to image1.Height-1 do
  begin
    for x:=0 to image1.Width-1 do
    begin
      bitmapHasilR[x,y] := bitmapHasilR[x,y];
      bitmapHasilG[x,y] := bitmapHasilG[x,y];
      bitmapHasilB[x,y] := bitmapHasilB[x,y];
    end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 x, y : integer;
begin
   for y:=0 to Image1.Height-1 do
  begin
   for x:=0 to Image1.Width-1 do
   begin
    image1.Canvas.Pixels[x,y]:=RGB(255,255,255);
    image2.Canvas.Pixels[x,y]:=RGB(255,255,255);
    image3.Canvas.Pixels[x,y]:=RGB(255,255,255);
    image4.Canvas.Pixels[x,y]:=RGB(255,255,255);
   end;
  end;
end;

procedure TForm1.LabelAboutClick(Sender: TObject);
begin
 Form2.Show;
 Form1.Hide;
end;

procedure TForm1.ButtonSaveClick(Sender: TObject);
begin
 if SavePictureDialog1.Execute then
 begin
  image4.Picture.SaveToFile(SavePictureDialog1.FileName);
 end;
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
var AppName : PChar;
begin
 AppName := PChar(Application.ExeName) ;
 ShellExecute(Handle,'open', AppName, nil, nil, SW_SHOWNORMAL);
 Application.Terminate;
end;

procedure TForm1.smoothing();
var
 x, y, ts : integer;
begin
  ts := 1;
  for y:=0 to Image3.Height-1 do
  begin
   for x:=0 to Image3.Width-1 do
   begin
    bitmapRB[x,y] := (bitmapRB[x,y] + bitmapRB[x-ts, y-ts] + bitmapRB[x, y-ts] + bitmapRB[x+ts, y-ts] + bitmapRB[x-ts, y] + bitmapRB[x+ts, y] + bitmapRB[x-ts, y+ts] + bitmapRB[x, y+ts] + bitmapRB[x+ts, y+ts]) div 9;
    bitmapGB[x,y] := (bitmapGB[x,y] + bitmapGB[x-ts, y-ts] + bitmapGB[x, y-ts] + bitmapGB[x+ts, y-ts] + bitmapGB[x-ts, y] + bitmapGB[x+ts, y] + bitmapGB[x-ts, y+ts] + bitmapGB[x, y+ts] + bitmapGB[x+ts, y+ts]) div 9;
    bitmapBB[x,y] := (bitmapBB[x,y] + bitmapBB[x-ts, y-ts] + bitmapBB[x, y-ts] + bitmapBB[x+ts, y-ts] + bitmapBB[x-ts, y] + bitmapBB[x+ts, y] + bitmapBB[x-ts, y+ts] + bitmapBB[x, y+ts] + bitmapBB[x+ts, y+ts]) div 9;

   end;
  end;
end;

end.

