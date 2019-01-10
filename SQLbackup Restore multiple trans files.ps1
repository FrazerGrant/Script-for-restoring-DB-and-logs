 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")

    $fileName = New-Object System.Windows.Forms.OpenFileDialog
    $fileName.initialDirectory = "MyComputer"
    $fileName.filter = "SQL backup (*.bak)| *.bak"
    $fileName.Title = "Select DB Backup file"

  if($fileName.ShowDialog() -eq "OK") {
                
        $databaseName = ($fileName.SafeFileName -split '_')[0]
        $databaseLocation = $fileName.FileName.Replace($fileName.SafeFileName,"")
        
}   
        $outputFile = "Restore Database - Script.sql"
 
        Set-Content $outputFile ""
        Add-Content $outputFile "USE master"
      
      foreach ($file in  get-childitem ($databaseLocation) | sort-object LastWriteTime )
        {
            if ($file.Extension -eq '.trn')
            {
                Add-Content $outputFile "RESTORE LOG $databaseName FROM DISK = '$($file.FullName)' WITH NORECOVERY;"    
            }
        }
        Add-Content $outputFile "RESTORE DATABASE $databaseName WITH RECOVERY";      
        Write-Host("Script generated at $outputFile");
               
 