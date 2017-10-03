unit untHelloWorld;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, LCLType, ComCtrls, Dos;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    AlphaTrackBar: TTrackBar;
    blbTrackBarInfo: TLabel;
    lblVersionValue: TLabel;
    lblVersion: TLabel;
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

function OSVersion: String;
 var
  osErr: integer;
  response: longint;
  SystemStem, MajVer, MinVer: String;
begin
  {$IFDEF LCLcarbon}
  OSVersion := 'Mac OS X 10.' + IntToStr(Lo(DosVersion) - 4) + '.' + IntToStr(Hi(DosVersion));
  {$ELSE}
  {$IFDEF Linux}
  OSVersion := 'Linux Kernel ' + IntToStr(Lo(DosVersion) - 4) + '.' + IntToStr(Hi(DosVersion));
  {$ELSE}
  {$IFDEF UNIX}
  OSVersion := 'Unix ' + IntToStr(Lo(DosVersion) - 4) + '.' + IntToStr(Hi(DosVersion));
  {$ELSE}
  {$IFDEF WINDOWS}
  if WindowsVersion = wv95 then OSVersion := 'Windows 95 '
   else if WindowsVersion = wvNT4 then OSVersion := 'Windows NT v.4 '
   else if WindowsVersion = wv98 then OSVersion := 'Windows 98 '
   else if WindowsVersion = wvMe then OSVersion := 'Windows ME '
   else if WindowsVersion = wv2000 then OSVersion := 'Windows 2000 '
   else if WindowsVersion = wvXP then OSVersion := 'Windows XP '
   else if WindowsVersion = wvServer2003 then OSVersion := 'Windows Server 2003 '
   else if WindowsVersion = wvVista then OSVersion := 'Windows Vista '
   else if WindowsVersion = wv7 then OSVersion := 'Windows 7 '
   else OSVersion:= 'Windows ' + IntToStr(Win32MajorVersion) + IntToStr(Win32MinorVersion);
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
end;

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
   lblVersionValue.Caption := OSVersion;
end;




end.

