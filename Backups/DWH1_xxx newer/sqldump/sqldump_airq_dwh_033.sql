--
-- PostgreSQL database dump
--

\restrict g6OjwypeQG6YojipIuKm4dNoLRCOLwEbv5qdVlqdHakfsLTyfM6dI1ThktRGv3F

-- Dumped from database version 17.6 (Debian 17.6-0+deb13u1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-0+deb13u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dwh_033; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA dwh_033;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dim_parameter; Type: TABLE; Schema: dwh_033; Owner: -
--

CREATE TABLE dwh_033.dim_parameter (
    sk_parameter bigint NOT NULL,
    tb_param_id integer NOT NULL,
    paramname character varying(200) NOT NULL,
    category character varying(200) NOT NULL,
    unit character varying(50) NOT NULL,
    etl_load_timestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dim_parameter_sk_parameter_seq; Type: SEQUENCE; Schema: dwh_033; Owner: -
--

CREATE SEQUENCE dwh_033.dim_parameter_sk_parameter_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dim_parameter_sk_parameter_seq; Type: SEQUENCE OWNED BY; Schema: dwh_033; Owner: -
--

ALTER SEQUENCE dwh_033.dim_parameter_sk_parameter_seq OWNED BY dwh_033.dim_parameter.sk_parameter;


--
-- Name: dim_servicetype; Type: TABLE; Schema: dwh_033; Owner: -
--

CREATE TABLE dwh_033.dim_servicetype (
    sk_servicetype bigint NOT NULL,
    tb_servicetype_id integer NOT NULL,
    typename character varying(200) NOT NULL,
    etl_load_timestamp timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dim_servicetype_sk_servicetype_seq; Type: SEQUENCE; Schema: dwh_033; Owner: -
--

CREATE SEQUENCE dwh_033.dim_servicetype_sk_servicetype_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dim_servicetype_sk_servicetype_seq; Type: SEQUENCE OWNED BY; Schema: dwh_033; Owner: -
--

ALTER SEQUENCE dwh_033.dim_servicetype_sk_servicetype_seq OWNED BY dwh_033.dim_servicetype.sk_servicetype;


--
-- Name: dim_technician_role_scd2; Type: TABLE; Schema: dwh_033; Owner: -
--

CREATE TABLE dwh_033.dim_technician_role_scd2 (
    sk_technician_role bigint NOT NULL,
    badgenumber character varying(255) NOT NULL,
    rolelevel integer NOT NULL,
    category character varying(255) NOT NULL,
    rolename character varying(255) NOT NULL,
    effective_from date NOT NULL,
    effective_to date NOT NULL,
    is_current boolean NOT NULL,
    etl_load_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0) NOT NULL
);


--
-- Name: dim_technician_role_scd2_sk_technician_role_seq; Type: SEQUENCE; Schema: dwh_033; Owner: -
--

CREATE SEQUENCE dwh_033.dim_technician_role_scd2_sk_technician_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dim_technician_role_scd2_sk_technician_role_seq; Type: SEQUENCE OWNED BY; Schema: dwh_033; Owner: -
--

ALTER SEQUENCE dwh_033.dim_technician_role_scd2_sk_technician_role_seq OWNED BY dwh_033.dim_technician_role_scd2.sk_technician_role;


--
-- Name: dim_timeday; Type: TABLE; Schema: dwh_033; Owner: -
--

CREATE TABLE dwh_033.dim_timeday (
    id integer NOT NULL,
    etl_load_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ft_name1; Type: TABLE; Schema: dwh_033; Owner: -
--

CREATE TABLE dwh_033.ft_name1 (
    id integer NOT NULL,
    day_id integer NOT NULL,
    sk_parameter bigint NOT NULL,
    sk_servicetype bigint NOT NULL,
    etl_load_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: ft_name2; Type: TABLE; Schema: dwh_033; Owner: -
--

CREATE TABLE dwh_033.ft_name2 (
    id integer NOT NULL,
    day_id integer NOT NULL,
    sk_parameter bigint NOT NULL,
    sk_technician_role bigint NOT NULL,
    etl_load_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: dim_parameter sk_parameter; Type: DEFAULT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_parameter ALTER COLUMN sk_parameter SET DEFAULT nextval('dwh_033.dim_parameter_sk_parameter_seq'::regclass);


--
-- Name: dim_servicetype sk_servicetype; Type: DEFAULT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_servicetype ALTER COLUMN sk_servicetype SET DEFAULT nextval('dwh_033.dim_servicetype_sk_servicetype_seq'::regclass);


--
-- Name: dim_technician_role_scd2 sk_technician_role; Type: DEFAULT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_technician_role_scd2 ALTER COLUMN sk_technician_role SET DEFAULT nextval('dwh_033.dim_technician_role_scd2_sk_technician_role_seq'::regclass);


--
-- Data for Name: dim_parameter; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.dim_parameter (sk_parameter, tb_param_id, paramname, category, unit, etl_load_timestamp) FROM stdin;
\.


--
-- Data for Name: dim_servicetype; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.dim_servicetype (sk_servicetype, tb_servicetype_id, typename, etl_load_timestamp) FROM stdin;
\.


--
-- Data for Name: dim_technician_role_scd2; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.dim_technician_role_scd2 (sk_technician_role, badgenumber, rolelevel, category, rolename, effective_from, effective_to, is_current, etl_load_timestamp) FROM stdin;
\.


--
-- Data for Name: dim_timeday; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.dim_timeday (id, etl_load_timestamp) FROM stdin;
1	2025-10-31 12:13:41.187209
2	2025-10-31 12:13:41.187209
3	2025-10-31 12:13:41.187209
4	2025-10-31 12:13:41.187209
5	2025-10-31 12:13:41.187209
\.


--
-- Data for Name: ft_name1; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.ft_name1 (id, day_id, sk_parameter, sk_servicetype, etl_load_timestamp) FROM stdin;
\.


--
-- Data for Name: ft_name2; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.ft_name2 (id, day_id, sk_parameter, sk_technician_role, etl_load_timestamp) FROM stdin;
\.


--
-- Name: dim_parameter_sk_parameter_seq; Type: SEQUENCE SET; Schema: dwh_033; Owner: -
--

SELECT pg_catalog.setval('dwh_033.dim_parameter_sk_parameter_seq', 1, false);


--
-- Name: dim_servicetype_sk_servicetype_seq; Type: SEQUENCE SET; Schema: dwh_033; Owner: -
--

SELECT pg_catalog.setval('dwh_033.dim_servicetype_sk_servicetype_seq', 1, false);


--
-- Name: dim_technician_role_scd2_sk_technician_role_seq; Type: SEQUENCE SET; Schema: dwh_033; Owner: -
--

SELECT pg_catalog.setval('dwh_033.dim_technician_role_scd2_sk_technician_role_seq', 1, false);


--
-- Name: dim_parameter dim_parameter_pkey; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_parameter
    ADD CONSTRAINT dim_parameter_pkey PRIMARY KEY (sk_parameter);


--
-- Name: dim_servicetype dim_servicetype_pkey; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_servicetype
    ADD CONSTRAINT dim_servicetype_pkey PRIMARY KEY (sk_servicetype);


--
-- Name: dim_technician_role_scd2 dim_technician_role_scd2_pkey; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_technician_role_scd2
    ADD CONSTRAINT dim_technician_role_scd2_pkey PRIMARY KEY (sk_technician_role);


--
-- Name: dim_timeday dim_timeday_pkey; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_timeday
    ADD CONSTRAINT dim_timeday_pkey PRIMARY KEY (id);


--
-- Name: ft_name1 ft_name1_pkey; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.ft_name1
    ADD CONSTRAINT ft_name1_pkey PRIMARY KEY (id);


--
-- Name: ft_name2 ft_name2_pkey; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.ft_name2
    ADD CONSTRAINT ft_name2_pkey PRIMARY KEY (id);


--
-- Name: dim_parameter uq_dim_parameter_bk; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_parameter
    ADD CONSTRAINT uq_dim_parameter_bk UNIQUE (tb_param_id);


--
-- Name: dim_servicetype uq_dim_servicetype_bk; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_servicetype
    ADD CONSTRAINT uq_dim_servicetype_bk UNIQUE (tb_servicetype_id);


--
-- Name: dim_technician_role_scd2 ux_techrole_bk_timerange; Type: CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.dim_technician_role_scd2
    ADD CONSTRAINT ux_techrole_bk_timerange UNIQUE (badgenumber, effective_from, effective_to);


--
-- Name: ix_ft_name1_day; Type: INDEX; Schema: dwh_033; Owner: -
--

CREATE INDEX ix_ft_name1_day ON dwh_033.ft_name1 USING btree (day_id);


--
-- Name: ix_ft_name1_parameter; Type: INDEX; Schema: dwh_033; Owner: -
--

CREATE INDEX ix_ft_name1_parameter ON dwh_033.ft_name1 USING btree (sk_parameter);


--
-- Name: ix_ft_name1_servicetype; Type: INDEX; Schema: dwh_033; Owner: -
--

CREATE INDEX ix_ft_name1_servicetype ON dwh_033.ft_name1 USING btree (sk_servicetype);


--
-- Name: ix_ft_name2_day; Type: INDEX; Schema: dwh_033; Owner: -
--

CREATE INDEX ix_ft_name2_day ON dwh_033.ft_name2 USING btree (day_id);


--
-- Name: ix_ft_name2_parameter; Type: INDEX; Schema: dwh_033; Owner: -
--

CREATE INDEX ix_ft_name2_parameter ON dwh_033.ft_name2 USING btree (sk_parameter);


--
-- Name: ix_ft_name2_techrole; Type: INDEX; Schema: dwh_033; Owner: -
--

CREATE INDEX ix_ft_name2_techrole ON dwh_033.ft_name2 USING btree (sk_technician_role);


--
-- Name: ft_name1 fk_name1_parameter; Type: FK CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.ft_name1
    ADD CONSTRAINT fk_name1_parameter FOREIGN KEY (sk_parameter) REFERENCES dwh_033.dim_parameter(sk_parameter);


--
-- Name: ft_name1 fk_name1_servicetype; Type: FK CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.ft_name1
    ADD CONSTRAINT fk_name1_servicetype FOREIGN KEY (sk_servicetype) REFERENCES dwh_033.dim_servicetype(sk_servicetype);


--
-- Name: ft_name1 fk_name1_timeday; Type: FK CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.ft_name1
    ADD CONSTRAINT fk_name1_timeday FOREIGN KEY (day_id) REFERENCES dwh_033.dim_timeday(id);


--
-- Name: ft_name2 fk_name2_day; Type: FK CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.ft_name2
    ADD CONSTRAINT fk_name2_day FOREIGN KEY (day_id) REFERENCES dwh_033.dim_timeday(id);


--
-- Name: ft_name2 fk_name2_parameter; Type: FK CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.ft_name2
    ADD CONSTRAINT fk_name2_parameter FOREIGN KEY (sk_parameter) REFERENCES dwh_033.dim_parameter(sk_parameter);


--
-- Name: ft_name2 fk_name2_techrole; Type: FK CONSTRAINT; Schema: dwh_033; Owner: -
--

ALTER TABLE ONLY dwh_033.ft_name2
    ADD CONSTRAINT fk_name2_techrole FOREIGN KEY (sk_technician_role) REFERENCES dwh_033.dim_technician_role_scd2(sk_technician_role);


--
-- PostgreSQL database dump complete
--

\unrestrict g6OjwypeQG6YojipIuKm4dNoLRCOLwEbv5qdVlqdHakfsLTyfM6dI1ThktRGv3F

