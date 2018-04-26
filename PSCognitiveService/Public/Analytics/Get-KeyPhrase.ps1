Function Get-KeyPhrase {
    [alias("KeyPhrase")]
    [cmdletbinding()]
    param(
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [System.String[]] $Text
    )

    begin {
    }
    process {
        $Object = @()
        if (Test-LocalConfiguration -ServiceName 'Text') {            
            $Object = [Analytics]::new($env:API_SubscriptionKey_TextAnalytics, $env:API_Location_TextAnalytics)
            $Object.getKeyPhrase($Text)     
        }
        Remove-Variable -Name Object
    }
    end {
    }

}
