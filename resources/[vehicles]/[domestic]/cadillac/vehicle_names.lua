function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end
Citizen.CreateThread(function()
    AddTextEntry('CadCTSV', '2016 Cadillac CTS-V') -- Enter Gamename from vehicles.lua and what you want it to display.
    AddTextEntry('GMT900ESCALADE', 'Cadillac Escalade')
end)