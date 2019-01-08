-- VENDAS AUTO SERVI�O ! ! !
-- SOMA DOS LAN�AMENTOS COM PED 9999999  V1 ,      SOMA DOS ITSAIDA    VL2  --  VL DIV = VL1-VL2

WITH LANCTO AS 
(
     SELECT CODFIL, DATENT, SERIE, NUMNOT, SUM(VALLAN) VLLAN
       FROM CXA_LANCTO
      WHERE CODFIL = &CODFIL
        AND DATENT = '&DATA'
        AND STATUS = 2
        AND NUMPED BETWEEN 1 AND 1000000
        AND NUMPED IS NOT NULL
      GROUP BY CODFIL, DATENT, SERIE, NUMNOT, NUMPED 
),
     CUPOM AS
(
      SELECT CODFIL, DTNOTA, SERIE, NUMNOTA, SUM(VLTOTITEM) VLCF
        FROM MOV_ITSAIDA
       WHERE CODFIL = &CODFIL
         AND DTNOTA = '&DATA'
         AND STATUS <> 9
         AND TPNOTA = 512
         AND NUMPEDVEN = 999999
       GROUP BY CODFIL, DTNOTA, SERIE, NUMNOTA
)
SELECT CUPOM.CODFIL
      ,CUPOM.DTNOTA
      ,CUPOM.SERIE
      ,CUPOM.NUMNOTA
      ,SUM(CUPOM.VLCF) TOT_CUPOM
      ,SUM(LANCTO.VLLAN) TOT_LANCTO
      ,(SUM(LANCTO.VLLAN) - SUM(CUPOM.VLCF)) DIV
  FROM CUPOM
 INNER JOIN LANCTO    ON CUPOM.CODFIL    = LANCTO.CODFIL
                     AND CUPOM.DTNOTA    = LANCTO.DATENT
                     AND CUPOM.SERIE     = LANCTO.SERIE
                     AND CUPOM.NUMNOTA   = LANCTO.NUMNOT
 GROUP BY CUPOM.CODFIL
         ,CUPOM.DTNOTA
         ,CUPOM.SERIE
         ,CUPOM.NUMNOTA
HAVING (SUM(LANCTO.VLLAN) - SUM(CUPOM.VLCF)) >= 0.03 OR (SUM(LANCTO.VLLAN) - SUM(CUPOM.VLCF)) <= -0.03
ORDER BY CUPOM.NUMNOTA





-----------------------
-- Verifica cupom sem lancto


SELECT MS.CODFIL, MS.NUMNOTA, MS.SERIE, MS.NUMPEDVEN, MS.DTNOTA, MS.VLTOTAL, MS.STATUS AS "STATUS CF", CL.STATUS AS "STATUS LANCTO", SUM(CL.VALLAN) AS VLLANCTO
FROM   CXA_LANCTO CL
LEFT  JOIN MOV_SAIDA MS  ON MS.CODFIL = CL.CODFIL
		         AND MS.DTNOTA = CL.DATENT
		         AND MS.SERIE = CL.SERIE
		         AND MS.NUMNOTA = CL.NUMNOT
WHERE  MS.CODFIL = &CODFIL
       AND MS.DTATUEST >= TO_DATE('&DATA1 00:00:00', 'DD/MM/YYYY HH24:MI:SS')
       AND MS.DTATUEST <= TO_DATE('&DATA2 23:59:59', 'DD/MM/YYYY HH24:MI:SS')
       AND MS.DTNOTA = TO_DATE('&DATA1', 'DD/MM/YYYY')
       AND MS.STATUS <> 9
       AND MS.TPNOTA = 512
       AND CL.STATUS IS NULL -- AQUI VERIFICAR SE TEM....
       AND MS.NUMPEDVEN > 0
       AND MS.NUMPEDVEN < 1000000
GROUP  BY MS.CODFIL, MS.NUMNOTA, MS.SERIE, MS.NUMPEDVEN, MS.DTNOTA, MS.VLTOTAL, MS.STATUS, CL.STATUS
ORDER  BY NUMNOTA;
