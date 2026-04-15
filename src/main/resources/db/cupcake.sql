--
-- PostgreSQL database dump
--

\restrict ZrHX536gDo3e6xpnMAODQGXeddLmbAXbd6kQPnHpJ2Bl178UZtTjjc3fThOTeJq

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.11

-- Started on 2026-04-15 10:23:02 CEST

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 57345)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 57350)
-- Name: admin_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_admin_id_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 216
-- Name: admin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.admin.admin_id;


--
-- TOC entry 217 (class 1259 OID 57351)
-- Name: topping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topping (
    topping_id integer NOT NULL,
    name character varying NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.topping OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 57377)
-- Name: topping_topping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topping_topping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topping_topping_id_seq OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 226
-- Name: topping_topping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topping_topping_id_seq OWNED BY public.topping.topping_id;


--
-- TOC entry 225 (class 1259 OID 57372)
-- Name: bottom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bottom (
    bottom_id integer DEFAULT nextval('public.topping_topping_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.bottom OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 57356)
-- Name: bottom_bottom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bottom_bottom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bottom_bottom_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 218
-- Name: bottom_bottom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bottom_bottom_id_seq OWNED BY public.bottom.bottom_id;


--
-- TOC entry 219 (class 1259 OID 57357)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    username character varying NOT NULL,
    balance integer DEFAULT 10000 NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 57363)
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_customer_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 220
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- TOC entry 221 (class 1259 OID 57364)
-- Name: order_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_line (
    orderline_id integer NOT NULL,
    quantity integer NOT NULL,
    order_id integer NOT NULL,
    bottom_id integer NOT NULL,
    topping_id integer NOT NULL
);


ALTER TABLE public.order_line OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 57367)
-- Name: order_line_orderline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_line_orderline_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_line_orderline_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 222
-- Name: order_line_orderline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_line_orderline_id_seq OWNED BY public.order_line.orderline_id;


--
-- TOC entry 223 (class 1259 OID 57368)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 57371)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 224
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 3228 (class 2604 OID 57378)
-- Name: admin admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_admin_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 57379)
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 57381)
-- Name: order_line orderline_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line ALTER COLUMN orderline_id SET DEFAULT nextval('public.order_line_orderline_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 57382)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 65536)
-- Name: topping topping_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topping ALTER COLUMN topping_id SET DEFAULT nextval('public.topping_topping_id_seq'::regclass);


--
-- TOC entry 3396 (class 0 OID 57345)
-- Dependencies: 215
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (admin_id, username, password) FROM stdin;
1	Egon	1234
2	Admin	1234
3	Admin	1234
4	Admin	123
5	Admini	123
6	Adminus	123
7	Andy	123
8	Admin	1234
9	Admin	1234
\.


--
-- TOC entry 3406 (class 0 OID 57372)
-- Dependencies: 225
-- Data for Name: bottom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bottom (bottom_id, name, price) FROM stdin;
1	Chocolate	5
2	Vanilla	5
3	Nutmeg	5
4	Pistacio	6
5	Almond	7
\.


--
-- TOC entry 3400 (class 0 OID 57357)
-- Dependencies: 219
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, username, balance, password) FROM stdin;
1	testuser	10000	1234
3	Anders	10000	123
4	And	10000	123
6	Egon	10000	123
7	Elin	10000	12
8	Herre	10000	234
9	Ibrahim	2470	123
\.


--
-- TOC entry 3402 (class 0 OID 57364)
-- Dependencies: 221
-- Data for Name: order_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_line (orderline_id, quantity, order_id, bottom_id, topping_id) FROM stdin;
\.


--
-- TOC entry 3404 (class 0 OID 57368)
-- Dependencies: 223
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id) FROM stdin;
1	9
\.


--
-- TOC entry 3398 (class 0 OID 57351)
-- Dependencies: 217
-- Data for Name: topping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topping (topping_id, name, price) FROM stdin;
1	Chocolate	5
2	Blueberry	5
3	Rasberry	5
4	Crispy	6
5	Strawberry	6
6	Rum/Raisin	7
7	Orange	8
8	Lemon	8
9	Blue cheese	9
\.


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 216
-- Name: admin_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_admin_id_seq', 9, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 218
-- Name: bottom_bottom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bottom_bottom_id_seq', 6, false);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 220
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 9, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 222
-- Name: order_line_orderline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_line_orderline_id_seq', 2, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 224
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 226
-- Name: topping_topping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topping_topping_id_seq', 9, true);


--
-- TOC entry 3236 (class 2606 OID 57385)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);


--
-- TOC entry 3238 (class 2606 OID 57387)
-- Name: topping bottom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topping
    ADD CONSTRAINT bottom_pkey PRIMARY KEY (topping_id);


--
-- TOC entry 3240 (class 2606 OID 57389)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 3242 (class 2606 OID 57391)
-- Name: customer customer_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_username_unique UNIQUE (username);


--
-- TOC entry 3244 (class 2606 OID 57393)
-- Name: order_line order_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_pkey PRIMARY KEY (orderline_id);


--
-- TOC entry 3246 (class 2606 OID 57395)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3248 (class 2606 OID 57397)
-- Name: bottom topping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bottom
    ADD CONSTRAINT topping_pkey PRIMARY KEY (bottom_id);


--
-- TOC entry 3252 (class 2606 OID 57398)
-- Name: orders customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 3249 (class 2606 OID 57403)
-- Name: order_line material_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT material_id FOREIGN KEY (topping_id) REFERENCES public.topping(topping_id) NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 57408)
-- Name: order_line order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id) NOT VALID;


--
-- TOC entry 3251 (class 2606 OID 57413)
-- Name: order_line weapon_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT weapon_id FOREIGN KEY (bottom_id) REFERENCES public.bottom(bottom_id) NOT VALID;


-- Completed on 2026-04-15 10:23:03 CEST

--
-- PostgreSQL database dump complete
--

\unrestrict ZrHX536gDo3e6xpnMAODQGXeddLmbAXbd6kQPnHpJ2Bl178UZtTjjc3fThOTeJq

