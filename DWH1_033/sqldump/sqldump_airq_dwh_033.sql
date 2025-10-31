--
-- PostgreSQL database dump
--

\restrict k54jXsLUaoOYgcK6hpvm1m7wWiI7qNdMne7Zm4cMswXgDLsMXoU9fZixyTHhQMt

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
1	1001	PM1	Particulate matter	mcg/m3	2025-10-31 14:55:58
2	1002	PM2	Particulate matter	mcg/m3	2025-10-31 14:55:58
3	1003	PM4	Particulate matter	mcg/m3	2025-10-31 14:55:58
4	1004	PM10	Particulate matter	mcg/m3	2025-10-31 14:55:58
5	1005	TSP	Particulate matter	mcg/m3	2025-10-31 14:55:58
6	1006	BlackCarbon	Particulate matter	mcg/m3	2025-10-31 14:55:58
7	1007	CO2	Gas	ppm	2025-10-31 14:55:58
8	1008	CO	Gas	ppm	2025-10-31 14:55:58
9	1009	NO2	Gas	ppb	2025-10-31 14:55:58
10	1010	O3	Gas	ppb	2025-10-31 14:55:58
11	1011	SO2	Gas	ppb	2025-10-31 14:55:58
12	1012	CH4	Gas	ppm	2025-10-31 14:55:58
13	1013	Lead	Heavy Metal	mcg/m3	2025-10-31 14:55:58
14	1014	Mercury	Heavy Metal	mcg/m3	2025-10-31 14:55:58
15	1015	Cadmium	Heavy Metal	mcg/m3	2025-10-31 14:55:58
16	1016	Arsenic	Heavy Metal	mcg/m3	2025-10-31 14:55:58
17	1017	Nickel	Heavy Metal	mcg/m3	2025-10-31 14:55:58
18	1018	Chromium	Heavy Metal	mcg/m3	2025-10-31 14:55:58
19	1019	Benzene	Volatile Organic Compound	ppb	2025-10-31 14:55:58
20	1020	Toluene	Volatile Organic Compound	ppb	2025-10-31 14:55:58
21	1021	Formaldehyde	Volatile Organic Compound	ppb	2025-10-31 14:55:58
22	1022	Ethylbenzene	Volatile Organic Compound	ppb	2025-10-31 14:55:58
23	1023	Acetone	Volatile Organic Compound	ppb	2025-10-31 14:55:58
24	1024	Xylene	Volatile Organic Compound	ppb	2025-10-31 14:55:58
25	1025	MoldSpores	Biological	count/m3	2025-10-31 14:55:58
26	1026	Bacteria	Biological	CFU/m3	2025-10-31 14:55:58
27	1027	FungalSpores	Biological	count/m3	2025-10-31 14:55:58
28	1028	Yeasts	Biological	count/m3	2025-10-31 14:55:58
29	1029	Actinomycetes	Biological	count/m3	2025-10-31 14:55:58
30	1030	Viruses	Biological	count/m3	2025-10-31 14:55:58
\.


--
-- Data for Name: dim_servicetype; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.dim_servicetype (sk_servicetype, tb_servicetype_id, typename, etl_load_timestamp) FROM stdin;
1	1001	Diagnostics Scan	2025-10-31 14:55:58
2	1002	Firmware Update	2025-10-31 14:55:58
3	1003	Remote Calibration Check	2025-10-31 14:55:58
4	1004	Software Patch Deployment	2025-10-31 14:55:58
5	1005	Threshold Adjustment	2025-10-31 14:55:58
6	1006	Sensor Network Reconfiguration	2025-10-31 14:55:58
7	1007	Performance Audit	2025-10-31 14:55:58
8	1008	Battery Performance Review	2025-10-31 14:55:58
9	1009	Sensor Data Validation	2025-10-31 14:55:58
10	1010	Connectivity Test	2025-10-31 14:55:58
11	1011	Environmental Correlation Analysis	2025-10-31 14:55:58
12	1012	Sensor Synchronization Check	2025-10-31 14:55:58
13	1013	Temperature Probe Replacement	2025-10-31 14:55:58
14	1014	Laser Alignment Check	2025-10-31 14:55:58
15	1015	Backup Battery Replacement	2025-10-31 14:55:58
16	1016	Telemetry Sync Test	2025-10-31 14:55:58
17	1017	Error Code Resolution	2025-10-31 14:55:58
18	1018	Radio Frequency Scan	2025-10-31 14:55:58
19	1019	Sensor Recalibration	2025-10-31 14:55:58
20	1020	Realtime Clock Reset	2025-10-31 14:55:58
21	1021	Remote Security Audit	2025-10-31 14:55:58
22	1022	Deep System Audit	2025-10-31 14:55:58
23	1023	System Reboot	2025-10-31 14:55:58
24	1024	Board-Level Voltage Check	2025-10-31 14:55:58
\.


--
-- Data for Name: dim_technician_role_scd2; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.dim_technician_role_scd2 (sk_technician_role, badgenumber, rolelevel, category, rolename, effective_from, effective_to, is_current, etl_load_timestamp) FROM stdin;
1	EMP001	2	Software	Device Programmer	2023-01-01	2023-05-20	f	2025-10-31 14:55:58
2	EMP001	4	Software	Software Lead	2023-05-21	2023-11-15	f	2025-10-31 14:55:58
3	EMP001	2	Software	Device Programmer	2023-11-16	9999-12-31	t	2025-10-31 14:55:58
4	EMP002	1	Calibration	Calibration Trainee	2023-01-01	2023-05-02	f	2025-10-31 14:55:58
5	EMP002	4	Calibration	Calibration Lead	2023-05-03	2023-08-03	f	2025-10-31 14:55:58
6	EMP002	2	Calibration	Calibration Technician	2023-08-04	9999-12-31	t	2025-10-31 14:55:58
7	EMP003	3	Software	Firmware Specialist	2023-01-01	2023-04-22	f	2025-10-31 14:55:58
8	EMP003	2	Software	Device Programmer	2023-04-23	9999-12-31	t	2025-10-31 14:55:58
9	EMP004	1	Hardware	Hardware Assistant	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
10	EMP005	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-04-10	f	2025-10-31 14:55:58
11	EMP005	4	Diagnostics	Diagnostics Lead	2023-04-11	2023-08-25	f	2025-10-31 14:55:58
12	EMP005	3	Diagnostics	Fault Analysis Specialist	2023-08-26	2024-01-23	f	2025-10-31 14:55:58
13	EMP005	1	Diagnostics	Diagnostics Assistant	2024-01-24	9999-12-31	t	2025-10-31 14:55:58
14	EMP006	1	Hardware	Hardware Assistant	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
15	EMP007	1	Software	Software Assistant	2023-01-01	2023-05-05	f	2025-10-31 14:55:58
16	EMP007	3	Software	Firmware Specialist	2023-05-06	9999-12-31	t	2025-10-31 14:55:58
17	EMP008	2	Hardware	Hardware Technician	2023-01-01	2023-05-26	f	2025-10-31 14:55:58
18	EMP008	1	Hardware	Hardware Assistant	2023-05-27	9999-12-31	t	2025-10-31 14:55:58
19	EMP009	2	Calibration	Calibration Technician	2023-01-01	2023-04-14	f	2025-10-31 14:55:58
20	EMP009	4	Calibration	Calibration Lead	2023-04-15	2023-07-25	f	2025-10-31 14:55:58
21	EMP009	2	Calibration	Calibration Technician	2023-07-26	9999-12-31	t	2025-10-31 14:55:58
22	EMP010	4	Calibration	Calibration Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
23	EMP011	1	Hardware	Hardware Assistant	2023-01-01	2023-04-18	f	2025-10-31 14:55:58
24	EMP011	2	Hardware	Hardware Technician	2023-04-19	9999-12-31	t	2025-10-31 14:55:58
25	EMP012	4	Calibration	Calibration Lead	2023-01-01	2023-06-08	f	2025-10-31 14:55:58
26	EMP012	3	Calibration	Calibration Specialist	2023-06-09	2023-10-12	f	2025-10-31 14:55:58
27	EMP012	4	Calibration	Calibration Lead	2023-10-13	2024-01-14	f	2025-10-31 14:55:58
28	EMP012	1	Calibration	Calibration Trainee	2024-01-15	9999-12-31	t	2025-10-31 14:55:58
29	EMP013	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-04-18	f	2025-10-31 14:55:58
30	EMP013	1	Diagnostics	Diagnostics Assistant	2023-04-19	2023-07-23	f	2025-10-31 14:55:58
31	EMP013	4	Diagnostics	Diagnostics Lead	2023-07-24	2024-01-17	f	2025-10-31 14:55:58
32	EMP013	1	Diagnostics	Diagnostics Assistant	2024-01-18	9999-12-31	t	2025-10-31 14:55:58
33	EMP014	1	Calibration	Calibration Trainee	2023-01-01	2023-06-17	f	2025-10-31 14:55:58
34	EMP014	4	Calibration	Calibration Lead	2023-06-18	9999-12-31	t	2025-10-31 14:55:58
35	EMP015	2	Hardware	Hardware Technician	2023-01-01	2023-04-29	f	2025-10-31 14:55:58
36	EMP015	3	Hardware	Senior Hardware Technician	2023-04-30	2023-09-13	f	2025-10-31 14:55:58
37	EMP015	4	Hardware	Hardware Lead	2023-09-14	2024-02-09	f	2025-10-31 14:55:58
38	EMP015	3	Hardware	Senior Hardware Technician	2024-02-10	9999-12-31	t	2025-10-31 14:55:58
39	EMP016	1	Calibration	Calibration Trainee	2023-01-01	2023-06-25	f	2025-10-31 14:55:58
40	EMP016	3	Calibration	Calibration Specialist	2023-06-26	2023-12-02	f	2025-10-31 14:55:58
41	EMP016	1	Calibration	Calibration Trainee	2023-12-03	2024-05-28	f	2025-10-31 14:55:58
42	EMP016	2	Calibration	Calibration Technician	2024-05-29	9999-12-31	t	2025-10-31 14:55:58
43	EMP017	3	Calibration	Calibration Specialist	2023-01-01	2023-06-19	f	2025-10-31 14:55:58
44	EMP017	2	Calibration	Calibration Technician	2023-06-20	2023-10-25	f	2025-10-31 14:55:58
45	EMP017	3	Calibration	Calibration Specialist	2023-10-26	9999-12-31	t	2025-10-31 14:55:58
46	EMP018	2	Software	Device Programmer	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
47	EMP019	2	Hardware	Hardware Technician	2023-01-01	2023-04-24	f	2025-10-31 14:55:58
48	EMP019	3	Hardware	Senior Hardware Technician	2023-04-25	9999-12-31	t	2025-10-31 14:55:58
49	EMP020	2	Hardware	Hardware Technician	2023-01-01	2023-06-10	f	2025-10-31 14:55:58
50	EMP020	4	Hardware	Hardware Lead	2023-06-11	9999-12-31	t	2025-10-31 14:55:58
51	EMP021	3	Calibration	Calibration Specialist	2023-01-01	2023-04-16	f	2025-10-31 14:55:58
52	EMP021	1	Calibration	Calibration Trainee	2023-04-17	9999-12-31	t	2025-10-31 14:55:58
53	EMP022	4	Hardware	Hardware Lead	2023-01-01	2023-06-16	f	2025-10-31 14:55:58
54	EMP022	3	Hardware	Senior Hardware Technician	2023-06-17	2023-10-09	f	2025-10-31 14:55:58
55	EMP022	4	Hardware	Hardware Lead	2023-10-10	2024-03-11	f	2025-10-31 14:55:58
56	EMP022	2	Hardware	Hardware Technician	2024-03-12	9999-12-31	t	2025-10-31 14:55:58
57	EMP023	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-04-04	f	2025-10-31 14:55:58
58	EMP023	1	Diagnostics	Diagnostics Assistant	2023-04-05	2023-09-17	f	2025-10-31 14:55:58
59	EMP023	4	Diagnostics	Diagnostics Lead	2023-09-18	9999-12-31	t	2025-10-31 14:55:58
60	EMP024	2	Software	Device Programmer	2023-01-01	2023-05-23	f	2025-10-31 14:55:58
61	EMP024	4	Software	Software Lead	2023-05-24	9999-12-31	t	2025-10-31 14:55:58
62	EMP025	3	Hardware	Senior Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
63	EMP026	3	Calibration	Calibration Specialist	2023-01-01	2023-05-07	f	2025-10-31 14:55:58
64	EMP026	1	Calibration	Calibration Trainee	2023-05-08	9999-12-31	t	2025-10-31 14:55:58
65	EMP027	2	Calibration	Calibration Technician	2023-01-01	2023-04-16	f	2025-10-31 14:55:58
66	EMP027	4	Calibration	Calibration Lead	2023-04-17	2023-08-20	f	2025-10-31 14:55:58
67	EMP027	3	Calibration	Calibration Specialist	2023-08-21	9999-12-31	t	2025-10-31 14:55:58
68	EMP028	4	Diagnostics	Diagnostics Lead	2023-01-01	2023-06-02	f	2025-10-31 14:55:58
69	EMP028	3	Diagnostics	Fault Analysis Specialist	2023-06-03	2023-10-01	f	2025-10-31 14:55:58
70	EMP028	1	Diagnostics	Diagnostics Assistant	2023-10-02	2024-03-04	f	2025-10-31 14:55:58
71	EMP028	3	Diagnostics	Fault Analysis Specialist	2024-03-05	9999-12-31	t	2025-10-31 14:55:58
72	EMP029	4	Software	Software Lead	2023-01-01	2023-04-24	f	2025-10-31 14:55:58
73	EMP029	2	Software	Device Programmer	2023-04-25	2023-08-30	f	2025-10-31 14:55:58
74	EMP029	1	Software	Software Assistant	2023-08-31	2023-12-30	f	2025-10-31 14:55:58
75	EMP029	3	Software	Firmware Specialist	2023-12-31	9999-12-31	t	2025-10-31 14:55:58
76	EMP030	1	Calibration	Calibration Trainee	2023-01-01	2023-06-18	f	2025-10-31 14:55:58
77	EMP030	4	Calibration	Calibration Lead	2023-06-19	2023-12-16	f	2025-10-31 14:55:58
78	EMP030	3	Calibration	Calibration Specialist	2023-12-17	2024-03-19	f	2025-10-31 14:55:58
79	EMP030	4	Calibration	Calibration Lead	2024-03-20	9999-12-31	t	2025-10-31 14:55:58
80	EMP031	4	Calibration	Calibration Lead	2023-01-01	2023-05-12	f	2025-10-31 14:55:58
81	EMP031	2	Calibration	Calibration Technician	2023-05-13	9999-12-31	t	2025-10-31 14:55:58
82	EMP032	1	Calibration	Calibration Trainee	2023-01-01	2023-04-29	f	2025-10-31 14:55:58
83	EMP032	2	Calibration	Calibration Technician	2023-04-30	9999-12-31	t	2025-10-31 14:55:58
84	EMP033	1	Software	Software Assistant	2023-01-01	2023-06-23	f	2025-10-31 14:55:58
85	EMP033	4	Software	Software Lead	2023-06-24	2023-11-28	f	2025-10-31 14:55:58
86	EMP033	2	Software	Device Programmer	2023-11-29	2024-03-01	f	2025-10-31 14:55:58
87	EMP033	1	Software	Software Assistant	2024-03-02	9999-12-31	t	2025-10-31 14:55:58
88	EMP034	2	Hardware	Hardware Technician	2023-01-01	2023-05-20	f	2025-10-31 14:55:58
89	EMP034	4	Hardware	Hardware Lead	2023-05-21	2023-09-11	f	2025-10-31 14:55:58
90	EMP034	1	Hardware	Hardware Assistant	2023-09-12	9999-12-31	t	2025-10-31 14:55:58
91	EMP035	4	Software	Software Lead	2023-01-01	2023-04-09	f	2025-10-31 14:55:58
92	EMP035	3	Software	Firmware Specialist	2023-04-10	2023-09-15	f	2025-10-31 14:55:58
93	EMP035	4	Software	Software Lead	2023-09-16	9999-12-31	t	2025-10-31 14:55:58
94	EMP036	3	Software	Firmware Specialist	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
95	EMP037	4	Diagnostics	Diagnostics Lead	2023-01-01	2023-04-12	f	2025-10-31 14:55:58
96	EMP037	3	Diagnostics	Fault Analysis Specialist	2023-04-13	9999-12-31	t	2025-10-31 14:55:58
97	EMP038	3	Hardware	Senior Hardware Technician	2023-01-01	2023-04-14	f	2025-10-31 14:55:58
98	EMP038	2	Hardware	Hardware Technician	2023-04-15	2023-09-01	f	2025-10-31 14:55:58
99	EMP038	1	Hardware	Hardware Assistant	2023-09-02	2024-02-08	f	2025-10-31 14:55:58
100	EMP038	3	Hardware	Senior Hardware Technician	2024-02-09	9999-12-31	t	2025-10-31 14:55:58
101	EMP039	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-04-11	f	2025-10-31 14:55:58
102	EMP039	1	Diagnostics	Diagnostics Assistant	2023-04-12	2023-08-27	f	2025-10-31 14:55:58
103	EMP039	3	Diagnostics	Fault Analysis Specialist	2023-08-28	2024-01-09	f	2025-10-31 14:55:58
104	EMP039	1	Diagnostics	Diagnostics Assistant	2024-01-10	9999-12-31	t	2025-10-31 14:55:58
105	EMP040	3	Software	Firmware Specialist	2023-01-01	2023-04-21	f	2025-10-31 14:55:58
106	EMP040	1	Software	Software Assistant	2023-04-22	2023-07-29	f	2025-10-31 14:55:58
107	EMP040	2	Software	Device Programmer	2023-07-30	2023-12-07	f	2025-10-31 14:55:58
108	EMP040	3	Software	Firmware Specialist	2023-12-08	9999-12-31	t	2025-10-31 14:55:58
109	EMP041	1	Diagnostics	Diagnostics Assistant	2023-01-01	2023-04-25	f	2025-10-31 14:55:58
110	EMP041	2	Diagnostics	Diagnostics Technician	2023-04-26	2023-09-17	f	2025-10-31 14:55:58
111	EMP041	4	Diagnostics	Diagnostics Lead	2023-09-18	9999-12-31	t	2025-10-31 14:55:58
112	EMP042	2	Hardware	Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
113	EMP043	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-04-22	f	2025-10-31 14:55:58
114	EMP043	2	Diagnostics	Diagnostics Technician	2023-04-23	2023-09-27	f	2025-10-31 14:55:58
115	EMP043	3	Diagnostics	Fault Analysis Specialist	2023-09-28	9999-12-31	t	2025-10-31 14:55:58
116	EMP044	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-06-13	f	2025-10-31 14:55:58
117	EMP044	4	Diagnostics	Diagnostics Lead	2023-06-14	2023-10-02	f	2025-10-31 14:55:58
118	EMP044	1	Diagnostics	Diagnostics Assistant	2023-10-03	2024-01-04	f	2025-10-31 14:55:58
119	EMP044	3	Diagnostics	Fault Analysis Specialist	2024-01-05	9999-12-31	t	2025-10-31 14:55:58
120	EMP045	3	Software	Firmware Specialist	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
121	EMP046	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-05-08	f	2025-10-31 14:55:58
122	EMP046	2	Diagnostics	Diagnostics Technician	2023-05-09	2023-09-12	f	2025-10-31 14:55:58
123	EMP046	1	Diagnostics	Diagnostics Assistant	2023-09-13	9999-12-31	t	2025-10-31 14:55:58
124	EMP047	3	Diagnostics	Fault Analysis Specialist	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
125	EMP048	1	Calibration	Calibration Trainee	2023-01-01	2023-05-18	f	2025-10-31 14:55:58
126	EMP048	4	Calibration	Calibration Lead	2023-05-19	9999-12-31	t	2025-10-31 14:55:58
127	EMP049	4	Diagnostics	Diagnostics Lead	2023-01-01	2023-06-16	f	2025-10-31 14:55:58
128	EMP049	3	Diagnostics	Fault Analysis Specialist	2023-06-17	9999-12-31	t	2025-10-31 14:55:58
129	EMP050	2	Calibration	Calibration Technician	2023-01-01	2023-04-05	f	2025-10-31 14:55:58
130	EMP050	1	Calibration	Calibration Trainee	2023-04-06	2023-07-12	f	2025-10-31 14:55:58
131	EMP050	3	Calibration	Calibration Specialist	2023-07-13	2023-12-28	f	2025-10-31 14:55:58
132	EMP050	2	Calibration	Calibration Technician	2023-12-29	9999-12-31	t	2025-10-31 14:55:58
133	EMP051	4	Software	Software Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
134	EMP052	4	Hardware	Hardware Lead	2023-01-01	2023-06-19	f	2025-10-31 14:55:58
135	EMP052	1	Hardware	Hardware Assistant	2023-06-20	2023-10-03	f	2025-10-31 14:55:58
136	EMP052	4	Hardware	Hardware Lead	2023-10-04	2024-02-22	f	2025-10-31 14:55:58
137	EMP052	2	Hardware	Hardware Technician	2024-02-23	9999-12-31	t	2025-10-31 14:55:58
138	EMP053	1	Hardware	Hardware Assistant	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
139	EMP054	4	Diagnostics	Diagnostics Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
140	EMP055	3	Calibration	Calibration Specialist	2023-01-01	2023-04-05	f	2025-10-31 14:55:58
141	EMP055	1	Calibration	Calibration Trainee	2023-04-06	2023-09-22	f	2025-10-31 14:55:58
142	EMP055	4	Calibration	Calibration Lead	2023-09-23	2024-03-13	f	2025-10-31 14:55:58
143	EMP055	1	Calibration	Calibration Trainee	2024-03-14	9999-12-31	t	2025-10-31 14:55:58
144	EMP056	3	Calibration	Calibration Specialist	2023-01-01	2023-05-31	f	2025-10-31 14:55:58
145	EMP056	1	Calibration	Calibration Trainee	2023-06-01	2023-10-16	f	2025-10-31 14:55:58
146	EMP056	4	Calibration	Calibration Lead	2023-10-17	2024-03-30	f	2025-10-31 14:55:58
147	EMP056	1	Calibration	Calibration Trainee	2024-03-31	9999-12-31	t	2025-10-31 14:55:58
148	EMP057	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-04-24	f	2025-10-31 14:55:58
149	EMP057	4	Diagnostics	Diagnostics Lead	2023-04-25	9999-12-31	t	2025-10-31 14:55:58
150	EMP058	4	Diagnostics	Diagnostics Lead	2023-01-01	2023-06-03	f	2025-10-31 14:55:58
151	EMP058	3	Diagnostics	Fault Analysis Specialist	2023-06-04	2023-09-13	f	2025-10-31 14:55:58
152	EMP058	1	Diagnostics	Diagnostics Assistant	2023-09-14	9999-12-31	t	2025-10-31 14:55:58
153	EMP059	1	Software	Software Assistant	2023-01-01	2023-06-24	f	2025-10-31 14:55:58
154	EMP059	2	Software	Device Programmer	2023-06-25	9999-12-31	t	2025-10-31 14:55:58
155	EMP060	3	Diagnostics	Fault Analysis Specialist	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
156	EMP061	2	Software	Device Programmer	2023-01-01	2023-05-03	f	2025-10-31 14:55:58
157	EMP061	1	Software	Software Assistant	2023-05-04	9999-12-31	t	2025-10-31 14:55:58
158	EMP062	1	Diagnostics	Diagnostics Assistant	2023-01-01	2023-06-03	f	2025-10-31 14:55:58
159	EMP062	2	Diagnostics	Diagnostics Technician	2023-06-04	9999-12-31	t	2025-10-31 14:55:58
160	EMP063	1	Hardware	Hardware Assistant	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
161	EMP064	1	Software	Software Assistant	2023-01-01	2023-04-26	f	2025-10-31 14:55:58
162	EMP064	3	Software	Firmware Specialist	2023-04-27	2023-09-10	f	2025-10-31 14:55:58
163	EMP064	1	Software	Software Assistant	2023-09-11	9999-12-31	t	2025-10-31 14:55:58
164	EMP065	3	Software	Firmware Specialist	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
165	EMP066	1	Software	Software Assistant	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
166	EMP067	2	Calibration	Calibration Technician	2023-01-01	2023-06-09	f	2025-10-31 14:55:58
167	EMP067	1	Calibration	Calibration Trainee	2023-06-10	9999-12-31	t	2025-10-31 14:55:58
168	EMP068	2	Calibration	Calibration Technician	2023-01-01	2023-05-08	f	2025-10-31 14:55:58
169	EMP068	1	Calibration	Calibration Trainee	2023-05-09	2023-09-20	f	2025-10-31 14:55:58
170	EMP068	4	Calibration	Calibration Lead	2023-09-21	9999-12-31	t	2025-10-31 14:55:58
171	EMP069	3	Calibration	Calibration Specialist	2023-01-01	2023-05-28	f	2025-10-31 14:55:58
172	EMP069	2	Calibration	Calibration Technician	2023-05-29	2023-10-10	f	2025-10-31 14:55:58
173	EMP069	3	Calibration	Calibration Specialist	2023-10-11	2024-03-28	f	2025-10-31 14:55:58
174	EMP069	2	Calibration	Calibration Technician	2024-03-29	9999-12-31	t	2025-10-31 14:55:58
175	EMP070	1	Hardware	Hardware Assistant	2023-01-01	2023-05-28	f	2025-10-31 14:55:58
176	EMP070	2	Hardware	Hardware Technician	2023-05-29	9999-12-31	t	2025-10-31 14:55:58
177	EMP071	4	Calibration	Calibration Lead	2023-01-01	2023-05-29	f	2025-10-31 14:55:58
178	EMP071	1	Calibration	Calibration Trainee	2023-05-30	2023-10-28	f	2025-10-31 14:55:58
179	EMP071	3	Calibration	Calibration Specialist	2023-10-29	9999-12-31	t	2025-10-31 14:55:58
180	EMP072	3	Hardware	Senior Hardware Technician	2023-01-01	2023-04-11	f	2025-10-31 14:55:58
181	EMP072	1	Hardware	Hardware Assistant	2023-04-12	9999-12-31	t	2025-10-31 14:55:58
182	EMP073	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-05-01	f	2025-10-31 14:55:58
183	EMP073	2	Diagnostics	Diagnostics Technician	2023-05-02	2023-08-27	f	2025-10-31 14:55:58
184	EMP073	1	Diagnostics	Diagnostics Assistant	2023-08-28	9999-12-31	t	2025-10-31 14:55:58
185	EMP074	1	Calibration	Calibration Trainee	2023-01-01	2023-06-16	f	2025-10-31 14:55:58
186	EMP074	4	Calibration	Calibration Lead	2023-06-17	2023-11-18	f	2025-10-31 14:55:58
187	EMP074	2	Calibration	Calibration Technician	2023-11-19	2024-03-17	f	2025-10-31 14:55:58
188	EMP074	4	Calibration	Calibration Lead	2024-03-18	9999-12-31	t	2025-10-31 14:55:58
189	EMP075	2	Calibration	Calibration Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
190	EMP076	1	Software	Software Assistant	2023-01-01	2023-04-03	f	2025-10-31 14:55:58
191	EMP076	3	Software	Firmware Specialist	2023-04-04	2023-09-17	f	2025-10-31 14:55:58
192	EMP076	1	Software	Software Assistant	2023-09-18	2024-01-10	f	2025-10-31 14:55:58
193	EMP076	3	Software	Firmware Specialist	2024-01-11	9999-12-31	t	2025-10-31 14:55:58
194	EMP077	2	Calibration	Calibration Technician	2023-01-01	2023-05-24	f	2025-10-31 14:55:58
195	EMP077	3	Calibration	Calibration Specialist	2023-05-25	2023-09-29	f	2025-10-31 14:55:58
196	EMP077	2	Calibration	Calibration Technician	2023-09-30	9999-12-31	t	2025-10-31 14:55:58
197	EMP078	4	Hardware	Hardware Lead	2023-01-01	2023-05-09	f	2025-10-31 14:55:58
198	EMP078	1	Hardware	Hardware Assistant	2023-05-10	2023-09-21	f	2025-10-31 14:55:58
199	EMP078	2	Hardware	Hardware Technician	2023-09-22	2024-03-17	f	2025-10-31 14:55:58
200	EMP078	4	Hardware	Hardware Lead	2024-03-18	9999-12-31	t	2025-10-31 14:55:58
201	EMP079	3	Hardware	Senior Hardware Technician	2023-01-01	2023-06-13	f	2025-10-31 14:55:58
202	EMP079	2	Hardware	Hardware Technician	2023-06-14	9999-12-31	t	2025-10-31 14:55:58
203	EMP080	1	Calibration	Calibration Trainee	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
204	EMP081	3	Calibration	Calibration Specialist	2023-01-01	2023-04-22	f	2025-10-31 14:55:58
205	EMP081	4	Calibration	Calibration Lead	2023-04-23	2023-09-28	f	2025-10-31 14:55:58
206	EMP081	2	Calibration	Calibration Technician	2023-09-29	2024-01-14	f	2025-10-31 14:55:58
207	EMP081	3	Calibration	Calibration Specialist	2024-01-15	9999-12-31	t	2025-10-31 14:55:58
208	EMP082	2	Hardware	Hardware Technician	2023-01-01	2023-06-01	f	2025-10-31 14:55:58
209	EMP082	4	Hardware	Hardware Lead	2023-06-02	2023-09-02	f	2025-10-31 14:55:58
210	EMP082	1	Hardware	Hardware Assistant	2023-09-03	2023-12-26	f	2025-10-31 14:55:58
211	EMP082	2	Hardware	Hardware Technician	2023-12-27	9999-12-31	t	2025-10-31 14:55:58
212	EMP083	1	Hardware	Hardware Assistant	2023-01-01	2023-06-25	f	2025-10-31 14:55:58
213	EMP083	3	Hardware	Senior Hardware Technician	2023-06-26	2023-12-17	f	2025-10-31 14:55:58
214	EMP083	4	Hardware	Hardware Lead	2023-12-18	9999-12-31	t	2025-10-31 14:55:58
215	EMP084	4	Diagnostics	Diagnostics Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
216	EMP085	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-05-18	f	2025-10-31 14:55:58
217	EMP085	1	Diagnostics	Diagnostics Assistant	2023-05-19	2023-08-25	f	2025-10-31 14:55:58
218	EMP085	4	Diagnostics	Diagnostics Lead	2023-08-26	9999-12-31	t	2025-10-31 14:55:58
219	EMP086	1	Hardware	Hardware Assistant	2023-01-01	2023-05-26	f	2025-10-31 14:55:58
220	EMP086	4	Hardware	Hardware Lead	2023-05-27	9999-12-31	t	2025-10-31 14:55:58
221	EMP087	1	Hardware	Hardware Assistant	2023-01-01	2023-06-30	f	2025-10-31 14:55:58
222	EMP087	3	Hardware	Senior Hardware Technician	2023-07-01	2023-10-15	f	2025-10-31 14:55:58
223	EMP087	1	Hardware	Hardware Assistant	2023-10-16	2024-03-22	f	2025-10-31 14:55:58
224	EMP087	4	Hardware	Hardware Lead	2024-03-23	9999-12-31	t	2025-10-31 14:55:58
225	EMP088	4	Calibration	Calibration Lead	2023-01-01	2023-04-07	f	2025-10-31 14:55:58
226	EMP088	3	Calibration	Calibration Specialist	2023-04-08	9999-12-31	t	2025-10-31 14:55:58
227	EMP089	2	Hardware	Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
228	EMP090	2	Software	Device Programmer	2023-01-01	2023-06-27	f	2025-10-31 14:55:58
229	EMP090	1	Software	Software Assistant	2023-06-28	2023-10-09	f	2025-10-31 14:55:58
230	EMP090	4	Software	Software Lead	2023-10-10	2024-02-26	f	2025-10-31 14:55:58
231	EMP090	1	Software	Software Assistant	2024-02-27	9999-12-31	t	2025-10-31 14:55:58
232	EMP091	1	Hardware	Hardware Assistant	2023-01-01	2023-04-23	f	2025-10-31 14:55:58
233	EMP091	2	Hardware	Hardware Technician	2023-04-24	9999-12-31	t	2025-10-31 14:55:58
234	EMP092	4	Hardware	Hardware Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
235	EMP093	3	Hardware	Senior Hardware Technician	2023-01-01	2023-05-04	f	2025-10-31 14:55:58
236	EMP093	1	Hardware	Hardware Assistant	2023-05-05	2023-08-26	f	2025-10-31 14:55:58
237	EMP093	3	Hardware	Senior Hardware Technician	2023-08-27	9999-12-31	t	2025-10-31 14:55:58
238	EMP094	1	Calibration	Calibration Trainee	2023-01-01	2023-05-30	f	2025-10-31 14:55:58
239	EMP094	3	Calibration	Calibration Specialist	2023-05-31	2023-10-12	f	2025-10-31 14:55:58
240	EMP094	1	Calibration	Calibration Trainee	2023-10-13	9999-12-31	t	2025-10-31 14:55:58
241	EMP095	1	Calibration	Calibration Trainee	2023-01-01	2023-04-09	f	2025-10-31 14:55:58
242	EMP095	2	Calibration	Calibration Technician	2023-04-10	2023-09-02	f	2025-10-31 14:55:58
243	EMP095	3	Calibration	Calibration Specialist	2023-09-03	9999-12-31	t	2025-10-31 14:55:58
244	EMP096	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-05-04	f	2025-10-31 14:55:58
245	EMP096	1	Diagnostics	Diagnostics Assistant	2023-05-05	2023-10-23	f	2025-10-31 14:55:58
246	EMP096	4	Diagnostics	Diagnostics Lead	2023-10-24	2024-03-31	f	2025-10-31 14:55:58
247	EMP096	2	Diagnostics	Diagnostics Technician	2024-04-01	9999-12-31	t	2025-10-31 14:55:58
248	EMP097	2	Calibration	Calibration Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
249	EMP098	2	Software	Device Programmer	2023-01-01	2023-05-28	f	2025-10-31 14:55:58
250	EMP098	4	Software	Software Lead	2023-05-29	2023-11-17	f	2025-10-31 14:55:58
251	EMP098	1	Software	Software Assistant	2023-11-18	9999-12-31	t	2025-10-31 14:55:58
252	EMP099	2	Calibration	Calibration Technician	2023-01-01	2023-04-09	f	2025-10-31 14:55:58
253	EMP099	4	Calibration	Calibration Lead	2023-04-10	9999-12-31	t	2025-10-31 14:55:58
254	EMP100	3	Software	Firmware Specialist	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
255	EMP101	4	Software	Software Lead	2023-01-01	2023-04-14	f	2025-10-31 14:55:58
256	EMP101	3	Software	Firmware Specialist	2023-04-15	9999-12-31	t	2025-10-31 14:55:58
257	EMP102	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-04-05	f	2025-10-31 14:55:58
258	EMP102	3	Diagnostics	Fault Analysis Specialist	2023-04-06	2023-09-23	f	2025-10-31 14:55:58
259	EMP102	1	Diagnostics	Diagnostics Assistant	2023-09-24	9999-12-31	t	2025-10-31 14:55:58
260	EMP103	3	Calibration	Calibration Specialist	2023-01-01	2023-06-16	f	2025-10-31 14:55:58
261	EMP103	2	Calibration	Calibration Technician	2023-06-17	2023-09-21	f	2025-10-31 14:55:58
262	EMP103	1	Calibration	Calibration Trainee	2023-09-22	9999-12-31	t	2025-10-31 14:55:58
263	EMP104	3	Software	Firmware Specialist	2023-01-01	2023-04-02	f	2025-10-31 14:55:58
264	EMP104	4	Software	Software Lead	2023-04-03	2023-09-14	f	2025-10-31 14:55:58
265	EMP104	1	Software	Software Assistant	2023-09-15	2024-02-21	f	2025-10-31 14:55:58
266	EMP104	3	Software	Firmware Specialist	2024-02-22	9999-12-31	t	2025-10-31 14:55:58
267	EMP105	4	Diagnostics	Diagnostics Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
268	EMP106	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-06-17	f	2025-10-31 14:55:58
269	EMP106	1	Diagnostics	Diagnostics Assistant	2023-06-18	2023-10-28	f	2025-10-31 14:55:58
270	EMP106	2	Diagnostics	Diagnostics Technician	2023-10-29	9999-12-31	t	2025-10-31 14:55:58
271	EMP107	2	Software	Device Programmer	2023-01-01	2023-04-08	f	2025-10-31 14:55:58
272	EMP107	1	Software	Software Assistant	2023-04-09	2023-09-18	f	2025-10-31 14:55:58
273	EMP107	2	Software	Device Programmer	2023-09-19	9999-12-31	t	2025-10-31 14:55:58
274	EMP108	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-04-28	f	2025-10-31 14:55:58
275	EMP108	2	Diagnostics	Diagnostics Technician	2023-04-29	2023-10-09	f	2025-10-31 14:55:58
276	EMP108	1	Diagnostics	Diagnostics Assistant	2023-10-10	2024-02-27	f	2025-10-31 14:55:58
277	EMP108	4	Diagnostics	Diagnostics Lead	2024-02-28	9999-12-31	t	2025-10-31 14:55:58
278	EMP109	4	Diagnostics	Diagnostics Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
279	EMP110	1	Diagnostics	Diagnostics Assistant	2023-01-01	2023-05-19	f	2025-10-31 14:55:58
280	EMP110	4	Diagnostics	Diagnostics Lead	2023-05-20	2023-08-23	f	2025-10-31 14:55:58
281	EMP110	2	Diagnostics	Diagnostics Technician	2023-08-24	2024-01-28	f	2025-10-31 14:55:58
282	EMP110	1	Diagnostics	Diagnostics Assistant	2024-01-29	9999-12-31	t	2025-10-31 14:55:58
283	EMP111	1	Calibration	Calibration Trainee	2023-01-01	2023-06-16	f	2025-10-31 14:55:58
284	EMP111	4	Calibration	Calibration Lead	2023-06-17	2023-12-12	f	2025-10-31 14:55:58
285	EMP111	1	Calibration	Calibration Trainee	2023-12-13	2024-05-22	f	2025-10-31 14:55:58
286	EMP111	3	Calibration	Calibration Specialist	2024-05-23	9999-12-31	t	2025-10-31 14:55:58
287	EMP112	3	Hardware	Senior Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
288	EMP113	1	Software	Software Assistant	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
289	EMP114	2	Software	Device Programmer	2023-01-01	2023-04-27	f	2025-10-31 14:55:58
290	EMP114	3	Software	Firmware Specialist	2023-04-28	2023-10-19	f	2025-10-31 14:55:58
291	EMP114	4	Software	Software Lead	2023-10-20	9999-12-31	t	2025-10-31 14:55:58
292	EMP115	1	Calibration	Calibration Trainee	2023-01-01	2023-05-04	f	2025-10-31 14:55:58
293	EMP115	4	Calibration	Calibration Lead	2023-05-05	2023-08-17	f	2025-10-31 14:55:58
294	EMP115	2	Calibration	Calibration Technician	2023-08-18	2023-12-15	f	2025-10-31 14:55:58
295	EMP115	1	Calibration	Calibration Trainee	2023-12-16	9999-12-31	t	2025-10-31 14:55:58
296	EMP116	3	Calibration	Calibration Specialist	2023-01-01	2023-06-03	f	2025-10-31 14:55:58
297	EMP116	1	Calibration	Calibration Trainee	2023-06-04	9999-12-31	t	2025-10-31 14:55:58
298	EMP117	2	Software	Device Programmer	2023-01-01	2023-06-30	f	2025-10-31 14:55:58
299	EMP117	1	Software	Software Assistant	2023-07-01	2023-12-27	f	2025-10-31 14:55:58
300	EMP117	4	Software	Software Lead	2023-12-28	2024-04-23	f	2025-10-31 14:55:58
301	EMP117	3	Software	Firmware Specialist	2024-04-24	9999-12-31	t	2025-10-31 14:55:58
302	EMP118	4	Hardware	Hardware Lead	2023-01-01	2023-05-17	f	2025-10-31 14:55:58
303	EMP118	1	Hardware	Hardware Assistant	2023-05-18	2023-11-13	f	2025-10-31 14:55:58
304	EMP118	3	Hardware	Senior Hardware Technician	2023-11-14	9999-12-31	t	2025-10-31 14:55:58
305	EMP119	1	Diagnostics	Diagnostics Assistant	2023-01-01	2023-04-01	f	2025-10-31 14:55:58
306	EMP119	4	Diagnostics	Diagnostics Lead	2023-04-02	9999-12-31	t	2025-10-31 14:55:58
307	EMP120	4	Hardware	Hardware Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
308	EMP121	3	Calibration	Calibration Specialist	2023-01-01	2023-06-14	f	2025-10-31 14:55:58
309	EMP121	4	Calibration	Calibration Lead	2023-06-15	9999-12-31	t	2025-10-31 14:55:58
310	EMP122	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-05-31	f	2025-10-31 14:55:58
311	EMP122	4	Diagnostics	Diagnostics Lead	2023-06-01	9999-12-31	t	2025-10-31 14:55:58
312	EMP123	2	Calibration	Calibration Technician	2023-01-01	2023-05-25	f	2025-10-31 14:55:58
313	EMP123	1	Calibration	Calibration Trainee	2023-05-26	2023-10-01	f	2025-10-31 14:55:58
314	EMP123	4	Calibration	Calibration Lead	2023-10-02	2024-02-23	f	2025-10-31 14:55:58
315	EMP123	2	Calibration	Calibration Technician	2024-02-24	9999-12-31	t	2025-10-31 14:55:58
316	EMP124	2	Software	Device Programmer	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
317	EMP125	4	Diagnostics	Diagnostics Lead	2023-01-01	2023-06-29	f	2025-10-31 14:55:58
318	EMP125	1	Diagnostics	Diagnostics Assistant	2023-06-30	2023-12-02	f	2025-10-31 14:55:58
319	EMP125	3	Diagnostics	Fault Analysis Specialist	2023-12-03	2024-03-30	f	2025-10-31 14:55:58
320	EMP125	2	Diagnostics	Diagnostics Technician	2024-03-31	9999-12-31	t	2025-10-31 14:55:58
321	EMP126	4	Hardware	Hardware Lead	2023-01-01	2023-05-29	f	2025-10-31 14:55:58
322	EMP126	3	Hardware	Senior Hardware Technician	2023-05-30	9999-12-31	t	2025-10-31 14:55:58
323	EMP127	2	Hardware	Hardware Technician	2023-01-01	2023-04-23	f	2025-10-31 14:55:58
324	EMP127	4	Hardware	Hardware Lead	2023-04-24	2023-10-06	f	2025-10-31 14:55:58
325	EMP127	1	Hardware	Hardware Assistant	2023-10-07	9999-12-31	t	2025-10-31 14:55:58
326	EMP128	3	Software	Firmware Specialist	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
327	EMP129	4	Calibration	Calibration Lead	2023-01-01	2023-05-01	f	2025-10-31 14:55:58
328	EMP129	2	Calibration	Calibration Technician	2023-05-02	2023-08-20	f	2025-10-31 14:55:58
329	EMP129	4	Calibration	Calibration Lead	2023-08-21	9999-12-31	t	2025-10-31 14:55:58
330	EMP130	1	Calibration	Calibration Trainee	2023-01-01	2023-05-24	f	2025-10-31 14:55:58
331	EMP130	4	Calibration	Calibration Lead	2023-05-25	9999-12-31	t	2025-10-31 14:55:58
332	EMP131	3	Software	Firmware Specialist	2023-01-01	2023-05-19	f	2025-10-31 14:55:58
333	EMP131	1	Software	Software Assistant	2023-05-20	2023-11-16	f	2025-10-31 14:55:58
334	EMP131	3	Software	Firmware Specialist	2023-11-17	9999-12-31	t	2025-10-31 14:55:58
335	EMP132	4	Software	Software Lead	2023-01-01	2023-05-23	f	2025-10-31 14:55:58
336	EMP132	3	Software	Firmware Specialist	2023-05-24	2023-09-27	f	2025-10-31 14:55:58
337	EMP132	4	Software	Software Lead	2023-09-28	2023-12-28	f	2025-10-31 14:55:58
338	EMP132	3	Software	Firmware Specialist	2023-12-29	9999-12-31	t	2025-10-31 14:55:58
339	EMP133	2	Hardware	Hardware Technician	2023-01-01	2023-04-17	f	2025-10-31 14:55:58
340	EMP133	1	Hardware	Hardware Assistant	2023-04-18	9999-12-31	t	2025-10-31 14:55:58
341	EMP134	2	Calibration	Calibration Technician	2023-01-01	2023-06-22	f	2025-10-31 14:55:58
342	EMP134	3	Calibration	Calibration Specialist	2023-06-23	2023-10-13	f	2025-10-31 14:55:58
343	EMP134	2	Calibration	Calibration Technician	2023-10-14	2024-02-02	f	2025-10-31 14:55:58
344	EMP134	1	Calibration	Calibration Trainee	2024-02-03	9999-12-31	t	2025-10-31 14:55:58
345	EMP135	2	Calibration	Calibration Technician	2023-01-01	2023-05-31	f	2025-10-31 14:55:58
346	EMP135	3	Calibration	Calibration Specialist	2023-06-01	2023-11-14	f	2025-10-31 14:55:58
347	EMP135	1	Calibration	Calibration Trainee	2023-11-15	9999-12-31	t	2025-10-31 14:55:58
348	EMP136	1	Hardware	Hardware Assistant	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
349	EMP137	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-06-26	f	2025-10-31 14:55:58
350	EMP137	1	Diagnostics	Diagnostics Assistant	2023-06-27	2023-10-14	f	2025-10-31 14:55:58
351	EMP137	4	Diagnostics	Diagnostics Lead	2023-10-15	9999-12-31	t	2025-10-31 14:55:58
352	EMP138	1	Calibration	Calibration Trainee	2023-01-01	2023-04-29	f	2025-10-31 14:55:58
353	EMP138	3	Calibration	Calibration Specialist	2023-04-30	2023-10-10	f	2025-10-31 14:55:58
354	EMP138	2	Calibration	Calibration Technician	2023-10-11	2024-03-08	f	2025-10-31 14:55:58
355	EMP138	3	Calibration	Calibration Specialist	2024-03-09	9999-12-31	t	2025-10-31 14:55:58
356	EMP139	4	Diagnostics	Diagnostics Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
357	EMP140	2	Hardware	Hardware Technician	2023-01-01	2023-06-04	f	2025-10-31 14:55:58
358	EMP140	4	Hardware	Hardware Lead	2023-06-05	2023-10-31	f	2025-10-31 14:55:58
359	EMP140	2	Hardware	Hardware Technician	2023-11-01	9999-12-31	t	2025-10-31 14:55:58
360	EMP141	4	Hardware	Hardware Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
361	EMP142	2	Software	Device Programmer	2023-01-01	2023-06-18	f	2025-10-31 14:55:58
362	EMP142	1	Software	Software Assistant	2023-06-19	2023-11-10	f	2025-10-31 14:55:58
363	EMP142	2	Software	Device Programmer	2023-11-11	2024-02-10	f	2025-10-31 14:55:58
364	EMP142	1	Software	Software Assistant	2024-02-11	9999-12-31	t	2025-10-31 14:55:58
365	EMP143	4	Calibration	Calibration Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
366	EMP144	3	Hardware	Senior Hardware Technician	2023-01-01	2023-04-15	f	2025-10-31 14:55:58
367	EMP144	1	Hardware	Hardware Assistant	2023-04-16	2023-08-15	f	2025-10-31 14:55:58
368	EMP144	4	Hardware	Hardware Lead	2023-08-16	9999-12-31	t	2025-10-31 14:55:58
369	EMP145	3	Hardware	Senior Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
370	EMP146	2	Software	Device Programmer	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
371	EMP147	2	Diagnostics	Diagnostics Technician	2023-01-01	2023-05-19	f	2025-10-31 14:55:58
372	EMP147	1	Diagnostics	Diagnostics Assistant	2023-05-20	2023-09-23	f	2025-10-31 14:55:58
373	EMP147	3	Diagnostics	Fault Analysis Specialist	2023-09-24	9999-12-31	t	2025-10-31 14:55:58
374	EMP148	4	Diagnostics	Diagnostics Lead	2023-01-01	2023-05-17	f	2025-10-31 14:55:58
375	EMP148	2	Diagnostics	Diagnostics Technician	2023-05-18	2023-11-07	f	2025-10-31 14:55:58
376	EMP148	3	Diagnostics	Fault Analysis Specialist	2023-11-08	2024-03-03	f	2025-10-31 14:55:58
377	EMP148	4	Diagnostics	Diagnostics Lead	2024-03-04	9999-12-31	t	2025-10-31 14:55:58
378	EMP149	4	Diagnostics	Diagnostics Lead	2023-01-01	2023-06-03	f	2025-10-31 14:55:58
379	EMP149	3	Diagnostics	Fault Analysis Specialist	2023-06-04	2023-10-06	f	2025-10-31 14:55:58
380	EMP149	1	Diagnostics	Diagnostics Assistant	2023-10-07	2024-02-23	f	2025-10-31 14:55:58
381	EMP149	2	Diagnostics	Diagnostics Technician	2024-02-24	9999-12-31	t	2025-10-31 14:55:58
382	EMP150	3	Hardware	Senior Hardware Technician	2023-01-01	2023-04-12	f	2025-10-31 14:55:58
383	EMP150	1	Hardware	Hardware Assistant	2023-04-13	2023-10-04	f	2025-10-31 14:55:58
384	EMP150	2	Hardware	Hardware Technician	2023-10-05	2024-01-09	f	2025-10-31 14:55:58
385	EMP150	4	Hardware	Hardware Lead	2024-01-10	9999-12-31	t	2025-10-31 14:55:58
386	EMP151	2	Software	Device Programmer	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
387	EMP152	1	Software	Software Assistant	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
388	EMP153	1	Calibration	Calibration Trainee	2023-01-01	2023-06-20	f	2025-10-31 14:55:58
389	EMP153	4	Calibration	Calibration Lead	2023-06-21	2023-11-06	f	2025-10-31 14:55:58
390	EMP153	2	Calibration	Calibration Technician	2023-11-07	9999-12-31	t	2025-10-31 14:55:58
391	EMP154	1	Software	Software Assistant	2023-01-01	2023-06-04	f	2025-10-31 14:55:58
392	EMP154	2	Software	Device Programmer	2023-06-05	2023-09-25	f	2025-10-31 14:55:58
393	EMP154	3	Software	Firmware Specialist	2023-09-26	9999-12-31	t	2025-10-31 14:55:58
394	EMP155	4	Diagnostics	Diagnostics Lead	2023-01-01	2023-05-07	f	2025-10-31 14:55:58
395	EMP155	1	Diagnostics	Diagnostics Assistant	2023-05-08	2023-08-29	f	2025-10-31 14:55:58
396	EMP155	3	Diagnostics	Fault Analysis Specialist	2023-08-30	9999-12-31	t	2025-10-31 14:55:58
397	EMP156	1	Hardware	Hardware Assistant	2023-01-01	2023-05-31	f	2025-10-31 14:55:58
398	EMP156	3	Hardware	Senior Hardware Technician	2023-06-01	2023-10-10	f	2025-10-31 14:55:58
399	EMP156	4	Hardware	Hardware Lead	2023-10-11	2024-02-24	f	2025-10-31 14:55:58
400	EMP156	3	Hardware	Senior Hardware Technician	2024-02-25	9999-12-31	t	2025-10-31 14:55:58
401	EMP157	4	Hardware	Hardware Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
402	EMP158	2	Calibration	Calibration Technician	2023-01-01	2023-04-05	f	2025-10-31 14:55:58
403	EMP158	4	Calibration	Calibration Lead	2023-04-06	2023-09-30	f	2025-10-31 14:55:58
404	EMP158	1	Calibration	Calibration Trainee	2023-10-01	9999-12-31	t	2025-10-31 14:55:58
405	EMP159	1	Diagnostics	Diagnostics Assistant	2023-01-01	2023-06-22	f	2025-10-31 14:55:58
406	EMP159	4	Diagnostics	Diagnostics Lead	2023-06-23	2023-10-14	f	2025-10-31 14:55:58
407	EMP159	2	Diagnostics	Diagnostics Technician	2023-10-15	2024-02-20	f	2025-10-31 14:55:58
408	EMP159	1	Diagnostics	Diagnostics Assistant	2024-02-21	9999-12-31	t	2025-10-31 14:55:58
409	EMP160	4	Hardware	Hardware Lead	2023-01-01	2023-05-20	f	2025-10-31 14:55:58
410	EMP160	3	Hardware	Senior Hardware Technician	2023-05-21	2023-08-23	f	2025-10-31 14:55:58
411	EMP160	1	Hardware	Hardware Assistant	2023-08-24	9999-12-31	t	2025-10-31 14:55:58
412	EMP161	2	Diagnostics	Diagnostics Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
413	EMP162	3	Hardware	Senior Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
414	EMP163	1	Software	Software Assistant	2023-01-01	2023-04-07	f	2025-10-31 14:55:58
415	EMP163	4	Software	Software Lead	2023-04-08	2023-07-29	f	2025-10-31 14:55:58
416	EMP163	3	Software	Firmware Specialist	2023-07-30	9999-12-31	t	2025-10-31 14:55:58
417	EMP164	3	Hardware	Senior Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
418	EMP165	2	Diagnostics	Diagnostics Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
419	EMP166	1	Software	Software Assistant	2023-01-01	2023-05-24	f	2025-10-31 14:55:58
420	EMP166	2	Software	Device Programmer	2023-05-25	2023-10-31	f	2025-10-31 14:55:58
421	EMP166	4	Software	Software Lead	2023-11-01	9999-12-31	t	2025-10-31 14:55:58
422	EMP167	2	Software	Device Programmer	2023-01-01	2023-05-24	f	2025-10-31 14:55:58
423	EMP167	1	Software	Software Assistant	2023-05-25	2023-08-28	f	2025-10-31 14:55:58
424	EMP167	4	Software	Software Lead	2023-08-29	9999-12-31	t	2025-10-31 14:55:58
425	EMP168	4	Hardware	Hardware Lead	2023-01-01	2023-05-26	f	2025-10-31 14:55:58
426	EMP168	3	Hardware	Senior Hardware Technician	2023-05-27	9999-12-31	t	2025-10-31 14:55:58
427	EMP169	4	Software	Software Lead	2023-01-01	2023-06-09	f	2025-10-31 14:55:58
428	EMP169	2	Software	Device Programmer	2023-06-10	2023-11-10	f	2025-10-31 14:55:58
429	EMP169	3	Software	Firmware Specialist	2023-11-11	2024-02-14	f	2025-10-31 14:55:58
430	EMP169	1	Software	Software Assistant	2024-02-15	9999-12-31	t	2025-10-31 14:55:58
431	EMP170	2	Hardware	Hardware Technician	2023-01-01	2023-05-25	f	2025-10-31 14:55:58
432	EMP170	1	Hardware	Hardware Assistant	2023-05-26	9999-12-31	t	2025-10-31 14:55:58
433	EMP171	4	Calibration	Calibration Lead	2023-01-01	2023-05-18	f	2025-10-31 14:55:58
434	EMP171	3	Calibration	Calibration Specialist	2023-05-19	2023-09-18	f	2025-10-31 14:55:58
435	EMP171	4	Calibration	Calibration Lead	2023-09-19	2023-12-28	f	2025-10-31 14:55:58
436	EMP171	1	Calibration	Calibration Trainee	2023-12-29	9999-12-31	t	2025-10-31 14:55:58
437	EMP172	4	Software	Software Lead	2023-01-01	2023-05-05	f	2025-10-31 14:55:58
438	EMP172	2	Software	Device Programmer	2023-05-06	9999-12-31	t	2025-10-31 14:55:58
439	EMP173	4	Calibration	Calibration Lead	2023-01-01	2023-06-12	f	2025-10-31 14:55:58
440	EMP173	3	Calibration	Calibration Specialist	2023-06-13	9999-12-31	t	2025-10-31 14:55:58
441	EMP174	1	Calibration	Calibration Trainee	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
442	EMP175	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-05-12	f	2025-10-31 14:55:58
443	EMP175	4	Diagnostics	Diagnostics Lead	2023-05-13	2023-10-23	f	2025-10-31 14:55:58
444	EMP175	3	Diagnostics	Fault Analysis Specialist	2023-10-24	9999-12-31	t	2025-10-31 14:55:58
445	EMP176	3	Calibration	Calibration Specialist	2023-01-01	2023-04-14	f	2025-10-31 14:55:58
446	EMP176	4	Calibration	Calibration Lead	2023-04-15	9999-12-31	t	2025-10-31 14:55:58
447	EMP177	1	Calibration	Calibration Trainee	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
448	EMP178	2	Calibration	Calibration Technician	2023-01-01	2023-06-16	f	2025-10-31 14:55:58
449	EMP178	4	Calibration	Calibration Lead	2023-06-17	2023-10-12	f	2025-10-31 14:55:58
450	EMP178	2	Calibration	Calibration Technician	2023-10-13	9999-12-31	t	2025-10-31 14:55:58
451	EMP179	3	Diagnostics	Fault Analysis Specialist	2023-01-01	2023-05-01	f	2025-10-31 14:55:58
452	EMP179	4	Diagnostics	Diagnostics Lead	2023-05-02	2023-09-03	f	2025-10-31 14:55:58
453	EMP179	1	Diagnostics	Diagnostics Assistant	2023-09-04	9999-12-31	t	2025-10-31 14:55:58
454	EMP180	1	Calibration	Calibration Trainee	2023-01-01	2023-05-09	f	2025-10-31 14:55:58
455	EMP180	3	Calibration	Calibration Specialist	2023-05-10	2023-09-26	f	2025-10-31 14:55:58
456	EMP180	2	Calibration	Calibration Technician	2023-09-27	9999-12-31	t	2025-10-31 14:55:58
457	EMP181	2	Calibration	Calibration Technician	2023-01-01	2023-04-19	f	2025-10-31 14:55:58
458	EMP181	4	Calibration	Calibration Lead	2023-04-20	9999-12-31	t	2025-10-31 14:55:58
459	EMP182	4	Calibration	Calibration Lead	2023-01-01	2023-04-20	f	2025-10-31 14:55:58
460	EMP182	1	Calibration	Calibration Trainee	2023-04-21	2023-08-21	f	2025-10-31 14:55:58
461	EMP182	3	Calibration	Calibration Specialist	2023-08-22	9999-12-31	t	2025-10-31 14:55:58
462	EMP183	2	Calibration	Calibration Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
463	EMP184	2	Hardware	Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
464	EMP185	1	Software	Software Assistant	2023-01-01	2023-04-04	f	2025-10-31 14:55:58
465	EMP185	3	Software	Firmware Specialist	2023-04-05	2023-08-24	f	2025-10-31 14:55:58
466	EMP185	1	Software	Software Assistant	2023-08-25	2024-01-19	f	2025-10-31 14:55:58
467	EMP185	2	Software	Device Programmer	2024-01-20	9999-12-31	t	2025-10-31 14:55:58
468	EMP186	3	Software	Firmware Specialist	2023-01-01	2023-04-24	f	2025-10-31 14:55:58
469	EMP186	4	Software	Software Lead	2023-04-25	2023-09-03	f	2025-10-31 14:55:58
470	EMP186	1	Software	Software Assistant	2023-09-04	2024-01-13	f	2025-10-31 14:55:58
471	EMP186	2	Software	Device Programmer	2024-01-14	9999-12-31	t	2025-10-31 14:55:58
472	EMP187	4	Diagnostics	Diagnostics Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
473	EMP188	4	Software	Software Lead	2023-01-01	2023-05-10	f	2025-10-31 14:55:58
474	EMP188	2	Software	Device Programmer	2023-05-11	2023-11-04	f	2025-10-31 14:55:58
475	EMP188	4	Software	Software Lead	2023-11-05	2024-04-26	f	2025-10-31 14:55:58
476	EMP188	1	Software	Software Assistant	2024-04-27	9999-12-31	t	2025-10-31 14:55:58
477	EMP189	2	Hardware	Hardware Technician	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
478	EMP190	1	Hardware	Hardware Assistant	2023-01-01	2023-05-26	f	2025-10-31 14:55:58
479	EMP190	4	Hardware	Hardware Lead	2023-05-27	9999-12-31	t	2025-10-31 14:55:58
480	EMP191	4	Hardware	Hardware Lead	2023-01-01	9999-12-31	t	2025-10-31 14:55:58
481	EMP192	1	Software	Software Assistant	2023-01-01	2023-06-16	f	2025-10-31 14:55:58
482	EMP192	2	Software	Device Programmer	2023-06-17	2023-10-04	f	2025-10-31 14:55:58
483	EMP192	4	Software	Software Lead	2023-10-05	2024-01-13	f	2025-10-31 14:55:58
484	EMP192	1	Software	Software Assistant	2024-01-14	9999-12-31	t	2025-10-31 14:55:58
\.


--
-- Data for Name: dim_timeday; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.dim_timeday (id, etl_load_timestamp) FROM stdin;
1	2025-10-31 14:55:58.420506
2	2025-10-31 14:55:58.420506
3	2025-10-31 14:55:58.420506
4	2025-10-31 14:55:58.420506
5	2025-10-31 14:55:58.420506
\.


--
-- Data for Name: ft_name1; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.ft_name1 (id, day_id, sk_parameter, sk_servicetype, etl_load_timestamp) FROM stdin;
1	1	1	1	2025-10-31 14:55:58.43998
2	2	1	1	2025-10-31 14:55:58.43998
3	3	1	1	2025-10-31 14:55:58.43998
4	1	1	2	2025-10-31 14:55:58.43998
5	2	1	2	2025-10-31 14:55:58.43998
\.


--
-- Data for Name: ft_name2; Type: TABLE DATA; Schema: dwh_033; Owner: -
--

COPY dwh_033.ft_name2 (id, day_id, sk_parameter, sk_technician_role, etl_load_timestamp) FROM stdin;
1	1	1	3	2025-10-31 14:55:58.445029
2	2	1	3	2025-10-31 14:55:58.445029
3	3	1	3	2025-10-31 14:55:58.445029
4	1	1	6	2025-10-31 14:55:58.445029
5	2	1	6	2025-10-31 14:55:58.445029
\.


--
-- Name: dim_parameter_sk_parameter_seq; Type: SEQUENCE SET; Schema: dwh_033; Owner: -
--

SELECT pg_catalog.setval('dwh_033.dim_parameter_sk_parameter_seq', 30, true);


--
-- Name: dim_servicetype_sk_servicetype_seq; Type: SEQUENCE SET; Schema: dwh_033; Owner: -
--

SELECT pg_catalog.setval('dwh_033.dim_servicetype_sk_servicetype_seq', 24, true);


--
-- Name: dim_technician_role_scd2_sk_technician_role_seq; Type: SEQUENCE SET; Schema: dwh_033; Owner: -
--

SELECT pg_catalog.setval('dwh_033.dim_technician_role_scd2_sk_technician_role_seq', 484, true);


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

\unrestrict k54jXsLUaoOYgcK6hpvm1m7wWiI7qNdMne7Zm4cMswXgDLsMXoU9fZixyTHhQMt

