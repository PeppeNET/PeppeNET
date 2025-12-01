<p align="left">
  <img src="https://raw.githubusercontent.com/PeppeNET/PeppeNET/main/gigasolar-logo.png" alt="GigaSolar" width="260">
</p>

<h1 align="center">🌐 Servizi interni GigaSolar</h1>
<p align="center">
  <b>Guida rapida ai servizi raggiungibili tramite VPN aziendale</b>
</p>

---

## 🏢 Chi siamo

**GigaSolar Srl** è una società siciliana specializzata in:

- Impianti fotovoltaici e sistemi di accumulo  
- Comunità Energetiche Rinnovabili (CER)  
- Infrastrutture IT e automazione industriale  
- Sviluppo software proprietario (AtomSoft, GigaERP-AI)

Questa pagina è dedicata ai **collaboratori interni** che lavorano in **VPN** e devono accedere ai servizi aziendali (NAS, CRM, Nextcloud, WordPress, ecc.).

---

## 🔐 Prima di tutto: connessione VPN

Per accedere ai servizi interni è necessario:

1. Attivare la connessione **“GigaSolar VPN”** dal PC aziendale/remoto  
2. Utilizzare le credenziali indicate dall’IT GigaSolar  
3. Una volta connessi, i servizi sotto elencati diventano raggiungibili.

In caso di problemi con la VPN, contattare il referente IT.

---

## 💾 NAS & Condivisioni di rete

> NAS principale (file server interno)

- **Indirizzo NAS**  
  `\\192.168.10.70\`

- **Share principali** (esempi, da adattare alla configurazione reale):
  - `\\192.168.10.70\social` – materiale social media, grafica, video  
  - `\\192.168.10.70\dev` – progetti software, sorgenti, documentazione tecnica  
  - `\\192.168.10.70\rt` – documenti Responsabile Tecnico / pratiche tecniche  
  - `\\192.168.10.70\contabilita` – documenti amministrativi e contabili  

> 👉 Accesso consigliato:  
> - Apri **Esplora file** → nella barra digita `\\192.168.10.70\`  
> - Se richiesto, utilizzare credenziali di dominio `GIGASOLAR\utente`.

---

## 🖥️ Server applicativi interni (LAN 192.168.14.0/24)

Gli indirizzi possono essere usati sia come **nome DNS interno** (`*.gigasolar.local`)
sia come **IP diretto**, se il DNS non è risolto correttamente sul PC.

---

### 1. WordPress GigaSolar (DEV)

- **DNS interno:** `wp-gigasolar-dev.gigasolar.local`  
- **IP:** `192.168.14.50`  
- **Uso:** sviluppo e test del sito web GigaSolar prima della pubblicazione ufficiale.

Accesso tipico (browser, in VPN):

- `http://wp-gigasolar-dev.gigasolar.local`
- in alternativa: `http://192.168.14.50/`

---

### 2. CRM interno – SuiteCRM

- **DNS interno:** `crm.gigasolar.local`  
- **IP:** `192.168.14.41`  
- **Uso:** CRM principale GigaSolar (clienti, lead, opportunità, attività).

Accesso tipico:

- `http://crm.gigasolar.local`
- in alternativa: `http://192.168.14.41/`

---

### 3. Nextcloud – File & Calendario

- **DNS file:** `cloud.gigasolar.local`  
- **DNS calendario (alias stessa VM):** `calendar.gigasolar.local`  
- **IP:** `192.168.14.42`  
- **Uso:**
  - Files: condivisione documenti interni
  - Calendari: calendario condiviso, agenda e risorse

Accesso tipico:

- `https://cloud.gigasolar.local`  
- `https://calendar.gigasolar.local`  

*(se inizialmente non è configurato HTTPS, usare `http://`)*

---

### 4. Mail server – Mailcow

- **DNS interno:** `mail.gigasolar.local`  
- **IP:** `192.168.14.43`  
- **Uso:** posta interna, webmail, gestione caselle.

Accesso tipico:

- `https://mail.gigasolar.local`
- in alternativa: `https://192.168.14.43/`

---

### 5. Centralino VoIP – FreePBX

- **DNS interno:** `pbx.gigasolar.local`  
- **IP:** `192.168.14.44`  
- **Uso:** centralino telefonico, gestione interni, trunk, code di chiamata.

Accesso tipico:

- `http://pbx.gigasolar.local`
- in alternativa: `http://192.168.14.44/`

---

### 6. Helpdesk – UVdesk

- **DNS interno:** `help.gigasolar.local`  
- **IP:** `192.168.14.45`  
- **Uso:** sistema di ticketing per supporto interno/esterno.

Accesso tipico:

- `http://help.gigasolar.local`
- in alternativa: `http://192.168.14.45/`

---

### 7. MariaDB (backend LAMP)

- **DNS interno:** `db.gigasolar.local`  
- **IP:** `192.168.14.46`  
- **Uso:** database per applicazioni LAMP interne (es. SuiteCRM, ecc.).

Parametri tipici di connessione (da host autorizzati):

- Host: `db.gigasolar.local`  
- Porta: `3306`

---

### 8. SQL Server – GigaERP / AtomSoft / GigaSolar

- **DNS interno:** `sql.gigasolar.local`  
- **IP:** `192.168.14.75`  
- **Uso:** database principale per GigaERP-AI, AtomSoft, GigaSolar Admin Console, ecc.

Connessione tipica:

- Server: `sql.gigasolar.local`  
- Porta: `1433`

---

### 9. EspoCRM / Reverse Proxy (in evoluzione)

- **DNS interno:** `espcrm.gigasolar.local`  
- **IP:** `192.168.14.40`  
- **Uso attuale / futuro:**  
  - EspoCRM di test  
  - futura VM Reverse Proxy (Nginx) che esporrà i servizi pubblici:
    - `crm.gigasolar.it`
    - `cloud.gigasolar.it`
    - `mail.gigasolar.it`
    - `pbx.gigasolar.it`
    - `help.gigasolar.it`

---

## 🧭 Suggerimenti operativi

- Se un indirizzo tipo `nome.gigasolar.local` **non funziona**:
  - verificare che il PC usi il DNS interno (via VPN),
  - provare con l’IP diretto indicato nella relativa sezione.

- Se non si riesce ad aprire una share (`\\192.168.10.70\social` ecc.):
  - verificare di essere **connessi alla VPN**,
  - verificare i **permessi** sul NAS (utente/gruppo dominio),
  - contattare l’amministrazione IT in caso di accesso negato.

- Non salvare file personali sul NAS: usare solo per attività legate a GigaSolar.

---

## 🌍 Link ufficiali GigaSolar

- 🌐 **Sito web ufficiale:**  
  [https://www.gigasolar.it](https://www.gigasolar.it)

- 💼 **Profilo LinkedIn – Giuseppe Motta (CTO):**  
  [https://www.linkedin.com/in/giuseppe-motta-781138a9](https://www.linkedin.com/in/giuseppe-motta-781138a9)

- 🧑‍💻 **GitHub – PeppeNET (progetti tecnici):**  
  [https://github.com/PeppeNET](https://github.com/PeppeNET)

*(Altri canali social ufficiali verranno aggiunti qui quando attivi.)*

---

## 📌 Nota finale

Questa pagina viene aggiornata dall’area IT GigaSolar.  
In caso di nuovi servizi (nuove VM, nuovi applicativi, nuovi share NAS), verranno aggiunti qui senza richiedere alcuna modifica ai PC dei dipendenti.

> **Suggerimento:** tieni sempre a portata il collegamento **“Servizi-GigaSolar”** sul Desktop, creato automaticamente dallo script di installazione VPN.
