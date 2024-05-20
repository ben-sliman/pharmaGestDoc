--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-05-06 10:49:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16423)
-- Name: Employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Employee" (
    "EMPLOYEE_ID" integer NOT NULL,
    "FIRST_NAME" character varying(255),
    "LAST_NAME" character varying(255),
    "EMAIL" character varying(255),
    "PHONE_NUMBER" character varying(20),
    "POSTE" character varying(255)
);


ALTER TABLE public."Employee" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16422)
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_employee_id_seq OWNER TO postgres;

--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 215
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public."Employee"."EMPLOYEE_ID";


--
-- TOC entry 220 (class 1259 OID 16442)
-- Name: medicament; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicament (
    id integer NOT NULL,
    dci character varying(255) NOT NULL,
    nom character varying(255) NOT NULL,
    dosage character varying(50),
    forme character varying(50),
    prix numeric(10,2) NOT NULL,
    date_peremption date,
    stock integer NOT NULL
);


ALTER TABLE public.medicament OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16441)
-- Name: medicament_id_medicament_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicament_id_medicament_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medicament_id_medicament_seq OWNER TO postgres;

--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 219
-- Name: medicament_id_medicament_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicament_id_medicament_seq OWNED BY public.medicament.id;


--
-- TOC entry 223 (class 1259 OID 16472)
-- Name: ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket (
    id integer NOT NULL,
    nom character varying(255),
    date date,
    prix_total double precision
);


ALTER TABLE public.ticket OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16451)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    identifiant character varying(255) NOT NULL,
    mdp character varying(255) NOT NULL
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16450)
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 221
-- Name: utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;


--
-- TOC entry 218 (class 1259 OID 16433)
-- Name: vente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vente (
    numero_vente integer NOT NULL,
    date_vente timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    type_vente character varying(50),
    prix_total numeric(10,2),
    CONSTRAINT vente_type_vente_check CHECK (((type_vente)::text = ANY ((ARRAY['sans_ordonnance'::character varying, 'avec_ordonnance'::character varying])::text[])))
);


ALTER TABLE public.vente OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16432)
-- Name: vente_numero_vente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vente_numero_vente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vente_numero_vente_seq OWNER TO postgres;

--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 217
-- Name: vente_numero_vente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vente_numero_vente_seq OWNED BY public.vente.numero_vente;


--
-- TOC entry 4653 (class 2604 OID 16477)
-- Name: Employee EMPLOYEE_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee" ALTER COLUMN "EMPLOYEE_ID" SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- TOC entry 4656 (class 2604 OID 16478)
-- Name: medicament id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicament ALTER COLUMN id SET DEFAULT nextval('public.medicament_id_medicament_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 16479)
-- Name: utilisateur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);


--
-- TOC entry 4654 (class 2604 OID 16480)
-- Name: vente numero_vente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vente ALTER COLUMN numero_vente SET DEFAULT nextval('public.vente_numero_vente_seq'::regclass);


--
-- TOC entry 4813 (class 0 OID 16423)
-- Dependencies: 216
-- Data for Name: Employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Employee" ("EMPLOYEE_ID", "FIRST_NAME", "LAST_NAME", "EMAIL", "PHONE_NUMBER", "POSTE") FROM stdin;
4	Mohamad	LERAGEUX	boloss123@gmail.com	\N	\N
5	bg	bg2	bg3@gmail.com	\N	\N
6	Ben sli	azirari	bonjour@gmail.com	\N	\N
\.


--
-- TOC entry 4817 (class 0 OID 16442)
-- Dependencies: 220
-- Data for Name: medicament; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicament (id, dci, nom, dosage, forme, prix, date_peremption, stock) FROM stdin;
1	Paracétamol	Doliprane	500 mg	Comprimé	50.00	2024-01-01	100
2	Ibuprofène	Advil	200 mg	Comprimé	75.25	2024-02-01	150
3	Amoxicilline	Amoxil	250 mg	Capsule	120.50	2024-03-01	80
4	Loratadine	Claritin	10 mg	Comprimé	90.75	2024-04-01	120
5	Omeprazole	Prilosec	20 mg	Gélule	110.25	2024-05-01	200
\.


--
-- TOC entry 4820 (class 0 OID 16472)
-- Dependencies: 223
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket (id, nom, date, prix_total) FROM stdin;
\.


--
-- TOC entry 4819 (class 0 OID 16451)
-- Dependencies: 222
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id, nom, prenom, identifiant, mdp) FROM stdin;
1	Admin	Pharamacien	Admin1	Admin123
\.


--
-- TOC entry 4815 (class 0 OID 16433)
-- Dependencies: 218
-- Data for Name: vente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vente (numero_vente, date_vente, type_vente, prix_total) FROM stdin;
\.


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 215
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 6, true);


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 219
-- Name: medicament_id_medicament_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicament_id_medicament_seq', 5, true);


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 221
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 9, true);


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 217
-- Name: vente_numero_vente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vente_numero_vente_seq', 1, false);


--
-- TOC entry 4660 (class 2606 OID 16430)
-- Name: Employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Employee"
    ADD CONSTRAINT employee_pkey PRIMARY KEY ("EMPLOYEE_ID");


--
-- TOC entry 4664 (class 2606 OID 16449)
-- Name: medicament medicament_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicament
    ADD CONSTRAINT medicament_pkey PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 16476)
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- TOC entry 4666 (class 2606 OID 16458)
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- TOC entry 4662 (class 2606 OID 16440)
-- Name: vente vente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vente
    ADD CONSTRAINT vente_pkey PRIMARY KEY (numero_vente);


-- Completed on 2024-05-06 10:49:39

--
-- PostgreSQL database dump complete
--

