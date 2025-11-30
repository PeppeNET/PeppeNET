# GigaSolar - VPN profile creator (L2TP/IPsec) - User only + self-delete (solo PS1)

$VpnConnectionName = "GigaSolar VPN"
$VpnServerAddress  = "he908hzgbe5.sn.mynetname.net"
$VpnPreSharedKey   = "dP5gEh76FQJeXEQQ"
$VpnDnsSuffix      = "gigasolar.local"
$SplitTunneling    = $false

# Percorso dello script (serve per auto-cancellarsi)
$scriptPath = $MyInvocation.MyCommand.Path

function Remove-SelfPs1 {
    if ($scriptPath -and (Test-Path -LiteralPath $scriptPath)) {
        try { Remove-Item -LiteralPath $scriptPath -Force -ErrorAction SilentlyContinue } catch {}
    }
}

Write-Host ""
Write-Host "GigaSolar - Setup profilo VPN '$VpnConnectionName' (utente corrente)" -ForegroundColor Cyan
Write-Host ""

# --- Se esiste già il profilo, lo rimuovo (idempotenza) ---
try {
    $existing = Get-VpnConnection -Name $VpnConnectionName -ErrorAction SilentlyContinue
} catch {
    $existing = $null
}

if ($null -ne $existing) {
    Write-Host "Profilo esistente trovato. Lo rimuovo..." -ForegroundColor Yellow
    try {
        Remove-VpnConnection -Name $VpnConnectionName -Force -PassThru | Out-Null
        Write-Host "Profilo precedente rimosso." -ForegroundColor DarkYellow
    } catch {
        Write-Host "Impossibile rimuovere il profilo esistente:" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        Remove-SelfPs1
        exit 1
    }
}

# --- Creo il nuovo profilo VPN (solo per questo utente) ---
$pars = @{
    Name                 = $VpnConnectionName
    ServerAddress        = $VpnServerAddress
    TunnelType           = 'L2tp'
    L2tpPsk              = $VpnPreSharedKey
    EncryptionLevel      = 'Required'
    AuthenticationMethod = 'MSChapv2'
    RememberCredential   = $true
    Force                = $true
}
if ($SplitTunneling) { $pars.SplitTunneling = $true }
if ($VpnDnsSuffix)    { $pars.DnsSuffix      = $VpnDnsSuffix }

try {
    Add-VpnConnection @pars | Out-Null
    Write-Host ""
    Write-Host "Profilo VPN creato: $VpnConnectionName" -ForegroundColor Green
    Write-Host "Vai in Impostazioni -> Rete e Internet -> VPN per connetterti." -ForegroundColor Green
} catch {
    Write-Host "Errore durante la creazione del profilo VPN:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Remove-SelfPs1
    exit 1
}

# --- Cancella solo il file PS1 locale ---
Remove-SelfPs1
