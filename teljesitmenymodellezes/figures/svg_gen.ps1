"SVG2LATEX GENERATOR"

$new_ext = ".pdf"

Foreach ($file in Get-Childitem)
{
    If ($file.extension -eq ".svg")
    {
        $file.name
        if ($file.length -gt 1000000)
        {
            "Too large! Skipped."
            continue
        }
        
        $target = $file.name.Replace(".svg",$new_ext);
        
	# Ha van már ilyen fájl
	if (Test-Path $target)
	{
		if ($file.LastWriteTime -lt (Get-Item $target).LastWriteTime)
		{
			Write-Output "   The image file is up to date. Skipped." 
			Write-Output "   (.svg file creation time: $($file.CreationTime), .pdf file creation time: $((Get-Item $target).CreationTime)"
			continue
		}
	}
        
	# Parancs futtatása
        & "inkscape.exe" "-D" "-z" ("--file=" + $file.name) ("--export-pdf=" + $target) "--export-latex"
	& "inkscape.exe" "-D" "-z" ("--file=" + $file.name) ("--export-pdf=pic_" + $target)
		
	#Exportáljuk ki png-be is az egyszerűség kedvéért
		& "inkscape.exe" "--export-area-drawing" ("--file=" + $file.name) ("--export-png=" + $target.Replace($new_ext,".png"))
    }
}

""
"Finished."
