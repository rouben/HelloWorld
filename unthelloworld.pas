unit untHelloWorld;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, LCLType, ComCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    AlphaTrackBar: TTrackBar;
    blbTrackBarInfo: TLabel;
    lblCurrentAlphaInfo: TLabel;
    lblAlphaValue: TLabel;
    procedure AlphaTrackBarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;


implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   { Start off as 100% opaque }
   lblAlphaValue.Caption := IntToStr(255);
   AlphaTrackBar.Position := 255;
   frmMain.AlphaBlendValue := 255;
end;

procedure TfrmMain.AlphaTrackBarChange(Sender: TObject);
begin
   lblAlphaValue.Caption := IntToStr(AlphaTrackBar.Position);
   frmMain.AlphaBlendValue := AlphaTrackBar.Position;
end;




end.

