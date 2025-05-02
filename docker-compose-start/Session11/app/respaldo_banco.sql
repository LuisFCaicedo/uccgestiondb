--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20 (Debian 13.20-1.pgdg120+1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cuentas; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cuentas (
    id_cuenta integer NOT NULL,
    nombre_cliente character varying NOT NULL,
    saldo numeric NOT NULL
);


ALTER TABLE public.cuentas OWNER TO admin;

--
-- Name: cuentas_id_cuenta_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.cuentas_id_cuenta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuentas_id_cuenta_seq OWNER TO admin;

--
-- Name: cuentas_id_cuenta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.cuentas_id_cuenta_seq OWNED BY public.cuentas.id_cuenta;


--
-- Name: transacciones; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.transacciones (
    id_transaccion integer NOT NULL,
    id_cuenta integer NOT NULL,
    tipo_transaccion character varying NOT NULL,
    monto numeric NOT NULL,
    fecha_transaccion timestamp without time zone NOT NULL
);


ALTER TABLE public.transacciones OWNER TO admin;

--
-- Name: transacciones_id_transaccion_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.transacciones_id_transaccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transacciones_id_transaccion_seq OWNER TO admin;

--
-- Name: transacciones_id_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.transacciones_id_transaccion_seq OWNED BY public.transacciones.id_transaccion;


--
-- Name: cuentas id_cuenta; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cuentas ALTER COLUMN id_cuenta SET DEFAULT nextval('public.cuentas_id_cuenta_seq'::regclass);


--
-- Name: transacciones id_transaccion; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transacciones ALTER COLUMN id_transaccion SET DEFAULT nextval('public.transacciones_id_transaccion_seq'::regclass);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cuentas (id_cuenta, nombre_cliente, saldo) FROM stdin;
1	Cliente 54	9963.220000000001
2	Cliente 24	9465.03
3	Cliente 67	5522.29
4	Cliente 41	2482.61
5	Cliente 15	10194.949999999999
6	Cliente 43	7381.889999999999
7	Cliente 18	4718.62
8	Cliente 76	2276.44
9	Cliente 95	6237.22
10	Cliente 69	4350.15
11	Cliente 94	6306.25
12	Cliente 81	2099.66
13	Cliente 46	3262.9700000000003
14	Cliente 90	2424.96
15	Cliente 91	5663.31
16	Cliente 34	3627.58
17	Cliente 68	6834.55
18	Cliente 25	5111.58
19	Cliente 36	2893.56
20	Cliente 91	3419.2799999999997
21	Cliente 77	5720.48
22	Cliente 49	1732.6100000000001
23	Cliente 65	6406.38
24	Cliente 83	4188.18
25	Cliente 15	4143.05
26	Cliente 8	3408.89
27	Cliente 41	2057.71
28	Cliente 84	1877.1299999999999
29	Cliente 65	8267.37
30	Cliente 90	7614.95
\.


--
-- Data for Name: transacciones; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.transacciones (id_transaccion, id_cuenta, tipo_transaccion, monto, fecha_transaccion) FROM stdin;
1	1	deposito	134.95	2025-05-02 05:49:26.906123
2	2	retiro	313.64	2025-05-02 05:49:28.91909
3	3	retiro	662.24	2025-05-02 05:49:30.928666
4	4	deposito	965.96	2025-05-02 05:49:32.938715
5	5	deposito	894.98	2025-05-02 05:49:34.950266
6	6	retiro	305.27	2025-05-02 05:49:36.958208
7	7	retiro	603.6	2025-05-02 05:49:38.968751
8	8	retiro	434.69	2025-05-02 05:49:40.974945
9	9	retiro	766.88	2025-05-02 05:49:42.980017
10	10	retiro	858.98	2025-05-02 05:49:44.991701
11	11	retiro	834.78	2025-05-02 05:49:47.003528
12	12	deposito	612.91	2025-05-02 05:49:49.00976
13	13	deposito	303.86	2025-05-02 05:49:51.01702
14	14	retiro	673.6	2025-05-02 05:49:53.022719
15	15	retiro	435.24	2025-05-02 05:49:55.029115
16	16	retiro	580.53	2025-05-02 05:49:57.03644
17	17	retiro	654.03	2025-05-02 05:49:59.045702
18	18	deposito	448.68	2025-05-02 05:50:01.053449
19	19	deposito	998.56	2025-05-02 05:50:03.062705
20	20	deposito	339.1	2025-05-02 05:50:05.0752
21	21	retiro	145.76	2025-05-02 05:50:07.083806
22	22	retiro	780.46	2025-05-02 05:50:09.090055
23	23	retiro	872.9	2025-05-02 05:50:11.096215
24	24	retiro	502.92	2025-05-02 05:50:13.104531
25	25	deposito	630.45	2025-05-02 05:50:15.115124
26	26	deposito	508.19	2025-05-02 05:50:17.126591
27	27	deposito	595.03	2025-05-02 05:50:19.137162
28	28	deposito	404.84	2025-05-02 05:50:21.143363
29	29	deposito	113.4	2025-05-02 05:50:23.157508
30	30	deposito	253.7	2025-05-02 05:50:25.178775
\.


--
-- Name: cuentas_id_cuenta_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.cuentas_id_cuenta_seq', 30, true);


--
-- Name: transacciones_id_transaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.transacciones_id_transaccion_seq', 30, true);


--
-- Name: cuentas cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id_cuenta);


--
-- Name: transacciones transacciones_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transacciones
    ADD CONSTRAINT transacciones_pkey PRIMARY KEY (id_transaccion);


--
-- Name: transacciones transacciones_id_cuenta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.transacciones
    ADD CONSTRAINT transacciones_id_cuenta_fkey FOREIGN KEY (id_cuenta) REFERENCES public.cuentas(id_cuenta);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: admin
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

