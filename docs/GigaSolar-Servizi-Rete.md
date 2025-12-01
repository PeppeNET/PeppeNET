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

Questa pagina è dedicata ai **collaboratori interni** che lavorano in **VPN** e devono accedere ai servizi aziendali (NAS, CRM, WordPress, ecc.).

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

## 🖥️ Server applicativi interni

> Gli indirizzi possono essere usati sia per IP diretto che per nome (se il DNS interno è configurato sul PC).

### 1. Sito WordPress GigaSolar (DEV)

- **Nome interno:**  
  `http://wp-gigasolar.gigasolar.local`
- **IP diretto (esempio):**  
  `http://192.168.14.41/`
- **Uso:**  
  Sviluppo e test del sito web GigaSolar prima della pubblicazione ufficiale.

---

### 2. CRM interno

- **Nome interno:**  
  `http://crm.gigasolar.local`
- **IP diretto (esempio):**  
  `http://192.168.14.42/`
- **Uso:**  
  Gestione contatti, lead, opportunità commerciali, attività e follow-up clienti.

---

### 3. Calendario / Groupware

- **Nome interno:**  
  `http://calendar.gigasolar.local`
- **Uso:**  
  Calendari condivisi, gestione appuntamenti, pianificazione attività interne.

---

## 🧭 Suggerimenti operativi

- Se l’indirizzo tipo `nome.gigasolar.local` **non funziona**, provare prima con l’**IP diretto** indicato.  
- Se non si riesce ad aprire una share (`\\192.168.10.70\social` ecc.):
  - Verificare di essere **connessi alla VPN**
  - Verificare di avere i **permessi** sulla cartella (contattare amministrazione IT)
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

> **Suggerimento:** tieni sempre a portata il collegamento “Servizi-GigaSolar” sul Desktop, creato automaticamente dallo script di installazione VPN.
