--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.4.1
-- Started on 2015-06-01 17:02:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 172 (class 3079 OID 11787)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1978 (class 0 OID 0)
-- Dependencies: 172
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 16574)
-- Name: Diccionario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Diccionario" (
    "Id" integer NOT NULL,
    "Espanol" character varying(50),
    "Kaqchikel" character varying(50)
);


ALTER TABLE "Diccionario" OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16572)
-- Name: Diccionario_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Diccionario_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Diccionario_Id_seq" OWNER TO postgres;

--
-- TOC entry 1979 (class 0 OID 0)
-- Dependencies: 170
-- Name: Diccionario_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Diccionario_Id_seq" OWNED BY "Diccionario"."Id";


--
-- TOC entry 1859 (class 2604 OID 16577)
-- Name: Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Diccionario" ALTER COLUMN "Id" SET DEFAULT nextval('"Diccionario_Id_seq"'::regclass);


--
-- TOC entry 1970 (class 0 OID 16574)
-- Dependencies: 171
-- Data for Name: Diccionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Diccionario" ("Id", "Espanol", "Kaqchikel") FROM stdin;
1	laguna	cho
2	tierra	ulew
3	gracias	matyox
4	lago	cho
6	piedra	ab&#39;aj
5	hombre	achi
7	perlas	ab&#39;aj etz&#39;ab&#39;al
8	perlas	ab&#39;aj chachal
9	perlas	kachupchatik ab&#39;aj
11	acompañado	awichb&#39;ilam
12	acompañado	awa&#39;chi&#39;lam
10	acompañado	achb&#39;ilam
13	hombres	achijab&#39;
14	celar	achixinik
15	celoso	achixom
16	acompañado de	achi&#39;lam
17	habitante de	aj
18	carpintero	ajanel
19	carpintero	josol che&#39;
20	carpintero	ajtz&#39;alam
21	dueño	ajaw
22	señor	ajawxel
23	reino	ajawib&#39;al
24	reino	ajawarem
25	rey	ajawinal
26	rey	ajawinel
27	tranquilidad	aja&#39;maril
28	tranquilidad	ja&#39;maril
29	alfarero	ajb&#39;anol b&#39;o&#39;j
30	alfarero	ajb&#39;anal
31	marineros	ajb&#39;insanel jukub&#39;
32	centinela	ajchajinel
33	trabajador	ajchakunel
34	pescador	ajchapal kar
35	triunfador	ajch&#39;akanel
36	herrero	ajch&#39;iyil ch&#39;ich&#39;
37	soldado	ajch&#39;o&#39;j
38	heredero	ajecheb&#39;anelab&#39;
39	medico	ajkunanel
40	medico	ajkun
41	vendedor	ajk&#39;ayib&#39;
42	juez	ajq&#39;atal tzij
43	curtidor	ajq&#39;olol tz&#39;um
44	arriba	ajsik
45	maestro	ajtij
46	aguja	b&#39;aq
47	aguja	akuxa
48	escritor	ajtz&#39;ib&#39;
49	escritor	ajtz&#39;ib&#39;anel
50	pastor	ajyuq&#39;
51	serpiente	akan
52	serpiente	rax k&#39;el
53	serpiente	rax kan
54	niño	ak&#39;al
55	muchacho	ala
56	cuerpo	b&#39;aqil
57	b'aq'atim	enrollado
58	pequeño	alaj
59	b'atz'	hilo
60	muchacha	ali
61	nuera	alib&#39;atz
62	nuera	alib&#39;axel
63	nuera	lib&#39;axel
64	impuesto	alkab&#39;al
65	nacion	amaq&#39;
66	frecuentemente	amaq&#39;el
67	siempre	amaq&#39;el
68	macho	ama&#39;
69	gallo	ama&#39; ek&#39;
70	gallo	k&#39; ojol
71	gallo	mam
72	gallo	toro&#39;y
73	corazon	anima&#39;
74	rapidamente	aninaq
75	inmediatamente	aninaquil
76	inmediatamente	xaqb&#39;i&#39;
77	cerca	apanoq
78	cerca	apan
79	marrano	aq
80	noche	aq&#39;ab&#39;
81	para que	arech
82	para que	arecha&#39;
83	cuando	arechi&#39;
84	cuando	aretaq chi&#39;
85	el	are&#39;
86	ella	are&#39;
87	ello	are&#39;
88	tu	at
89	hembra	ati&#39;t
91	trapo	atz&#39;yaq
90	ropa	atz&#39;yaq
92	tela	atz&#39;yaq
93	escondido	awam
94	no	ayi&#39;
95	no	jayi&#39;
96	bieldo	chab&#39;al triko
97	ceniza	chaj
98	luz	chäj
99	ocote	chäj
100	candelabro	chäjb&#39;al
101	en camino	b&#39;enaq
103	caminado	b&#39;ininaq
104	temor	b&#39;irb&#39;itkil
105	temor	b&#39;irb&#39;itik
106	fuente	b&#39;ulb&#39;ux
102	esta dicho	b&#39;im
\.


--
-- TOC entry 1980 (class 0 OID 0)
-- Dependencies: 170
-- Name: Diccionario_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Diccionario_Id_seq"', 106, true);


--
-- TOC entry 1861 (class 2606 OID 16579)
-- Name: pk_tabla_diccionario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Diccionario"
    ADD CONSTRAINT pk_tabla_diccionario PRIMARY KEY ("Id");


--
-- TOC entry 1977 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-06-01 17:02:50

--
-- PostgreSQL database dump complete
--

