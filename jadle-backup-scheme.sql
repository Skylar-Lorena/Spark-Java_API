--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-0ubuntu0.18.10.1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-0ubuntu0.18.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: foodtypes; Type: TABLE; Schema: public; Owner: v
--

CREATE TABLE public.foodtypes (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.foodtypes OWNER TO v;

--
-- Name: foodtypes_id_seq; Type: SEQUENCE; Schema: public; Owner: v
--

CREATE SEQUENCE public.foodtypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foodtypes_id_seq OWNER TO v;

--
-- Name: foodtypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v
--

ALTER SEQUENCE public.foodtypes_id_seq OWNED BY public.foodtypes.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: v
--

CREATE TABLE public.restaurants (
    id integer NOT NULL,
    name character varying,
    address character varying,
    zipcode character varying,
    phone character varying,
    website character varying,
    email character varying
);


ALTER TABLE public.restaurants OWNER TO v;

--
-- Name: restaurants_foodtypes; Type: TABLE; Schema: public; Owner: v
--

CREATE TABLE public.restaurants_foodtypes (
    id integer NOT NULL,
    foodtypeid integer,
    restaurantid integer
);


ALTER TABLE public.restaurants_foodtypes OWNER TO v;

--
-- Name: restaurants_foodtypes_id_seq; Type: SEQUENCE; Schema: public; Owner: v
--

CREATE SEQUENCE public.restaurants_foodtypes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_foodtypes_id_seq OWNER TO v;

--
-- Name: restaurants_foodtypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v
--

ALTER SEQUENCE public.restaurants_foodtypes_id_seq OWNED BY public.restaurants_foodtypes.id;


--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: v
--

CREATE SEQUENCE public.restaurants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_id_seq OWNER TO v;

--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v
--

ALTER SEQUENCE public.restaurants_id_seq OWNED BY public.restaurants.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: v
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    writtenby character varying,
    rating character varying,
    content character varying,
    restaurantid integer,
    createdat bigint
);


ALTER TABLE public.reviews OWNER TO v;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: v
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO v;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: v
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: foodtypes id; Type: DEFAULT; Schema: public; Owner: v
--

ALTER TABLE ONLY public.foodtypes ALTER COLUMN id SET DEFAULT nextval('public.foodtypes_id_seq'::regclass);


--
-- Name: restaurants id; Type: DEFAULT; Schema: public; Owner: v
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN id SET DEFAULT nextval('public.restaurants_id_seq'::regclass);


--
-- Name: restaurants_foodtypes id; Type: DEFAULT; Schema: public; Owner: v
--

ALTER TABLE ONLY public.restaurants_foodtypes ALTER COLUMN id SET DEFAULT nextval('public.restaurants_foodtypes_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: v
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Data for Name: foodtypes; Type: TABLE DATA; Schema: public; Owner: v
--

COPY public.foodtypes (id, name) FROM stdin;
\.


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: v
--

COPY public.restaurants (id, name, address, zipcode, phone, website, email) FROM stdin;
1	Kempinski	Westalds	34542	278-402-9874	http://www.fishwitch.com	hellofishy@fishwitch.com
2	Mama Otienos	Ngong rd	90210	254-402-9874	http://www.kenyan.com	mamaOti@fishwitch.com
\.


--
-- Data for Name: restaurants_foodtypes; Type: TABLE DATA; Schema: public; Owner: v
--

COPY public.restaurants_foodtypes (id, foodtypeid, restaurantid) FROM stdin;
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: v
--

COPY public.reviews (id, writtenby, rating, content, restaurantid, createdat) FROM stdin;
\.


--
-- Name: foodtypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v
--

SELECT pg_catalog.setval('public.foodtypes_id_seq', 1, false);


--
-- Name: restaurants_foodtypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v
--

SELECT pg_catalog.setval('public.restaurants_foodtypes_id_seq', 1, false);


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v
--

SELECT pg_catalog.setval('public.restaurants_id_seq', 2, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: v
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: foodtypes foodtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: v
--

ALTER TABLE ONLY public.foodtypes
    ADD CONSTRAINT foodtypes_pkey PRIMARY KEY (id);


--
-- Name: restaurants_foodtypes restaurants_foodtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: v
--

ALTER TABLE ONLY public.restaurants_foodtypes
    ADD CONSTRAINT restaurants_foodtypes_pkey PRIMARY KEY (id);


--
-- Name: restaurants restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: v
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: v
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

