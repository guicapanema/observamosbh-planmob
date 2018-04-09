# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Base de Dados: planmob
# Tempo de Geração: 2018-03-25 01:00:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actions`;

CREATE TABLE `actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modals` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;

INSERT INTO `actions` (`id`, `program_id`, `name`, `alias`, `image`, `description`, `modals`, `tags`, `created_at`, `updated_at`)
VALUES
	(1,2,'Melhorar a infraestrutura para caminhar em calçadas e travessias','melhorar-infraestrutura',NULL,'','pedestre',NULL,NULL,NULL),
	(2,2,'Melhorar as condições físicas e tempos semafóricos de travessias','melhorar-condicoes-fisicas',NULL,'','pedestre',NULL,NULL,NULL),
	(3,2,'Fazer a manutenção das calçadas da rede de caminhamento a pé prevista no Projeto de Lei do Plano Diretor','manutencao-calcadas',NULL,'','pedestre',NULL,NULL,NULL),
	(4,2,'Incentivar a caminhada','incentivar-caminhada',NULL,'','pedestre',NULL,NULL,NULL),
	(5,2,'Implantar sinalização indicativa específica para os pedestres','sinalizacao-pedestre',NULL,'','pedestre',NULL,NULL,NULL),
	(6,2,'Dar tratamento para pedestres aos corredores de transporte coletivo já implantados','tratamento-pedestre',NULL,'','pedestre',NULL,NULL,NULL),
	(7,2,'Padronizar o tratamento para pedestres','padronizar-tratamento-pedestre',NULL,'','pedestre',NULL,NULL,NULL),
	(8,2,'Estudar a viabilidade de manutenção das calçadas com recursos do poder público.','manutencao-calcadas-poder-publico',NULL,'','pedestre',NULL,NULL,NULL),
	(9,3,'Implantação gradativa da Rede Cicloviária','implantacao-ciclovias',NULL,'','bicicleta',NULL,NULL,NULL),
	(10,3,'Implantação de paraciclos (suporte para estacionar bicicletas) nas vias e locais de grande demanda','implantacao-paraciclos',NULL,'','bicicleta',NULL,NULL,NULL),
	(11,3,'Implantação de bicicletários (local controlado para estacionar bicicletas)','implantacao-bicicletarios',NULL,'','bicicleta',NULL,NULL,NULL),
	(12,3,'Incentivar o Uso da Bicicleta','incentivar-bicicleta',NULL,'','bicicleta',NULL,NULL,NULL),
	(13,3,'Integrar a bicicleta aos demais modos de transporte','integrar-bicicleta',NULL,'','bicicleta|onibus|metro',NULL,NULL,NULL),
	(14,3,'Ampliar sistema de bicicletas públicas. (Bike BH)','ampliar-bicicletas-publicas',NULL,'','bicicleta',NULL,NULL,NULL),
	(15,3,'Implantação de equipamentos de apoio e ações de suporte','equipamentos-apoio',NULL,'','bicicleta',NULL,NULL,NULL),
	(16,3,'Melhorar a governança do Pedala BH.','melhorar-governanca',NULL,'','bicicleta',NULL,NULL,NULL),
	(17,4,'Modernizar o sistema semafórico, incluindo a possibilidade de priorização por meio de acionamento pelos ônibus.','modernizar-sistema-semaforico',NULL,'','onibus',NULL,NULL,NULL),
	(18,4,'Implantar a Estação de Integração São José (BRS Pedro II)','implantar-estacao-sao-jose',NULL,'','onibus',NULL,NULL,NULL),
	(19,4,'Implantar o Boulevard Afonso Pena (BRS Afonso Pena) com tratamento das calçadas','implantar-brs-afonso-pena',NULL,'','onibus',NULL,NULL,NULL),
	(20,4,'Implantar o BRS Nossa Senhora do Carmo e tratamento das calçadas','implantar-brs-nossa-senhora',NULL,'','onibus',NULL,NULL,NULL),
	(21,4,'Complementar o BRT Antônio Carlos ','complementar-brt-antonio-carlos',NULL,'(Av. Vilarinho, Av. Civilização; intervenção do VIURBS; estações de transferência e tratamento das calçaadas)','onibus',NULL,NULL,NULL),
	(22,4,'Implantar o Corredor Amazonas','complementar-brt-antonio-carlos',NULL,'(Av. Amazonas, Av. Tereza Cristina, Av. Olinto Meireles, Av. Waldir Soeiro, Via 210, Av. Olegário Maciel, Av. Nossa Senhora de Fátima; implantar estações de transferência e estações de integração Nova Cintra, Gameleira, Felipe Caldas e Silva Lobo; intervenções do VIURBS; tratamento das calçadas)','onibus',NULL,NULL,NULL),
	(23,4,'Complementar o BRT Cristiano Machado','complementar-brt-christiano-machado',NULL,'(Av. Cristiano Machado, trecho Estação São Gabriel/Estação Vilarinho; Av. Risoleta Neves e Via 540; implantar as estações de integração Providência, Isidoro e estações de transferência; intervenções do VIURBS; tratamento das calçadas)','onibus',NULL,NULL,NULL),
	(24,4,'Implantar o BRS Contorno/Andradas/Assis Chateaubriand e tratamento das calçadas','brs-contorno-andradas-chateaubriand',NULL,'','onibus',NULL,NULL,NULL),
	(25,4,'Implantar o BRS Raja Gabaglia; intervenções do VIURBS; tratamento das calçadas','brs-raja-gabaglia',NULL,'','onibus',NULL,NULL,NULL),
	(26,4,'Implantar o BRT Anel Rodoviário','brt-anel-rodoviario',NULL,'Trecho Estação São Gabriel/BH Shopping, implantação de estações de transferência; intervenções do VIURBS e tratamento das calçadas','onibus',NULL,NULL,NULL),
	(27,4,'Implantar o BRS Estoril/Salgado Filho','brs-estoril',NULL,'(Arterial Secundária 681); intervenções do VIURBS e tratamento das calçadas','onibus',NULL,NULL,NULL),
	(28,4,'Apoiar a implantação do trecho da Linha 1 do Metrô','metro-linha-1',NULL,'Eldorado/Novo Eldorado e da Estação de Integração Novo Eldorado','onibus|metro',NULL,NULL,NULL),
	(29,4,'Apoiar a implantação da Linha 2 do Metrô','metro-linha-2',NULL,'Barreiro / Nova Suíça','onibus|metro',NULL,NULL,NULL),
	(30,4,'Implantar o BRS Anel Intermediário; intervenções do VIURBS e tratamento das calçadas','brs-anel-intermediario',NULL,'','onibus',NULL,NULL,NULL),
	(31,4,'Implantar o BRS Venda Nova/Barreiro','brs-venda-nova-barreiro',NULL,'(Vias 210, 220 e 590); intervenções do VIURBS e tratamento das calçadas','onibus',NULL,NULL,NULL),
	(32,4,'Apoiar a implantação da Linha 2 do Metrô','metro-linha-2-2',NULL,'Praça Raul Soares/Santa Tereza','metro',NULL,NULL,NULL),
	(33,4,'Apoiar a implantação da Linha 3 do Metrô','metro-linha-3',NULL,'Lagoinha/Savassi','metro',NULL,NULL,NULL),
	(34,4,'Apoiar a implantação da Linha 3 do Metrô','metro-linha-3-2',NULL,'Savassi/Morro do Papagaio','metro',NULL,NULL,NULL),
	(35,5,'Criar Fundo Perene de Investimentos no Transporte Coletivo','fundo-investimento-coletivo',NULL,'(esta medida está vinculada ao Eixo Gestão, Fiscalização e Operação - Programa Gestão do PlanMob-BH)','onibus|metro',NULL,NULL,NULL),
	(36,5,'Ampliar as intervenções de prioridade ao transporte coletivo no sistema de circulação','ampliar-intervencioes-prioridade',NULL,'Por meio da implantação de faixas exclusivas nas principais vias por onde circulam os ônibus; intervenções do VIURBS e tratamento das calçadas','onibus',NULL,NULL,NULL),
	(37,5,'Criar rede de linhas noturnas e nos finais de semana.','rede-linhas-noturnas',NULL,'','onibus|metro',NULL,NULL,NULL),
	(38,5,'Melhorar a especificação dos veículos em relação ao conforto (acústico e temperatura) e bem-estar, em consonância com as tecnologias disponíveis','melhorar-especificacao-veiculos',NULL,'','onibus|metro',NULL,NULL,NULL),
	(39,5,'Criar novas linhas, interligando as centralidades entre si e ao seu entorno.','novas-linhas-centralidades',NULL,'','onibus|metro',NULL,NULL,NULL),
	(40,6,'Criar novas linhas no serviço seletivo interligando regiões da cidade com potencial de atendimento aos atuais usuários do transporte individual','linhas-seletivo',NULL,'','onibus',NULL,NULL,NULL),
	(41,6,'Ampliar a rede de linhas noturnas e nos finais de semana','linhas-noturnas-fim-semana',NULL,'','onibus',NULL,NULL,NULL),
	(42,6,'Estimular as escolas a viabilizarem a carona solidária','escolas-carona-solidaria',NULL,'','individual motorizado',NULL,NULL,NULL),
	(43,6,'Fiscalizar o transporte fretado nos corredores de transporte, visando garantir a operação do transporte regular nos pontos de embarque/desembarque sem interferências.','fiscalizar-transporte-fretado',NULL,'(Esta medida está vinculada ao Eixo Gestão, Fiscalização e Operação - Programa Fiscalização da Mobilidade)','individual motorizado|logistica|onibus',NULL,NULL,NULL),
	(44,7,'Aumentar o uso do cartão BHBUS através da redução do preço do casco e a ampliação da rede de vendas.','aumetar-uso-bhbus',NULL,'','onibus|metro',NULL,NULL,NULL),
	(45,7,'Melhorar a utilização do cartão BHBUS através do aumento do valor da recarga dentro dos ônibus.','aumentar-recarga-bhbus',NULL,'','onibus|metro',NULL,NULL,NULL),
	(46,7,'Reduzir tarifas nos horários de fora pico dos dias úteis e nos sábados, domingos e feriados','reduzir-tarifa-fora-pico',NULL,'','onibus|metro',NULL,NULL,NULL),
	(47,7,'Implantar integração física e tarifária entre os sistemas de transporte por ônibus municipal','integracao-onibus',NULL,'Convencional/ Suplementar, Suplementar/ Suplementar, Metrô/ Suplementar e MOVE/ Suplementar','onibus|metro',NULL,NULL,NULL),
	(48,7,'Implantar integração entre bicicleta/metrô/ônibus, com bicicletários junto às estações integração e de transferência.','integracao-bicicleta',NULL,'','onibus|metro|bicicleta',NULL,NULL,NULL),
	(49,7,'Implantar o Fundo Municipal de Melhoria da Qualidade e Subsídio ao Transporte Coletivo - FSTC','implantacao-fstc',NULL,'Os recursos serâo destinados a subsidiar o serviço de transporte coletivo no município, com vistas à manutenção da infraestrutura operacional e redução das tarifas cobradas pelo mesmo (esta medida está vinculada ao Eixo Gestão, Fiscalização e Operação - Programa Gestão do PlanMob-BH)','onibus|metro',NULL,NULL,NULL),
	(50,7,'Implantar bilhete único de transporte, integrando todos os modos de transporte público coletivo','bilhete-unico',NULL,'','onibus|metro',NULL,NULL,NULL),
	(51,7,'Implantar opção de compra de passagem diária, semanal e mensal, com desconto','desconto-semanal-mensal',NULL,'','onibus|metro',NULL,NULL,NULL),
	(52,7,'Implantar integração tarifária entre os sistemas municipal, metropolitano e dos municípios conurbados, com tarifação por zonas ou por trechos','tarifacao-zonas-trechos',NULL,'','onibus|metro',NULL,NULL,NULL),
	(53,8,'Implantar auditoria de segurança viária nos projetos de médio e grande porte a serem implantados pela BHTRANS e inspeção posterior à implantação para verificar o atendimento aos itens de segurançaa','auditoria-seguranca-viaria',NULL,'','onibus|metro|logistica|individual motorizado',NULL,NULL,NULL),
	(54,8,'Implantar as correções indicadas na Inspeção de Segurança e na Inspeção de Acessibilidade elaboradas pelo WRI nas avenidas Cristiano Machado e Antônio Carlos/Pedro I.','implantar-correcoes-wri',NULL,'','onibus|metro|logistica|individual motorizado|pedestre|bicicleta',NULL,NULL,NULL),
	(55,8,'Fazer gestão junto aos órgãos responsáveis pela manutenção das vias, vegetação dos canteiros, poços de visita para que estes não sejam elementos causadores de acidentes','gestao-manutencao-via',NULL,'(Esta medida está vinculada ao Eixo Gestão, Fiscalização e Operação – Programa Gestão do PlanMob-BH)','onibus|metro|logistica|individual motorizado|pedestre|bicicleta',NULL,NULL,NULL),
	(56,8,'Efetivar o Comitê Intersetorial para o acompanhamento da Política de Segurança no Trânsito e o Projeto Vida no Trânsito','comite-politica-seguranca',NULL,'','onibus|metro|logistica|individual motorizado|pedestre|bicicleta',NULL,NULL,NULL),
	(57,9,'Estimular a instalação de Varandas Urbanas (parklets) em vagas de estacionamento','estimular-parklets',NULL,'Conforme Decreto Municipal No 15.895/2015, inclusive com proposições de localização em projetos viários e de Zona 30 elaborados pelo município.','individual motorizado|pedestre|bicicleta',NULL,NULL,NULL),
	(58,9,'Implantar o Projeto Velocidade Segura, reduzindo a velocidade nas vias arteriais, coletoras e aproximações das estações do BRT/MOVE','projeto-velocidade-segura',NULL,'','onibus|individual motorizado|pedestre|bicicleta',NULL,NULL,NULL),
	(59,9,'Investir no tratamento de rotas de caminhamento de pedestres nas centralidades definidas no Plano Diretor','investir-rotas-caminhamento',NULL,'','pedestre',NULL,NULL,NULL),
	(60,9,'Estimular/ampliar o Programa Rua Nossa','programa-rua-nossa',NULL,'Fechamento de ruas aos domingos, permitindo que a própria comunidade proponha o fechamento de ruas, e integradas às ciclorrotas de lazer.','pedestre',NULL,NULL,NULL),
	(61,10,'Promover treinamento contínuo dos operadores do transporte público e escolar','teinamento-coletivo-escolar',NULL,'Abordando os conteúdos de segurança de trânsito, acessibilidade, atendimento ao usuário, procedimentos operacionais e condução inadequada','onibus|metro',NULL,NULL,NULL),
	(62,10,'Atender alunos do 1° ciclo da rede municipal e estadual de ensino e da rede particular no Programa Educativo Circo Transitando Legal.','educativo-transitando-legal',NULL,'','pedestre',NULL,NULL,NULL),
	(63,10,'Atender alunos do 3° ciclo da rede municipal e estadual de ensino e da rede particular no Programa Educativo Caravana da Cidadania.','educativo-caravana-cidadania',NULL,'','pedestre',NULL,NULL,NULL),
	(64,10,'Atender alunos do 2° ano do ensino médio no Programa Educativo O Jovem e a Mobilidade.','educativo-jovem-mobilidade',NULL,'','pedestre',NULL,NULL,NULL),
	(65,10,'Realizar campanhas de respeito ao pedestre e ao ciclista e de comportamento seguro de pedestres e ciclistas','seguranca-pedestre-ciclista',NULL,'','pedestre|bicicleta',NULL,NULL,NULL),
	(66,10,'Realizar campanha de comportamento seguro para motociclistas.','seguranca-motociclista',NULL,'','individual motorizado',NULL,NULL,NULL),
	(67,10,'Desenvolver ações intersetoriais e implementar Plano de Comunicação sobre Segurança no Trânsito','comunicacao-seguranca-transito',NULL,'Pautar e subsidiar os meios de comunicação em suas matérias sobre o assunto, utilizando todos os tipos de mídia disponíveis','individual motorizado|pedestre|bicicleta',NULL,NULL,NULL),
	(68,10,'Fazer gestão junto ao DETRAN-MG e CONTRAN - Conselho Nacional de Trânsito para introduzir módulo específico para motociclistas','modulo-motociclistas',NULL,'Informações de segurança no curso obrigatório para habilitação e alterar a forma do exame de habilitação de motociclistas, exigindo exame de legislação específico e exame na rua.','individual motorizado',NULL,NULL,NULL),
	(69,10,'Realizar campanhas educativas para conscientização da importância da logística urbana para a economia da cidade','conscientizacao-logistica',NULL,'Respeito do uso da carga e descarga, circulação da carga e etc. (Esta medida está vinculada ao Eixo Logística Urbana - Programa Circulando e Entregando Melhor).','logistica',NULL,NULL,NULL),
	(70,10,'Promover campanhas e ações de divulgação, no intuito de mostrar à população que ela também pode e deve colaborar para a melhoria da mobilidade urbana em nossa cidade.','conscientizacao-melhoria-mobilidade',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(71,10,'Instituir como obrigatório nos empreendimentos sujeitos ao EIV - Estudo de Impacto de Vizinhança, Plano Sobre Segurança Viária para a área impactada pelo empreendimento.','eiv-plano-seguranca',NULL,'','pedestre|bicicleta|lindividual motorizado',NULL,NULL,NULL),
	(72,10,'Ampliar o Projeto Escola Segura para todas as escolas municipais participantes do Programa Saúde na Escola','projeto-saude-escola',NULL,'','pedestre|bicicleta',NULL,NULL,NULL),
	(73,10,'Fazer gestão junto ao Governo do Estado de Minas Gerais para implantar o Projeto Escola Segura em escolas estaduais.','projeto-escola-segura',NULL,'','pedestre|bicicleta',NULL,NULL,NULL),
	(74,10,'Criar um programa de conduta segura para transportadores escolares','conduta-transporte-escolar',NULL,'','onibus',NULL,NULL,NULL),
	(75,10,'Criar um programa de conduta segura para motofretistas','conduta-motofretistas',NULL,'','individual motorizado',NULL,NULL,NULL),
	(76,10,'Apoiar a realização de ações educativas para grupos de idosos','educativo-idosos',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(77,10,'Ampliar a realização de palestras e programas de segurança no trânsito em parceria com empresas privadas','palestras-seguranca-transito',NULL,'Por exemplo, nas Semanas Internas de Prevenção de Acidentes - SIPATS','pedestre|bicicleta|individual motorizado',NULL,NULL,NULL),
	(78,14,'Estimular a implantação de planos de mobilidade corporativa e a prática de carona solidária, com o uso de aplicativos de carona.','mobilidate-corporativa-carona',NULL,'','individual motorizado',NULL,NULL,NULL),
	(79,14,'Criar taxas sobre modos e serviços de transporte individual privado pela utilização da infraestrutura urbana','taxas-transporte-individual',NULL,'Vinculando a receita à aplicação exclusiva no transporte coletivo e não motorizado, inclusive para subsidiar a tarifa do transporte público.','individual motorizado',NULL,NULL,NULL),
	(80,14,'Restringir e controlar o acesso e circulação, permanente ou temporário, de veículos individuais privados em locais e horários determinados','restringir-individual-motorizado',NULL,'','individual motorizado',NULL,NULL,NULL),
	(81,14,'Desestimular o uso de motocicletas','desestimulo-motocicletas',NULL,'Especialmente nas áreas e horários mais congestionados, aumentando a segurança.','individual motorizado',NULL,NULL,NULL),
	(82,14,'Estipular padrões de emissões de poluentes para acessar e circular em locais e horários determinados','padroes-poluentes',NULL,'','individual motorizado',NULL,NULL,NULL),
	(84,15,'Manter programas permanentes de melhoria e qualificação dos serviços de táxi','melhoria-qualificacao-taxi',NULL,'','individual motorizado',NULL,NULL,NULL),
	(85,15,'Promover treinamento para qualificação e melhoria dos serviços de táxi','treinamento-qualificaco-taxi',NULL,'','individual motorizado',NULL,NULL,NULL),
	(86,15,'Estimular o uso do serviço de transporte individual público','incentivar-uso-taxi',NULL,'','individual motorizado',NULL,NULL,NULL),
	(87,15,'Celebrar e manter convênios para a integração das praças de táxis dos municípios conurbados da RMBH','convenios-praca-taxi-rmbh',NULL,'','individual motorizado',NULL,NULL,NULL),
	(88,15,'Realizar pesquisa de opinião sobre o serviço de táxi para alimentar propostas de modernização','pesquisa-opiniao-taxi',NULL,'','individual motorizado',NULL,NULL,NULL),
	(89,15,'Fomentar o serviço de compartilhamento de veículo individual motorizado (carsharing)','incentivar-carsharing',NULL,'','individual motorizado',NULL,NULL,NULL),
	(90,15,'Acompanhar a oferta de táxi em função da demanda e de benchmark com cidades semelhantes','acompanhar-oferta-taxi',NULL,'','individual motorizado',NULL,NULL,NULL),
	(91,15,'Elaborar estudo de viabilidade do uso compartilhado da faixa exclusiva de ônibus pelo táxi com passageiro','estudo-taxi-onibus',NULL,'','individual motorizado',NULL,NULL,NULL),
	(92,15,'Modernizar o serviço de táxi para acompanhar as tendências e novos serviços','modernizar-taxi',NULL,'','individual motorizado',NULL,NULL,NULL),
	(93,15,'Ampliar o serviço de táxi lotação para atendimento da demanda nos períodos noturnos e em finais de semana','ampliar-taxi-lotacao',NULL,'','individual motorizado',NULL,NULL,NULL),
	(94,15,'Estudar a criação de novos serviços de táxi lotação','novos-taxi-lotacao',NULL,'Com a implantação de carros acessíveis, de novos pontos ou aproveitando as estações de integração existentes. As rotas do táxi lotação serão predefinidas e poderão ser pagas através do cartão de transporte coletivo.\n','individual motorizado',NULL,NULL,NULL),
	(95,16,'Realizar pesquisas sobre o impacto da redução de vagas de estacionamento nos congestionamentos e na economia.','impacto-reducao-estacionalmento',NULL,'','individual motorizado',NULL,NULL,NULL),
	(96,16,'Tornar efetivo o uso de vagas e a fiscalização do estacionamento rotativo','fiscalizacao-rotativo',NULL,'','individual motorizado',NULL,NULL,NULL),
	(97,16,'Restringir o número de vagas de estacionamento nas vias da Área Central e sobretaxar e regular os estacionamentos privados, que deverão ser objeto de estudo de impacto de vizinhança','restringir-vagas-centro',NULL,'','individual motorizado',NULL,NULL,NULL),
	(98,16,'Estabelecer coerência entre os preços cobrados pelos serviços de mobilidade, estacionamentos em vias públicas de veículos de passageiros e de carga e eventuais cobranças por circulação, estimulando modos não motorizados, coletivos e menos poluentes','coerencia-precos-mobilidade',NULL,'','individual motorizado|onibus|metro|logistica',NULL,NULL,NULL),
	(99,16,'Evitar o aumento de vagas de estacionamento associando a criação de vagas de estacionamento privado de acesso público à redução de vagas de estacionamento na via pública','reducao-estacionamento-via',NULL,'','individual motorizado',NULL,NULL,NULL),
	(100,16,'Tornar requisito no projeto de estações de alta capacidade o estudo de viabilidade para a implantação de estacionamentos dissuasórios','estacionamento-dissuasorio-estacoes',NULL,'','individual motorizado',NULL,NULL,NULL),
	(101,17,'Reforçar e adequar a sinalização nas áreas de carga e descarga para reduzir o desrespeito','sinalizacao-carga-descarga',NULL,'','logistica|individual motorizado',NULL,NULL,NULL),
	(102,17,'Realizar campanhas educativas para conscientização da importância da logística urbana para a economia da cidade','campanha-importancia-logistica',NULL,'Respeito do uso da carga e descarga, circulação da carga e etc. (Esta medida está vinculada ao Eixo Circulação Calma - Programa Educação para a Mobilidade)','logistica',NULL,NULL,NULL),
	(103,17,'Criar e manter um banco de dados para subsidiar o planejamento da logística urbana','dados-planejamento-logistica',NULL,'Pesquisas, rede de circulação, malha ferroviária.','logistica',NULL,NULL,NULL),
	(104,17,'Estabelecer estratégias de fiscalização para melhorar o controle da circulação e operações de logística','estrategias-fiscalizacao-logistica',NULL,'','logistica',NULL,NULL,NULL),
	(105,17,'Estudar a necessidade de implantar rotativo nas áreas de carga e descarga na Área Central e centralidades, para otimização destas áreas','rotativo-carga-descarga',NULL,'','logistica',NULL,NULL,NULL),
	(106,17,'Melhorar a efetividade das operações de carga e descarga, por meio de estudos e implantação de melhores práticas para esta atividade','melhores-praticas-carga',NULL,'Manual de melhores práticas, modernização de equipamentos e veículos, selo verde, participação em fóruns, treinamentos, padronização de embalagens entre outras.','logistica',NULL,NULL,NULL),
	(107,17,'Apoiar o planejamento e execução da pesquisa de movimentação de carga, contemplando a RMBH','pesquisa-carga-rmbhg',NULL,'','logistica',NULL,NULL,NULL),
	(108,17,'Compatibilizar os horários das operações de carga e descarga com as demandas de mobilidade da cidade','horarios-carga-descarga',NULL,'','logistica',NULL,NULL,NULL),
	(109,17,'Estimular medidas de último quilômetro','medidas-ultimo-quilometro',NULL,'Containers sobre rodas, pontos de entrega e coleta, microcentros de distribuição nas centralidades, OUCs e estacionamentos subterrâneos','logistica',NULL,NULL,NULL),
	(110,17,'Prever incentivos financeiros ou isenção de impostos para promover a adesão dos envolvidos, tanto dos transportadores quanto dos varejistas, as medidas de logística urbana propostas','isencao-fiscal-carga',NULL,'Containers sobre rodas, pontos de entrega e coleta, microcentros de distribuição nas centralidades, OUCs e estacionamentos subterrâneos','logistica',NULL,NULL,NULL),
	(111,17,'Estudar o papel do transporte por tração animal na distribuição urbana de mercadorias','tracao-animal-cargas',NULL,'','logistica',NULL,NULL,NULL),
	(112,18,'Incentivar entregas realizadas por veículos de menor impacto','entrega-menor-impacto',NULL,'Bicicletas, triciclos elétricos, entre outras.','logistica|bicicleta',NULL,NULL,NULL),
	(113,18,'Ampliar e modernizar as informações sobre circulação e entrega de cargas','informacoes-cargas',NULL,'\"Como vou de carga\", novos aplicativos, PMVs etc.','logistica',NULL,NULL,NULL),
	(114,18,'Promover a interlocução (fóruns de discussão, câmara temática, carta compromisso e etc.) entre o poder público e os agentes da cadeia de abastecimento','interlocucao-publico-abastecimento',NULL,'Objetivando um Pacto pela Logística Urbana Sustentável','logistica',NULL,NULL,NULL),
	(115,18,'Articular a logística urbana no âmbito metropolitano para implantação de centros de consolidação e distribuição de carga, plataforma logísticas, entre outros','interlocucao-publico-abastecimento',NULL,'','logistica',NULL,NULL,NULL),
	(116,19,'Apoiar Operação Urbana Consorciada Antônio Carlos/Pedro I - Leste-Oeste - OUC-ACLO','apoiar-ouc-aclo',NULL,'','onibus|metro|individual motorizado|bicicleta|pedestre|logistica',NULL,NULL,NULL),
	(117,19,'Apoiar Operações Urbanas Consorciadas: Anel Rodoviário, Via 220, Via 710 e Cristiano Machado','apoiar-ouc-anel-220',NULL,'','onibus|metro|individual motorizado|bicicleta|pedestre|logistica',NULL,NULL,NULL),
	(118,19,'Fazer gestão para viabilizar a Operação Urbana Consorciada do TOD Anel Rodoviário','gestao-ouc-anel',NULL,'','onibus|metro|individual motorizado|bicicleta|pedestre|logistica',NULL,NULL,NULL),
	(119,19,'Apoiar o desenvolvimento de projetos de mobilidade nas Centralidades','apoiar-mobilidade-centralidades',NULL,'','onibus|metro|individual motorizado|bicicleta|pedestre|logistica',NULL,NULL,NULL),
	(120,19,'Fazer gestão para viabilizar medidas de incentivo ao escalonamento de horários de entrada e saída das atividades urbanas, trabalho remoto, semana comprimida e outras','gestao-escalonameto-horarios',NULL,'','onibus|metro|individual motorizado|bicicleta|pedestre|logistica',NULL,NULL,NULL),
	(121,19,'Aprimorar os procedimentos para exigência de investimentos em mobilidade ativa e coletiva decorrentes da implantação de Empreendimentos de Impacto','ampliar-investimentos-mobilidade-ativa',NULL,'','bicicleta|pedestre|logistica',NULL,NULL,NULL),
	(122,20,'Fiscalizar as emissões da frota circulante de veículos movidos a diesel','fiscalizar-emissoes-diesel',NULL,'','onibus|individual motorizado|logistica',NULL,NULL,NULL),
	(123,20,'Prospectar e promover a substituição gradativa da frota de transporte público por veículos com menor potencial de emissão de gases de efeito estufa','transporte-publico-baixa-emissao',NULL,'','onibus|metro',NULL,NULL,NULL),
	(124,20,'Acompanhar a política ambiental e garantir sua articulação com as ações de mobilidade','acompanhar-politica-ambiental',NULL,'','onibus|metro|individual motorizado|bicicleta|pedestre|logistica',NULL,NULL,NULL),
	(125,21,'Acompanhamento do projeto e implantação de vias destinadas ao transporte coletivo','acompanhamento-projeto',NULL,'','onibus|metro',NULL,NULL,NULL),
	(126,22,'Promover a renovação da frota do transporte público com veículos com acessibilidade universal','renovacao-coletivo-acessivel',NULL,'','onibus|metro',NULL,NULL,NULL),
	(127,22,'Estimular o serviço de vans acessíveis para o transporte escolar da pessoa com deficiência','vans-escolares-acessiveis',NULL,'','individual motorizado',NULL,NULL,NULL),
	(128,22,'Capacitar equipes técnicas para desenvolver projetos que contemplem o conceito de acessibilidade universal, em atendimento à Legislação Vigente e às melhores práticas','capacitar-equipe-acessibilidade',NULL,'','onibus|metro|pedestre',NULL,NULL,NULL),
	(129,22,'Capacitar equipes de fiscalização e obras para cobrar o cumprimento da aplicação de requisitos legais vigentes aos projetos públicos','capacitar-fiscalizacao-acessibilidade',NULL,'','onibus|metro|pedestre',NULL,NULL,NULL),
	(130,22,'Capacitar equipe para auditoria de acessibilidade universal em projetos e obras de transporte urbano','capacitar-auditoria-acessibilidade',NULL,'','onibus|metro|pedestre',NULL,NULL,NULL),
	(131,22,'Adequar a acessibilidade interna e externa das estações de integração aos critérios de Desenho Universal','adequar-acessibilidade-estacoes',NULL,'','onibus|metro|pedestre',NULL,NULL,NULL),
	(132,22,'Implantar projetos com desenho universal para o sistema de transporte e trânsito urbanos','projetos-acessiveis',NULL,'','onibus|metro|pedestre',NULL,NULL,NULL),
	(133,22,'Desenvolver tecnologias de informação e comunicação que atendam às necessidades de todos os usuários do sistema de transporte coletivo, incluindo os idosos e as pessoas com deficiência','tecnologias-acessiveis-coletivo',NULL,'','onibus|metro',NULL,NULL,NULL),
	(134,22,'Estimular a criação de uma comissão intersetorial permanente de acessibilidade na mobilidade','tecnologias-acessiveis-coletivo',NULL,'','onibus|metro|individual motorizado|pedestre',NULL,NULL,NULL),
	(135,23,'Implantar tratamento especial para deficientes visuais em travessias semaforizadas','travessias-deficientes-visuais',NULL,'','pedestre',NULL,NULL,NULL),
	(136,23,'Implantar projetos com desenho universal nas calçadas, passeios, travessias, acessos às estações de metrô, equipamentos e espaços públicos','desenho-universal-espacos-publicos',NULL,'','pedestre|metro',NULL,NULL,NULL),
	(137,24,'Melhorar o atendimento e a operação dos serviços de vilas e favelas','melhorar-vilas-favelas',NULL,'(Esta medida está vinculada ao Eixo Mobilidade Coletiva - Programa Rede Complementar)','onibus',NULL,NULL,NULL),
	(138,24,'Fazer gestão para viabilizar aplicação de subsídios e desonerações tributárias para formulação de Política Tarifária que promova o desenvolvimento social e a inclusão','desoneracoes-subsidios-coletivo',NULL,'(Esta medida está vinculada ao Eixo Gestão, Fiscalização e Operação - Programa Gestão do PlanMob-BH)','onibus|metro',NULL,NULL,NULL),
	(139,24,'Criar novas linhas, interligando as centralidades entre si e ao seu entorno','novas-linhas-centralidades',NULL,'(Esta medida está vinculada ao Eixo Mobilidade Coletiva - Programa Rede Convencional)','onibus|metro',NULL,NULL,NULL),
	(140,25,'Fiscalizar o transporte fretado nos corredores de transporte, visando garantir a operação do transporte regular nos pontos de embarque/desembarque sem interferências','fiscalizar-transporte-fretado-2',NULL,'(Esta medida está vinculada ao Eixo Mobilidade Coletiva - Programa Rede Complementar)','individual motorizado|logistica|onibus',NULL,NULL,NULL),
	(141,25,'Fiscalizar o transporte coletivo que integra a rede estruturante, a rede convencional e a rede complementar','fiscalizar-transporte-coletivo',NULL,'','onibus|metro',NULL,NULL,NULL),
	(142,25,'Fazer gestão junto a todas as instâncias de governo para que se possa programar e executar ações conjuntas de fiscalização de trânsito em toda a cidade','gestao-governo-fiscalizacao',NULL,'','onibus|metro|individual motorizado|logistica',NULL,NULL,NULL),
	(143,25,'Sensibilizar a Polícia Militar de Minas Gerais e a Guarda Municipal para que estas possam alocar maior quantidade de agentes para atuar no dia a dia da fiscalização de trânsito','sensibilizar-policia-guarda',NULL,'','onibus|metro|individual motorizado|logistica',NULL,NULL,NULL),
	(144,25,'Fazer gestão junto ao Governo do Estado para intensificar as blitzen de motociclistas verificando habilitação e equipamentos de segurança','intensificar-blitzen',NULL,'Além de focar na penalização dos excessos, principalmente de velocidade e direção perigosa.','individual motorizado|logistica',NULL,NULL,NULL),
	(145,25,'Fazer gestão junto ao Governo do Estado para a ampliação das blitzen de álcool e direção','intensificar-blitzen-alccol',NULL,'Que tenham foco também no motociclista','individual motorizado|logistica',NULL,NULL,NULL),
	(146,25,'Fazer gestão junto à PMMG e à GMBH para fiscalizarem as vagas rotativas destinadas aos motofretistas','fiscalizacao-vagas-motofretistas',NULL,'','individual motorizado|logistica',NULL,NULL,NULL),
	(147,25,'Fazer gestão junto à PMMG e GMBH para que seja priorizada a fiscalização de condutores que desrespeitam a preferência dos pedestres nas faixas de travessia ou param/estacionam sobre as mesmas','fiscalizar-respeito-pedestre',NULL,'','individual motorizado|pedestre',NULL,NULL,NULL),
	(148,25,'Fazer gestão junto à PBH/SMSU e à PMMG para fiscalizar o uso das calçadas e passeios, tanto quanto aos aspectos de posturas quanto de trânsito','fiscalizar-uso-calcadas',NULL,'','pedestre',NULL,NULL,NULL),
	(149,25,'Aumentar a quantidade de equipamentos de fiscalização eletrônica','aumento-fiscalizacao-eletronica',NULL,'(Equipamentos de medição e registro da velocidade; equipamentos de registro de avanço do sinal vermelho dos semáforos; equipamentos de detecção de parada sobre a faixa de pedestres) expandindo-os para todos os corredores de tráfego e o sistema arterial principal da cidade, bem como para todas as interseções semaforizadas.','individual motorizado|pedestre',NULL,NULL,NULL),
	(150,25,'Viabilizar fiscalização específica de velocidade de motocicletas','fiscalizacao-motocicletas',NULL,'Utilizando radar móvel posicionado em locais estratégicos dos corredores de tráfego de maior índice de acidentes','individual motorizado',NULL,NULL,NULL),
	(151,25,'Instrumentalizar os Agentes de Transporte e Trânsito com mais recursos, para melhorar a qualidade e a efetividade da fiscalização','instrumentalizar-agentes-fiscalizacao',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(152,25,'Capacitar o quadro de Agentes para atuar também na fiscalização e operação do espaço viário destinado à circulação de bicicletas (\"Agente Pedala BH\") e a questões ligadas à acessibilidade','agentes-bicicleta-acessibilidade',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(153,25,'Alocar os recursos necessários para efetiva atuação do \"Agente Pedala BH\"','agentes-bicicleta-equipamentos',NULL,'Tais como os veículos (preferencialmente bicicletas), equipamentos de proteção individual, etc','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(155,25,'Retomar as ações institucionais e judiciais para que os Agentes da BHTRANS possam voltar a ter o poder de multar','agentes-bhtrans-multas',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(156,25,'Identificar, a partir dos dados dos veículos de transporte escolar cadastrados na BHTRANS, a informação de quais escolas e horários eles atendem, estabelecendo cronograma e estratégias de fiscalização, com foco na avaliação das condições de segurança dos usuários deste transporte','fiscalizacao-seguranca-escolar',NULL,'','individual motorizado',NULL,NULL,NULL),
	(157,25,'Promover o efetivo envolvimento dos órgãos competentes para a fiscalização e exigência de tratamento/adequação das calçadas quando de sua danificação pelas concessionárias de serviços públicos e por particulares','fiscalizacao-adequacao-calcadas',NULL,'Visando garantir melhores condições de conforto e segurança nos caminhamentos dos pedestres.','pedestre',NULL,NULL,NULL),
	(159,25,'Criar medidas de incentivo para que os cidadãos mantenham as calçadas em frente aos seus imóveis bem cuidadas e em efetivas condições de uso para todos os pedestres, inclusive para as pessoas com dificuldade de locomoção','incentivo-manutencao-calcadas',NULL,'','pedestre',NULL,NULL,NULL),
	(160,26,'Criar Fundo Perene de Investimentos no Transporte Coletivo','fundo-investimento-coletivo-2',NULL,'(esta medida está vinculada ao Eixo Mobilidade Coletiva)','onibus|metro',NULL,NULL,NULL),
	(161,26,'Atuar objetivamente junto a organismos e/ou agentes financeiros nacionais e internacionais para obter recursos a fundo perdido e/ou linhas de financiamento para aplicação nas ações de mobilidade urbana','obter-fundos-organismos',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(162,26,'Identificar outras possíveis fontes de financiamento e as condições sob as quais se pode obter os recursos','obter-fundos-demais',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(163,26,'Desenvolver e/ou fomentar ações para que sejam agilizados os Programas passíveis de financiamento ou até mesmo criar programas específicos para se adequar às linhas de financiamento disponíveis','agilizar-programas-financiamentos',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(164,26,'Promover a melhoria contínua das ações de gerenciamento e/ou operação e fiscalização do sistema de transporte e trânsito da cidade','melhoria-continua-transito',NULL,'Através da introdução de novas tecnologias e/ou aprimoramento das que estão sendo atualmente utilizadas.','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(165,26,'Pesquisar, propor e, se possível, adotar exemplos de boas práticas na introdução e/ou otimização dos mecanismos de participação, das soluções tecnológicas de gerenciamento, e/ou operação e fiscalização do sistema de transporte e trânsito da cidade','melhoria-participacao-transito',NULL,'','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(166,26,'Fazer gestão junto aos órgãos responsáveis pela manutenção das vias, vegetação dos canteiros, poços de visita para que estes não sejam elementos causadores de acidentes','gestao-manutencao-via-2',NULL,'(Esta medida está vinculada ao Eixo Acessibilidade Universal - Programa Inclusão Social)','onibus|metro|logistica|individual motorizado|pedestre|bicicleta',NULL,NULL,NULL),
	(167,26,'Implantar o Fundo Municipal de Melhoria da Qualidade e Subsídio ao Transporte Coletivo - FSTC','implantacao-fstc-2',NULL,'Os recursos serâo destinados a subsidiar o serviço de transporte coletivo no município, com vistas à manutenção da infraestrutura operacional e redução das tarifas cobradas pelo mesmo (esta medida está vinculada ao Eixo Mobilidade Coletiva – Programa Tarifário)','onibus|metro',NULL,NULL,NULL),
	(168,27,'Ampliar a informação sobre os serviços de mobilidade','ampliar-informacao-mobilidade',NULL,'Ênfase em novas tecnologias e estimulando o uso do transporte coletivo e a mobilidade ativa.','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(169,27,'Tornar obrigatório que em todos os pontos de ônibus haja painéis informativos e acessíveis (sonoro e em libras) sobre o sistema de transporte público coletivo','pontos-informacoes-acessiveis',NULL,'','metro|onibus',NULL,NULL,NULL),
	(170,27,'Disponibilizar todos os dados do sistema de transporte coletivo para que terceiros (públicos e privados) possam desenvolver aplicativos','disponibilizar-dados-coletivo',NULL,'Incluindo as pessoas com alguma deficiência física, como por exemplo os cegos.','metro|onibus',NULL,NULL,NULL),
	(171,27,'Disponibilizar as informações (GPS) do Sistema Suplementar para os usuários','disponibilizar-dados-suplementar',NULL,'','onibus',NULL,NULL,NULL),
	(172,27,'Estimular/apoiar as escolas e o sindicato dos transportadores a divulgarem as rotas dos operadores do serviço escolar','estimular-transporte-escolar',NULL,'Visando incremento na utilização e redução do uso do transporte individual ','individual motorizado',NULL,NULL,NULL),
	(173,27,'Promover a divulgação das medidas de fiscalização e operação','divulgacao-fiscalizacao-operacao',NULL,'No intuito de mostrar à população que ela também pode e deve colaborar para a melhoria da mobilidade urbana em nossa cidade e na construção de políticas públicas.','metro|onibus|pedestre|bicicleta|logistica|individual motorizado',NULL,NULL,NULL),
	(174,27,'Divulgar para a sociedade a criação do \"Agente Pedala BH\"','divulgacao-agente-pedala-bh',NULL,'No intuito de mostrar que a BHTRANS/PBH não somente está implantando um sistema cicloviário, mas também agregando novas ações para incentivar o uso da bicicleta.','bicicleta',NULL,NULL,NULL),
	(175,27,'Divulgar para a população a importância do conceito da Política Pública de Mobilidade Urbana Acessível, baseada no conceito de desenho universal, e contribuir no aumento da diversidade de pessoas utilizando o transporte coletivo','divulgacao-acessibilidade-coletivo',NULL,'','metro|onibus|pedestre',NULL,NULL,NULL);

/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela axes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `axes`;

CREATE TABLE `axes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modals` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `axes` WRITE;
/*!40000 ALTER TABLE `axes` DISABLE KEYS */;

INSERT INTO `axes` (`id`, `name`, `alias`, `image`, `description`, `modals`, `tags`, `created_at`, `updated_at`)
VALUES
	(1,'Mobilidade Ativa','mobilidade-ativa','/img/eixo-ativa.png','O eixo de mobilidade ativa engloba todas as formas de deslocamento por propulsão humana, como a pé e por bicicleta. O objetivo e os programas que compõem o eixo visam tornar esse deslocar cada vez mais autônomo, seguro, inclusivo e prazeroso, seja por meio de políticas ou infraestrutura.','pedestre|bicicleta','pedestre|a pé|bicicleta|transporte não motorizado',NULL,NULL),
	(2,'Mobilidade Coletiva','mobilidade-coletiva','/img/eixo-coletiva.png','A mobilidade coletiva engloba os modos de transporte público por ônibus, micro-ônibus, metrô e outros eventuais que possa surgir. Seu principal objetivo é reverter a atual tendência de perda de passageiros para o transporte individual e avançar em uma mobilidade coletiva com acessibilidade universal - tanto física como social.','onibus|metro','transporte coletivo|transporte público|mobilidade coletiva|tarifa',NULL,NULL),
	(3,'Circulação Calma','circulacao-calma','/img/eixo-calma.png','Este eixo é voltado para reversão do atual quadro de violência na circulação da cidade. Busca-se, assim, a retirada ou a redução do tráfego de veículos, a diminuição de sua velocidade, a ampliação e melhoria dos espaços de convivência e a apropriação da cidade e suas ruas pelas pessoas.','pedestre|bicicleta|onibus|individual motorizado|logistica','desvelocidades|acalmamento|traffic calming|zona 30|espaço público',NULL,NULL),
	(4,'Mobilidade Individual Motorizada','individual-motorizada','/img/eixo-individual.png','Este eixo trata do deslocamento em automóvel, moto, táxi e serviços de compartilhamento de carro. De maneira geral, é necessário reverter a tendência do aumento do uso desses modos, em especial na área central da cidade - estabelecendo parâmetros e políticas que tragam justiça social para o uso do espaço e da energia que esse modo realiza na cidade.','individual motorizado','automóvel|carro|moto|motocicleta|carro compartilhado',NULL,NULL),
	(5,'Logística Urbana','logistica-urbana','/img/eixo-logistica.png','Este eixo compreende todas as maneiras pelas quais as mercadorias são distribuídas e entregues na cidade. É de fundamental importância para a economia e a vida cotidiana funcionarem e interfere significativamente na mobilidade urbana. Assim, é necessário coordenar ações de melhoria da logística com segurança no trânsito.','logistica','logística urbana|economia|caminhão|carga|última milha',NULL,NULL),
	(6,'Cidade Sustentável','cidade-sustentavel','/img/eixo-sustentavel.png','Este eixo se propõe a racionalizar as formas de deslocamento na cidade e torná-las menos impactantes para o meio-ambiente. Assim, aumentar a proporção de viagens em modos ativos e públicos, diminuir as distâncias percorridas no dia a dia e tornar os modos motorizados menos poluentes estão entre suas prioridades.','pedestre|bicicleta|individual motorizado|coletivo|logistica','gases de efeito estufa|gee|poluição do ar|qualidade do ar|emissões|poluição sonora|pm|combustível|meio ambiente',NULL,NULL),
	(7,'Acessibilidade Universal','acessibilidade-universal','/img/eixo-acessibilidade.png','Este eixo aborda a necessidade de se promover e garantir o acesso físico, econômico e social de toda a população ao espaço urbano. Busca a inclusão ativa principalmente de pessoas com deficiência ou mobilidade reduzida, baixa renda, ou que sofram algum tipo de discriminação social. As políticas abrangem de calçadas a ônibus, de táxis às bicicletas.','pedestre|bicicleta|coletivo','acessibilidade|desenho universal|inclusão social|pessoa com deficiência|pcd|mobilidade reduzida',NULL,NULL),
	(8,'Gestão, Fiscalização e Operação','gestao-fiscalizacao','/img/eixo-sinalizacao.png','Este eixo é fundamental para que o poder público, em articulação com a sociedade civil, seja capaz de implementar os programas e ações elencados nos demais eixos. É necessário gerir recursos e pessoal para colocar em operação as medidas definidas e fiscalizar para direcionar ações e comportamentos e coibir aquilo que é prejudicial aos objetivos definidos.','pedestre|bicicleta|coletivo|individual motorizado|logistica','controle operacional|fiscalização|infração|operação|multa',NULL,NULL);

/*!40000 ALTER TABLE `axes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela indicators
# ------------------------------------------------------------

DROP TABLE IF EXISTS `indicators`;

CREATE TABLE `indicators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `parent_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `formula` text COLLATE utf8mb4_unicode_ci,
  `modals` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_short` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_long` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;

INSERT INTO `indicators` (`id`, `parent_id`, `parent_type`, `name`, `alias`, `description`, `formula`, `modals`, `tags`, `target_short`, `target_medium`, `target_long`, `created_at`, `updated_at`)
VALUES
	(1,1,'App\\Axis','Percentual de avaliação positiva das condições das calçadas e\ntravessias na Área Central de Belo Horizonte','condicoes-calcada-centro','',NULL,NULL,NULL,'','','',NULL,NULL),
	(3,1,'App\\Axis','Percentual de avaliação positiva das condições das calçadas e\ntravessias nos bairros','condicoes-calcada-bairros','',NULL,NULL,NULL,'','','',NULL,NULL),
	(4,1,'App\\Axis','Percentual de avaliação positiva das condições da\ninfraestrutura cicloviária','condicoes-ciclovias','',NULL,NULL,NULL,'','','',NULL,NULL),
	(5,1,'App\\Axis','Percentual da população que vive no entorno da malha\ncicloviária','proximidade-ciclovias','',NULL,NULL,NULL,'','','',NULL,NULL),
	(6,1,'App\\Axis','Número de viagens por bicicleta, por dia, no sistema de\nbicicletas compartilhadas','bicicletas-compartilhadas','',NULL,NULL,NULL,'','','',NULL,NULL),
	(7,2,'App\\Program','Percentual de interseções com travessia total de pedestres em relação ao total de interseções semaforizadas.','travessias-semaforizadas','',NULL,NULL,NULL,'','','',NULL,NULL),
	(8,2,'App\\Program','Percentual de fatalidade de pedestres','fatalidade-pedestre','',NULL,NULL,NULL,'','','',NULL,NULL),
	(9,3,'App\\Program','Número de vagas públicas para bicicleta em paraciclos','vagas-paraciclo','',NULL,NULL,NULL,'','','',NULL,NULL),
	(10,3,'App\\Program','Percentual da extensão da rede cicloviária (ciclovias, ciclofaixas e rotas cicláveis, incluindo-se as ruas de zona 30) implantada','extensao-ciclovias','',NULL,NULL,NULL,'','','',NULL,NULL),
	(11,3,'App\\Program','Percentual da participação da bicicleta, conforme declarado na pesquisa de opinião','participacao-bicicleta','',NULL,NULL,NULL,'','','',NULL,NULL),
	(12,3,'App\\Program','Percentual de vítimas ciclistas em relação ao total de vítimas de acidentes','vitimas-ciclistas','',NULL,NULL,NULL,'','','',NULL,NULL),
	(14,0,'global','Taxa de mortalidade em acidentes de trânsito (mortos por 100 mil habitantes, considerando até 30 dias do acidente)','mortalidade-transito','',NULL,'','','','','',NULL,NULL),
	(15,0,'global','Toneladas de CO2 emitidas por habitante','co2-por-habitante','',NULL,'','','','','',NULL,NULL),
	(16,0,'global','Percentual de viagens a pé (em relação ao total de viagens)','viagens-a-pe','',NULL,'','','','','',NULL,NULL),
	(17,0,'global','Percentual de viagens em bicicleta (em relação ao total de viagens)','viagens-bicicleta','',NULL,'','','','','',NULL,NULL),
	(18,0,'global','Percentual de viagens em modos coletivos (em relação ao total de viagens)','viagens-coletivo','',NULL,'','','','','',NULL,NULL),
	(19,0,'global','Percentual de viagens em modos individuais (em relação ao total de viagens)','viagens-individual','',NULL,'','','','','',NULL,NULL),
	(20,2,'App\\Axis','Velocidade operacional média do transporte coletivo – Pico da tarde','velocidade-operacional','',NULL,'','','','','',NULL,NULL),
	(21,2,'App\\Axis','Razão entre o tempo de viagem do transporte coletivo em relação ao individual motorizado','velocidade-coletivo-individual','',NULL,'','','','','',NULL,NULL),
	(22,2,'App\\Axis','Percentual do gasto com transporte (em relação ao salário médio em Belo Horizonte)','percentual-transporte-salario','',NULL,'','','','','',NULL,NULL),
	(23,2,'App\\Axis','Índice de Conforto das Viagens – ICV','conforto-viagens','',NULL,'','','','','',NULL,NULL),
	(24,2,'App\\Axis','Índice de Cumprimento da Programação – ICP','cumprimento-programacao','',NULL,'','','','','',NULL,NULL),
	(25,2,'App\\Axis','Índice de Pontualidade das Viagens – IPV','pontualidade-viagens','',NULL,'','','','','',NULL,NULL),
	(26,2,'App\\Axis','Índice de Desempenho Operacional – IDO','desempenho-operacional','',NULL,'','','','','',NULL,NULL),
	(27,2,'App\\Axis','Percentual de avaliação positiva do transporte coletivo','avaliacao-coletivo','',NULL,'','','','','',NULL,NULL),
	(28,2,'App\\Axis','Percentual de viagens em modos coletivos em relação ao total de viagens em modos motorizados','percentual-coletivo-individual','',NULL,'','','','','',NULL,NULL),
	(29,4,'App\\Program','Extensão da rede estruturante implantada em relação ao planejado.','extensao-rede-estruturante','',NULL,NULL,NULL,'31%','73%','93%',NULL,NULL),
	(30,4,'App\\Program','Extensão da rede estruturante em relação à extensão total de vias com circulação do transporte coletivo','extensao-estruturante-vias-coletivo','',NULL,'','','6%','14%','18%',NULL,NULL),
	(31,4,'App\\Program','Razão entre a velocidade do ônibus e a do automóvel nos principais corredores.','razao-velocidade-onibus-automovel','',NULL,'','','0,6','0,8','1,0',NULL,NULL),
	(32,4,'App\\Program','Percentual de avaliação positiva do MOVE.','avaliacao-positiva-move','',NULL,'','','50%','55%','60%',NULL,NULL),
	(33,4,'App\\Program','Percentual de passageiros utilizando a rede estruturante (em relação ao total de passageiros dos sistemas de BRT - Transporte Rápido por Ônibus, BRS - Serviço Rápido por Ônibus, metrô, convencional e suplementar).','percentual-rede-estruturante','',NULL,'','','32%','51%','70%',NULL,NULL),
	(34,5,'App\\Program','Percentual de faixas exclusivas/preferenciais implantadas em relação ao total planejado.','faixas-exclusivas-total','',NULL,'','','100%','100%','100%',NULL,NULL),
	(35,5,'App\\Program','Percentual de passageiros utilizando o sistema convencional','percentual-sistema-convencional','',NULL,'','','67%','47%','36%',NULL,NULL),
	(36,5,'App\\Program','Índice de Confiabilidade Mecânica - ICM','confiabilidade-mecanica','',NULL,'','','Nível C – Admissível – 3','Nível B – Eficiência – 2','Nível A – Excelência – 1',NULL,NULL),
	(37,5,'App\\Program','Índice de Segurança das Viagens - ISV','seguranca-viagens','',NULL,'','','Nível C – Admissível – 3','Nível B – Eficiência – 2','Nível A – Excelência – 1',NULL,NULL),
	(38,5,'App\\Program','Índice de Infração Regulamentar - IIR','infracao-regulamentar','',NULL,'','','Nível C – Excelência – 3','Nível C – Excelência – 2','Nível C – Excelência – 1',NULL,NULL),
	(39,5,'App\\Program','Taxa de reclamação dos usuários','reclamacao-usuarios','',NULL,'','','60','50','40',NULL,NULL),
	(40,6,'App\\Program','Percentual de avaliação positiva do sistema suplementar.','avaliacao-positiva-suplementar','',NULL,'','','25%','30%','35%',NULL,NULL),
	(41,6,'App\\Program','Percentual de passageiros utilizando a rede complementar','percentual-rede-complementar','',NULL,'','','14%','15%','16%',NULL,NULL),
	(42,7,'App\\Program','Razão entre o valor médio pago nas viagens e o valor da tarifa predominante.','valor-medio-tarifa-predominante','',NULL,'','','0,85','0,75','0,65',NULL,NULL),
	(43,7,'App\\Program','Percentual de passageiros que pagam a tarifa regional.','passageiros-tarifa-regional','',NULL,'','','6,6%','8,3%','8,7%',NULL,NULL),
	(44,3,'App\\Axis','Taxa de atropelamentos por 100.000 habitantes.','atropelamentos-habitantes','',NULL,'','','63,50','43,09','31,75',NULL,NULL),
	(45,3,'App\\Axis','Número de vítimas em acidentes de trânsito por dia.','vitimas-transito-diarias','',NULL,'','','39,81','27,02','19,91',NULL,NULL),
	(46,3,'App\\Axis','Taxa de mortalidade em acidentes de trânsito (mortos no dia do acidente)','mortalidade-transito','',NULL,'','','4,97 / 100 mil habitantes','3,38 / 100 mil habitantes','2.94 / 100 mil habitantes',NULL,NULL),
	(47,8,'App\\Program','Taxa de atropelamentos por 100.000 habitantes.','atropelamentos-habitantes-2','',NULL,'','','63,50','43,09','31,75',NULL,NULL),
	(48,8,'App\\Program','Taxa de vítimas motociclistas em acidentes de trânsito \"in situ\" por 100 mil habitantes.','vitimas-in-situ','',NULL,'','','253,97','172,33','126,98',NULL,NULL),
	(49,8,'App\\Program','Taxa de projetos que foram objeto de auditoria e inspeção de segurança viária.','projetos-auditoria-viaria','',NULL,'','','50%','80%','100%',NULL,NULL),
	(50,8,'App\\Program','Extensão de vias que tiveram redução de limite de velocidade para 30 km/h com foco no Projeto Zona 30.','extensao-zona-30','',NULL,'','','25km','50km','75km',NULL,NULL),
	(51,9,'App\\Program','Extensão de vias que tiveram redução de limite de velocidade para 30 km/h com foco no Programa Zona 30.','extensao-zona-30-2','',NULL,'','','25km','50km','75km',NULL,NULL),
	(52,10,'App\\Program','Percentual de alunos participantes do programa de educação para a mobilidade da BHTRANS.','programa-educacao-mobilidade','',NULL,'','','70%','75%','80%',NULL,NULL),
	(53,10,'App\\Program','Percentual de motoristas e agentes de bordo do transporte público e escolar treinados em relação ao planejado.','motoristas-escolares-treinados','',NULL,'','','75%','100%','100%',NULL,NULL),
	(54,10,'App\\Program','Percentual de motoristas e agentes de bordo do transporte público e escolar treinados em relação ao planejado.','motoristas-escolares-treinados','',NULL,'','','75%','100%','100%',NULL,NULL),
	(55,4,'App\\Axis','Percentual de participação do modo individual na distribuição modal','participacao-individual-modal','',NULL,'','','','','',NULL,NULL),
	(56,4,'App\\Axis','Nível de serviço das principais vias','nivel-servico-vias','',NULL,'','','Nível de serviço A, 69%; Nível de serviço B, 22% e nível de serviço C, 9%.','Nível de serviço A, 73%; Nível de serviço B, 20% e nível de serviço C, 7%.','Nível de serviço A, 77%; Nível de serviço B, 18% e nível de serviço C, 5%.',NULL,NULL),
	(57,4,'App\\Axis','Razão entre o preço do estacionamento rotativo e o valor da passagem de ônibus','razao-tarifa-rotativo','',NULL,'','','1,0','1,5','3',NULL,NULL),
	(58,4,'App\\Axis','Produtividade do serviço de táxi em horas','produtividade-taxi','',NULL,'','','0,35','0,45','0,50',NULL,NULL),
	(59,14,'App\\Program','Percentual de participação do modo individual na distribuição modal','participacao-individual-modal-2','',NULL,'','','','','',NULL,NULL),
	(60,14,'App\\Program','Nível de serviço das principais vias','nivel-servico-vias-2','',NULL,'','','Nível de serviço A, 69%; Nível de serviço B, 22% e nível de serviço C, 9%.','Nível de serviço A, 73%; Nível de serviço B, 20% e nível de serviço C, 7%.','Nível de serviço A, 77%; Nível de serviço B, 18% e nível de serviço C, 5%.',NULL,NULL),
	(61,15,'App\\Program','Produtividade do serviço de táxi em horas','produtividade-taxi-2','',NULL,'','','0,35','0,45','0,50',NULL,NULL),
	(62,15,'App\\Program','Produtividade do serviço de táxi em quilômetros','produtividade-taxi-quilometros','',NULL,'','','0,40','0,50','0,60',NULL,NULL),
	(63,15,'App\\Program','Número de táxis por mil habitantes','taxis-por-habitantes','',NULL,'','','3','3','3',NULL,NULL),
	(64,16,'App\\Program','Razão entre o preço do estacionamento rotativo e o valor da passagem de ônibus','razao-tarifa-rotativo-2','',NULL,'','','1,0','1,5','3',NULL,NULL),
	(65,16,'App\\Program','Rotatividade no estacionamento rotativo','rotatividade-rotativo','',NULL,'','','4 veículos por vaga por dia','6 veículos por vaga por dia','8 veículos por vaga por dia',NULL,NULL),
	(66,5,'App\\Axis','Percentual da ocupação das áreas de carga e descarga (CD) por veículos fora de operação de carga e descarga','ocupacao-carga-fora-operacao','',NULL,'','','35%','23%','12%',NULL,NULL),
	(67,5,'App\\Axis','Tempo médio das operações de carga e descarga na via pública','tempo-carga-descarga','',NULL,'','','56 minutos','47 minutos','40 minutos',NULL,NULL),
	(68,5,'App\\Axis','Taxa de instalações logísticas em relação à área de Belo Horizonte','taxa-instalacoes-logisticas','',NULL,'','','650','910','1300',NULL,NULL),
	(69,5,'App\\Axis','Taxa de pontos de entrega/coleta em Belo Horizonte','pontos-entrega-coleta','',NULL,'','','67','134','162',NULL,NULL),
	(70,17,'App\\Program','Percentual da ocupação das áreas de carga e descarga (CD) por veículos fora de operação de carga e descarga','ocupacao-carga-fora-operacao-2','',NULL,'','','35%','23%','12%',NULL,NULL),
	(71,17,'App\\Program','Tempo médio das operações de carga e descarga na via pública','tempo-carga-descarga-2','',NULL,'','','56 minutos','47 minutos','40 minutos',NULL,NULL),
	(72,17,'App\\Program','Taxa de mortalidade em acidentes de trânsito envolvendo veículos urbanos de carga','mortalidade-veiculos-carga','',NULL,'','','6,27%','4,26%','3,13%',NULL,NULL),
	(73,17,'App\\Program','Percentual de equipamentos com capacidade de fiscalização de caminhões, em áreas ou corredores com restrição aos veículos de carga','equipamentos-fiscalizacao-carga','',NULL,'','','30%','80%','100%',NULL,NULL),
	(74,18,'App\\Program','Taxa de instalações logísticas em relação à área de Belo Horizonte','taxa-instalacoes-logisticas-2','',NULL,'','','650','910','1300',NULL,NULL),
	(75,18,'App\\Program','Taxa de pontos de entrega/coleta em Belo Horizonte','pontos-entrega-coleta-2','',NULL,'','','67','134','162',NULL,NULL),
	(76,6,'App\\Axis','Percentual de unidades residenciais aprovados nas OUCs na cidade (Proporção, em relação ao total da cidade, de unidades residenciais aprovadas nas áreas de Operações Urbanas Consorciadas - OUC)','percentual-residencial-ouc','',NULL,'','','Não há','20%','25%',NULL,NULL),
	(77,6,'App\\Axis','Percentual das áreas não residenciais aprovados nas OUCs na cidade (Proporção, em relação ao total da cidade, de unidades não residenciais aprovadas nas áreas de Operações Urbanas Consorciadas - OUC)','percentual-nao-residencial-ouc','',NULL,'','','Não há','10%','50%',NULL,NULL),
	(78,6,'App\\Axis','Percentual das áreas das OUCs regulamentadas (Proporção, em relação ao total previsto no Plano Diretor Municipal, de área de OUCs regulamentadas)','percentual-ouc-regulamentado','',NULL,'','','Não há','40%','50%',NULL,NULL),
	(79,6,'App\\Axis','PM 10 médias (Quantidade de material particulado na atmosfera por m³)','pm-10-medias','',NULL,'','','50µg/m³','45µg/m³','40µg/m³',NULL,NULL),
	(80,6,'App\\Axis','Percentual de renovação da frota de ônibus por veículos híbridos ou não movidos a derivados do petróleo','renovacao-frota-hibridos','',NULL,'','','Não há','20%','40%',NULL,NULL),
	(81,6,'App\\Axis','Emissões de gases de efeito estufa – EG Rodoviário (milhões de toneladas de CO² equivalentes)','emissao-gases-estufa','',NULL,'','','2,73','2,88','3,06',NULL,NULL),
	(82,19,'App\\Program','Unidades residenciais aprovadas na OUC-ACLO - Operação Urbana Consorciada Antônio Carlos – Pedro I – Leste-Oeste','residenciais-ouc-aclo','',NULL,'','','Não há','30.000','48.000',NULL,NULL),
	(83,19,'App\\Program','Áreas das unidades não residenciais aprovados na OUC- ACLO','area-naoresilenciais-ouc-aclo','',NULL,'','','Não há','120.000m²','1.200.000m²',NULL,NULL),
	(84,19,'App\\Program','Proporção de vagas de bicicletas disponibilizadas em empreendimentos de impacto. (Número de vagas de bicicletas disponibilizadas por 1.000 m² de área bruta de empreendimentos de impacto)','vagas-bicicleta-alto-impacto','',NULL,'','','2','2,5','3',NULL,NULL),
	(85,19,'App\\Program','Percentual de análises técnicas de processos de empreendimentos emitidas no prazo','analises-empreendimentos-prazo','',NULL,'','','100%','100%','100%',NULL,NULL),
	(86,20,'App\\Program','Percentual de veículos movidos a combustíveis não fósseis na frota contratada pelo município','veiculos-nao-fosseis','',NULL,'','','20%','50%','100%',NULL,NULL),
	(87,21,'App\\Program','Percentual das novas vias destinadas ao transporte coletivo (Percentual da extensão das novas vias implantadas com destinação ao sistema estrutural e auxiliar do transporte coletivo)','novas-vias-coletivo','',NULL,'','','40%','50%','60%',NULL,NULL),
	(88,21,'App\\Program','Vias do VIURBS destinadas ao transporte coletivo implantadas (Novas vias previstas no VIURBS com destinação ao sistema de transporte coletivo implantadas)','vias-viurbs-coletivo','',NULL,'','','4','12','52',NULL,NULL),
	(89,7,'App\\Axis','Percentual da frota de ônibus com alguma facilidade no embarque/desembarque no transporte coletivo','onibus-acessiveis','',NULL,'','','100%','100%','100%',NULL,NULL),
	(90,7,'App\\Axis','Percentual da frota com embarque em nível','embarque-nivel','',NULL,'','','25%','40%','60%',NULL,NULL),
	(91,7,'App\\Axis','Percentual de avaliação positiva das condições das calçadas e\ntravessias na Área Central de Belo Horizonte','condicoes-calcada-centro-2','',NULL,NULL,NULL,'','','',NULL,NULL),
	(93,7,'App\\Axis','Percentual de avaliação positiva das condições das calçadas e\ntravessias nos bairros','condicoes-calcada-bairros-2','',NULL,NULL,NULL,'','','',NULL,NULL),
	(94,7,'App\\Axis','Percentual de gasto com transporte coletivo em relação ao salário mínimo','gasto-transporte-salario-minimo','',NULL,NULL,NULL,'18%','15%','12%',NULL,NULL),
	(95,22,'App\\Program','Número de estações com acessibilidade adequada aos critérios de desenho universal','estacoes-acessiveis','',NULL,'','','40','162','162',NULL,NULL),
	(96,23,'App\\Program','Percentual de avaliação positiva das condições das calçadas e travessias na Área Central de Belo Horizonte','condicoes-calcada-centro-3','',NULL,NULL,NULL,'','','',NULL,NULL),
	(97,23,'App\\Program','Percentual de avaliação positiva das condições das calçadas e\ntravessias nos bairros','condicoes-calcada-bairros-3','',NULL,NULL,NULL,'','','',NULL,NULL),
	(98,23,'App\\Program','Percentual de interseções com travessia total de pedestres em relação ao total de interseções semaforizadas.','travessias-semaforizadas-2','',NULL,NULL,NULL,'','','',NULL,NULL),
	(99,23,'App\\Program','Extensão de calçadas - com pontos de ônibus, com acessibilidade universal em corredores estruturantes','calcadas-onibus-acessiveis','',NULL,NULL,NULL,'126 km','362 km','472 km',NULL,NULL),
	(100,24,'App\\Program','Percentual de gasto com transporte coletivo em relação ao salário mínimo','gasto-transporte-salario-minimo-2','',NULL,NULL,NULL,'18%','15%','12%',NULL,NULL),
	(101,8,'App\\Axis','Total de Recursos (R$) investidos em Mobilidade Urbana por habitante por ano','recursos-mobilidade-cidadao','',NULL,'','','','','',NULL,NULL),
	(102,8,'App\\Axis','Percentual de recursos efetivamente aplicados em Mobilidade Urbana','recursos-mobilidade-efetivo','',NULL,'','','85%','90%','95%',NULL,NULL),
	(103,25,'App\\Program','Nível de serviço das principais vias','nivel-servico-vias-2','',NULL,'','','Nível de serviço A, 69%; Nível de serviço B, 22% e nível de serviço C, 9%.','Nível de serviço A, 73%; Nível de serviço B, 20% e nível de serviço C, 7%.','Nível de serviço A, 77%; Nível de serviço B, 18% e nível de serviço C, 5%.',NULL,NULL),
	(105,25,'App\\Program','Índice de agentes de fiscalização de trânsito – IAT (Número de agentes de fiscalização de trânsito pela frota de veículos cadastrados)','indice-agentes-fiscalizacao','',NULL,'','','8,0','9,0','10,0',NULL,NULL),
	(106,25,'App\\Program','Índice de veículos infratores no estacionamento rotativo','indice-infracao-rotativo','',NULL,'','','65%','50%','30%',NULL,NULL),
	(107,26,'App\\Program','Percentual de recursos efetivamente aplicados em Mobilidade Urbana','recursos-mobilidade-efetivo-2','',NULL,'','','85%','90%','95%',NULL,NULL),
	(108,26,'App\\Program','Percentual do orçamento municipal investido em Mobilidade Urbana','percentual-orcamento-mobilidade','',NULL,'','','','','',NULL,NULL),
	(109,27,'App\\Program','Percentual de pontos de parada dotados de painéis com informação em tempo real (em relação ao planejado)','pontos-paineis-informacao','',NULL,'','','80%','100%','100%',NULL,NULL),
	(110,27,'App\\Program','Percentual de avaliação positiva da disseminação das informações para a escolha dos modos de deslocamento','pontos-paineis-informacao','',NULL,'','','50%','55%','66%',NULL,NULL);

/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(8,'2014_10_12_000000_create_users_table',1),
	(9,'2014_10_12_100000_create_password_resets_table',1),
	(10,'2018_01_21_103728_create_axes_table',1),
	(11,'2018_01_21_103820_create_actions_table',1),
	(12,'2018_01_21_103918_create_programs_table',1),
	(13,'2018_01_21_103924_create_indicators_table',1),
	(14,'2018_03_25_004502_create_subscriptions_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump da tabela programs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `programs`;

CREATE TABLE `programs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `axis_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modals` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;

INSERT INTO `programs` (`id`, `axis_id`, `name`, `alias`, `image`, `description`, `modals`, `tags`, `created_at`, `updated_at`)
VALUES
	(2,1,'BH a Pé','bh-a-pe',NULL,'O programa BH a Pé visa dar prioridade para a caminhada como opção mais segura, saudável e confortável para deslocamentos, em especial os de pequena distância. Assim, busca principalmente melhorar as calçadas e travessias na cidade, com prioridade para áreas de maior acesso de pessoas.','pedestre','a pé|caminhar|pedestre|andar a pé|passeio|calçada|mobilidade ativa',NULL,NULL),
	(3,1,'Pedala BH','pedala-bh',NULL,'O programa Pedala BH busca ampliar a participação da bicicleta na matriz de deslocamentos urbanos, incentivando seu uso a partir de políticas de integração com outros modos, ampliação de infraestrutura e ações que visem garantir a segurança do ciclista nas vias, além de outros estímulos.','bicicleta','bicicleta|mobilidade ativa|pedalar|paraciclos|bicicleta compartilhada|bikebh|bicicletário|ciclovia|ciclofaixa|zona 30|ciclorrota',NULL,NULL),
	(4,2,'Rede Estruturante','rede-estruturante',NULL,'O programa tem como objetivo reestruturar as linhas do sistema convencional em sistemas tronco-alimentados, tendo o metrô e sistemas de média capacidade como sistemas troncais, integrados física e tarifariamente em estações de integração e transferência, com tratamento do sistema viário para a operação em pistas/faixas exclusivas.','onibus|metro','sistema convencional|BRT|BRS|metrô|alta capacidade|média capacidade|tarifa|pista exclusiva|faixa exclusiva|faixa preferencial|rede estruturante|MOVE',NULL,NULL),
	(5,2,'Rede Convencional','rede-convencional',NULL,'O objetivo do programa é implantar faixas exclusivas ou preferenciais nas principais vias onde circulam as linhas do serviço convencional, visando proporcionar melhorias no tempo e na regularidade das viagens, reestruturar as linhas remanescentes dos sistemas estruturantes e implantar ajustes e/ou novas linhas para atendimento às modificações do uso e ocupação do solo e às necessidades de fortalecimento das centralidades.','onibus','sistema convencional|tarifa|pista exclusiva|faixa exclusiva|faixa preferencial|rede convencional',NULL,NULL),
	(6,2,'Rede Complementar','rede-complementar',NULL,'O programa tem por fim ampliar e melhorar o atendimento dos serviços de transporte coletivo para atrair o usuário do transporte privado para o serviço seletivo, reforçar as ligações intra e inter-regionais pelo serviço suplementar, garantir o acesso e circulação em vilas e favelas, estimular o uso do transporte escolar para atrair o usuário do transporte privado e incentivar a utilização do transporte fretado.','onibus','suplementar|executivo|vilas|favelas|escolar|fretado',NULL,NULL),
	(7,2,'Programa Tarifário','programa-tarifario',NULL,'O objetivo deste programa é implantar uma política tarifária que promova a redução dos gastos da população com transporte, em especial as pessoas com baixa renda, para garantir que a mobilidade seja uma política de inclusão social na capital mineira.\n','onibus|metro','tarifa|tarifário|gratuidade|bhbus|integração tarifária|MOVE|fundo municipal|fstc|subsídio|bilhete único',NULL,NULL),
	(8,3,'Programa de Segurança','programa-seguranca',NULL,'O objetivo deste programa é reduzir os índices e a gravidade das colisões (acidentes) de trânsito em Belo Horizonte, em especial dos atropelamentos e daqueles envolvendo motociclista, através do desenvolvimento das medidas de segurança.','pedestre|bicicleta|individual motorizada|onibus|logistica','segurança|viária|colisões|acidentes|atropelamentos',NULL,NULL),
	(9,3,'Humanização do Trânsito e Promoção do Convívio no Espaço Público','humanizacao-transito',NULL,'O programa tem por objetivo reduzir os impactos do trânsito na qualidade de vida da população e ampliar as áreas de convívio, bem-estar e vitalidade, implementando medidas que deem segurança à pessoas que circulam, em especial, a pé e de bicicleta.\n','pedestre|bicicleta|individual motorizada|onibus|logistica','zona 30|bicicleta|parklets|varandas urbanas|velocidades',NULL,NULL),
	(10,3,'Educação para A Mobilidade','educacao-mobilidade',NULL,'O objetivo deste programa é efetivar a educação para a mobilidade, de forma a trabalhar, em cada cidadão e em toda a comunidade, princípios, valores, conhecimentos, habilidades e atitudes favoráveis à locomoção no espaço social, convivendo no trânsito de modo disciplinado, seguro e ambientalmente favorável. Também os operadores do transporte público e escolar devem ser treinados para serem referência no trato com os usuários e demais motoristas.\n','pedestre|bicicleta|individual motorizada|onibus|logistica','educação|campanha|jovem|alunos|comunicação',NULL,NULL),
	(11,3,'Racionalização do Uso do Transporte Individual Privado','racionalizacao-individual',NULL,'O objetivo deste programa é criar medidas de racionalização do uso de veículos particulares motorizados (carros e motocicletas, em especial) para reduzir os congestionamentos da cidade, a emissão de gases de efeito estufa, de poluentes atmosféricos e outros impactos.','individual motorizado','automóveis|motocicletas|transporte individual motorizado',NULL,NULL),
	(12,3,'Transporte Público Individual','publico-individual',NULL,'O objetivo deste programa é ofertar serviços de táxi compatíveis com a demanda e novas tendências, de forma a promover a sua utilização em detrimento ao transporte individual privado (motocicletas e automóveis).','individual motorizado','taxis|automóveis|motocicletas',NULL,NULL),
	(13,3,'Estacionamento','estacionamento',NULL,'O objetivo deste programa é dar coerência a oferta e ao preço das vagas de estacionamento para desestimular o uso do automóvel e da motocicleta.','individual motorizado|logistica','logística|carga|descarga|entrega|mercadoria',NULL,NULL),
	(14,4,'Racionalização do Uso do Transporte Individual Privado','racionalizacao-individual-2',NULL,'O objetivo deste programa é criar medidas de racionalização do uso de veículos particulares motorizados (carros e motocicletas, em especial) para reduzir os congestionamentos da cidade, a emissão de gases de efeito estufa, de poluentes atmosféricos e outros impactos.','individual motorizado','automóveis|motocicletas|transporte individual motorizado',NULL,NULL),
	(15,4,'Transporte Público Individual','publico-individual-2',NULL,'O objetivo deste programa é ofertar serviços de táxi compatíveis com a demanda e novas tendências, de forma a promover a sua utilização em detrimento ao transporte individual privado (motocicletas e automóveis).','individual motorizado','taxis|automóveis|motocicletas',NULL,NULL),
	(16,4,'Estacionamento','estacionamento-2',NULL,'O objetivo deste programa é dar coerência a oferta e ao preço das vagas de estacionamento para desestimular o uso do automóvel e da motocicleta.','individual motorizado|logistica','logística|carga|descarga|entrega|mercadoria',NULL,NULL),
	(17,5,'Circulando e Entregando Melhor','entregando-melhor',NULL,'O programa objetiva garantir a distribuição urbana de mercadorias de forma mais efetiva e segura, por meio da combinação de medidas que visam disciplinar e ampliar o acesso e o uso das áreas de carga e descarga, além de promover campanhas educativas e apoiar os treinamentos para os agentes da cadeia de abastecimento.','logistica','logística|carga|descarga|entrega|mercadoria',NULL,NULL),
	(18,5,'Cooperando com o Abastecimento da Cidade','cooperando-abastecimento',NULL,'O Programa pretende promover a articulação e cooperação entre os agentes da cadeia de abastecimento, entendendo as especificidades de cada um, com a finalidade de torná-la mais efetiva, com redução de custos, impactos sociais e ambientais.','logistica','logística|carga|descarga|entrega|mercadoria',NULL,NULL),
	(19,6,'Programa Desenvolvimento Orientado para o Transporte (Transit Oriented Development – TOD)','desenvolvimento-transporte',NULL,'O objetivo deste programa é viabilizar e tornar mais atrativas as áreas das Operações Urbanas Consorciadas – OUCs e das novas centralidades e suas áreas de influência direta para o transporte coletivo de maior capacidade, através do seu adensamento, atração de usos não residenciais e requalificação urbana, incluindo, especialmente, o tratamento prioritário dos modos ativos (também conhecidos como modos não motorizados) e do transporte coletivo.','ônibus|metrô|bicicleta|pedestre','TOD|DOT|OUC|Operação Urbana Consorciada',NULL,NULL),
	(20,6,'Qualificação Ambiental da Mobilidade','qualificacao-ambiental',NULL,'O Programa visa reduzir as emissões de gases de efeito estufa (GEE) em relação à tendência de emissões de GEE, bem como as emissões de poluentes que comprometem a qualidade de vida dos seres humanos e animais de Belo Horizonte, por meio de medidas de acompanhamento permanente dos volumes de combustíveis consumidos, da fiscalização das emissões, da substituição de frotas e da articulação com órgãos dos três níveis de governo, para prospecção permanente de possibilidades tecnológicas e de oportunidades de mercado.\n','individual motorizada|bicicleta','gases de efeito estufa|poluição local|do ar|gee|emissões|qualidade do ar',NULL,NULL),
	(21,6,'Sistema Viário','sistema-viario',NULL,'O objetivo deste programa é priorizar a implantação e o uso das vias destinadas ao transporte coletivo. O Programa consiste em apoiar, acompanhar e participar dos projetos e implantações destas vias destinadas ao transporte coletivo dentro do VIURBS (Programa de Estruturação Viária de Belo Horizonte). ','individual motorizada|onibus','viurbs|priorização|brt|brs|faixa exclusiva|prioritária|pista exclusiva preferencial',NULL,NULL),
	(22,7,'Acessibilidade no Transporte Público Coletivo','acessibilidade-transporte-publico',NULL,'O programa visa implementar ações e políticas que garantam a acessibilidade física para pessoas com deficiência e restrição de mobilidade, em acordo com a Política Nacional de Mobilidade Urbana e outros marcos legais vigentes aos projetos públicos e fiscalização do cumprimento das leis junto às ações privadas; adequação da infraestrutura e da frota de veículos, em conformidade com os requisitos de acessibilidade universal.','pedestre|onibus|metro','acessibilidade|pessoa com deficiência|PcD|desenho universal',NULL,NULL),
	(23,7,'Acessibilidade em Calçadas e Travessias','acessibilidade-calcadas',NULL,'O programa pretende dotar a cidade de infraestrutura acessível e adequada para a circulação de pessoas em modos de transporte ativos, contemplando ações nas vias (calçadas, travessias e infraestruturas para ciclistas), na sinalização adequada (regulamentação e indicativa), além de ações educativas e de promoção desses modos, de tecnologias assistivas e ações que apoiem as medidas.','pedestre|bicicleta|metro|onibus','acessibilidade|pessoa com deficiência|PcD|desenho universal|ciclovias|ciclofaixas|pedestre|mobilidade ativa|transporte ativo|calçada|passeio',NULL,NULL),
	(24,7,'Inclusão Social','inclusao-social',NULL,'O objetivo deste programa é ampliar a acessibilidade ao transporte coletivo, como fator de desenvolvimento social propiciando a inclusão, em especial, das pessoas e famílias com menor renda.','onibus|metro','tarifa|gasto|custo|favela|vilas|política tarifaria|tarifa pública ',NULL,NULL),
	(25,8,'Fiscalização da Mobilidade','fiscalizacao-mobilidade',NULL,'O programa busca aprimorar e melhorar de forma efetiva os mecanismos de fiscalização, quer no tocante à mobilidade ativa, coletiva e também dos transportes individuais motorizados com intuito de garantir condições mais adequadas à mobilidade em Belo Horizonte.','pedestre|bicicleta|individual motorizada|onibus|metro|logistica','fiscalização|tecnologia|estacionamento rotativo|vaga',NULL,NULL),
	(26,8,'Gestão do PlanMob-BH','gestao-planmob',NULL,'O objetivo do programa é prospectar e buscar obter novos recursos, financeiros e tecnológicos, para investimento na melhoria da mobilidade urbana em Belo Horizonte.','pedestre|bicicleta|individual motorizada|onibus|metro|logistica','gestão|investimento|fundo mobilidade|captação|financiamento|governança',NULL,NULL),
	(27,8,'Informação da Mobilidade','informacao-mobilidade',NULL,'O programa visa ampliar e ofertar informações de qualidade sobre os serviços públicos de mobilidade, garantindo sua maior eficiência, eficácia e efetividade, ampliando os canais de informação à diversidade de usuários de todos os modos de transporte, divulgando os benefícios de sua utilização e estimulando o seu uso.','pedestre|bicicleta|individual motorizada|onibus|metro|logistica','informação|tecnologia|aplicativo|internet|painel|inteligente|dados|indicadores',NULL,NULL);

/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscriptions`;

CREATE TABLE `subscriptions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `news` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;