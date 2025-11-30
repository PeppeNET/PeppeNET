# GigaSolar - VPN profile creator (L2TP/IPsec)

$VpnConnectionName = "GigaSolar VPN"
$VpnServerAddress  = "he908hzgbe5.sn.mynetname.net"
$VpnPreSharedKey   = "dP5gEh76FQJeXEQQ"
$VpnDnsSuffix      = "gigasolar.local"
$SplitTunneling    = $false

$principal = New-Object Security.Principal.WindowsPrincipal(
    [Security.Principal.WindowsIdentity]::GetCurrent()
)
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Esegui come amministratore." -ForegroundColor Red
    exit 1
}

$existing = Get-VpnConnection -Name $VpnConnectionName -ErrorAction SilentlyContinue
if ($null -ne $existing) {
    Remove-VpnConnection -Name $VpnConnectionName -Force -PassThru | Out-Null
}

$pars = @{
    Name                 = $VpnConnectionName
    ServerAddress        = $VpnServerAddress
    TunnelType           = 'L2tp'
    L2tpPsk              = $VpnPreSharedKey
    EncryptionLevel      = 'Required'
    AuthenticationMethod = 'MSChapv2'
    AllUserConnection    = $true
    RememberCredential   = $true
    Force                = $true
}
if ($SplitTunneling) { $pars.SplitTunneling = $true }
if ($VpnDnsSuffix)    { $pars.DnsSuffix      = $VpnDnsSuffix }

Add-VpnConnection @pars | Out-Null

Write-Host "Profilo VPN creato: $VpnConnectionName" -ForegroundColor Green
Write-Host "Vai in Impostazioni -> Rete e Internet -> VPN per connetterti."
