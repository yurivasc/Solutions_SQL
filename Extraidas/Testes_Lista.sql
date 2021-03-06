USE ArquivosAvon
GO

--Delete From Arquivo
--Delete From Log
--GO

Select * From Arquivo (nolock)
Select * From Log     (nolock) Order by Log_ID

-- Select Count(1) From ConversaoFS1 (nolock)
-- Select TOP 100 * From ConversaoFS1 (nolock)

Select Count(1) From FS22        (nolock)
Select * From CargaInicialFS22   (nolock) --Where REGASC= 68332369
Select * From ConversaoFS22      (nolock) --Where REGASC= 68332369
Select * From FS22              (nolock) --Where Revendedora_ID = 68332369
Select * From Revendedora       (nolock) --Where Revendedora_ID = 68332369
Select * From Rev_Telefone      (nolock) --Where Revendedora_ID = 68332369
Select * From Bairro            (nolock) --Where Bairro_ID = 530
Select * From Municipio         (nolock) --Where Municipio_ID = 5125


--Select Count(1) From CS48       (nolock)
--Select * From CargaInicialCS48  (nolock) --Where REGASC= 68332369
--Select * From ConversaoCS48     (nolock) --Where REGASC= 68332369
--Select * From CS48              (nolock) --Where Revendedora_ID = 68332369
--Select * From Revendedora       (nolock) --Where Revendedora_ID = 68332369
--Select * From Rev_Telefone      (nolock) --Where Revendedora_ID = 68332369
--Select * From Bairro            (nolock) --Where Bairro_ID = 530
--Select * From Municipio         (nolock) --Where Municipio_ID = 5125



--Select Count(1) From CS28 (nolock)
--Select * From ConversaoCS28 (nolock) Where REGASC= 68332369
--Select * From CS28 (nolock) Where Revendedora_ID = 68332369
--Select * From Revendedora Where Revendedora_ID = 68332369
--Select * From Rev_Telefone Where Revendedora_ID = 68332369
--Select * From Bairro Where Bairro_ID = 530
--Select * From Municipio Where Municipio_ID = 5125
--Select * From Revendedora Where Revendedora_ID = 67543324
--Select * From Bairro Where Bairro_ID = 529
--Select * From Municipio Where Municipio_ID = 3475

--Select * From Revendedora Where Nome <> '(INDICANTE)'
--Select * From Revendedora Where Nome =  '(INDICANTE)'

--Select Count(1) From CargaInicialCS28 (nolock)
--Select Count(1) From CargaInicialCS48 (nolock)
--Select Count(1) From CargaInicialCS13 (nolock)
--Select Count(1) From CargaInicialFS1  (nolock)
--Select Count(1) From CargaInicialFS22 (nolock)
--Select Count(1) From CargaInicialFS23 (nolock)
--Select Count(1) From CargaInicialFS3  (nolock)
--Select Count(1) From CargaInicialPP28 (nolock)
--Select Count(1) From CargaInicialPP37_Carga (nolock)
--Select Count(1) From CargaInicialPP37_Cadastro (nolock)
--Select Count(1) From CargaInicialBA01 (nolock)

--Select TOP 100 * From CargaInicialCS28 (nolock)
--Select TOP 100 * From CargaInicialCS48 (nolock)
--Select TOP 100 * From CargaInicialCS13 (nolock)
--Select TOP 100 * From CargaInicialFS1  (nolock)
--Select TOP 100 * From CargaInicialFS22 (nolock)
--Select TOP 100 * From CargaInicialFS23 (nolock)
--Select TOP 100 * From CargaInicialFS3  (nolock)
--Select TOP 100 * From CargaInicialPP28 (nolock)
--Select TOP 100 * From CargaInicialPP37_Carga (nolock)
--Select TOP 100 * From CargaInicialPP37_Cadastro (nolock)
--Select TOP 100 * From CargaInicialBA01 (nolock)

--Select TOP 100 * From ConversaoCS28 (nolock)
--Select TOP 100 * From ConversaoCS48 (nolock)
--Select TOP 100 * From ConversaoCS13 (nolock)
--Select TOP 100 * From ConversaoFS1  (nolock)
--Select TOP 100 * From ConversaoFS22 (nolock)
--Select TOP 100 * From ConversaoFS23 (nolock)
--Select TOP 100 * From ConversaoFS3  (nolock)
--Select TOP 100 * From ConversaoPP28 (nolock)
--Select TOP 100 * From ConversaoPP37_Carga (nolock)
--Select TOP 100 * From ConversaoPP37_Cadastro (nolock)
--Select TOP 100 * From ConversaoBA01 (nolock)


