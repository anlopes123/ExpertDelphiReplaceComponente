unit UnitPrincipalWizard;

interface

uses ToolsAPI, VCL.Menus, System.SysUtils, VCL.Dialogs, UnitFormReplaceComponent;

type
  TWizardReplaceComponent = class(TInterfacedObject, IOTAWizard)
  private
    FPrincipal, FItemPrincipal: TMenuItem;

    procedure onWizarClick(sender: TObject);
  public
    constructor Create;

    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;

    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;

  end;

procedure register;

const WizardFail = -1;

var FIndexWizard: Integer = WizardFail;

implementation

{ TWizardReplaceComponent }

procedure register;
begin
 FIndexWizard:=(BorlandIDEServices as IOTAWizardServices).AddWizard(TWizardReplaceComponent.Create);
end;

procedure TWizardReplaceComponent.AfterSave;
begin

end;

procedure TWizardReplaceComponent.BeforeSave;
begin

end;

constructor TWizardReplaceComponent.Create;
begin
  if not Assigned(FItemPrincipal) then
  begin
     FItemPrincipal:= TMenuItem.Create(nil);
     FItemPrincipal.Caption:= 'Replace Component';
     FItemPrincipal.OnClick:= onWizarClick;
  end;
  if not Assigned(FPrincipal) then
  begin
     FPrincipal:= TMenuItem.Create(nil);
     FPrincipal.Caption:= 'Wizard';
     FPrincipal.Add(FItemPrincipal);
  end;

  if not Assigned((BorlandIDEServices as INTAServices).MainMenu.Items.Find('Wizard')) then
    (BorlandIDEServices as INTAServices).MainMenu.Items.Add(FPrincipal);

end;

procedure TWizardReplaceComponent.Destroyed;
begin
   if Assigned(FItemPrincipal) then
      FreeAndNil(FItemPrincipal);
   if Assigned(FPrincipal) then
      FreeAndNil(FPrincipal);
end;

procedure TWizardReplaceComponent.Execute;
begin

end;

function TWizardReplaceComponent.GetIDString: string;
begin
  Result:= 'anizair.lopes.GetIDString';
end;

function TWizardReplaceComponent.GetName: string;
begin
  Result:= 'anizair.lopes.GetName';
end;

function TWizardReplaceComponent.GetState: TWizardState;
begin
  Result:= [wsEnabled];
end;

procedure TWizardReplaceComponent.Modified;
begin

end;

procedure TWizardReplaceComponent.onWizarClick(sender: TObject);
var vForm: TFormReplaceComponent;
begin
  //ShowMessage('Estou ativo agora vamos começar de novo.');
  try
     vForm:= TFormReplaceComponent.Create(nil);
     vForm.ShowModal;
  finally
     FreeAndNil(vForm);
  end;

end;

initialization

finalization
  if FIndexWizard <> WizardFail then
    (BorlandIDEServices as IOTAWizardServices).RemoveWizard(FIndexWizard);


end.
