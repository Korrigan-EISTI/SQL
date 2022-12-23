SELECT DISTINCT(*) FROM hotel
    WHERE hotel_id not in (SELECT hotel_id where propose_consommation);