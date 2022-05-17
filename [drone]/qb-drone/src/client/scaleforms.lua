Instructional = {}

Instructional.Init = function()
  local scaleform = Scaleforms.LoadMovie('INSTRUCTIONAL_BUTTONS')

  Scaleforms.PopVoid(scaleform,'CLEAR_ALL')
  Scaleforms.PopInt(scaleform,'SET_CLEAR_SPACE',200) 

  return scaleform
end

Instructional.SetControls = function(scaleform,controls)
  for i=1,#controls,1 do
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(i-1)
    for k=1,#controls[i].codes,1 do
      ScaleformMovieMethodAddParamPlayerNameString(GetControlInstructionalButton(0, controls[i].codes[k], true))
    end
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(controls[i].text)
    EndTextCommandScaleformString()
    PopScaleformMovieFunctionVoid()
  end

  Scaleforms.PopVoid(scaleform,'DRAW_INSTRUCTIONAL_BUTTONS')
  --Scaleforms.PopMulti(scaleform,'SET_BACKGROUND_COLOUR',1,1,1,1)
end

Instructional.Create = function(controls)
  local scaleform = Instructional.Init()
  Instructional.SetControls(scaleform,controls)
  return scaleform
end