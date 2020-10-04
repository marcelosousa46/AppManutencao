unit DatasetCopy;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfDatasetCopy = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDataset1, FDataset2: TClientDataset;
    FDataSource1, FDataSource2: TDataSource;

    procedure InitDataset;
  public
    procedure AfterScroll(DataSet: TDataSet);
    procedure AfterPost(DataSet: TDataSet);
  end;

var
  fDatasetCopy: TfDatasetCopy;

implementation

{$R *.dfm}


procedure TfDatasetCopy.AfterPost(DataSet: TDataSet);
begin
 if DataSet.State in [dsBrowse] then
   FDataset2.Data := FDataset1.Data;

end;

procedure TfDatasetCopy.AfterScroll(DataSet: TDataSet);
begin
 if DataSet.State in [dsBrowse] then
   FDataset2.Data := FDataset1.Data;

end;

procedure TfDatasetCopy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FDataset1.Free;
  FDataset2.Free;
  FDataSource1.Free;
  FDataSource2.Free;
end;


procedure TfDatasetCopy.FormCreate(Sender: TObject);
begin
  inherited;
  FDataset1 := TClientDataset.Create(nil);
  FDataset2 := TClientDataset.Create(nil);
  FDataSource1 := TDataSource.Create(nil);
  FDataSource2 := TDataSource.Create(nil);

  FDataSource1.DataSet := FDataset1;
  FDataSource2.DataSet := FDataset2;

  DBGrid1.DataSource := FDataSource1;
  DBGrid2.DataSource := FDataSource2;

  InitDataset;
end;

procedure TfDatasetCopy.InitDataset;
begin
  DBNavigator1.DataSource := FDataSource1;
  FDataset1.Close;
  FDataset1.FieldDefs.Add('Field1', ftString, 20);
  FDataset1.FieldDefs.Add('Field2', ftInteger);
  FDataset1.CreateDataSet;
  FDataset1.AfterScroll  := AfterScroll;
  FDataset1.AfterPost    := AfterPost;
  FDataset1.Append;
  FDataset1.FieldByName('Field1').AsString := 'Field1Value1';
  FDataset1.FieldByName('Field2').AsInteger := 1;
  FDataset1.Post;

  FDataset1.Append;
  FDataset1.FieldByName('Field1').AsString := 'Field1Value2';
  FDataset1.FieldByName('Field2').AsInteger := 2;
  FDataset1.Post;

  FDataset1.Append;
  FDataset1.FieldByName('Field1').AsString := 'Field1Value3';
  FDataset1.FieldByName('Field2').AsInteger := 3;
  FDataset1.Post;

  FDataset2.Data := FDataset1.Data;
end;

end.
