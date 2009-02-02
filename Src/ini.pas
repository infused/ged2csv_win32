unit Ini;

interface

uses
  IniFiles, StrUtils, SysUtils;

const
  { General Options }
  DefaultCalcStats = True;
  DefaultRemoveQuotes = True;
  DefaultParaSep = '<br>';
  DefaultWrap = False;
  DefaultWrapCol = 80;

  { Debug Options }
  DefaultFTPLogging = False;
  DefaultHTTPLogging = False;

  { Delimited File Options }
  DefaultSaveToDF = True;
  DefaultSaveAfterProc = False;
  DefaultQuote = '"';
  DefaultDelim = ',';
  DefaultDFOutputDir = '';
  DefaultFactListFile = 'fact_list.txt';
  DefaultFamilyListFile = 'family_list.txt';
  DefaultIndividualListFile = 'individual_list.txt';
  DefaultNoteListFile = 'note_list.txt';
  DefaultRelationListFile = 'relation_list.txt';
  DefaultSourceListFile = 'source_list.txt';
  DefaultCitationListFile = 'citation_list.txt';
  DefaultChildListFile = 'child_list.txt';

  { MS Access DB Options }
  DefaultSaveToMDB = False;
  DefaultMDBFilename = 'ged2csv.mdb';
  DefaultMDBVersion = '40';
  DefaultFactTbl = 'tblFacts';
  DefaultFamilyTbl = 'tblFamilies';
  DefaultIndividualTbl = 'tblIndividuals';
  DefaultNoteTbl = 'tblNotes';
  DefaultRelationTbl = 'tblRelations';
  DefaultSourceTbl = 'tblSources';
  DefaultCitationTbl = 'tblCitations';
  DefaultChildTbl = 'tblChildren';

  { PHP MySQL Options }
  DefaultFTPServer = 'ftp.mysite.com';
  DefaultFTPUser = 'username';
  DefaultFTPPassword = '';
  DefaultFTPPasswordSave = False;
  DefaultFTPPath = '/web/';
  DefaultHTTPServer = 'www.mysite.com';
  DefaultMySQLDB = 'mydb';
  DefaultMySQLUser = 'dbusername';
  DefaultMySQLPassword = '';
  DefaultMySQLPasswordSave = False;
  DefaultMySQLFactTbl = 'test_Facts';
  DefaultMySQLFamilyTbl = 'test_Families';
  DefaultMySQLIndividualTbl = 'test_Individuals';
  DefaultMySQLNoteTbl = 'test_Notes';
  DefaultMySQLRelationTbl = 'test_Relations';
  DefaultMySQLSourceTbl = 'test_Sources';
  DefaultMySQLCitationTbl = 'test_Citations';
  DefaultMySQLChildTbl = 'test_Children';


procedure GetPrefsFromIni();
procedure SavePrefsToIni();

implementation

uses
  ged55utils, Main, LMDIniCtrl;

const
  IniSection = 'ged2csv';
  GenSection = 'General Options';
  DFSection = 'Delimited Files';
  MDBSection = 'MS Access';
  SQLSection = 'PHP MySQL';
  DebugSection = 'Debug';

{ ---------------------------------------------------------------------------- }

procedure GetPrefsFromIni();
var
  FTPEncodedPassword: string;
  MySQLEncodedPassword: string;
begin
  UpdateStatusLog('Attempting to load preferences from: ' + frmMain.IniControl.IniFile);
  with frmMain.IniControl do begin

    { Get General Options }
    CalcStats := ReadBool(GenSection, 'CalcStats', DefaultCalcStats);
    RemoveQuotes := ReadBool(GenSection, 'RemoveQuotes', DefaultRemoveQuotes);
    ParaSep := ReadString(GenSection, 'ParagraphSeparator', DefaultParaSep);
    Wrap := ReadBool(GenSection, 'Wrap', DefaultWrap);
    WrapCol := ReadInteger(GenSection, 'WrapCol', DefaultWrapCol);

    { Debug Options }
    frmMain.FTPLogFile.Active := ReadBool(DebugSection, 'FTPLogging', DefaultFTPLogging);
    frmMain.HTTPLogFile.Active := ReadBool(DebugSection, 'HTTPLogging', DefaultHTTPLogging);

    { Get Delimited File Options }
    SaveToDF := ReadBool(DFSection, 'SaveToDF', DefaultSaveToDF);
    SaveDFAfterProc := ReadBool(DFSection, 'SaveAfterProc', DefaultSaveAfterProc);
    Quote := ReadString(DFSection, 'Quote', DefaultQuote)[1];
    Delim := ReadString(DFSection, 'Delimiter', DefaultDelim);
    DFOutputDir := ReadString(DFSection, 'OutputDir', DefaultDFOutputDir);
    FactListFile := ReadString(DFSection, 'FactListFile', DefaultFactListFile);
    FamilyListFile := ReadString(DFSection, 'FamilyListFile', DefaultFamilyListFile);
    IndividualListFile := ReadString(DFSection, 'IndividualListFile', DefaultIndividualListFile);
    NoteListFile := ReadString(DFSection, 'NoteListFile', DefaultNoteListFile);
    RelationListFile := ReadString(DFSection, 'RelationListFile', DefaultRelationListFile);
    SourceListFile := ReadString(DFSection, 'SourceListFile', DefaultSourceListFile);
    CitationListFile := ReadString(DFSection, 'CitationListFile', DefaultCitationListFile);
    ChildListFile := ReadString(DFSection, 'ChildListFile', DefaultChildListFile);

    { Get MS Access DB Options}
    SaveToMDB := ReadBool(MDBSection, 'SaveToMDB', DefaultSaveToMDB);
    MDBFilename := ReadString(MDBSection, 'MDBFilename', DefaultMDBFilename);
    MDBVersion := ReadString(MDBSection, 'MDBVersion', DefaultMDBVersion);
    FactTbl := ReadString(MDBSection, 'FactTbl', DefaultFactTbl);
    FamilyTbl := ReadString(MDBSection, 'FamilyTbl', DefaultFamilyTbl);
    IndividualTbl := ReadString(MDBSection, 'IndividualTbl', DefaultIndividualTbl);
    NoteTbl := ReadString(MDBSection, 'NoteTbl', DefaultNoteTbl);
    RelationTbl := ReadString(MDBSection, 'RelationTbl', DefaultRelationTbl);
    SourceTbl := ReadString(MDBSection, 'SourceTbl', DefaultSourceTbl);
    CitationTbl := ReadString(MDBSection, 'CitationTbl', DefaultCitationTbl);
    ChildTbl := ReadString(MDBSection, 'ChildTbl', DefaultChildTbl);

    { Get PHP MySQL Options }
    FTPServer := ReadString(SQLSection, 'FTPServer', DefaultFTPServer);
    FTPUser := ReadString(SQLSection, 'FTPUser', DefaultFTPUser);
    FTPEncodedPassword := ReadString(SQLSection, 'FTPPassword', DefaultFTPPassword);
    FTPPassword := frmMain.Decoder.DecodeString(FTPEncodedPassword);
    FTPPasswordSave := ReadBool(SQLSection, 'FTPPasswordSave', DefaultFTPPasswordSave);
    FTPPath := ReadString(SQLSection, 'FTPPath', DefaultFTPPath);
    HTTPServer := ReadString(SQLSection, 'HTTPServer', DefaultHTTPServer);
    MySQLDB := ReadString(SQLSection, 'MySQLDB', DefaultMySQLDB);
    MySQLUser := ReadString(SQLSection, 'MySQLUser', DefaultMySQLUser);
    MySQLEncodedPassword := ReadString(SQLSection, 'MySQLPassword', DefaultMySQLPassword);
    MySQLPassword := frmMain.Decoder.DecodeString(MySQLEncodedPassword);
    MySQLPasswordSave := ReadBool(SQLSection, 'MySQLPasswordSave', DefaultMySQLPasswordSave);
    MySQLFactTbl := ReadString(SQLSection, 'MySQLFactTbl', DefaultMySQLFactTbl);
    MySQLFamilyTbl := ReadString(SQLSection, 'MySQLFamilyTbl', DefaultMySQLFamilyTbl);
    MySQLIndividualTbl := ReadString(SQLSection, 'MySQLIndividualTbl', DefaultMySQLIndividualTbl);
    MySQLNoteTbl := ReadString(SQLSection, 'MySQLNoteTbl', DefaultMySQLNoteTbl);
    MySQLRelationTbl := ReadString(SQLSection, 'MySQLRelationTbl', DefaultMySQLRelationTbl);
    MySQLSourceTbl := ReadString(SQLSection, 'MySQLSourceTbl', DefaultMySQLSourceTbl);
    MySQLCitationTbl := ReadString(SQLSection, 'MySQLCitationTbl', DefaultMySQLCitationTbl);
    MySQLChildTbl := ReadString(SQLSection, 'MySQLChildTbl', DefaultMySQLChildTbl);
  end;

  { Check for existance of ini file and display status message }
  if (fileexists(extractfilename(frmMain.IniControl.IniFile))) then
    UpdateStatusLog('Preferences loaded successfully.')
  else
    UpdateStatusLog(extractfilename(frmMain.IniControl.IniFile) + ' was not found, using default preferences');
end;

{ ---------------------------------------------------------------------------- }

procedure SavePrefsToIni();
var
  FTPEncodedPassword: string;
  MySQLEncodedPassword: string;
begin
  with frmMain.IniControl do begin
    { Set General Options }
    WriteBool(GenSection, 'CalcStats', CalcStats);
    WriteBool(GenSection, 'RemoveQuotes', RemoveQuotes);
    WriteString(GenSection, 'ParagraphSeparator', ParaSep);
    WriteBool(GenSection, 'Wrap', Wrap);
    WriteInteger(GenSection, 'WrapCol', WrapCol);

    { Set Delimited File Options }
    WriteBool(DFSection, 'SaveToDF', SaveToDF);
    WriteBool(DFSection, 'SaveAfterProc', SaveDFAfterProc);
    WriteString(DFSection, 'Quote', Quote);
    WriteString(DFSection, 'Delimiter', Delim);
    WriteString(DFSection, 'OutputDir', DFOutputDir);
    WriteString(DFSection, 'FactListFile', FactListFile);
    WriteString(DFSection, 'FamilyListFile', FamilyListFile);
    WriteString(DFSection, 'IndividualListFile', IndividualListFile);
    WriteString(DFSection, 'NoteListFile', NoteListFile);
    WriteString(DFSection, 'RelationListFile', RelationListFile);
    WriteString(DFSection, 'SourceListFile', SourceListFile);
    WriteString(DFSection, 'CitationListFile', CitationListFile);
    WriteString(DFSection, 'ChildListFile', ChildListFile);

    { Set MS Access DB Options }
    WriteBool(MDBSection, 'SaveToMDB', SaveToMDB);
    WriteString(MDBSection, 'MDBFilename', MDBFilename);
    WriteString(MDBSection, 'MDBVersion', MDBVersion);
    WriteString(MDBSection, 'FactTbl', FactTbl);
    WriteString(MDBSection, 'FamilyTbl', FamilyTbl);
    WriteString(MDBSection, 'IndividualTbl', IndividualTbl);
    WriteString(MDBSection, 'NoteTbl', NoteTbl);
    WriteString(MDBSection, 'RelationTbl', RelationTbl);
    WriteString(MDBSection, 'SourceTbl', SourceTbl);
    WriteString(MDBSection, 'CitationTbl', CitationTbl);
    WriteString(MDBSection, 'ChildTbl', ChildTbl);

    { Set PHP MySQL Options }
    WriteString(SQLSection, 'FTPServer', FTPServer);
    WriteString(SQLSection, 'FTPUser', FTPUser);
    if FTPPasswordSave = True then begin
      FTPEncodedPassword := frmMain.Encoder.EncodeString(FTPPassword);
      WriteString(SQLSection, 'FTPPassword', FTPEncodedPassword);
    end
    else begin
      WriteString(SQLSection, 'FTPPassword', '');
    end;
    WriteBool(SQLSection, 'FTPPasswordSave', FTPPasswordSave);
    WriteString(SQLSection, 'FTPPath', FTPPath);
    WriteString(SQLSection, 'HTTPServer', HTTPServer);
    WriteString(SQLSection, 'MySQLDB', MySQLDB);
    WriteString(SQLSection, 'MySQLUser', MySQLUser);
    if MySQLPasswordSave = True then begin
      MySQLEncodedPassword := frmMain.Encoder.EncodeString(MySQLPassword);
      WriteString(SQLSection, 'MySQLPassword', MySQLEncodedPassword);
    end
    else begin
      WriteString(SQLSection, 'MySQLPassword', '');
    end;
    WriteBool(SQLSection, 'MySQLPasswordSave', MySQLPasswordSave);
    WriteString(SQLSection, 'MySQLFactTbl', MySQLFactTbl);
    WriteString(SQLSection, 'MySQLFamilyTbl', MySQLFamilyTbl);
    WriteString(SQLSection, 'MySQLIndividualTbl', MySQLIndividualTbl);
    WriteString(SQLSection, 'MySQLNoteTbl', MySQLNoteTbl);
    WriteString(SQLSection, 'MySQLRelationTbl', MySQLRelationTbl);
    WriteString(SQLSection, 'MySQLSourceTbl', MySQLSourceTbl);
    WriteString(SQLSection, 'MySQLCitationTbl', MySQLCitationTbl);
    WriteString(SQLSection, 'MySQLChildTbl', MySQLChildTbl);

  end;
  UpdateStatusLog('Preferences saved to: ' + extractfilename(frmMain.IniControl.IniFile));
end;

{ ---------------------------------------------------------------------------- }

end.

