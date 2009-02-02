program ged2csv;

{%ToDo 'ged2csv.todo'}

uses
  Forms,
  main in 'main.pas' {frmMain},
  ged55utils in 'ged55utils.pas',
  About in 'about.pas' {frmAbout},
  prefs in 'prefs.pas' {frmPrefs},
  ini in 'ini.pas',
  connection in 'connection.pas' {frmConnection};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ged2csv';
  Application.HelpFile := 'ged2csv.hlp';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPrefs, frmPrefs);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmConnection, frmConnection);
  Application.Run;
end.
