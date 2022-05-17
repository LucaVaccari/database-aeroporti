## Analisi

Allo scopo di realizzare un software per la gestione dei controlli passeggeri e merci nei vari punti di dogana di un aeroporto internazionale, si procede innanzitutto con la progettazione di una base dati, individuando le seguenti entità.
 - FUNZIONARIO: rappresenta la persona incaricata di interagire con il sistema informatico, registrando i dati dei vari controlli. Presenta i seguenti attributi:
   - id_funzionario: stringa utilizzata per accedere al sistema identificando univocamente ciascun funzionario
   - password: stringa utilizzata per l'autenticazione presso il sistema
 - ADDETTO: rappresenta la persona che effettua i controlli comunicandone i dati al funzionario che li registrerà nel sistema. Presenta i seguenti attributi:
   - id_addetto: intero utilizzato per identificare univocamente ciascun addetto
 - CONTROLLO: rappresenta i dati generici di un controllo (sia passeggeri che merci). Presenta i seguenti attributi:
   - id_controllo: intero utilizzato per identificare univocamente ciascun controllo
   - punto_controllo: codice del punto di dogana in cui il controllo è effettuato (a scelta da un insieme di codici possibili)
   - inizio_controllo: data e ora dell'inizio del controllo
   - durata_controllo: intero che esprime i minuti trascorsi dall'inizio del controllo alla fine di esso
   - note: testo che riporta eventuali note del funzionario
   - chiuso: valore booleano indicante lo stato di chiusura del controllo
 - CONTESTAZIONE: rappresenta una contestazione diretta ad un controllo. Presenta i seguenti attributi:
   - id_contestazione: intero utilizzato per identificare univocamente ciascuna contestazione
   - descrizione: testo contenente il motivo ed altri dati della contestazione
 - CONTROLLO MERCI: rappresenta i dati specifici di un controllo effettuato sulle merci. Presenta i seguenti attributi:
   - id_controllo_merci: intero utilizzato per identificare univocamente ciascun controllo merci
   - esito: esito del controllo merci (a scelta da un insieme di possibili esiti)
   - dazi: intero contenente la somma dei dazi doganali associati alla merce
   - categoria: categoria delle merci (a scelta da un insieme di possibili valori)
   - quantita: decimale contenente la massa totale (espressa in chilogrammi) delle merci controllate 
   - note: testo contente eventuali note riguardo al controllo
 - CONTROLLO PASSEGGERI: rappresenta i dati specifici di un controllo effettuato sui passeggeri. Presenta i seguenti attributi:
   - id_controllo_passeggeri: intero utilizzato per identificare univocamente ciascun controllo passeggeri
   - esito: esito del controllo passeggeri (a scelta da un insieme di possibili esiti)
   - nome: stringa contenente il nome del passeggero controllato
   - cognome: stringa contenente il cognome del passeggero controllato
   - aeroporto_partenza: stringa contenente il nome dell'aeroporto da cui il passeggero è partito
   - aeroporto_arrivo: stringa contenente il nome dell'aeroporto dove il passeggero è diretto
   - nazionalita: stringa contentente la nazionalità del passeggero controllato
   - tipo_documento: tipo del documento utilizzato per identificare il passeggero (valore a scelta fra "carta d'identità" o "passaporto")
   - n_documento: stringa contentente il codice identificativo del documento
   - motivo_viaggio: stringa contenenti il motivo del viaggio
   - note: testo contente eventuali note riguardo al controllo

### Considerazioni

I controlli sulle merci sono considerati separati dai controlli sui passeggeri.
Con "merci" ci si riferisce infatti al carico trasportato da aerei cargo e non comprende quindi gli oggetti trasportati dai passeggeri.

Si considera in servizio in un determinato giorno un addetto che in quel giorno ha effettuato almeno un controllo.

Gli unici abilitati all'interazione con il sistema sono i funzionari.

### Relazioni

Le entità individuate presentano fra loro le seguenti relazioni:
 - RESPONSABILITA (FUNZIONARIO-ADDETTO): di cardinalità 1 ad N, in quanto ciascun funzionario è responsabile di un insieme di addetti, i quali sono sotto la responsabilità di quel solo funzionario;
 - EFFETTUARE (ADDETTO-CONTROLLO): di cardinalità 1 ad N, in quanto ciascun addetto effettua più controlli e ciascun controllo è effettuato da un solo addetto;
 - CONTROLLARE MERCI (CONTROLLO-CONTROLLO MERCI) e CONTROLLARE PASSEGGERI (CONTROLLO-CONTROLLO PASSEGGERI): entrambe di cardinalità 1 ad N, in quanto un controllo passegeri od un controllo merci sono sempre associati ad un solo controllo generico, verrà assicurato dall'applicazione che un controllo generico sia associato unicamente ad un controllo specifico. La scelta della cardinalità 1 ad N è dettatta dalla necessità di dividere gli attributi non comuni a controlli merci e personale da quelli comuni ad entrambi;
 - PRESENTARE (CONTROLLO-CONTESTAZIONE), di cardinalità 1 ad N, in quanto a ciascun controllo possono essere dirette più contestazioni, mentre una contestazione è diretta ad un solo controllo.

Le considerazioni effettuate permettono di rappresentare la struttura della base dati mediante il modello Entità/Relazioni.

## Modello E/R

** TODO: modello E/R **

Dal modello E/R è possibile derivare il modello logico o schema.

## Modello logico

Legenda: **chiave_primaria**, *chiave_esterna*

funzionari(**id_funzionario**, password)
addetti(**id_addetto**, *id_funzionario*)
controlli(**id_controllo**, punto_controllo, inizio_controllo, durata_controllo, note, chiuso, *id_addetto*)
contestazioni(**id_contestazione**, descrizione, *id_controllo*)
controlli_merci(**id_controllo_merci**, esito, dazi, descrizione, categoria, quantita, *id_controllo*)
controlli_passeggeri(**id_controllo_passeggeri**, esito, nome, cognome, nazionalita, aeroporto_partenza, aeroporto_arrivo, tipo_documento, n_documento, motivo_viaggio, note, *id_controllo*)