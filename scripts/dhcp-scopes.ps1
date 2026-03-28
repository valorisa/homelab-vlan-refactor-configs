# Create-DHCPScopes.ps1 - Création des étendues DHCP Windows Server 2022
# Projet : homelab-vlan-refactor-configs
# Source : Transcription iMot3k - VLAN Grand Remplacement
# Requires: DHCP Server Role installed on Windows Server 2022

$Scopes = @(
    @{Name="VLAN10-Admin"; Start="10.20.10.100"; End="10.20.10.200"; Mask="255.255.255.0"; Gateway="10.20.10.254"},
    @{Name="VLAN50-PC"; Start="10.20.50.100"; End="10.20.50.200"; Mask="255.255.255.0"; Gateway="10.20.50.254"},
    @{Name="VLAN100-IoT"; Start="10.20.100.100"; End="10.20.100.200"; Mask="255.255.255.0"; Gateway="10.20.100.254"},
    @{Name="VLAN200-VoIP"; Start="10.20.200.100"; End="10.20.200.200"; Mask="255.255.255.0"; Gateway="10.20.200.254"},
    @{Name="VLAN1000-Merdouille"; Start="10.20.1000.100"; End="10.20.1000.200"; Mask="255.255.255.0"; Gateway="10.20.1000.254"}
)

foreach ($Scope in $Scopes) {
    Write-Host "Création de l'étendue $($Scope.Name)..." -ForegroundColor Cyan
    
    Add-DhcpServerv4Scope -Name $Scope.Name `
        -StartRange $Scope.Start -EndRange $Scope.End `
        -SubnetMask $Scope.Mask -LeaseDuration 8.00:00:00 `
        -ErrorAction SilentlyContinue
    
    Add-DhcpServerv4OptionValue -ScopeId $Scope.Start `
        -DnsDomain "imot3k.lan" -DnsServer 10.20.10.2 `
        -Router $Scope.Gateway `
        -ErrorAction SilentlyContinue
    
    Write-Host "  -> Étendue $($Scope.Name) créée avec succès" -ForegroundColor Green
}

Write-Host "`nToutes les étendues DHCP ont été créées." -ForegroundColor Green
