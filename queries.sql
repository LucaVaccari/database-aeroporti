-- QUERY 1
SELECT punto_controllo,
    nome,
    cognome,
    tipo_documento,
    n_documento,
    motivo_viaggio,
    aeroporto_partenza,
    aeroporto_arrivo,
    nazionalita
FROM controlli_passeggeri
    JOIN controlli USING (id_controllo)
GROUP BY punto_controllo;
-- QUERY 2
SELECT punto_controllo,
    SUM(dazi) AS dazi_totali
FROM controlli_merci
    JOIN controlli USING (id_controllo)
GROUP BY punto_controllo;
-- QUERY 3
SELECT categoria,
    COUNT(id_controllo_merci) AS numero_merci_respinte
FROM controlli_merci
WHERE esito = "respinte"
GROUP BY categoria;
-- QUERY 4
SELECT id_addetto,
    COUNT(id_contestazione) AS numero_contestazioni
FROM contestazioni
    JOIN controlli USING (id_controllo)
GROUP BY id_addetto;
-- QUERY 5
SELECT punto_controllo,
    AVG(durata_controllo) AS durata_media
FROM controlli
WHERE CAST(inizio_controllo AS DATE) = "2022-05-10"
GROUP BY punto_controllo;
-- QUERY 6
SELECT punto_controllo,
    nome,
    cognome,
    tipo_documento,
    n_documento,
    motivo_viaggio,
    aeroporto_partenza,
    aeroporto_arrivo,
    nazionalita
FROM controlli_passeggeri
    JOIN controlli USING (id_controllo)
WHERE esito = "fermo"
    AND YEAR(inizio_controllo) = "2022"
ORDER BY cognome,
    nome
GROUP BY nazionalita;
-- QUERY 7
SELECT id_funzionario,
    id_addetto
FROM controlli
    JOIN addetti USING (id_addetto)
    JOIN funzionari USING (id_funzionario)
WHERE CAST(inizio_controllo AS DATE) = "2022-05-10"
GROUP BY id_funzionario;