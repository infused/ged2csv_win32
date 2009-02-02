unit Prefs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, dxCore, dxCheckCtrls,
  LMDCustomComponent, lmdcont, LMDCustomButton, LMDButton,
  LMDButtonControl, LMDCustomCheckBox, LMDCheckBox, LMDCustomParentPanel,
  LMDCustomGroupBox, LMDGroupBox, TFlatRadioButtonUnit, TFlatGroupBoxUnit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDEdit, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomLabel, LMDLabel, TFlatPanelUnit, TFlatButtonUnit,
  LMDCustomBrowseEdit, LMDCustomFileEdit, LMDFileOpenEdit, idException,
  LMDContainerComponent, LMDBaseDialog, LMDDirDlg, LMDImageListConnector,
  LMDBaseController, LMDCustomContainer, LMDCustomImageList;

type
  TfrmPrefs = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    chkRemoveQuotes: TdxCheckbox;
    chkSaveToDF: TdxCheckbox;
    chkSaveAfterProc: TdxCheckbox;
    chkSaveToMDB: TdxCheckbox;
    FlatGroupBox1: TFlatGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    FlatGroupBox2: TFlatGroupBox;
    rbtAccessVer30: TFlatRadioButton;
    rbtAccessVer40: TFlatRadioButton;
    FlatGroupBox3: TFlatGroupBox;
    Facts: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    FlatGroupBox4: TFlatGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label3: TLabel;
    chkWrap: TdxCheckbox;
    btnSave: TLMDButton;
    LMDImageListConnector1: TLMDImageListConnector;
    LMDButton2: TLMDButton;
    LMDButton1: TLMDButton;
    btnDefaults: TLMDButton;
    chkCalcStats: TdxCheckbox;
    OpenDialog1: TOpenDialog;
    edtMDBFilename: TLMDEdit;
    edtFactTbl: TLMDEdit;
    edtFamilyTbl: TLMDEdit;
    edtIndividualTbl: TLMDEdit;
    edtNoteTbl: TLMDEdit;
    edtRelationTbl: TLMDEdit;
    edtSourceTbl: TLMDEdit;
    edtFactList: TLMDEdit;
    edtFamilyList: TLMDEdit;
    edtIndividualList: TLMDEdit;
    edtNoteList: TLMDEdit;
    edtRelationList: TLMDEdit;
    edtSourceList: TLMDEdit;
    edtCitationList: TLMDEdit;
    edtCitationTbl: TLMDEdit;
    edtQuote: TLMDEdit;
    edtParaSep: TLMDEdit;
    edtWrapCol: TLMDEdit;
    LMDLabel1: TLMDLabel;
    TabSheet4: TTabSheet;
    LMDGroupBox1: TLMDGroupBox;
    LMDGroupBox2: TLMDGroupBox;
    edtMySQLDB: TLMDEdit;
    edtFTPServer: TLMDEdit;
    edtFTPUser: TLMDEdit;
    edtFTPPassword: TLMDEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtFTPPath: TLMDEdit;
    Label21: TLabel;
    Label23: TLabel;
    edtHTTPServer: TLMDEdit;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edtMySQLUser: TLMDEdit;
    edtMySQLPassword: TLMDEdit;
    LMDGroupBox3: TLMDGroupBox;
    edtMySQLFactTbl: TLMDEdit;
    edtMySQLFamilyTbl: TLMDEdit;
    edtMySQLIndividualTbl: TLMDEdit;
    edtMySQLNoteTbl: TLMDEdit;
    edtMySQLRelationTbl: TLMDEdit;
    edtMySQLSourceTbl: TLMDEdit;
    edtMySQLCitationTbl: TLMDEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    btnTestConnect: TLMDButton;
    chkFTPPasswordSave: TLMDCheckBox;
    chkMySQLPasswordSave: TLMDCheckBox;
    edtDFOutputDir: TLMDEdit;
    Label33: TLabel;
    DirDlg: TLMDDirDlg;
    edtDelim: TLMDEdit;
    Label34: TLabel;
    edtChildList: TLMDEdit;
    edtMySQLChildTbl: TLMDEdit;
    Label35: TLabel;
    Label36: TLabel;
    edtChildTbl: TLMDEdit;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkWrapClick(Sender: TObject);
    procedure btnDefaultsClick(Sender: TObject);
    procedure edtMDBFilenameBtnClick(Sender, Btn: TObject; index: Integer);
    procedure LMDEditMouseEnter(Sender: TObject);
    procedure LMDEditMouseExit(Sender: TObject);
    procedure edtFactListBtnClick(Sender, Btn: TObject; index: Integer);
    procedure edtFamilyListBtnClick(Sender, Btn: TObject; index: Integer);
    procedure edtIndividualListBtnClick(Sender, Btn: TObject;
      index: Integer);
    procedure edtNoteListBtnClick(Sender, Btn: TObject; index: Integer);
    procedure edtRelationListBtnClick(Sender, Btn: TObject;
      index: Integer);
    procedure edtSourceListBtnClick(Sender, Btn: TObject; index: Integer);
    procedure edtCitationListBtnClick(Sender, Btn: TObject;
      index: Integer);
    procedure edtHTTPServerChange(Sender: TObject);
    procedure btnTestConnectClick(Sender: TObject);
    procedure edtDFOutputDirBtnClick(Sender, Btn: TObject; index: Integer);
    procedure edtDFOutputDirChange(Sender: TObject);
    procedure edtChildListBtnClick(Sender, Btn: TObject; index: Integer);
  private
    procedure ApplyChanges();
  public
  end;

var
  frmPrefs: TfrmPrefs;

implementation

uses
  main, ged55utils, ini, connection, IdFTP, IdFTPList, StrUtils;
{$R *.dfm}

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.btnOKClick(Sender: TObject);
begin
  { Apply changes and close form }
  ApplyChanges();
  frmPrefs.Close;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.btnCancelClick(Sender: TObject);
begin
  { Close form without applying changes }
  frmPrefs.Close;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.btnSaveClick(Sender: TObject);
begin
  { Apply changes and save }
  ApplyChanges();
  SavePrefsToIni();
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.ApplyChanges();
begin
  { Apply General Options }
  CalcStats := chkCalcStats.Checked;
  RemoveQuotes := chkRemoveQuotes.Checked;
  ParaSep := edtParaSep.Text;
  Wrap := chkWrap.Checked;
  WrapCol := strtoint(edtWrapCol.Text);

  { Apply Delimited File Options }
  SaveToDF := chkSaveToDF.Checked;
  SaveDFAfterProc := chkSaveAfterProc.Checked;
  Delim := edtDelim.Text;
  Quote := edtQuote.Text[1];
  DFOutputDir := edtDFOutputDir.Text;
  FactListFile := edtFactList.Text;
  FamilyListFile := edtFamilyList.Text;
  IndividualListFile := edtIndividualList.Text;
  NoteListFile := edtNoteList.Text;
  RelationListFile := edtRelationList.Text;
  SourceListFile := edtSourceList.Text;
  CitationListFile := edtCitationList.Text;
  ChildListFile := edtChildList.Text;

  { Apply MS Access DB Options }
  SaveToMDB := chkSaveToMDB.Checked;
  MDBFilename := edtMDBFilename.Text;
  FactTbl := edtFactTbl.Text;
  FamilyTbl := edtFamilyTbl.Text;
  IndividualTbl := edtIndividualTbl.Text;
  NoteTbl := edtNoteTbl.Text;
  RelationTbl := edtRelationTbl.Text;
  SourceTbl := edtSourceTbl.Text;
  CitationTbl := edtCitationTbl.Text;
  ChildTbl := edtChildTbl.Text;
  if rbtAccessVer30.Checked = True then
    MDBVersion := '30'
  else if rbtAccessVer40.Checked = True then
    MDBVersion := '40';

  { Apply PHP MySQL Options }
  FTPServer := edtFTPServer.Text;
  FTPUser := edtFTPUser.Text;
  FTPPassword := edtFTPPassword.Text;
  FTPPasswordSave := chkFTPPasswordSave.Checked;
  FTPPath := edtFTPPath.Text;
  HTTPServer := edtHTTPServer.Text;
  MySQLDB := edtMySQLDB.Text;
  MySQLUser := edtMySQLUser.Text;
  MySQLPassword := edtMySQLPassword.Text;
  MySQLPasswordSave := chkMySQLPasswordSave.Checked;
  MySQLFactTbl := edtMySQLFactTbl.Text;
  MySQLFamilyTbl := edtMySQLFamilyTbl.Text;
  MySQLIndividualTbl := edtMySQLIndividualTbl.Text;
  MySQLNoteTbl := edtMySQLNoteTbl.Text;
  MySQLRelationTbl := edtMySQLRelationTbl.Text;
  MySQLSourceTbl := edtMySQLSourceTbl.Text;
  MySQLCitationTbl := edtMySQLCitationTbl.Text;
  MySQLChildTbl := edtMySQLChildTbl.Text;

end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.FormShow(Sender: TObject);
begin
  { Populate General Options tab }
  chkCalcStats.Checked := CalcStats;
  chkRemoveQuotes.Checked := RemoveQuotes;
  edtParaSep.Text := ParaSep;
  chkWrap.Checked := Wrap;
  edtWrapCol.Text := inttostr(WrapCol);
  edtWrapCol.Enabled := chkWrap.Checked;

  { Populate Delimited File Options tab }
  chkSaveToDF.Checked := SaveToDF;
  chkSaveAfterProc.Checked := SaveDFAfterProc;
  edtDelim.Text := Delim;
  edtQuote.Text := Quote;
  edtDFOutputDir.Text := DFOutputDir;
  edtFactList.Text := FactListFile;
  edtFamilyList.Text := FamilyListFile;
  edtIndividualList.Text := IndividualListFile;
  edtNoteList.Text := NoteListFile;
  edtRelationList.Text := RelationListFile;
  edtSourceList.Text := SourceListFile;
  edtCitationList.Text := CitationListFile;
  edtChildList.Text := ChildListFile;

  { Populate MS Access DB Options tab }
  chkSaveToMDB.Checked := SaveToMDB;
  edtMDBFilename.Text := MDBFilename;
  edtFactTbl.Text := FactTbl;
  edtFamilyTbl.Text := FamilyTbl;
  edtIndividualTbl.Text := IndividualTbl;
  edtNoteTbl.Text := NoteTbl;
  edtRelationTbl.Text := RelationTbl;
  edtSourceTbl.Text := SourceTbl;
  edtCitationTbl.Text := CitationTbl;
  edtChildTbl.Text := ChildTbl;
  if MDBVersion = '30' then
    rbtAccessVer30.Checked := True
  else if MDBVersion = '40' then
    rbtAccessVer40.Checked := True;

  { Populate PHP MySQL Options }
  edtFTPServer.Text := FTPServer;
  edtFTPUser.Text := FTPUser;
  edtFTPPassword.Text := FTPPassword;
  chkFTPPasswordSave.Checked := FTPPasswordSave;
  edtFTPPath.Text := FTPPath;
  edtHTTPServer.Text := HTTPServer;
  edtMySQLDB.Text := MySQLDB;
  edtMySQLUser.Text := MySQLUser;
  edtMySQLPassword.Text := MySQLPassword;
  chkMySQLPasswordSave.Checked := MySQLPasswordSave;
  edtMySQLFactTbl.Text := MySQLFactTbl;
  edtMySQLFamilyTbl.Text := MySQLFamilyTbl;
  edtMySQLIndividualTbl.Text := MySQLIndividualTbl;
  edtMySQLNoteTbl.Text := MySQLNoteTbl;
  edtMySQLRelationTbl.Text := MySQLRelationTbl;
  edtMySQLSourceTbl.Text := MySQLSourceTbl;
  edtMySQLCitationTbl.Text := MySQLCitationTbl;
  edtMySQLChildTbl.Text := MySQLChildTbl;

end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.chkWrapClick(Sender: TObject);
begin
  { Toggle word wrap checkbox }
  edtWrapCol.Enabled := chkWrap.Checked;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.btnDefaultsClick(Sender: TObject);
begin
  { Populate General Options tab }
  chkCalcStats.Checked := DefaultCalcStats;
  chkRemoveQuotes.Checked := DefaultRemoveQuotes;
  edtParaSep.Text := DefaultParaSep;
  chkWrap.Checked := DefaultWrap;
  edtWrapCol.Text := inttostr(DefaultWrapCol);
  edtWrapCol.Enabled := chkWrap.Checked;

  { Populate Delimited File Options tab }
  chkSaveToDF.Checked := DefaultSaveToDF;
  chkSaveAfterProc.Checked := DefaultSaveAfterProc;
  edtDelim.Text := DefaultDelim;
  edtQuote.Text := DefaultQuote;
  edtDFOutputDir.Text := DefaultDFOutputDir;
  edtFactList.Text := DefaultFactListFile;
  edtFamilyList.Text := DefaultFamilyListFile;
  edtIndividualList.Text := DefaultIndividualListFile;
  edtNoteList.Text := DefaultNoteListFile;
  edtRelationList.Text := DefaultRelationListFile;
  edtSourceList.Text := DefaultSourceListFile;
  edtCitationList.Text := DefaultCitationListFile;
  edtChildList.Text := DefaultChildListFile;

  { Populate MS Access DB Options tab }
  chkSaveToMDB.Checked := DefaultSaveToMDB;
  edtMDBFilename.Text := DefaultMDBFilename;
  edtFactTbl.Text := DefaultFactTbl;
  edtFamilyTbl.Text := DefaultFamilyTbl;
  edtIndividualTbl.Text := DefaultIndividualTbl;
  edtNoteTbl.Text := DefaultNoteTbl;
  edtRelationTbl.Text := DefaultRelationTbl;
  edtSourceTbl.Text := DefaultSourceTbl;
  edtCitationTbl.Text := DefaultCitationTbl;
  edtChildTbl.Text := DefaultChildTbl;
  rbtAccessVer40.Checked := True;

  { Populate PHP MySQL Options }
  edtFTPServer.Text := DefaultFTPServer;
  edtFTPUser.Text := DefaultFTPUser;
  edtFTPPassword.Text := DefaultFTPPassword;
  chkFTPPasswordSave.Checked := DefaultFTPPasswordSave;
  edtFTPPath.Text := DefaultFTPPath;
  edtHTTPServer.Text := DefaultHTTPServer;
  edtMySQLDB.Text := DefaultMySQLDB;
  edtMySQLUser.Text := DefaultMySQLUser;
  edtMySQLPassword.Text := DefaultMySQLPassword;
  chkMySQLPasswordSave.Checked := DefaultMySQLPasswordSave;
  edtMySQLFactTbl.Text := DefaultMySQLFactTbl;
  edtMySQLFamilyTbl.Text := DefaultMySQLFamilyTbl;
  edtMySQLIndividualTbl.Text := DefaultMySQLIndividualTbl;
  edtMySQLNoteTbl.Text := DefaultMySQLNoteTbl;
  edtMySQLRelationTbl.Text := DefaultMySQLRelationTbl;
  edtMySQLSourceTbl.Text := DefaultMySQLSourceTbl;
  edtMySQLCitationTbl.Text := DefaultMySQLCitationTbl;
  edtMySQLChildTbl.Text := DefaultMySQLChildTbl;

end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtMDBFilenameBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtMDBFilename.Text;
  if OpenDialog1.Execute then begin
    edtMDBFilename.Text := OpenDialog1.FileName;
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.LMDEditMouseEnter(Sender: TObject);
begin
  { Highlighting ON edit box }
  if Sender is TLMDEdit then begin
    TLMDEdit(Sender).Bevel.LightColor := clNavy;
    TLMDEdit(Sender).Bevel.ShadowColor := clNavy;
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.LMDEditMouseExit(Sender: TObject);
begin
  { Highlighting OFF edit box }
  if Sender is TLMDEdit then begin
    TLMDEdit(Sender).Bevel.LightColor := clGray;
    TLMDEdit(Sender).Bevel.ShadowColor := clGray;
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtFactListBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtFactList.Text;
  if OpenDialog1.Execute then begin
    edtFactList.Text := extractfilename(OpenDialog1.FileName);
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtFamilyListBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtFamilyList.Text;
  if OpenDialog1.Execute then begin
    edtFamilyList.Text := extractfilename(OpenDialog1.FileName);
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtIndividualListBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtIndividualList.Text;
  if OpenDialog1.Execute then begin
    edtIndividualList.Text := extractfilename(OpenDialog1.FileName);
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtNoteListBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtNoteList.Text;
  if OpenDialog1.Execute then begin
    edtNoteList.Text := extractfilename(OpenDialog1.FileName);
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtRelationListBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtRelationList.Text;
  if OpenDialog1.Execute then begin
    edtRelationList.Text := extractfilename(OpenDialog1.FileName);
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtSourceListBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtSourceList.Text;
  if OpenDialog1.Execute then begin
    edtSourceList.Text := extractfilename(OpenDialog1.FileName);
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtCitationListBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtCitationList.Text;
  if OpenDialog1.Execute then begin
    edtCitationList.Text := extractfilename(OpenDialog1.FileName);
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtHTTPServerChange(Sender: TObject);
var
  CleanName: string;
begin
  { Remove HTTP:// from URL }
  CleanName := StringReplace(edtHTTPServer.Text, 'http://', '', [rfIgnoreCase]);
  edtHTTPServer.Text := CleanName;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtDFOutputDirBtnClick(Sender, Btn: TObject; index: Integer);
begin
  DirDlg.CaptionTitle := 'Select a directory for delimited file output...';
  DirDlg.InitialDir := extractfilepath(Application.ExeName);
  DirDlg.Execute;
  edtDFOutputDir.Text := DirDlg.Path;

end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.btnTestConnectClick(Sender: TObject);
var
  LastError: string;
  LastResp: string;
  Vars: TStringList;
begin
  { Test server connection }
  Vars := TStringList.Create;
  Vars.Add('<?php');
  Vars.Add('$database = "' + MySQLDB + '";');
  Vars.Add('$username = "' + MySQLUser + '";');
  Vars.Add('$password = "' + MySQLPassword + '";');
  Vars.Add('?>');
  Vars.SaveToFile(ExtractFilePath(Application.ExeName) + 'script2.php');
  with frmConnection do begin
    Caption := 'Testing Connection';
    UpdStatus('Connecting to ' + FTPServer + '...');
    Show;
    with frmMain.FTP do begin
      Host := edtFTPServer.Text;
      Username := edtFTPUser.Text;
      Password := edtFTPPassword.Text;
      lblStatus.Update;
      try
        try
          Connect(True);
          { Change to FTP directory }
          if FTPPath <> '' then begin
            UpdStatus('Changing directory to ' + FTPPath + '...');
            ChangeDir(FTPPath);
          end;
          { Create variables file }
          UpdStatus('Uploading ' + VarsFile + '...');
          Put(ExtractFilePath(Application.ExeName) + 'script2.php', VarsFile, False);
          DeleteFile(ExtractFilePath(Application.ExeName) + 'script2.php');
          { Create functions file }
          UpdStatus('Uploading ' + FncsFile + '...');
          Put(extractfilepath(Application.ExeName) + 'script.php', FncsFile, False);
          { Test connection }
          UpdStatus('Attempting database connection...');
          with frmMain.HTTP1 do begin
            LastResp := Get('http://' + edtHTTPServer.Text + '/' + FncsFile + '?action=test');
          end;
          { Delete test files }
          UpdStatus('Deleting ' + VarsFile + '...');
          Delete(VarsFile);
          UpdStatus('Deleting ' + FncsFile + '...');
          Delete(FncsFile);
        except
          on EidProtocolReplyError do
            LastError := LastCmdResult.Text[0];
        end;
      finally
        if LastResp = 'Connected' then
          lblStatus.Caption := 'Test succeeded!'
        else begin
          lblStatus.Caption := 'Test failed!';
          lblError.Caption := 'Reason: ' + LastResp;
        end;
        Disconnect;
        btnOK.Visible := True;
        //StrStream.Free;
        Vars.Free;
      end;
    end;
  end;
end;

{ ---------------------------------------------------------------------------- }
{ Make sure there is a trailing '\' on directory names }
procedure TfrmPrefs.edtDFOutputDirChange(Sender: TObject);
begin
  if edtDFOutputDir.Text <> '' then begin
    if not AnsiEndsText('\', edtDFOutputDir.Text) then begin
      edtDFOutputDir.Text := edtDFOutputDir.Text + '\';
    end;
  end;
end;

{ ---------------------------------------------------------------------------- }

procedure TfrmPrefs.edtChildListBtnClick(Sender, Btn: TObject;
  index: Integer);
begin
  { Open file selection dialog }
  OpenDialog1.FileName := edtChildList.Text;
  if OpenDialog1.Execute then begin
    edtChildList.Text := extractfilename(OpenDialog1.FileName);
  end;
end;

{ ---------------------------------------------------------------------------- }

end.

