unit Connection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdFTP, LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, LMDCustomSimpleLabel, LMDSimpleLabel, StdCtrls,
  LMDCustomButton, LMDButton, LMDCustomComponent, lmdcont, IdHTTP;

type
  TfrmConnection = class(TForm)
    lblStatus: TLabel;
    lblError: TLabel;
    btnOK: TLMDButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdStatus(const aText: string);
  end;

var
  frmConnection: TfrmConnection;

implementation

{$R *.dfm}

uses
  main;

{ TfrmConnection }


procedure TfrmConnection.btnOKClick(Sender: TObject);
begin
  { Close connection window and hide ok button }
  Close;
  btnOK.Visible := False;
  lblError.Caption := '';
end;

procedure TfrmConnection.UpdStatus(const aText: string);
begin
  { Update status label with new text and refresh }
  lblStatus.Caption := aText;
  lblStatus.Update;
end;

end.
