unit Exceptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfExceptions = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    Label2: TLabel;
    Button2: TButton;
    Memo3: TMemo;
    Label1: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FPath: string;

    procedure LoadNumbers(AIgnore: Integer);
  public
  end;

var
  fExceptions: TfExceptions;

implementation

{$R *.dfm}

procedure TfExceptions.Button1Click(Sender: TObject);
var
  t1, t2: Integer;
begin
  try
    Memo1.Lines.Clear;
    Memo2.Lines.Clear;
    t1 := 0;
    try
      t1 := GetTickCount;
      LoadNumbers(1);
    except on E: Exception do
      begin
        Memo1.Lines.Add('Classe Exception: ' + E.ClassName);
        Memo1.Lines.Add('Erro: ' + E.Message);
        raise;
      end;
    end;
  finally
    t2 := GetTickCount - Cardinal(t1);
    Label1.Caption := 'Tempo de processamento: ' + t2.ToString + ' ms';
  end;
end;

procedure TfExceptions.Button2Click(Sender: TObject);
var
  i: Integer;
  tempo: Integer;
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;

  tempo := GetTickCount;

  for i := 0 to 7 do
  begin
    LoadNumbers(i);

  end;

  Label1.Caption := 'Tempo de processamento: ' + tempo.ToString + ' ms';
end;

procedure TfExceptions.FormCreate(Sender: TObject);
begin
  FPath := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'text.txt';
end;

procedure TfExceptions.LoadNumbers(AIgnore: Integer);
var
  st: TStringList;
  i, y: Integer;
  s: String;
begin
  st := TStringList.Create;
  st.LoadFromFile(FPath);

  try
    for i := 0 to st.Count do
    begin
      s := st[i];
      Y := pos(AIgnore.ToString,s);
      if Y > 0  then
          Memo2.Lines.Add(s[y-1]);

{      for y := 0 to Length(s) do
        if not (s[y] = AIgnore.ToString) then
          Memo2.Lines.Add(s[y]);    }
    end;
  except
    raise Exception.Create(Format('Erro ao tentar retirar número %d', [AIgnore]));
  end;

end;

end.
