# Day 4: Camp Cleanup

function Main {
    $input = Import-Csv -Path .\input.csv -Header 'Elf1', 'Elf2'
    $countA, $countB = 0

    ForEach ($Pair in $input) {
        $Elf1 = $Pair.Elf1 -Split '-' | 
            ForEach-Object { [int]$_ }
        $Elf2 = $Pair.Elf2 -Split '-' | 
            ForEach-Object { [int]$_ }

        # Part A
        if (($Elf1[0] -ge $Elf2[0]) -and 
            ($Elf1[1] -le $Elf2[1])) {
            $countA++
        }
        elseif (($Elf1[0] -le $Elf2[0]) -and 
            ($Elf1[1] -ge $Elf2[1])) {
            $countA++
        }

        # Part B
        if (($Elf2[0] -in $Elf1[0]..$Elf1[1]) -or 
            ($Elf2[1] -in $Elf1[0]..$Elf1[1])) {
            $countB++
        }
        elseif (($Elf1[0] -in $Elf2[0]..$Elf2[1]) -or 
            ($Elf1[1] -in $Elf2[0]..$Elf2[1])) {
            $countB++
        }
    }

    Write-Host "Part A: $countA"
    Write-Host "Part B: $countB"
}

Main
