PRINT ' '
PRINT ' '
PRINT ' '
PRINT ' -- **************************************'
PRINT ' -- **            SMTI150010.sql ' 
PRINT ' -- **************************************'


 -- Atualiza tabela de controle de scripts executados
insert into gemco_scripts_executados (script, dthrexecucao) select 'SMTI150010.sql', getdate()
go


IF EXISTS (SELECT NAME FROM SYSOBJECTS WHERE NAME = 'EMPRESA_COMPL')
   DROP VIEW dbo.EMPRESA_COMPL
GO

CREATE VIEW DBO.EMPRESA_COMPL AS 
SELECT QTDIASMINDESCANTECIP,
       CODEVECXASOBRA,
       CODEVETRANSFSLDCXA,
       FLQTEMBMOVIMVENDA,
       FLIMPDESC,
       CODEVERECCORRESPBANCARIO,
       FLLIBCREDITOSUP,
       CODEVESANGRIACXA,
       FLFATPARCIAL,
       CODEVERECBENEFICIOINSS,
       FLVENDACONVESP,
       FLCALCDIGPRODLM,
       FLAGREGDESCFRETEITEMPED,
       FLKITPRECODIF,
       AGRUPAJUROZERO,
       FLSIMCARDNRSERIE,
       QTDIGITESNSIMCARD,
       FLSUPCRECOMPOECREDITO,
       FLCOMPNUMTEL,
       FLFATORIV,
       FLATUALSITCREDRECEB,
       FLPDVCPFUNICO,
       SLOGAN,
       TPCOMPCODBARRAS,
       EMITECARNEPDV,
       FLSERIE,
       ESPECIE,
       CODEVECRCDESPBANCARIA,
       FLCREDDEVIDEM,
       CODEVERECCELULAR,
       ALIQIOFSEG,
       CODEVETROCOFACIL,
       CODEVETROCACHEQUE,
       FLMULTIBANDEIRAS,
       GEMCOSPED,
       FLUTILEMBMOVIM,
       FLSERVICOFAM,
       FLVERIFICALOTEVENCTO,
       CODEVESTCTBCRECX,
       CODEVERECBOLETO,
       CODEVEDEVOLAPAR,
       FLCONSULTANOMETIT,
       PERCMINPAGTOTIT,
       FLALTMSGSITCRED,
       FLVALIDANCM,
       FLIMPTOTALIMPOSTO,
       FLECFNFIPI,
       FLCONVERSAOSAIDA,
       TPNOTANFCE,
       FLCONSCLISISCRED,
       FLVDASEGAVISTA,
       FLCANCPAGTOFATURASISCRED, 
       TPNOTAVENDB2C
  FROM GER_EMPRESA_COMPL
go



