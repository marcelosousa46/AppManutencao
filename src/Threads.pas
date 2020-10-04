unit Threads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TMinhaThread = class(TThread)
    private
      FaProgressBar: TProgressBar;
      FIntervalo: Integer;
      FProcesso: Integer;

      procedure DoProgresso;
      procedure SetaProgresso(const Value: TProgressBar);
    protected
      procedure Execute; override;
    public
      constructor Create;
      property aProgressBar: TProgressBar read FaProgressBar write SetaProgresso;
      property Processo: Integer read FProcesso write FProcesso;
      property Intervalo: Integer read FIntervalo write FIntervalo;

  end;

  TfThreads = class(TForm)
    GroupBox1: TGroupBox;
    edIntervalo: TEdit;
    btIniciar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btIniciarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  fThreads: TfThreads;
  iProcesso: Integer;
  aProgresso : TProgressBar;

implementation

{$R *.dfm}

procedure TfThreads.btIniciarClick(Sender: TObject);
var
  aThread: TMinhaThread;
begin
  if Length(edIntervalo.Text) = 0 then
  begin
    ShowMessage('Valor invalido...');
    exit;
  end;
  aProgresso             := TProgressBar.Create(Self);
  Self.InsertControl(aProgresso);
  aProgresso.Align     := alBottom;
  aThread              := TMinhaThread.Create;
  try
    aThread.Intervalo    := StrToInt(edIntervalo.Text);
    aThread.Processo     := iProcesso;
    aThread.aProgressBar := aProgresso;
    inc(iProcesso);
    edIntervalo.Text     := '0';
  finally
    aThread.Free;
  end;
end;

procedure TfThreads.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  aProgresso.Free;
end;

procedure TfThreads.FormCreate(Sender: TObject);
begin
  iProcesso := 0;
end;

{ TMinhaThread }

constructor TMinhaThread.Create;
begin
  inherited Create(false);
end;

procedure TMinhaThread.DoProgresso;
begin
  Application.ProcessMessages;
end;

procedure TMinhaThread.Execute;
var
  I: Integer;
begin
  inherited;
  for I := 0 to 100 do
  begin
    Sleep(FIntervalo);
    aProgressBar.Position := aProgressBar.Position + 2;
    Synchronize(DoProgresso);
  end;


end;

procedure TMinhaThread.SetaProgresso(const Value: TProgressBar);
begin
  FaProgressBar := Value;
end;

end.
