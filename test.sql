--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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
-- Name: cities; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.cities (
    name character varying(64) NOT NULL,
    lon double precision NOT NULL,
    lat double precision NOT NULL,
    country_code character varying(2),
    timezone character varying(64)
);


ALTER TABLE public.cities OWNER TO vagrant;

--
-- Name: liked_trips; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.liked_trips (
    trip_id integer NOT NULL
);


ALTER TABLE public.liked_trips OWNER TO vagrant;

--
-- Name: liked_trips_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.liked_trips_trip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.liked_trips_trip_id_seq OWNER TO vagrant;

--
-- Name: liked_trips_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.liked_trips_trip_id_seq OWNED BY public.liked_trips.trip_id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.photos (
    img_id bigint NOT NULL,
    url character varying(256),
    lon double precision,
    lat double precision,
    city_name character varying(64) NOT NULL
);


ALTER TABLE public.photos OWNER TO vagrant;

--
-- Name: photos_img_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.photos_img_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_img_id_seq OWNER TO vagrant;

--
-- Name: photos_img_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.photos_img_id_seq OWNED BY public.photos.img_id;


--
-- Name: trip_photos_rel; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.trip_photos_rel (
    relationship_id integer NOT NULL,
    trip_id integer NOT NULL,
    photo_id bigint NOT NULL
);


ALTER TABLE public.trip_photos_rel OWNER TO vagrant;

--
-- Name: trip_photos_rel_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.trip_photos_rel_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trip_photos_rel_relationship_id_seq OWNER TO vagrant;

--
-- Name: trip_photos_rel_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.trip_photos_rel_relationship_id_seq OWNED BY public.trip_photos_rel.relationship_id;


--
-- Name: trip_user_likes_rel; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.trip_user_likes_rel (
    relationship_id integer NOT NULL,
    trip_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.trip_user_likes_rel OWNER TO vagrant;

--
-- Name: trip_user_likes_rel_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.trip_user_likes_rel_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trip_user_likes_rel_relationship_id_seq OWNER TO vagrant;

--
-- Name: trip_user_likes_rel_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.trip_user_likes_rel_relationship_id_seq OWNED BY public.trip_user_likes_rel.relationship_id;


--
-- Name: trips; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.trips (
    trip_id integer NOT NULL,
    name character varying(64) NOT NULL,
    user_id integer NOT NULL,
    city_name character varying(64) NOT NULL
);


ALTER TABLE public.trips OWNER TO vagrant;

--
-- Name: trips_trip_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.trips_trip_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trips_trip_id_seq OWNER TO vagrant;

--
-- Name: trips_trip_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.trips_trip_id_seq OWNED BY public.trips.trip_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    fname character varying(64) NOT NULL,
    lname character varying(64) NOT NULL,
    email character varying(64) NOT NULL,
    password character varying(64) NOT NULL
);


ALTER TABLE public.users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: liked_trips trip_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.liked_trips ALTER COLUMN trip_id SET DEFAULT nextval('public.liked_trips_trip_id_seq'::regclass);


--
-- Name: photos img_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.photos ALTER COLUMN img_id SET DEFAULT nextval('public.photos_img_id_seq'::regclass);


--
-- Name: trip_photos_rel relationship_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_photos_rel ALTER COLUMN relationship_id SET DEFAULT nextval('public.trip_photos_rel_relationship_id_seq'::regclass);


--
-- Name: trip_user_likes_rel relationship_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_user_likes_rel ALTER COLUMN relationship_id SET DEFAULT nextval('public.trip_user_likes_rel_relationship_id_seq'::regclass);


--
-- Name: trips trip_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trips ALTER COLUMN trip_id SET DEFAULT nextval('public.trips_trip_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.cities (name, lon, lat, country_code, timezone) FROM stdin;
Dubai	55.171280000000003	25.0656999999999996	AE	Asia/Dubai
Abu Dhabi	54.3666699999999992	24.4666700000000006	AE	Asia/Dubai
Buenos Aires	-58.3772299999999973	-34.6131499999999974	AR	America/Argentina/Buenos_Aires
Vienna	16.3720800000000004	48.2084899999999976	AT	Europe/Vienna
Perth	115.861400000000003	-31.9522399999999998	AU	Australia/Perth
Adelaide	138.598630000000014	-34.9286600000000007	AU	Australia/Adelaide
Sydney	151.20732000000001	-33.8678499999999971	AU	Australia/Sydney
Melbourne	144.96332000000001	-37.8140000000000001	AU	Australia/Melbourne
Gold Coast	153.430880000000002	-28.0002899999999997	AU	Australia/Brisbane
Brisbane	153.028089999999992	-27.4679399999999987	AU	Australia/Brisbane
Dhaka	90.407439999999994	23.7103999999999999	BD	Asia/Dhaka
Brussels	4.34877999999999965	50.8504500000000021	BE	Europe/Brussels
Sao Paulo	-46.6361100000000022	-23.5474999999999994	BR	America/Sao_Paulo
Salvador	-38.5108299999999986	-12.9711099999999995	BR	America/Bahia
Rio de Janeiro	-43.2075000000000031	-22.9027799999999999	BR	America/Sao_Paulo
Calgary	-114.085290000000001	51.0501099999999965	CA	America/Edmonton
Edmonton	-113.468710000000002	53.550139999999999	CA	America/Edmonton
Montreal	-73.5878100000000046	45.5088399999999993	CA	America/Toronto
Ottawa	-75.698120000000003	45.4111699999999985	CA	America/Toronto
Toronto	-79.4163000000000068	43.7001100000000022	CA	America/Toronto
Vancouver	-123.119339999999994	49.2496599999999987	CA	America/Vancouver
Winnipeg	-97.1470400000000041	49.8843999999999994	CA	America/Winnipeg
Quebec	-71.2145399999999995	46.8122800000000012	CA	America/Toronto
Xian	108.928610000000006	34.2583300000000008	CN	Asia/Shanghai
Wuhan	114.266670000000005	30.5833300000000001	CN	Asia/Shanghai
Tianjin	117.176670000000001	39.1422200000000018	CN	Asia/Shanghai
Tangshan	118.183329999999998	39.6333300000000008	CN	Asia/Shanghai
Shenzhen	114.068299999999994	22.545539999999999	CN	Asia/Shanghai
Shanghai	121.458060000000003	31.2222200000000001	CN	Asia/Shanghai
Qingdao	120.380420000000001	36.0648800000000023	CN	Asia/Shanghai
Nanjing	118.777780000000007	32.0616699999999994	CN	Asia/Shanghai
Guilin	110.286389999999997	25.2819399999999987	CN	Asia/Shanghai
Guangzhou	113.25	23.1166699999999992	CN	Asia/Shanghai
Lijiang	100.22072	26.8687900000000006	CN	Asia/Shanghai
Dalian	121.602220000000003	38.9122199999999978	CN	Asia/Shanghai
Chongqing	106.552779999999998	29.5627800000000001	CN	Asia/Shanghai
Chengdu	104.066670000000002	30.6666699999999999	CN	Asia/Shanghai
Beijing	116.397229999999993	39.9074999999999989	CN	Asia/Shanghai
Havana	-82.3830399999999941	23.1330199999999984	CU	America/Havana
Prague	14.4207599999999996	50.0880399999999995	CZ	Europe/Prague
Munich	11.5754900000000003	48.1374300000000019	DE	Europe/Berlin
Berlin	13.4105299999999996	52.5243699999999976	DE	Europe/Berlin
Copenhagen	12.5655300000000008	55.6759399999999971	DK	Europe/Copenhagen
Cairo	31.2496699999999983	30.0626299999999986	EG	Africa/Cairo
Giza	31.2109300000000012	30.0080799999999996	EG	Africa/Cairo
Alexandria	29.9552699999999987	31.2156400000000005	EG	Africa/Cairo
Madrid	-3.70256000000000007	40.4164999999999992	ES	Europe/Madrid
Barcelona	2.15899000000000019	41.3887900000000002	ES	Europe/Madrid
Paris	2.34880000000000022	48.8534099999999967	FR	Europe/Paris
Wellington	-2.51666999999999996	52.7000000000000028	GB	Europe/London
Nottingham	-1.1504700000000001	52.9536000000000016	GB	Europe/London
London	-0.125739999999999991	51.5085300000000004	GB	Europe/London
Liverpool	-2.97793999999999981	53.4105800000000031	GB	Europe/London
Leicester	-1.13169000000000008	52.6385999999999967	GB	Europe/London
Bristol	-2.5966499999999999	51.4552300000000002	GB	Europe/London
Birmingham	-1.89982999999999991	52.48142	GB	Europe/London
Athens	23.7162199999999999	37.9794499999999999	GR	Europe/Athens
Guatemala City	-90.5132700000000057	14.64072	GT	America/Guatemala
Hong Kong	114.174689999999998	22.2783200000000008	HK	Asia/Hong_Kong
Port-au-Prince	-72.3349999999999937	18.5391699999999986	HT	America/Port-au-Prince
Budapest	19.039909999999999	47.4980100000000007	HU	Europe/Budapest
Padang	100.35427	-0.949239999999999973	ID	Asia/Jakarta
Malang	112.630399999999995	-7.97970000000000024	ID	Asia/Jakarta
Jakarta	106.845129999999997	-6.21462000000000003	ID	Asia/Jakarta
Denpasar	115.216669999999993	-8.65000000000000036	ID	Asia/Makassar
Dublin	-6.24889000000000028	53.3330600000000032	IE	Europe/Dublin
Jerusalem	35.2163299999999992	31.7690400000000004	IL	Asia/Jerusalem
Chennai	80.2784699999999987	13.0878399999999999	IN	Asia/Kolkata
Jaipur	75.7878099999999932	26.9196199999999983	IN	Asia/Kolkata
Delhi	77.2314899999999938	28.6519499999999994	IN	Asia/Kolkata
Mumbai	72.8826099999999997	19.0728299999999997	IN	Asia/Kolkata
Baghdad	44.4008800000000008	33.3405800000000028	IQ	Asia/Baghdad
Rome	12.5113299999999992	41.8919300000000021	IT	Europe/Rome
Naples	14.2681100000000001	40.8521599999999978	IT	Europe/Rome
Milan	9.18951000000000029	45.4642699999999991	IT	Europe/Rome
Genoa	8.94439000000000028	44.4047800000000024	IT	Europe/Rome
Kingston	-76.7935800000000057	17.9970199999999991	JM	America/Jamaica
Yokohama	139.650000000000006	35.433329999999998	JP	Asia/Tokyo
Tokyo	139.69171	35.6895000000000024	JP	Asia/Tokyo
Osaka	135.50218000000001	34.6937399999999982	JP	Asia/Tokyo
Kyoto	135.75385	35.0210700000000017	JP	Asia/Tokyo
Kobe	135.182999999999993	34.6912999999999982	JP	Asia/Tokyo
Kawasaki	139.717219999999998	35.5205600000000032	JP	Asia/Tokyo
Hiroshima	132.449999999999989	34.3999999999999986	JP	Asia/Tokyo
Chiba	140.116669999999999	35.6000000000000014	JP	Asia/Tokyo
Sapporo	141.349999999999994	43.066670000000002	JP	Asia/Tokyo
Pyongyang	125.754320000000007	39.033850000000001	KP	Asia/Pyongyang
Seoul	126.978399999999993	37.5660000000000025	KR	Asia/Seoul
Busan	129.040279999999996	35.1027800000000028	KR	Asia/Seoul
Incheon	126.705150000000003	37.4564599999999999	KR	Asia/Seoul
Jeonju	127.148889999999994	35.8219399999999979	KR	Asia/Seoul
Colombo	79.8477800000000002	6.93193999999999999	LK	Asia/Colombo
Casablanca	-7.61137999999999959	33.5883099999999999	MA	Africa/Casablanca
Mandalay	96.0835900000000009	21.974730000000001	MM	Asia/Yangon
Macau	113.546109999999999	22.2005599999999994	MO	Asia/Macau
Cozumel	-86.9427199999999942	20.5003799999999998	MX	America/Cancun
Mexico City	-99.1276600000000059	19.4284700000000008	MX	America/Mexico_City
Cancun	-86.8465599999999966	21.1742899999999992	MX	America/Cancun
Tijuana	-117.003709999999998	32.5026999999999973	MX	America/Tijuana
Lagos	3.39467000000000008	6.45406999999999975	NG	Africa/Lagos
Amsterdam	4.88968999999999987	52.3740299999999976	NL	Europe/Amsterdam
Oslo	10.7460900000000006	59.9127300000000034	NO	Europe/Oslo
Kathmandu	85.3205999999999989	27.7016899999999993	NP	Asia/Kathmandu
Muscat	58.4077800000000025	23.5841299999999983	OM	Asia/Muscat
Lima	-77.0282399999999967	-12.0431799999999996	PE	America/Lima
Manila	120.982200000000006	14.6042000000000005	PH	Asia/Manila
Karachi	67.0104000000000042	24.8608000000000011	PK	Asia/Karachi
Islamabad	73.0432899999999989	33.7214799999999997	PK	Asia/Karachi
Hyderabad	68.373660000000001	25.3924200000000013	PK	Asia/Karachi
Warsaw	21.0117800000000017	52.229770000000002	PL	Europe/Warsaw
Lisbon	-9.13333000000000084	38.7166700000000006	PT	Europe/Lisbon
Saint Petersburg	30.3141299999999987	59.9386300000000034	RU	Europe/Moscow
Moscow	37.6155600000000021	55.7522200000000012	RU	Europe/Moscow
Mecca	39.8256299999999968	21.426639999999999	SA	Asia/Riyadh
Jeddah	39.197969999999998	21.5423800000000014	SA	Asia/Riyadh
Stockholm	18.0649000000000015	59.3325800000000001	SE	Europe/Stockholm
Singapore	103.850070000000002	1.28967000000000009	SG	Asia/Singapore
Dakar	-17.4440600000000003	14.6936999999999998	SN	Africa/Dakar
Bangkok	100.501440000000002	13.7539800000000003	TH	Asia/Bangkok
Tunis	10.1657899999999994	36.8189700000000002	TN	Africa/Tunis
Istanbul	28.9496600000000015	41.0138400000000019	TR	Europe/Istanbul
Taipei	121.531850000000006	25.0477600000000002	TW	Asia/Taipei
Tainan	120.213329999999999	22.990829999999999	TW	Asia/Taipei
Odessa	30.7326200000000007	46.4774699999999967	UA	Europe/Kiev
Washington, D.C.	-77.0363700000000051	38.8951100000000025	US	America/New_York
Jacksonville	-81.6556499999999943	30.332180000000001	US	America/New_York
Columbus	-85.9213799999999992	39.2014399999999981	US	America/Indiana/Indianapolis
Indianapolis	-86.1580399999999997	39.7683800000000005	US	America/Indiana/Indianapolis
Baltimore	-76.6121899999999982	39.290379999999999	US	America/New_York
Charlotte	-80.8431300000000022	35.2270899999999969	US	America/New_York
Oklahoma City	-97.5164299999999997	35.4675599999999989	US	America/Chicago
Philadelphia	-75.1637900000000059	39.9523300000000035	US	America/New_York
Memphis	-90.0489800000000002	35.1495299999999986	US	America/Chicago
Nashville	-86.7844400000000036	36.1658899999999974	US	America/Chicago
Austin	-97.7430599999999998	30.2671500000000009	US	America/Chicago
Dallas	-96.8066699999999969	32.783059999999999	US	America/Chicago
Fort Worth	-97.320849999999993	32.7254099999999966	US	America/Chicago
Houston	-95.36327	29.7632800000000017	US	America/Chicago
Chicago	-87.6500499999999931	41.8500299999999967	US	America/Chicago
Boston	-71.0597700000000003	42.3584299999999985	US	America/New_York
Detroit	-83.0457499999999982	42.3314299999999974	US	America/Detroit
Brooklyn	-73.9495799999999974	40.6501000000000019	US	America/New_York
Manhattan	-73.9662500000000023	40.7834300000000027	US	America/New_York
New York City	-74.0059700000000049	40.7142699999999991	US	America/New_York
Queens	-73.836519999999993	40.6814899999999966	US	America/New_York
Phoenix	-112.074039999999997	33.4483800000000002	US	America/Phoenix
Tucson	-110.926479999999998	32.2217399999999969	US	America/Phoenix
Los Angeles	-118.243679999999998	34.0522300000000016	US	America/Los_Angeles
Monterey	-121.894679999999994	36.6002399999999994	US	America/Los_Angeles
Napa	-122.285529999999994	38.2971399999999988	US	America/Los_Angeles
San Diego	-117.157259999999994	32.7153300000000016	US	America/Los_Angeles
San Francisco	-122.419420000000002	37.7749299999999977	US	America/Los_Angeles
San Jose	-121.894959999999998	37.3393900000000016	US	America/Los_Angeles
Denver	-104.984700000000004	39.7391500000000022	US	America/Denver
Albuquerque	-106.651139999999998	35.0844900000000024	US	America/Denver
Las Vegas	-115.137219999999999	36.1749700000000018	US	America/Los_Angeles
Reno	-119.813800000000001	39.5296299999999974	US	America/Los_Angeles
El Paso	-106.486930000000001	31.7587200000000003	US	America/Denver
Portland	-122.676209999999998	45.5234499999999969	US	America/Los_Angeles
Seattle	-122.332070000000002	47.6062099999999973	US	America/Los_Angeles
Ho Chi Minh City	106.629649999999998	10.8230199999999996	VN	Asia/Ho_Chi_Minh
Hanoi	105.841170000000005	21.0244999999999997	VN	Asia/Ho_Chi_Minh
Da Nang	108.220830000000007	16.0677799999999991	VN	Asia/Ho_Chi_Minh
Queenstown	26.8753300000000017	-31.8975599999999986	ZA	Africa/Johannesburg
Port Elizabeth	25.5700700000000012	-33.9179900000000032	ZA	Africa/Johannesburg
Johannesburg	28.0436300000000003	-26.2022699999999986	ZA	Africa/Johannesburg
Cape Town	18.4232200000000006	-33.9258400000000009	ZA	Africa/Johannesburg
\.


--
-- Data for Name: liked_trips; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.liked_trips (trip_id) FROM stdin;
1
3
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.photos (img_id, url, lon, lat, city_name) FROM stdin;
45678	google.com	3	2	San Francisco
1	yahoo.com	5	4	San Francisco
789012	facebook.com	3	3	San Francisco
54321	japan.com	5	1	Tokyo
12345678901	test.com	1	1	Napa
46105882985	https://c2.staticflickr.com/8/7894/46105882985_f067de40a8.jpg	2	2	San Francisco
46293749994	https://c2.staticflickr.com/5/4830/46293749994_4b7a09bfa6.jpg	2	2	San Francisco
46281922924	https://c2.staticflickr.com/5/4887/46281922924_8d5b6aaa0a.jpg	2	2	San Francisco
46877201912	https://c2.staticflickr.com/8/7896/46877201912_d08e7bf7db.jpg	2	2	San Francisco
46011623875	https://c2.staticflickr.com/5/4873/46011623875_21ebc5093c.jpg	2	2	San Francisco
46870970652	https://c2.staticflickr.com/5/4872/46870970652_ea65b3f11c.jpg	2	2	San Francisco
46016991084	https://c2.staticflickr.com/5/4839/46016991084_ff73067310.jpg	2	2	San Francisco
39763546813	https://c2.staticflickr.com/5/4878/39763546813_50b7abb9bc.jpg	2	2	San Francisco
39735435923	https://c2.staticflickr.com/8/7829/39735435923_0443a08763.jpg	2	2	San Francisco
45967406174	https://c2.staticflickr.com/8/7860/45967406174_0036793800.jpg	2	2	San Francisco
46629768792	https://c2.staticflickr.com/8/7810/46629768792_84eb862353.jpg	2	2	San Francisco
31724517057	https://c2.staticflickr.com/5/4816/31724517057_376d662f3b.jpg	2	2	San Francisco
46594830221	https://c2.staticflickr.com/8/7851/46594830221_82cc045465.jpg	2	2	San Francisco
45647140815	https://c2.staticflickr.com/5/4882/45647140815_928f8f5903.jpg	2	2	San Francisco
46461173502	https://c2.staticflickr.com/8/7908/46461173502_91ddd310f0.jpg	2	2	San Francisco
46503078381	https://c2.staticflickr.com/5/4826/46503078381_4a4150ddd9.jpg	2	2	San Francisco
31556116297	https://c2.staticflickr.com/8/7864/31556116297_a59a9db835.jpg	2	2	San Francisco
44640382940	https://c2.staticflickr.com/8/7852/44640382940_935dddc6dc.jpg	2	2	San Francisco
32497832998	https://c2.staticflickr.com/5/4846/32497832998_2fc3da31b6.jpg	2	2	San Francisco
32477897558	https://c2.staticflickr.com/5/4840/32477897558_4cab117a57.jpg	2	2	San Francisco
45375369315	https://c2.staticflickr.com/5/4842/45375369315_eceb449502.jpg	2	2	San Francisco
45339493835	https://c2.staticflickr.com/5/4897/45339493835_a8869351f3.jpg	2	2	San Francisco
45526608464	https://c2.staticflickr.com/2/1923/45526608464_f60e82d88b.jpg	2	2	San Francisco
45297342305	https://c2.staticflickr.com/5/4912/45297342305_0a14770027.jpg	2	2	San Francisco
46117616392	https://c2.staticflickr.com/5/4899/46117616392_5ce6c7c5a1.jpg	2	2	San Francisco
46112961952	https://c2.staticflickr.com/5/4834/46112961952_8685fe7044.jpg	2	2	San Francisco
45429699074	https://c2.staticflickr.com/5/4820/45429699074_3e637ccc51.jpg	2	2	San Francisco
46084040592	https://c2.staticflickr.com/5/4828/46084040592_8b72ffc977.jpg	2	2	San Francisco
32225760818	https://c2.staticflickr.com/5/4880/32225760818_2a24af344a.jpg	2	2	San Francisco
46091214321	https://c2.staticflickr.com/5/4831/46091214321_ff74ecab65.jpg	2	2	San Francisco
31095232947	https://c2.staticflickr.com/5/4853/31095232947_cd86dddae0.jpg	2	2	San Francisco
45964095152	https://c2.staticflickr.com/5/4879/45964095152_12af5c6639.jpg	2	2	San Francisco
45018564655	https://c2.staticflickr.com/5/4807/45018564655_05934d28c3.jpg	2	2	San Francisco
32052399268	https://c2.staticflickr.com/5/4874/32052399268_d0ec84daa1.jpg	2	2	San Francisco
44988714895	https://c2.staticflickr.com/5/4893/44988714895_2279c14ec3.jpg	2	2	San Francisco
44976988205	https://c2.staticflickr.com/5/4902/44976988205_ceb5af9a49.jpg	2	2	San Francisco
30905101687	https://c2.staticflickr.com/5/4890/30905101687_0cef0c1442.jpg	2	2	San Francisco
45111336514	https://c2.staticflickr.com/5/4882/45111336514_8df89f39a5.jpg	2	2	San Francisco
45082312444	https://c2.staticflickr.com/5/4824/45082312444_9757c092dc.jpg	2	2	San Francisco
30866124097	https://c2.staticflickr.com/5/4862/30866124097_03cbffe7c6.jpg	2	2	San Francisco
45689441192	https://c2.staticflickr.com/2/1906/45689441192_255ae558bc.jpg	2	2	San Francisco
43882373710	https://c2.staticflickr.com/2/1960/43882373710_b8ecc53f5d.jpg	2	2	San Francisco
43840300490	https://c2.staticflickr.com/2/1969/43840300490_fda9260052.jpg	2	2	San Francisco
43833659580	https://c2.staticflickr.com/2/1929/43833659580_3c9e364ee7.jpg	2	2	San Francisco
30694940087	https://c2.staticflickr.com/2/1958/30694940087_c811b46d2b.jpg	2	2	San Francisco
45504694451	https://c2.staticflickr.com/2/1919/45504694451_20e92f83cd.jpg	2	2	San Francisco
44563005995	https://c2.staticflickr.com/2/1924/44563005995_0bcabb1d8f.jpg	2	2	San Francisco
44675692784	https://c2.staticflickr.com/2/1926/44675692784_b8902fb292.jpg	2	2	San Francisco
45339983862	https://c2.staticflickr.com/2/1973/45339983862_43bf0a017a.jpg	2	2	San Francisco
44643957544	https://c2.staticflickr.com/2/1940/44643957544_b575f14139.jpg	2	2	San Francisco
31452167208	https://c2.staticflickr.com/2/1966/31452167208_8fcb9646f0.jpg	2	2	San Francisco
31397061868	https://c2.staticflickr.com/2/1943/31397061868_3e2c04f5af.jpg	2	2	San Francisco
44320871465	https://c2.staticflickr.com/2/1902/44320871465_1344e2ecc8.jpg	2	2	San Francisco
43376682020	https://c2.staticflickr.com/2/1919/43376682020_ab189f1a24.jpg	2	2	San Francisco
31298625528	https://c2.staticflickr.com/2/1930/31298625528_599802fb36.jpg	2	2	San Francisco
45118047212	https://c2.staticflickr.com/2/1933/45118047212_bfdd7fe1ab.jpg	2	2	San Francisco
43332772860	https://c2.staticflickr.com/2/1903/43332772860_ca4bb25073.jpg	2	2	San Francisco
30191605457	https://c2.staticflickr.com/2/1975/30191605457_620175326f.jpg	2	2	San Francisco
44214466235	https://c2.staticflickr.com/2/1954/44214466235_dde3717dd1.jpg	2	2	San Francisco
44212009865	https://c2.staticflickr.com/2/1921/44212009865_8fa6b258d9.jpg	2	2	San Francisco
44352273954	https://c2.staticflickr.com/2/1921/44352273954_6b0b0bd8d5.jpg	2	2	San Francisco
43226753290	https://c2.staticflickr.com/2/1952/43226753290_924a97f3bc.jpg	2	2	San Francisco
43185007700	https://c2.staticflickr.com/2/1959/43185007700_3a08763824.jpg	2	2	San Francisco
44058466545	https://c2.staticflickr.com/2/1950/44058466545_ab64001cc6.jpg	2	2	San Francisco
43124677220	https://c2.staticflickr.com/2/1907/43124677220_738a2808c7.jpg	2	2	San Francisco
44214428164	https://c2.staticflickr.com/2/1925/44214428164_54ae412e87.jpg	2	2	San Francisco
44920827381	https://c2.staticflickr.com/2/1951/44920827381_1a4a6c28e0.jpg	2	2	San Francisco
44178081624	https://c2.staticflickr.com/2/1907/44178081624_79ae2b84bd.jpg	2	2	San Francisco
43081461130	https://c2.staticflickr.com/2/1964/43081461130_1035b4d2b2.jpg	2	2	San Francisco
43067908850	https://c2.staticflickr.com/2/1927/43067908850_f098bf5c21.jpg	2	2	San Francisco
43067495970	https://c2.staticflickr.com/2/1966/43067495970_c06d14c82e.jpg	2	2	San Francisco
29938308457	https://c2.staticflickr.com/2/1927/29938308457_08f4551e6b.jpg	2	2	San Francisco
44796849672	https://c2.staticflickr.com/2/1872/44796849672_e7fec39e05.jpg	2	2	San Francisco
43818255905	https://c2.staticflickr.com/2/1899/43818255905_99898b4a9b.jpg	2	2	San Francisco
44588075782	https://c2.staticflickr.com/2/1842/44588075782_ecfe5aa150.jpg	2	2	San Francisco
43912926174	https://c2.staticflickr.com/2/1842/43912926174_5e21af5cc9.jpg	2	2	San Francisco
44557616411	https://c2.staticflickr.com/2/1866/44557616411_907649f3b1.jpg	2	2	San Francisco
44553360521	https://c2.staticflickr.com/2/1894/44553360521_96b8bd0a52.jpg	2	2	San Francisco
43827849504	https://c2.staticflickr.com/2/1877/43827849504_511b9e8ae1.jpg	2	2	San Francisco
44483088132	https://c2.staticflickr.com/2/1887/44483088132_ebf01685f6.jpg	2	2	San Francisco
42723694030	https://c2.staticflickr.com/2/1894/42723694030_905283b39b.jpg	2	2	San Francisco
44452962262	https://c2.staticflickr.com/2/1862/44452962262_0ef92ddded.jpg	2	2	San Francisco
29556676807	https://c2.staticflickr.com/2/1883/29556676807_e6f209da13.jpg	2	2	San Francisco
29472849717	https://c2.staticflickr.com/2/1868/29472849717_4ef3f013e1.jpg	2	2	San Francisco
30525888278	https://c2.staticflickr.com/2/1857/30525888278_01c92b0d55.jpg	2	2	San Francisco
44372545361	https://c2.staticflickr.com/2/1891/44372545361_dfa7a69daa.jpg	2	2	San Francisco
42546045010	https://c2.staticflickr.com/2/1890/42546045010_b2d5b51054.jpg	2	2	San Francisco
43628909114	https://c2.staticflickr.com/2/1872/43628909114_ece1df340d.jpg	2	2	San Francisco
42512966330	https://c2.staticflickr.com/2/1893/42512966330_978b4b6ea6.jpg	2	2	San Francisco
44235581361	https://c2.staticflickr.com/2/1814/44235581361_c347c11fc3.jpg	2	2	San Francisco
44011909332	https://c2.staticflickr.com/2/1819/44011909332_af8bfddeb7.jpg	2	2	San Francisco
43125234875	https://c2.staticflickr.com/2/1819/43125234875_6cf22b0c37.jpg	2	2	San Francisco
42221396770	https://c2.staticflickr.com/2/1780/42221396770_e4bd9d8bdb.jpg	2	2	San Francisco
44005513141	https://c2.staticflickr.com/2/1797/44005513141_5e9815fb52.jpg	2	2	San Francisco
30103017658	https://c2.staticflickr.com/2/1775/30103017658_fe9093d41c.jpg	2	2	San Francisco
30062341218	https://c2.staticflickr.com/2/1778/30062341218_743745a6b3.jpg	2	2	San Francisco
43919556261	https://c2.staticflickr.com/1/934/43919556261_514eb843be.jpg	2	2	San Francisco
43161797644	https://c2.staticflickr.com/1/860/43161797644_cba3a08d6d.jpg	2	2	San Francisco
42968540575	https://c2.staticflickr.com/2/1778/42968540575_5f60c5c17b.jpg	2	2	San Francisco
28708214747	https://c2.staticflickr.com/1/862/28708214747_f2872a696a.jpg	2	2	San Francisco
\.


--
-- Data for Name: trip_photos_rel; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.trip_photos_rel (relationship_id, trip_id, photo_id) FROM stdin;
1	1	1
2	1	45678
3	3	1
4	3	789012
5	2	54321
7	3	46105882985
\.


--
-- Data for Name: trip_user_likes_rel; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.trip_user_likes_rel (relationship_id, trip_id, user_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	3	4
5	3	5
6	3	1
\.


--
-- Data for Name: trips; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.trips (trip_id, name, user_id, city_name) FROM stdin;
1	taySF	1	San Francisco
2	Ellen Tokyo	5	Tokyo
3	Ellen SF	5	San Francisco
4	Ellen Napa	5	Napa
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (user_id, fname, lname, email, password) FROM stdin;
1	Taylor	Swift	taylor@gmail.com	Ilovecats1
2	Bob	Barker	bob@yahoo.com	Abc123
3	Cindy	Loo	cindy@hotmail.com	Abc123
4	Donald	Duck	duck@gmail.com	Abc123
5	Ellen	Degeneres	ellen@gmail.com	Abc123
\.


--
-- Name: liked_trips_trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.liked_trips_trip_id_seq', 1, false);


--
-- Name: photos_img_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.photos_img_id_seq', 1, false);


--
-- Name: trip_photos_rel_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.trip_photos_rel_relationship_id_seq', 7, true);


--
-- Name: trip_user_likes_rel_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.trip_user_likes_rel_relationship_id_seq', 6, true);


--
-- Name: trips_trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.trips_trip_id_seq', 4, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (name);


--
-- Name: liked_trips liked_trips_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.liked_trips
    ADD CONSTRAINT liked_trips_pkey PRIMARY KEY (trip_id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (img_id);


--
-- Name: trip_photos_rel trip_photos_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_photos_rel
    ADD CONSTRAINT trip_photos_rel_pkey PRIMARY KEY (relationship_id);


--
-- Name: trip_user_likes_rel trip_user_likes_rel_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_user_likes_rel
    ADD CONSTRAINT trip_user_likes_rel_pkey PRIMARY KEY (relationship_id);


--
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (trip_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: photos photos_city_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_city_name_fkey FOREIGN KEY (city_name) REFERENCES public.cities(name);


--
-- Name: trip_photos_rel trip_photos_rel_photo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_photos_rel
    ADD CONSTRAINT trip_photos_rel_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.photos(img_id);


--
-- Name: trip_photos_rel trip_photos_rel_trip_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_photos_rel
    ADD CONSTRAINT trip_photos_rel_trip_id_fkey FOREIGN KEY (trip_id) REFERENCES public.trips(trip_id);


--
-- Name: trip_user_likes_rel trip_user_likes_rel_trip_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_user_likes_rel
    ADD CONSTRAINT trip_user_likes_rel_trip_id_fkey FOREIGN KEY (trip_id) REFERENCES public.trips(trip_id);


--
-- Name: trip_user_likes_rel trip_user_likes_rel_trip_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_user_likes_rel
    ADD CONSTRAINT trip_user_likes_rel_trip_id_fkey1 FOREIGN KEY (trip_id) REFERENCES public.liked_trips(trip_id);


--
-- Name: trip_user_likes_rel trip_user_likes_rel_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trip_user_likes_rel
    ADD CONSTRAINT trip_user_likes_rel_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: trips trips_city_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_city_name_fkey FOREIGN KEY (city_name) REFERENCES public.cities(name);


--
-- Name: trips trips_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

