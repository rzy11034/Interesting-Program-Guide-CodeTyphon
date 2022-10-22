unit Case03.DragObject;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  Controls,
  Graphics,
  Buttons;

type
  TDragObjectEx = class(TDragControlObjectEx)
  private
    _DragImages: TDragImageList;
  protected
    function GetDragImages: TDragImageList; override;
  public
    constructor Create(NewControl: TControl); override;
    destructor Destroy; override;
  end;

implementation

{ TDragObjectEx }

constructor TDragObjectEx.Create(NewControl: TControl);
var
  bmp: TBitmap;
begin
  inherited Create(NewControl);

  _DragImages := TDragImageList.Create(NewControl);
  AlwaysShowDragImages := true;

  bmp := TBitmap.Create();
  try
    bmp.Width := NewControl.Width;
    bmp.Height := NewControl.Height;

    if NewControl is TWinControl then
      (NewControl as TWinControl).PaintTo(bmp.Canvas, 0, 0);

    _DragImages.Width := bmp.Width;
    _DragImages.Height := bmp.Height;
    _DragImages.Add(bmp, nil);
    _DragImages.DragHotspot := Point(bmp.Width, bmp.Height);
  finally
    bmp.Free;
  end;
end;

destructor TDragObjectEx.Destroy;
begin
  _DragImages.Free;
  inherited Destroy;
end;

function TDragObjectEx.GetDragImages: TDragImageList;
begin
  Result := _DragImages;
end;

end.
