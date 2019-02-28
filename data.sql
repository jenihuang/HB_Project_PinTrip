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
Dubai   55.171280000000003  25.0656999999999996 AE  Asia/Dubai
Abu Dhabi   54.3666699999999992 24.4666700000000006 AE  Asia/Dubai
Buenos Aires    -58.3772299999999973    -34.6131499999999974    AR  America/Argentina/Buenos_Aires
Vienna  16.3720800000000004 48.2084899999999976 AT  Europe/Vienna
Perth   115.861400000000003 -31.9522399999999998    AU  Australia/Perth
Adelaide    138.598630000000014 -34.9286600000000007    AU  Australia/Adelaide
Sydney  151.20732000000001  -33.8678499999999971    AU  Australia/Sydney
Melbourne   144.96332000000001  -37.8140000000000001    AU  Australia/Melbourne
Gold Coast  153.430880000000002 -28.0002899999999997    AU  Australia/Brisbane
Brisbane    153.028089999999992 -27.4679399999999987    AU  Australia/Brisbane
Dhaka   90.407439999999994  23.7103999999999999 BD  Asia/Dhaka
Brussels    4.34877999999999965 50.8504500000000021 BE  Europe/Brussels
Sao Paulo   -46.6361100000000022    -23.5474999999999994    BR  America/Sao_Paulo
Salvador    -38.5108299999999986    -12.9711099999999995    BR  America/Bahia
Rio de Janeiro  -43.2075000000000031    -22.9027799999999999    BR  America/Sao_Paulo
Calgary -114.085290000000001    51.0501099999999965 CA  America/Edmonton
Edmonton    -113.468710000000002    53.550139999999999  CA  America/Edmonton
Montreal    -73.5878100000000046    45.5088399999999993 CA  America/Toronto
Ottawa  -75.698120000000003 45.4111699999999985 CA  America/Toronto
Toronto -79.4163000000000068    43.7001100000000022 CA  America/Toronto
Vancouver   -123.119339999999994    49.2496599999999987 CA  America/Vancouver
Winnipeg    -97.1470400000000041    49.8843999999999994 CA  America/Winnipeg
Quebec  -71.2145399999999995    46.8122800000000012 CA  America/Toronto
Xian    108.928610000000006 34.2583300000000008 CN  Asia/Shanghai
Wuhan   114.266670000000005 30.5833300000000001 CN  Asia/Shanghai
Tianjin 117.176670000000001 39.1422200000000018 CN  Asia/Shanghai
Tangshan    118.183329999999998 39.6333300000000008 CN  Asia/Shanghai
Shenzhen    114.068299999999994 22.545539999999999  CN  Asia/Shanghai
Shanghai    121.458060000000003 31.2222200000000001 CN  Asia/Shanghai
Qingdao 120.380420000000001 36.0648800000000023 CN  Asia/Shanghai
Nanjing 118.777780000000007 32.0616699999999994 CN  Asia/Shanghai
Guilin  110.286389999999997 25.2819399999999987 CN  Asia/Shanghai
Guangzhou   113.25  23.1166699999999992 CN  Asia/Shanghai
Lijiang 100.22072   26.8687900000000006 CN  Asia/Shanghai
Dalian  121.602220000000003 38.9122199999999978 CN  Asia/Shanghai
Chongqing   106.552779999999998 29.5627800000000001 CN  Asia/Shanghai
Chengdu 104.066670000000002 30.6666699999999999 CN  Asia/Shanghai
Beijing 116.397229999999993 39.9074999999999989 CN  Asia/Shanghai
Havana  -82.3830399999999941    23.1330199999999984 CU  America/Havana
Prague  14.4207599999999996 50.0880399999999995 CZ  Europe/Prague
Munich  11.5754900000000003 48.1374300000000019 DE  Europe/Berlin
Berlin  13.4105299999999996 52.5243699999999976 DE  Europe/Berlin
Copenhagen  12.5655300000000008 55.6759399999999971 DK  Europe/Copenhagen
Cairo   31.2496699999999983 30.0626299999999986 EG  Africa/Cairo
Giza    31.2109300000000012 30.0080799999999996 EG  Africa/Cairo
Alexandria  29.9552699999999987 31.2156400000000005 EG  Africa/Cairo
Madrid  -3.70256000000000007    40.4164999999999992 ES  Europe/Madrid
Barcelona   2.15899000000000019 41.3887900000000002 ES  Europe/Madrid
Paris   2.34880000000000022 48.8534099999999967 FR  Europe/Paris
Wellington  -2.51666999999999996    52.7000000000000028 GB  Europe/London
Nottingham  -1.1504700000000001 52.9536000000000016 GB  Europe/London
London  -0.125739999999999991   51.5085300000000004 GB  Europe/London
Liverpool   -2.97793999999999981    53.4105800000000031 GB  Europe/London
Leicester   -1.13169000000000008    52.6385999999999967 GB  Europe/London
Bristol -2.5966499999999999 51.4552300000000002 GB  Europe/London
Birmingham  -1.89982999999999991    52.48142    GB  Europe/London
Athens  23.7162199999999999 37.9794499999999999 GR  Europe/Athens
Guatemala City  -90.5132700000000057    14.64072    GT  America/Guatemala
Hong Kong   114.174689999999998 22.2783200000000008 HK  Asia/Hong_Kong
Port-au-Prince  -72.3349999999999937    18.5391699999999986 HT  America/Port-au-Prince
Budapest    19.039909999999999  47.4980100000000007 HU  Europe/Budapest
Padang  100.35427   -0.949239999999999973   ID  Asia/Jakarta
Malang  112.630399999999995 -7.97970000000000024    ID  Asia/Jakarta
Jakarta 106.845129999999997 -6.21462000000000003    ID  Asia/Jakarta
Denpasar    115.216669999999993 -8.65000000000000036    ID  Asia/Makassar
Dublin  -6.24889000000000028    53.3330600000000032 IE  Europe/Dublin
Jerusalem   35.2163299999999992 31.7690400000000004 IL  Asia/Jerusalem
Chennai 80.2784699999999987 13.0878399999999999 IN  Asia/Kolkata
Jaipur  75.7878099999999932 26.9196199999999983 IN  Asia/Kolkata
Delhi   77.2314899999999938 28.6519499999999994 IN  Asia/Kolkata
Mumbai  72.8826099999999997 19.0728299999999997 IN  Asia/Kolkata
Baghdad 44.4008800000000008 33.3405800000000028 IQ  Asia/Baghdad
Rome    12.5113299999999992 41.8919300000000021 IT  Europe/Rome
Naples  14.2681100000000001 40.8521599999999978 IT  Europe/Rome
Milan   9.18951000000000029 45.4642699999999991 IT  Europe/Rome
Genoa   8.94439000000000028 44.4047800000000024 IT  Europe/Rome
Kingston    -76.7935800000000057    17.9970199999999991 JM  America/Jamaica
Yokohama    139.650000000000006 35.433329999999998  JP  Asia/Tokyo
Tokyo   139.69171   35.6895000000000024 JP  Asia/Tokyo
Osaka   135.50218000000001  34.6937399999999982 JP  Asia/Tokyo
Kyoto   135.75385   35.0210700000000017 JP  Asia/Tokyo
Kobe    135.182999999999993 34.6912999999999982 JP  Asia/Tokyo
Kawasaki    139.717219999999998 35.5205600000000032 JP  Asia/Tokyo
Hiroshima   132.449999999999989 34.3999999999999986 JP  Asia/Tokyo
Chiba   140.116669999999999 35.6000000000000014 JP  Asia/Tokyo
Sapporo 141.349999999999994 43.066670000000002  JP  Asia/Tokyo
Pyongyang   125.754320000000007 39.033850000000001  KP  Asia/Pyongyang
Seoul   126.978399999999993 37.5660000000000025 KR  Asia/Seoul
Busan   129.040279999999996 35.1027800000000028 KR  Asia/Seoul
Incheon 126.705150000000003 37.4564599999999999 KR  Asia/Seoul
Jeonju  127.148889999999994 35.8219399999999979 KR  Asia/Seoul
Colombo 79.8477800000000002 6.93193999999999999 LK  Asia/Colombo
Casablanca  -7.61137999999999959    33.5883099999999999 MA  Africa/Casablanca
Mandalay    96.0835900000000009 21.974730000000001  MM  Asia/Yangon
Macau   113.546109999999999 22.2005599999999994 MO  Asia/Macau
Cozumel -86.9427199999999942    20.5003799999999998 MX  America/Cancun
Mexico City -99.1276600000000059    19.4284700000000008 MX  America/Mexico_City
Cancun  -86.8465599999999966    21.1742899999999992 MX  America/Cancun
Tijuana -117.003709999999998    32.5026999999999973 MX  America/Tijuana
Lagos   3.39467000000000008 6.45406999999999975 NG  Africa/Lagos
Amsterdam   4.88968999999999987 52.3740299999999976 NL  Europe/Amsterdam
Oslo    10.7460900000000006 59.9127300000000034 NO  Europe/Oslo
Kathmandu   85.3205999999999989 27.7016899999999993 NP  Asia/Kathmandu
Muscat  58.4077800000000025 23.5841299999999983 OM  Asia/Muscat
Lima    -77.0282399999999967    -12.0431799999999996    PE  America/Lima
Manila  120.982200000000006 14.6042000000000005 PH  Asia/Manila
Karachi 67.0104000000000042 24.8608000000000011 PK  Asia/Karachi
Islamabad   73.0432899999999989 33.7214799999999997 PK  Asia/Karachi
Hyderabad   68.373660000000001  25.3924200000000013 PK  Asia/Karachi
Warsaw  21.0117800000000017 52.229770000000002  PL  Europe/Warsaw
Lisbon  -9.13333000000000084    38.7166700000000006 PT  Europe/Lisbon
Saint Petersburg    30.3141299999999987 59.9386300000000034 RU  Europe/Moscow
Moscow  37.6155600000000021 55.7522200000000012 RU  Europe/Moscow
Mecca   39.8256299999999968 21.426639999999999  SA  Asia/Riyadh
Jeddah  39.197969999999998  21.5423800000000014 SA  Asia/Riyadh
Stockholm   18.0649000000000015 59.3325800000000001 SE  Europe/Stockholm
Singapore   103.850070000000002 1.28967000000000009 SG  Asia/Singapore
Dakar   -17.4440600000000003    14.6936999999999998 SN  Africa/Dakar
Bangkok 100.501440000000002 13.7539800000000003 TH  Asia/Bangkok
Tunis   10.1657899999999994 36.8189700000000002 TN  Africa/Tunis
Istanbul    28.9496600000000015 41.0138400000000019 TR  Europe/Istanbul
Taipei  121.531850000000006 25.0477600000000002 TW  Asia/Taipei
Tainan  120.213329999999999 22.990829999999999  TW  Asia/Taipei
Odessa  30.7326200000000007 46.4774699999999967 UA  Europe/Kiev
Washington DC   -77.0363700000000051    38.8951100000000025 US  America/New_York
Jacksonville    -81.6556499999999943    30.332180000000001  US  America/New_York
Columbus    -85.9213799999999992    39.2014399999999981 US  America/Indiana/Indianapolis
Indianapolis    -86.1580399999999997    39.7683800000000005 US  America/Indiana/Indianapolis
Baltimore   -76.6121899999999982    39.290379999999999  US  America/New_York
Charlotte   -80.8431300000000022    35.2270899999999969 US  America/New_York
Oklahoma City   -97.5164299999999997    35.4675599999999989 US  America/Chicago
Philadelphia    -75.1637900000000059    39.9523300000000035 US  America/New_York
Memphis -90.0489800000000002    35.1495299999999986 US  America/Chicago
Nashville   -86.7844400000000036    36.1658899999999974 US  America/Chicago
Austin  -97.7430599999999998    30.2671500000000009 US  America/Chicago
Dallas  -96.8066699999999969    32.783059999999999  US  America/Chicago
Fort Worth  -97.320849999999993 32.7254099999999966 US  America/Chicago
Houston -95.36327   29.7632800000000017 US  America/Chicago
Chicago -87.6500499999999931    41.8500299999999967 US  America/Chicago
Boston  -71.0597700000000003    42.3584299999999985 US  America/New_York
Detroit -83.0457499999999982    42.3314299999999974 US  America/Detroit
Brooklyn    -73.9495799999999974    40.6501000000000019 US  America/New_York
Manhattan   -73.9662500000000023    40.7834300000000027 US  America/New_York
New York City   -74.0059700000000049    40.7142699999999991 US  America/New_York
Queens  -73.836519999999993 40.6814899999999966 US  America/New_York
Phoenix -112.074039999999997    33.4483800000000002 US  America/Phoenix
Tucson  -110.926479999999998    32.2217399999999969 US  America/Phoenix
Los Angeles -118.243679999999998    34.0522300000000016 US  America/Los_Angeles
Monterey    -121.894679999999994    36.6002399999999994 US  America/Los_Angeles
Napa    -122.285529999999994    38.2971399999999988 US  America/Los_Angeles
San Diego   -117.157259999999994    32.7153300000000016 US  America/Los_Angeles
San Francisco   -122.419420000000002    37.7749299999999977 US  America/Los_Angeles
San Jose    -121.894959999999998    37.3393900000000016 US  America/Los_Angeles
Denver  -104.984700000000004    39.7391500000000022 US  America/Denver
Albuquerque -106.651139999999998    35.0844900000000024 US  America/Denver
Las Vegas   -115.137219999999999    36.1749700000000018 US  America/Los_Angeles
Reno    -119.813800000000001    39.5296299999999974 US  America/Los_Angeles
El Paso -106.486930000000001    31.7587200000000003 US  America/Denver
Portland    -122.676209999999998    45.5234499999999969 US  America/Los_Angeles
Seattle -122.332070000000002    47.6062099999999973 US  America/Los_Angeles
Ho Chi Minh City    106.629649999999998 10.8230199999999996 VN  Asia/Ho_Chi_Minh
Hanoi   105.841170000000005 21.0244999999999997 VN  Asia/Ho_Chi_Minh
Da Nang 108.220830000000007 16.0677799999999991 VN  Asia/Ho_Chi_Minh
Queenstown  26.8753300000000017 -31.8975599999999986    ZA  Africa/Johannesburg
Port Elizabeth  25.5700700000000012 -33.9179900000000032    ZA  Africa/Johannesburg
Johannesburg    28.0436300000000003 -26.2022699999999986    ZA  Africa/Johannesburg
Cape Town   18.4232200000000006 -33.9258400000000009    ZA  Africa/Johannesburg
\.


--
-- Data for Name: liked_trips; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.liked_trips (trip_id) FROM stdin;
1
3
4
9
7
11
6
10
\.


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.photos (img_id, url, lon, lat, city_name) FROM stdin;
32145040697 https://c2.staticflickr.com/8/7828/32145040697_453913e569.jpg   -122.347954999999999    38.2704129999999978 Napa
46355060424 https://c2.staticflickr.com/8/7839/46355060424_f717417b42.jpg   -122.329644999999999    38.3332830000000016 Napa
47026473992 https://c2.staticflickr.com/8/7873/47026473992_dbbbc1ec50.jpg   -122.329620000000006    38.3332940000000022 Napa
47078533141 https://c2.staticflickr.com/8/7825/47078533141_19fc310596.jpg   -122.325036999999995    38.3326330000000013 Napa
47026345682 https://c2.staticflickr.com/8/7894/47026345682_8bd24e1dab.jpg   -122.325028000000003    38.332611   Napa
47042307601 https://c2.staticflickr.com/8/7890/47042307601_be029dc16c.jpg   -122.329650000000001    38.3331659999999985 Napa
33167123388 https://c2.staticflickr.com/8/7923/33167123388_2bf08bb4ef.jpg   -122.329620000000006    38.3332249999999988 Napa
47023307271 https://c2.staticflickr.com/8/7846/47023307271_1e64d9b711.jpg   -122.301661999999993    38.2941860000000034 Napa
46219532274 https://c2.staticflickr.com/8/7832/46219532274_70f53d5220.jpg   -122.264328000000006    38.3481359999999967 Napa
33033598568 https://c2.staticflickr.com/5/4853/33033598568_f86a570bae.jpg   -122.340873999999999    38.3289990000000032 Napa
46656122671 https://c2.staticflickr.com/8/7849/46656122671_7d7b6ef9c0.jpg   -122.284614000000005    38.2995220000000032 Napa
31678246887 https://c2.staticflickr.com/8/7879/31678246887_d220ef289d.jpg   -122.330895999999996    38.3211039999999983 Napa
45675605595 https://c2.staticflickr.com/5/4918/45675605595_2eb0f24a53.jpg   -122.329728000000003    38.3333470000000034 Napa
32715731858 https://c2.staticflickr.com/5/4897/32715731858_ca3f9b061f.jpg   -122.329719999999995    38.3333549999999974 Napa
45607404685 https://c2.staticflickr.com/5/4845/45607404685_f7b3f41087.jpg   -122.278653000000006    38.3026020000000003 Napa
45535181035 https://c2.staticflickr.com/8/7891/45535181035_88e342bda5.jpg   -122.283714000000003    38.3040080000000032 Napa
45535180905 https://c2.staticflickr.com/5/4897/45535180905_70847301e0.jpg   -122.283805999999998    38.3040049999999965 Napa
32543878738 https://c2.staticflickr.com/8/7853/32543878738_8369664a32.jpg   -122.284752999999995    38.2980299999999971 Napa
45472232995 https://c2.staticflickr.com/5/4875/45472232995_24acd5a30e.jpg   -122.284172999999996    38.3024410000000017 Napa
31355252607 https://c2.staticflickr.com/5/4892/31355252607_c478682469.jpg   -122.280311999999995    38.302743999999997  Napa
31355251467 https://c2.staticflickr.com/5/4828/31355251467_466be43746.jpg   -122.281625000000005    38.301636000000002  Napa
44350928000 https://c2.staticflickr.com/5/4823/44350928000_b8bbff4dc0.jpg   -122.286248000000001    38.2988659999999967 Napa
46167983291 https://c2.staticflickr.com/5/4828/46167983291_6f720dbc25.jpg   -122.286523000000003    38.299672000000001  Napa
31143740437 https://c2.staticflickr.com/5/4850/31143740437_56fe1a1d73.jpg   -122.284681000000006    38.2981219999999993 Napa
44236029700 https://c2.staticflickr.com/5/4816/44236029700_8a715d8595.jpg   -122.284681000000006    38.2981219999999993 Napa
45913811892 https://c2.staticflickr.com/5/4836/45913811892_8580914634.jpg   -122.274870000000007    38.2853550000000027 Napa
45914044501 https://c2.staticflickr.com/5/4827/45914044501_76df31b54e.jpg   -122.2684   38.3485000000000014 Napa
44802073765 https://c2.staticflickr.com/5/4839/44802073765_0d5e11cb43.jpg   -122.323006000000007    38.2867299999999986 Napa
44802059565 https://c2.staticflickr.com/2/1941/44802059565_d56af5fe72.jpg   -122.323363999999998    38.2860439999999969 Napa
44802040485 https://c2.staticflickr.com/5/4893/44802040485_1c6c907913.jpg   -122.323273 38.2859880000000032 Napa
31844330668 https://c2.staticflickr.com/2/1970/31844330668_92aebf51dd.jpg   -122.323250000000002    38.2875659999999982 Napa
31844320868 https://c2.staticflickr.com/2/1946/31844320868_5015f66337.jpg   -122.323412000000005    38.2858409999999978 Napa
44802028865 https://c2.staticflickr.com/5/4891/44802028865_b1595a9461.jpg   -122.323312000000001    38.2859300000000005 Napa
30738321427 https://c2.staticflickr.com/5/4917/30738321427_3a7668e591.jpg   -122.329588999999999    38.3045219999999986 Napa
43820569200 https://c2.staticflickr.com/2/1958/43820569200_5dcac1676c.jpg   -122.226247999999998    38.2586549999999974 Napa
43688054600 https://c2.staticflickr.com/2/1929/43688054600_20d91c2cc6.jpg   -122.327909000000005    38.3322330000000022 Napa
43268057810 https://c2.staticflickr.com/2/1959/43268057810_7bd1de3df2.jpg   -122.287445000000005    38.3158010000000004 Napa
30144057827 https://c2.staticflickr.com/2/1918/30144057827_e972f3aa35.jpg   -122.287445000000005    38.3158010000000004 Napa
29837202517 https://c2.staticflickr.com/2/1853/29837202517_8394993116.jpg   -122.286649999999995    38.2986000000000004 Napa
44774220311 https://c2.staticflickr.com/2/1893/44774220311_0e8028b773.jpg   -122.285788999999994    38.2328550000000007 Napa
42952208090 https://c2.staticflickr.com/2/1847/42952208090_527ef20b13.jpg   -122.274870000000007    38.2853550000000027 Napa
44031909754 https://c2.staticflickr.com/2/1869/44031909754_393c2b9d82.jpg   -122.274870000000007    38.2853550000000027 Napa
43406887155 https://c2.staticflickr.com/2/1895/43406887155_abf503b951.jpg   -122.324078 38.3447880000000012 Napa
43767518632 https://c2.staticflickr.com/1/929/43767518632_7b29cce22a.jpg    -122.286317999999994    38.2968639999999994 Napa
43815995711 https://c2.staticflickr.com/1/859/43815995711_59357c16b6.jpg    -122.285534999999996    38.299239   Napa
43472061031 https://c2.staticflickr.com/2/1802/43472061031_e690793690.jpg   -122.330100000000002    38.3326830000000029 Napa
29527443078 https://c2.staticflickr.com/1/833/29527443078_1849c2d529.jpg    -122.283356999999995    38.3026369999999972 Napa
43397709701 https://c2.staticflickr.com/1/919/43397709701_c5c9b5a9ea.jpg    -122.283356999999995    38.3026369999999972 Napa
43395941161 https://c2.staticflickr.com/2/1766/43395941161_5979d32ffd.jpg   -122.350800000000007    38.2556110000000018 Napa
43395940871 https://c2.staticflickr.com/1/921/43395940871_6fac6af6ae.jpg    -122.350800000000007    38.2556110000000018 Napa
46061720665 https://c2.staticflickr.com/5/4808/46061720665_98a56f5445.jpg   -122.334051000000002    38.3548490000000015 Napa
46735568322 https://c2.staticflickr.com/8/7905/46735568322_2d0c6b99bc.jpg   -122.279267000000004    38.2945800000000034 Napa
46384795791 https://c2.staticflickr.com/5/4873/46384795791_cda8560da1.jpg   -122.284737000000007    38.2994720000000015 Napa
44554263890 https://c2.staticflickr.com/5/4913/44554263890_95fb335c79.jpg   -122.283775000000006    38.3020739999999975 Napa
32422283348 https://c2.staticflickr.com/5/4804/32422283348_14131feff2.jpg   -122.287559000000002    38.2983660000000015 Napa
44304806560 https://c2.staticflickr.com/5/4814/44304806560_095d7aa1c9.jpg   -122.281886999999998    38.3024150000000034 Napa
44271364790 https://c2.staticflickr.com/5/4901/44271364790_31ccf25dcd.jpg   -122.335350000000005    38.3535469999999989 Napa
32174582478 https://c2.staticflickr.com/5/4902/32174582478_35701f5a4c.jpg   -122.197418999999996    38.3087760000000017 Napa
45001936055 https://c2.staticflickr.com/5/4816/45001936055_fd1b6928de.jpg   -122.268900000000002    38.3481000000000023 Napa
30948857497 https://c2.staticflickr.com/5/4845/30948857497_331b055832.jpg   -122.329767000000004    38.3332860000000011 Napa
44900291665 https://c2.staticflickr.com/5/4821/44900291665_a93dd7a3e2.jpg   -122.264349999999993    38.3486199999999968 Napa
44888907595 https://c2.staticflickr.com/5/4868/44888907595_e42c05ed13.jpg   -122.264349999999993    38.3486199999999968 Napa
45406702212 https://c2.staticflickr.com/2/1902/45406702212_edf4e84dac.jpg   -122.287199999999999    38.2963820000000013 Napa
30422766367 https://c2.staticflickr.com/2/1959/30422766367_cbff92a5c9.jpg   -122.282695000000004    38.2968369999999965 Napa
44009903314 https://c2.staticflickr.com/2/1893/44009903314_1aa3dde611.jpg   -122.329605999999998    38.3331859999999978 Napa
42687789700 https://c2.staticflickr.com/2/1877/42687789700_c7b7194f00.jpg   -122.302698000000007    38.3205939999999998 Napa
30594189158 https://c2.staticflickr.com/2/1854/30594189158_15093c2947.jpg   -122.286562000000004    38.3005250000000004 Napa
42549463560 https://c2.staticflickr.com/2/1841/42549463560_a062ef2186.jpg   -122.362983 38.3334910000000022 Napa
29421467267 https://c2.staticflickr.com/2/1841/29421467267_e42d3b94c6.jpg   -122.362983 38.3334910000000022 Napa
30030364698 https://c2.staticflickr.com/1/938/30030364698_589e54d3b0.jpg    -122.285499999999999    38.2949520000000021 Napa
43790230281 https://c2.staticflickr.com/2/1817/43790230281_e5fdaa6139.jpg   -122.329598000000004    38.333319000000003  Napa
42819952595 https://c2.staticflickr.com/1/931/42819952595_5c77d20b76.jpg    -122.290043999999995    38.296754   Napa
43676108342 https://c2.staticflickr.com/1/848/43676108342_2b26088865.jpg    -122.290603000000004    38.297105000000002  Napa
45225862485 https://c2.staticflickr.com/5/4890/45225862485_327a6015c0.jpg   -122.289545000000004    38.2973050000000015 Napa
45382072164 https://c2.staticflickr.com/5/4840/45382072164_562a78f143.jpg   -122.287308999999993    38.2980879999999999 Napa
32180367868 https://c2.staticflickr.com/5/4884/32180367868_b4b546637c.jpg   -122.289342000000005    38.2970129999999997 Napa
45922036531 https://c2.staticflickr.com/5/4887/45922036531_0b0dfe1561.jpg   -122.275899999999993    38.292900000000003  Napa
45864807092 https://c2.staticflickr.com/5/4893/45864807092_1788963b14.jpg   -122.26885  38.348399999999998  Napa
32016706828 https://c2.staticflickr.com/5/4863/32016706828_dc7eb8c950.jpg   -122.329819999999998    38.3332940000000022 Napa
43985039610 https://c2.staticflickr.com/5/4890/43985039610_f96141f68b.jpg   -122.266999999999996    38.3496000000000024 Napa
45801642021 https://c2.staticflickr.com/5/4826/45801642021_59ebbeea0f.jpg   -122.264349999999993    38.3486199999999968 Napa
44485551015 https://c2.staticflickr.com/2/1922/44485551015_19d42892e6.jpg   -122.309027999999998    38.3224719999999976 Napa
43185045660 https://c2.staticflickr.com/2/1962/43185045660_d85c5aba14.jpg   -122.284548000000001    38.2979569999999967 Napa
42733595850 https://c2.staticflickr.com/2/1850/42733595850_67444deab8.jpg   -122.329736999999994    38.3330190000000002 Napa
42687789630 https://c2.staticflickr.com/2/1857/42687789630_17cb0aa567.jpg   -122.302611999999996    38.320568999999999  Napa
43451607595 https://c2.staticflickr.com/2/1894/43451607595_c8b0593ea0.jpg   -122.362983 38.3334910000000022 Napa
42549454490 https://c2.staticflickr.com/2/1873/42549454490_ccc65907b8.jpg   -122.362983 38.3334910000000022 Napa
43446914915 https://c2.staticflickr.com/2/1891/43446914915_6aac481759.jpg   -122.329674999999995    38.333129999999997  Napa
43165531334 https://c2.staticflickr.com/1/932/43165531334_13a42387d7.jpg    -122.287520000000001    38.3018240000000034 Napa
41914990810 https://c2.staticflickr.com/1/941/41914990810_9559fa601c.jpg    -122.283683999999994    38.296878999999997  Napa
43007853654 https://c2.staticflickr.com/1/936/43007853654_0d00929c1d.jpg    -122.290043999999995    38.296754   Napa
42570305025 https://c2.staticflickr.com/2/1821/42570305025_855421aef2.jpg   -122.329750000000004    38.3331190000000035 Napa
43534601602 https://c2.staticflickr.com/1/839/43534601602_f2e15d11ab.jpg    -122.408015000000006    37.785147000000002  San Francisco
28417789157 https://c2.staticflickr.com/2/1827/28417789157_0128b5c56d.jpg   -122.389174999999994    37.7795020000000008 San Francisco
46156163945 https://c2.staticflickr.com/8/7876/46156163945_faf045f090.jpg   -122.476369000000005    37.7676409999999976 San Francisco
32085574447 https://c2.staticflickr.com/8/7815/32085574447_f59d35c262.jpg   -122.438323999999994    37.7908809999999988 San Francisco
33085946218 https://c2.staticflickr.com/5/4884/33085946218_2297d2986b.jpg   -122.405530999999996    37.7948039999999992 San Francisco
39977854243 https://c2.staticflickr.com/8/7801/39977854243_31e84b8039.jpg   -122.424559000000002    37.7766909999999996 San Francisco
46837838592 https://c2.staticflickr.com/5/4864/46837838592_e0b536f5c4.jpg   -122.439397 37.7646859999999975 San Francisco
39924833643 https://c2.staticflickr.com/8/7802/39924833643_37d31c20f2.jpg   -122.439718999999997    37.7648879999999991 San Francisco
33014416948 https://c2.staticflickr.com/5/4903/33014416948_d807589d05.jpg   -122.438999999999993    37.7648900000000012 San Francisco
31948221957 https://c2.staticflickr.com/8/7818/31948221957_0c8392c252.jpg   -122.439031999999997    37.7646349999999984 San Francisco
33014373378 https://c2.staticflickr.com/8/7824/33014373378_51f94eacb6.jpg   -122.439718999999997    37.7648879999999991 San Francisco
32963113078 https://c2.staticflickr.com/8/7801/32963113078_c4ed13366f.jpg   -122.447057000000001    37.7530489999999972 San Francisco
31874215677 https://c2.staticflickr.com/8/7815/31874215677_b2b658a14d.jpg   -122.427948999999998    37.7606210000000004 San Francisco
46773733991 https://c2.staticflickr.com/8/7905/46773733991_176375236f.jpg   -122.420063999999996    37.8033089999999987 San Francisco
32894360278 https://c2.staticflickr.com/5/4804/32894360278_d7d3f05ccd.jpg   -122.485650000000007    37.7290909999999968 San Francisco
45975621754 https://c2.staticflickr.com/5/4860/45975621754_23c0779314.jpg   -122.434258 37.7757859999999965 San Francisco
32825383928 https://c2.staticflickr.com/8/7825/32825383928_68dd6c645f.jpg   -122.435158999999999    37.776685999999998  San Francisco
46647484092 https://c2.staticflickr.com/5/4896/46647484092_04a5b4d0cc.jpg   -122.435460000000006    37.7760000000000034 San Francisco
46700195591 https://c2.staticflickr.com/5/4827/46700195591_25409f36ef.jpg   -122.434258 37.7757859999999965 San Francisco
31758807977 https://c2.staticflickr.com/8/7909/31758807977_f2174f340f.jpg   -122.434225999999995    37.7768650000000008 San Francisco
32783758038 https://c2.staticflickr.com/5/4908/32783758038_3237f708a3.jpg   -122.450897999999995    37.7134769999999975 San Francisco
39693357113 https://c2.staticflickr.com/8/7834/39693357113_9d284f2c34.jpg   -122.450468999999998    37.7134259999999983 San Francisco
39693356233 https://c2.staticflickr.com/8/7802/39693356233_9fc86615c4.jpg   -122.450125999999997    37.7137060000000019 San Francisco
31711337237 https://c2.staticflickr.com/8/7901/31711337237_c90e6f18ae.jpg   -122.446650000000005    37.7208129999999997 San Francisco
46648069851 https://c2.staticflickr.com/5/4826/46648069851_83c4f38c1c.jpg   -122.409481 37.800733000000001  San Francisco
39674242523 https://c2.staticflickr.com/5/4903/39674242523_11e823b6f4.jpg   -122.446961000000002    37.7226550000000032 San Francisco
46639113691 https://c2.staticflickr.com/5/4838/46639113691_639923ff9c.jpg   -122.446961000000002    37.7226550000000032 San Francisco
32760554098 https://c2.staticflickr.com/8/7821/32760554098_a20b9e619a.jpg   -122.433485000000005    37.7768709999999999 San Francisco
45716729165 https://c2.staticflickr.com/5/4828/45716729165_0681522f1e.jpg   -122.392222000000004    37.7748950000000008 San Francisco
31684426137 https://c2.staticflickr.com/8/7893/31684426137_bf6f4818c9.jpg   -122.451734999999999    37.7257490000000004 San Francisco
32748708348 https://c2.staticflickr.com/5/4814/32748708348_bccff205da.jpg   -122.447186000000002    37.80321    San Francisco
45592770645 https://c2.staticflickr.com/5/4857/45592770645_f1bb3fc63b.jpg   -122.447239999999994    37.7199389999999966 San Francisco
44689010280 https://c2.staticflickr.com/5/4900/44689010280_1e19fca0e7.jpg   -122.427948999999998    37.7606210000000004 San Francisco
44689007710 https://c2.staticflickr.com/8/7807/44689007710_e56b2c9fce.jpg   -122.427948999999998    37.7606210000000004 San Francisco
45592759025 https://c2.staticflickr.com/8/7878/45592759025_330a6ea3d0.jpg   -122.428121000000004    37.758229   San Francisco
45592757325 https://c2.staticflickr.com/5/4906/45592757325_914098c919.jpg   -122.428121000000004    37.758229   San Francisco
31566042607 https://c2.staticflickr.com/5/4857/31566042607_a2e731dd4d.jpg   -122.428121000000004    37.758229   San Francisco
46505917241 https://c2.staticflickr.com/5/4806/46505917241_99929a7cec.jpg   -122.428121000000004    37.758229   San Francisco
31566041447 https://c2.staticflickr.com/5/4809/31566041447_76e94674d0.jpg   -122.428121000000004    37.758229   San Francisco
46505916261 https://c2.staticflickr.com/5/4804/46505916261_f249ae61bc.jpg   -122.428121000000004    37.758229   San Francisco
44688999610 https://c2.staticflickr.com/5/4840/44688999610_88c9f19c61.jpg   -122.428121000000004    37.758229   San Francisco
32633020158 https://c2.staticflickr.com/5/4836/32633020158_c53d3f9eae.jpg   -122.428121000000004    37.758229   San Francisco
45583689845 https://c2.staticflickr.com/5/4845/45583689845_a6d3ec2c97.jpg   -122.388284999999996    37.7765399999999971 San Francisco
46255814532 https://c2.staticflickr.com/5/4872/46255814532_6fe578a5a2.jpg   -122.426640000000006    37.7599510000000009 San Francisco
46281066051 https://c2.staticflickr.com/5/4881/46281066051_beae7213dc.jpg   -122.439707999999996    37.7692890000000006 San Francisco
44340234260 https://c2.staticflickr.com/5/4870/44340234260_089e30ec99.jpg   -122.435406 37.7766409999999979 San Francisco
45112986455 https://c2.staticflickr.com/5/4835/45112986455_026a6beacd.jpg   -122.439021999999994    37.7653370000000024 San Francisco
43923058140 https://c2.staticflickr.com/5/4864/43923058140_2e71efa250.jpg   -122.424570000000003    37.7763810000000007 San Francisco
45736627451 https://c2.staticflickr.com/2/1936/45736627451_4e119db160.jpg   -122.467764000000003    37.7705279999999988 San Francisco
45430716291 https://c2.staticflickr.com/2/1932/45430716291_794b900f2b.jpg   -122.495598000000001    37.7713790000000031 San Francisco
44377734244 https://c2.staticflickr.com/2/1971/44377734244_5010b60b4b.jpg   -122.433367000000004    37.7760249999999971 San Francisco
45010882342 https://c2.staticflickr.com/2/1935/45010882342_7dd57c50f8.jpg   -122.467979 37.7674579999999978 San Francisco
44134378984 https://c2.staticflickr.com/2/1861/44134378984_af3d644ed9.jpg   -122.401934999999995    37.7856469999999973 San Francisco
44632452802 https://c2.staticflickr.com/2/1848/44632452802_ccb1f5beaf.jpg   -122.391492999999997    37.7896179999999973 San Francisco
44663211091 https://c2.staticflickr.com/2/1890/44663211091_0ed27eaca7.jpg   -122.434419000000005    37.7755590000000012 San Francisco
42776773470 https://c2.staticflickr.com/2/1845/42776773470_058a2dcdae.jpg   -122.474287000000004    37.7688449999999989 San Francisco
44522200061 https://c2.staticflickr.com/2/1884/44522200061_501e0673b5.jpg   -122.466417000000007    37.7699989999999985 San Francisco
45699706824 https://c2.staticflickr.com/5/4830/45699706824_7ed4436472.jpg   -122.433593000000002    37.769323   San Francisco
45820978862 https://c2.staticflickr.com/2/1957/45820978862_b293e68bd1.jpg   -122.470071000000004    37.7701800000000034 San Francisco
31646950738 https://c2.staticflickr.com/2/1943/31646950738_508c479bc1.jpg   -122.435095000000004    37.776297999999997  San Francisco
44583667474 https://c2.staticflickr.com/2/1939/44583667474_565d36118c.jpg   -122.402206000000007    37.8019329999999982 San Francisco
30229473727 https://c2.staticflickr.com/2/1961/30229473727_1c13850801.jpg   -122.407464000000004    37.7873799999999989 San Francisco
44103577495 https://c2.staticflickr.com/2/1936/44103577495_3ec013501b.jpg   -122.397737000000006    37.7891550000000009 San Francisco
44103570885 https://c2.staticflickr.com/2/1914/44103570885_3d964cd0fa.jpg   -122.397737000000006    37.7891550000000009 San Francisco
44277346454 https://c2.staticflickr.com/2/1965/44277346454_2a99ae0863.jpg   -122.433209000000005    37.7761020000000016 San Francisco
44069659565 https://c2.staticflickr.com/2/1902/44069659565_36cd4fc2b7.jpg   -122.398295000000005    37.7886969999999991 San Francisco
31107815038 https://c2.staticflickr.com/2/1957/31107815038_284ecfc372.jpg   -122.433785999999998    37.7764329999999973 San Francisco
44872400522 https://c2.staticflickr.com/2/1920/44872400522_5848e6d52c.jpg   -122.397565 37.7893049999999988 San Francisco
44592240072 https://c2.staticflickr.com/2/1898/44592240072_45806f84e8.jpg   -122.443934999999996    37.7713040000000007 San Francisco
42832276480 https://c2.staticflickr.com/2/1863/42832276480_1ffb436a83.jpg   -122.469769999999997    37.770074000000001  San Francisco
30715073768 https://c2.staticflickr.com/2/1884/30715073768_ba83afdff3.jpg   -122.458676999999994    37.7700800000000001 San Francisco
43395940501 https://c2.staticflickr.com/2/1804/43395940501_8e0bf6de30.jpg   -122.350814 38.255588000000003  Napa
15415101296 https://c2.staticflickr.com/4/3930/15415101296_d03d0cc2cb.jpg   -122.305616999999998    38.3556250000000034 Napa
32133422657 https://c2.staticflickr.com/8/7881/32133422657_35c50abdd3.jpg   116.356200999999999 39.9307999999999979 Beijing
33077726458 https://c2.staticflickr.com/5/4886/33077726458_e7b6350546.jpg   116.390181999999996 39.9232089999999999 Beijing
33041829968 https://c2.staticflickr.com/8/7807/33041829968_c4944ae87b.jpg   116.390789999999996 39.9148959999999988 Beijing
33040687088 https://c2.staticflickr.com/8/7897/33040687088_03825f74e7.jpg   116.390789999999996 39.9148959999999988 Beijing
46852521122 https://c2.staticflickr.com/5/4859/46852521122_5c81c05492.jpg   116.391541000000004 39.9011110000000002 Beijing
46818665172 https://c2.staticflickr.com/8/7909/46818665172_f4aef7e7c1.jpg   116.431512999999995 39.949421000000001  Beijing
46815387452 https://c2.staticflickr.com/8/7811/46815387452_a21068161e.jpg   116.382164000000003 39.9046250000000029 Beijing
46718186292 https://c2.staticflickr.com/5/4846/46718186292_3c0b2b6a1c.jpg   116.406250999999997 39.8818559999999991 Beijing
32791177278 https://c2.staticflickr.com/8/7896/32791177278_fe1ef824bc.jpg   116.367851999999999 39.905934000000002  Beijing
31708962807 https://c2.staticflickr.com/8/7883/31708962807_c0c929a3a2.jpg   116.388795000000002 39.9197389999999999 Beijing
32688777898 https://c2.staticflickr.com/8/7813/32688777898_00524f4a56.jpg   116.390898000000007 39.9115269999999995 Beijing
45616192495 https://c2.staticflickr.com/5/4838/45616192495_62027c08cf.jpg   116.391498999999996 39.9134719999999987 Beijing
46424936752 https://c2.staticflickr.com/5/4834/46424936752_dd2f2cba08.jpg   116.391154999999998 39.9073289999999972 Beijing
45656506414 https://c2.staticflickr.com/5/4913/45656506414_bb7693418d.jpg   116.420488000000006 39.9150020000000012 Beijing
46364366161 https://c2.staticflickr.com/5/4857/46364366161_1abcef9cbb.jpg   116.390328999999994 39.9258150000000001 Beijing
32478398828 https://c2.staticflickr.com/5/4836/32478398828_7e1e9e5887.jpg   116.415938999999995 39.9438969999999998 Beijing
45604371224 https://c2.staticflickr.com/5/4876/45604371224_9159762383.jpg   116.390328999999994 39.9258150000000001 Beijing
46309949451 https://c2.staticflickr.com/5/4806/46309949451_4d00dfe50e.jpg   116.389287999999993 39.9400959999999969 Beijing
45338583865 https://c2.staticflickr.com/2/1970/45338583865_d990afbdc0.jpg   116.425555000000003 39.8641659999999973 Beijing
44418212150 https://c2.staticflickr.com/5/4892/44418212150_05d7655f00.jpg   116.390748000000002 39.9173720000000003 Beijing
46224604691 https://c2.staticflickr.com/5/4915/46224604691_0873ab264f.jpg   116.391277000000002 39.9066019999999995 Beijing
44355995920 https://c2.staticflickr.com/5/4891/44355995920_a0a5776528.jpg   116.390748000000002 39.9173720000000003 Beijing
32263755008 https://c2.staticflickr.com/5/4867/32263755008_594fa21937.jpg   116.386413000000005 39.9073479999999989 Beijing
45403284124 https://c2.staticflickr.com/5/4835/45403284124_7cd633c11d.jpg   116.406943999999996 39.8825000000000003 Beijing
44288009150 https://c2.staticflickr.com/5/4809/44288009150_584ed56c54.jpg   116.385446999999999 39.9453280000000035 Beijing
32221601458 https://c2.staticflickr.com/5/4812/32221601458_b751bb1193.jpg   116.448296999999997 39.9366410000000016 Beijing
45159526395 https://c2.staticflickr.com/5/4814/45159526395_e628f2a42c.jpg   116.387163999999999 39.9376279999999966 Beijing
44240764160 https://c2.staticflickr.com/5/4892/44240764160_f24790fc8a.jpg   116.396755999999996 39.9347819999999984 Beijing
45130682475 https://c2.staticflickr.com/5/4900/45130682475_8d1260aee7.jpg   116.392807000000005 39.9058179999999965 Beijing
45987804002 https://c2.staticflickr.com/5/4811/45987804002_456baae5eb.jpg   116.392700000000005 39.9224900000000034 Beijing
45968039202 https://c2.staticflickr.com/5/4896/45968039202_540c05de5b.jpg   116.395318000000003 39.903728000000001  Beijing
32141384868 https://c2.staticflickr.com/5/4814/32141384868_ee1b163fd1.jpg   116.391563000000005 39.9234280000000012 Beijing
32047115768 https://c2.staticflickr.com/5/4873/32047115768_88ff11ecd9.jpg   116.389652999999996 39.9179150000000007 Beijing
30964403757 https://c2.staticflickr.com/5/4909/30964403757_71cc17c6d0.jpg   116.390603999999996 39.9202250000000021 Beijing
45824048042 https://c2.staticflickr.com/5/4890/45824048042_73667c6338.jpg   116.389752999999999 39.9395310000000023 Beijing
45309365465 https://c2.staticflickr.com/5/4889/45309365465_280f0f270e.jpg   -122.428368000000006    37.792110000000001  San Francisco
46057752712 https://c2.staticflickr.com/5/4883/46057752712_874fe02ea3.jpg   -122.427998000000002    37.7609520000000032 San Francisco
30893849637 https://c2.staticflickr.com/5/4823/30893849637_71778c3694.jpg   -122.479704999999996    37.8235540000000015 San Francisco
45740818131 https://c2.staticflickr.com/5/4842/45740818131_e67c63c552.jpg   -122.424570000000003    37.7763810000000007 San Francisco
31557248198 https://c2.staticflickr.com/2/1942/31557248198_972545b16d.jpg   -122.486698000000004    37.766725000000001  San Francisco
43302291240 https://c2.staticflickr.com/2/1929/43302291240_ec1b7fc2de.jpg   -122.471766000000002    37.7566690000000023 San Francisco
44149199675 https://c2.staticflickr.com/2/1965/44149199675_136671e95c.jpg   -122.470220999999995    37.7689590000000024 San Francisco
44147725275 https://c2.staticflickr.com/2/1954/44147725275_36b97ab38d.jpg   -122.469631000000007    37.7687809999999971 San Francisco
44721628062 https://c2.staticflickr.com/2/1886/44721628062_df32f8480c.jpg   -122.411051 37.8012050000000031 San Francisco
43772766175 https://c2.staticflickr.com/2/1897/43772766175_6d22f77bb6.jpg   -122.416372999999993    37.7795950000000005 San Francisco
29703877877 https://c2.staticflickr.com/2/1900/29703877877_97c33be5e7.jpg   -122.470296000000005    37.7701419999999999 San Francisco
44522209781 https://c2.staticflickr.com/2/1866/44522209781_a7a0acd326.jpg   -122.466380999999998    37.7700219999999973 San Francisco
31566049987 https://c2.staticflickr.com/5/4901/31566049987_11b54d7405.jpg   -122.444837000000007    37.7229770000000002 San Francisco
31038061497 https://c2.staticflickr.com/5/4883/31038061497_95963fec80.jpg   -122.427133999999995    37.7600279999999984 San Francisco
45021189664 https://c2.staticflickr.com/5/4833/45021189664_e0e08bef6f.jpg   -122.427660000000003    37.7584919999999968 San Francisco
45362215461 https://c2.staticflickr.com/2/1945/45362215461_f049789911.jpg   -122.430781999999994    37.8049689999999998 San Francisco
45257407022 https://c2.staticflickr.com/2/1968/45257407022_19370c28c9.jpg   -122.402206000000007    37.8019329999999982 San Francisco
31274122278 https://c2.staticflickr.com/2/1978/31274122278_8fb48c5fd7.jpg   -122.410459000000003    37.801046999999997  San Francisco
44103573545 https://c2.staticflickr.com/2/1957/44103573545_29cde7d97e.jpg   -122.397737000000006    37.7891550000000009 San Francisco
30065640687 https://c2.staticflickr.com/2/1935/30065640687_c01f08557c.jpg   -122.433209000000005    37.7760219999999975 San Francisco
44275429484 https://c2.staticflickr.com/2/1908/44275429484_1d2a264f79.jpg   -122.433484000000007    37.7772629999999978 San Francisco
44981071281 https://c2.staticflickr.com/2/1953/44981071281_4499f2fa5d.jpg   -122.398295000000005    37.7886969999999991 San Francisco
44922085861 https://c2.staticflickr.com/2/1940/44922085861_4eb851e0b7.jpg   -122.397565 37.7893049999999988 San Francisco
42832847840 https://c2.staticflickr.com/2/1874/42832847840_560ff4dedf.jpg   -122.426361999999997    37.7918549999999982 San Francisco
42832305910 https://c2.staticflickr.com/2/1864/42832305910_28b3e401b4.jpg   -122.476293999999996    37.7676149999999993 San Francisco
29703875697 https://c2.staticflickr.com/2/1889/29703875697_ef6e36c5f0.jpg   -122.467720999999997    37.7717870000000033 San Francisco
15415100516 https://c2.staticflickr.com/6/5598/15415100516_35623eb54d.jpg   -122.305616999999998    38.3556250000000034 Napa
29302454497 https://c2.staticflickr.com/2/1890/29302454497_ac4f341279.jpg   139.766682000000003 35.6730810000000034 Tokyo
11128812273 https://c2.staticflickr.com/4/3771/11128812273_956e1dc427.jpg   116.39085   39.8959410000000005 Beijing
46980250621 https://c2.staticflickr.com/8/7802/46980250621_9cbf806992.jpg   116.356200999999999 39.9307999999999979 Beijing
46212953444 https://c2.staticflickr.com/8/7834/46212953444_0d19d51b60.jpg   116.405175  39.9160329999999988 Beijing
31974828107 https://c2.staticflickr.com/8/7846/31974828107_22310c9c06.jpg   116.390789999999996 39.9148959999999988 Beijing
46181934714 https://c2.staticflickr.com/5/4874/46181934714_2c812d3ac2.jpg   116.390468999999996 39.9234530000000021 Beijing
46818968092 https://c2.staticflickr.com/8/7864/46818968092_8da1ab94ba.jpg   116.391240999999994 39.9068060000000031 Beijing
46818664912 https://c2.staticflickr.com/8/7846/46818664912_5f32fb7f2e.jpg   116.431512999999995 39.949421000000001  Beijing
31925929747 https://c2.staticflickr.com/5/4858/31925929747_5bc0d4a8b3.jpg   116.389542000000006 39.9411879999999968 Beijing
46698781402 https://c2.staticflickr.com/8/7819/46698781402_2d616f69fe.jpg   116.390190000000004 39.9236590000000007 Beijing
31708983067 https://c2.staticflickr.com/5/4804/31708983067_ac48fd4e07.jpg   116.391638  39.9182020000000009 Beijing
45863174644 https://c2.staticflickr.com/8/7852/45863174644_8902667a14.jpg   116.449755999999994 39.9519900000000021 Beijing
31621422567 https://c2.staticflickr.com/5/4899/31621422567_3b6d9e80de.jpg   116.390662000000006 39.917862999999997  Beijing
45611709005 https://c2.staticflickr.com/5/4911/45611709005_51b322ee6a.jpg   116.391498999999996 39.9134719999999987 Beijing
45518022415 https://c2.staticflickr.com/8/7884/45518022415_3ab6d62b5c.jpg   116.442888999999994 39.9293660000000017 Beijing
45457098775 https://c2.staticflickr.com/5/4856/45457098775_1dbe435fff.jpg   116.438254999999998 39.9431730000000016 Beijing
45641422234 https://c2.staticflickr.com/5/4889/45641422234_c2cd536491.jpg   116.390328999999994 39.9258150000000001 Beijing
32478397718 https://c2.staticflickr.com/5/4841/32478397718_d371720487.jpg   116.415938999999995 39.9438969999999998 Beijing
46327635291 https://c2.staticflickr.com/5/4859/46327635291_ef61a9db26.jpg   116.390328999999994 39.9258150000000001 Beijing
31371119027 https://c2.staticflickr.com/5/4891/31371119027_5754b03e26.jpg   116.389287999999993 39.9400959999999969 Beijing
44421220070 https://c2.staticflickr.com/5/4899/44421220070_36d505a3b8.jpg   116.392776999999995 39.9025000000000034 Beijing
44417984190 https://c2.staticflickr.com/5/4881/44417984190_7001c2b2d1.jpg   116.390511000000004 39.921799   Beijing
44383612000 https://c2.staticflickr.com/5/4895/44383612000_e052a05b37.jpg   116.390748000000002 39.9173720000000003 Beijing
45253825175 https://c2.staticflickr.com/5/4878/45253825175_0875e5811d.jpg   116.448350000000005 39.9374249999999975 Beijing
46077254782 https://c2.staticflickr.com/5/4859/46077254782_c6d0935ee9.jpg   116.392163999999994 39.9220630000000014 Beijing
45403212244 https://c2.staticflickr.com/5/4877/45403212244_2a6dfae171.jpg   116.387221999999994 39.9375 Beijing
32232922588 https://c2.staticflickr.com/5/4884/32232922588_1d09729af5.jpg   116.385446999999999 39.9453280000000035 Beijing
44255315150 https://c2.staticflickr.com/5/4838/44255315150_4057ed0e11.jpg   116.387163999999999 39.9376279999999966 Beijing
45159523425 https://c2.staticflickr.com/5/4859/45159523425_2872c60d14.jpg   116.387163999999999 39.9376279999999966 Beijing
31117691497 https://c2.staticflickr.com/5/4899/31117691497_12ebb17dcc.jpg   116.385726000000005 39.9447189999999992 Beijing
45130651285 https://c2.staticflickr.com/5/4806/45130651285_af88f048fd.jpg   116.404995  39.911596000000003  Beijing
44206208330 https://c2.staticflickr.com/5/4915/44206208330_80a53bdd63.jpg   116.388130000000004 39.9182610000000011 Beijing
46015648351 https://c2.staticflickr.com/5/4807/46015648351_1b6d52afa5.jpg   116.394288000000003 39.9138670000000033 Beijing
45940710191 https://c2.staticflickr.com/5/4846/45940710191_3ec309e111.jpg   116.460398999999995 39.9138499999999965 Beijing
32040996128 https://c2.staticflickr.com/5/4843/32040996128_c4a61e27b0.jpg   116.460398999999995 39.9138499999999965 Beijing
44983867615 https://c2.staticflickr.com/5/4844/44983867615_4765bd7425.jpg   116.395017999999993 39.9037110000000013 Beijing
44960380555 https://c2.staticflickr.com/5/4835/44960380555_bdc26338f2.jpg   116.389752999999999 39.9395310000000023 Beijing
30925085667 https://c2.staticflickr.com/5/4836/30925085667_72bcba302a.jpg   116.395017999999993 39.9037110000000013 Beijing
45828542261 https://c2.staticflickr.com/5/4831/45828542261_37d8ebc5bc.jpg   116.384996999999998 39.9218490000000017 Beijing
44873492535 https://c2.staticflickr.com/2/1924/44873492535_59de57f9b5.jpg   116.395017999999993 39.9037110000000013 Beijing
43960805470 https://c2.staticflickr.com/5/4875/43960805470_a99b1ceb8a.jpg   116.406372000000005 39.8827500000000015 Beijing
46828933301 https://c2.staticflickr.com/5/4888/46828933301_bc74bd2e8d.jpg   116.356200999999999 39.9307999999999979 Beijing
45868870424 https://c2.staticflickr.com/5/4889/45868870424_efdacd24e1.jpg   116.426888000000005 39.9192549999999997 Beijing
46376924152 https://c2.staticflickr.com/8/7830/46376924152_e5aba98460.jpg   116.349333999999999 39.9695060000000026 Beijing
32478400138 https://c2.staticflickr.com/5/4862/32478400138_b48eabb317.jpg   116.415938999999995 39.9438969999999998 Beijing
31387203297 https://c2.staticflickr.com/5/4874/31387203297_f02fa1a42c.jpg   116.385726000000005 39.9255350000000035 Beijing
44483311520 https://c2.staticflickr.com/5/4837/44483311520_db151f61e2.jpg   116.392499999999998 39.9058330000000012 Beijing
46200794681 https://c2.staticflickr.com/5/4857/46200794681_19fe8de639.jpg   116.390748000000002 39.9173720000000003 Beijing
45400072524 https://c2.staticflickr.com/5/4805/45400072524_1ceeb9e5e0.jpg   116.385962000000006 39.9057519999999997 Beijing
31103247947 https://c2.staticflickr.com/5/4890/31103247947_91a07907f5.jpg   116.404995  39.911596000000003  Beijing
32025280908 https://c2.staticflickr.com/5/4856/32025280908_326eda9e08.jpg   116.395017999999993 39.9037110000000013 Beijing
31901940188 https://c2.staticflickr.com/2/1957/31901940188_54f8351b72.jpg   116.389752999999999 39.9395310000000023 Beijing
44047557450 https://c2.staticflickr.com/5/4813/44047557450_9c3a1a7fe0.jpg   116.395017999999993 39.9037110000000013 Beijing
45747842052 https://c2.staticflickr.com/5/4827/45747842052_66a7cda606.jpg   116.367187000000001 39.9202689999999976 Beijing
45736305972 https://c2.staticflickr.com/5/4819/45736305972_b17853298e.jpg   116.395017999999993 39.9037110000000013 Beijing
45725167452 https://c2.staticflickr.com/2/1959/45725167452_48d1873ffd.jpg   116.383525000000006 39.9047049999999999 Beijing
46773842122 https://c2.staticflickr.com/5/4914/46773842122_7abd2e55db.jpg   116.404933  39.9159939999999978 Beijing
46593168361 https://c2.staticflickr.com/8/7819/46593168361_299f583361.jpg   116.428250000000006 39.9202439999999967 Beijing
31458843497 https://c2.staticflickr.com/5/4819/31458843497_4fe9425d87.jpg   116.469196999999994 39.9478000000000009 Beijing
44533557780 https://c2.staticflickr.com/5/4866/44533557780_543aa22980.jpg   116.415938999999995 39.9438969999999998 Beijing
46309950641 https://c2.staticflickr.com/5/4806/46309950641_640486e519.jpg   116.389287999999993 39.9400959999999969 Beijing
46200796161 https://c2.staticflickr.com/5/4868/46200796161_aabd381d07.jpg   116.390748000000002 39.9173720000000003 Beijing
46200793931 https://c2.staticflickr.com/5/4860/46200793931_911148debd.jpg   116.390748000000002 39.9173720000000003 Beijing
46104270281 https://c2.staticflickr.com/5/4851/46104270281_00b04127c9.jpg   116.385446999999999 39.9453280000000035 Beijing
45108272785 https://c2.staticflickr.com/5/4873/45108272785_f2fbefe49d.jpg   116.459003999999993 39.9479359999999986 Beijing
45827526171 https://c2.staticflickr.com/5/4859/45827526171_f538626fc5.jpg   116.390682999999996 39.9185900000000018 Beijing
46345371754 https://c2.staticflickr.com/8/7921/46345371754_ec48b3df4f.jpg   -122.405151000000004    37.7603179999999981 San Francisco
46105882985 https://c2.staticflickr.com/8/7894/46105882985_f067de40a8.jpg   -122.480155999999994    37.8013410000000007 San Francisco
46293749994 https://c2.staticflickr.com/5/4830/46293749994_4b7a09bfa6.jpg   -122.445286999999993    37.7697470000000024 San Francisco
46281922924 https://c2.staticflickr.com/5/4887/46281922924_8d5b6aaa0a.jpg   -122.375528000000003    37.7398760000000024 San Francisco
46877201912 https://c2.staticflickr.com/8/7896/46877201912_d08e7bf7db.jpg   -122.477602000000005    37.8132650000000012 San Francisco
46011623875 https://c2.staticflickr.com/5/4873/46011623875_21ebc5093c.jpg   -122.479920000000007    37.8028329999999997 San Francisco
46870970652 https://c2.staticflickr.com/5/4872/46870970652_ea65b3f11c.jpg   -122.389174999999994    37.7795020000000008 San Francisco
46016991084 https://c2.staticflickr.com/5/4839/46016991084_ff73067310.jpg   -122.37791  37.8210210000000018 San Francisco
39763546813 https://c2.staticflickr.com/5/4878/39763546813_50b7abb9bc.jpg   -122.401663999999997    37.7831049999999991 San Francisco
39735435923 https://c2.staticflickr.com/8/7829/39735435923_0443a08763.jpg   -122.412330999999995    37.7917470000000009 San Francisco
45967406174 https://c2.staticflickr.com/8/7860/45967406174_0036793800.jpg   -122.396653000000001    37.7903439999999975 San Francisco
46629768792 https://c2.staticflickr.com/8/7810/46629768792_84eb862353.jpg   -122.482147999999995    37.797308000000001  San Francisco
31724517057 https://c2.staticflickr.com/5/4816/31724517057_376d662f3b.jpg   -122.479898000000006    37.8021540000000016 San Francisco
46594830221 https://c2.staticflickr.com/8/7851/46594830221_82cc045465.jpg   -122.413647999999995    37.7983819999999966 San Francisco
45647140815 https://c2.staticflickr.com/5/4882/45647140815_928f8f5903.jpg   -122.389712000000003    37.7914049999999975 San Francisco
46461173502 https://c2.staticflickr.com/8/7908/46461173502_91ddd310f0.jpg   -122.427476999999996    37.791561999999999  San Francisco
46503078381 https://c2.staticflickr.com/5/4826/46503078381_4a4150ddd9.jpg   -122.476840999999993    37.8062490000000011 San Francisco
31556116297 https://c2.staticflickr.com/8/7864/31556116297_a59a9db835.jpg   -122.408637999999996    37.7910650000000032 San Francisco
44640382940 https://c2.staticflickr.com/8/7852/44640382940_935dddc6dc.jpg   -122.418486999999999    37.796356000000003  San Francisco
32497832998 https://c2.staticflickr.com/5/4846/32497832998_2fc3da31b6.jpg   -122.466144 37.8053460000000001 San Francisco
32477897558 https://c2.staticflickr.com/5/4840/32477897558_4cab117a57.jpg   -122.406456000000006    37.7955550000000002 San Francisco
45375369315 https://c2.staticflickr.com/5/4842/45375369315_eceb449502.jpg   -122.401273000000003    37.7852049999999977 San Francisco
45339493835 https://c2.staticflickr.com/5/4897/45339493835_a8869351f3.jpg   -122.453722999999997    37.7692300000000003 San Francisco
45526608464 https://c2.staticflickr.com/2/1923/45526608464_f60e82d88b.jpg   -122.449320999999998    37.7698409999999996 San Francisco
45297342305 https://c2.staticflickr.com/5/4912/45297342305_0a14770027.jpg   -122.374787999999995    37.7387220000000028 San Francisco
46112961952 https://c2.staticflickr.com/5/4834/46112961952_8685fe7044.jpg   -122.413763000000003    37.784751   San Francisco
45429699074 https://c2.staticflickr.com/5/4820/45429699074_3e637ccc51.jpg   -122.478075000000004    37.8133100000000013 San Francisco
46084040592 https://c2.staticflickr.com/5/4828/46084040592_8b72ffc977.jpg   -122.448398999999995    37.8033119999999982 San Francisco
32225760818 https://c2.staticflickr.com/5/4880/32225760818_2a24af344a.jpg   -122.410568999999995    37.8104549999999975 San Francisco
46091214321 https://c2.staticflickr.com/5/4831/46091214321_ff74ecab65.jpg   -122.471680000000006    37.7684709999999981 San Francisco
31095232947 https://c2.staticflickr.com/5/4853/31095232947_cd86dddae0.jpg   -122.366574999999997    37.8087469999999968 San Francisco
45964095152 https://c2.staticflickr.com/5/4879/45964095152_12af5c6639.jpg   -122.481505999999996    37.8278049999999979 San Francisco
45018564655 https://c2.staticflickr.com/5/4807/45018564655_05934d28c3.jpg   -122.394867000000005    37.7998130000000003 San Francisco
32052399268 https://c2.staticflickr.com/5/4874/32052399268_d0ec84daa1.jpg   -122.482409000000004    37.7973479999999995 San Francisco
44988714895 https://c2.staticflickr.com/5/4893/44988714895_2279c14ec3.jpg   -122.456801999999996    37.763812999999999  San Francisco
44976988205 https://c2.staticflickr.com/5/4902/44976988205_ceb5af9a49.jpg   -122.479920000000007    37.8028329999999997 San Francisco
30905101687 https://c2.staticflickr.com/5/4890/30905101687_0cef0c1442.jpg   -122.407825000000003    37.7840109999999996 San Francisco
45111336514 https://c2.staticflickr.com/5/4882/45111336514_8df89f39a5.jpg   -122.396000000000001    37.7991049999999973 San Francisco
45082312444 https://c2.staticflickr.com/5/4824/45082312444_9757c092dc.jpg   -122.400869999999998    37.7859049999999996 San Francisco
30866124097 https://c2.staticflickr.com/5/4862/30866124097_03cbffe7c6.jpg   -122.476433 37.8100290000000001 San Francisco
45689441192 https://c2.staticflickr.com/2/1906/45689441192_255ae558bc.jpg   -122.476732999999996    37.8036549999999991 San Francisco
43882373710 https://c2.staticflickr.com/2/1960/43882373710_b8ecc53f5d.jpg   -122.478674999999996    37.8060540000000032 San Francisco
43840300490 https://c2.staticflickr.com/2/1969/43840300490_fda9260052.jpg   -122.474040000000002    37.8072739999999996 San Francisco
43833659580 https://c2.staticflickr.com/2/1929/43833659580_3c9e364ee7.jpg   -122.438395999999997    37.8071100000000015 San Francisco
30694940087 https://c2.staticflickr.com/2/1958/30694940087_c811b46d2b.jpg   -122.468739999999997    37.8067319999999967 San Francisco
45504694451 https://c2.staticflickr.com/2/1919/45504694451_20e92f83cd.jpg   -122.450952000000001    37.8060880000000026 San Francisco
44563005995 https://c2.staticflickr.com/2/1924/44563005995_0bcabb1d8f.jpg   -122.468140000000005    37.8065449999999998 San Francisco
45339983862 https://c2.staticflickr.com/2/1973/45339983862_43bf0a017a.jpg   -122.432755999999998    37.800221999999998  San Francisco
44643957544 https://c2.staticflickr.com/2/1940/44643957544_b575f14139.jpg   -122.467410000000001    37.806317   San Francisco
31452167208 https://c2.staticflickr.com/2/1966/31452167208_8fcb9646f0.jpg   -122.416490999999994    37.8072319999999991 San Francisco
31397061868 https://c2.staticflickr.com/2/1943/31397061868_3e2c04f5af.jpg   -122.438122000000007    37.8069300000000013 San Francisco
44320871465 https://c2.staticflickr.com/2/1902/44320871465_1344e2ecc8.jpg   -122.418807999999999    37.8022980000000004 San Francisco
43376682020 https://c2.staticflickr.com/2/1919/43376682020_ab189f1a24.jpg   -122.438749000000001    37.8069089999999974 San Francisco
45118047212 https://c2.staticflickr.com/2/1933/45118047212_bfdd7fe1ab.jpg   -122.474452999999997    37.7673860000000019 San Francisco
43332772860 https://c2.staticflickr.com/2/1903/43332772860_ca4bb25073.jpg   -122.478311000000005    37.8002889999999994 San Francisco
30191605457 https://c2.staticflickr.com/2/1975/30191605457_620175326f.jpg   -122.448570000000004    37.8066760000000031 San Francisco
44214466235 https://c2.staticflickr.com/2/1954/44214466235_dde3717dd1.jpg   -122.430441999999999    37.8091390000000018 San Francisco
44212009865 https://c2.staticflickr.com/2/1921/44212009865_8fa6b258d9.jpg   -122.500433000000001    37.7852150000000009 San Francisco
44352273954 https://c2.staticflickr.com/2/1921/44352273954_6b0b0bd8d5.jpg   -122.479920000000007    37.8028329999999997 San Francisco
45012805182 https://c2.staticflickr.com/2/1975/45012805182_c421ca9703.jpg   -122.414450000000002    37.7739910000000023 San Francisco
43226753290 https://c2.staticflickr.com/2/1952/43226753290_924a97f3bc.jpg   -122.411795999999995    37.7808530000000005 San Francisco
43185007700 https://c2.staticflickr.com/2/1959/43185007700_3a08763824.jpg   -122.466144 37.806122000000002  San Francisco
44058466545 https://c2.staticflickr.com/2/1950/44058466545_ab64001cc6.jpg   -122.450308000000007    37.7672710000000009 San Francisco
43124677220 https://c2.staticflickr.com/2/1907/43124677220_738a2808c7.jpg   -122.407027999999997    37.7978140000000025 San Francisco
44214428164 https://c2.staticflickr.com/2/1925/44214428164_54ae412e87.jpg   -122.419376999999997    37.8020780000000016 San Francisco
44920827381 https://c2.staticflickr.com/2/1951/44920827381_1a4a6c28e0.jpg   -122.471508 37.8088509999999971 San Francisco
44178081624 https://c2.staticflickr.com/2/1907/44178081624_79ae2b84bd.jpg   -122.469341 37.8076810000000023 San Francisco
43081461130 https://c2.staticflickr.com/2/1964/43081461130_1035b4d2b2.jpg   -122.473375000000004    37.833478999999997  San Francisco
43067908850 https://c2.staticflickr.com/2/1927/43067908850_f098bf5c21.jpg   -122.405966000000006    37.8031459999999981 San Francisco
43067495970 https://c2.staticflickr.com/2/1966/43067495970_c06d14c82e.jpg   -122.456541999999999    37.8042230000000004 San Francisco
29938308457 https://c2.staticflickr.com/2/1927/29938308457_08f4551e6b.jpg   -122.480080999999998    37.8018319999999974 San Francisco
44796849672 https://c2.staticflickr.com/2/1872/44796849672_e7fec39e05.jpg   -122.443924999999993    37.7718509999999981 San Francisco
43818255905 https://c2.staticflickr.com/2/1899/43818255905_99898b4a9b.jpg   -122.459664000000004    37.7719540000000009 San Francisco
44588075782 https://c2.staticflickr.com/2/1842/44588075782_ecfe5aa150.jpg   -122.403476999999995    37.7875700000000023 San Francisco
43912926174 https://c2.staticflickr.com/2/1842/43912926174_5e21af5cc9.jpg   -122.446102999999994    37.7701330000000013 San Francisco
44557616411 https://c2.staticflickr.com/2/1866/44557616411_907649f3b1.jpg   -122.418434000000005    37.7793769999999967 San Francisco
44553360521 https://c2.staticflickr.com/2/1894/44553360521_96b8bd0a52.jpg   -122.395548000000005    37.7613509999999977 San Francisco
43827849504 https://c2.staticflickr.com/2/1877/43827849504_511b9e8ae1.jpg   -122.425461999999996    37.7900509999999983 San Francisco
44483088132 https://c2.staticflickr.com/2/1887/44483088132_ebf01685f6.jpg   -122.398542000000006    37.7611470000000011 San Francisco
42723694030 https://c2.staticflickr.com/2/1894/42723694030_905283b39b.jpg   -122.399023999999997    37.7612069999999989 San Francisco
44452962262 https://c2.staticflickr.com/2/1862/44452962262_0ef92ddded.jpg   -122.404163999999994    37.7927779999999984 San Francisco
29556676807 https://c2.staticflickr.com/2/1883/29556676807_e6f209da13.jpg   -122.397114999999999    37.7899969999999996 San Francisco
29472849717 https://c2.staticflickr.com/2/1868/29472849717_4ef3f013e1.jpg   -122.481808000000001    37.7978749999999977 San Francisco
30525888278 https://c2.staticflickr.com/2/1857/30525888278_01c92b0d55.jpg   -122.472645999999997    37.7665890000000033 San Francisco
44372545361 https://c2.staticflickr.com/2/1891/44372545361_dfa7a69daa.jpg   -122.367112000000006    37.8083079999999967 San Francisco
43628909114 https://c2.staticflickr.com/2/1872/43628909114_ece1df340d.jpg   -122.495799000000005    37.7716980000000007 San Francisco
42512966330 https://c2.staticflickr.com/2/1893/42512966330_978b4b6ea6.jpg   -122.389240000000001    37.789709000000002  San Francisco
44235581361 https://c2.staticflickr.com/2/1814/44235581361_c347c11fc3.jpg   -122.386718000000002    37.752752000000001  San Francisco
44011909332 https://c2.staticflickr.com/2/1819/44011909332_af8bfddeb7.jpg   -122.390602000000001    37.7784079999999989 San Francisco
42221396770 https://c2.staticflickr.com/2/1780/42221396770_e4bd9d8bdb.jpg   -122.454203000000007    37.8048969999999969 San Francisco
44005513141 https://c2.staticflickr.com/2/1797/44005513141_5e9815fb52.jpg   -122.448570000000004    37.8066760000000031 San Francisco
30103017658 https://c2.staticflickr.com/2/1775/30103017658_fe9093d41c.jpg   -122.374669999999995    37.7450430000000026 San Francisco
30062341218 https://c2.staticflickr.com/2/1778/30062341218_743745a6b3.jpg   -122.450995000000006    37.8064559999999972 San Francisco
43919556261 https://c2.staticflickr.com/1/934/43919556261_514eb843be.jpg    -122.476240000000004    37.810848   San Francisco
43161797644 https://c2.staticflickr.com/1/860/43161797644_cba3a08d6d.jpg    -122.447164999999998    37.8030649999999966 San Francisco
46117616392 https://c2.staticflickr.com/5/4899/46117616392_5ce6c7c5a1.jpg   -122.402375000000006    37.7948999999999984 San Francisco
44675692784 https://c2.staticflickr.com/2/1926/44675692784_b8902fb292.jpg   -122.378767999999994    37.8038159999999976 San Francisco
42546045010 https://c2.staticflickr.com/2/1890/42546045010_b2d5b51054.jpg   -122.481744000000006    37.8273379999999975 San Francisco
43125234875 https://c2.staticflickr.com/2/1819/43125234875_6cf22b0c37.jpg   -122.446875000000006    37.7701040000000035 San Francisco
42968540575 https://c2.staticflickr.com/2/1778/42968540575_5f60c5c17b.jpg   -122.460296999999997    37.7726499999999987 San Francisco
31298625528 https://c2.staticflickr.com/2/1930/31298625528_599802fb36.jpg   -122.431811999999994    37.8056300000000007 San Francisco
46325371944 https://c2.staticflickr.com/8/7887/46325371944_bd71bd9c08.jpg   139.763344999999987 35.6545670000000001 Tokyo
33161605998 https://c2.staticflickr.com/8/7897/33161605998_92ba1dd04d.jpg   139.772571999999997 35.6987269999999981 Tokyo
46106288014 https://c2.staticflickr.com/8/7837/46106288014_9f97b8fb3c.jpg   139.770522  35.6659999999999968 Tokyo
31872806687 https://c2.staticflickr.com/8/7869/31872806687_57a0e7ae67.jpg   139.772292999999991 35.6995989999999992 Tokyo
39835638843 https://c2.staticflickr.com/8/7897/39835638843_48ea33ed23.jpg   139.754482999999993 35.6571039999999968 Tokyo
45872535715 https://c2.staticflickr.com/5/4861/45872535715_91e518dd9a.jpg   139.732671000000011 35.633502   Tokyo
46711460642 https://c2.staticflickr.com/5/4803/46711460642_bb4d1b1435.jpg   139.730118000000004 35.6315140000000028 Tokyo
32668308118 https://c2.staticflickr.com/8/7888/32668308118_916c1d1881.jpg   139.732135  35.6667539999999974 Tokyo
46509461211 https://c2.staticflickr.com/8/7809/46509461211_39cfee66de.jpg   139.691001  35.6926630000000031 Tokyo
44643178520 https://c2.staticflickr.com/5/4896/44643178520_a786764da1.jpg   139.766446000000002 35.6834169999999986 Tokyo
31503234107 https://c2.staticflickr.com/5/4886/31503234107_de7f8784f9.jpg   139.748453000000012 35.6518939999999986 Tokyo
31499366367 https://c2.staticflickr.com/5/4907/31499366367_0aed577f01.jpg   139.761400000000009 35.6656630000000021 Tokyo
32556162988 https://c2.staticflickr.com/5/4806/32556162988_28bfd0dd76.jpg   139.702855999999997 35.6948340000000002 Tokyo
46420205971 https://c2.staticflickr.com/8/7843/46420205971_896530ff7c.jpg   139.730214999999987 35.6316970000000026 Tokyo
45695519404 https://c2.staticflickr.com/5/4807/45695519404_d087125c01.jpg   139.767464999999987 35.6828590000000005 Tokyo
46364726672 https://c2.staticflickr.com/8/7801/46364726672_88e8176171.jpg   139.761271999999991 35.6664109999999965 Tokyo
46364726252 https://c2.staticflickr.com/8/7841/46364726252_0449e841d0.jpg   139.761263000000014 35.6655000000000015 Tokyo
46357515342 https://c2.staticflickr.com/5/4843/46357515342_346990aa7d.jpg   139.749108000000007 35.6573569999999975 Tokyo
46344850962 https://c2.staticflickr.com/5/4890/46344850962_c1fcfff92b.jpg   139.700839000000002 35.6596580000000003 Tokyo
31359764947 https://c2.staticflickr.com/5/4811/31359764947_a7938556cc.jpg   139.697037999999992 35.6693270000000027 Tokyo
46287496691 https://c2.staticflickr.com/5/4875/46287496691_ed9bbdc2fb.jpg   139.760599000000013 35.6836529999999996 Tokyo
46287495831 https://c2.staticflickr.com/5/4917/46287495831_ccb8de7044.jpg   139.761563999999993 35.6822579999999974 Tokyo
45362194625 https://c2.staticflickr.com/5/4903/45362194625_4e652f7007.jpg   139.760190999999992 35.7140970000000024 Tokyo
44436526580 https://c2.staticflickr.com/5/4806/44436526580_a986229871.jpg   139.765512000000001 35.6815879999999979 Tokyo
46140669821 https://c2.staticflickr.com/5/4836/46140669821_79010b039f.jpg   139.727658999999989 35.6608329999999967 Tokyo
46057287242 https://c2.staticflickr.com/5/4890/46057287242_ba1db88866.jpg   139.733444999999989 35.6627620000000007 Tokyo
32221548218 https://c2.staticflickr.com/5/4872/32221548218_7e3e5cd3fb.jpg   139.772507999999988 35.6994770000000017 Tokyo
31148644197 https://c2.staticflickr.com/5/4833/31148644197_384fc25923.jpg   139.768731000000002 35.7133809999999983 Tokyo
45161530055 https://c2.staticflickr.com/5/4873/45161530055_a87cfbfea3.jpg   139.745749999999987 35.7324229999999972 Tokyo
32201167708 https://c2.staticflickr.com/5/4838/32201167708_b7d4450ef8.jpg   139.770211999999987 35.7139560000000031 Tokyo
32200376068 https://c2.staticflickr.com/5/4835/32200376068_8d8afe2f96.jpg   139.763227000000001 35.6725410000000025 Tokyo
44246853260 https://c2.staticflickr.com/5/4866/44246853260_a578947a56.jpg   139.770897999999988 35.7102280000000007 Tokyo
45149910655 https://c2.staticflickr.com/5/4905/45149910655_0f55f12dcc.jpg   139.766027000000008 35.6823630000000023 Tokyo
46005945312 https://c2.staticflickr.com/5/4850/46005945312_f497cda804.jpg   139.771412999999995 35.7123530000000002 Tokyo
45989869992 https://c2.staticflickr.com/5/4813/45989869992_3ffceb7bca.jpg   139.713533000000012 35.680137000000002  Tokyo
32168531538 https://c2.staticflickr.com/5/4870/32168531538_b399b958fb.jpg   139.771564000000012 35.7153059999999982 Tokyo
45279209244 https://c2.staticflickr.com/5/4845/45279209244_2b806e8a6e.jpg   139.736491000000001 35.637757999999998  Tokyo
45085508155 https://c2.staticflickr.com/5/4858/45085508155_ccbc9af2fd.jpg   139.761714000000012 35.6825720000000004 Tokyo
32111925428 https://c2.staticflickr.com/5/4836/32111925428_d6c1372894.jpg   139.759204000000011 35.6838880000000032 Tokyo
45951550171 https://c2.staticflickr.com/5/4904/45951550171_167da21365.jpg   139.739077000000009 35.6745889999999974 Tokyo
45211186854 https://c2.staticflickr.com/5/4834/45211186854_f21f085abb.jpg   139.739612999999991 35.6746759999999981 Tokyo
45198501774 https://c2.staticflickr.com/5/4803/45198501774_f57c7f1756.jpg   139.701439999999991 35.6937259999999981 Tokyo
45862025082 https://c2.staticflickr.com/5/4806/45862025082_2c011ec147.jpg   139.701460999999995 35.6937089999999984 Tokyo
45179930904 https://c2.staticflickr.com/5/4849/45179930904_ebba754ca1.jpg   139.70120399999999  35.6938999999999993 Tokyo
30956228737 https://c2.staticflickr.com/5/4876/30956228737_4de091db10.jpg   139.701279  35.6963399999999993 Tokyo
30950293747 https://c2.staticflickr.com/5/4901/30950293747_cf96714c54.jpg   139.700945999999988 35.6940400000000011 Tokyo
45830579132 https://c2.staticflickr.com/2/1934/45830579132_961179ccf5.jpg   139.701492999999999 35.6938570000000013 Tokyo
44055431240 https://c2.staticflickr.com/2/1903/44055431240_dae2e0af7e.jpg   139.765083000000004 35.6803060000000016 Tokyo
44952654745 https://c2.staticflickr.com/2/1936/44952654745_344fbb1ed1.jpg   139.701439999999991 35.6935870000000008 Tokyo
31974566378 https://c2.staticflickr.com/5/4822/31974566378_06cf898a0c.jpg   139.705693999999994 35.6687749999999966 Tokyo
43992365950 https://c2.staticflickr.com/5/4905/43992365950_66f020ef54.jpg   139.763045000000005 35.6725410000000025 Tokyo
45750470702 https://c2.staticflickr.com/5/4903/45750470702_10a9fe8a63.jpg   139.729399000000001 35.6609570000000033 Tokyo
45734965412 https://c2.staticflickr.com/2/1932/45734965412_31544260b8.jpg   139.729527999999988 35.6604170000000025 Tokyo
30828638667 https://c2.staticflickr.com/5/4895/30828638667_91327b8ee3.jpg   139.729496000000012 35.6604600000000005 Tokyo
44839131825 https://c2.staticflickr.com/2/1918/44839131825_c85572e723.jpg   139.699250000000006 35.6601939999999971 Tokyo
44823129825 https://c2.staticflickr.com/5/4861/44823129825_9dfc2196f0.jpg   139.700624000000005 35.6595450000000014 Tokyo
43734157920 https://c2.staticflickr.com/2/1914/43734157920_429cdf874c.jpg   139.767358000000002 35.7015069999999994 Tokyo
45539998631 https://c2.staticflickr.com/2/1960/45539998631_2bb364fe32.jpg   139.766177999999996 35.7005740000000031 Tokyo
45536644421 https://c2.staticflickr.com/2/1928/45536644421_dde2b1d64b.jpg   139.766177999999996 35.7005740000000031 Tokyo
30584337207 https://c2.staticflickr.com/2/1938/30584337207_825979c51e.jpg   139.745513999999986 35.6570600000000013 Tokyo
44791976804 https://c2.staticflickr.com/2/1975/44791976804_18fb4c9c20.jpg   139.700893000000008 35.659353000000003  Tokyo
30574679257 https://c2.staticflickr.com/2/1933/30574679257_a2272239ce.jpg   139.749632999999989 35.7086159999999992 Tokyo
30558181547 https://c2.staticflickr.com/2/1956/30558181547_1df6a4a632.jpg   139.701375000000013 35.6585859999999997 Tokyo
30524128837 https://c2.staticflickr.com/2/1973/30524128837_632c3606f5.jpg   139.770769999999999 35.7166739999999976 Tokyo
43647134230 https://c2.staticflickr.com/2/1925/43647134230_0c3cd5873b.jpg   139.770769999999999 35.7166739999999976 Tokyo
31589255788 https://c2.staticflickr.com/2/1978/31589255788_1eb8130462.jpg   139.768731000000002 35.7145829999999975 Tokyo
44738932404 https://c2.staticflickr.com/2/1943/44738932404_71ea1e18da.jpg   139.768731000000002 35.7145829999999975 Tokyo
43542253130 https://c2.staticflickr.com/2/1913/43542253130_a7e6ba67bd.jpg   139.768731000000002 35.7145829999999975 Tokyo
45307504632 https://c2.staticflickr.com/2/1915/45307504632_fb3030bfae.jpg   139.768731000000002 35.7145829999999975 Tokyo
30417903147 https://c2.staticflickr.com/2/1962/30417903147_478dc5f94f.jpg   139.770769999999999 35.7166739999999976 Tokyo
43518189310 https://c2.staticflickr.com/2/1949/43518189310_6ea14071cd.jpg   139.769697000000008 35.7142869999999988 Tokyo
45333713631 https://c2.staticflickr.com/2/1922/45333713631_e4f09e2bf7.jpg   139.769697000000008 35.7142869999999988 Tokyo
31459394218 https://c2.staticflickr.com/2/1912/31459394218_187efe8168.jpg   139.771049000000005 35.7167439999999985 Tokyo
45257511172 https://c2.staticflickr.com/2/1944/45257511172_5c28921faa.jpg   139.767013999999989 35.6786850000000015 Tokyo
45234638002 https://c2.staticflickr.com/2/1930/45234638002_0733540465.jpg   139.771027000000004 35.7171269999999978 Tokyo
45234503072 https://c2.staticflickr.com/2/1956/45234503072_6d6a050884.jpg   139.771027000000004 35.7171269999999978 Tokyo
43452458470 https://c2.staticflickr.com/2/1960/43452458470_a0dd52c154.jpg   139.702104999999989 35.6597709999999992 Tokyo
43450248750 https://c2.staticflickr.com/2/1916/43450248750_53acedc074.jpg   139.765490999999997 35.6815789999999993 Tokyo
45214585042 https://c2.staticflickr.com/2/1942/45214585042_30a5897d87.jpg   139.765490999999997 35.6815789999999993 Tokyo
44542373544 https://c2.staticflickr.com/2/1960/44542373544_d6cdb8a22d.jpg   139.765490999999997 35.6815789999999993 Tokyo
45213087982 https://c2.staticflickr.com/2/1929/45213087982_686cc1afc6.jpg   139.769418000000002 35.7143739999999994 Tokyo
31367080588 https://c2.staticflickr.com/2/1905/31367080588_4689b0d1ed.jpg   139.769418000000002 35.7143739999999994 Tokyo
44518776824 https://c2.staticflickr.com/2/1940/44518776824_6a00d7ce71.jpg   139.771327000000014 35.7172490000000025 Tokyo
31366272738 https://c2.staticflickr.com/2/1923/31366272738_bfb74c2aa6.jpg   139.765962999999999 35.6813870000000009 Tokyo
31356276538 https://c2.staticflickr.com/2/1925/31356276538_48e9a7f3c6.jpg   139.769396  35.7149659999999969 Tokyo
43416627550 https://c2.staticflickr.com/2/1925/43416627550_d5bfc94b19.jpg   139.770834000000008 35.7171269999999978 Tokyo
44504920574 https://c2.staticflickr.com/2/1950/44504920574_01a9cc6753.jpg   139.75392500000001  35.6558139999999995 Tokyo
43409171750 https://c2.staticflickr.com/2/1938/43409171750_b74eeb821c.jpg   139.767605000000003 35.7019420000000025 Tokyo
44484810414 https://c2.staticflickr.com/2/1953/44484810414_f30c70a338.jpg   139.700516999999991 35.6891079999999974 Tokyo
44482027784 https://c2.staticflickr.com/2/1944/44482027784_14d8b667d1.jpg   139.774492000000009 35.7086249999999978 Tokyo
45183586301 https://c2.staticflickr.com/2/1926/45183586301_72fa62cce1.jpg   139.755728000000005 35.6528319999999965 Tokyo
45128871242 https://c2.staticflickr.com/2/1907/45128871242_dbcbe08875.jpg   139.748324999999994 35.6578620000000015 Tokyo
30969673658 https://c2.staticflickr.com/2/1980/30969673658_e79bde3221.jpg   139.702362999999991 35.6907459999999972 Tokyo
43770905295 https://c2.staticflickr.com/2/1884/43770905295_5c434f93df.jpg   139.730739999999997 35.6669020000000003 Tokyo
44673364151 https://c2.staticflickr.com/2/1900/44673364151_b555a00fe9.jpg   139.729527999999988 35.6611309999999975 Tokyo
44583172952 https://c2.staticflickr.com/2/1870/44583172952_08feb7d640.jpg   139.765834000000012 35.6825019999999995 Tokyo
44621933231 https://c2.staticflickr.com/2/1851/44621933231_0dfd8ef26f.jpg   139.745407  35.658647000000002  Tokyo
42804807320 https://c2.staticflickr.com/2/1879/42804807320_6ab47d72f7.jpg   139.745407  35.6586560000000006 Tokyo
29630912707 https://c2.staticflickr.com/2/1856/29630912707_36eb9076f8.jpg   139.774263999999988 35.6838559999999987 Tokyo
43615319865 https://c2.staticflickr.com/2/1881/43615319865_1ea05ba143.jpg   139.768066000000005 35.7085369999999998 Tokyo
40113185893 https://c2.staticflickr.com/8/7923/40113185893_b5eb18d2fe.jpg   -79.3739029999999985    43.6485830000000021 Toronto
40108077633 https://c2.staticflickr.com/8/7903/40108077633_f18a4e0b8d.jpg   -79.3884510000000034    43.6375590000000031 Toronto
46146178175 https://c2.staticflickr.com/8/7833/46146178175_dfbf1211a0.jpg   -79.3919700000000006    43.6700050000000033 Toronto
33118664238 https://c2.staticflickr.com/5/4832/33118664238_27499f5c23.jpg   -79.422183000000004 43.6434509999999989 Toronto
33096370028 https://c2.staticflickr.com/8/7898/33096370028_425c659704.jpg   -79.4029989999999941    43.637317000000003  Toronto
33096369768 https://c2.staticflickr.com/8/7914/33096369768_a767b2d2e6.jpg   -79.4143720000000002    43.6379069999999984 Toronto
32011332487 https://c2.staticflickr.com/5/4897/32011332487_5af54e635c.jpg   -79.4370310000000046    43.755983999999998  Toronto
33074802278 https://c2.staticflickr.com/5/4883/33074802278_7e773bf1e6.jpg   -79.4688320000000061    43.6458889999999968 Toronto
46947614011 https://c2.staticflickr.com/8/7869/46947614011_84aa264fb2.jpg   -79.3895129999999938    43.6381370000000004 Toronto
39972446873 https://c2.staticflickr.com/8/7901/39972446873_b4c791ba70.jpg   -79.3898030000000006    43.6384940000000014 Toronto
33056732288 https://c2.staticflickr.com/8/7805/33056732288_c6320b783e.jpg   -79.4440689999999989    43.6566320000000019 Toronto
46001766015 https://c2.staticflickr.com/8/7835/46001766015_38fecf6d70.jpg   -79.3864229999999935    43.6475190000000026 Toronto
46187952934 https://c2.staticflickr.com/5/4816/46187952934_4e5f24cd5a.jpg   -79.4440689999999989    43.6566320000000019 Toronto
46818742682 https://c2.staticflickr.com/8/7925/46818742682_bd69ed010e.jpg   -79.3600760000000065    43.6506759999999971 Toronto
31918161077 https://c2.staticflickr.com/5/4909/31918161077_8c674d3ab5.jpg   -79.3600760000000065    43.6506759999999971 Toronto
31907431667 https://c2.staticflickr.com/5/4829/31907431667_b947a07a71.jpg   -79.3600760000000065    43.6506759999999971 Toronto
39876117623 https://c2.staticflickr.com/8/7898/39876117623_be814740fe.jpg   -79.3875069999999994    43.6499570000000006 Toronto
46768323552 https://c2.staticflickr.com/5/4841/46768323552_119669e651.jpg   -79.4081170000000043    43.6777110000000022 Toronto
31865348857 https://c2.staticflickr.com/5/4852/31865348857_437d72caae.jpg   -79.3966259999999977    43.6486519999999985 Toronto
32928466468 https://c2.staticflickr.com/8/7876/32928466468_33858ed63a.jpg   -79.3600409999999954    43.7336310000000026 Toronto
31851547267 https://c2.staticflickr.com/5/4833/31851547267_e2da876bf5.jpg   -79.4385549999999938    43.7556969999999978 Toronto
46740106372 https://c2.staticflickr.com/8/7802/46740106372_637e412d99.jpg   -79.3747610000000066    43.6625310000000013 Toronto
32912831278 https://c2.staticflickr.com/5/4826/32912831278_450c0a7968.jpg   -79.3886009999999942    43.6420999999999992 Toronto
46062456224 https://c2.staticflickr.com/5/4851/46062456224_da5908d4b1.jpg   -79.3865200000000044    43.650782999999997  Toronto
46769425361 https://c2.staticflickr.com/8/7832/46769425361_f6061d46ab.jpg   -79.4767279999999943    43.7512910000000019 Toronto
46763329171 https://c2.staticflickr.com/8/7834/46763329171_66a87a0634.jpg   -79.3541830000000061    43.665737   Toronto
39794155443 https://c2.staticflickr.com/8/7894/39794155443_4c159c86f9.jpg   -79.3865200000000044    43.650782999999997  Toronto
45803100255 https://c2.staticflickr.com/8/7911/45803100255_712e3e7972.jpg   -79.3600409999999954    43.7336310000000026 Toronto
31707518407 https://c2.staticflickr.com/8/7927/31707518407_e536ba289f.jpg   -79.3901249999999976    43.6578739999999996 Toronto
46569150912 https://c2.staticflickr.com/5/4886/46569150912_b799b69a67.jpg   -79.3772069999999985    43.6471930000000015 Toronto
32730458358 https://c2.staticflickr.com/8/7865/32730458358_b5b8b01f81.jpg   -79.4370530000000059    43.7558519999999973 Toronto
44776140830 https://c2.staticflickr.com/5/4838/44776140830_5a45a046e0.jpg   -79.3932149999999979    43.6371859999999998 Toronto
46547611031 https://c2.staticflickr.com/8/7813/46547611031_367242fe9d.jpg   -79.3796320000000009    43.6495370000000023 Toronto
45588192485 https://c2.staticflickr.com/8/7919/45588192485_4260906a58.jpg   -79.3344210000000061    43.6778350000000017 Toronto
46423453052 https://c2.staticflickr.com/8/7919/46423453052_e569c5ff0f.jpg   -79.3600409999999954    43.7336310000000026 Toronto
46449295901 https://c2.staticflickr.com/5/4811/46449295901_246ebabc06.jpg   -79.3741600000000034    43.6622830000000022 Toronto
32550090368 https://c2.staticflickr.com/5/4851/32550090368_a04e2d344d.jpg   -79.3802220000000034    43.6621280000000027 Toronto
46420572241 https://c2.staticflickr.com/5/4807/46420572241_dabc94232d.jpg   -79.3746749999999963    43.6621900000000025 Toronto
31481196157 https://c2.staticflickr.com/5/4840/31481196157_791ea20046.jpg   -79.3740959999999944    43.6625939999999986 Toronto
32535886908 https://c2.staticflickr.com/5/4912/32535886908_85a91f356c.jpg   -79.3740739999999931    43.6635869999999997 Toronto
45481890105 https://c2.staticflickr.com/5/4910/45481890105_24f26cbd4b.jpg   -79.3747610000000066    43.6625310000000013 Toronto
44577412650 https://c2.staticflickr.com/5/4821/44577412650_22b757c186.jpg   -79.3769709999999975    43.6659459999999982 Toronto
32522306808 https://c2.staticflickr.com/5/4818/32522306808_024b4200c9.jpg   -79.3747610000000066    43.6625310000000013 Toronto
45662154734 https://c2.staticflickr.com/5/4882/45662154734_e2fd40667d.jpg   -79.3747610000000066    43.6625310000000013 Toronto
46385432551 https://c2.staticflickr.com/5/4821/46385432551_b52f3c1949.jpg   -79.3747610000000066    43.6625310000000013 Toronto
44568430210 https://c2.staticflickr.com/5/4874/44568430210_f345cd04ed.jpg   -79.3769709999999975    43.6659459999999982 Toronto
44563625980 https://c2.staticflickr.com/5/4826/44563625980_61e5acd3bb.jpg   -79.3690100000000029    43.6950119999999984 Toronto
45460498425 https://c2.staticflickr.com/5/4817/45460498425_aec3cd44bf.jpg   -79.4369990000000001    43.7559990000000028 Toronto
46345659121 https://c2.staticflickr.com/5/4902/46345659121_4fdedfeb7c.jpg   -79.4440689999999989    43.6566320000000019 Toronto
44521062000 https://c2.staticflickr.com/5/4822/44521062000_1460590772.jpg   -79.3886119999999949    43.656213000000001  Toronto
31391664487 https://c2.staticflickr.com/5/4895/31391664487_c0c9050c32.jpg   -79.3747610000000066    43.6625310000000013 Toronto
46320117341 https://c2.staticflickr.com/5/4849/46320117341_2345f3dcf1.jpg   -79.3800180000000069    43.6523630000000011 Toronto
45553575454 https://c2.staticflickr.com/5/4856/45553575454_4ec17d5fc2.jpg   -79.4463870000000014    43.6632140000000035 Toronto
46242759331 https://c2.staticflickr.com/5/4834/46242759331_8cab5be7e4.jpg   -79.4188139999999976    43.6342730000000003 Toronto
45510677884 https://c2.staticflickr.com/5/4849/45510677884_bdfc280987.jpg   -79.4625659999999954    43.6443360000000027 Toronto
46204588051 https://c2.staticflickr.com/5/4898/46204588051_065d0b2005.jpg   -79.3746540000000067    43.6620500000000007 Toronto
45291746705 https://c2.staticflickr.com/5/4897/45291746705_15ef9e1311.jpg   -79.3595689999999934    43.7341109999999986 Toronto
46122941581 https://c2.staticflickr.com/5/4866/46122941581_2991a300d0.jpg   -79.4370530000000059    43.7560149999999979 Toronto
46121012721 https://c2.staticflickr.com/5/4877/46121012721_40ea5837c5.jpg   -79.4440689999999989    43.6566320000000019 Toronto
44281645550 https://c2.staticflickr.com/5/4869/44281645550_c49198351d.jpg   -79.4438980000000043    43.6569739999999982 Toronto
44274642240 https://c2.staticflickr.com/5/4855/44274642240_b6bd3cb9a3.jpg   -79.333090999999996 43.7258679999999984 Toronto
45169921095 https://c2.staticflickr.com/5/4849/45169921095_3bf070497b.jpg   -79.3746540000000067    43.6620500000000007 Toronto
45143895325 https://c2.staticflickr.com/5/4845/45143895325_6810bd1200.jpg   -79.3695220000000035    43.6499900000000025 Toronto
45976165932 https://c2.staticflickr.com/5/4859/45976165932_58cea7190f.jpg   -79.3695220000000035    43.6499900000000025 Toronto
32141115358 https://c2.staticflickr.com/5/4870/32141115358_2bacec0144.jpg   -79.3695220000000035    43.6499900000000025 Toronto
45268608584 https://c2.staticflickr.com/5/4903/45268608584_64b241d423.jpg   -79.3608569999999958    43.6845909999999975 Toronto
31048162687 https://c2.staticflickr.com/5/4851/31048162687_1daf09f9ae.jpg   -79.4675440000000037    43.6432179999999974 Toronto
44161921010 https://c2.staticflickr.com/5/4887/44161921010_d91003bd19.jpg   -79.3988800000000055    43.6479380000000035 Toronto
44156222010 https://c2.staticflickr.com/5/4870/44156222010_0ef60a1f37.jpg   -79.3595689999999934    43.7341109999999986 Toronto
32090203158 https://c2.staticflickr.com/5/4831/32090203158_3c5a24f115.jpg   -79.4369990000000001    43.7561699999999973 Toronto
45893436992 https://c2.staticflickr.com/5/4839/45893436992_ed6994f6bd.jpg   -79.4595620000000054    43.646571999999999  Toronto
45930226991 https://c2.staticflickr.com/5/4880/45930226991_75eaef3ff6.jpg   -79.3595689999999934    43.7341109999999986 Toronto
45190121884 https://c2.staticflickr.com/5/4893/45190121884_510a1cbc76.jpg   -79.4595620000000054    43.646571999999999  Toronto
30968624957 https://c2.staticflickr.com/5/4872/30968624957_deeb880478.jpg   -79.3929140000000046    43.6536830000000009 Toronto
32024926458 https://c2.staticflickr.com/5/4835/32024926458_a55a44defa.jpg   -79.372240000000005 43.6500580000000014 Toronto
45166619644 https://c2.staticflickr.com/5/4872/45166619644_0bf998aff6.jpg   -79.3945989999999995    43.6679249999999968 Toronto
45838344302 https://c2.staticflickr.com/5/4908/45838344302_47e7cb1f95.jpg   -79.3722829999999959    43.6500970000000024 Toronto
32006380088 https://c2.staticflickr.com/5/4824/32006380088_68fa851589.jpg   -79.3476600000000047    43.6788590000000028 Toronto
45859160281 https://c2.staticflickr.com/5/4831/45859160281_3f4fa60e40.jpg   -79.4450750000000028    43.6548950000000033 Toronto
45126856594 https://c2.staticflickr.com/2/1962/45126856594_a3169d195a.jpg   -79.4675440000000037    43.6439629999999994 Toronto
44930262445 https://c2.staticflickr.com/5/4809/44930262445_f70c8df296.jpg   -79.380866999999995 43.6500849999999971 Toronto
44924419505 https://c2.staticflickr.com/5/4836/44924419505_92d10762f7.jpg   -79.404469000000006 43.6384430000000023 Toronto
31966250628 https://c2.staticflickr.com/5/4862/31966250628_30f022b8ba.jpg   -79.333090999999996 43.7258679999999984 Toronto
45111036284 https://c2.staticflickr.com/5/4866/45111036284_c53402f80e.jpg   -79.333090999999996 43.7258679999999984 Toronto
45102277634 https://c2.staticflickr.com/5/4869/45102277634_2144e64024.jpg   -79.4123759999999947    43.6346610000000013 Toronto
45817160071 https://c2.staticflickr.com/5/4822/45817160071_0046ddf751.jpg   -79.4675869999999946    43.644243000000003  Toronto
43976749390 https://c2.staticflickr.com/5/4840/43976749390_0a8d940ae9.jpg   -79.3921420000000069    43.6545330000000007 Toronto
30850380407 https://c2.staticflickr.com/5/4866/30850380407_4e8e64faa0.jpg   -79.4690030000000007    43.6455160000000006 Toronto
45735634742 https://c2.staticflickr.com/5/4915/45735634742_c4f36a6227.jpg   -79.3815519999999992    43.6477360000000019 Toronto
43957104330 https://c2.staticflickr.com/5/4816/43957104330_1b48bd9183.jpg   -79.3901249999999976    43.6381590000000017 Toronto
45773618371 https://c2.staticflickr.com/5/4830/45773618371_7d4559fe2c.jpg   -79.3925389999999993    43.6540749999999989 Toronto
45720586112 https://c2.staticflickr.com/2/1952/45720586112_494118e3da.jpg   -79.3746540000000067    43.6620500000000007 Toronto
44855911375 https://c2.staticflickr.com/2/1962/44855911375_36be9aae16.jpg   -79.4429540000000003    43.6531239999999983 Toronto
45713079752 https://c2.staticflickr.com/5/4875/45713079752_e62ef116cb.jpg   -79.3925389999999993    43.6540749999999989 Toronto
45030177364 https://c2.staticflickr.com/2/1911/45030177364_8df7be5a56.jpg   -79.4370849999999962    43.7561159999999987 Toronto
31883334108 https://c2.staticflickr.com/2/1905/31883334108_e00ffa39b1.jpg   -79.3595689999999934    43.7341109999999986 Toronto
45700750602 https://c2.staticflickr.com/2/1929/45700750602_5d528fd546.jpg   -79.4605059999999952    43.649242000000001  Toronto
45738064551 https://c2.staticflickr.com/2/1940/45738064551_dfc2f23e73.jpg   -79.3606099999999941    43.6506090000000029 Toronto
45679986362 https://c2.staticflickr.com/5/4810/45679986362_6a4d513ee5.jpg   -79.3921420000000069    43.6545330000000007 Toronto
45711421631 https://c2.staticflickr.com/5/4887/45711421631_026edc7b97.jpg   -79.3925389999999993    43.6540749999999989 Toronto
44980249714 https://c2.staticflickr.com/5/4805/44980249714_6af5f16292.jpg   -79.3984399999999937    43.6474029999999971 Toronto
30753000657 https://c2.staticflickr.com/5/4891/30753000657_f02f55a840.jpg   -79.3925389999999993    43.6540749999999989 Toronto
45689614381 https://c2.staticflickr.com/5/4835/45689614381_d547b0ef23.jpg   -79.3620039999999989    43.6670560000000023 Toronto
44959756574 https://c2.staticflickr.com/5/4845/44959756574_af8abbab7c.jpg   -79.4641969999999986    43.6442740000000029 Toronto
31801466678 https://c2.staticflickr.com/2/1954/31801466678_447f61b46d.jpg   -79.3632599999999968    43.6680959999999985 Toronto
31798061738 https://c2.staticflickr.com/2/1905/31798061738_a9d4dcebcd.jpg   -79.4429540000000003    43.6531239999999983 Toronto
31794203098 https://c2.staticflickr.com/2/1977/31794203098_cc2f1e4ace.jpg   -79.4694319999999976    43.6462610000000026 Toronto
30717485907 https://c2.staticflickr.com/2/1902/30717485907_b4f0bdf03f.jpg   -79.3809519999999935    43.6657300000000035 Toronto
30716446527 https://c2.staticflickr.com/2/1928/30716446527_8da31a2ab0.jpg   -79.3995979999999975    43.6422939999999997 Toronto
45656439551 https://c2.staticflickr.com/2/1923/45656439551_3582ef561b.jpg   -79.3595689999999934    43.7341109999999986 Toronto
44733497465 https://c2.staticflickr.com/2/1919/44733497465_cf1ebfeb51.jpg   -79.3595689999999934    43.7341109999999986 Toronto
45597054682 https://c2.staticflickr.com/2/1957/45597054682_f77fc0bbd1.jpg   -79.3952210000000065    43.6454120000000003 Toronto
43804386130 https://c2.staticflickr.com/2/1906/43804386130_87931b321c.jpg   -79.3746540000000067    43.6620500000000007 Toronto
43797011330 https://c2.staticflickr.com/2/1977/43797011330_738f4f9473.jpg   -79.3856190000000055    43.6488900000000015 Toronto
31741088398 https://c2.staticflickr.com/2/1964/31741088398_485e8746fa.jpg   -79.3345920000000007    43.6763690000000011 Toronto
44878488034 https://c2.staticflickr.com/2/1938/44878488034_db2a554297.jpg   -79.4668999999999954    43.6426039999999986 Toronto
45545591032 https://c2.staticflickr.com/2/1950/45545591032_27164485f2.jpg   -79.3864370000000008    43.6701789999999974 Toronto
30637711487 https://c2.staticflickr.com/2/1940/30637711487_c81bc41002.jpg   -79.3487760000000009    43.718040000000002  Toronto
30623442857 https://c2.staticflickr.com/2/1959/30623442857_fe3ee6972d.jpg   -79.3840950000000021    43.6491770000000017 Toronto
45552568211 https://c2.staticflickr.com/2/1922/45552568211_fd896a94c7.jpg   -79.3746540000000067    43.6620500000000007 Toronto
44824172684 https://c2.staticflickr.com/2/1961/44824172684_4112dd6f29.jpg   -79.3507069999999999    43.6994770000000017 Toronto
31672515508 https://c2.staticflickr.com/2/1941/31672515508_44781e9840.jpg   -79.4304649999999981    43.6327199999999991 Toronto
43723531170 https://c2.staticflickr.com/2/1909/43723531170_71a25f0524.jpg   -79.4370739999999955    43.7559219999999982 Toronto
44614389785 https://c2.staticflickr.com/2/1924/44614389785_c6891b060f.jpg   -79.3746540000000067    43.6620500000000007 Toronto
45524655161 https://c2.staticflickr.com/2/1931/45524655161_3bc8203b26.jpg   -79.3737100000000027    43.6469060000000013 Toronto
45472603222 https://c2.staticflickr.com/2/1951/45472603222_e95130b535.jpg   -79.3851250000000022    43.6431180000000012 Toronto
44594730665 https://c2.staticflickr.com/2/1957/44594730665_ba8b8fa862.jpg   -79.3921849999999978    43.6370769999999979 Toronto
45502856521 https://c2.staticflickr.com/2/1919/45502856521_bbcb861386.jpg   -79.3606099999999941    43.6506090000000029 Toronto
43685754320 https://c2.staticflickr.com/2/1965/43685754320_a87b42690c.jpg   -79.3572730000000064    43.6513690000000025 Toronto
45491321121 https://c2.staticflickr.com/2/1951/45491321121_c9956b5948.jpg   -79.4532099999999986    43.7262810000000002 Toronto
43656013590 https://c2.staticflickr.com/2/1967/43656013590_4bd00f32f7.jpg   -79.3595689999999934    43.7341109999999986 Toronto
30511386587 https://c2.staticflickr.com/2/1939/30511386587_7b1ce3c6b6.jpg   -79.3591399999999965    43.6503599999999992 Toronto
43634725740 https://c2.staticflickr.com/2/1945/43634725740_de5b6e866a.jpg   -79.3591399999999965    43.6503599999999992 Toronto
45378169642 https://c2.staticflickr.com/2/1904/45378169642_2eccfa7fea.jpg   -79.3754050000000007    43.6488510000000005 Toronto
44514028625 https://c2.staticflickr.com/2/1923/44514028625_0be39ce7cc.jpg   -79.3729160000000036    43.6610409999999973 Toronto
43611888920 https://c2.staticflickr.com/2/1975/43611888920_1d003d8bda.jpg   -79.3769709999999975    43.6659459999999982 Toronto
31534519638 https://c2.staticflickr.com/2/1935/31534519638_6c6de2a71d.jpg   -79.3755340000000018    43.6480480000000028 Toronto
31529022538 https://c2.staticflickr.com/2/1977/31529022538_926eb3e31f.jpg   -79.3945989999999995    43.6679249999999968 Toronto
45336936612 https://c2.staticflickr.com/2/1916/45336936612_bdc676a3ec.jpg   -79.3746540000000067    43.6620500000000007 Toronto
45308600542 https://c2.staticflickr.com/2/1918/45308600542_cfaa3984e4.jpg   -79.3353000000000037    43.6734590000000011 Toronto
31483993878 https://c2.staticflickr.com/2/1904/31483993878_812f92f0e4.jpg   -79.3356009999999969    43.6754140000000035 Toronto
43543181990 https://c2.staticflickr.com/2/1945/43543181990_9861e417fb.jpg   -79.3797820000000058    43.6500810000000001 Toronto
43543180810 https://c2.staticflickr.com/2/1938/43543180810_4d66cb31f4.jpg   -79.377174999999994 43.6539470000000023 Toronto
44625631274 https://c2.staticflickr.com/2/1909/44625631274_b76e6fc460.jpg   -79.333090999999996 43.7258679999999984 Toronto
30402056787 https://c2.staticflickr.com/2/1975/30402056787_1533824d71.jpg   -79.3595689999999934    43.7341109999999986 Toronto
45291642332 https://c2.staticflickr.com/2/1903/45291642332_bcdd42d738.jpg   -79.3606850000000037    43.7337389999999999 Toronto
44618605454 https://c2.staticflickr.com/2/1932/44618605454_2d6d41ea06.jpg   -79.3596979999999945    43.733429000000001  Toronto
30402021987 https://c2.staticflickr.com/2/1922/30402021987_d154b13c99.jpg   -79.3595260000000025    43.7339559999999992 Toronto
43518082400 https://c2.staticflickr.com/2/1930/43518082400_74471893ed.jpg   -79.3689030000000031    43.6896830000000023 Toronto
44402319185 https://c2.staticflickr.com/2/1916/44402319185_3289e9fb4e.jpg   -79.3834240000000051    43.6521889999999999 Toronto
45250681922 https://c2.staticflickr.com/2/1966/45250681922_2c97db565b.jpg   -79.362876  43.686793999999999  Toronto
45232021801 https://c2.staticflickr.com/2/1948/45232021801_b7baee4298.jpg   -79.4383830000000017    43.7570300000000003 Toronto
43368045320 https://c2.staticflickr.com/2/1943/43368045320_0f94f42519.jpg   -79.3948560000000043    43.6677719999999994 Toronto
45179846071 https://c2.staticflickr.com/2/1912/45179846071_1dfef6bb6a.jpg   -79.3585280000000068    43.7345770000000016 Toronto
30199886817 https://c2.staticflickr.com/2/1918/30199886817_7732c865bc.jpg   -79.3924849999999935    43.6458960000000005 Toronto
45134257251 https://c2.staticflickr.com/2/1953/45134257251_a1ff210388.jpg   -79.4780580000000043    43.7408569999999983 Toronto
31244552398 https://c2.staticflickr.com/2/1914/31244552398_6117bd7f91.jpg   -79.3593970000000013    43.7365610000000018 Toronto
31244527148 https://c2.staticflickr.com/2/1905/31244527148_ef9edf2ed3.jpg   -79.3594190000000026    43.7331819999999993 Toronto
30159526517 https://c2.staticflickr.com/2/1914/30159526517_22c4331b74.jpg   -79.3617579999999947    43.7327160000000035 Toronto
44345616694 https://c2.staticflickr.com/2/1946/44345616694_0b7cedbd77.jpg   -79.3925600000000031    43.6541250000000005 Toronto
43238871430 https://c2.staticflickr.com/2/1918/43238871430_1fdbe75e0a.jpg   -79.3578030000000041    43.7346339999999998 Toronto
43209176000 https://c2.staticflickr.com/2/1918/43209176000_70056f15ba.jpg   -79.3573449999999951    43.7342220000000026 Toronto
31135525648 https://c2.staticflickr.com/2/1958/31135525648_a38622e815.jpg   -79.3576060000000041    43.7342220000000026 Toronto
30061172177 https://c2.staticflickr.com/2/1977/30061172177_ee6280422c.jpg   -79.4580600000000032    43.6420999999999992 Toronto
44941766222 https://c2.staticflickr.com/2/1909/44941766222_7efa27e248.jpg   -79.3574880000000036    43.7342709999999997 Toronto
30039126877 https://c2.staticflickr.com/2/1941/30039126877_bf65a772ca.jpg   -79.4587889999999959    43.6451429999999974 Toronto
44063669405 https://c2.staticflickr.com/2/1963/44063669405_6ee9740c6d.jpg   -79.4325249999999983    43.6323470000000029 Toronto
31101514088 https://c2.staticflickr.com/2/1929/31101514088_2ed7e3ed08.jpg   -79.3617579999999947    43.7327160000000035 Toronto
44974026981 https://c2.staticflickr.com/2/1951/44974026981_d001e4672f.jpg   -79.3617579999999947    43.7327160000000035 Toronto
44911420662 https://c2.staticflickr.com/2/1953/44911420662_d5cedd773b.jpg   -79.3617579999999947    43.7327160000000035 Toronto
44044257935 https://c2.staticflickr.com/2/1939/44044257935_b0cf74ddc6.jpg   -79.3719169999999963    43.6494360000000015 Toronto
44215613334 https://c2.staticflickr.com/2/1904/44215613334_ca68a32ba6.jpg   -79.3851250000000022    43.6431180000000012 Toronto
43121297830 https://c2.staticflickr.com/2/1918/43121297830_f051b1217d.jpg   -79.3944469999999995    43.6685050000000032 Toronto
44197999924 https://c2.staticflickr.com/2/1904/44197999924_7c490c71d9.jpg   -79.3980750000000057    43.6480779999999982 Toronto
44910532791 https://c2.staticflickr.com/2/1943/44910532791_70c2944367.jpg   -79.3822279999999978    43.6519750000000002 Toronto
31035529338 https://c2.staticflickr.com/2/1970/31035529338_204e0a31d8.jpg   -79.453203000000002 43.6605270000000019 Toronto
44856533352 https://c2.staticflickr.com/2/1941/44856533352_1b47b86308.jpg   -79.3846970000000027    43.6511629999999968 Toronto
44874070871 https://c2.staticflickr.com/2/1943/44874070871_ab46ff1f78.jpg   -79.3684949999999958    43.6525340000000028 Toronto
31001322888 https://c2.staticflickr.com/2/1960/31001322888_2b3d995830.jpg   -79.3710700000000031    43.6525340000000028 Toronto
44089824364 https://c2.staticflickr.com/2/1923/44089824364_4e2d9f10b3.jpg   -79.3860480000000024    43.642713999999998  Toronto
42998155700 https://c2.staticflickr.com/2/1947/42998155700_b0c80673fb.jpg   -79.3709419999999994    43.6508729999999971 Toronto
42980910090 https://c2.staticflickr.com/2/1889/42980910090_f2e146dd0e.jpg   -79.3740739999999931    43.6619260000000011 Toronto
44071488724 https://c2.staticflickr.com/2/1856/44071488724_f52e9b9d5f.jpg   -79.3860480000000024    43.642713999999998  Toronto
44070553414 https://c2.staticflickr.com/2/1854/44070553414_5ff6129ba7.jpg   -79.3855539999999991    43.6429159999999996 Toronto
29843120207 https://c2.staticflickr.com/2/1857/29843120207_bd234fd812.jpg   -79.4782840000000022    43.6734360000000024 Toronto
42964231160 https://c2.staticflickr.com/2/1878/42964231160_bc2457abf7.jpg   -79.3874430000000046    43.6426119999999997 Toronto
44773139731 https://c2.staticflickr.com/2/1887/44773139731_859180c80a.jpg   -79.3795029999999997    43.6532010000000028 Toronto
44710401042 https://c2.staticflickr.com/2/1889/44710401042_05606cde4d.jpg   -79.3781079999999974    43.6488080000000025 Toronto
44015089014 https://c2.staticflickr.com/2/1876/44015089014_7a6f61b697.jpg   -79.3789129999999972    43.6489249999999984 Toronto
44005333504 https://c2.staticflickr.com/2/1880/44005333504_e741cb7bf6.jpg   -79.3840950000000021    43.6423410000000018 Toronto
29780707567 https://c2.staticflickr.com/2/1855/29780707567_2ac276a62b.jpg   -79.3593120000000027    43.7341240000000013 Toronto
44712590251 https://c2.staticflickr.com/2/1859/44712590251_d358c72aa2.jpg   -79.3816120000000041    43.6470440000000011 Toronto
29761283187 https://c2.staticflickr.com/2/1886/29761283187_16f612854f.jpg   -79.3713149999999956    43.6592020000000005 Toronto
44637648182 https://c2.staticflickr.com/2/1841/44637648182_aa43cef3d0.jpg   -79.4469229999999982    43.637475000000002  Toronto
43966754474 https://c2.staticflickr.com/2/1846/43966754474_001d441c3d.jpg   -79.3860480000000024    43.642713999999998  Toronto
43960585804 https://c2.staticflickr.com/2/1868/43960585804_dc2355506d.jpg   -79.3860480000000024    43.642713999999998  Toronto
29727711157 https://c2.staticflickr.com/2/1871/29727711157_9070e02576.jpg   -79.397270000000006 43.6482489999999999 Toronto
43755388905 https://c2.staticflickr.com/2/1886/43755388905_294623f66a.jpg   -79.3812630000000041    43.650903999999997  Toronto
43755388275 https://c2.staticflickr.com/2/1859/43755388275_ffac0fc44c.jpg   -79.3814670000000007    43.6459819999999965 Toronto
43941688544 https://c2.staticflickr.com/2/1841/43941688544_1f632fa249.jpg   -79.3578030000000041    43.7346339999999998 Toronto
47037218842 https://c2.staticflickr.com/8/7922/47037218842_95c1560a4c.jpg   -79.4012400000000014    43.6403529999999975 Toronto
46175126975 https://c2.staticflickr.com/8/7850/46175126975_7c40838382.jpg   -79.3621229999999969    43.6600790000000032 Toronto
46365240944 https://c2.staticflickr.com/8/7814/46365240944_1d7188fc69.jpg   -79.3621229999999969    43.6600790000000032 Toronto
40123704333 https://c2.staticflickr.com/8/7862/40123704333_1b7ac89f1a.jpg   -79.3621229999999969    43.6600790000000032 Toronto
47036201602 https://c2.staticflickr.com/8/7911/47036201602_97ca32b53a.jpg   -79.3621229999999969    43.6600790000000032 Toronto
32146408607 https://c2.staticflickr.com/8/7909/32146408607_2a68878c6c.jpg   -79.3621229999999969    43.6600790000000032 Toronto
33213163278 https://c2.staticflickr.com/8/7903/33213163278_d5a68bf2ae.jpg   -79.3621229999999969    43.6600790000000032 Toronto
33213162188 https://c2.staticflickr.com/8/7806/33213162188_49cd426959.jpg   -79.3621229999999969    43.6600790000000032 Toronto
33213160238 https://c2.staticflickr.com/8/7874/33213160238_753c3e9a5e.jpg   -79.3621229999999969    43.6600790000000032 Toronto
32145878217 https://c2.staticflickr.com/8/7924/32145878217_ce973bb023.jpg   -79.390396999999993 43.7186960000000013 Toronto
46364261674 https://c2.staticflickr.com/8/7835/46364261674_4cc730aebf.jpg   -79.3862409999999983    43.6446269999999998 Toronto
46172778005 https://c2.staticflickr.com/8/7858/46172778005_ffaaed20f1.jpg   -79.337489000000005 43.6887159999999994 Toronto
46172385495 https://c2.staticflickr.com/8/7886/46172385495_7cd918521f.jpg   -79.409522999999993 43.6654499999999999 Toronto
40120183373 https://c2.staticflickr.com/8/7920/40120183373_201eaa9924.jpg   -79.4112339999999932    43.6858829999999969 Toronto
47084244421 https://c2.staticflickr.com/8/7844/47084244421_41c28649a8.jpg   -79.3981279999999998    43.6485440000000011 Toronto
46360155874 https://c2.staticflickr.com/8/7855/46360155874_f514f1c038.jpg   -79.3765879999999981    43.6598570000000024 Toronto
33208041938 https://c2.staticflickr.com/8/7894/33208041938_3355c6888e.jpg   -79.3919700000000006    43.6700050000000033 Toronto
47082100991 https://c2.staticflickr.com/8/7880/47082100991_d75e309339.jpg   -79.4175050000000056    43.6320479999999975 Toronto
33207169738 https://c2.staticflickr.com/8/7817/33207169738_b6e2ca32f5.jpg   -79.4175050000000056    43.6320479999999975 Toronto
46358613104 https://c2.staticflickr.com/8/7854/46358613104_538986fc77.jpg   -79.4175050000000056    43.6320479999999975 Toronto
32137393777 https://c2.staticflickr.com/8/7818/32137393777_d1b2a438b1.jpg   -79.3621229999999969    43.6600790000000032 Toronto
47078935391 https://c2.staticflickr.com/8/7865/47078935391_5b366c2f48.jpg   -79.4087930000000028    43.6714100000000016 Toronto
47026695212 https://c2.staticflickr.com/8/7882/47026695212_2ff3eddcdb.jpg   -79.3621229999999969    43.6600790000000032 Toronto
32136644357 https://c2.staticflickr.com/8/7923/32136644357_f4fec10974.jpg   -79.3648309999999952    43.6438249999999996 Toronto
40113510993 https://c2.staticflickr.com/8/7867/40113510993_59cd4f7c11.jpg   -79.3955320000000029    43.6461230000000029 Toronto
40113501743 https://c2.staticflickr.com/8/7897/40113501743_f1c12590f2.jpg   -79.4313250000000011    43.6495660000000001 Toronto
46164706445 https://c2.staticflickr.com/8/7811/46164706445_9d8716facb.jpg   -79.381219999999999 43.6562249999999992 Toronto
47078078371 https://c2.staticflickr.com/8/7835/47078078371_54245f4b3c.jpg   -79.383386999999999 43.6521880000000024 Toronto
32136010097 https://c2.staticflickr.com/8/7848/32136010097_3524b9d2bd.jpg   -79.3876580000000018    43.6456409999999977 Toronto
32135998387 https://c2.staticflickr.com/8/7918/32135998387_e401885c8f.jpg   -79.3887509999999992    43.646887999999997  Toronto
40112539553 https://c2.staticflickr.com/8/7892/40112539553_355bd3768e.jpg   -79.4352290000000067    43.6410210000000021 Toronto
32135389817 https://c2.staticflickr.com/8/7831/32135389817_93e21b92b8.jpg   -79.4109820000000042    43.7615350000000021 Toronto
32135388607 https://c2.staticflickr.com/8/7862/32135388607_4c532943f9.jpg   -79.4131919999999951    43.7699709999999982 Toronto
33201819908 https://c2.staticflickr.com/8/7873/33201819908_10730b01cc.jpg   -79.3621229999999969    43.6600790000000032 Toronto
40111951443 https://c2.staticflickr.com/8/7827/40111951443_e36c29c9e7.jpg   -79.3621229999999969    43.6600790000000032 Toronto
47076026261 https://c2.staticflickr.com/8/7913/47076026261_8601460b22.jpg   -79.4175050000000056    43.6320479999999975 Toronto
46162555325 https://c2.staticflickr.com/8/7809/46162555325_c47d16fe39.jpg   -79.4175050000000056    43.6320479999999975 Toronto
47023396052 https://c2.staticflickr.com/8/7820/47023396052_b7036c50a8.jpg   -79.3898669999999953    43.6699509999999975 Toronto
40110228203 https://c2.staticflickr.com/8/7913/40110228203_9c1b1c68f9.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110227703 https://c2.staticflickr.com/8/7821/40110227703_074d313293.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110227313 https://c2.staticflickr.com/8/7915/40110227313_0b492c04ac.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110226593 https://c2.staticflickr.com/8/7806/40110226593_e2056f0dd4.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161580125 https://c2.staticflickr.com/8/7830/46161580125_1942ee14ce.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161579135 https://c2.staticflickr.com/8/7843/46161579135_0f2c93ff95.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161578595 https://c2.staticflickr.com/8/7875/46161578595_af5c52fb49.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161576895 https://c2.staticflickr.com/8/7815/46161576895_7f79325326.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161576165 https://c2.staticflickr.com/8/7912/46161576165_d2f36eeb33.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161575455 https://c2.staticflickr.com/8/7917/46161575455_3582a72a1a.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161574815 https://c2.staticflickr.com/8/7842/46161574815_8b4cb0923f.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161574275 https://c2.staticflickr.com/8/7858/46161574275_aa37f71c5a.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133348237 https://c2.staticflickr.com/8/7874/32133348237_d1b175a35e.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161573345 https://c2.staticflickr.com/8/7874/46161573345_e4fb20d209.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133347107 https://c2.staticflickr.com/8/7924/32133347107_a37026c3d5.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351454754 https://c2.staticflickr.com/8/7841/46351454754_1dc894f364.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133344807 https://c2.staticflickr.com/8/7800/32133344807_3d762a4d58.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161571485 https://c2.staticflickr.com/8/7818/46161571485_a67d6956e8.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161571205 https://c2.staticflickr.com/8/7863/46161571205_2a436c2c08.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161571065 https://c2.staticflickr.com/8/7844/46161571065_62a7b3574c.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161570615 https://c2.staticflickr.com/8/7825/46161570615_6f07cc7bbe.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133339737 https://c2.staticflickr.com/8/7845/32133339737_2dbc69e50e.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133338857 https://c2.staticflickr.com/8/7906/32133338857_21a6e1c675.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133337877 https://c2.staticflickr.com/8/7886/32133337877_d36e3d2e11.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161568445 https://c2.staticflickr.com/8/7810/46161568445_b6ab29c4a7.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161567855 https://c2.staticflickr.com/8/7919/46161567855_ec69a8036d.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161566915 https://c2.staticflickr.com/8/7861/46161566915_a4e7833e5a.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200015468 https://c2.staticflickr.com/8/7875/33200015468_9e0d161092.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200015008 https://c2.staticflickr.com/8/7859/33200015008_a03f069670.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200014438 https://c2.staticflickr.com/8/7880/33200014438_8cb519b9fc.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200013728 https://c2.staticflickr.com/8/7871/33200013728_6c9a2c8b08.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161561225 https://c2.staticflickr.com/8/7843/46161561225_f7137459ce.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200011628 https://c2.staticflickr.com/8/7893/33200011628_5daec21a05.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200010658 https://c2.staticflickr.com/8/7877/33200010658_4b2155c96a.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200009588 https://c2.staticflickr.com/8/7860/33200009588_b57983e3ee.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200008308 https://c2.staticflickr.com/8/7892/33200008308_86904c6320.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200007148 https://c2.staticflickr.com/8/7893/33200007148_31cca9b4ee.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46173739115 https://c2.staticflickr.com/8/7866/46173739115_fcd1ff1d59.jpg   -79.3738170000000025    43.6616309999999999 Toronto
40121173153 https://c2.staticflickr.com/8/7878/40121173153_a6b7e05fc5.jpg   -79.3860260000000011    43.6709749999999985 Toronto
46171626755 https://c2.staticflickr.com/8/7847/46171626755_2235b919f3.jpg   -79.401016999999996 43.673211000000002  Toronto
47084972941 https://c2.staticflickr.com/8/7801/47084972941_30646b7d0a.jpg   -79.4120640000000009    43.6866800000000026 Toronto
47031923942 https://c2.staticflickr.com/8/7849/47031923942_4e6af5e731.jpg   -79.3814540000000051    43.6576840000000033 Toronto
33208680118 https://c2.staticflickr.com/8/7903/33208680118_f4261b971d.jpg   -79.3890949999999975    43.6374959999999987 Toronto
46169361505 https://c2.staticflickr.com/8/7889/46169361505_c2f4978584.jpg   -79.3849639999999965    43.6419659999999965 Toronto
33207173508 https://c2.staticflickr.com/8/7842/33207173508_b598182d2d.jpg   -79.4175050000000056    43.6320479999999975 Toronto
33207164528 https://c2.staticflickr.com/8/7924/33207164528_09eaeca76c.jpg   -79.4175050000000056    43.6320479999999975 Toronto
46168027705 https://c2.staticflickr.com/8/7906/46168027705_4bdd0e97b0.jpg   -79.3919700000000006    43.6700050000000033 Toronto
47079022151 https://c2.staticflickr.com/8/7876/47079022151_b65d1bde33.jpg   -79.3621229999999969    43.6600790000000032 Toronto
47078889601 https://c2.staticflickr.com/8/7901/47078889601_a8c7325358.jpg   -79.3621229999999969    43.6600790000000032 Toronto
46165240685 https://c2.staticflickr.com/8/7877/46165240685_4d20bd851b.jpg   -79.3385190000000051    43.6887550000000005 Toronto
46164950395 https://c2.staticflickr.com/8/7890/46164950395_e33aa63041.jpg   -79.442781999999994 43.6505369999999999 Toronto
32136550677 https://c2.staticflickr.com/8/7894/32136550677_769fda1697.jpg   -79.4392859999999956    43.650266000000002  Toronto
32136323047 https://c2.staticflickr.com/8/7870/32136323047_82d1be2a86.jpg   -79.4159819999999996    43.6504049999999992 Toronto
47025974442 https://c2.staticflickr.com/8/7850/47025974442_6d9036762b.jpg   -79.383386999999999 43.6521880000000024 Toronto
47077730021 https://c2.staticflickr.com/8/7856/47077730021_eb92d84025.jpg   -79.3858550000000065    43.6498070000000027 Toronto
32136001487 https://c2.staticflickr.com/8/7894/32136001487_2c98b1bcac.jpg   -79.3892340000000019    43.6453199999999981 Toronto
40112902303 https://c2.staticflickr.com/8/7812/40112902303_361bbbc370.jpg   -79.3893949999999933    43.6467329999999976 Toronto
46163853825 https://c2.staticflickr.com/8/7924/46163853825_f91bdaaa79.jpg   -79.3781809999999979    43.6645609999999991 Toronto
40112296793 https://c2.staticflickr.com/8/7893/40112296793_4799f02556.jpg   -79.4130949999999984    43.7698430000000016 Toronto
46353282834 https://c2.staticflickr.com/8/7839/46353282834_2bf489e834.jpg   -79.4702910000000031    43.6404909999999973 Toronto
32135127997 https://c2.staticflickr.com/8/7882/32135127997_77eebe0b23.jpg   -79.3793639999999954    43.6557549999999992 Toronto
46352498554 https://c2.staticflickr.com/8/7838/46352498554_97deebf2a9.jpg   -79.4175050000000056    43.6320479999999975 Toronto
46162574045 https://c2.staticflickr.com/8/7891/46162574045_8832f9b388.jpg   -79.4175050000000056    43.6320479999999975 Toronto
40111189483 https://c2.staticflickr.com/8/7879/40111189483_8e09098b17.jpg   -79.4175050000000056    43.6320479999999975 Toronto
40110228423 https://c2.staticflickr.com/8/7850/40110228423_8cb5cc2198.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161582075 https://c2.staticflickr.com/8/7918/46161582075_03b1f2811c.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161581455 https://c2.staticflickr.com/8/7844/46161581455_d26e51acfb.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161581125 https://c2.staticflickr.com/8/7838/46161581125_0be15a1652.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161580345 https://c2.staticflickr.com/8/7816/46161580345_f35c8d0200.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161579805 https://c2.staticflickr.com/8/7815/46161579805_13e780ca25.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161578815 https://c2.staticflickr.com/8/7810/46161578815_54c4a62775.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161578165 https://c2.staticflickr.com/8/7909/46161578165_65a6616b56.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161576315 https://c2.staticflickr.com/8/7823/46161576315_363d6f063d.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161575805 https://c2.staticflickr.com/8/7801/46161575805_c8aba5f5eb.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161575075 https://c2.staticflickr.com/8/7829/46161575075_6cecc90f04.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161574625 https://c2.staticflickr.com/8/7840/46161574625_3c41073da9.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161573995 https://c2.staticflickr.com/8/7869/46161573995_e78ea6a6a7.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161573545 https://c2.staticflickr.com/8/7831/46161573545_d4f1fb85d6.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161573145 https://c2.staticflickr.com/8/7860/46161573145_81a2122426.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133346517 https://c2.staticflickr.com/8/7834/32133346517_7db7ab106b.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351454414 https://c2.staticflickr.com/8/7839/46351454414_37b35db7aa.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351454124 https://c2.staticflickr.com/8/7841/46351454124_74ea1bc573.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133342897 https://c2.staticflickr.com/8/7847/32133342897_e16c216a72.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133342267 https://c2.staticflickr.com/8/7922/32133342267_a720308ae0.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133341597 https://c2.staticflickr.com/8/7860/32133341597_936165053c.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133340487 https://c2.staticflickr.com/8/7889/32133340487_ab1c479881.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161569785 https://c2.staticflickr.com/8/7801/46161569785_6c8c4c5501.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161569135 https://c2.staticflickr.com/8/7829/46161569135_8c46726b5a.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161568715 https://c2.staticflickr.com/8/7805/46161568715_d4936e6739.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161568115 https://c2.staticflickr.com/8/7834/46161568115_efb18a0e1d.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161567485 https://c2.staticflickr.com/8/7877/46161567485_a79f9257f4.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161566025 https://c2.staticflickr.com/8/7925/46161566025_766b67c103.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161564905 https://c2.staticflickr.com/8/7835/46161564905_5c84319b51.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161564145 https://c2.staticflickr.com/8/7877/46161564145_3bece19620.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161562955 https://c2.staticflickr.com/8/7865/46161562955_3fd0344ebd.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200013168 https://c2.staticflickr.com/8/7803/33200013168_e292bf8f2e.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200012108 https://c2.staticflickr.com/8/7841/33200012108_4ddf30cd59.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200011068 https://c2.staticflickr.com/8/7884/33200011068_3d33b4420c.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200010138 https://c2.staticflickr.com/8/7819/33200010138_750f8b224f.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200008808 https://c2.staticflickr.com/8/7847/33200008808_d222c378ce.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161554685 https://c2.staticflickr.com/8/7923/46161554685_0f425675ef.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161554175 https://c2.staticflickr.com/8/7855/46161554175_c5c7bbd7a4.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200006218 https://c2.staticflickr.com/8/7884/33200006218_efe23fd3ae.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200005898 https://c2.staticflickr.com/8/7803/33200005898_ce82de0a90.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200004948 https://c2.staticflickr.com/8/7909/33200004948_09f8f40452.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200003768 https://c2.staticflickr.com/8/7875/33200003768_cac817b483.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47022888342 https://c2.staticflickr.com/8/7808/47022888342_59d42497ef.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133328107 https://c2.staticflickr.com/8/7814/32133328107_99ddd208b5.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133327757 https://c2.staticflickr.com/8/7813/32133327757_edeba99582.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200000168 https://c2.staticflickr.com/8/7836/33200000168_0321897256.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075024551 https://c2.staticflickr.com/8/7811/47075024551_e83212e124.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133325287 https://c2.staticflickr.com/8/7885/32133325287_5ee749c3ba.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075022071 https://c2.staticflickr.com/8/7922/47075022071_14b641aae0.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075020811 https://c2.staticflickr.com/8/7861/47075020811_46aea5a89c.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075019901 https://c2.staticflickr.com/8/7815/47075019901_94364c4e1d.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075019131 https://c2.staticflickr.com/8/7814/47075019131_9b832d8ccf.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075018051 https://c2.staticflickr.com/8/7884/47075018051_1f652a97c8.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075017051 https://c2.staticflickr.com/8/7927/47075017051_18eb372708.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075015951 https://c2.staticflickr.com/8/7804/47075015951_904cf2c9b3.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075015351 https://c2.staticflickr.com/8/7877/47075015351_73bbb2a7d1.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075014861 https://c2.staticflickr.com/8/7908/47075014861_bc22ce612f.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075013911 https://c2.staticflickr.com/8/7801/47075013911_af3eb8465f.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351418404 https://c2.staticflickr.com/8/7836/46351418404_0414757cd0.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351417954 https://c2.staticflickr.com/8/7838/46351417954_06b36efec3.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351417394 https://c2.staticflickr.com/8/7919/46351417394_28ac9c3d3b.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351416644 https://c2.staticflickr.com/8/7865/46351416644_e0cde67121.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075010871 https://c2.staticflickr.com/8/7808/47075010871_fee1c03787.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110173903 https://c2.staticflickr.com/8/7920/40110173903_feec1f0298.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110173743 https://c2.staticflickr.com/8/7859/40110173743_3902e71af6.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075008141 https://c2.staticflickr.com/8/7805/47075008141_75dae5ec8e.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075007801 https://c2.staticflickr.com/8/7826/47075007801_9a065a1d35.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110173083 https://c2.staticflickr.com/8/7904/40110173083_f9785e653a.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161554035 https://c2.staticflickr.com/8/7924/46161554035_deb8d2fe22.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161553865 https://c2.staticflickr.com/8/7849/46161553865_5a7c38860f.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161553295 https://c2.staticflickr.com/8/7828/46161553295_56e8f16559.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46161552605 https://c2.staticflickr.com/8/7909/46161552605_7b5c9887e2.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200002318 https://c2.staticflickr.com/8/7922/33200002318_648bcbda6c.jpg   -79.4227620000000059    43.6628570000000025 Toronto
33200001318 https://c2.staticflickr.com/8/7870/33200001318_6a13c6cc7c.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133327427 https://c2.staticflickr.com/8/7822/32133327427_20ffe93907.jpg   -79.4227620000000059    43.6628570000000025 Toronto
32133326787 https://c2.staticflickr.com/8/7851/32133326787_626f8e0b98.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075024061 https://c2.staticflickr.com/8/7857/47075024061_865dcc0908.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075023301 https://c2.staticflickr.com/8/7830/47075023301_e096a8ee83.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075021321 https://c2.staticflickr.com/8/7916/47075021321_0355dcac77.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075020411 https://c2.staticflickr.com/8/7855/47075020411_e5200cb797.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075019631 https://c2.staticflickr.com/8/7847/47075019631_205e0dd397.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075018571 https://c2.staticflickr.com/8/7823/47075018571_bee0f2fe7c.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110179403 https://c2.staticflickr.com/8/7871/40110179403_d11c73e066.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075016351 https://c2.staticflickr.com/8/7842/47075016351_931bae65cd.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075015591 https://c2.staticflickr.com/8/7905/47075015591_3918154da0.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075015151 https://c2.staticflickr.com/8/7910/47075015151_ce125c33a9.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075014771 https://c2.staticflickr.com/8/7871/47075014771_153b18e51e.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351418824 https://c2.staticflickr.com/8/7862/46351418824_25ec9d2575.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351418124 https://c2.staticflickr.com/8/7823/46351418124_3e61efd868.jpg   -79.4227620000000059    43.6628570000000025 Toronto
46351417654 https://c2.staticflickr.com/8/7924/46351417654_9776c6050d.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075012171 https://c2.staticflickr.com/8/7911/47075012171_208e4f4bff.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075011611 https://c2.staticflickr.com/8/7903/47075011611_17889c6835.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075009711 https://c2.staticflickr.com/8/7919/47075009711_150c8dc39a.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075009071 https://c2.staticflickr.com/8/7878/47075009071_781fbf9bd8.jpg   -79.4227620000000059    43.6628570000000025 Toronto
47075008661 https://c2.staticflickr.com/8/7847/47075008661_15b8cf1208.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110173363 https://c2.staticflickr.com/8/7920/40110173363_6960f1129d.jpg   -79.4227620000000059    43.6628570000000025 Toronto
40110173203 https://c2.staticflickr.com/8/7920/40110173203_6e972d71f6.jpg   -79.4227620000000059    43.6628570000000025 Toronto
39717647893 https://c2.staticflickr.com/5/4900/39717647893_916cda4d56.jpg   -79.4076340000000016    43.6567879999999988 Toronto
45645322614 https://c2.staticflickr.com/5/4876/45645322614_6b3ef3c816.jpg   -79.3767030000000062    43.654040000000002  Toronto
31342447717 https://c2.staticflickr.com/5/4889/31342447717_0a9863b7cc.jpg   -79.3948560000000043    43.6677719999999994 Toronto
45535634964 https://c2.staticflickr.com/2/1980/45535634964_e139acceb2.jpg   -79.3817130000000049    43.6487300000000005 Toronto
46106071041 https://c2.staticflickr.com/5/4856/46106071041_2d62d642f3.jpg   -79.3815309999999954    43.6421610000000015 Toronto
30578807667 https://c2.staticflickr.com/2/1951/30578807667_f1fa241e5d.jpg   -79.3606099999999941    43.6506090000000029 Toronto
31483985408 https://c2.staticflickr.com/2/1918/31483985408_a5ff1f58fb.jpg   -79.3345390000000066    43.6811170000000004 Toronto
43182183620 https://c2.staticflickr.com/2/1920/43182183620_175f48e0d9.jpg   -79.3813490000000002    43.6458889999999968 Toronto
44738223442 https://c2.staticflickr.com/2/1860/44738223442_155343933f.jpg   -79.3752980000000008    43.6498169999999988 Toronto
44787789921 https://c2.staticflickr.com/2/1882/44787789921_dcd81f8f77.jpg   -79.3867989999999963    43.6486680000000007 Toronto
44773140811 https://c2.staticflickr.com/2/1883/44773140811_303c920407.jpg   -79.3728729999999985    43.6527200000000022 Toronto
44710454942 https://c2.staticflickr.com/2/1849/44710454942_165b1301b7.jpg   -79.3813490000000002    43.6458889999999968 Toronto
44015089184 https://c2.staticflickr.com/2/1865/44015089184_8d0002968b.jpg   -79.3789129999999972    43.6489249999999984 Toronto
44669137372 https://c2.staticflickr.com/2/1899/44669137372_fff31c586d.jpg   -79.3785809999999969    43.6504850000000033 Toronto
43809405385 https://c2.staticflickr.com/2/1877/43809405385_7781b21a5a.jpg   -79.3786230000000046    43.6507020000000026 Toronto
29761284607 https://c2.staticflickr.com/2/1897/29761284607_3f516fb4c2.jpg   -79.3755340000000018    43.6496929999999992 Toronto
43743609005 https://c2.staticflickr.com/2/1873/43743609005_17e32d4040.jpg   -79.3744930000000011    43.6618799999999965 Toronto
30747663038 https://c2.staticflickr.com/2/1900/30747663038_3d0590b608.jpg   -79.3745470000000068    43.6621280000000027 Toronto
43880024754 https://c2.staticflickr.com/2/1872/43880024754_c0624a98bb.jpg   -79.3873779999999982    43.6510430000000014 Toronto
44560009071 https://c2.staticflickr.com/2/1854/44560009071_b19fb5c459.jpg   -79.3795029999999997    43.6532010000000028 Toronto
44218428231 https://c2.staticflickr.com/2/1879/44218428231_63acf8e479.jpg   -79.3769709999999975    43.6659459999999982 Toronto
42410741100 https://c2.staticflickr.com/2/1892/42410741100_6af86474e5.jpg   -79.3745470000000068    43.6621280000000027 Toronto
29282540317 https://c2.staticflickr.com/2/1838/29282540317_54377f8c79.jpg   -79.3745470000000068    43.6621280000000027 Toronto
30307738688 https://c2.staticflickr.com/2/1866/30307738688_63113da942.jpg   -79.3817350000000062    43.6468980000000002 Toronto
43268930265 https://c2.staticflickr.com/2/1880/43268930265_96ac73bce4.jpg   -79.3791489999999982    43.6543429999999972 Toronto
30307733858 https://c2.staticflickr.com/2/1852/30307733858_9b1645d4cb.jpg   -79.3541830000000061    43.665737   Toronto
43950511582 https://c2.staticflickr.com/2/1836/43950511582_0b5d169a40.jpg   -79.379052999999999 43.6479849999999985 Toronto
43950509162 https://c2.staticflickr.com/2/1832/43950509162_d9859cd140.jpg   -79.4192859999999996    43.6341180000000008 Toronto
30112992898 https://c2.staticflickr.com/1/939/30112992898_3025c779f9.jpg    -79.3769709999999975    43.6659459999999982 Toronto
41554502480 https://c2.staticflickr.com/1/838/41554502480_d58eff2dd5.jpg    -79.3815309999999954    43.6421610000000015 Toronto
29492305828 https://c2.staticflickr.com/2/1826/29492305828_2290fd601e.jpg   -79.3873119999999943    43.6475250000000017 Toronto
29264519338 https://c2.staticflickr.com/2/1768/29264519338_a49ea51dc8.jpg   -79.3997389999999967    43.6648970000000034 Toronto
41822853095 https://c2.staticflickr.com/2/1730/41822853095_73e98fe434.jpg   -79.3745470000000068    43.6621280000000027 Toronto
42451067171 https://c2.staticflickr.com/1/894/42451067171_01e73e6569.jpg    -79.3407289999999961    43.6693459999999973 Toronto
42170348192 https://c2.staticflickr.com/1/965/42170348192_30072b888b.jpg    -79.4158740000000023    43.6369439999999997 Toronto
42170343362 https://c2.staticflickr.com/1/965/42170343362_9c425c72cf.jpg    -79.3872279999999932    43.6420150000000007 Toronto
28171037908 https://c2.staticflickr.com/1/910/28171037908_823a542c27.jpg    -79.3745470000000068    43.6621280000000027 Toronto
41317956494 https://c2.staticflickr.com/1/824/41317956494_9681d47e48.jpg    -79.3580560000000048    43.6765860000000004 Toronto
28042309928 https://c2.staticflickr.com/1/976/28042309928_e15397a67a.jpg    -79.3745470000000068    43.6621280000000027 Toronto
40546306285 https://c2.staticflickr.com/1/783/40546306285_96722f976d.jpg    -79.3745470000000068    43.6621280000000027 Toronto
39567299250 https://c2.staticflickr.com/1/813/39567299250_9f27fe204f.jpg    -79.3745470000000068    43.6621900000000025 Toronto
26296314147 https://c2.staticflickr.com/1/796/26296314147_e3be56cf42.jpg    -79.399051  43.6316020000000009 Toronto
26270510127 https://c2.staticflickr.com/1/783/26270510127_42e0523d48.jpg    -79.3463619999999992    43.6786490000000001 Toronto
39908586674 https://c2.staticflickr.com/5/4795/39908586674_629b9479a0.jpg   -79.3820570000000032    43.6467969999999994 Toronto
26747743238 https://c2.staticflickr.com/5/4619/26747743238_85f4c74322.jpg   -79.3896739999999994    43.6966019999999986 Toronto
26440993068 https://c2.staticflickr.com/5/4650/26440993068_b91cf8edfa.jpg   -79.3725940000000065    43.649754999999999  Toronto
26243215198 https://c2.staticflickr.com/5/4661/26243215198_468178d921.jpg   -79.3842329999999947    43.6421500000000009 Toronto
38557205115 https://c2.staticflickr.com/5/4641/38557205115_e8f26f87ab.jpg   -79.3601270000000056    43.7334910000000008 Toronto
24274296447 https://c2.staticflickr.com/5/4735/24274296447_0698e1564f.jpg   -79.3769709999999975    43.6659459999999982 Toronto
27197955959 https://c2.staticflickr.com/5/4600/27197955959_6e33657a0a.jpg   -79.4012830000000065    43.6403609999999986 Toronto
36950781124 https://c2.staticflickr.com/5/4451/36950781124_a8d8f4b134.jpg   -79.4145010000000013    43.6481250000000003 Toronto
37529159411 https://c2.staticflickr.com/5/4460/37529159411_900bdd12e1.jpg   -79.3789880000000068    43.6467889999999983 Toronto
37529154811 https://c2.staticflickr.com/5/4487/37529154811_ae228b8d5f.jpg   -79.3820570000000032    43.6467969999999994 Toronto
36240194923 https://c2.staticflickr.com/5/4394/36240194923_4d3f14c4d8.jpg   -79.4081170000000043    43.6777110000000022 Toronto
36240187553 https://c2.staticflickr.com/5/4331/36240187553_21797202ce.jpg   -79.3869490000000013    43.6706720000000033 Toronto
35122682550 https://c2.staticflickr.com/5/4254/35122682550_9551692f0b.jpg   -79.3741820000000047    43.6618410000000026 Toronto
33557149741 https://c2.staticflickr.com/3/2853/33557149741_b177cc523a.jpg   -79.3742780000000039    43.6484510000000014 Toronto
33201235016 https://c2.staticflickr.com/3/2919/33201235016_698c2fe6a5.jpg   -79.3722510000000057    43.6491490000000013 Toronto
32324076661 https://c2.staticflickr.com/1/363/32324076661_bf4598bac4.jpg    -79.3768749999999983    43.6469060000000013 Toronto
31032002875 https://c2.staticflickr.com/6/5750/31032002875_a10367b70e.jpg   -79.3597409999999996    43.7342190000000031 Toronto
30252767046 https://c2.staticflickr.com/9/8270/30252767046_a197f319dc.jpg   -79.3869490000000013    43.6706720000000033 Toronto
29284418091 https://c2.staticflickr.com/9/8315/29284418091_3732bcaff0.jpg   -79.3896100000000047    43.6447709999999987 Toronto
29261970461 https://c2.staticflickr.com/9/8549/29261970461_a1fd655af9.jpg   -79.384009000000006 43.6531159999999971 Toronto
29025630502 https://c2.staticflickr.com/9/8667/29025630502_0a26574e51.jpg   -79.4097170000000006    43.6785039999999967 Toronto
28989176292 https://c2.staticflickr.com/9/8480/28989176292_c13f76dd14.jpg   -79.3571579999999983    43.6766020000000026 Toronto
28807832250 https://c2.staticflickr.com/9/8152/28807832250_38b23b91d5.jpg   -79.3930670000000021    43.6689730000000012 Toronto
28184455134 https://c2.staticflickr.com/9/8322/28184455134_025012e303.jpg   -79.3800410000000056    43.6543259999999975 Toronto
28465529140 https://c2.staticflickr.com/8/7667/28465529140_5a1a1f3731.jpg   -79.3787229999999937    43.6510310000000032 Toronto
28420264060 https://c2.staticflickr.com/9/8486/28420264060_d1fc08e43b.jpg   -79.3787229999999937    43.6510310000000032 Toronto
28287757040 https://c2.staticflickr.com/9/8717/28287757040_d3742c9177.jpg   -79.3793139999999937    43.6528709999999975 Toronto
27499555764 https://c2.staticflickr.com/8/7359/27499555764_108c46e8d5.jpg   -79.3897950000000066    43.646532999999998  Toronto
28080308736 https://c2.staticflickr.com/8/7538/28080308736_14b5941dca.jpg   -79.3792380000000009    43.6482719999999986 Toronto
28036624891 https://c2.staticflickr.com/8/7610/28036624891_eddf03fee4.jpg   -79.3810270000000031    43.648069999999997  Toronto
28011642892 https://c2.staticflickr.com/8/7304/28011642892_55f853c3d6.jpg   -79.3820809999999994    43.6474180000000018 Toronto
27521503810 https://c2.staticflickr.com/8/7290/27521503810_3c2a7b2ae6.jpg   -79.3847250000000031    43.6431109999999975 Toronto
27517526046 https://c2.staticflickr.com/8/7359/27517526046_3e714d2453.jpg   -79.3928709999999995    43.6686160000000001 Toronto
26717893624 https://c2.staticflickr.com/8/7498/26717893624_f1e6f713af.jpg   -79.3905349999999999    43.6855169999999973 Toronto
26373771870 https://c2.staticflickr.com/2/1461/26373771870_700581d979.jpg   -79.3948239999999998    43.6678440000000023 Toronto
25881171193 https://c2.staticflickr.com/2/1689/25881171193_176ca93812.jpg   -79.3736880000000014    43.6485520000000022 Toronto
25650791573 https://c2.staticflickr.com/2/1565/25650791573_29b0d759a7.jpg   -79.3858800000000002    43.6416359999999983 Toronto
26194279636 https://c2.staticflickr.com/2/1651/26194279636_e93b094a7c.jpg   -79.4113360000000057    43.6649839999999969 Toronto
25468428373 https://c2.staticflickr.com/2/1709/25468428373_0aedca0d01.jpg   -79.3739889999999946    43.6625310000000013 Toronto
25273712494 https://c2.staticflickr.com/2/1484/25273712494_94413536cc.jpg   -79.379526999999996 43.6531090000000006 Toronto
25906423465 https://c2.staticflickr.com/2/1674/25906423465_f01be7359b.jpg   -79.3961249999999978    43.6352669999999989 Toronto
23451877979 https://c2.staticflickr.com/6/5687/23451877979_10aa70547c.jpg   -79.3739889999999946    43.6625310000000013 Toronto
23189021145 https://c2.staticflickr.com/6/5663/23189021145_b915a7fe98.jpg   -79.4112930000000006    43.6650849999999977 Toronto
22131746991 https://c2.staticflickr.com/6/5739/22131746991_922967a93b.jpg   -79.4084930000000071    43.6863699999999966 Toronto
21193181600 https://c2.staticflickr.com/1/632/21193181600_a7069b4fc3.jpg    -79.3893089999999972    43.6415409999999966 Toronto
21170130028 https://c2.staticflickr.com/6/5782/21170130028_0fb3f1b6aa.jpg   -79.3575199999999938    43.6525490000000005 Toronto
21174450016 https://c2.staticflickr.com/6/5778/21174450016_2b58d8b6dc.jpg   -79.3834300000000042    43.6529999999999987 Toronto
20479901443 https://c2.staticflickr.com/6/5819/20479901443_99280885ba.jpg   -79.3845029999999952    43.6531239999999983 Toronto
20955054262 https://c2.staticflickr.com/6/5725/20955054262_cfa09d48f2.jpg   -79.3606099999999941    43.6506090000000029 Toronto
19963686132 https://c2.staticflickr.com/1/556/19963686132_ce54718aa3.jpg    -79.3819060000000007    43.6476200000000034 Toronto
19520247698 https://c2.staticflickr.com/1/473/19520247698_b958212bd8.jpg    -79.392429000000007 43.6391449999999992 Toronto
18621160983 https://c2.staticflickr.com/1/279/18621160983_409be30227.jpg    -79.381219999999999 43.6402089999999987 Toronto
18827031292 https://c2.staticflickr.com/4/3947/18827031292_c25b0f2a05.jpg   -79.3981320000000039    43.6393810000000002 Toronto
17896660700 https://c2.staticflickr.com/6/5465/17896660700_2f5e380041.jpg   -79.4550129999999939    43.637163000000001  Toronto
44669137332 https://c2.staticflickr.com/2/1878/44669137332_f8b3a86832.jpg   -79.3787520000000058    43.6507330000000024 Toronto
43743605675 https://c2.staticflickr.com/2/1885/43743605675_d8368c155d.jpg   -79.4009180000000043    43.6857180000000014 Toronto
27822511427 https://c2.staticflickr.com/2/1747/27822511427_fe2ccd2098.jpg   -79.3593120000000027    43.7341240000000013 Toronto
28692715558 https://c2.staticflickr.com/2/1749/28692715558_5caccc27fb.jpg   -79.3593120000000027    43.7341240000000013 Toronto
27523189787 https://c2.staticflickr.com/2/1725/27523189787_f04d2ab329.jpg   -79.3745470000000068    43.6621280000000027 Toronto
28165052768 https://c2.staticflickr.com/1/972/28165052768_5fd4b71c13.jpg    -79.3887730000000005    43.6718369999999965 Toronto
27113656207 https://c2.staticflickr.com/1/906/27113656207_f2726d4e7a.jpg    -79.3802539999999937    43.6470509999999976 Toronto
41064457865 https://c2.staticflickr.com/1/973/41064457865_067710ef25.jpg    -79.4090290000000039    43.6349879999999999 Toronto
41916919992 https://c2.staticflickr.com/1/910/41916919992_b8ae7952f5.jpg    -79.3850180000000023    43.6426409999999976 Toronto
27707979558 https://c2.staticflickr.com/1/916/27707979558_02661a6379.jpg    -79.3745470000000068    43.6621280000000027 Toronto
40748263174 https://c2.staticflickr.com/1/819/40748263174_3fa9cfa506.jpg    -79.3948560000000043    43.6677719999999994 Toronto
40571100544 https://c2.staticflickr.com/1/799/40571100544_09bb280b44.jpg    -79.3745470000000068    43.6621900000000025 Toronto
26086720188 https://c2.staticflickr.com/5/4673/26086720188_e65b80ca76.jpg   -79.3872599999999977    43.6426429999999996 Toronto
27635060089 https://c2.staticflickr.com/5/4643/27635060089_782ffe4d0e.jpg   -79.3643759999999929    43.6385590000000008 Toronto
24201221627 https://c2.staticflickr.com/5/4543/24201221627_fe72d33a3f.jpg   -79.3817880000000002    43.645741000000001  Toronto
27284938149 https://c2.staticflickr.com/5/4562/27284938149_958dd4c642.jpg   -79.3817880000000002    43.645741000000001  Toronto
38767550151 https://c2.staticflickr.com/5/4561/38767550151_c3e05b1752.jpg   -79.3769709999999975    43.6659459999999982 Toronto
37167810672 https://c2.staticflickr.com/5/4379/37167810672_e51d6a98bf.jpg   -79.3745159999999998    43.648342999999997  Toronto
36897620786 https://c2.staticflickr.com/5/4338/36897620786_9c96228919.jpg   -79.4043730000000068    43.6679949999999977 Toronto
35533995003 https://c2.staticflickr.com/5/4401/35533995003_1f30d26a13.jpg   -79.3811129999999991    43.6461219999999983 Toronto
36298425546 https://c2.staticflickr.com/5/4377/36298425546_48efc87e85.jpg   -79.3811129999999991    43.6461219999999983 Toronto
35533988323 https://c2.staticflickr.com/5/4355/35533988323_92864c0b8f.jpg   -79.3811129999999991    43.6461219999999983 Toronto
35918031001 https://c2.staticflickr.com/5/4302/35918031001_5e1306cac4.jpg   -79.3902960000000064    43.6376279999999994 Toronto
35156222310 https://c2.staticflickr.com/5/4230/35156222310_e676ac5deb.jpg   -79.3738709999999941    43.648575000000001  Toronto
35307516571 https://c2.staticflickr.com/5/4246/35307516571_0811d64448.jpg   -79.3786029999999982    43.6441659999999985 Toronto
32067129230 https://c2.staticflickr.com/1/479/32067129230_f2743a300c.jpg    -79.3823890000000034    43.6526119999999977 Toronto
32125005426 https://c2.staticflickr.com/1/321/32125005426_1292b472ac.jpg    -79.3705559999999934    43.6447220000000016 Toronto
30515680963 https://c2.staticflickr.com/6/5818/30515680963_d4fa9c1980.jpg   -79.3871209999999934    43.6424730000000025 Toronto
30769719921 https://c2.staticflickr.com/6/5598/30769719921_c9ff01a2b1.jpg   -79.3926529999999957    43.6536749999999998 Toronto
30204112392 https://c2.staticflickr.com/9/8132/30204112392_ef31b19eaa.jpg   -79.3947210000000041    43.6732039999999984 Toronto
29226512273 https://c2.staticflickr.com/9/8028/29226512273_7f9bb1b2ea.jpg   -79.409008  43.678091000000002  Toronto
29261969391 https://c2.staticflickr.com/9/8323/29261969391_f692d55781.jpg   -79.3857689999999963    43.6523320000000012 Toronto
29001768280 https://c2.staticflickr.com/9/8165/29001768280_46c77fdf7d.jpg   -79.3787229999999937    43.6510310000000032 Toronto
29211300841 https://c2.staticflickr.com/9/8305/29211300841_ea7a79f3c0.jpg   -79.3793959999999998    43.6526429999999976 Toronto
29173726011 https://c2.staticflickr.com/9/8537/29173726011_6dcc82ef4c.jpg   -79.3793959999999998    43.6526429999999976 Toronto
28827386386 https://c2.staticflickr.com/9/8567/28827386386_283fbc3d53.jpg   -79.3760560000000055    43.6545729999999992 Toronto
28465529630 https://c2.staticflickr.com/9/8837/28465529630_16e917394c.jpg   -79.3787229999999937    43.6510310000000032 Toronto
27978344744 https://c2.staticflickr.com/9/8783/27978344744_ac497038e1.jpg   -79.3793139999999937    43.6528709999999975 Toronto
27978343724 https://c2.staticflickr.com/9/8782/27978343724_e316043712.jpg   -79.3793139999999937    43.6528709999999975 Toronto
27978339224 https://c2.staticflickr.com/9/8700/27978339224_9015c55222.jpg   -79.3793139999999937    43.6528709999999975 Toronto
27798705164 https://c2.staticflickr.com/9/8192/27798705164_41c4f5dd44.jpg   -79.3744310000000013    43.6348249999999993 Toronto
27499134903 https://c2.staticflickr.com/8/7561/27499134903_a0dc63429d.jpg   -79.3895799999999952    43.6460750000000033 Toronto
27812674015 https://c2.staticflickr.com/8/7699/27812674015_3a8f1ac242.jpg   -79.4194669999999974    43.6453220000000002 Toronto
27736984501 https://c2.staticflickr.com/8/7457/27736984501_e6d8aac525.jpg   -79.4194669999999974    43.6453220000000002 Toronto
27228113162 https://c2.staticflickr.com/8/7123/27228113162_5187376948.jpg   -79.3976590000000044    43.665815000000002  Toronto
27228103862 https://c2.staticflickr.com/8/7611/27228103862_0317cc5d6c.jpg   -79.3939359999999965    43.6857419999999976 Toronto
26482914162 https://c2.staticflickr.com/2/1513/26482914162_962a22f6f7.jpg   -79.3858800000000002    43.6416359999999983 Toronto
26399284966 https://c2.staticflickr.com/2/1518/26399284966_4341e8f970.jpg   -79.3851640000000032    43.6419870000000003 Toronto
25138419032 https://c2.staticflickr.com/2/1443/25138419032_ef2794e550.jpg   -79.3981320000000039    43.6393810000000002 Toronto
24928182521 https://c2.staticflickr.com/2/1500/24928182521_5c312d801f.jpg   -79.3955639999999931    43.6625859999999975 Toronto
24390872204 https://c2.staticflickr.com/2/1478/24390872204_989582a36c.jpg   -79.396649999999994 43.6614679999999993 Toronto
24053867649 https://c2.staticflickr.com/2/1497/24053867649_54cfd0a308.jpg   -79.3870000000000005    43.6424999999999983 Toronto
24218045495 https://c2.staticflickr.com/2/1503/24218045495_e49a972269.jpg   -79.3747369999999961    43.6464380000000034 Toronto
23942490081 https://c2.staticflickr.com/6/5671/23942490081_d8af7aa2bf.jpg   -79.3837299999999999    43.6524870000000007 Toronto
22757378143 https://c2.staticflickr.com/6/5828/22757378143_c9b37a4d60.jpg   -79.3312659999999994    43.7333130000000025 Toronto
22862417681 https://c2.staticflickr.com/6/5738/22862417681_ab3d186e12.jpg   -79.3842329999999947    43.6421500000000009 Toronto
21915181866 https://c2.staticflickr.com/6/5761/21915181866_dece738e4b.jpg   -79.3406999999999982    43.7165999999999997 Toronto
21013639444 https://c2.staticflickr.com/1/749/21013639444_93fef2e0d3.jpg    -79.3375470000000007    43.7169680000000014 Toronto
21521925325 https://c2.staticflickr.com/1/608/21521925325_b66737c1a1.jpg    -79.3597409999999996    43.7342190000000031 Toronto
21242139601 https://c2.staticflickr.com/6/5815/21242139601_2ffe3beb98.jpg   -79.3981320000000039    43.6393810000000002 Toronto
20938606056 https://c2.staticflickr.com/6/5748/20938606056_62f083bc11.jpg   -79.3606099999999941    43.6506090000000029 Toronto
20050724844 https://c2.staticflickr.com/1/618/20050724844_450ddabbde.jpg    -79.3763119999999986    43.6409299999999973 Toronto
20050673454 https://c2.staticflickr.com/1/767/20050673454_cd22ca6ddb.jpg    -79.3760750000000002    43.6473050000000029 Toronto
20077852138 https://c2.staticflickr.com/1/474/20077852138_dd02c2b8df.jpg    -79.4125279999999947    43.6649439999999984 Toronto
18719564064 https://c2.staticflickr.com/1/486/18719564064_0fe4dd84d4.jpg    -79.3810739999999981    43.6458980000000025 Toronto
17181859917 https://c2.staticflickr.com/9/8719/17181859917_e526d31463.jpg   -79.4004769999999951    43.6572540000000018 Toronto
17201496938 https://c2.staticflickr.com/9/8753/17201496938_d3b3c6d722.jpg   -79.3797869999999932    43.6463239999999999 Toronto
45200163905 https://c2.staticflickr.com/5/4902/45200163905_39ce1340e1.jpg   -121.956480999999997    36.6111179999999976 Monterey
25608709967 https://c2.staticflickr.com/5/4766/25608709967_7a36910196.jpg   -121.922010999999998    36.6305279999999982 Monterey
37040357970 https://c2.staticflickr.com/5/4439/37040357970_e317ea5ae6.jpg   -121.93365  36.560496999999998  Monterey
35908177136 https://c2.staticflickr.com/5/4293/35908177136_fd14b63d3c.jpg   -121.929895000000002    36.5507750000000016 Monterey
34569995355 https://c2.staticflickr.com/5/4159/34569995355_3795bbd83f.jpg   -121.935539000000006    36.6348830000000021 Monterey
31344580466 https://c2.staticflickr.com/6/5657/31344580466_a2e2364859.jpg   -121.904252999999997    36.606501999999999  Monterey
29413298235 https://c2.staticflickr.com/8/7572/29413298235_f92c770925.jpg   -121.951138 36.5673730000000035 Monterey
27248769515 https://c2.staticflickr.com/8/7327/27248769515_219ba2ee2a.jpg   -121.927964000000003    36.5347719999999967 Monterey
26796952640 https://c2.staticflickr.com/8/7190/26796952640_0f60fda843.jpg   -121.933704000000006    36.6334719999999976 Monterey
21464925886 https://c2.staticflickr.com/1/731/21464925886_c27e58c966.jpg    -121.899353000000005    36.6128410000000031 Monterey
19540026323 https://c2.staticflickr.com/4/3764/19540026323_26e31507af.jpg   -121.929159999999996    36.5463329999999971 Monterey
19468016012 https://c2.staticflickr.com/4/3697/19468016012_c428ed93c7.jpg   -121.926248999999999    36.6352949999999993 Monterey
15694823064 https://c2.staticflickr.com/8/7558/15694823064_e7cd69fbce.jpg   -121.928972000000002    36.538491999999998  Monterey
14413699983 https://c2.staticflickr.com/6/5231/14413699983_f2f14891db.jpg   -121.862319999999997    36.5948619999999991 Monterey
13806831673 https://c2.staticflickr.com/6/5285/13806831673_df2bee7afe.jpg   -121.840880999999996    36.6104970000000023 Monterey
13678183413 https://c2.staticflickr.com/8/7017/13678183413_e03b061e94.jpg   -121.934037000000004    36.6380339999999975 Monterey
12577617045 https://c2.staticflickr.com/8/7396/12577617045_5000e705c9.jpg   -121.929702000000006    36.5532230000000027 Monterey
9571935809  https://c2.staticflickr.com/3/2813/9571935809_bbf1b82538.jpg    -121.949915000000004    36.569113999999999  Monterey
9547812187  https://c2.staticflickr.com/4/3674/9547812187_fb153624c9.jpg    -121.941975999999997    36.5670799999999971 Monterey
8736040095  https://c2.staticflickr.com/8/7283/8736040095_18f725a95b.jpg    -121.919403000000003    36.5526720000000012 Monterey
8418684394  https://c2.staticflickr.com/9/8228/8418684394_6ebf76b810.jpg    -121.900385999999997    36.616221000000003  Monterey
8078960714  https://c2.staticflickr.com/9/8046/8078960714_f12ab61067.jpg    -121.942437999999996    36.5882549999999966 Monterey
7065625955  https://c2.staticflickr.com/6/5343/7065625955_2cbe39ff91.jpg    -121.947114999999997    36.5670420000000007 Monterey
6119221956  https://c2.staticflickr.com/7/6186/6119221956_621636615a.jpg    -121.921976999999998    36.5551359999999974 Monterey
5192802256  https://c2.staticflickr.com/5/4133/5192802256_5a5cd15302.jpg    -121.903780999999995    36.6199709999999996 Monterey
4994044807  https://c2.staticflickr.com/5/4083/4994044807_dcd2ee4c14.jpg    -121.947512000000003    36.5674339999999987 Monterey
4720205313  https://c2.staticflickr.com/2/1154/4720205313_b88b62a794.jpg    -121.947812999999996    36.5670119999999983 Monterey
4610890548  https://c2.staticflickr.com/4/3352/4610890548_15abe0b6ea.jpg    -121.947018999999997    36.5670720000000031 Monterey
3972763552  https://c2.staticflickr.com/3/2430/3972763552_12fc0091bc.jpg    -121.963176000000004    36.5687690000000032 Monterey
3760383166  https://c2.staticflickr.com/3/2455/3760383166_a944860b41.jpg    -121.888041999999999    36.594025000000002  Monterey
3733263235  https://c2.staticflickr.com/3/2625/3733263235_d4a832c0ca.jpg    -121.911355999999998    36.6218739999999983 Monterey
3075556939  https://c2.staticflickr.com/4/3185/3075556939_19416fecd3.jpg    -121.878552999999997    36.5991629999999972 Monterey
2791135201  https://c2.staticflickr.com/4/3210/2791135201_10804d0e6c.jpg    -121.949229000000003    36.5710959999999972 Monterey
2482065707  https://c2.staticflickr.com/3/2266/2482065707_13cd3cfb83.jpg    -121.955027999999999    36.5622720000000001 Monterey
336529159   https://c2.staticflickr.com/1/139/336529159_6b31f11a11.jpg  -121.960644000000002    36.5661500000000004 Monterey
320151234   https://c2.staticflickr.com/1/137/320151234_f5cba36468.jpg  -121.952597999999995    36.5596090000000018 Monterey
47008499402 https://c2.staticflickr.com/8/7884/47008499402_0bb2547695.jpg   -121.920131999999995    36.5428819999999988 Monterey
46976354622 https://c2.staticflickr.com/8/7803/46976354622_f8d97904bc.jpg   -121.920315000000002    36.5429340000000025 Monterey
46294350324 https://c2.staticflickr.com/8/7896/46294350324_410bf167b1.jpg   -121.921730999999994    36.6196950000000001 Monterey
40052487353 https://c2.staticflickr.com/8/7915/40052487353_4a57d81f0b.jpg   -121.919766999999993    36.5427699999999973 Monterey
33129908368 https://c2.staticflickr.com/5/4887/33129908368_a18df0316e.jpg   -121.919573999999997    36.5428309999999996 Monterey
33126279498 https://c2.staticflickr.com/5/4901/33126279498_c5283ce911.jpg   -121.911441999999994    36.6233629999999977 Monterey
46949221412 https://c2.staticflickr.com/8/7896/46949221412_ab35c77882.jpg   -121.933134999999993    36.5522490000000033 Monterey
46994898801 https://c2.staticflickr.com/5/4911/46994898801_94e1dd6c83.jpg   -121.920002999999994    36.5428479999999993 Monterey
33074656578 https://c2.staticflickr.com/5/4844/33074656578_b22b4ef041.jpg   -121.919735000000003    36.5428560000000004 Monterey
46218564124 https://c2.staticflickr.com/5/4911/46218564124_97b2d5898a.jpg   -121.89949  36.6132539999999977 Monterey
39975519733 https://c2.staticflickr.com/5/4833/39975519733_215b601f93.jpg   -121.919820999999999    36.5431489999999997 Monterey
46205226414 https://c2.staticflickr.com/8/7853/46205226414_6ace6efd2a.jpg   -121.944637 36.6151830000000018 Monterey
46856425282 https://c2.staticflickr.com/8/7906/46856425282_e0173a9c87.jpg   -121.914167000000006    36.6236219999999975 Monterey
33008677518 https://c2.staticflickr.com/8/7876/33008677518_80c554f571.jpg   -121.922407000000007    36.6299109999999999 Monterey
39910858513 https://c2.staticflickr.com/5/4820/39910858513_bb69f0251e.jpg   -121.928994000000003    36.5374320000000026 Monterey
45958934435 https://c2.staticflickr.com/8/7910/45958934435_1780244905.jpg   -121.961287999999996    36.5964790000000022 Monterey
45957987565 https://c2.staticflickr.com/8/7805/45957987565_aa4741736d.jpg   -121.901362000000006    36.6208269999999985 Monterey
46820439302 https://c2.staticflickr.com/5/4808/46820439302_b805805d2c.jpg   -121.901362000000006    36.6208269999999985 Monterey
46849689641 https://c2.staticflickr.com/5/4881/46849689641_d12e935aff.jpg   -121.975429000000005    36.5771099999999976 Monterey
46839611651 https://c2.staticflickr.com/8/7894/46839611651_519775488d.jpg   -121.975106999999994    36.577145999999999  Monterey
46780840362 https://c2.staticflickr.com/5/4837/46780840362_04f2dc13f6.jpg   -121.890469999999993    36.6723360000000014 Monterey
46775668932 https://c2.staticflickr.com/8/7834/46775668932_b91bb93fce.jpg   -121.965042999999994    36.5903769999999966 Monterey
31879062557 https://c2.staticflickr.com/8/7826/31879062557_1f02a85242.jpg   -121.930947000000003    36.5555329999999969 Monterey
46803626091 https://c2.staticflickr.com/8/7815/46803626091_36292d8004.jpg   -121.965494000000007    36.5695210000000017 Monterey
46793958581 https://c2.staticflickr.com/8/7901/46793958581_07dbab05f2.jpg   -121.892044999999996    36.6091520000000017 Monterey
39818075513 https://c2.staticflickr.com/5/4868/39818075513_c948dd30b6.jpg   -121.929659000000001    36.546914000000001  Monterey
46725049142 https://c2.staticflickr.com/8/7800/46725049142_448eda6f69.jpg   -121.965494000000007    36.5695210000000017 Monterey
45838542875 https://c2.staticflickr.com/8/7911/45838542875_92483a029d.jpg   -121.965494000000007    36.5695210000000017 Monterey
45811815475 https://c2.staticflickr.com/5/4805/45811815475_9ed15a305f.jpg   -121.932623000000007    36.6365880000000033 Monterey
31781163717 https://c2.staticflickr.com/8/7842/31781163717_a71dac29d7.jpg   -121.936014 36.6369499999999988 Monterey
46722520891 https://c2.staticflickr.com/5/4807/46722520891_963e9c6cb1.jpg   -121.936014 36.6369499999999988 Monterey
45992261344 https://c2.staticflickr.com/8/7844/45992261344_e35677483c.jpg   -121.929733999999996    36.5552739999999972 Monterey
46659847912 https://c2.staticflickr.com/8/7814/46659847912_7f1b358447.jpg   -121.935809000000006    36.6370300000000029 Monterey
31766777277 https://c2.staticflickr.com/8/7915/31766777277_086c5a183b.jpg   -121.932491999999996    36.5448799999999991 Monterey
32827665448 https://c2.staticflickr.com/8/7900/32827665448_4ca26bf7f8.jpg   -121.929873999999998    36.5485690000000005 Monterey
45976990584 https://c2.staticflickr.com/5/4866/45976990584_1ed7481f72.jpg   -121.935809000000006    36.6370300000000029 Monterey
45780762195 https://c2.staticflickr.com/8/7925/45780762195_7c8669d452.jpg   -121.931161000000003    36.5560669999999988 Monterey
39706611063 https://c2.staticflickr.com/8/7857/39706611063_0daf72108b.jpg   -121.935809000000006    36.6370300000000029 Monterey
45927796124 https://c2.staticflickr.com/8/7851/45927796124_6413a782a3.jpg   -121.941462000000001    36.618388000000003  Monterey
45691761975 https://c2.staticflickr.com/8/7865/45691761975_f514329239.jpg   -121.941592999999997    36.6231859999999969 Monterey
46601239091 https://c2.staticflickr.com/8/7801/46601239091_cdac3fd047.jpg   -121.930324999999996    36.5447419999999994 Monterey
45871404174 https://c2.staticflickr.com/5/4829/45871404174_945efb41ae.jpg   -121.929154999999994    36.552418000000003  Monterey
44777149100 https://c2.staticflickr.com/5/4914/44777149100_b50d27b2fa.jpg   -121.965491999999998    36.5695750000000004 Monterey
46593687281 https://c2.staticflickr.com/8/7917/46593687281_99a8ce47f5.jpg   -121.929659000000001    36.546914000000001  Monterey
31650577707 https://c2.staticflickr.com/8/7924/31650577707_c55a8a7a59.jpg   -121.930282000000005    36.5447589999999991 Monterey
32670232918 https://c2.staticflickr.com/5/4918/32670232918_f13b1da714.jpg   -121.931183000000004    36.5451899999999981 Monterey
44717229300 https://c2.staticflickr.com/5/4848/44717229300_0174f927f8.jpg   -121.955911999999998    36.6097719999999995 Monterey
31589975267 https://c2.staticflickr.com/8/7911/31589975267_86e2cd345f.jpg   -121.899876000000006    36.6161299999999983 Monterey
31587678897 https://c2.staticflickr.com/5/4803/31587678897_a370e96502.jpg   -121.930409999999995    36.5445009999999968 Monterey
46466172062 https://c2.staticflickr.com/5/4834/46466172062_2123a864bf.jpg   -121.930818000000002    36.5454319999999981 Monterey
46455712842 https://c2.staticflickr.com/8/7896/46455712842_3f271503b1.jpg   -121.931246999999999    36.5452250000000021 Monterey
46505381591 https://c2.staticflickr.com/8/7883/46505381591_8bb527382e.jpg   -121.929959999999994    36.5487409999999997 Monterey
45780814914 https://c2.staticflickr.com/8/7904/45780814914_278143e6f5.jpg   -121.929917000000003    36.5515680000000032 Monterey
45780813544 https://c2.staticflickr.com/8/7830/45780813544_5dd9354809.jpg   -121.929959999999994    36.5468109999999982 Monterey
31561242187 https://c2.staticflickr.com/5/4841/31561242187_f6925d96cd.jpg   -121.929488000000006    36.5458449999999999 Monterey
45764716134 https://c2.staticflickr.com/5/4857/45764716134_0baa868374.jpg   -121.921892 36.5552920000000015 Monterey
44668582960 https://c2.staticflickr.com/8/7908/44668582960_32530edbb8.jpg   -121.933051000000006    36.5446790000000021 Monterey
46485309091 https://c2.staticflickr.com/5/4864/46485309091_041f345220.jpg   -121.929165999999995    36.5463540000000009 Monterey
46481011491 https://c2.staticflickr.com/8/7835/46481011491_4a2c298f47.jpg   -121.902236000000002    36.6183669999999992 Monterey
44644547450 https://c2.staticflickr.com/8/7882/44644547450_69b0a5c431.jpg   -121.885069999999999    36.6175110000000004 Monterey
31496339627 https://c2.staticflickr.com/5/4892/31496339627_f89fe58597.jpg   -121.930280999999994    36.5443720000000027 Monterey
46384477432 https://c2.staticflickr.com/8/7920/46384477432_ca577c8562.jpg   -121.930346 36.5456730000000007 Monterey
46381729802 https://c2.staticflickr.com/8/7894/46381729802_9d09ba15a5.jpg   -121.930291999999994    36.5443720000000027 Monterey
45508218485 https://c2.staticflickr.com/5/4841/45508218485_3f7ce9549e.jpg   -121.930386999999996    36.5444019999999981 Monterey
44579788760 https://c2.staticflickr.com/5/4808/44579788760_600754be5d.jpg   -121.930306000000002    36.5443410000000029 Monterey
46395138941 https://c2.staticflickr.com/5/4856/46395138941_51344dc36d.jpg   -121.930494999999993    36.5440359999999984 Monterey
45664447854 https://c2.staticflickr.com/5/4918/45664447854_ee6009c878.jpg   -121.941333999999998    36.6193329999999975 Monterey
46333002792 https://c2.staticflickr.com/5/4841/46333002792_7c94a61d62.jpg   -121.930256 36.5443720000000027 Monterey
45660688674 https://c2.staticflickr.com/5/4843/45660688674_b6395f7536.jpg   -121.930509000000001    36.5443110000000004 Monterey
46376088601 https://c2.staticflickr.com/5/4910/46376088601_1318478cd7.jpg   -121.961213000000001    36.600484999999999  Monterey
45653106774 https://c2.staticflickr.com/5/4875/45653106774_eafdd8b236.jpg   -121.961213000000001    36.600484999999999  Monterey
46376088491 https://c2.staticflickr.com/5/4893/46376088491_bbf5253a90.jpg   -121.961213000000001    36.600484999999999  Monterey
45463605655 https://c2.staticflickr.com/5/4865/45463605655_77efa05000.jpg   -121.961213000000001    36.600484999999999  Monterey
45463605405 https://c2.staticflickr.com/5/4856/45463605405_a38244ca3c.jpg   -121.961213000000001    36.600484999999999  Monterey
44559204140 https://c2.staticflickr.com/5/4890/44559204140_bc144a4645.jpg   -121.961213000000001    36.600484999999999  Monterey
44559204000 https://c2.staticflickr.com/5/4828/44559204000_4d45fd54e0.jpg   -121.961213000000001    36.600484999999999  Monterey
32471482188 https://c2.staticflickr.com/5/4835/32471482188_4f5079cebb.jpg   -121.948026999999996    36.611151999999997  Monterey
46341566321 https://c2.staticflickr.com/5/4873/46341566321_1519d7bd85.jpg   -121.917708000000005    36.6210220000000035 Monterey
46325518341 https://c2.staticflickr.com/5/4860/46325518341_b8ca639cf7.jpg   -121.890242000000001    36.614925999999997  Monterey
31386518647 https://c2.staticflickr.com/5/4915/31386518647_eef3292a45.jpg   -121.929615999999996    36.5499140000000011 Monterey
46236386342 https://c2.staticflickr.com/5/4837/46236386342_9a688b557c.jpg   -121.93571  36.6369910000000019 Monterey
45530360424 https://c2.staticflickr.com/5/4827/45530360424_8f3b98055b.jpg   -121.893482000000006    36.6039519999999996 Monterey
45522513004 https://c2.staticflickr.com/5/4808/45522513004_3e1b72ee22.jpg   -121.930389000000005    36.5369499999999974 Monterey
46232262061 https://c2.staticflickr.com/5/4836/46232262061_961daa3ed8.jpg   -121.930027999999993    36.5516939999999977 Monterey
45306104205 https://c2.staticflickr.com/5/4893/45306104205_4b6f8e706a.jpg   -121.975127999999998    36.5767859999999985 Monterey
32321779608 https://c2.staticflickr.com/5/4905/32321779608_611465907c.jpg   -121.959095000000005    36.6060879999999997 Monterey
44347111040 https://c2.staticflickr.com/5/4848/44347111040_f1d6b4b165.jpg   -121.898846000000006    36.6140090000000029 Monterey
46164343741 https://c2.staticflickr.com/5/4890/46164343741_a6a7cf5487.jpg   -121.929186999999999    36.6261679999999998 Monterey
46132809851 https://c2.staticflickr.com/5/4847/46132809851_0b18e203a8.jpg   -121.941592999999997    36.6231859999999969 Monterey
45387080654 https://c2.staticflickr.com/5/4876/45387080654_e9058872b9.jpg   -121.965402999999995    36.5694659999999985 Monterey
45366343474 https://c2.staticflickr.com/5/4899/45366343474_39b1f9410d.jpg   -121.929359000000005    36.5551540000000017 Monterey
32175488558 https://c2.staticflickr.com/5/4826/32175488558_b71604d16d.jpg   -121.902000000000001    36.6185240000000007 Monterey
31097219957 https://c2.staticflickr.com/5/4889/31097219957_d635c19d54.jpg   -121.889472999999995    36.6083130000000025 Monterey
45305570904 https://c2.staticflickr.com/5/4877/45305570904_91727f6c55.jpg   -121.930046000000004    36.5498449999999977 Monterey
31077010917 https://c2.staticflickr.com/5/4904/31077010917_17efc9249f.jpg   -121.962480999999997    36.5940299999999965 Monterey
46014325861 https://c2.staticflickr.com/5/4808/46014325861_6b65ac92a2.jpg   -121.946309999999997    36.6131850000000014 Monterey
45279542234 https://c2.staticflickr.com/5/4913/45279542234_8ca4aedb60.jpg   -121.964986999999994    36.569074999999998  Monterey
45985533291 https://c2.staticflickr.com/5/4866/45985533291_0cf4a8e44c.jpg   -121.941406999999998    36.6183779999999999 Monterey
45931933602 https://c2.staticflickr.com/5/4886/45931933602_285824e740.jpg   -121.929359000000005    36.5503959999999992 Monterey
45974093311 https://c2.staticflickr.com/5/4811/45974093311_bd3dbd8728.jpg   -121.948414 36.6098270000000028 Monterey
45059913155 https://c2.staticflickr.com/5/4863/45059913155_0a1136dd5d.jpg   -121.929359000000005    36.5551540000000017 Monterey
45921122521 https://c2.staticflickr.com/5/4880/45921122521_48b093f4a2.jpg   -121.889313999999999    36.6039519999999996 Monterey
45192334614 https://c2.staticflickr.com/5/4905/45192334614_bfeaf89753.jpg   -121.917815000000004    36.5463629999999995 Monterey
32026170588 https://c2.staticflickr.com/5/4824/32026170588_ed648b2694.jpg   -121.924423000000004    36.5544280000000015 Monterey
31991235408 https://c2.staticflickr.com/5/4915/31991235408_abcbd88747.jpg   -121.89434  36.6039519999999996 Monterey
44040370960 https://c2.staticflickr.com/5/4882/44040370960_4760050513.jpg   -121.891786999999994    36.6060370000000006 Monterey
45839326481 https://c2.staticflickr.com/5/4858/45839326481_49d9c4d28e.jpg   -121.901383999999993    36.6176379999999995 Monterey
45830828631 https://c2.staticflickr.com/5/4880/45830828631_da2761307c.jpg   -121.915514000000002    36.6267939999999967 Monterey
31943619398 https://c2.staticflickr.com/5/4918/31943619398_15a161b288.jpg   -121.964913999999993    36.5907559999999989 Monterey
44817566795 https://c2.staticflickr.com/2/1914/44817566795_b98afdaa67.jpg   -121.921150999999995    36.5551669999999973 Monterey
30746839337 https://c2.staticflickr.com/5/4918/30746839337_031977fb6a.jpg   -121.889533 36.6070530000000005 Monterey
44740145425 https://c2.staticflickr.com/2/1923/44740145425_df29cd4460.jpg   -121.889791000000002    36.6058820000000011 Monterey
30702637457 https://c2.staticflickr.com/2/1921/30702637457_8da6e09b86.jpg   -121.841492000000002    36.6017190000000028 Monterey
44918470524 https://c2.staticflickr.com/2/1929/44918470524_bbcec89073.jpg   -121.959743000000003    36.566943000000002  Monterey
30661211007 https://c2.staticflickr.com/2/1925/30661211007_4850c09b2c.jpg   -121.955590999999998    36.5629670000000004 Monterey
44874761434 https://c2.staticflickr.com/2/1951/44874761434_cf9396b996.jpg   -121.961287999999996    36.5964790000000022 Monterey
44673627265 https://c2.staticflickr.com/2/1980/44673627265_86160f2276.jpg   -121.941074999999998    36.6227950000000035 Monterey
44665483455 https://c2.staticflickr.com/2/1906/44665483455_95c87ca5a2.jpg   -121.915475999999998    36.6268069999999994 Monterey
45535476811 https://c2.staticflickr.com/2/1938/45535476811_25e0dddfa7.jpg   -121.902064999999993    36.6184209999999979 Monterey
30587651067 https://c2.staticflickr.com/2/1980/30587651067_ef686f73c3.jpg   -121.902064999999993    36.6184209999999979 Monterey
44791540314 https://c2.staticflickr.com/2/1962/44791540314_c8ae2861d2.jpg   -121.902064999999993    36.6184209999999979 Monterey
44590422735 https://c2.staticflickr.com/2/1971/44590422735_497d067ca9.jpg   -121.902064999999993    36.6184209999999979 Monterey
45431020202 https://c2.staticflickr.com/2/1934/45431020202_88040ae942.jpg   -121.902064999999993    36.6184209999999979 Monterey
44746842474 https://c2.staticflickr.com/2/1949/44746842474_01acfdbcdd.jpg   -121.902064999999993    36.6184209999999979 Monterey
30520078347 https://c2.staticflickr.com/2/1969/30520078347_4e73ae859e.jpg   -121.902064999999993    36.6184209999999979 Monterey
44702649644 https://c2.staticflickr.com/2/1969/44702649644_d4a525d545.jpg   -121.967123999999998    36.5844159999999974 Monterey
44476575555 https://c2.staticflickr.com/2/1927/44476575555_c226de9bdd.jpg   -121.915197000000006    36.624330999999998  Monterey
31513826178 https://c2.staticflickr.com/2/1927/31513826178_44cf2af88d.jpg   -121.902000000000001    36.6184889999999967 Monterey
45296533142 https://c2.staticflickr.com/2/1935/45296533142_9fc3c710b5.jpg   -121.937899000000002    36.6343669999999975 Monterey
31314332268 https://c2.staticflickr.com/2/1938/31314332268_53aae66fd5.jpg   -121.894630000000006    36.6002920000000032 Monterey
44439076314 https://c2.staticflickr.com/2/1936/44439076314_9d68b99269.jpg   -121.939773000000002    36.6232430000000022 Monterey
31282248278 https://c2.staticflickr.com/2/1971/31282248278_7816bafe7e.jpg   -121.938489000000004    36.619055000000003  Monterey
45123171511 https://c2.staticflickr.com/2/1912/45123171511_f739b56ba2.jpg   -121.929136999999997    36.5458629999999971 Monterey
30166158347 https://c2.staticflickr.com/2/1903/30166158347_5bc0417f7f.jpg   -121.965149999999994    36.5685969999999969 Monterey
45034727522 https://c2.staticflickr.com/2/1915/45034727522_99e8516ea4.jpg   -121.909070999999997    36.6196520000000021 Monterey
44353035254 https://c2.staticflickr.com/2/1903/44353035254_5deebf21ea.jpg   -121.911226999999997    36.6170430000000025 Monterey
31116268718 https://c2.staticflickr.com/2/1922/31116268718_5c81c473dd.jpg   -121.902000000000001    36.6184889999999967 Monterey
44063583905 https://c2.staticflickr.com/2/1929/44063583905_d48b245dba.jpg   -121.940002000000007    36.5671630000000007 Monterey
44906339462 https://c2.staticflickr.com/2/1934/44906339462_8c89294c6c.jpg   -121.948026999999996    36.611151999999997  Monterey
31057217688 https://c2.staticflickr.com/2/1912/31057217688_a5f002e713.jpg   -121.955278000000007    36.5625 Monterey
44880028822 https://c2.staticflickr.com/2/1934/44880028822_be618fa068.jpg   -121.965556000000007    36.5694439999999972 Monterey
44906083641 https://c2.staticflickr.com/2/1980/44906083641_a5a2c767d8.jpg   -121.905670000000001    36.6164089999999973 Monterey
29952372237 https://c2.staticflickr.com/2/1936/29952372237_b06813fa5e.jpg   -121.844145999999995    36.6459440000000001 Monterey
44831626562 https://c2.staticflickr.com/2/1961/44831626562_b413f2b8d4.jpg   -121.940002000000007    36.5671630000000007 Monterey
43926215745 https://c2.staticflickr.com/2/1879/43926215745_bca9f03086.jpg   -121.892752000000002    36.6052609999999987 Monterey
43926213835 https://c2.staticflickr.com/2/1898/43926213835_4e4c62ee1b.jpg   -121.892752000000002    36.6052609999999987 Monterey
43926211775 https://c2.staticflickr.com/2/1977/43926211775_edaaa572e2.jpg   -121.892752000000002    36.6052609999999987 Monterey
43926209225 https://c2.staticflickr.com/2/1918/43926209225_f5e53d1593.jpg   -121.892752000000002    36.6052609999999987 Monterey
30964953578 https://c2.staticflickr.com/2/1888/30964953578_b27259d6b1.jpg   -121.892752000000002    36.6052609999999987 Monterey
44098466534 https://c2.staticflickr.com/2/1870/44098466534_5b9528cd5a.jpg   -121.919521000000003    36.5430179999999964 Monterey
44098461924 https://c2.staticflickr.com/2/1881/44098461924_27f36bbe7d.jpg   -121.919521000000003    36.5430179999999964 Monterey
44098459534 https://c2.staticflickr.com/2/1906/44098459534_b8755f2283.jpg   -121.919521000000003    36.5430179999999964 Monterey
44769045722 https://c2.staticflickr.com/2/1886/44769045722_c60f449a17.jpg   -121.919521000000003    36.5430179999999964 Monterey
42975250390 https://c2.staticflickr.com/2/1880/42975250390_192dbefb32.jpg   -121.905670000000001    36.6164089999999973 Monterey
44062273974 https://c2.staticflickr.com/2/1862/44062273974_dcea0de003.jpg   -121.920045999999999    36.5541109999999989 Monterey
43871971145 https://c2.staticflickr.com/2/1871/43871971145_450a29121e.jpg   -121.920045999999999    36.5541109999999989 Monterey
30909270688 https://c2.staticflickr.com/2/1897/30909270688_d34aac32f7.jpg   -121.919809999999998    36.6217109999999977 Monterey
44060726454 https://c2.staticflickr.com/2/1871/44060726454_1eed3cdc8c.jpg   -121.919809999999998    36.6217109999999977 Monterey
29839075997 https://c2.staticflickr.com/2/1900/29839075997_a3d98c3692.jpg   -121.928801000000007    36.5517749999999992 Monterey
44052613104 https://c2.staticflickr.com/2/1884/44052613104_36208bbab6.jpg   -121.950901999999999    36.5681829999999977 Monterey
44034573274 https://c2.staticflickr.com/2/1883/44034573274_ce6fe380f9.jpg   -121.940002000000007    36.5671630000000007 Monterey
43838006875 https://c2.staticflickr.com/2/1850/43838006875_41eb43f12b.jpg   -121.940002000000007    36.5671630000000007 Monterey
42934000490 https://c2.staticflickr.com/2/1857/42934000490_7ce586962e.jpg   -121.929359000000005    36.5377769999999984 Monterey
28708214747 https://c2.staticflickr.com/1/862/28708214747_f2872a696a.jpg    -122.467346000000006    37.7667789999999997 San Francisco
42803834984 https://c2.staticflickr.com/2/1767/42803834984_5d8f50ef37.jpg   -122.473633000000007    37.756179000000003  San Francisco
29524630418 https://c2.staticflickr.com/1/925/29524630418_8990a81cbd.jpg    -122.393703000000002    37.783214000000001  San Francisco
42342841685 https://c2.staticflickr.com/1/844/42342841685_97abe96956.jpg    -122.388531999999998    37.7900479999999988 San Francisco
42501899194 https://c2.staticflickr.com/2/1821/42501899194_05c2efe985.jpg   -122.408869999999993    37.7812550000000016 San Francisco
43203533601 https://c2.staticflickr.com/2/1785/43203533601_134d856f5b.jpg   -122.419569999999993    37.8020860000000027 San Francisco
43147190362 https://c2.staticflickr.com/2/1821/43147190362_7427ff1304.jpg   -122.454192000000006    37.8049139999999966 San Francisco
42282505735 https://c2.staticflickr.com/1/847/42282505735_d6f91df866.jpg    -122.406255999999999    37.7941080000000014 San Francisco
42422861604 https://c2.staticflickr.com/2/1782/42422861604_b2163e8144.jpg   -122.405096999999998    37.790619999999997  San Francisco
41272455850 https://c2.staticflickr.com/1/917/41272455850_78c7907a09.jpg    -122.390941999999995    37.7927269999999993 San Francisco
42050573995 https://c2.staticflickr.com/1/888/42050573995_ea66e6ebb6.jpg    -122.420139000000006    37.7785920000000033 San Francisco
42887073122 https://c2.staticflickr.com/2/1812/42887073122_0e9c89b432.jpg   -122.481505999999996    37.8278049999999979 San Francisco
42181593384 https://c2.staticflickr.com/2/1765/42181593384_a3f37b4764.jpg   -122.421626000000003    37.8263809999999978 San Francisco
41983655585 https://c2.staticflickr.com/2/1784/41983655585_e679b9645c.jpg   -122.413649000000007    37.7981619999999978 San Francisco
41965488115 https://c2.staticflickr.com/2/1732/41965488115_98d1c7ccef.jpg   -122.433287000000007    37.7761330000000015 San Francisco
42678228362 https://c2.staticflickr.com/2/1752/42678228362_278c9c6d64.jpg   -122.420321000000001    37.8054599999999965 San Francisco
28818524048 https://c2.staticflickr.com/2/1748/28818524048_403e7ed3c5.jpg   -122.398617000000002    37.7915449999999993 San Francisco
42683016661 https://c2.staticflickr.com/2/1759/42683016661_bf78803453.jpg   -122.409881999999996    37.7871990000000011 San Francisco
42569698412 https://c2.staticflickr.com/2/1747/42569698412_929cdd79bc.jpg   -122.481542000000005    37.8278880000000015 San Francisco
27645511237 https://c2.staticflickr.com/2/1759/27645511237_9a2c54b37e.jpg   -122.406277000000003    37.803289999999997  San Francisco
41550674545 https://c2.staticflickr.com/2/1732/41550674545_ec5e0a6de7.jpg   -122.476046999999994    37.7687510000000017 San Francisco
42387371082 https://c2.staticflickr.com/2/1723/42387371082_7761057bdd.jpg   -122.476776000000001    37.770583000000002  San Francisco
40613980890 https://c2.staticflickr.com/2/1744/40613980890_835b5301c5.jpg   -122.508716000000007    37.7858420000000024 San Francisco
40582214930 https://c2.staticflickr.com/2/1737/40582214930_70fdc035fd.jpg   -122.392373000000006    37.7950000000000017 San Francisco
28503379138 https://c2.staticflickr.com/2/1742/28503379138_e700be2181.jpg   -122.393101999999999    37.7937739999999991 San Francisco
28403547848 https://c2.staticflickr.com/1/978/28403547848_e682cc1e7b.jpg    -122.476487000000006    37.7679759999999973 San Francisco
40469425110 https://c2.staticflickr.com/1/959/40469425110_78817b88fe.jpg    -122.420080999999996    37.8269299999999973 San Francisco
27399301897 https://c2.staticflickr.com/1/894/27399301897_d19c6532c1.jpg    -122.448098000000002    37.8068170000000023 San Francisco
41488968054 https://c2.staticflickr.com/1/951/41488968054_a6d0aaa0fd.jpg    -122.472592000000006    37.766613999999997  San Francisco
42143715212 https://c2.staticflickr.com/1/976/42143715212_bbce8496d5.jpg    -122.427295000000001    37.8061179999999979 San Francisco
28309859408 https://c2.staticflickr.com/1/966/28309859408_b99ed9f00a.jpg    -122.414820000000006    37.7710719999999966 San Francisco
28276364538 https://c2.staticflickr.com/1/956/28276364538_3db27d8c7e.jpg    -122.367112000000006    37.8083079999999967 San Francisco
42101077732 https://c2.staticflickr.com/1/824/42101077732_198c34679c.jpg    -122.412059999999997    37.7887169999999983 San Francisco
42095885151 https://c2.staticflickr.com/1/905/42095885151_0d03fbb9ec.jpg    -122.369585000000001    37.8092410000000001 San Francisco
41183968155 https://c2.staticflickr.com/1/954/41183968155_9cb1ec9ff1.jpg    -122.448730999999995    37.8066469999999981 San Francisco
28191342648 https://c2.staticflickr.com/1/964/28191342648_77e0b863e5.jpg    -122.362976000000003    37.8152079999999984 San Francisco
42048419351 https://c2.staticflickr.com/1/910/42048419351_b46242cd60.jpg    -122.476411999999996    37.8107630000000015 San Francisco
41123487375 https://c2.staticflickr.com/1/970/41123487375_4389962e5b.jpg    -122.476282999999995    37.8108140000000006 San Francisco
40153367200 https://c2.staticflickr.com/1/910/40153367200_9f17ab9a92.jpg    -122.364303000000007    37.8089829999999978 San Francisco
27069489217 https://c2.staticflickr.com/1/958/27069489217_3553a5cdbe.jpg    -122.435760000000002    37.7735369999999975 San Francisco
27043457917 https://c2.staticflickr.com/1/965/27043457917_548b2152e4.jpg    -122.493094999999997    37.7877250000000018 San Francisco
40996917735 https://c2.staticflickr.com/1/977/40996917735_1c16c055de.jpg    -122.428432000000001    37.806244999999997  San Francisco
41823502062 https://c2.staticflickr.com/1/955/41823502062_de26d733ed.jpg    -122.426254 37.7898950000000013 San Francisco
26958641777 https://c2.staticflickr.com/1/961/26958641777_c1816801de.jpg    -122.412328000000002    37.7922179999999983 San Francisco
26958641157 https://c2.staticflickr.com/1/978/26958641157_b40e544c18.jpg    -122.412853999999996    37.7921169999999975 San Francisco
39985517870 https://c2.staticflickr.com/1/980/39985517870_3149516fda.jpg    -122.412413999999998    37.8077830000000006 San Francisco
41072420884 https://c2.staticflickr.com/1/866/41072420884_5da629ccbe.jpg    -122.405822000000001    37.8027420000000021 San Francisco
27904629198 https://c2.staticflickr.com/1/968/27904629198_03ba5a57ca.jpg    -122.418766000000005    37.8175880000000006 San Francisco
40840393465 https://c2.staticflickr.com/1/825/40840393465_6f74545b2e.jpg    -122.475273999999999    37.8318020000000033 San Francisco
26864389327 https://c2.staticflickr.com/1/950/26864389327_22e0cb221e.jpg    -122.413325999999998    37.7525750000000002 San Francisco
41681262302 https://c2.staticflickr.com/1/863/41681262302_da3749db06.jpg    -122.392005999999995    37.7930360000000007 San Francisco
40914080524 https://c2.staticflickr.com/1/843/40914080524_d21a9b0350.jpg    -122.396277999999995    37.7989329999999981 San Francisco
26756351277 https://c2.staticflickr.com/1/874/26756351277_92eef223cd.jpg    -122.399551000000002    37.7932849999999974 San Francisco
41582975291 https://c2.staticflickr.com/1/874/41582975291_d4d1708978.jpg    -122.409839000000005    37.8087749999999971 San Francisco
41532543562 https://c2.staticflickr.com/1/836/41532543562_c916a27a12.jpg    -122.393714000000003    37.7975509999999986 San Francisco
27647833918 https://c2.staticflickr.com/1/840/27647833918_57109224c3.jpg    -122.474554999999995    37.7664529999999985 San Francisco
39644621420 https://c2.staticflickr.com/1/895/39644621420_dafb17cf56.jpg    -122.476100000000002    37.7661050000000031 San Francisco
39609006900 https://c2.staticflickr.com/1/866/39609006900_02cc82dfd0.jpg    -122.455457999999993    37.7927740000000014 San Francisco
39403743610 https://c2.staticflickr.com/1/792/39403743610_e19d9a39f8.jpg    -122.391594999999995    37.7927499999999981 San Francisco
40272770015 https://c2.staticflickr.com/1/796/40272770015_f5ab1aaa9d.jpg    -122.472162999999995    37.766682000000003  San Francisco
41111908481 https://c2.staticflickr.com/1/893/41111908481_b8db176c87.jpg    -122.481505999999996    37.8278049999999979 San Francisco
39129518880 https://c2.staticflickr.com/1/803/39129518880_ba674567c7.jpg    -122.410911999999996    37.791913000000001  San Francisco
40153135984 https://c2.staticflickr.com/5/4773/40153135984_2f1f0a9ed9.jpg   -122.395038 37.7949649999999977 San Francisco
38998782430 https://c2.staticflickr.com/5/4774/38998782430_8b2d7685c5.jpg   -122.473247000000001    37.809038000000001  San Francisco
40700571051 https://c2.staticflickr.com/5/4788/40700571051_05936fc8fd.jpg   -122.402287000000001    37.7959549999999993 San Francisco
42668020555 https://c2.staticflickr.com/1/942/42668020555_a4fc294e9d.jpg    -122.405075999999994    37.7300630000000012 San Francisco
41994832741 https://c2.staticflickr.com/1/960/41994832741_224f69d0e1.jpg    -122.405868999999996    37.7925070000000005 San Francisco
41953669811 https://c2.staticflickr.com/1/827/41953669811_1aeb585d9a.jpg    -122.407650000000004    37.792422000000002  San Francisco
28030572588 https://c2.staticflickr.com/1/974/28030572588_cc27348eb2.jpg    -122.474770000000007    37.7674579999999978 San Francisco
40828291815 https://c2.staticflickr.com/1/831/40828291815_25bbcb7e0c.jpg    -122.404967999999997    37.7851179999999971 San Francisco
40420710265 https://c2.staticflickr.com/1/794/40420710265_bdf9e462a7.jpg    -122.436581000000004    37.7481179999999981 San Francisco
41055934392 https://c2.staticflickr.com/1/819/41055934392_cde7db5daf.jpg    -122.506270000000001    37.7848100000000002 San Francisco
40700570891 https://c2.staticflickr.com/5/4771/40700570891_917859d172.jpg   -122.405204999999995    37.7961590000000029 San Francisco
38882655130 https://c2.staticflickr.com/5/4801/38882655130_fdf37a6140.jpg   -122.405403000000007    37.7860980000000026 San Francisco
26884105317 https://c2.staticflickr.com/1/904/26884105317_32f80cf292.jpg    -122.478289000000004    37.8080539999999985 San Francisco
41020926764 https://c2.staticflickr.com/1/980/41020926764_574460ee79.jpg    -122.413036000000005    37.7919219999999996 San Francisco
26859006867 https://c2.staticflickr.com/1/832/26859006867_734fc60462.jpg    -122.397049999999993    37.7934559999999991 San Francisco
40736994905 https://c2.staticflickr.com/1/927/40736994905_d1104a421e.jpg    -122.416756000000007    37.7521690000000021 San Francisco
26756352027 https://c2.staticflickr.com/1/912/26756352027_41abe721ed.jpg    -122.396277999999995    37.7989329999999981 San Francisco
26756349347 https://c2.staticflickr.com/1/878/26756349347_0e42865129.jpg    -122.448398999999995    37.8033750000000026 San Francisco
41542161752 https://c2.staticflickr.com/1/820/41542161752_7e9b9cd3a6.jpg    -122.426833999999999    37.7739710000000031 San Francisco
39710812800 https://c2.staticflickr.com/1/886/39710812800_5a8b6b7499.jpg    -122.416255000000007    37.7803309999999968 San Francisco
40761302574 https://c2.staticflickr.com/1/783/40761302574_d97dc65faa.jpg    -122.479920000000007    37.8028329999999997 San Francisco
41447291901 https://c2.staticflickr.com/1/883/41447291901_b813e3897f.jpg    -122.477001999999999    37.8058839999999989 San Francisco
39495489730 https://c2.staticflickr.com/1/794/39495489730_e805d63dd9.jpg    -122.421790999999999    37.8263359999999977 San Francisco
27315587988 https://c2.staticflickr.com/1/790/27315587988_0d17a09ce0.jpg    -122.371987000000004    37.8162499999999966 San Francisco
26242455467 https://c2.staticflickr.com/1/880/26242455467_935be9ed25.jpg    -122.414902999999995    37.8034269999999992 San Francisco
40979582701 https://c2.staticflickr.com/5/4782/40979582701_6b66f1c1fa.jpg   -122.400497999999999    37.7859359999999995 San Francisco
40911842551 https://c2.staticflickr.com/5/4778/40911842551_290165b994.jpg   -122.433507000000006    37.7410020000000017 San Francisco
40832797041 https://c2.staticflickr.com/1/788/40832797041_0e69e0a922.jpg    -122.405792000000005    37.7881080000000011 San Francisco
26846583138 https://c2.staticflickr.com/5/4791/26846583138_3a9c6450bf.jpg   -122.402028999999999    37.7944630000000004 San Francisco
38882656510 https://c2.staticflickr.com/5/4798/38882656510_0c86bcc7b7.jpg   -122.405403000000007    37.7860980000000026 San Francisco
28660176087 https://c2.staticflickr.com/1/857/28660176087_25937e5228.jpg    -122.481505999999996    37.8278049999999979 San Francisco
41254833364 https://c2.staticflickr.com/1/970/41254833364_01c195c81a.jpg    -122.477001999999999    37.8106310000000008 San Francisco
41893482032 https://c2.staticflickr.com/1/948/41893482032_c4637bc738.jpg    -122.404786000000001    37.7867839999999973 San Francisco
41020927554 https://c2.staticflickr.com/1/981/41020927554_1664a9930d.jpg    -122.412853999999996    37.7921169999999975 San Francisco
41577763301 https://c2.staticflickr.com/1/815/41577763301_4cde47a7c9.jpg    -122.426833999999999    37.7739710000000031 San Francisco
39331632430 https://c2.staticflickr.com/1/870/39331632430_831c0bd115.jpg    -122.391718999999995    37.793334999999999  San Francisco
40105560004 https://c2.staticflickr.com/1/789/40105560004_ceffe0e345.jpg    -122.417049000000006    37.7997470000000035 San Francisco
46818665642 https://c2.staticflickr.com/5/4900/46818665642_871c536808.jpg   116.431512999999995 39.949421000000001  Beijing
30888665477 https://c2.staticflickr.com/5/4816/30888665477_01e61b490b.jpg   116.367187000000001 39.9202689999999976 Beijing
45016558454 https://c2.staticflickr.com/5/4884/45016558454_36487263f2.jpg   116.367187000000001 39.9202689999999976 Beijing
45736772381 https://c2.staticflickr.com/2/1936/45736772381_2e9cce7393.jpg   116.404995  39.9106250000000031 Beijing
45736676531 https://c2.staticflickr.com/2/1919/45736676531_eb364088c9.jpg   116.404995  39.9106250000000031 Beijing
45736635321 https://c2.staticflickr.com/5/4861/45736635321_45b3f9df22.jpg   116.404995  39.9106250000000031 Beijing
45584175531 https://c2.staticflickr.com/2/1924/45584175531_dc9545ba16.jpg   116.387485999999996 39.9453770000000006 Beijing
45515670022 https://c2.staticflickr.com/2/1937/45515670022_860183da14.jpg   116.387443000000005 39.9474659999999986 Beijing
45566037871 https://c2.staticflickr.com/2/1979/45566037871_8e5a53e973.jpg   116.387443000000005 39.9474659999999986 Beijing
44450181055 https://c2.staticflickr.com/2/1940/44450181055_876a47103e.jpg   116.380920000000003 39.9062240000000017 Beijing
44392264784 https://c2.staticflickr.com/2/1930/44392264784_f736767b00.jpg   116.382293000000004 39.8992009999999979 Beijing
44299965684 https://c2.staticflickr.com/2/1902/44299965684_f4be55136b.jpg   116.390704999999997 39.915891000000002  Beijing
44988186771 https://c2.staticflickr.com/2/1946/44988186771_8f02f355a9.jpg   116.367187000000001 39.9244819999999976 Beijing
44269239614 https://c2.staticflickr.com/2/1914/44269239614_00025c5f69.jpg   116.367187000000001 39.9244819999999976 Beijing
30052470007 https://c2.staticflickr.com/2/1922/30052470007_6638e29c3b.jpg   116.367187000000001 39.9244819999999976 Beijing
31095387308 https://c2.staticflickr.com/2/1978/31095387308_924c8380c0.jpg   116.407897000000006 39.9108799999999988 Beijing
44244477524 https://c2.staticflickr.com/2/1907/44244477524_738f97406e.jpg   116.400402999999997 39.8787850000000006 Beijing
44023475805 https://c2.staticflickr.com/2/1904/44023475805_dea66cd5e2.jpg   116.397398999999993 39.9350120000000004 Beijing
44886316572 https://c2.staticflickr.com/2/1936/44886316572_36be2b3118.jpg   116.356200999999999 39.9307999999999979 Beijing
44886313692 https://c2.staticflickr.com/2/1949/44886313692_2aec20d6b3.jpg   116.367187000000001 39.9244819999999976 Beijing
43029431320 https://c2.staticflickr.com/2/1875/43029431320_307d88218c.jpg   116.410300000000007 39.9474050000000034 Beijing
44803752701 https://c2.staticflickr.com/2/1881/44803752701_53d1a8f975.jpg   116.426946999999998 39.9191829999999968 Beijing
44067335074 https://c2.staticflickr.com/2/1852/44067335074_fee37b2e33.jpg   116.382293000000004 39.8992009999999979 Beijing
44716758702 https://c2.staticflickr.com/2/1870/44716758702_eeae968b37.jpg   116.382293000000004 39.8992009999999979 Beijing
43856731215 https://c2.staticflickr.com/2/1858/43856731215_3440b042fb.jpg   116.382293000000004 39.8992009999999979 Beijing
44004545584 https://c2.staticflickr.com/2/1873/44004545584_eb12814c6b.jpg   116.458445999999995 39.9478209999999976 Beijing
43781679805 https://c2.staticflickr.com/2/1893/43781679805_e38b31174d.jpg   116.382293000000004 39.8992009999999979 Beijing
29686497027 https://c2.staticflickr.com/2/1873/29686497027_4922b89456.jpg   116.391639999999995 39.8972520000000017 Beijing
30754744158 https://c2.staticflickr.com/2/1882/30754744158_971f2cd99a.jpg   116.391639999999995 39.8972520000000017 Beijing
29615950937 https://c2.staticflickr.com/2/1883/29615950937_08b8b26b01.jpg   116.382293000000004 39.8992009999999979 Beijing
44474879852 https://c2.staticflickr.com/2/1864/44474879852_72d9c50a60.jpg   116.390775000000005 39.9137130000000013 Beijing
44502388491 https://c2.staticflickr.com/2/1860/44502388491_ac6b175cd7.jpg   116.389724999999999 39.9192019999999985 Beijing
42693495630 https://c2.staticflickr.com/2/1885/42693495630_932fac4939.jpg   116.388796999999997 39.9166799999999995 Beijing
44488095651 https://c2.staticflickr.com/2/1857/44488095651_6ce40358ca.jpg   116.390726999999998 39.922269   Beijing
43482994035 https://c2.staticflickr.com/2/1866/43482994035_76dec780fd.jpg   116.397435999999999 39.9113520000000008 Beijing
44367571531 https://c2.staticflickr.com/2/1874/44367571531_6e3db279ca.jpg   116.382293000000004 39.8992009999999979 Beijing
29347641217 https://c2.staticflickr.com/2/1850/29347641217_7ea035300e.jpg   116.382293000000004 39.8992009999999979 Beijing
43348891685 https://c2.staticflickr.com/2/1880/43348891685_84e3c323e6.jpg   116.406063000000003 39.9101610000000022 Beijing
43468176124 https://c2.staticflickr.com/2/1882/43468176124_1eca492165.jpg   116.358474999999999 39.9236920000000026 Beijing
44171455231 https://c2.staticflickr.com/2/1866/44171455231_984c3f8131.jpg   116.382293000000004 39.8992009999999979 Beijing
44171455381 https://c2.staticflickr.com/2/1898/44171455381_a4cb5f4d5d.jpg   116.382293000000004 39.8992009999999979 Beijing
44096767402 https://c2.staticflickr.com/2/1870/44096767402_c50ed3849d.jpg   116.428470000000004 39.9063289999999995 Beijing
44057175902 https://c2.staticflickr.com/2/1845/44057175902_7d61792fd9.jpg   116.426911000000004 39.9200050000000033 Beijing
29168107677 https://c2.staticflickr.com/2/1861/29168107677_06d6b062cd.jpg   116.426361  39.9200019999999967 Beijing
44001332802 https://c2.staticflickr.com/2/1774/44001332802_ea2618cc88.jpg   116.408354000000003 39.9076909999999998 Beijing
42174976440 https://c2.staticflickr.com/2/1772/42174976440_48706e1f7b.jpg   116.313344000000001 39.9396130000000014 Beijing
43959524211 https://c2.staticflickr.com/1/857/43959524211_584687212b.jpg    116.390898000000007 39.9140480000000011 Beijing
43805989281 https://c2.staticflickr.com/1/928/43805989281_ed8a37f56a.jpg    116.390253999999999 39.9235600000000019 Beijing
29869039118 https://c2.staticflickr.com/2/1836/29869039118_065cd5b10c.jpg   116.382249999999999 39.9254359999999977 Beijing
42795815175 https://c2.staticflickr.com/1/931/42795815175_d16db595fe.jpg    116.390703000000002 39.9167070000000024 Beijing
29798519208 https://c2.staticflickr.com/1/928/29798519208_a554b3747a.jpg    116.38946   39.9395529999999965 Beijing
43659465941 https://c2.staticflickr.com/1/914/43659465941_184b9bf7fc.jpg    116.390501999999998 39.9214199999999977 Beijing
43659464911 https://c2.staticflickr.com/1/858/43659464911_21b2bfbabb.jpg    116.405662000000007 39.8822199999999967 Beijing
43439043461 https://c2.staticflickr.com/2/1830/43439043461_6ee2186652.jpg   116.396713000000005 39.9086819999999989 Beijing
41597161060 https://c2.staticflickr.com/2/1785/41597161060_ff6ea9c53a.jpg   116.384139000000005 39.8964519999999965 Beijing
41589360170 https://c2.staticflickr.com/2/1805/41589360170_8526e9c547.jpg   116.389245000000003 39.9176360000000017 Beijing
43310260261 https://c2.staticflickr.com/1/917/43310260261_21f1f4449e.jpg    116.407011999999995 39.9452780000000018 Beijing
41468697560 https://c2.staticflickr.com/1/835/41468697560_84c2de2867.jpg    116.387078000000002 39.9376609999999985 Beijing
42343346105 https://c2.staticflickr.com/1/916/42343346105_cb06f707b8.jpg    116.367187000000001 39.9202689999999976 Beijing
43227145861 https://c2.staticflickr.com/2/1802/43227145861_5acd0d41b4.jpg   116.386542000000006 39.8936700000000002 Beijing
42498376504 https://c2.staticflickr.com/2/1827/42498376504_24dd91b578.jpg   116.383236999999994 39.9261979999999994 Beijing
43140056432 https://c2.staticflickr.com/2/1769/43140056432_2ff4ed39eb.jpg   116.390029999999996 39.8971019999999967 Beijing
43160607181 https://c2.staticflickr.com/2/1770/43160607181_18ca072661.jpg   116.407612999999998 39.9467259999999982 Beijing
41328959980 https://c2.staticflickr.com/2/1807/41328959980_547379a058.jpg   116.388536999999999 39.9393400000000014 Beijing
43074833882 https://c2.staticflickr.com/1/918/43074833882_9c96967346.jpg    116.427353999999994 39.9066339999999968 Beijing
42217807665 https://c2.staticflickr.com/1/927/42217807665_78489939df.jpg    116.390082000000007 39.9238300000000024 Beijing
42216806065 https://c2.staticflickr.com/2/1829/42216806065_87c2dcbfec.jpg   116.402893000000006 39.9251840000000016 Beijing
41310081190 https://c2.staticflickr.com/2/1825/41310081190_9320bb0fef.jpg   116.402893000000006 39.9251840000000016 Beijing
43121365081 https://c2.staticflickr.com/2/1789/43121365081_0d1f61a414.jpg   116.402893000000006 39.9251840000000016 Beijing
43935143010 https://c2.staticflickr.com/5/4916/43935143010_59a5867142.jpg   116.390984000000003 39.9139490000000023 Beijing
31865982718 https://c2.staticflickr.com/5/4881/31865982718_c220f3eb4d.jpg   116.416347000000002 39.8765289999999979 Beijing
44820475095 https://c2.staticflickr.com/2/1929/44820475095_ec683eed45.jpg   116.367187000000001 39.9202689999999976 Beijing
44759520065 https://c2.staticflickr.com/5/4805/44759520065_db6aacc202.jpg   116.389160000000004 39.9177019999999985 Beijing
44758589775 https://c2.staticflickr.com/2/1947/44758589775_61ca8bd1be.jpg   116.385169000000005 39.9035679999999999 Beijing
44915220584 https://c2.staticflickr.com/2/1977/44915220584_90101de184.jpg   116.386499000000001 39.8906729999999996 Beijing
44685009125 https://c2.staticflickr.com/2/1961/44685009125_ac78364aa0.jpg   116.336974999999995 39.9613319999999987 Beijing
44483241125 https://c2.staticflickr.com/2/1951/44483241125_ceedd3bffe.jpg   116.390124999999998 39.9188040000000015 Beijing
44244337805 https://c2.staticflickr.com/2/1959/44244337805_681809053f.jpg   116.411689999999993 39.9069870000000009 Beijing
44242216325 https://c2.staticflickr.com/2/1961/44242216325_81a22c4137.jpg   116.406626000000003 39.8804159999999968 Beijing
30128230297 https://c2.staticflickr.com/2/1934/30128230297_dcae843ff4.jpg   116.373281000000006 39.9485030000000023 Beijing
30063201947 https://c2.staticflickr.com/2/1916/30063201947_88dd798a24.jpg   116.314025000000001 39.9397269999999978 Beijing
44939722192 https://c2.staticflickr.com/2/1962/44939722192_c8b7f1d6f9.jpg   116.367187000000001 39.9244819999999976 Beijing
44988180171 https://c2.staticflickr.com/2/1917/44988180171_457d8aac09.jpg   116.367187000000001 39.9244819999999976 Beijing
44076981045 https://c2.staticflickr.com/2/1942/44076981045_71b48d46c6.jpg   116.367187000000001 39.9244819999999976 Beijing
29686336907 https://c2.staticflickr.com/2/1848/29686336907_38ac35532e.jpg   116.391639999999995 39.8972520000000017 Beijing
42693530740 https://c2.staticflickr.com/2/1891/42693530740_16fe209ff7.jpg   116.389694000000006 39.9174799999999976 Beijing
29564837757 https://c2.staticflickr.com/2/1880/29564837757_e76d90981e.jpg   116.389919000000006 39.9164269999999988 Beijing
44361186531 https://c2.staticflickr.com/2/1868/44361186531_cd2fb2be27.jpg   116.393065000000007 39.9187879999999993 Beijing
28861726017 https://c2.staticflickr.com/1/862/28861726017_ea406d872c.jpg    116.353969000000006 39.9069709999999986 Beijing
41988978750 https://c2.staticflickr.com/1/933/41988978750_d914823de6.jpg    116.353969000000006 39.9069709999999986 Beijing
28630255337 https://c2.staticflickr.com/1/853/28630255337_f8a0ddf78e.jpg    116.422079999999994 39.9039300000000026 Beijing
43467056501 https://c2.staticflickr.com/1/845/43467056501_c448f24f34.jpg    116.396713000000005 39.9086819999999989 Beijing
43410517622 https://c2.staticflickr.com/2/1810/43410517622_66cd82b830.jpg   116.313351999999995 39.9396109999999993 Beijing
43203962342 https://c2.staticflickr.com/2/1769/43203962342_08d07464d4.jpg   116.372251000000006 39.9146730000000005 Beijing
43194281712 https://c2.staticflickr.com/1/847/43194281712_5a86eca02b.jpg    116.392849999999996 39.9191500000000019 Beijing
42278131945 https://c2.staticflickr.com/2/1782/42278131945_a205307871.jpg   116.389600000000002 39.9385720000000006 Beijing
41311020570 https://c2.staticflickr.com/2/1801/41311020570_37b8c41ee1.jpg   116.390317999999994 39.9236330000000024 Beijing
28252152647 https://c2.staticflickr.com/2/1764/28252152647_c426b494ec.jpg   116.402893000000006 39.9251840000000016 Beijing
41310135880 https://c2.staticflickr.com/1/921/41310135880_221db0c144.jpg    116.402893000000006 39.9251840000000016 Beijing
29249566038 https://c2.staticflickr.com/2/1763/29249566038_574b8fb192.jpg   116.402893000000006 39.9251840000000016 Beijing
42216789325 https://c2.staticflickr.com/1/924/42216789325_e3fea8f737.jpg    116.402893000000006 39.9251840000000016 Beijing
40127437773 https://c2.staticflickr.com/8/7808/40127437773_d51d76c9b1.jpg   121.496319  31.2397169999999988 Shanghai
46167752855 https://c2.staticflickr.com/8/7810/46167752855_2ed5529efc.jpg   121.498346999999995 31.2388000000000012 Shanghai
33184501068 https://c2.staticflickr.com/8/7903/33184501068_0b00bdef38.jpg   121.498947999999999 31.2389189999999992 Shanghai
46996271902 https://c2.staticflickr.com/8/7921/46996271902_bb4a2b8635.jpg   121.500978000000003 31.2359490000000015 Shanghai
46311440494 https://c2.staticflickr.com/8/7892/46311440494_2bbbf24fc5.jpg   121.432944000000006 31.1907010000000007 Shanghai
47025874201 https://c2.staticflickr.com/5/4811/47025874201_2114e3b4ae.jpg   121.502831999999998 31.2346719999999998 Shanghai
32071925187 https://c2.staticflickr.com/8/7864/32071925187_02acf99b3a.jpg   121.487052000000006 31.2366549999999989 Shanghai
32040322597 https://c2.staticflickr.com/8/7804/32040322597_3a14c98098.jpg   121.474006000000003 31.2375720000000001 Shanghai
33044110748 https://c2.staticflickr.com/5/4911/33044110748_0ca7ac9fcf.jpg   121.496213999999995 31.2354440000000011 Shanghai
46841354962 https://c2.staticflickr.com/8/7869/46841354962_6ecf18b29f.jpg   121.504165999999998 31.2375000000000007 Shanghai
46148032774 https://c2.staticflickr.com/5/4883/46148032774_3567d51043.jpg   121.487759999999994 31.2375359999999986 Shanghai
39905912533 https://c2.staticflickr.com/5/4832/39905912533_789bc88406.jpg   121.502281999999994 31.2374310000000008 Shanghai
46785647692 https://c2.staticflickr.com/5/4803/46785647692_02f473eb69.jpg   121.499516999999997 31.2018430000000002 Shanghai
45921904515 https://c2.staticflickr.com/5/4817/45921904515_c084acfe2b.jpg   121.477374999999995 31.2481760000000008 Shanghai
32960654668 https://c2.staticflickr.com/5/4911/32960654668_22dcdc2315.jpg   121.493325999999996 31.2424509999999991 Shanghai
45911605495 https://c2.staticflickr.com/8/7817/45911605495_22049b519d.jpg   121.479949000000005 31.260943000000001  Shanghai
45905679535 https://c2.staticflickr.com/5/4912/45905679535_91dc0808f6.jpg   121.487052000000006 31.2366549999999989 Shanghai
39849983163 https://c2.staticflickr.com/8/7908/39849983163_ef81dc061e.jpg   121.498722999999998 31.2395800000000001 Shanghai
46798311161 https://c2.staticflickr.com/8/7884/46798311161_b9b49f752f.jpg   121.488791000000006 31.2341130000000007 Shanghai
46048898524 https://c2.staticflickr.com/8/7856/46048898524_8ee13da662.jpg   121.497630999999998 31.2387100000000011 Shanghai
46048898074 https://c2.staticflickr.com/5/4827/46048898074_5f40eee80c.jpg   121.497630999999998 31.2387100000000011 Shanghai
31824596447 https://c2.staticflickr.com/8/7884/31824596447_a9ebb9549f.jpg   121.501374999999996 31.2372009999999989 Shanghai
31820567657 https://c2.staticflickr.com/8/7851/31820567657_63bacf1c77.jpg   121.459350000000001 31.2769849999999998 Shanghai
32886103958 https://c2.staticflickr.com/8/7851/32886103958_b480349b64.jpg   121.508358999999999 31.2381230000000016 Shanghai
46755070521 https://c2.staticflickr.com/5/4906/46755070521_a739a5beee.jpg   121.471152000000004 31.233747000000001  Shanghai
31799898887 https://c2.staticflickr.com/5/4918/31799898887_84326cc2d3.jpg   121.492309000000006 31.2641719999999985 Shanghai
39763939883 https://c2.staticflickr.com/5/4844/39763939883_b83f7d86ec.jpg   121.474456000000004 31.2474430000000005 Shanghai
45801947575 https://c2.staticflickr.com/5/4847/45801947575_72e849d5af.jpg   121.495238000000001 31.2415990000000008 Shanghai
45787391765 https://c2.staticflickr.com/5/4917/45787391765_92cfe8fba1.jpg   121.502094  31.2379029999999993 Shanghai
31750667397 https://c2.staticflickr.com/5/4840/31750667397_7582b2675e.jpg   121.486129000000005 31.2339400000000005 Shanghai
46686558851 https://c2.staticflickr.com/8/7886/46686558851_85a48f9aa3.jpg   121.482996  31.2287660000000002 Shanghai
46686545861 https://c2.staticflickr.com/5/4811/46686545861_95d5629140.jpg   121.485270999999997 31.225242999999999  Shanghai
39680720153 https://c2.staticflickr.com/8/7872/39680720153_8c6bc068bf.jpg   121.487223999999998 31.244250000000001  Shanghai
45828899694 https://c2.staticflickr.com/5/4897/45828899694_2953263674.jpg   121.498346999999995 31.2388000000000012 Shanghai
44732493350 https://c2.staticflickr.com/5/4810/44732493350_e1925c5d5d.jpg   121.486064999999996 31.2393150000000013 Shanghai
46523614481 https://c2.staticflickr.com/8/7861/46523614481_f82e1df77a.jpg   121.49588   31.2404140000000012 Shanghai
32616105798 https://c2.staticflickr.com/8/7830/32616105798_3f17d8bed5.jpg   121.499003999999999 31.2392879999999984 Shanghai
44643157120 https://c2.staticflickr.com/8/7921/44643157120_55d8d4695e.jpg   121.501294000000001 31.2370720000000013 Shanghai
46413667841 https://c2.staticflickr.com/5/4859/46413667841_01ed2f65c9.jpg   121.495621999999997 31.235396999999999  Shanghai
32536846268 https://c2.staticflickr.com/5/4835/32536846268_c08f15c0f9.jpg   121.493832999999995 31.2344550000000005 Shanghai
31468440537 https://c2.staticflickr.com/5/4805/31468440537_730f1ef0b2.jpg   121.502094  31.2379029999999993 Shanghai
45678087844 https://c2.staticflickr.com/5/4855/45678087844_ba272d5764.jpg   121.494418999999994 31.2349800000000002 Shanghai
31457356287 https://c2.staticflickr.com/5/4889/31457356287_5d1b4f706d.jpg   121.486268999999993 31.2438830000000003 Shanghai
46388892941 https://c2.staticflickr.com/5/4867/46388892941_b090070796.jpg   121.486472000000006 31.242877   Shanghai
45660642184 https://c2.staticflickr.com/5/4852/45660642184_f87470482d.jpg   121.486727000000002 31.2438469999999988 Shanghai
32510898138 https://c2.staticflickr.com/5/4901/32510898138_7d4e408807.jpg   121.472009999999997 31.238747   Shanghai
44558933830 https://c2.staticflickr.com/5/4884/44558933830_53cb8a1612.jpg   121.486560999999995 31.2427859999999988 Shanghai
44554202210 https://c2.staticflickr.com/5/4814/44554202210_ae674a423c.jpg   121.486422000000005 31.2425859999999993 Shanghai
32490391488 https://c2.staticflickr.com/5/4868/32490391488_cc25a40077.jpg   121.486976999999996 31.243780000000001  Shanghai
32484738168 https://c2.staticflickr.com/5/4906/32484738168_5210e52441.jpg   121.487919000000005 31.2294300000000007 Shanghai
45435294535 https://c2.staticflickr.com/5/4814/45435294535_03a635f295.jpg   121.487635999999995 31.2290910000000004 Shanghai
31401386077 https://c2.staticflickr.com/5/4828/31401386077_65f311bacf.jpg   121.487404999999995 31.2292489999999994 Shanghai
31389483867 https://c2.staticflickr.com/5/4895/31389483867_6f6afbf00b.jpg   121.504669000000007 31.2709210000000013 Shanghai
32453371708 https://c2.staticflickr.com/5/4836/32453371708_f722ddfdb5.jpg   121.486424  31.2384099999999982 Shanghai
45403812995 https://c2.staticflickr.com/5/4868/45403812995_be9fbe3f3b.jpg   121.492996000000005 31.2421590000000009 Shanghai
32442002618 https://c2.staticflickr.com/5/4844/32442002618_30319659f7.jpg   121.502094  31.2379029999999993 Shanghai
31346795017 https://c2.staticflickr.com/5/4918/31346795017_6fbceba2f1.jpg   121.498745999999997 31.2395169999999993 Shanghai
32405241788 https://c2.staticflickr.com/5/4847/32405241788_0c4718d589.jpg   121.501159999999999 31.2373429999999992 Shanghai
32354797618 https://c2.staticflickr.com/5/4810/32354797618_b0ce995dba.jpg   121.502094  31.2379029999999993 Shanghai
45503117964 https://c2.staticflickr.com/5/4837/45503117964_349f275de4.jpg   121.485764000000003 31.2448009999999989 Shanghai
45493688424 https://c2.staticflickr.com/5/4867/45493688424_826967a486.jpg   121.502094  31.2379029999999993 Shanghai
31265828637 https://c2.staticflickr.com/5/4890/31265828637_c23431d8d4.jpg   121.502094  31.2379029999999993 Shanghai
46124864672 https://c2.staticflickr.com/5/4895/46124864672_0f67bd6151.jpg   121.498489000000006 31.2324130000000011 Shanghai
46092092932 https://c2.staticflickr.com/5/4872/46092092932_b0075ee37e.jpg   121.486104999999995 31.2415020000000005 Shanghai
44307007240 https://c2.staticflickr.com/5/4838/44307007240_6d409771db.jpg   121.500344999999996 31.2419030000000006 Shanghai
32236797698 https://c2.staticflickr.com/5/4829/32236797698_dcbde92d82.jpg   121.495999999999995 31.2494240000000012 Shanghai
46058100592 https://c2.staticflickr.com/5/4908/46058100592_186d894173.jpg   121.493768000000003 31.2455010000000009 Shanghai
44290407820 https://c2.staticflickr.com/5/4865/44290407820_58472daf8b.jpg   121.460723000000002 31.2550740000000005 Shanghai
46054427132 https://c2.staticflickr.com/5/4820/46054427132_652ba8e0a3.jpg   121.486575000000002 31.2428020000000011 Shanghai
44283123730 https://c2.staticflickr.com/5/4909/44283123730_f6c93e551f.jpg   121.495076999999995 31.2370219999999996 Shanghai
45375296934 https://c2.staticflickr.com/5/4907/45375296934_b25c527f44.jpg   121.499047000000004 31.2354629999999993 Shanghai
46022477151 https://c2.staticflickr.com/5/4827/46022477151_d52a7e1eff.jpg   121.483296999999993 31.2506710000000005 Shanghai
45233541684 https://c2.staticflickr.com/5/4830/45233541684_c6ccf6120a.jpg   121.488231999999996 31.2287290000000013 Shanghai
45957806971 https://c2.staticflickr.com/5/4861/45957806971_7fbba65ef8.jpg   121.487739000000005 31.2356279999999984 Shanghai
45233540694 https://c2.staticflickr.com/5/4869/45233540694_e6b7847ecc.jpg   121.501020999999994 31.2373709999999996 Shanghai
45949640161 https://c2.staticflickr.com/5/4894/45949640161_5f2a93acf0.jpg   121.481119000000007 31.2379759999999997 Shanghai
44055715370 https://c2.staticflickr.com/5/4809/44055715370_42e730693a.jpg   121.495023000000003 31.2417830000000016 Shanghai
30922295587 https://c2.staticflickr.com/2/1975/30922295587_ef73b44388.jpg   121.473684000000006 31.2342329999999997 Shanghai
44038505310 https://c2.staticflickr.com/5/4872/44038505310_2fec322e27.jpg   121.497287  31.216819000000001  Shanghai
31926805848 https://c2.staticflickr.com/5/4888/31926805848_b6ea7676e0.jpg   121.476516000000004 31.2290959999999984 Shanghai
44768279865 https://c2.staticflickr.com/5/4900/44768279865_0699bab381.jpg   121.472009999999997 31.238747   Shanghai
45582023062 https://c2.staticflickr.com/2/1945/45582023062_3c65ed5b6e.jpg   121.437376999999998 31.2644650000000013 Shanghai
45631526181 https://c2.staticflickr.com/2/1923/45631526181_8347be0b3f.jpg   121.437376999999998 31.2644650000000013 Shanghai
43803749460 https://c2.staticflickr.com/2/1906/43803749460_e44d127cbf.jpg   121.503294999999994 31.235517999999999  Shanghai
44884463324 https://c2.staticflickr.com/2/1909/44884463324_551c565b5c.jpg   121.482168999999999 31.2457829999999994 Shanghai
45606057961 https://c2.staticflickr.com/2/1964/45606057961_468f85c813.jpg   121.508874000000006 31.2381959999999985 Shanghai
30663853477 https://c2.staticflickr.com/2/1934/30663853477_c8c8e054e3.jpg   121.430510999999996 31.2122139999999995 Shanghai
44879529314 https://c2.staticflickr.com/2/1970/44879529314_c8f0bba864.jpg   121.482545999999999 31.2461030000000015 Shanghai
44862972794 https://c2.staticflickr.com/2/1921/44862972794_1b9407dca5.jpg   121.492137  31.2472220000000007 Shanghai
44671408295 https://c2.staticflickr.com/2/1913/44671408295_7c057c1b91.jpg   121.437376999999998 31.2644650000000013 Shanghai
44671070465 https://c2.staticflickr.com/2/1946/44671070465_593c36c4f7.jpg   121.485956999999999 31.2432470000000002 Shanghai
44858622194 https://c2.staticflickr.com/2/1976/44858622194_c812283c27.jpg   121.464843000000002 31.2304169999999992 Shanghai
30592127087 https://c2.staticflickr.com/2/1980/30592127087_c0f2a8def8.jpg   121.472138999999999 31.2245820000000016 Shanghai
45532744071 https://c2.staticflickr.com/2/1902/45532744071_a5ef82c139.jpg   121.472138999999999 31.2245820000000016 Shanghai
31655893348 https://c2.staticflickr.com/2/1925/31655893348_aefe38aca0.jpg   121.486238  31.2427330000000012 Shanghai
31641715148 https://c2.staticflickr.com/2/1950/31641715148_d8e8ba8fc9.jpg   121.472138999999999 31.2245820000000016 Shanghai
45513771671 https://c2.staticflickr.com/2/1956/45513771671_aab8fedd38.jpg   121.472138999999999 31.2245820000000016 Shanghai
30570843767 https://c2.staticflickr.com/2/1953/30570843767_340f238d9b.jpg   121.472138999999999 31.2245820000000016 Shanghai
45412953872 https://c2.staticflickr.com/2/1954/45412953872_41d35d24f8.jpg   121.486129000000005 31.2489099999999986 Shanghai
31589399978 https://c2.staticflickr.com/2/1936/31589399978_e0d46aba09.jpg   121.511534999999995 31.2374620000000007 Shanghai
31573822588 https://c2.staticflickr.com/2/1972/31573822588_0bb0b175aa.jpg   121.485613999999998 31.2452040000000011 Shanghai
45444747851 https://c2.staticflickr.com/2/1929/45444747851_382195fd57.jpg   121.486129000000005 31.2489099999999986 Shanghai
44719887844 https://c2.staticflickr.com/2/1964/44719887844_ab4c88788e.jpg   121.472138999999999 31.2245820000000016 Shanghai
45444459211 https://c2.staticflickr.com/2/1952/45444459211_fb60bc7662.jpg   121.472138999999999 31.2245820000000016 Shanghai
43627112230 https://c2.staticflickr.com/2/1956/43627112230_4d5d973f27.jpg   121.472138999999999 31.2245820000000016 Shanghai
44716722924 https://c2.staticflickr.com/2/1909/44716722924_831b45b0fb.jpg   121.440094999999999 31.2167649999999988 Shanghai
45428486721 https://c2.staticflickr.com/2/1933/45428486721_62bba9d453.jpg   121.486129000000005 31.2489099999999986 Shanghai
43606650150 https://c2.staticflickr.com/2/1940/43606650150_a453508232.jpg   121.485699999999994 31.2446379999999984 Shanghai
45392396221 https://c2.staticflickr.com/2/1958/45392396221_0b18ec268f.jpg   121.495777000000004 31.2387170000000012 Shanghai
44469756705 https://c2.staticflickr.com/2/1928/44469756705_b82d26b14e.jpg   121.472138999999999 31.2245820000000016 Shanghai
45383790081 https://c2.staticflickr.com/2/1973/45383790081_ccc8a9d1d8.jpg   121.472138999999999 31.2245820000000016 Shanghai
44469754485 https://c2.staticflickr.com/2/1919/44469754485_daed2b1f65.jpg   121.472138999999999 31.2245820000000016 Shanghai
31452086828 https://c2.staticflickr.com/2/1912/31452086828_999089796f.jpg   121.439952000000005 31.1968700000000005 Shanghai
30371162607 https://c2.staticflickr.com/2/1934/30371162607_9fb1827e42.jpg   121.472138999999999 31.2245820000000016 Shanghai
43495166230 https://c2.staticflickr.com/2/1936/43495166230_c7282d89b7.jpg   121.472138999999999 31.2245820000000016 Shanghai
30371158357 https://c2.staticflickr.com/2/1952/30371158357_5ab451a124.jpg   121.472138999999999 31.2245820000000016 Shanghai
44587923444 https://c2.staticflickr.com/2/1918/44587923444_3d9715cc15.jpg   121.472138999999999 31.2245820000000016 Shanghai
44374647405 https://c2.staticflickr.com/2/1980/44374647405_8dd291d6b2.jpg   121.442526999999998 31.2198479999999989 Shanghai
44352549475 https://c2.staticflickr.com/2/1973/44352549475_2232fd1374.jpg   121.439480000000003 31.1959710000000001 Shanghai
45211101882 https://c2.staticflickr.com/2/1947/45211101882_d0641b023a.jpg   121.503101999999998 31.2365269999999988 Shanghai
45194425702 https://c2.staticflickr.com/2/1962/45194425702_d1999979f6.jpg   121.472138999999999 31.2245820000000016 Shanghai
44468756684 https://c2.staticflickr.com/2/1970/44468756684_80e362e426.jpg   121.510591000000005 31.2370219999999996 Shanghai
43363195230 https://c2.staticflickr.com/2/1967/43363195230_a7d550ace5.jpg   121.472138999999999 31.2245820000000016 Shanghai
30235031507 https://c2.staticflickr.com/2/1936/30235031507_ebd0bd85f6.jpg   121.470336000000003 31.24803    Shanghai
30227219817 https://c2.staticflickr.com/2/1956/30227219817_a1b22cb555.jpg   121.486193999999998 31.2393430000000016 Shanghai
44436764834 https://c2.staticflickr.com/2/1970/44436764834_67c5319ee8.jpg   121.470336000000003 31.24803    Shanghai
44237550995 https://c2.staticflickr.com/2/1925/44237550995_a0b084a37f.jpg   121.439040000000006 31.1958330000000004 Shanghai
43331510720 https://c2.staticflickr.com/2/1912/43331510720_38d8aa400d.jpg   121.487759999999994 31.2292330000000007 Shanghai
44416709604 https://c2.staticflickr.com/2/1917/44416709604_74c8ed63c6.jpg   121.470336000000003 31.24803    Shanghai
44409443374 https://c2.staticflickr.com/2/1902/44409443374_33de8688a0.jpg   121.440382  31.1977510000000002 Shanghai
31251400258 https://c2.staticflickr.com/2/1933/31251400258_23fed6599b.jpg   121.486965999999995 31.2370039999999989 Shanghai
43302480850 https://c2.staticflickr.com/2/1902/43302480850_276a56d29f.jpg   121.501450000000006 31.2372790000000009 Shanghai
44395526854 https://c2.staticflickr.com/2/1961/44395526854_42edf904c2.jpg   121.472138999999999 31.2245820000000016 Shanghai
44395523554 https://c2.staticflickr.com/2/1908/44395523554_1ae70d126a.jpg   121.472138999999999 31.2245820000000016 Shanghai
43285255110 https://c2.staticflickr.com/2/1901/43285255110_47dfbfaae6.jpg   121.470336000000003 31.24803    Shanghai
30161034377 https://c2.staticflickr.com/2/1936/30161034377_9036ea2e5e.jpg   121.470336000000003 31.24803    Shanghai
45025766152 https://c2.staticflickr.com/2/1913/45025766152_b28d693395.jpg   121.472138999999999 31.2245820000000016 Shanghai
44157907105 https://c2.staticflickr.com/2/1946/44157907105_ff7aa0d8d4.jpg   121.485657000000003 31.2397099999999988 Shanghai
30131655837 https://c2.staticflickr.com/2/1942/30131655837_72f0c586a3.jpg   121.442914000000002 31.2203620000000015 Shanghai
30084756087 https://c2.staticflickr.com/2/1924/30084756087_7e94b2e1e1.jpg   121.439222999999998 31.1964299999999994 Shanghai
30061743417 https://c2.staticflickr.com/2/1957/30061743417_a043a1de4b.jpg   121.438579000000004 31.2211689999999997 Shanghai
44077031515 https://c2.staticflickr.com/2/1931/44077031515_24a405c6da.jpg   121.459350000000001 31.2832450000000009 Shanghai
30041503287 https://c2.staticflickr.com/2/1908/30041503287_ebe9bb0c76.jpg   121.442892000000001 31.2205270000000006 Shanghai
44927962482 https://c2.staticflickr.com/2/1969/44927962482_096564fdea.jpg   121.489097000000001 31.2340659999999986 Shanghai
30031230437 https://c2.staticflickr.com/2/1961/30031230437_776a299519.jpg   121.472138999999999 31.2245820000000016 Shanghai
44909873322 https://c2.staticflickr.com/2/1953/44909873322_a7619a5709.jpg   121.472138999999999 31.2245820000000016 Shanghai
31055522888 https://c2.staticflickr.com/2/1912/31055522888_b550082a14.jpg   121.472138999999999 31.2245820000000016 Shanghai
31049514528 https://c2.staticflickr.com/2/1938/31049514528_32a065e1f3.jpg   121.438579000000004 31.1960629999999988 Shanghai
31030561038 https://c2.staticflickr.com/2/1914/31030561038_0c9d4ab4e0.jpg   121.472138999999999 31.2245820000000016 Shanghai
44183620384 https://c2.staticflickr.com/2/1923/44183620384_4422838102.jpg   121.472138999999999 31.2245820000000016 Shanghai
43087100720 https://c2.staticflickr.com/2/1967/43087100720_4d72889979.jpg   121.472138999999999 31.2245820000000016 Shanghai
44178883814 https://c2.staticflickr.com/2/1936/44178883814_fd40f1e786.jpg   121.472138999999999 31.2245820000000016 Shanghai
44896362851 https://c2.staticflickr.com/2/1919/44896362851_c08c69bb5a.jpg   121.467161000000004 31.2124710000000007 Shanghai
44831429242 https://c2.staticflickr.com/2/1918/44831429242_e7df83dfa1.jpg   121.470336000000003 31.24803    Shanghai
44880600891 https://c2.staticflickr.com/2/1909/44880600891_fc7080d595.jpg   121.496086000000005 31.2409849999999985 Shanghai
43966707765 https://c2.staticflickr.com/2/1926/43966707765_29439fcf40.jpg   121.439062000000007 31.1958979999999997 Shanghai
30996937418 https://c2.staticflickr.com/2/1943/30996937418_e5f6f61d83.jpg   121.459177999999994 31.2395010000000006 Shanghai
44141599644 https://c2.staticflickr.com/2/1875/44141599644_fbf589ed56.jpg   121.472138999999999 31.2245820000000016 Shanghai
43051176600 https://c2.staticflickr.com/2/1856/43051176600_1ec252896b.jpg   121.472138999999999 31.2245820000000016 Shanghai
30990063028 https://c2.staticflickr.com/2/1964/30990063028_f0e21702f4.jpg   121.472138999999999 31.2245820000000016 Shanghai
44775532252 https://c2.staticflickr.com/2/1938/44775532252_fba5ba30ae.jpg   121.423987999999994 31.2497170000000004 Shanghai
44774108052 https://c2.staticflickr.com/2/1855/44774108052_3c47a50aed.jpg   121.472009999999997 31.238747   Shanghai
44803587991 https://c2.staticflickr.com/2/1880/44803587991_ac65e3b9b7.jpg   121.470336000000003 31.24803    Shanghai
43887954135 https://c2.staticflickr.com/2/1880/43887954135_a01976d84f.jpg   121.438601000000006 31.1955950000000009 Shanghai
44030523164 https://c2.staticflickr.com/2/1895/44030523164_01052796ce.jpg   121.445102000000006 31.2204349999999984 Shanghai
30871240978 https://c2.staticflickr.com/2/1887/30871240978_f1beda5088.jpg   121.485099000000005 31.2423789999999997 Shanghai
29773720697 https://c2.staticflickr.com/2/1893/29773720697_7651c1dce1.jpg   121.470336000000003 31.24803    Shanghai
30802762428 https://c2.staticflickr.com/2/1864/30802762428_551d66ee15.jpg   121.449393999999998 31.2089840000000009 Shanghai
42859099090 https://c2.staticflickr.com/2/1883/42859099090_161047566d.jpg   121.444072000000006 31.2210220000000014 Shanghai
42826121490 https://c2.staticflickr.com/2/1853/42826121490_2904280b1e.jpg   121.476860000000002 31.2399090000000008 Shanghai
44542291002 https://c2.staticflickr.com/2/1844/44542291002_2f22f9fa1a.jpg   121.478576000000004 31.2691599999999994 Shanghai
43677656245 https://c2.staticflickr.com/2/1882/43677656245_d5ec853d46.jpg   121.476057999999995 31.2344609999999996 Shanghai
44537189002 https://c2.staticflickr.com/2/1876/44537189002_9b012b4458.jpg   121.476057999999995 31.2344609999999996 Shanghai
30701239018 https://c2.staticflickr.com/2/1851/30701239018_227e01d4ec.jpg   121.480164000000002 31.236574000000001  Shanghai
30701235248 https://c2.staticflickr.com/2/1899/30701235248_ddf5b2ccb5.jpg   121.480485999999999 31.2366290000000006 Shanghai
42753837180 https://c2.staticflickr.com/2/1849/42753837180_51370f19e7.jpg   121.486001000000002 31.2419760000000011 Shanghai
29622968657 https://c2.staticflickr.com/2/1866/29622968657_fa48bec783.jpg   121.480636000000004 31.2343210000000013 Shanghai
44552139561 https://c2.staticflickr.com/2/1865/44552139561_6353fe27bc.jpg   121.501450000000006 31.2372790000000009 Shanghai
44543255371 https://c2.staticflickr.com/2/1846/44543255371_ac1910f3ed.jpg   121.497287  31.216819000000001  Shanghai
30661206188 https://c2.staticflickr.com/2/1850/30661206188_328a2d7684.jpg   121.483553999999998 31.2454609999999988 Shanghai
44451035381 https://c2.staticflickr.com/2/1858/44451035381_baa95828d2.jpg   121.470336000000003 31.24803    Shanghai
44364907982 https://c2.staticflickr.com/2/1849/44364907982_0e2c8bbd0d.jpg   121.510591000000005 31.2370219999999996 Shanghai
44378111011 https://c2.staticflickr.com/2/1863/44378111011_8d45c3e5b4.jpg   121.461299999999994 31.2346840000000014 Shanghai
43453761755 https://c2.staticflickr.com/2/1863/43453761755_b3ab8e3490.jpg   121.502566000000002 31.2374809999999989 Shanghai
30367906408 https://c2.staticflickr.com/2/1856/30367906408_c6ebc2573c.jpg   121.482051999999996 31.2342089999999999 Shanghai
44058039152 https://c2.staticflickr.com/2/1877/44058039152_b4805a4b8f.jpg   121.481408000000002 31.2340990000000005 Shanghai
43358522314 https://c2.staticflickr.com/2/1839/43358522314_449903d3d3.jpg   121.490799999999993 31.2396379999999994 Shanghai
42131963560 https://c2.staticflickr.com/1/933/42131963560_502780763a.jpg    121.452836000000005 31.2179879999999983 Shanghai
42997362985 https://c2.staticflickr.com/2/1832/42997362985_a3ebfedba4.jpg   121.500033999999999 31.2418650000000007 Shanghai
28965135977 https://c2.staticflickr.com/1/933/28965135977_0e77667dc4.jpg    121.411756999999994 31.2266000000000012 Shanghai
43816063602 https://c2.staticflickr.com/1/939/43816063602_7a58c9fae5.jpg    121.486129000000005 31.2433329999999998 Shanghai
42010552750 https://c2.staticflickr.com/2/1791/42010552750_a927fc40e7.jpg   121.485613999999998 31.240397999999999  Shanghai
42914735895 https://c2.staticflickr.com/2/1812/42914735895_e4ed4c4f25.jpg   121.504379  31.2356279999999984 Shanghai
42914031325 https://c2.staticflickr.com/2/1778/42914031325_2aa8eef240.jpg   121.488596999999999 31.2468189999999986 Shanghai
43732430651 https://c2.staticflickr.com/1/848/43732430651_8603fbca6e.jpg    121.486064999999996 31.2393150000000013 Shanghai
43579031992 https://c2.staticflickr.com/1/856/43579031992_f374168751.jpg    121.479562999999999 31.1870319999999985 Shanghai
42887317164 https://c2.staticflickr.com/1/855/42887317164_43b1689279.jpg    121.480206999999993 31.185416   Shanghai
28717317567 https://c2.staticflickr.com/1/835/28717317567_3f55f015e4.jpg    121.495742000000007 31.2404709999999994 Shanghai
42834092634 https://c2.staticflickr.com/2/1803/42834092634_6518e0b5c8.jpg   121.488446999999994 31.2470390000000009 Shanghai
29605111678 https://c2.staticflickr.com/1/847/29605111678_a17afffd4a.jpg    121.500635000000003 31.2348940000000006 Shanghai
32088309477 https://c2.staticflickr.com/8/7923/32088309477_95cda0c45c.jpg   2.36759599999999981 48.840797000000002  Paris
46083501835 https://c2.staticflickr.com/5/4900/46083501835_52dba0bda1.jpg   2.39338799999999985 48.8896930000000012 Paris
46059809115 https://c2.staticflickr.com/5/4864/46059809115_9ca9bc163b.jpg   2.39428900000000011 48.8903139999999965 Paris
46953936561 https://c2.staticflickr.com/8/7801/46953936561_d955291f9c.jpg   2.33081799999999983 48.8549450000000007 Paris
46016795845 https://c2.staticflickr.com/8/7907/46016795845_a908144b59.jpg   2.37723100000000009 48.8326050000000009 Paris
33021785358 https://c2.staticflickr.com/5/4827/33021785358_35962781dd.jpg   2.37461300000000008 48.8339610000000022 Paris
46873355491 https://c2.staticflickr.com/8/7820/46873355491_6b6e155e01.jpg   2.34305899999999978 48.8868220000000022 Paris
45949376665 https://c2.staticflickr.com/5/4823/45949376665_c101815145.jpg   2.37740200000000002 48.8350909999999985 Paris
39874498413 https://c2.staticflickr.com/5/4803/39874498413_df8d0264fd.jpg   2.34922800000000009 48.8532089999999997 Paris
46073819394 https://c2.staticflickr.com/8/7843/46073819394_8877c84ce5.jpg   2.34781199999999979 48.8617109999999997 Paris
39788334653 https://c2.staticflickr.com/8/7911/39788334653_aefc7c0fde.jpg   2.34310200000000002 48.8862219999999965 Paris
46742966461 https://c2.staticflickr.com/5/4812/46742966461_b811d3a2ab.jpg   2.37686600000000015 48.832335999999998  Paris
39758410563 https://c2.staticflickr.com/8/7925/39758410563_6c42135a03.jpg   2.25900999999999996 48.8757870000000025 Paris
46632786812 https://c2.staticflickr.com/5/4820/46632786812_49e431de6e.jpg   2.29678599999999999 48.862603   Paris
46614464092 https://c2.staticflickr.com/8/7835/46614464092_c2590c5acb.jpg   2.3671669999999998  48.8342150000000004 Paris
32784919138 https://c2.staticflickr.com/5/4915/32784919138_ca27a783aa.jpg   2.33279199999999998 48.8593779999999995 Paris
31710124127 https://c2.staticflickr.com/5/4804/31710124127_02d85869b4.jpg   2.37778899999999993 48.8318420000000017 Paris
46566564832 https://c2.staticflickr.com/8/7844/46566564832_99a3419eb5.jpg   2.36974200000000002 48.8354009999999974 Paris
44769281300 https://c2.staticflickr.com/8/7868/44769281300_1fcc32ac6c.jpg   2.29040899999999992 48.8578929999999971 Paris
45817596794 https://c2.staticflickr.com/5/4839/45817596794_0696c369c6.jpg   2.29510099999999984 48.873818   Paris
44723328690 https://c2.staticflickr.com/8/7840/44723328690_8828e7ebe0.jpg   2.32521699999999987 48.8689060000000026 Paris
46486740552 https://c2.staticflickr.com/5/4853/46486740552_1ab2290f3a.jpg   2.29485500000000009 48.8739320000000035 Paris
45810675654 https://c2.staticflickr.com/8/7837/45810675654_2c5d1d5125.jpg   2.32935900000000018 48.8674239999999998 Paris
31576664027 https://c2.staticflickr.com/5/4910/31576664027_fdf9325fbe.jpg   2.35457099999999997 48.8260220000000018 Paris
32630413448 https://c2.staticflickr.com/8/7894/32630413448_7d809d441c.jpg   2.35236100000000015 48.860239   Paris
46476020041 https://c2.staticflickr.com/8/7883/46476020041_f3309d5ff5.jpg   2.35255400000000003 48.8607760000000013 Paris
45556493465 https://c2.staticflickr.com/8/7804/45556493465_377f4158ff.jpg   2.39388200000000007 48.8917100000000033 Paris
45742655944 https://c2.staticflickr.com/5/4842/45742655944_890e6fbacb.jpg   2.33081799999999983 48.8549450000000007 Paris
44592970540 https://c2.staticflickr.com/5/4831/44592970540_c01fe51fb8.jpg   2.32858600000000004 48.8676499999999976 Paris
44554663870 https://c2.staticflickr.com/5/4886/44554663870_ac478873b8.jpg   2.37377599999999989 48.8375910000000033 Paris
46266252372 https://c2.staticflickr.com/5/4816/46266252372_c065534f12.jpg   2.3756210000000002  48.8385230000000021 Paris
46277053531 https://c2.staticflickr.com/5/4857/46277053531_e4e5c659d4.jpg   2.37351799999999979 48.8409660000000017 Paris
46197311622 https://c2.staticflickr.com/5/4875/46197311622_36618a6390.jpg   2.35023699999999991 48.8298079999999999 Paris
45294446975 https://c2.staticflickr.com/5/4850/45294446975_31d09c39f1.jpg   2.37718799999999986 48.8317150000000026 Paris
32329911978 https://c2.staticflickr.com/5/4827/32329911978_152d9542c2.jpg   2.35615899999999989 48.8424059999999969 Paris
44357658440 https://c2.staticflickr.com/5/4806/44357658440_297abff519.jpg   2.3419439999999998  48.855832999999997  Paris
46109424852 https://c2.staticflickr.com/5/4883/46109424852_a3e9bb7259.jpg   2.31177400000000022 48.8641709999999989 Paris
46146633341 https://c2.staticflickr.com/5/4849/46146633341_635974dfbc.jpg   2.31365199999999982 48.8638359999999992 Paris
46145861491 https://c2.staticflickr.com/5/4835/46145861491_f592898074.jpg   2.35030099999999997 48.8528980000000033 Paris
46081336462 https://c2.staticflickr.com/5/4897/46081336462_a63a94a26f.jpg   2.31260000000000021 48.854813   Paris
31179669727 https://c2.staticflickr.com/5/4838/31179669727_ab5321c867.jpg   2.3552369999999998  48.8505120000000019 Paris
45382359024 https://c2.staticflickr.com/5/4892/45382359024_6f8a52483e.jpg   2.3761359999999998  48.8337629999999976 Paris
44283765140 https://c2.staticflickr.com/5/4880/44283765140_f7b21785a2.jpg   2.33958300000000019 48.882247999999997  Paris
31152105217 https://c2.staticflickr.com/5/4830/31152105217_a12887251c.jpg   2.33872500000000016 48.8677700000000002 Paris
46031416611 https://c2.staticflickr.com/5/4852/46031416611_c11052e4e1.jpg   2.37325000000000008 48.8369130000000027 Paris
44201959380 https://c2.staticflickr.com/5/4817/44201959380_6a20c59726.jpg   2.37651199999999996 48.8339399999999983 Paris
32127878698 https://c2.staticflickr.com/5/4878/32127878698_5d14dc4c15.jpg   2.38858199999999998 48.8950109999999967 Paris
45974910411 https://c2.staticflickr.com/5/4851/45974910411_3414aac080.jpg   2.37555700000000014 48.8344980000000035 Paris
45862094922 https://c2.staticflickr.com/5/4805/45862094922_fbddb901c0.jpg   2.38298100000000002 48.8283109999999994 Paris
45172457004 https://c2.staticflickr.com/5/4904/45172457004_1efaa04327.jpg   2.36723099999999986 48.8405849999999973 Paris
45828451451 https://c2.staticflickr.com/5/4882/45828451451_b08c507e77.jpg   2.352576    48.8525449999999992 Paris
43998469290 https://c2.staticflickr.com/5/4857/43998469290_4a25cf6d8f.jpg   2.37422699999999987 48.8376329999999967 Paris
31942126328 https://c2.staticflickr.com/5/4904/31942126328_10b0ed55a2.jpg   2.39388200000000007 48.8917100000000033 Paris
44887281505 https://c2.staticflickr.com/5/4857/44887281505_29fbc29935.jpg   2.36656600000000017 48.8406840000000031 Paris
31919495508 https://c2.staticflickr.com/5/4849/31919495508_1f28c39744.jpg   2.31496000000000013 48.8629749999999987 Paris
45764196561 https://c2.staticflickr.com/5/4856/45764196561_f31e7cf54a.jpg   2.35634200000000016 48.8490290000000016 Paris
44823187645 https://c2.staticflickr.com/5/4837/44823187645_72b971f54e.jpg   2.29704299999999995 48.8606770000000026 Paris
45683029382 https://c2.staticflickr.com/2/1907/45683029382_1fce333ae4.jpg   2.33413300000000001 48.8925690000000017 Paris
44997983954 https://c2.staticflickr.com/2/1937/44997983954_892679c151.jpg   2.32133300000000009 48.8422509999999974 Paris
44805124675 https://c2.staticflickr.com/2/1975/44805124675_e2a1623cc5.jpg   2.29371700000000001 48.8591809999999995 Paris
45699051401 https://c2.staticflickr.com/2/1973/45699051401_1c54be64d8.jpg   2.34242600000000012 48.8860880000000009 Paris
44969405304 https://c2.staticflickr.com/2/1928/44969405304_699e2c32c0.jpg   2.33751599999999993 48.8606300000000005 Paris
43867833920 https://c2.staticflickr.com/2/1954/43867833920_83d435f878.jpg   2.29824500000000009 48.8615100000000027 Paris
30744879237 https://c2.staticflickr.com/5/4831/30744879237_7ff4c1f5f2.jpg   2.34328499999999984 48.8842399999999984 Paris
44945037634 https://c2.staticflickr.com/2/1963/44945037634_18ee81d7d6.jpg   2.32133300000000009 48.8422509999999974 Paris
43825898920 https://c2.staticflickr.com/2/1948/43825898920_2da5d4caed.jpg   2.35092400000000001 48.8515280000000018 Paris
45611377111 https://c2.staticflickr.com/2/1933/45611377111_0a835fe24a.jpg   2.34586000000000006 48.8530820000000006 Paris
44881793514 https://c2.staticflickr.com/2/1955/44881793514_647ac45a35.jpg   2.33721200000000007 48.8480970000000028 Paris
45585671601 https://c2.staticflickr.com/2/1968/45585671601_c9deb966a6.jpg   2.37313200000000002 48.8384659999999968 Paris
31706754208 https://c2.staticflickr.com/2/1921/31706754208_5d3efb0981.jpg   2.34958199999999984 48.8531210000000016 Paris
45498126342 https://c2.staticflickr.com/2/1977/45498126342_583fa008bb.jpg   2.34025900000000009 48.8848389999999995 Paris
31651357938 https://c2.staticflickr.com/2/1907/31651357938_24c80aa882.jpg   2.32309300000000007 48.8663379999999989 Paris
44788621264 https://c2.staticflickr.com/2/1927/44788621264_cd8f4906fc.jpg   2.33546299999999984 48.8610850000000028 Paris
31613008998 https://c2.staticflickr.com/2/1901/31613008998_6e9e2b0480.jpg   2.34920699999999982 48.8531660000000016 Paris
44550166495 https://c2.staticflickr.com/2/1932/44550166495_46e067e61c.jpg   2.33413300000000001 48.8925690000000017 Paris
43595486650 https://c2.staticflickr.com/2/1977/43595486650_b5ca0e82fe.jpg   2.38368899999999995 48.8268979999999999 Paris
45315755372 https://c2.staticflickr.com/2/1933/45315755372_5976404112.jpg   2.28810599999999997 48.8626039999999975 Paris
45315744382 https://c2.staticflickr.com/2/1965/45315744382_ec62c4202e.jpg   2.29493999999999998 48.8738749999999982 Paris
45294236932 https://c2.staticflickr.com/2/1914/45294236932_c99fac3559.jpg   2.35499999999999998 48.8313199999999981 Paris
45332569111 https://c2.staticflickr.com/2/1912/45332569111_d18cfb07ba.jpg   2.3482409999999998  48.8524180000000001 Paris
30379566317 https://c2.staticflickr.com/2/1935/30379566317_79eb1584a9.jpg   2.32131199999999982 48.8563570000000027 Paris
30376194337 https://c2.staticflickr.com/2/1906/30376194337_1cef67d0f4.jpg   2.44782600000000006 48.8440810000000027 Paris
43497997190 https://c2.staticflickr.com/2/1915/43497997190_88bf2aa7b0.jpg   2.32970800000000011 48.8627469999999988 Paris
30356574087 https://c2.staticflickr.com/2/1904/30356574087_f2e37f4784.jpg   2.37844299999999986 48.832923000000001  Paris
43437555290 https://c2.staticflickr.com/2/1938/43437555290_0156c0f968.jpg   2.36948399999999992 48.8529330000000002 Paris
43418064780 https://c2.staticflickr.com/2/1959/43418064780_bc98bc5ee5.jpg   2.34828400000000004 48.8623809999999992 Paris
45229309671 https://c2.staticflickr.com/2/1975/45229309671_69e9a5e5cd.jpg   2.35989300000000002 48.832138999999998  Paris
30268009427 https://c2.staticflickr.com/2/1948/30268009427_294ba24e64.jpg   2.3496999999999999  48.8728440000000006 Paris
44458304394 https://c2.staticflickr.com/2/1949/44458304394_25b0ddd271.jpg   2.33413300000000001 48.8925690000000017 Paris
44442967694 https://c2.staticflickr.com/2/1905/44442967694_9624bf9962.jpg   2.35522600000000004 48.8505680000000027 Paris
45104062822 https://c2.staticflickr.com/2/1924/45104062822_83a0db788a.jpg   2.31325499999999984 48.8632109999999997 Paris
45088020672 https://c2.staticflickr.com/2/1977/45088020672_316db008bf.jpg   2.33081799999999983 48.8549450000000007 Paris
45085214712 https://c2.staticflickr.com/2/1926/45085214712_6db88af325.jpg   2.44454299999999991 48.8202720000000028 Paris
44389568154 https://c2.staticflickr.com/2/1918/44389568154_5a6fc7e1fd.jpg   2.33457299999999979 48.8539850000000015 Paris
31223766678 https://c2.staticflickr.com/2/1979/31223766678_f7c7f6030f.jpg   2.32631200000000016 48.8536179999999973 Paris
43225524700 https://c2.staticflickr.com/2/1928/43225524700_4e4c59c4b1.jpg   2.3520500000000002  48.8285089999999968 Paris
45018246101 https://c2.staticflickr.com/2/1980/45018246101_84c0c09f3a.jpg   2.35229700000000008 48.8604089999999971 Paris
44094557985 https://c2.staticflickr.com/2/1922/44094557985_b8cb2e877a.jpg   2.44647499999999996 48.8254790000000014 Paris
31114233088 https://c2.staticflickr.com/2/1967/31114233088_a8b2d896b6.jpg   2.33923799999999993 48.8525459999999967 Paris
44041455875 https://c2.staticflickr.com/2/1967/44041455875_894dbea583.jpg   2.38641499999999995 48.8272369999999967 Paris
43981724365 https://c2.staticflickr.com/2/1923/43981724365_e136e69161.jpg   2.33047400000000016 48.8719409999999996 Paris
29929773187 https://c2.staticflickr.com/2/1930/29929773187_8622299937.jpg   2.256853    48.8859259999999978 Paris
43948373485 https://c2.staticflickr.com/2/1842/43948373485_27dc5cf99d.jpg   2.29500500000000018 48.8738320000000002 Paris
44847540361 https://c2.staticflickr.com/2/1854/44847540361_f263fd0ebd.jpg   2.38059900000000013 48.8447219999999973 Paris
44120841374 https://c2.staticflickr.com/2/1879/44120841374_ca36b1e63a.jpg   2.32725600000000021 48.8836259999999996 Paris
43027169220 https://c2.staticflickr.com/2/1979/43027169220_b1650d0845.jpg   2.33606399999999992 48.8873230000000021 Paris
30936786118 https://c2.staticflickr.com/2/1924/30936786118_4078b55112.jpg   2.3916719999999998  48.8405920000000009 Paris
42944006170 https://c2.staticflickr.com/2/1887/42944006170_28d26147a2.jpg   2.31942400000000015 48.8634720000000016 Paris
29811873847 https://c2.staticflickr.com/2/1872/29811873847_36104b6ea7.jpg   2.41478200000000021 48.8796290000000013 Paris
29807616197 https://c2.staticflickr.com/2/1895/29807616197_87b0438a8e.jpg   2.38384000000000018 48.8397509999999997 Paris
43788488715 https://c2.staticflickr.com/2/1899/43788488715_78cdd1bfe4.jpg   2.29435000000000011 48.8584249999999969 Paris
43922161114 https://c2.staticflickr.com/2/1886/43922161114_04615f74b0.jpg   2.39326999999999979 48.8696119999999965 Paris
44588659132 https://c2.staticflickr.com/2/1890/44588659132_108bcd1d43.jpg   2.28946899999999998 48.8538130000000024 Paris
44555203152 https://c2.staticflickr.com/2/1845/44555203152_57e11aef8f.jpg   2.29215100000000005 48.8591100000000012 Paris
44602371251 https://c2.staticflickr.com/2/1890/44602371251_22403f550f.jpg   2.36913000000000018 48.8531800000000018 Paris
42789686220 https://c2.staticflickr.com/2/1872/42789686220_f4a1b3f7d7.jpg   2.3671669999999998  48.8342150000000004 Paris
43847932584 https://c2.staticflickr.com/2/1876/43847932584_b6f5a85844.jpg   2.30885600000000002 48.8629990000000021 Paris
42727650340 https://c2.staticflickr.com/2/1880/42727650340_96a27ee19a.jpg   2.38169399999999998 48.8256969999999981 Paris
30647414328 https://c2.staticflickr.com/2/1888/30647414328_6515d76b65.jpg   2.37527799999999978 48.8386080000000007 Paris
44475821401 https://c2.staticflickr.com/2/1887/44475821401_53324d8145.jpg   2.36639400000000011 48.8408390000000026 Paris
30605132568 https://c2.staticflickr.com/2/1863/30605132568_8476edb51c.jpg   2.33747000000000016 48.8584790000000027 Paris
43735789684 https://c2.staticflickr.com/2/1887/43735789684_7c6fde43e9.jpg   2.36660899999999996 48.8404510000000016 Paris
29452628787 https://c2.staticflickr.com/2/1855/29452628787_b1c1ffaea2.jpg   2.38550299999999993 48.839455000000001  Paris
43443329795 https://c2.staticflickr.com/2/1858/43443329795_ebcb1eae15.jpg   2.37476300000000018 48.8354860000000031 Paris
30457764658 https://c2.staticflickr.com/2/1842/30457764658_8e6815d859.jpg   2.3388110000000002  48.8609769999999983 Paris
43566902904 https://c2.staticflickr.com/2/1893/43566902904_0e2f0d7f28.jpg   2.36688799999999988 48.8409520000000015 Paris
30395471008 https://c2.staticflickr.com/2/1855/30395471008_0eb7d1f094.jpg   2.38527699999999987 48.827534   Paris
44242294611 https://c2.staticflickr.com/2/1872/44242294611_2bbf00a58b.jpg   2.37761699999999987 48.8302460000000025 Paris
44173689912 https://c2.staticflickr.com/2/1874/44173689912_f5fcceeb9e.jpg   2.36454899999999979 48.8341020000000015 Paris
42394556410 https://c2.staticflickr.com/2/1879/42394556410_e07f0cb38a.jpg   2.35364899999999988 48.8590549999999979 Paris
42394520590 https://c2.staticflickr.com/2/1873/42394520590_5e854141dc.jpg   2.37647999999999993 48.8424910000000025 Paris
42382759250 https://c2.staticflickr.com/2/1851/42382759250_b927d13009.jpg   2.32910100000000009 48.8730850000000032 Paris
30314179638 https://c2.staticflickr.com/2/1819/30314179638_0b4622b527.jpg   2.37454799999999988 48.8413049999999984 Paris
29240832937 https://c2.staticflickr.com/2/1846/29240832937_2be8421492.jpg   2.275779    48.8466080000000034 Paris
42369870020 https://c2.staticflickr.com/2/1866/42369870020_9a0ca8e6a3.jpg   2.29429699999999981 48.8735470000000021 Paris
30293051938 https://c2.staticflickr.com/2/1881/30293051938_57b8690d41.jpg   2.37096499999999999 48.8341300000000018 Paris
43200671515 https://c2.staticflickr.com/2/1845/43200671515_c738bd437e.jpg   2.35554100000000011 48.8821629999999985 Paris
44057671442 https://c2.staticflickr.com/2/1852/44057671442_42f7d17054.jpg   2.31234299999999982 48.8545689999999979 Paris
44078912681 https://c2.staticflickr.com/2/1800/44078912681_8c0aa526bb.jpg   2.38403300000000007 48.8996039999999965 Paris
44026447762 https://c2.staticflickr.com/2/1794/44026447762_58424ff834.jpg   2.2525170000000001  48.8843219999999974 Paris
43969458542 https://c2.staticflickr.com/1/938/43969458542_1bc03545b4.jpg    2.37367900000000009 48.8341020000000015 Paris
43991308121 https://c2.staticflickr.com/2/1833/43991308121_bac22fb55b.jpg   2.34273700000000007 48.8867059999999967 Paris
30091883878 https://c2.staticflickr.com/2/1838/30091883878_d7eff78323.jpg   2.28173300000000001 48.8503570000000025 Paris
42121249530 https://c2.staticflickr.com/2/1774/42121249530_e41bff153d.jpg   2.3496579999999998  48.852919   Paris
43846194672 https://c2.staticflickr.com/2/1800/43846194672_51dfcd5f4d.jpg   2.33184799999999992 48.8565830000000005 Paris
43841027242 https://c2.staticflickr.com/2/1835/43841027242_7cb744a0f6.jpg   2.33053899999999992 48.8357400000000013 Paris
42975765635 https://c2.staticflickr.com/2/1835/42975765635_93ec9ce752.jpg   2.26333299999999982 48.8766660000000002 Paris
43828326512 https://c2.staticflickr.com/2/1795/43828326512_3b2ec59019.jpg   2.33257700000000012 48.8541299999999978 Paris
42943247795 https://c2.staticflickr.com/1/931/42943247795_a639f7e08e.jpg    2.3553440000000001  48.8306269999999998 Paris
42919921875 https://c2.staticflickr.com/2/1817/42919921875_1e12095358.jpg   2.33184799999999992 48.8565830000000005 Paris
43071818024 https://c2.staticflickr.com/1/861/43071818024_1edf84638f.jpg    2.37526700000000002 48.8313690000000022 Paris
29796192958 https://c2.staticflickr.com/1/917/29796192958_3ba625fd37.jpg    2.26386999999999983 48.8766549999999995 Paris
43595896102 https://c2.staticflickr.com/1/917/43595896102_e65a052101.jpg    2.30532599999999999 48.8706000000000031 Paris
28707829807 https://c2.staticflickr.com/1/933/28707829807_f855b302df.jpg    2.36184500000000019 48.858665000000002  Paris
42823326064 https://c2.staticflickr.com/1/841/42823326064_1087986621.jpg    2.33581700000000003 48.8610139999999973 Paris
28595321167 https://c2.staticflickr.com/2/1761/28595321167_85fc5228e7.jpg   2.31377999999999995 48.8643900000000002 Paris
42739258174 https://c2.staticflickr.com/1/840/42739258174_3506b435e8.jpg    2.30712800000000007 48.8703039999999973 Paris
42737005784 https://c2.staticflickr.com/1/841/42737005784_d7c8e6ac93.jpg    2.31228899999999982 48.8661889999999985 Paris
43439450101 https://c2.staticflickr.com/2/1784/43439450101_880edb41df.jpg   2.34291999999999989 48.8867580000000004 Paris
42496506225 https://c2.staticflickr.com/2/1822/42496506225_3c8d4c1ae7.jpg   2.34482999999999997 48.8555240000000026 Paris
41505271920 https://c2.staticflickr.com/2/1770/41505271920_1ff33287a9.jpg   2.29609899999999989 48.8569880000000012 Paris
28424442427 https://c2.staticflickr.com/1/838/28424442427_9e73a96bff.jpg    2.2945009999999999  48.8582949999999983 Paris
43260422811 https://c2.staticflickr.com/1/846/43260422811_d785e04f17.jpg    2.35112599999999983 48.8558319999999995 Paris
42289432755 https://c2.staticflickr.com/1/844/42289432755_b86fbe0804.jpg    2.38171299999999997 48.8267080000000036 Paris
42375824674 https://c2.staticflickr.com/2/1787/42375824674_b968922794.jpg   2.34590200000000015 48.8531100000000009 Paris
28203363317 https://c2.staticflickr.com/1/915/28203363317_41df048bf5.jpg    2.34639599999999993 48.8622020000000035 Paris
43067500191 https://c2.staticflickr.com/2/1826/43067500191_a2f9bfd658.jpg   2.34755100000000017 48.8544040000000024 Paris
42349451634 https://c2.staticflickr.com/2/1828/42349451634_cc4476f7db.jpg   2.34755100000000017 48.8544040000000024 Paris
42155061875 https://c2.staticflickr.com/1/915/42155061875_b38fea113f.jpg    2.36633000000000004 48.8336079999999981 Paris
28172146697 https://c2.staticflickr.com/2/1763/28172146697_13d6e4b7bc.jpg   2.34172899999999995 48.888112999999997  Paris
42310081234 https://c2.staticflickr.com/2/1782/42310081234_12c0c6bf79.jpg   2.32257800000000003 48.8421379999999985 Paris
42102951385 https://c2.staticflickr.com/1/883/42102951385_a2005bf716.jpg    2.37673699999999988 48.8241999999999976 Paris
28135548167 https://c2.staticflickr.com/2/1776/28135548167_48ed98b04e.jpg   2.32689099999999982 48.8742560000000026 Paris
42937113722 https://c2.staticflickr.com/2/1783/42937113722_5d216600eb.jpg   2.35315500000000011 48.8551009999999977 Paris
42237017994 https://c2.staticflickr.com/2/1801/42237017994_8742bf4f0f.jpg   2.37102900000000005 48.8397659999999973 Paris
41140593390 https://c2.staticflickr.com/2/1763/41140593390_3d5e0b223c.jpg   2.35166599999999981 48.8608329999999995 Paris
41114682410 https://c2.staticflickr.com/2/1789/41114682410_96691eb480.jpg   2.36695199999999994 48.8408670000000029 Paris
42140699644 https://c2.staticflickr.com/2/1806/42140699644_3c2d5854a6.jpg   2.3785280000000002  48.8311660000000032 Paris
42782268462 https://c2.staticflickr.com/2/1770/42782268462_eb2d82bcfe.jpg   2.34607400000000021 48.8866379999999978 Paris
42102298304 https://c2.staticflickr.com/2/1727/42102298304_8463ec47c4.jpg   2.36793899999999979 48.8411919999999995 Paris
42798214111 https://c2.staticflickr.com/1/900/42798214111_131d8831f6.jpg    2.40724999999999989 48.8187039999999968 Paris
42794965361 https://c2.staticflickr.com/2/1729/42794965361_85492b2b82.jpg   2.31588299999999991 48.8550019999999989 Paris
28906094028 https://c2.staticflickr.com/1/896/28906094028_959a9f0c0d.jpg    2.37432299999999996 48.8336639999999989 Paris
28897613658 https://c2.staticflickr.com/2/1758/28897613658_1d707a081e.jpg   2.33033499999999982 48.8595339999999965 Paris
42729560621 https://c2.staticflickr.com/2/1736/42729560621_0531afb6df.jpg   2.39333300000000015 48.8905549999999991 Paris
28840781608 https://c2.staticflickr.com/2/1744/28840781608_ee86949df7.jpg   2.34500099999999989 48.8554249999999968 Paris
32247889548 https://c2.staticflickr.com/5/4867/32247889548_3710cc514a.jpg   2.31589400000000012 48.8631450000000029 Paris
44328280371 https://c2.staticflickr.com/2/1876/44328280371_c464362d08.jpg   2.37473100000000015 48.8423220000000029 Paris
43438967202 https://c2.staticflickr.com/1/840/43438967202_0ecacb8f67.jpg    2.39416599999999979 48.8900000000000006 Paris
29263066408 https://c2.staticflickr.com/2/1802/29263066408_0c58ab544b.jpg   2.36969900000000022 48.853237   Paris
42344674104 https://c2.staticflickr.com/1/913/42344674104_7f11cf47ff.jpg    2.34811300000000012 48.8299659999999989 Paris
42142821295 https://c2.staticflickr.com/1/918/42142821295_7b34afdccc.jpg    2.33716899999999983 48.8614960000000025 Paris
42114977785 https://c2.staticflickr.com/2/1793/42114977785_e7bee430fd.jpg   2.29470399999999985 48.858037000000003  Paris
28066074387 https://c2.staticflickr.com/2/1812/28066074387_161baff19a.jpg   2.35194400000000003 48.8602770000000035 Paris
27980293807 https://c2.staticflickr.com/2/1823/27980293807_0436f00576.jpg   2.35194400000000003 48.8602770000000035 Paris
42839238241 https://c2.staticflickr.com/2/1782/42839238241_78184fd060.jpg   2.37723100000000009 48.8324640000000016 Paris
28964923628 https://c2.staticflickr.com/2/1725/28964923628_88e6d74809.jpg   2.38083299999999998 48.8619440000000012 Paris
42747404772 https://c2.staticflickr.com/2/1747/42747404772_9e1c6090ab.jpg   2.35194400000000003 48.8602770000000035 Paris
27900376237 https://c2.staticflickr.com/1/892/27900376237_7ee0d461e7.jpg    2.38083299999999998 48.8619440000000012 Paris
40855053990 https://c2.staticflickr.com/2/1758/40855053990_8c9c757717.jpg   2.29472599999999982 48.8582770000000011 Paris
46919894451 https://c2.staticflickr.com/5/4890/46919894451_4faaec2d9c.jpg   2.37723100000000009 48.8326050000000009 Paris
32512697058 https://c2.staticflickr.com/5/4809/32512697058_65a3793e90.jpg   2.35156700000000018 48.8299489999999992 Paris
45140800504 https://c2.staticflickr.com/2/1916/45140800504_de900232e2.jpg   2.37429099999999993 48.8347660000000019 Paris
31978058888 https://c2.staticflickr.com/5/4915/31978058888_71a462bdf5.jpg   2.36660899999999996 48.8340030000000027 Paris
30892059547 https://c2.staticflickr.com/5/4909/30892059547_51721199cd.jpg   2.32099000000000011 48.8655609999999996 Paris
44013246220 https://c2.staticflickr.com/5/4851/44013246220_537573e620.jpg   2.2905549999999999  48.8311109999999999 Paris
30889382607 https://c2.staticflickr.com/5/4834/30889382607_5f0d4cbdf5.jpg   2.33324199999999982 48.8585309999999993 Paris
45047495644 https://c2.staticflickr.com/5/4894/45047495644_ccede735b1.jpg   2.34289799999999993 48.8867479999999972 Paris
45619328912 https://c2.staticflickr.com/2/1917/45619328912_8f72bdaa26.jpg   2.298095    48.8611149999999981 Paris
45479258271 https://c2.staticflickr.com/2/1956/45479258271_caea49d6a1.jpg   2.33781300000000014 48.8638389999999987 Paris
44228170205 https://c2.staticflickr.com/2/1928/44228170205_e3ccc66550.jpg   2.37684400000000018 48.8325620000000029 Paris
43057136840 https://c2.staticflickr.com/2/1980/43057136840_7ca9d41e19.jpg   2.37559999999999993 48.8252030000000019 Paris
42972229250 https://c2.staticflickr.com/2/1883/42972229250_0786cce9ee.jpg   2.29414700000000016 48.8582139999999967 Paris
30891017088 https://c2.staticflickr.com/2/1862/30891017088_68296ea078.jpg   2.33753399999999978 48.8667510000000007 Paris
44711257991 https://c2.staticflickr.com/2/1855/44711257991_a0cda2a358.jpg   2.31365199999999982 48.8632320000000036 Paris
43837866934 https://c2.staticflickr.com/2/1864/43837866934_34c4376cb9.jpg   2.38768100000000016 48.8682850000000002 Paris
43626918435 https://c2.staticflickr.com/2/1877/43626918435_df1ab8720d.jpg   2.2975150000000002  48.8552279999999968 Paris
29275480087 https://c2.staticflickr.com/2/1833/29275480087_228bee3b87.jpg   2.31401600000000007 48.863190000000003  Paris
43360731794 https://c2.staticflickr.com/2/1836/43360731794_4f0ea6fe68.jpg   2.35244700000000018 48.8860600000000005 Paris
43005795755 https://c2.staticflickr.com/2/1831/43005795755_7368f60a55.jpg   2.37735900000000022 48.8323079999999976 Paris
41935481240 https://c2.staticflickr.com/2/1837/41935481240_48fc7e931f.jpg   2.37439799999999979 48.8335300000000032 Paris
28399058007 https://c2.staticflickr.com/2/1821/28399058007_5e2c105cb1.jpg   2.30137800000000015 48.8609310000000008 Paris
43084549281 https://c2.staticflickr.com/2/1806/43084549281_2dd49f4e7e.jpg   2.3811110000000002  48.8616659999999996 Paris
42168888235 https://c2.staticflickr.com/2/1808/42168888235_27d755ebb5.jpg   2.34377799999999992 48.8531949999999995 Paris
28200770537 https://c2.staticflickr.com/2/1769/28200770537_347d963863.jpg   2.39388800000000002 48.889721999999999  Paris
42308376674 https://c2.staticflickr.com/2/1789/42308376674_22d96213d3.jpg   2.33407900000000001 48.8597449999999967 Paris
29049280128 https://c2.staticflickr.com/1/887/29049280128_02c5bc02df.jpg    2.39388800000000002 48.8900000000000006 Paris
41070068960 https://c2.staticflickr.com/2/1741/41070068960_6fd40eac0a.jpg   2.39333300000000015 48.8905549999999991 Paris
30663416038 https://c2.staticflickr.com/2/1856/30663416038_5d64917106.jpg   2.31343699999999997 48.8634660000000025 Paris
40043340233 https://c2.staticflickr.com/8/7869/40043340233_96983d866b.jpg   -0.134582000000000007   51.5138699999999972 London
47060444771 https://c2.staticflickr.com/8/7896/47060444771_001494dd19.jpg   139.750824999999992 35.6587079999999972 Tokyo
46217557034 https://c2.staticflickr.com/8/7846/46217557034_a52f91a330.jpg   -0.0716139999999999971  51.519832000000001  London
46005205875 https://c2.staticflickr.com/5/4888/46005205875_9dd571f0a6.jpg   -0.0460049999999999973  51.5357649999999978 London
32129188027 https://c2.staticflickr.com/8/7885/32129188027_9d1ec32490.jpg   12.4694710000000004 41.889954000000003  Rome
46132452325 https://c2.staticflickr.com/8/7818/46132452325_51a609e34d.jpg   12.4824850000000005 41.9059979999999968 Rome
45882598535 https://c2.staticflickr.com/8/7895/45882598535_d331c4ddc6.jpg   12.4785799999999991 41.8831330000000008 Rome
32901221048 https://c2.staticflickr.com/8/7832/32901221048_2b1082b711.jpg   12.4712630000000004 41.9027209999999997 Rome
32805068028 https://c2.staticflickr.com/8/7815/32805068028_32b5e4d63b.jpg   12.4673580000000008 41.9013550000000023 Rome
44768536190 https://c2.staticflickr.com/8/7862/44768536190_e1eeb91a03.jpg   12.4725289999999998 41.8987839999999991 Rome
45670583975 https://c2.staticflickr.com/8/7837/45670583975_c08a2ae158.jpg   12.4814120000000006 41.9079339999999974 Rome
44764113410 https://c2.staticflickr.com/5/4900/44764113410_4bc1d55f83.jpg   12.4799100000000003 41.9021809999999988 Rome
32813410788 https://c2.staticflickr.com/8/7902/32813410788_35b8de2639.jpg   12.4745139999999992 41.8910210000000021 Rome
33138433478 https://c2.staticflickr.com/5/4862/33138433478_9d0849ffed.jpg   12.4838799999999992 41.8952010000000001 Rome
33071091918 https://c2.staticflickr.com/8/7903/33071091918_72836a91a8.jpg   12.4719499999999996 41.8823739999999987 Rome
32934372378 https://c2.staticflickr.com/5/4896/32934372378_2f0989e5ba.jpg   12.4771210000000004 41.9098619999999968 Rome
46025673364 https://c2.staticflickr.com/5/4884/46025673364_1e73913c95.jpg   12.4854040000000008 41.8941790000000012 Rome
39656928253 https://c2.staticflickr.com/5/4853/39656928253_26550ec93d.jpg   12.473516   41.8900020000000026 Rome
31929979537 https://c2.staticflickr.com/5/4842/31929979537_101028c13f.jpg   -0.134445000000000009   51.509999999999998  London
31846088467 https://c2.staticflickr.com/8/7878/31846088467_b3b58bbb5e.jpg   -0.0754060000000000008  51.5054999999999978 London
46528176411 https://c2.staticflickr.com/8/7893/46528176411_d1fc11ba6f.jpg   -0.172926999999999997   51.4971079999999972 London
44601203050 https://c2.staticflickr.com/8/7804/44601203050_80188277d5.jpg   -0.123458999999999999   51.5120000000000005 London
31875340347 https://c2.staticflickr.com/8/7846/31875340347_a581885c72.jpg   -122.471680000000006    37.808799999999998  San Francisco
42324515585 https://c2.staticflickr.com/2/1786/42324515585_eaa2d0d604.jpg   -122.369585000000001    37.8092410000000001 San Francisco
41363305994 https://c2.staticflickr.com/1/903/41363305994_34dcf27331.jpg    -122.509285000000006    37.7704349999999991 San Francisco
46359513931 https://c2.staticflickr.com/5/4864/46359513931_409a6e45c6.jpg   -122.356448 38.2691469999999967 Napa
46389074021 https://c2.staticflickr.com/5/4874/46389074021_429675513f.jpg   -122.324619999999996    38.2731989999999982 Napa
37170878216 https://c2.staticflickr.com/5/4386/37170878216_d200c03e2a.jpg   -122.333855999999997    38.2563519999999997 Napa
37929416104 https://c2.staticflickr.com/5/4557/37929416104_4e5c19da43.jpg   -122.347954999999999    38.2704129999999978 Napa
31786054470 https://c2.staticflickr.com/1/507/31786054470_9fb719ea98.jpg    -122.351484999999997    38.2559329999999989 Napa
31302891431 https://c2.staticflickr.com/6/5681/31302891431_1ea0d4315c.jpg   -122.317836999999997    38.2579330000000013 Napa
27593150866 https://c2.staticflickr.com/8/7108/27593150866_ff9a4dfeea.jpg   -122.319802999999993    38.3014250000000018 Napa
47041438532 https://c2.staticflickr.com/8/7892/47041438532_015eb86a89.jpg   -79.3843200000000024    43.6383229999999998 Toronto
32218495407 https://c2.staticflickr.com/8/7915/32218495407_1743d78a82.jpg   -79.3903820000000024    43.6374410000000026 Toronto
33136749358 https://c2.staticflickr.com/8/7865/33136749358_2b014bc94e.jpg   -79.388337000000007 43.6378660000000025 Toronto
32808023188 https://c2.staticflickr.com/5/4853/32808023188_7d10d88fcc.jpg   -79.3730730000000051    43.6506690000000006 Toronto
46724500602 https://c2.staticflickr.com/8/7875/46724500602_64ae712de8.jpg   -79.3668109999999984    43.6429690000000008 Toronto
31897775547 https://c2.staticflickr.com/8/7866/31897775547_1d8cb84e7d.jpg   -73.5575170000000043    45.4934909999999988 Montreal
46210391584 https://c2.staticflickr.com/8/7801/46210391584_b988c027c1.jpg   -73.5880279999999942    45.4742079999999973 Montreal
46337692514 https://c2.staticflickr.com/8/7835/46337692514_9587edb39f.jpg   -73.5637660000000011    45.5578140000000005 Montreal
46279680864 https://c2.staticflickr.com/8/7860/46279680864_53f4fc79c1.jpg   -73.5582299999999947    45.5057749999999999 Montreal
32227278727 https://c2.staticflickr.com/8/7806/32227278727_5495f55f2f.jpg   -73.5613780000000048    45.5035579999999982 Montreal
47084823262 https://c2.staticflickr.com/8/7860/47084823262_c819a41e08.jpg   -73.5821339999999964    45.5052189999999968 Montreal
46534409752 https://c2.staticflickr.com/5/4855/46534409752_d6dedbd846.jpg   -73.5548399999999987    45.5577680000000029 Montreal
46251176555 https://c2.staticflickr.com/8/7901/46251176555_990fdb0e66.jpg   121.452856999999995 31.2175699999999985 Shanghai
\.


--
-- Data for Name: trip_photos_rel; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.trip_photos_rel (relationship_id, trip_id, photo_id) FROM stdin;
1   4   32145040697
2   3   43534601602
3   3   46156163945
4   3   32760554098
5   3   46281066051
6   4   46061720665
9   4   44554263890
42  1   46629768792
43  1   45111336514
44  1   43161797644
45  1   45018564655
53  3   46105882985
54  3   45647140815
69  6   40052487353
70  6   33074656578
71  6   46218564124
72  6   46803626091
73  6   44777149100
74  6   45463605405
75  6   31097219957
76  6   43926215745
77  7   31724517057
79  7   45111336514
80  7   43067908850
81  7   46345371754
82  9   46828933301
83  9   32133422657
84  9   46815387452
85  9   46718186292
86  9   45403212244
87  9   45828542261
88  9   45736635321
91  10  46109424852
114 10  39874498413
116 10  32784919138
120 12  32901221048
121 12  32805068028
122 12  44768536190
123 12  45670583975
125 12  32813410788
126 12  32129188027
132 11  31929979537
133 11  31846088467
134 11  46528176411
135 11  44601203050
136 13  46105882985
137 13  46011623875
138 13  46629768792
139 13  45647140815
140 14  40127437773
141 14  32071925187
142 14  45921904515
143 14  32040322597
144 14  39905912533
146 14  47025874201
147 3   31875340347
148 3   32225760818
149 3   42324515585
150 3   42050573995
151 3   41363305994
152 3   41953669811
153 3   27043457917
154 4   45607404685
155 4   46359513931
156 4   46389074021
157 4   44304806560
158 4   37170878216
159 4   37929416104
161 4   31302891431
162 4   27593150866
172 25  31897775547
173 25  46210391584
174 25  46337692514
175 25  46279680864
176 25  32227278727
178 25  46534409752
179 26  33184501068
180 26  32071925187
181 26  45921904515
182 26  46251176555
183 26  45905679535
\.


--
-- Data for Name: trip_user_likes_rel; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.trip_user_likes_rel (relationship_id, trip_id, user_id) FROM stdin;
1   1   1
2   1   2
3   1   3
4   3   4
5   3   5
6   3   1
8   4   3
9   9   3
10  7   3
11  11  6
12  6   5
13  10  5
\.


--
-- Data for Name: trips; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.trips (trip_id, name, user_id, city_name) FROM stdin;
1   SF Pupventures  1   San Francisco
3   Test SF Trip    5   San Francisco
4   Test Napa   5   Napa
6   Otter Monterey Trip 4   Monterey
7   Otter this world    4   San Francisco
9   Test Beijing    5   Beijing
10  Bonjour Paris   3   Paris
11  London London Bridge    3   London
12  Roma    3   Rome
13  Jenica Hometrip 6   San Francisco
14  Jenica SH   6   Shanghai
25  Mtl Trip    5   Montreal
26  Test SH 5   Shanghai
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.users (user_id, fname, lname, email, password) FROM stdin;
1   Cute    Puppy   puppy@gmail.com 61bd60c60d9fb60cc8fc7767669d40a1
2   User    Two U2@yahoo.com    61bd60c60d9fb60cc8fc7767669d40a1
3   User    Three   user3@hotmail.com   61bd60c60d9fb60cc8fc7767669d40a1
4   Significant Otter   otter@gmail.com 61bd60c60d9fb60cc8fc7767669d40a1
5   Test    Test    test@gmail.com  61bd60c60d9fb60cc8fc7767669d40a1
6   Sunny   Day sunny.day@gmail.com 61bd60c60d9fb60cc8fc7767669d40a1
7   Jenica  Huang   jenica.huang@gmail.com  61bd60c60d9fb60cc8fc7767669d40a1
8   Hackbright  Student student@hackbright.com  61bd60c60d9fb60cc8fc7767669d40a1
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

SELECT pg_catalog.setval('public.trip_photos_rel_relationship_id_seq', 183, true);


--
-- Name: trip_user_likes_rel_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.trip_user_likes_rel_relationship_id_seq', 13, true);


--
-- Name: trips_trip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.trips_trip_id_seq', 26, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.users_user_id_seq', 8, true);


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