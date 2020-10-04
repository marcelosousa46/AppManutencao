unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DatasetCopy, Vcl.Menus,
  Vcl.ToolWin, Vcl.ComCtrls, Threads;

type
  TfMain = class(TForm)
    MainMenu1: TMainMenu;
    Operaes1: TMenuItem;
    Sair1: TMenuItem;
    DatasetCopy1: TMenuItem;
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    hreads1: TMenuItem;
    ExceptionsPerformance1: TMenuItem;
    Streams1: TMenuItem;
    DatasetLoop1: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DatasetCopy1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure hreads1Click(Sender: TObject);
    procedure ExceptionsPerformance1Click(Sender: TObject);
    procedure Streams1Click(Sender: TObject);
    procedure DatasetLoop1Click(Sender: TObject);
  private
  public
    function  fcFormExists(fmForm: TForm): boolean;

  end;

var
  fMain: TfMain;

implementation

uses
  DatasetLoop, Streams, Exceptions;

{$R *.dfm}

procedure TfMain.Button1Click(Sender: TObject);
begin
  if fcFormExists(fDatasetCopy as TForm) then
     fDatasetCopy.Show
  else
     fDatasetCopy := TfDatasetCopy.Create(Self);

end;

procedure TfMain.Button2Click(Sender: TObject);
begin
  if fcFormExists(fDatasetLoop as TForm) then
     fDatasetLoop.Show
  else
     fDatasetLoop := TfDatasetLoop.Create(Self);
end;

procedure TfMain.Button3Click(Sender: TObject);
begin
  if fcFormExists(fStreams as TForm) then
     fStreams.Show
  else
     fStreams := TfStreams.Create(Self);
end;

procedure TfMain.Button4Click(Sender: TObject);
begin
  if fcFormExists(fExceptions as TForm) then
     fExceptions.Show
  else
     fExceptions := TfExceptions.Create(Self);
end;

procedure TfMain.Button5Click(Sender: TObject);
begin
  if fcFormExists(fThreads as TForm) then
     fThreads.Show
  else
     fThreads := TfThreads.Create(Self);

end;

procedure TfMain.DatasetCopy1Click(Sender: TObject);
begin
  if fcFormExists(fDatasetCopy as TForm) then
     fDatasetCopy.Show
  else
     fDatasetCopy := TfDatasetCopy.Create(Self);

end;

procedure TfMain.DatasetLoop1Click(Sender: TObject);
begin
  Button2.OnClick(Self);
end;

procedure TfMain.ExceptionsPerformance1Click(Sender: TObject);
begin
  Button4.OnClick(Self);
end;

function TfMain.fcFormExists(fmForm: TForm): boolean;
var
  inIdx: integer;
begin
  fcFormExists := False;
  for inIdx := 0 to MDIChildCount - 1 do
    if MDIChildren[inIdx] = fmForm then
    begin
      fcFormExists := True;
      Exit;
    end;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if fcFormExists(fDatasetCopy as TForm) then
    fDatasetCopy.Free;
  if fcFormExists(fExceptions as TForm) then
    fExceptions.Free;
  if fcFormExists(fStreams as TForm) then
     fStreams.Free;
  if fcFormExists(fDatasetLoop as TForm) then
     fDatasetLoop.Free;
end;

procedure TfMain.hreads1Click(Sender: TObject);
begin
  Button5.OnClick(self);
end;

procedure TfMain.Sair1Click(Sender: TObject);
begin
 close;
end;

procedure TfMain.Streams1Click(Sender: TObject);
begin
  Button3.OnClick(Self);

end;

end.
