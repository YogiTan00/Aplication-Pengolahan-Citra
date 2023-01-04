unit About;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, lclintf;

type

  { TForm2 }

  TForm2 = class(TForm)
    ButtonBack: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure ButtonBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation
uses
  Utama;

{$R *.lfm}

{ TForm2 }

procedure TForm2.Label1Click(Sender: TObject);
begin
  OpenURL('https://www.instagram.com/yogitan00/');
end;

procedure TForm2.ButtonBackClick(Sender: TObject);
begin
  Form1.Show;
  Form2.Hide;
end;

procedure TForm2.Label2Click(Sender: TObject);
begin
  OpenURL('https://www.instagram.com/hendrik.lay09/');
end;

procedure TForm2.Label3Click(Sender: TObject);
begin
  OpenURL('https://www.instagram.com/amanda.wln/');
end;

procedure TForm2.Label4Click(Sender: TObject);
begin
  OpenURL('https://www.instagram.com/calvinchristop/');
end;

procedure TForm2.Label5Click(Sender: TObject);
begin
  OpenURL('https://www.instagram.com/edo_juliyanto/');
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Form1.Show;
  Form2.Hide;
end;

end.

