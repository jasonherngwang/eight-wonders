--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: airports; Type: TABLE; Schema: public; Owner: jason
--

CREATE TABLE public.airports (
    id integer NOT NULL,
    iata_code text NOT NULL,
    name text NOT NULL,
    continent text NOT NULL,
    iso_country character(2) NOT NULL,
    country text NOT NULL,
    region text NOT NULL,
    municipality text,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);


-- ALTER TABLE public.airports OWNER TO jason;

--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: jason
--

CREATE SEQUENCE public.airports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE public.airports_id_seq OWNER TO jason;

--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jason
--

ALTER SEQUENCE public.airports_id_seq OWNED BY public.airports.id;


--
-- Name: destinations; Type: TABLE; Schema: public; Owner: jason
--

CREATE TABLE public.destinations (
    id integer NOT NULL,
    itinerary_id integer NOT NULL,
    airport_id integer NOT NULL
);


-- ALTER TABLE public.destinations OWNER TO jason;

--
-- Name: destinations_id_seq; Type: SEQUENCE; Schema: public; Owner: jason
--

CREATE SEQUENCE public.destinations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE public.destinations_id_seq OWNER TO jason;

--
-- Name: destinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jason
--

ALTER SEQUENCE public.destinations_id_seq OWNED BY public.destinations.id;


--
-- Name: experiences; Type: TABLE; Schema: public; Owner: jason
--

CREATE TABLE public.experiences (
    id integer NOT NULL,
    destination_id integer NOT NULL,
    description text NOT NULL
);


-- ALTER TABLE public.experiences OWNER TO jason;

--
-- Name: experiences_id_seq; Type: SEQUENCE; Schema: public; Owner: jason
--

CREATE SEQUENCE public.experiences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE public.experiences_id_seq OWNER TO jason;

--
-- Name: experiences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jason
--

ALTER SEQUENCE public.experiences_id_seq OWNED BY public.experiences.id;


--
-- Name: itineraries; Type: TABLE; Schema: public; Owner: jason
--

CREATE TABLE public.itineraries (
    id integer NOT NULL,
    code character(8) NOT NULL,
    name text DEFAULT 'Travel Itinerary'::text NOT NULL,
    editable boolean DEFAULT true
);


-- ALTER TABLE public.itineraries OWNER TO jason;

--
-- Name: itineraries_id_seq; Type: SEQUENCE; Schema: public; Owner: jason
--

CREATE SEQUENCE public.itineraries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE public.itineraries_id_seq OWNER TO jason;

--
-- Name: itineraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jason
--

ALTER SEQUENCE public.itineraries_id_seq OWNED BY public.itineraries.id;


--
-- Name: airports id; Type: DEFAULT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.airports ALTER COLUMN id SET DEFAULT nextval('public.airports_id_seq'::regclass);


--
-- Name: destinations id; Type: DEFAULT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.destinations ALTER COLUMN id SET DEFAULT nextval('public.destinations_id_seq'::regclass);


--
-- Name: experiences id; Type: DEFAULT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.experiences ALTER COLUMN id SET DEFAULT nextval('public.experiences_id_seq'::regclass);


--
-- Name: itineraries id; Type: DEFAULT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.itineraries ALTER COLUMN id SET DEFAULT nextval('public.itineraries_id_seq'::regclass);


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: jason
--

COPY public.airports (id, iata_code, name, continent, iso_country, country, region, municipality, latitude, longitude) FROM stdin;
1	AZR	Touat Cheikh Sidi Mohamed Belkebir Airport	Africa	DZ	Algeria	Adrar Province	Adrar	27.837601	-0.186414
2	ALG	Houari Boumediene Airport	Africa	DZ	Algeria	Algiers Province	Algiers	36.691002	3.21541
3	AAE	Rabah Bitat Airport	Africa	DZ	Algeria	Annaba Province	Annaba	36.826781	7.81334
4	BLJ	Batna Mostefa Ben Boulaid Airport	Africa	DZ	Algeria	Batna Province	Batna	35.752102	6.30859
5	CBH	B??char Boudghene Ben Ali Lotfi Airport	Africa	DZ	Algeria	B??char Province	B??char	31.64570045	-2.269860029
6	BJA	Soummam ??? Abane Ramdane Airport	Africa	DZ	Algeria	B??ja??a Province	B??ja??a	36.712793	5.07857
7	BSK	Biskra - Mohamed Khider Airport	Africa	DZ	Algeria	Biskra Province	Biskra	34.793301	5.73823
8	QLD	Blida Airport	Africa	DZ	Algeria	Blida Province	Blida	36.503601	2.81417
9	BMW	Bordj Badji Mokhtar Airport	Africa	DZ	Algeria	Adrar Province	Bordj Badji Mokhtar	21.3778	0.92698
10	CFK	Chlef Aboubakr Belkaid International Airport	Africa	DZ	Algeria	Chlef Province	Chlef	36.217166	1.342237
11	CZL	Mohamed Boudiaf International Airport	Africa	DZ	Algeria	Constantine Province	Constantine	36.27600098	6.620389938
12	DJG	Djanet Inedbirene Airport	Africa	DZ	Algeria	Illizi Province	Djanet	24.292801	9.45244
13	QDJ	Tsletsi Airport	Africa	DZ	Algeria	Djelfa Province	Djelfa	34.6657	3.351
14	EBH	El Bayadh Airport	Africa	DZ	Algeria	El Bayadh Province	El Bayadh	33.72166667	1.0925
15	ELG	El Golea Airport	Africa	DZ	Algeria	Gharda??a Province	El Menia	30.571301	2.85959
16	GHA	Noum??rat - Moufdi Zakaria Airport	Africa	DZ	Algeria	Gharda??a Province	Gharda??a	32.38410187	3.79411006
17	MUW	Ghriss Airport	Africa	DZ	Algeria	Mascara Province	Ghriss	35.207699	0.147142
18	ELU	Guemar Airport	Africa	DZ	Algeria	El Oued Province	Guemar	33.51139832	6.776790142
19	HME	Hassi Messaoud-Oued Irara Krim Belkacem Airport	Africa	DZ	Algeria	Ouargla Province	Hassi Messaoud	31.673	6.14044
20	HRM	Hassi R'Mel Airport	Africa	DZ	Algeria	Laghouat Province	Hassi R'Mel	32.930401	3.31154
21	VVZ	Illizi Takhamalt Airport	Africa	DZ	Algeria	Illizi Province	Illizi	26.7234993	8.622650146
22	IAM	Zarzaitine - In Am??nas Airport	Africa	DZ	Algeria	Illizi Province	In Am??nas	28.0515	9.64291
23	INF	In Guezzam Airport	Africa	DZ	Algeria	Tamanghasset Province	In Guezzam	19.56699944	5.75
24	INZ	In Salah Airport	Africa	DZ	Algeria	Tamanghasset Province	In Salah	27.25099945	2.512020111
25	GJL	Jijel Ferhat Abbas Airport	Africa	DZ	Algeria	Jijel Province	Jijel	36.79510117	5.87361002
26	LOO	Laghouat - Molay Ahmed Medeghri Airport	Africa	DZ	Algeria	Laghouat Province	Laghouat	33.7644	2.92834
27	MZW	Mecheria Airport	Africa	DZ	Algeria	Naama Province	Mecheria	33.53590012	-0.2423530072
28	MQV	Mostaganem Airport	Africa	DZ	Algeria	Mostaganem Province	Mostaganem	35.904134	0.143337
29	ORN	Oran International Airport Ahmed Ben Bella	Africa	DZ	Algeria	Oran Province	Oran	35.623901	-0.621183
30	OGX	Ain Beida Airport	Africa	DZ	Algeria	Ouargla Province	Ouargla	31.9172	5.41278
31	BUJ	Bou Saada Airport	Africa	DZ	Algeria	M'Sila Province	Ouled Sidi Brahim	35.3325	4.20639
32	QMH	Oum El Bouaghi Air Base	Africa	DZ	Algeria	Oum el Bouaghi Province	Oum El Bouaghi	35.8797	7.2708
33	QSF	Ain Arnat Airport	Africa	DZ	Algeria	S??tif Province	S??tif	36.17810059	5.32449007
34	BFW	Sidi Bel Abbes Airport	Africa	DZ	Algeria	Sidi Bel Abbes Province	Sidi Bel Abb??s	35.17179871	-0.5932750106
35	TAF	Oran Tafraoui Airport	Africa	DZ	Algeria	Oran Province	Tafraoui	35.5424	-0.532278
36	TMR	Aguenar ??? Hadj Bey Akhamok Airport	Africa	DZ	Algeria	Tamanghasset Province	Tamanrasset	22.81150055	5.451079845
37	TEE	Cheikh Larbi T??bessi Airport	Africa	DZ	Algeria	T??bessa Province	T??bessi	35.43159866	8.12071991
38	TID	Abdelhafid Boussouf Bou Chekif Airport	Africa	DZ	Algeria	Tiaret Province	Tiaret	35.341099	1.46315
39	TMX	Timimoun Airport	Africa	DZ	Algeria	Adrar Province	Timimoun	29.2371006	0.2760330141
40	TIN	Tindouf Airport	Africa	DZ	Algeria	Tindouf Province	Tindouf	27.7003994	-8.167099953
41	TLM	Zenata ??? Messali El Hadj Airport	Africa	DZ	Algeria	Tlemcen Province	Tlemcen	35.01670074	-1.450000048
42	TGR	Touggourt Sidi Madhi Airport	Africa	DZ	Algeria	Ouargla Province	Touggourt	33.06779861	6.088669777
43	AZZ	Ambriz Airport	Africa	AO	Angola	Bengo Province	Ambriz	-7.86221981	13.11610031
44	ANL	Andulo Airport	Africa	AO	Angola	Bi?? Province	Andulo	-11.4723	16.710899
45	BUG	Benguela 17th of September Airport	Africa	AO	Angola	Benguela Province	Benguela	-12.609	13.4037
46	CAB	Cabinda Airport	Africa	AO	Angola	Cabinda Province	Cabinda	-5.596990108	12.18840027
47	CFF	Cafunfo Airport	Africa	AO	Angola	Lunda Norte Province	Cafunfo	-8.783610344	17.98970032
48	CXM	Camaxilo Airport	Africa	AO	Angola	Lunda Norte Province	Camaxilo	-8.373609543	18.92359924
49	CNZ	Cangamba Airport	Africa	AO	Angola	Moxico Province	Cangamba	-13.7106	19.861099
50	KNP	Capanda Airport	Africa	AO	Angola	Malanje Province	Capanda	-9.769370079	15.4553194
51	CBT	Catumbela Airport	Africa	AO	Angola	Benguela Province	Catumbela	-12.4792	13.4869
52	CAV	Cazombo Airport	Africa	AO	Angola	Moxico Province	Cazombo	-11.89309978	22.91640091
53	PGI	Chitato Airport	Africa	AO	Angola	Lunda Norte Province	Chitato	-7.358890057	20.80470085
54	DUE	Dundo Airport	Africa	AO	Angola	Lunda Norte Province	Chitato	-7.400889874	20.81850052
55	CTI	Cuito Cuanavale Airport	Africa	AO	Angola	Cuando Cubango Province	Cuito Cuanavale	-15.16030025	19.15609932
56	DRC	Dirico Airport	Africa	AO	Angola	Cuando Cubango Province	Dirico	-17.98192406	20.76806068
57	NOV	Nova Lisboa Airport	Africa	AO	Angola	Huambo Province	Huambo	-12.80889988	15.76049995
58	JMB	Jamba Airport	Africa	AO	Angola	Hu??la Province	Jamba	-14.698193	16.070148
59	SVP	Kuito Airport	Africa	AO	Angola	Bi?? Province	Kuito	-12.40460014	16.94739914
60	LLT	Lobito Airport	Africa	AO	Angola	Benguela Province	Lobito	-12.3712	13.5366
61	LAD	Quatro de Fevereiro International Airport	Africa	AO	Angola	Luanda Province	Luanda	-8.85837	13.2312
62	UAL	Luau Airport	Africa	AO	Angola	Moxico Province	Luau	-10.71580029	22.23110008
63	SDD	Lubango Airport	Africa	AO	Angola	Hu??la Province	Lubango	-14.92469978	13.57499981
64	LBZ	Lucapa Airport	Africa	AO	Angola	Lunda Norte Province	Lucapa	-8.445727348	20.73208618
65	LUO	Luena Airport	Africa	AO	Angola	Moxico Province	Luena	-11.76809978	19.89769936
66	GGC	Lumbala Airport	Africa	AO	Angola	Moxico Province	Lumbala N'guimbo	-14.105106	21.45083
67	LZM	Luzamba Airport	Africa	AO	Angola	Lunda Norte Province	Luzamba	-9.115960121	18.04929924
68	MEG	Malanje Airport	Africa	AO	Angola	Malanje Province	Malanje	-9.525090218	16.31240082
69	SSY	Mbanza Congo Airport	Africa	AO	Angola	Zaire Province	Mbanza Congo	-6.269899845	14.24699974
70	SPP	Menongue Airport	Africa	AO	Angola	Cuando Cubango Province	Menongue	-14.6576004	17.71980095
71	MSZ	Welwitschia Mirabilis International Airport	Africa	AO	Angola	Namibe Province	Mo????medes	-15.2612	12.1468
72	NDF	N'dalatando Airport	Africa	AO	Angola	Cuanza Norte Province	N'dalatando	-9.280378	14.982432
73	ARZ	N'zeto Airport	Africa	AO	Angola	Zaire Province	N'zeto	-7.259439945	12.86310005
74	GXG	Negage Airport	Africa	AO	Angola	U??ge Province	Negage	-7.754509926	15.2876997
75	VPE	Ngjiva Pereira Airport	Africa	AO	Angola	Cunene Province	Ngiva	-17.0435009	15.68379974
76	NZA	Nzagi Airport	Africa	AO	Angola	Lunda Norte Province	Nzagi	-7.716939926	21.35820007
77	PBN	Porto Amboim Airport	Africa	AO	Angola	Cuanza Sul Province	Port Amboim	-10.72200012	13.76550007
78	CTV	Catoca Airport	Africa	AO	Angola	Lunda Sul Province	Saurimo	-9.430985	20.311478
79	VHC	Saurimo Airport	Africa	AO	Angola	Lunda Sul Province	Saurimo	-9.689069748	20.43190002
80	SZA	Soyo Airport	Africa	AO	Angola	Zaire Province	Soyo	-6.141089916	12.37180042
81	NDD	Sumbe Airport	Africa	AO	Angola	Cuanza Sul Province	Sumbe	-11.16790009	13.84749985
82	UGO	Uige Airport	Africa	AO	Angola	U??ge Province	Uige	-7.603069782	15.02779961
83	CEO	Waco Kungo Airport	Africa	AO	Angola	Cuanza Sul Province	Waco Kungo	-11.42640018	15.10140038
84	XGN	Xangongo Airport	Africa	AO	Angola	Cunene Province	Xangongo	-16.7553997	14.96529961
85	COO	Cadjehoun Airport	Africa	BJ	Benin	Atlantique Department	Cotonou	6.357230186	2.384350061
86	DJA	Djougou Airport	Africa	BJ	Benin	Donga Department	Djougou	9.692083333	1.637777778
87	KDC	Kandi Airport	Africa	BJ	Benin	Alibori Department	Kandi	11.14479	2.940381
88	NAE	Natitingou Airport	Africa	BJ	Benin	Atakora Department	Natitingou	10.376965	1.360507
89	PKO	Parakou Airport	Africa	BJ	Benin	Borgou Department	Parakou	9.357689857	2.609679937
90	SVF	Sav?? Airport	Africa	BJ	Benin	Collines Department	Sav??	8.018170357	2.464580059
91	FRW	P G Matante Intl	Africa	BW	Botswana	Francistown (city)	Francistown	-21.15914	27.468545
92	GBE	Sir Seretse Khama International Airport	Africa	BW	Botswana	Gabarone (city)	Gaborone	-24.555201	25.9182
93	GNZ	Ghanzi Airport	Africa	BW	Botswana	Ghanzi District	Ghanzi	-21.69249916	21.65810013
94	HUK	Hukuntsi Airport	Africa	BW	Botswana	Kgalagadi District	Hukuntsi	-23.9897	21.758101
95	JWA	Jwaneng Airport	Africa	BW	Botswana	Jwaneng (town)	Jwaneng	-24.602301	24.691
96	BBK	Kasane Airport	Africa	BW	Botswana	Chobe District	Kasane	-17.832899	25.162399
97	KHW	Khwai River Lodge Airport	Africa	BW	Botswana	North West District	Khwai River Lodge	-19.14999962	23.78300095
98	LOQ	Lobatse Airport	Africa	BW	Botswana	Lobatse (town)	Lobatse	-25.1981	25.7139
99	MUB	Maun Airport	Africa	BW	Botswana	North West District	Maun	-19.97260094	23.43110085
100	ORP	Orapa Airport	Africa	BW	Botswana	Central District	Orapa	-21.266701	25.3167
101	QPH	Palapye Airport	Africa	BW	Botswana	Central District	Palapye	-22.56699944	27.14999962
102	SVT	Savuti Airport	Africa	BW	Botswana	Chobe District	Savuti	-18.518475	24.077687
103	PKW	Selebi Phikwe Airport	Africa	BW	Botswana	Selebi-Phikwe (town)	Selebi Phikwe	-22.0583	27.8288
104	SWX	Shakawe Airport	Africa	BW	Botswana	North West District	Shakawe	-18.37389946	21.83259964
105	SXN	Sua Pan Airport	Africa	BW	Botswana	Sowa (town)	Sowa	-20.5534	26.115801
106	TBY	Tshabong Airport	Africa	BW	Botswana	Kgalagadi District	Tshabong	-26.034524	22.401252
107	TLD	Limpopo Valley Airport	Africa	BW	Botswana	Central District	Tuli Lodge	-22.18919945	29.12689972
108	XAR	Aribinda Airport	Africa	BF	Burkina Faso	Soum Province	Aribinda	14.21700001	-0.8830000162
109	ARL	Arly Airport	Africa	BF	Burkina Faso	Tapoa Province	Arly	11.59700012	1.48300004
110	BNR	Banfora Airport	Africa	BF	Burkina Faso	Comoe Province	Banfora	10.68299961	-4.717000008
111	BOY	Bobo Dioulasso Airport	Africa	BF	Burkina Faso	Houet Province	Bobo Dioulasso	11.16009998	-4.33096981
112	XBG	Bogande Airport	Africa	BF	Burkina Faso	Gnagna Province	Bogande	12.9829998	-0.1669999957
113	XBO	Boulsa Airport	Africa	BF	Burkina Faso	Namentenga Province	Boulsa	12.64999962	-0.5669999719
114	DGU	Dedougou Airport	Africa	BF	Burkina Faso	Mouhoun Province	Dedougou	12.45899963	-3.49000001
115	DIP	Diapaga Airport	Africa	BF	Burkina Faso	Tapoa Province	Diapaga	12.060324	1.784631
116	XDE	Diebougou Airport	Africa	BF	Burkina Faso	Bougouriba Province	Diebougou	10.94999981	-3.25
117	XDJ	Djibo Airport	Africa	BF	Burkina Faso	Soum Province	Djibo	14.10000038	-1.633000016
118	DOR	Dori Airport	Africa	BF	Burkina Faso	S??no Province	Dori	14.03299999	-0.03299999982
119	FNG	Fada N'gourma Airport	Africa	BF	Burkina Faso	Gourma Province	Fada N'gourma	12.03299999	0.349999994
120	XGA	Gaoua Airport	Africa	BF	Burkina Faso	Poni Province	Gaoua	10.384059	-3.163454
121	XGG	Gorom-Gorom Airport	Africa	BF	Burkina Faso	Oudalan Province	Gorom-Gorom	14.44999981	-0.2329999954
122	XKA	Kantchari Airport	Africa	BF	Burkina Faso	Tapoa Province	Kantchari	12.46700001	1.5
123	XKY	Kaya Airport	Africa	BF	Burkina Faso	Sanmatenga Province	Kaya	13.06700039	-1.100000024
124	XLU	Leo Airport	Africa	BF	Burkina Faso	Sissili Province	Leo	11.10000038	-2.099999905
125	XNU	Nouna Airport	Africa	BF	Burkina Faso	Kossi Province	Nouna	12.75	-3.867000103
126	OUA	Ouagadougou Airport	Africa	BF	Burkina Faso	Kadiogo Province	Ouagadougou	12.3532	-1.51242
127	OUG	Ouahigouya Airport	Africa	BF	Burkina Faso	Yatenga Province	Ouahigouya	13.56700039	-2.417000055
128	XPA	Pama Airport	Africa	BF	Burkina Faso	Kompienga Province	Pama	11.25	0.6999999881
129	PUP	Po Airport	Africa	BF	Burkina Faso	Nahouri Province	Po	11.14999962	-1.149999976
130	XSE	Sebba Airport	Africa	BF	Burkina Faso	S??no Province	Sebba	13.44999981	0.5170000196
131	TMQ	Tambao Airport	Africa	BF	Burkina Faso	Oudalan Province	Tambao	14.790874	0.039492
132	TEG	Tenkodogo Airport	Africa	BF	Burkina Faso	Boulgou Province	Tenkodogo	11.80000019	-0.3670000136
133	TUQ	Tougan Airport	Africa	BF	Burkina Faso	Sourou Province	Tougan	13.06700039	-3.066999912
134	XZA	Zabr?? Airport	Africa	BF	Burkina Faso	Boulgou Province	Zabr??	11.16699982	-0.6169999838
135	BJM	Bujumbura Melchior Ndadaye International Airport	Africa	BI	Burundi	Bujumbura Mairie Province	Bujumbura	-3.32402	29.318501
136	GID	Gitega Airport	Africa	BI	Burundi	Gitega Province	Gitega	-3.417209	29.911308
137	KRE	Kirundo Airport	Africa	BI	Burundi	Kirundo Province	Kirundo	-2.544772	30.094575
138	BFX	Bafoussam Airport	Africa	CM	Cameroon	West Region	Bafoussam	5.536920071	10.35459995
139	BLC	Bali Airport	Africa	CM	Cameroon	North-West Region	Bali	5.895277778	10.03388889
140	BPC	Bamenda Airport	Africa	CM	Cameroon	North-West Region	Bamenda	6.039239883	10.1225996
141	OUR	Batouri Airport	Africa	CM	Cameroon	East Region	Batouri	4.474999905	14.36250019
142	BTA	Bertoua Airport	Africa	CM	Cameroon	East Region	Bertoua	4.54861021	13.72609997
143	DLA	Douala International Airport	Africa	CM	Cameroon	Littoral Region	Douala	4.006080151	9.719479561
144	DSC	Dschang Airport	Africa	CM	Cameroon	West Region	Dschang	5.449999809	10.06700039
145	EBW	Ebolowa Airport	Africa	CM	Cameroon	South Region	Ebolowa	2.875999928	11.18500042
146	FOM	Foumban Nkounja Airport	Africa	CM	Cameroon	West Region	Foumban	5.636919975	10.75080013
147	GOU	Garoua International Airport	Africa	CM	Cameroon	North Region	Garoua	9.335889816	13.37010002
148	KLE	Ka??l?? Airport	Africa	CM	Cameroon	Far North Region	Ka??l??	10.09249973	14.44559956
149	KBI	Kribi Airport	Africa	CM	Cameroon	South Region	Kribi	2.873889923	9.977780342
150	MMF	Mamfe Airport	Africa	CM	Cameroon	South-West Region	Mamfe	5.704170227	9.306389809
151	MVR	Salak Airport	Africa	CM	Cameroon	Far North Region	Maroua	10.4513998	14.25739956
152	NGE	N'Gaound??r?? Airport	Africa	CM	Cameroon	Adamaoua Region	N'Gaound??r??	7.357009888	13.55920029
153	TKC	Tiko Airport	Africa	CM	Cameroon	South-West Region	Tiko	4.089190006	9.3605299
154	GXX	Yagoua Airport	Africa	CM	Cameroon	Far North Region	Yagoua	10.35610008	15.23719978
155	YAO	Yaound?? Airport	Africa	CM	Cameroon	Centre Region	Yaound??	3.83604002	11.52350044
156	NSI	Yaound?? Nsimalen International Airport	Africa	CM	Cameroon	Centre Region	Yaound??	3.722559929	11.5532999
157	BVR	Esperadinha Airport	Africa	CV	Cape Verde	Sotavento Islands	Brava Island	14.864306	-24.746
158	SID	Am??lcar Cabral International Airport	Africa	CV	Cape Verde	Barlavento Islands	Espargos	16.7414	-22.9494
159	NTO	Agostinho Neto Airport	Africa	CV	Cape Verde	Barlavento Islands	Ponta do Sol	17.20280075	-25.09059906
160	RAI	Praia International Airport	Africa	CV	Cape Verde	Sotavento Islands	Praia	14.92450047	-23.49349976
161	SNE	Pregui??a Airport	Africa	CV	Cape Verde	Barlavento Islands	Pregui??a	16.588852	-24.284132
162	BVC	Rabil Airport	Africa	CV	Cape Verde	Barlavento Islands	Rabil	16.1364994	-22.88890076
163	SFL	S??o Filipe Airport	Africa	CV	Cape Verde	Sotavento Islands	S??o Filipe	14.88500023	-24.47999954
164	VXE	S??o Pedro Airport	Africa	CV	Cape Verde	Barlavento Islands	S??o Pedro	16.8332	-25.0553
165	MMO	Maio Airport	Africa	CV	Cape Verde	Sotavento Islands	Vila do Maio	15.1559	-23.21369934
166	MTI	Mosteiros Airport	Africa	CV	Cape Verde	Sotavento Islands	Vila do Mosteiros	15.04500008	-24.33919907
167	BMF	Bakouma Airport	Africa	CF	Central African Republic	Mbomou	Bakouma	5.693999767	22.8010006
168	BBY	Bambari Airport	Africa	CF	Central African Republic	Ouaka	Bambari	5.846940041	20.64749908
169	BGU	Bangassou Airport	Africa	CF	Central African Republic	Mbomou	Bangassou	4.784999847	22.78100014
170	BGF	Bangui M'Poko International Airport	Africa	CF	Central African Republic	Ombella-M'Poko	Bangui	4.398479939	18.51880074
171	BTG	Batangafo Airport	Africa	CF	Central African Republic	Ouham	Batangafo	7.314109802	18.30879974
172	BBT	Berb??rati Airport	Africa	CF	Central African Republic	Mamb??r??-Kad????	Berb??rati	4.221580029	15.78639984
173	IRO	Birao Airport	Africa	CF	Central African Republic	Vakaga	Birao	10.23639965	22.71689987
174	BSN	Bossangoa Airport	Africa	CF	Central African Republic	Ouham	Bossangoa	6.492000103	17.42900085
175	BOP	Bouar Airport	Africa	CF	Central African Republic	Nana-Mamb??r??	Bouar	5.958000183	15.63700008
176	BCF	Bouca Airport	Africa	CF	Central African Republic	Ouham	Bouca	6.517000198	18.2670002
177	BOZ	Bozoum Airport	Africa	CF	Central African Republic	Ouham-Pend??	Bozoum	6.344170094	16.32189941
178	BIV	Bria Airport	Africa	CF	Central African Republic	Haute-Kotto	Bria	6.527780056	21.98940086
179	CRF	Carnot Airport	Africa	CF	Central African Republic	Mamb??r??-Kad????	Carnot	4.936999798	15.89400005
180	MKI	M'Boki Airport	Africa	CF	Central African Republic	Haut-Mbomou	Mboki	5.333010197	25.93190002
181	GDI	Gordil Airport	Africa	CF	Central African Republic	Bamingui-Bangoran	Melle	9.581117	21.728172
182	NDL	N'D??l?? Airport	Africa	CF	Central African Republic	Bamingui-Bangoran	N'D??l??	8.427206039	20.63515663
183	ODA	Ouadda Airport	Africa	CF	Central African Republic	Haute-Kotto	Ouadda	8.010560036	22.39859962
184	ODJ	Ouanda Djall?? Airport	Africa	CF	Central African Republic	Vakaga	Ouanda Djall??	8.899999619	22.78300095
185	RFA	Rafa?? Airport	Africa	CF	Central African Republic	Mbomou	Rafa??	4.988609791	23.92779922
186	AIG	Yalinga Airport	Africa	CF	Central African Republic	Haute-Kotto	Yalinga	6.519999981	23.26000023
187	IMO	Zemio Airport	Africa	CF	Central African Republic	Haut-Mbomou	Zemio	5.002226	25.101857
188	AEH	Abeche Airport	Africa	TD	Chad	Ouaddai	Abeche	13.847	20.844299
189	AOD	Abou-De??a Airport	Africa	TD	Chad	Salamat	Abou-De??a	11.4773	19.2874
190	AMC	Am Timan Airport	Africa	TD	Chad	Salamat	Am Timan	11.0340004	20.27400017
191	ATV	Ati Airport	Africa	TD	Chad	Batha	Ati	13.23890018	18.31329918
192	BKR	Bokoro Airport	Africa	TD	Chad	Chari-Baguirmi	Bokoro	12.38300037	17.06699944
193	OTC	Bol Airport	Africa	TD	Chad	Lac	Bol	13.44330025	14.73939991
194	OGR	Bongor Airport	Africa	TD	Chad	Mayo-Kebbi	Bongor	10.28810024	15.3810997
195	OUT	Bousso Airport	Africa	TD	Chad	Chari-Baguirmi	Bousso	10.4829998	16.71699905
196	FYT	Faya Largeau Airport	Africa	TD	Chad	Borkou-Ennedi-Tibesti	Faya Largeau	17.91710091	19.11109924
197	LTC	Lai Airport	Africa	TD	Chad	Tandjile	Lai	9.3979	16.3125
198	AMO	Mao Airport	Africa	TD	Chad	Kanem	Mao	14.14560032	15.31439972
199	MEF	Melfi Airport	Africa	TD	Chad	Guera	Melfi	11.060192	17.944495
200	MVO	Mongo Airport	Africa	TD	Chad	Guera	Mongo	12.16699982	18.67499924
201	MQQ	Moundou Airport	Africa	TD	Chad	Logone-Occidental	Moundou	8.62441	16.0714
202	NDJ	N'Djamena International Airport	Africa	TD	Chad	Chari-Baguirmi	N'Djamena	12.1337	15.034
203	OUM	Oum Hadjer Airport	Africa	TD	Chad	Batha	Oum Hadjer	13.278244	19.710256
204	PLF	Pala Airport	Africa	TD	Chad	Mayo-Kebbi	Pala	9.378060341	14.92500019
205	SRH	Sarh Airport	Africa	TD	Chad	Moyen-Chari	Sarh	9.14444	18.374399
206	AKM	Zakuoma Airport	Africa	TD	Chad	Salamat	ZaKouma	10.89027778	19.81722222
207	NWA	Moh??li Bandar Es Eslam Airport	Africa	KM	Comoros	Moh??li (Mwali)	Fomboni	-12.2981	43.766399
208	HAH	Prince Said Ibrahim International Airport	Africa	KM	Comoros	Grande Comore (Ngazidja)	Moroni	-11.5337	43.2719
209	AJN	Ouani Airport	Africa	KM	Comoros	Anjouan (Ndzouani)	Ouani	-12.13169956	44.43030167
210	BTB	Betou Airport	Africa	CG	Congo (Brazzaville)	Likouala Department	Betou	3.057593	18.514433
211	BOE	Boundji Airport	Africa	CG	Congo (Brazzaville)	Cuvette Department	Boundji	-1.032999992	15.38300037
212	BZV	Maya-Maya Airport	Africa	CG	Congo (Brazzaville)	Pool Department	Brazzaville	-4.251699924	15.25300026
213	DJM	Djambala Airport	Africa	CG	Congo (Brazzaville)	Plateaux Department	Djambala	-2.516883	14.754403
214	DIS	Ngot Nzoungou Airport	Africa	CG	Congo (Brazzaville)	Niari Department	Dolisie	-4.20635	12.6599
215	EWO	Ewo Airport	Africa	CG	Congo (Brazzaville)	Cuvette Department	Ewo	-0.8830000162	14.80000019
216	GMM	Gamboma Airport	Africa	CG	Congo (Brazzaville)	Plateaux Department	Gamboma	-1.829403	15.885237
217	ION	Impfondo Airport	Africa	CG	Congo (Brazzaville)	Likouala Department	Impfondo	1.616999984	18.06699944
218	KEE	Kelle Airport	Africa	CG	Congo (Brazzaville)	Cuvette Department	Kelle	-0.08299999684	14.53299999
219	KNJ	Kindamba Airport	Africa	CG	Congo (Brazzaville)	Pool Department	Kindamba	-3.950000048	14.5170002
220	LCO	Lague Airport	Africa	CG	Congo (Brazzaville)	Plateaux Department	Lague	-2.450000048	14.53299999
221	LKC	Lekana Airport	Africa	CG	Congo (Brazzaville)	Plateaux Department	Lekana	-2.313	14.606
222	KMK	Makabana Airport	Africa	CG	Congo (Brazzaville)	Niari Department	Makabana	-3.48300004	12.61699963
223	MKJ	Makoua Airport	Africa	CG	Congo (Brazzaville)	Cuvette Department	Makoua	-0.01700000092	15.58300018
224	MSX	Mossendjo Airport	Africa	CG	Congo (Brazzaville)	Niari Department	Mossendjo	-2.950000048	12.69999981
225	MUY	Mouyondzi Airport	Africa	CG	Congo (Brazzaville)	Bouenza Department	Mouyondzi	-4.014873981	13.96611214
226	NKY	Yokangassi Airport	Africa	CG	Congo (Brazzaville)	Bouenza Department	Nkayi	-4.223077	13.286347
227	OKG	Okoyo Airport	Africa	CG	Congo (Brazzaville)	Cuvette Department	Okoyo	-1.448330045	15.07330036
228	OUE	Ouesso Airport	Africa	CG	Congo (Brazzaville)	Sangha Department	Ouesso	1.615990043	16.03790092
229	FTX	Owando Airport	Africa	CG	Congo (Brazzaville)	Cuvette Department	Owando	-0.5313500166	15.95009995
230	OLL	Oyo Ollombo Airport	Africa	CG	Congo (Brazzaville)	Plateaux Department	Oyo	-1.226666	15.91
231	PNR	Antonio Agostinho-Neto International Airport	Africa	CG	Congo (Brazzaville)	Kouilou Department	Pointe Noire	-4.81603	11.8866
232	SIB	Sibiti Airport	Africa	CG	Congo (Brazzaville)	L??koumou Department	Sibiti	-3.683000088	13.35000038
233	SOE	Souanke Airport	Africa	CG	Congo (Brazzaville)	Sangha Department	Souanke	2.066999912	14.13300037
234	ANJ	Zanaga Airport	Africa	CG	Congo (Brazzaville)	L??koumou Department	Zanaga	-2.849999905	13.81700039
235	FDU	Bandundu Airport	Africa	CD	Congo (Kinshasa)	Bandundu Province	Bandundu	-3.31132	17.381701
236	BSU	Basankusu Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Basankusu	1.22472	19.7889
237	BAN	Basongo Airport	Africa	CD	Congo (Kinshasa)	Kasai-Occidental Province	Basongo	-4.315802	20.414891
238	BNC	Beni Airport	Africa	CD	Congo (Kinshasa)	Nord-Kivu Province	Beni	0.575	29.4739
239	BNB	Boende Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Boende	-0.2169999927	20.85000038
240	BOA	Boma Airport	Africa	CD	Congo (Kinshasa)	Bas-Congo Province	Boma	-5.854	13.064
241	BKY	Bukavu Kavumu Airport	Africa	CD	Congo (Kinshasa)	Sud-Kivu Province	Bukavu Kavumu	-2.308979988	28.80879974
242	BMB	Bumbar Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Bumbar	2.18278	22.481701
243	BUX	Bunia Airport	Africa	CD	Congo (Kinshasa)	Orientale Province	Bunia	1.565719962	30.2208004
244	BZU	Buta Zega Airport	Africa	CD	Congo (Kinshasa)	Orientale Province	Buta Zega	2.818350077	24.79369926
245	RUE	Rughenda Airfield	Africa	CD	Congo (Kinshasa)	Nord-Kivu Province	Butembo	0.117142	29.312992
246	GDJ	Gandajika Airport	Africa	CD	Congo (Kinshasa)	Kasai-Oriental Province	Gandajika	-6.733	23.950001
247	BDT	Gbadolite Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Gbadolite	4.25321	20.9753
248	GMA	Gemena Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Gemena	3.235369921	19.77129936
249	GOM	Goma International Airport	Africa	CD	Congo (Kinshasa)	Nord-Kivu Province	Goma	-1.670809984	29.2385006
250	IDF	Idiofa Airport	Africa	CD	Congo (Kinshasa)	Bandundu Province	Idiofa	-5	19.60000038
251	IKL	Ikela Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Ikela	-1.048109	23.372501
252	PFR	Ilebo Airport	Africa	CD	Congo (Kinshasa)	Kasai-Occidental Province	Ilebo	-4.329919	20.590124
253	INO	Inongo Airport	Africa	CD	Congo (Kinshasa)	Bandundu Province	Inongo	-1.947219968	18.28580093
254	KBO	Kabalo Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kabalo	-6.083000183	26.91699982
255	KBN	Tunta Airport	Africa	CD	Congo (Kinshasa)	Kasai-Oriental Province	Kabinda	-6.132999897	24.4829998
256	FMI	Kalemie Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kalemie	-5.875559807	29.25
257	KLY	Kinkungwa Airport	Africa	CD	Congo (Kinshasa)	Maniema Province	Kalima	-2.578000069	26.73399925
258	KMN	Kamina Base Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kamina Base	-8.642020226	25.25289917
259	KGA	Kananga Airport	Africa	CD	Congo (Kinshasa)	Kasai-Occidental Province	Kananga	-5.900050163	22.46920013
260	KNM	Kaniama Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kaniama	-7.583000183	24.14999962
261	KAP	Kapanga Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kapanga	-8.350000381	22.58300018
262	KEC	Kasenga Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kasenga	-10.35000038	28.63299942
263	KKW	Kikwit Airport	Africa	CD	Congo (Kinshasa)	Bandundu Province	Kikwit	-5.03577	18.785601
264	KIL	Kilwa Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kilwa	-9.2886	28.3269
265	KND	Kindu Airport	Africa	CD	Congo (Kinshasa)	Maniema Province	Kindu	-2.919179916	25.91539955
266	FIH	Ndjili International Airport	Africa	CD	Congo (Kinshasa)	Kinshasa Province	Kinshasa	-4.38575	15.4446
267	KRZ	Basango Mboliasa Airport	Africa	CD	Congo (Kinshasa)	Bandundu Province	Kiri	-1.434999943	19.02400017
268	FKI	Bangoka International Airport	Africa	CD	Congo (Kinshasa)	Orientale Province	Kisangani	0.4816389978	25.33799934
269	KWZ	Kolwezi Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kolwezi	-10.76589966	25.50569916
270	KOO	Kongolo Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Kongolo	-5.39444	26.99
271	KLI	Kotakoli Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Kotakoli	4.15763998	21.65089989
272	LIE	Libenge Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Libenge	3.632999897	18.63299942
273	LIQ	Lisala Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Lisala	2.17066	21.496901
274	LJA	Lodja Airport	Africa	CD	Congo (Kinshasa)	Kasai-Oriental Province	Lodja	-3.462745	23.615162
275	FBM	Lubumbashi International Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Lubumbashi	-11.59130001	27.53089905
276	LZA	Luiza Airport	Africa	CD	Congo (Kinshasa)	Kasai-Occidental Province	Luiza	-7.183000088	22.39999962
277	LZI	Luozi Airport	Africa	CD	Congo (Kinshasa)	Bas-Congo Province	Luozi	-4.943881	14.123337
278	LBO	Lusambo Airport	Africa	CD	Congo (Kinshasa)	Kasai-Oriental Province	Lusambo	-4.961669922	23.37829971
279	LUS	Lusanga Airport	Africa	CD	Congo (Kinshasa)	Bandundu Province	Lusanga	-4.800000191	18.71699905
280	MNO	Manono Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Manono	-7.288889885	27.39439964
281	MSM	Masi Manimba Airport	Africa	CD	Congo (Kinshasa)	Bandundu Province	Masi Manimba	-4.782999992	17.85000038
282	MAT	Tshimpi Airport	Africa	CD	Congo (Kinshasa)	Bas-Congo Province	Matadi	-5.799610138	13.44040012
283	IRP	Matari Airport	Africa	CD	Congo (Kinshasa)	Orientale Province	Matari	2.827610016	27.5883007
284	MDK	Mbandaka Airport	Africa	CD	Congo (Kinshasa)	Equateur Province	Mbandaka	0.02260000072	18.2887001
285	MJM	Mbuji Mayi Airport	Africa	CD	Congo (Kinshasa)	Kasai-Oriental Province	Mbuji Mayi	-6.121240139	23.56900024
286	BDV	Moba Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Moba	-7.066999912	29.78300095
287	MNB	Muanda Airport	Africa	CD	Congo (Kinshasa)	Bas-Congo Province	Muanda	-5.930637	12.351334
288	MEW	Mweka Airport	Africa	CD	Congo (Kinshasa)	Kasai-Occidental Province	Mweka	-4.849999905	21.54999924
289	NLO	Ndolo Airport	Africa	CD	Congo (Kinshasa)	Kinshasa Province	N'dolo	-4.326660156	15.32750034
290	NKL	N'Kolo-Fuma Airport	Africa	CD	Congo (Kinshasa)	Bas-Congo Province	N'Kolo-Fuma	-5.421	14.8169
291	NIO	Nioki Airport	Africa	CD	Congo (Kinshasa)	Bandundu Province	Nioki	-2.717499971	17.68470001
292	PUN	Punia Airport	Africa	CD	Congo (Kinshasa)	Maniema Province	Punia	-1.366999984	26.33300018
293	PWO	Pweto Airport	Africa	CD	Congo (Kinshasa)	Katanga Province	Pweto	-8.467000008	28.88299942
294	TSH	Tshikapa Airport	Africa	CD	Congo (Kinshasa)	Kasai-Occidental Province	Tshikapa	-6.43833	20.794701
295	YAN	Yangambi Airport	Africa	CD	Congo (Kinshasa)	Orientale Province	Yangambi	0.7829999924	24.46699905
296	OGO	Abengourou Airport	Africa	CI	C??te d'Ivoire	Moyen-Como??	Abengourou	6.715559959	-3.470279932
297	ABJ	F??lix-Houphou??t-Boigny International Airport	Africa	CI	C??te d'Ivoire	Lagunes	Abidjan	5.26139	-3.92629
298	ABO	Aboisso Airport	Africa	CI	C??te d'Ivoire	Sud-Como??	Aboisso	5.461944	-3.234722
299	BDK	Soko Airport	Africa	CI	C??te d'Ivoire	Zanzan	Bondoukou	8.017219543	-2.761940002
300	BYK	Bouak?? Airport	Africa	CI	C??te d'Ivoire	Vall??e du Bandama	Bouak??	7.7388	-5.07367
301	BQO	Bouna Airport	Africa	CI	C??te d'Ivoire	Zanzan	Bouna	9.277500153	-3.025279999
302	BXI	Boundiali Airport	Africa	CI	C??te d'Ivoire	Savanes	Boundiali	9.532999992	-6.467000008
303	DJO	Daloa Airport	Africa	CI	C??te d'Ivoire	Haut-Sassandra	Daloa	6.792809963	-6.473189831
304	DIM	Dimbokro Airport	Africa	CI	C??te d'Ivoire	N'zi-Como??	Dimbokro	6.651669979	-4.64056015
305	FEK	Ferkessedougou Airport	Africa	CI	C??te d'Ivoire	Savanes	Ferkessedougou	9.6	-5.1833333
306	GGN	Gagnoa Airport	Africa	CI	C??te d'Ivoire	Haut-Sassandra	Gagnoa	6.132999897	-5.949999809
307	BBV	Nero-Mer Airport	Africa	CI	C??te d'Ivoire	Bas-Sassandra	Grand-B??r??by	4.643413067	-6.923961639
308	GGO	Guiglo Airport	Africa	CI	C??te d'Ivoire	Moyen-Cavally	Guiglo	6.534711	-7.526847
309	KTC	Katiola Airport	Africa	CI	C??te d'Ivoire	Vall??e du Bandama	Katiola	8.1329	-5.0657
310	HGO	Korhogo Airport	Africa	CI	C??te d'Ivoire	Savanes	Korhogo	9.387180328	-5.556660175
311	MJC	Man Airport	Africa	CI	C??te d'Ivoire	Dix-Huit Montagnes	Man	7.272069931	-7.587359905
312	KEO	Odienne Airport	Africa	CI	C??te d'Ivoire	Dengu??l??	Odienne	9.5	-7.566999912
313	OFI	Ouango Fitini Airport	Africa	CI	C??te d'Ivoire	Zanzan	Ouango Fitini	9.600000381	-4.050000191
314	SPY	San Pedro Airport	Africa	CI	C??te d'Ivoire	Bas-Sassandra	San Pedro	4.746719837	-6.660820007
315	ZSS	Sassandra Airport	Africa	CI	C??te d'Ivoire	Bas-Sassandra	Sassandra	4.928888	-6.133156
316	SEO	Seguela Airport	Africa	CI	C??te d'Ivoire	Worodouqou	Seguela	7.968329906	-6.710830212
317	TXU	Tabou Airport	Africa	CI	C??te d'Ivoire	Bas-Sassandra	Tabou	4.437809467	-7.362728119
318	TOZ	Mahana Airport	Africa	CI	C??te d'Ivoire	Bafing	Touba	8.2934	-7.674
319	ASK	Yamoussoukro Airport	Africa	CI	C??te d'Ivoire	Lacs	Yamoussoukro	6.903170109	-5.365580082
320	AII	Ali-Sabieh Airport	Africa	DJ	Djibouti	Ali Sabiah Region	Ali-Sabieh	11.146889	42.72
321	JIB	Djibouti-Ambouli Airport	Africa	DJ	Djibouti	Djibouti Region	Djibouti City	11.5473	43.1595
322	MHI	Moucha Airport	Africa	DJ	Djibouti	Djibouti Region	Moucha Island	11.72975	43.209559
323	OBC	Obock Airport	Africa	DJ	Djibouti	Obock Region	Obock	11.96700001	43.26699829
324	TDJ	Tadjoura Airport	Africa	DJ	Djibouti	Tadjoura Region	Tadjoura	11.787037	42.917376
325	ABS	Abu Simbel Airport	Africa	EG	Egypt	Aswan Governorate	Abu Simbel	22.37599945	31.61170006
326	DAK	Dakhla Airport	Africa	EG	Egypt	New Valley Governorate	Al Wahat Al Dakhla	25.4116	29.003099
327	HBE	Borj El Arab International Airport	Africa	EG	Egypt	Alexandria Governorate	Alexandria	30.93249	29.696437
328	ASW	Aswan International Airport	Africa	EG	Egypt	Aswan Governorate	Aswan	23.96439934	32.81999969
329	ATZ	Asyut International Airport	Africa	EG	Egypt	Asyut Governorate	Asyut	27.050818	31.016309
330	EES	Berenice International Airport / Ras Banas Air Base	Africa	EG	Egypt	Red Sea Governorate	Berenice Troglodytica	23.9741	35.4603
331	CAI	Cairo International Airport	Africa	EG	Egypt	Cairo Governorate	Cairo	30.12190056	31.40559959
332	DBB	El Alamein International Airport	Africa	EG	Egypt	Matruh Governorate	El Alamein	30.9245	28.461399
333	UVL	El Kharga Airport	Africa	EG	Egypt	New Valley Governorate	El Kharga	25.47360039	30.59070015
334	SPX	Sphinx International Airport	Africa	EG	Egypt	Giza Governorate	Giza	30.108148	30.89569
335	HRG	Hurghada International Airport	Africa	EG	Egypt	Red Sea Governorate	Hurghada	27.180325	33.807292
336	LXR	Luxor International Airport	Africa	EG	Egypt	Qena Governorate	Luxor	25.674629	32.700012
337	RMF	Marsa Alam International Airport	Africa	EG	Egypt	Red Sea Governorate	Marsa Alam	25.5571003	34.58369827
338	MUH	Marsa Matruh Airport	Africa	EG	Egypt	Matruh Governorate	Marsa Matruh	31.325399	27.221701
339	EMY	El Minya Airport	Africa	EG	Egypt	Minya Governorate	Minya	28.10129929	30.7303009
340	CCE	Capital International Airport	Africa	EG	Egypt	Cairo Governorate	New Cairo	30.074293	31.84296
341	PSD	Port Said International Airport	Africa	EG	Egypt	Port Said Governorate	Port Said	31.2794	32.240002
342	GSQ	Sharq El Owainat International Airport	Africa	EG	Egypt	New Valley Governorate	Sharq El Owainat	22.5853	28.715372
343	SQK	Sidi Barrani Airport	Africa	EG	Egypt	Matruh Governorate	Sidi Barrani	31.46660042	25.87800026
344	SEW	Siwa Oasis North Airport	Africa	EG	Egypt	Matruh Governorate	Siwa	29.345621	25.505762
345	HMB	Suhaj Mubarak International Airport	Africa	EG	Egypt	Sohag Governorate	Suhaj	26.339115	31.737624
346	BSG	Bata Airport	Africa	GQ	Equatorial Guinea	Litoral Province	Bata	1.90547	9.80568
347	OCS	Corisco International Airport	Africa	GQ	Equatorial Guinea	Litoral Province	Corisco Island	0.9125	9.3304
348	SSG	Malabo Airport	Africa	GQ	Equatorial Guinea	Bioko Norte Province	Malabo	3.755270004	8.708720207
349	MDV	M??douneu Airport	Africa	GQ	Equatorial Guinea	Centro Sur Province	M??douneu, Gabon	1.0085	10.7552
350	GEM	President Obiang Nguema International Airport	Africa	GQ	Equatorial Guinea	Wele-Nzas Province	Mengomey??n	1.685334	11.024394
351	NBN	Annob??n Airport	Africa	GQ	Equatorial Guinea	Annob??n Province	San Antonio de Pal??	-1.410277	5.621944
352	ASA	Assab International Airport	Africa	ER	Eritrea	Debubawi Keyih Bahri	Asab	13.07180023	42.64500046
353	ASM	Asmara International Airport	Africa	ER	Eritrea	Semenawi Keyih Bahri	Asmara	15.29189968	38.91070175
354	MSW	Massawa International Airport	Africa	ER	Eritrea	Semenawi Keyih Bahri	Massawa	15.67000008	39.37009811
355	TES	Tessenei Airport	Africa	ER	Eritrea	Gash-Barka	Tessenei	15.104322	36.681711
356	MTS	Matsapha Airport	Africa	SZ	Eswatini	Manzini Region	Manzini	-26.528999	31.307501
357	SHO	King Mswati III International Airport	Africa	SZ	Eswatini	Lubombo Region	Mpaka	-26.358611	31.716944
358	ADD	Addis Ababa Bole International Airport	Africa	ET	Ethiopia	Addis Ababa	Addis Ababa	8.97789	38.799301
359	AMH	Arba Minch Airport	Africa	ET	Ethiopia	Southern Nations, Nationalities, and Peoples' Region	Arba Minch	6.039390087	37.59049988
360	ASO	Asosa Airport	Africa	ET	Ethiopia	Benishangul-Gumuz Region	Asosa	10.01850033	34.5862999
361	AWA	Awasa Airport	Africa	ET	Ethiopia	Sidama Region	Awasa	7.095	38.398333
362	AXU	Axum Airport	Africa	ET	Ethiopia	Tigray Region	Axum	14.14680004	38.77280045
363	BCO	Baco Airport	Africa	ET	Ethiopia	Southern Nations, Nationalities, and Peoples' Region	Baco	5.78287	36.562
364	BJR	Bahir Dar Airport	Africa	ET	Ethiopia	Amhara Region	Bahir Dar	11.60809994	37.32160187
365	BEI	Beica Airport	Africa	ET	Ethiopia	Oromia Region	Beica	9.38639	34.5219
366	DBM	Debra Marcos Airport	Africa	ET	Ethiopia	Amhara Region	Debra Marcos	10.35000038	37.71699905
367	DBT	Debre Tabor Airport	Africa	ET	Ethiopia	Amhara Region	Debre Tabor	11.96700001	38
368	QHR	Harar Meda Airport	Africa	ET	Ethiopia	Oromia Region	Debre Zeyit	8.7163	39.0059
369	DEM	Dembidollo Airport	Africa	ET	Ethiopia	Gambela Region	Dembidollo	8.553999901	34.85800171
370	DSE	Combolcha Airport	Africa	ET	Ethiopia	Amhara Region	Dessie	11.08250046	39.71139908
371	DIR	Aba Tenna Dejazmach Yilma International Airport	Africa	ET	Ethiopia	Dire Dawa	Dire Dawa	9.624699593	41.85419846
372	FNH	Fincha Airport	Africa	ET	Ethiopia	Oromia Region	Fincha	9.583000183	37.34999847
373	GMB	Gambella Airport	Africa	ET	Ethiopia	Gambela Region	Gambela	8.128760338	34.56309891
374	GLC	Geladi Airport	Africa	ET	Ethiopia	Somali Region	Geladi	6.98443985	46.42139816
375	GNN	Ghinnir Airport	Africa	ET	Ethiopia	Oromia Region	Ghinnir	7.150000095	40.71699905
376	GOB	Robe Airport	Africa	ET	Ethiopia	Oromia Region	Goba	7.1160634	40.0463033
377	GDE	Gode Airport	Africa	ET	Ethiopia	Somali Region	Gode	5.935130119	43.57860184
378	GDQ	Gonder Airport	Africa	ET	Ethiopia	Amhara Region	Gondar	12.51990032	37.43399811
379	GOR	Gore Airport	Africa	ET	Ethiopia	Oromia Region	Gore	8.1614	35.5529
380	HUE	Humera Airport	Africa	ET	Ethiopia	Tigray Region	Humera	14.283973	36.581369
381	JIJ	Wilwal International Airport	Africa	ET	Ethiopia	Somali Region	Jijiga	9.3325	42.9121
382	JIM	Jimma Airport	Africa	ET	Ethiopia	Oromia Region	Jimma	7.666090012	36.8166008
383	ABK	Kebri Dahar Airport	Africa	ET	Ethiopia	Somali Region	Kebri Dahar	6.732577	44.241339
384	LFO	Kelafo East Airport	Africa	ET	Ethiopia	Somali Region	Kelafo	5.657000065	44.34999847
385	LLI	Lalibella Airport	Africa	ET	Ethiopia	Amhara Region	Lalibela	11.97500038	38.97999954
386	MKS	Mekane Selam Airport	Africa	ET	Ethiopia	Amhara Region	Mekane Selam	10.7254	38.7415
387	MQX	Mekele Airport	Africa	ET	Ethiopia	Tigray Region	Mekele	13.4673996	39.53350067
388	NDM	Mendi Airport	Africa	ET	Ethiopia	Oromia Region	Mendi	9.767	35.099998
389	ETE	Metema Airport	Africa	ET	Ethiopia	Amhara Region	Metema	12.93299961	36.16699982
390	MTF	Mizan Teferi Airport	Africa	ET	Ethiopia	Gambela Region	Mizan Teferi	6.9571	35.5547
391	MYS	Moyale Airport	Africa	ET	Ethiopia	Oromia Region	Moyale	3.5623	39.0433
392	EGL	Negele Airport	Africa	ET	Ethiopia	Oromia Region	Negele Borana	5.2897	39.7023
393	NEJ	Nejjo Airport	Africa	ET	Ethiopia	Oromia Region	Nejo	9.55	35.466995
394	NEK	Nekemte Airport	Africa	ET	Ethiopia	Oromia Region	Nekemte	9.050000191	36.59999847
395	MUJ	Mui River Airport	Africa	ET	Ethiopia	Southern Nations, Nationalities, and Peoples' Region	Omo National Park	5.8646	35.7485
396	PWI	Beles Airport	Africa	ET	Ethiopia	Benishangul-Gumuz Region	Pawe	11.3126	36.4164
397	SZE	Semera Airport	Africa	ET	Ethiopia	Afar Region	Semera	11.7875	40.9915
398	SKR	Shakiso Airport	Africa	ET	Ethiopia	Oromia Region	Shakiso	5.6923	38.9764
399	HIL	Shilavo Airport	Africa	ET	Ethiopia	Somali Region	Shilavo	6.077545	44.763736
400	SHC	Shire Inda Selassie Airport	Africa	ET	Ethiopia	Tigray Region	Shire Indasilase	14.0781002	38.27249908
401	SXU	Soddu Airport	Africa	ET	Ethiopia	Oromia Region	Soddu	6.816999912	37.75
402	TIE	Tippi Airport	Africa	ET	Ethiopia	Gambela Region	Tippi	7.2024	35.415
403	TUJ	Tum Airport	Africa	ET	Ethiopia	Southern Nations, Nationalities, and Peoples' Region	Tum	6.26	35.5184
404	WAC	Waca Airport	Africa	ET	Ethiopia	Oromia Region	Waca	7.166999817	37.16699982
405	WRA	Warder Airport	Africa	ET	Ethiopia	Somali Region	Warder	6.9724	45.3334
406	AKE	Akieni Airport	Africa	GA	Gabon	Haut-Ogoou?? Province	Akieni	-1.139670014	13.90359974
407	BMM	Bitam Airport	Africa	GA	Gabon	Woleu-Ntem Province	Bitam	2.075639963	11.4932003
408	BGB	Booue Airport	Africa	GA	Gabon	Ogoou??-Ivindo Province	Booue	-0.1075	11.9438
409	FOU	Fougamou Airport	Africa	GA	Gabon	Ngouni?? Province	Fougamou	-1.278325	10.612497
410	MVB	M'Vengue El Hadj Omar Bongo Ondimba International Airport	Africa	GA	Gabon	Haut-Ogoou?? Province	Franceville	-1.656159997	13.43799973
411	GAX	Gamba Airport	Africa	GA	Gabon	Ogoou??-Maritime Province	Gamba	-2.785278	10.047222
412	IGE	Tchongorove Airport	Africa	GA	Gabon	Ogoou??-Maritime Province	Iguela	-1.930801	9.319577
413	KOU	Koulamoutou Mabimbi Airport	Africa	GA	Gabon	Ogoou??-Lolo Province	Koulamoutou	-1.184610009	12.44130039
414	LBQ	Lambarene Airport	Africa	GA	Gabon	Moyen-Ogoou?? Province	Lambarene	-0.7043889761	10.24569988
415	LTL	Lastourville Airport	Africa	GA	Gabon	Ogoou??-Lolo Province	Lastourville	-0.8266670108	12.74860001
416	LEO	Lekoni Airport	Africa	GA	Gabon	Haut-Ogoou?? Province	Lekoni	-1.5724	14.2878
417	LBV	Libreville Leon M'ba International Airport	Africa	GA	Gabon	Estuaire Province	Libreville	0.4586000144	9.412280083
418	MBC	M'Bigou Airport	Africa	GA	Gabon	Ngouni?? Province	M'Bigou	-1.883000016	11.93299961
419	MKU	Makokou Airport	Africa	GA	Gabon	Ogoou??-Ivindo Province	Makokou	0.5792109966	12.89089966
420	MYB	Mayumba Airport	Africa	GA	Gabon	Nyanga Province	Mayumba	-3.458372	10.676539
421	MKB	Mekambo Airport	Africa	GA	Gabon	Ogoou??-Ivindo Province	Mekambo	1.01699996	13.93299961
422	MVX	Minvoul Airport	Africa	GA	Gabon	Woleu-Ntem Province	Minvoul	2.150000095	12.13300037
423	MZC	Mitzic Airport	Africa	GA	Gabon	Woleu-Ntem Province	Mitzic	0.7829999924	11.55000019
424	MGX	Moabi Airport	Africa	GA	Gabon	Nyanga Province	Moabi	-2.455187	10.9358
425	MFF	Moanda Airport	Africa	GA	Gabon	Haut-Ogoou?? Province	Moanda	-1.532999992	13.2670002
426	MJL	Mouilla Ville Airport	Africa	GA	Gabon	Ngouni?? Province	Mouila	-1.84513998	11.05669975
427	KDJ	Ville Airport	Africa	GA	Gabon	Moyen-Ogoou?? Province	N'Djol??	-0.1829999983	10.75
428	KDN	Ndende Airport	Africa	GA	Gabon	Ngouni?? Province	Ndende	-2.400000095	11.36699963
429	OKN	Okondja Airport	Africa	GA	Gabon	Haut-Ogoou?? Province	Okondja	-0.6652140021	13.67310047
430	OMB	Omboue Hospital Airport	Africa	GA	Gabon	Ogoou??-Maritime Province	Omboue	-1.57473	9.26269
431	OYE	Oyem Airport	Africa	GA	Gabon	Woleu-Ntem Province	Oyem	1.543110013	11.58139992
432	POG	Port Gentil Airport	Africa	GA	Gabon	Ogoou??-Maritime Province	Port Gentil	-0.7117390037	8.754380226
433	ZKM	Sette Cama Airport	Africa	GA	Gabon	Ogoou??-Maritime Province	Sette Cama	-2.53732	9.76386
434	TCH	Tchibanga Airport	Africa	GA	Gabon	Nyanga Province	Tchibanga	-2.88848	10.955429
435	AWE	Alowe Airport	Africa	GA	Gabon	Moyen-Ogoou?? Province	Wonga Wongu?? Presidential Reserve	-0.545	9.444
436	BJL	Banjul International Airport	Africa	GM	Gambia	Western Division	Banjul	13.338	-16.652201
437	ACC	Kotoka International Airport	Africa	GH	Ghana	Greater Accra Region	Accra	5.6051898	-0.1667860001
438	KMS	Kumasi Airport	Africa	GH	Ghana	Ashanti Region	Kumasi	6.714560032	-1.590819955
439	TKD	Takoradi Airport	Africa	GH	Ghana	Western Region	Sekondi-Takoradi	4.89605999	-1.774760008
440	NYI	Sunyani Airport	Africa	GH	Ghana	Brong-Ahafo Region	Sunyani	7.361830235	-2.328759909
441	TML	Tamale Airport	Africa	GH	Ghana	Northern Region	Tamale	9.557189941	-0.863214016
442	BKJ	Bok?? Baralande Airport	Africa	GN	Guinea	Bok?? Region	Bok??	10.9658	-14.2811
443	CKY	Conakry International Airport	Africa	GN	Guinea	Conakry Special Zone	Conakry	9.57689	-13.612
444	FAA	Faranah Airport	Africa	GN	Guinea	Faranah Region	Faranah	10.03549957	-10.76980019
445	FIG	Fria Airport	Africa	GN	Guinea	Bok?? Region	Fria	10.3506	-13.5692
446	KNN	Kankan Airport	Africa	GN	Guinea	Kankan Region	Kankan	10.448438	-9.228757
447	KSI	Kissidougou Airport	Africa	GN	Guinea	Faranah Region	Kissidougou	9.160559654	-10.12440014
448	SBI	Sambailo Airport	Africa	GN	Guinea	Bok?? Region	Koundara	12.575315	-13.363349
449	LEK	Tata Airport	Africa	GN	Guinea	Lab?? Region	Lab??	11.337512	-12.290869
450	MCA	Macenta Airport	Africa	GN	Guinea	Nz??r??kor?? Region	Macenta	8.481857	-9.525071
451	NZE	Nz??r??kor?? Airport	Africa	GN	Guinea	Nz??r??kor?? Region	Nz??r??kor??	7.810413	-8.702073
452	GII	Siguiri Airport	Africa	GN	Guinea	Kankan Region	Siguiri	11.399833	-9.18841
453	OXB	Osvaldo Vieira International Airport	Africa	GW	Guinea-Bissau	Bissau Autonomous Sector	Bissau	11.89480019	-15.65369987
454	BQE	Bubaque Airport	Africa	GW	Guinea-Bissau	Bolama Region	Bubaque	11.29735565	-15.83807945
455	ASV	Amboseli Airport	Africa	KE	Kenya	Rift Valley Province	Amboseli National Park	-2.645050049	37.25310135
456	BMQ	Bamburi Airport	Africa	KE	Kenya	Coast Province	Bamburi	-3.983363	39.730982
457	EDL	Eldoret International Airport	Africa	KE	Kenya	Rift Valley Province	Eldoret	0.4044579864	35.23889923
458	EYS	Eliye Springs Airport	Africa	KE	Kenya	Rift Valley Province	Eliye Springs	3.216670036	35.96670151
459	GAS	Garissa Airport	Africa	KE	Kenya	North-Eastern Province	Garissa	-0.4635080099	39.64830017
460	HOA	Hola Airport	Africa	KE	Kenya	Coast Province	Hola	-1.521999955	40.00400162
461	GGM	Kakamega Airport	Africa	KE	Kenya	Western Province	Kakamega	0.2713420093	34.78730011
462	KLK	Kalokol Airport	Africa	KE	Kenya	Rift Valley Province	Kalokol	3.49161	35.836777
463	KEU	Keekorok Airport	Africa	KE	Kenya	Rift Valley Province	Keekorok	-1.586345	35.257455
464	KEY	Kericho Airport	Africa	KE	Kenya	Rift Valley Province	Kericho	-0.3899	35.242093
465	KTJ	Kichwa Tembo Airport	Africa	KE	Kenya	Rift Valley Province	Kichwa Tembo	-1.263497	35.027533
466	ILU	Kilaguni Airport	Africa	KE	Kenya	Coast Province	Kilaguni	-2.910609961	38.06520081
467	KRV	Kerio Valley Airport	Africa	KE	Kenya	Rift Valley Province	Kimwarer	0.3196380138	35.66255951
468	KIS	Kisumu Airport	Africa	KE	Kenya	Nyanza Province	Kisumu	-0.08613900095	34.72890091
469	KTL	Kitale Airport	Africa	KE	Kenya	Rift Valley Province	Kitale	0.971988976	34.95859909
470	KIU	Kiunga Airport	Africa	KE	Kenya	Coast Province	Kiunga	-1.743829012	41.48434448
471	KWY	Kiwayu Airport	Africa	KE	Kenya	Coast Province	Kiwayu	-1.960559964	41.29750061
472	LBN	Lake Baringo Airport	Africa	KE	Kenya	Rift Valley Province	Lake Baringo	0.6661030054	36.10419083
473	LKU	Lake Rudolf Airport	Africa	KE	Kenya	Rift Valley Province	Lake Rudolf	3.416666985	35.8833313
474	LAU	Manda Airport	Africa	KE	Kenya	Coast Province	Lamu	-2.252431	40.912892
475	LBK	Liboi Airport	Africa	KE	Kenya	North-Eastern Province	Liboi	0.3483330011	40.88169861
476	LOK	Lodwar Airport	Africa	KE	Kenya	Rift Valley Province	Lodwar	3.121969938	35.6086998
477	LKG	Lokichoggio Airport	Africa	KE	Kenya	Rift Valley Province	Lokichoggio	4.204120159	34.34820175
478	LOY	Loyengalani Airport	Africa	KE	Kenya	Eastern Province	Loyengalani	2.75	36.71699905
479	ANA	Angama Airport	Africa	KE	Kenya	Rift Valley Province	Maasai Mara	-1.27156	34.955513
480	MYD	Malindi Airport	Africa	KE	Kenya	Coast Province	Malindi	-3.229310036	40.10169983
481	NDE	Mandera Airport	Africa	KE	Kenya	North-Eastern Province	Mandera	3.933000088	41.84999847
482	HKR	Mara North Conservancy Airstrip	Africa	KE	Kenya	Rift Valley Province	Mara	-1.14542	35.124922
483	RBT	Marsabit Airport	Africa	KE	Kenya	Eastern Province	Marsabit	2.344254	37.999996
484	MRE	Mara Serena Lodge Airstrip	Africa	KE	Kenya	Rift Valley Province	Masai Mara	-1.406111	35.008057
485	JJM	Mulika Lodge Airport	Africa	KE	Kenya	Eastern Province	Meru-Kinna	0.165083	38.195141
486	MBA	Moi International Airport	Africa	KE	Kenya	Coast Province	Mombasa	-4.03483	39.5942
487	OYL	Moyale Airport	Africa	KE	Kenya	Eastern Province	Moyale (Lower)	3.46972	39.101398
488	MUM	Mumias Airport	Africa	KE	Kenya	Western Province	Mumias	0.355399	34.528234
489	MDR	Musiara Airstrip	Africa	KE	Kenya	Rift Valley Province	Musiara	-1.298636	35.063885
490	NBO	Jomo Kenyatta International Airport	Africa	KE	Kenya	Nairobi Province	Nairobi	-1.319239974	36.92779922
491	WIL	Nairobi Wilson Airport	Africa	KE	Kenya	Nairobi Province	Nairobi	-1.321720004	36.81480026
492	NUU	Nakuru Airport	Africa	KE	Kenya	Rift Valley Province	Nakuru	-0.298067	36.159302
493	NYK	Nanyuki Airport	Africa	KE	Kenya	Central Province	Nanyuki	-0.062399	37.041008
494	NYE	Nyeri Airport	Africa	KE	Kenya	Central Province	Nyeri	-0.3644140065	36.97848511
495	OSJ	Ol Seki Airstrip	Africa	KE	Kenya	Rift Valley Province	Ol Seki	-1.378382	35.378453
496	OLG	Olare Orok Airfield	Africa	KE	Kenya	Rift Valley Province	Olare Orok	-1.324213	35.246106
497	OLX	Olkiombo Airport	Africa	KE	Kenya	Rift Valley Province	Olkiombo	-1.408586	35.110689
498	UAS	Samburu Airport	Africa	KE	Kenya	Rift Valley Province	Samburu	0.534069	37.531991
499	UKA	Ukunda Airstrip	Africa	KE	Kenya	Coast Province	Ukunda	-4.29333	39.571098
500	VPG	Vipingo Estate Airport	Africa	KE	Kenya	Coast Province	Vipingo Estate	-3.806666667	39.79738889
501	WJR	Wajir Airport	Africa	KE	Kenya	North-Eastern Province	Wajir	1.73324	40.091599
502	LEF	Lebakeng Airport	Africa	LS	Lesotho	Qacha's Nek	Lebakeng	-29.89080048	28.65559959
503	LRB	Leribe Airport	Africa	LS	Lesotho	Leribe	Leribe	-28.85560036	28.05279922
504	LES	Lesobeng Airport	Africa	LS	Lesotho	Mohale's Hoek	Lesobeng	-29.78289986	28.31669998
505	MFC	Mafeteng Airport	Africa	LS	Lesotho	Mafeteng	Mafeteng	-29.80109978	27.24360085
506	MSU	Moshoeshoe I International Airport	Africa	LS	Lesotho	Maseru	Maseru	-29.46229935	27.55249977
507	MKH	Mokhotlong Airport	Africa	LS	Lesotho	Mokhotlong	Mokhotlong	-29.28179932	29.07279968
508	NKU	Nkaus Airport	Africa	LS	Lesotho	Mohale's Hoek	Nkaus	-30.02169991	28.19689941
509	PEL	Pelaneng Airport	Africa	LS	Lesotho	Leribe	Pelaneng	-29.12059975	28.50530052
510	UNE	Qacha's Nek Airport	Africa	LS	Lesotho	Qacha's Nek	Qacha's Nek	-30.11170006	28.6718998
511	UTG	Quthing Airport	Africa	LS	Lesotho	Quthing	Quthing	-30.40749931	27.69330025
512	SHK	Sehonghong Airport	Africa	LS	Lesotho	Thaba-Tseka	Sehonghong	-29.731088	28.767945
513	SKQ	Sekakes Airport	Africa	LS	Lesotho	Qacha's Nek	Sekakes	-30.03890038	28.37030029
514	SOK	Semonkong Airport	Africa	LS	Lesotho	Maseru	Semonkong	-29.83860016	28.05999947
515	SHZ	Seshutes Airport	Africa	LS	Lesotho	Leribe	Seshutes	-29.26759911	28.5522995
516	THB	Thaba-Tseka Airport	Africa	LS	Lesotho	Thaba-Tseka	Thaba-Tseka	-29.52280045	28.61580086
517	TKO	Tlokoeng Airport	Africa	LS	Lesotho	Mokhotlong	Tlokoeng	-29.2329998	28.88299942
518	BYL	Bella Yella Airport	Africa	LR	Liberia	Lofa County	Beliyela	7.369166667	-9.993722222
519	UCN	Buchanan Airport	Africa	LR	Liberia	Grand Basaa County	Buchanan	5.905503	-10.058262
520	FOY	Foya Airport	Africa	LR	Liberia	Lofa County	Foya	8.3513	-10.2269
521	GRC	Grand Cess Airport	Africa	LR	Liberia	Grand Kru County	Grand Cess	4.571	-8.2076
522	SNI	Greenville/Sinoe Airport	Africa	LR	Liberia	Sinoe County	Greenville	5.032124	-9.064236
523	CPA	Cape Palmas Airport	Africa	LR	Liberia	Maryland County	Harper	4.379020214	-7.696949959
524	ROB	Roberts International Airport	Africa	LR	Liberia	Margibi County	Monrovia	6.23379	-10.3623
525	MLW	Spriggs Payne Airport	Africa	LR	Liberia	Montserrado County	Monrovia	6.289060116	-10.75870037
526	NIA	Nimba Airport	Africa	LR	Liberia	Nimba County	Nimba	7.5	-8.600000381
1127	GWA	Gwa Airport	Asia	MM	Burma	Rakhine State	Gwa	17.60000038	94.58329773
527	RVC	River Cess Airport and Heliport	Africa	LR	Liberia	Rivercess County	River Cess	5.472469	-9.58546
528	SAZ	Sasstown Airport	Africa	LR	Liberia	Grand Kru County	Sasstown	4.681845	-8.434668
529	TPT	Tapeta Airport	Africa	LR	Liberia	Nimba County	Tapeta	6.4948	-8.873
530	VOI	Voinjama Airport	Africa	LR	Liberia	Lofa County	Voinjama	8.32347	-9.769249
531	THC	Tchien Airport	Africa	LR	Liberia	Grand Gedeh County	Zwedru	6.04565	-8.138723
532	LAQ	Al Abraq International Airport	Africa	LY	Libya	Al Jabal al Akhdar District	Al Bayda'	32.7887	21.9643
533	BEN	Benina International Airport	Africa	LY	Libya	Benghazi District	Benghazi	32.09680176	20.26950073
534	BCQ	Brak Airport	Africa	LY	Libya	Wadi Al Shatii District	Brak	27.653	14.272
535	DNF	Martubah Airport	Africa	LY	Libya	Darnah District	Derna	32.54199982	22.74500084
536	LTD	Ghadames East Airport	Africa	LY	Libya	Nalut District	Ghadames	30.15169907	9.715310097
537	GHT	Ghat Airport	Africa	LY	Libya	Ghat District	Ghat	25.14559937	10.14260006
538	HUQ	Hon Airport	Africa	LY	Libya	Al Jufrah District	Hon	29.1101	15.9656
539	AKF	Kufra Airport	Africa	LY	Libya	Al Kufrah District	Kufra	24.17869949	23.31399918
540	LMQ	Marsa Brega Airport	Africa	LY	Libya	Al Wahat District	Marsa Brega	30.37809944	19.57640076
541	MRA	Misratah Airport	Africa	LY	Libya	Misurata District	Misratah	32.32500076	15.06099987
542	NFR	Nafurah 1 Airport	Africa	LY	Libya	Al Wahat District	Nafurah 1	29.2132	21.5924
543	SEB	Sabha Airport	Africa	LY	Libya	Sabha District	Sabha	26.98699951	14.47249985
544	SRX	Gardabya Airport	Africa	LY	Libya	Surt District	Sirt	31.06349945	16.59499931
545	TOB	Gamal Abdel Nasser Airport	Africa	LY	Libya	Al Butnan District	Tobruk	31.861	23.907
546	MJI	Mitiga Airport	Africa	LY	Libya	Tripoli District	Tripoli	32.89410019	13.27600002
547	TIP	Tripoli International Airport	Africa	LY	Libya	Tripoli District	Tripoli	32.663502	13.159
548	QUB	Ubari Airport	Africa	LY	Libya	Wadi Al Hayaa District	Ubari	26.567499	12.8231
549	ZIS	Alzintan Airport	Africa	LY	Libya	Al Jabal al Gharbi District	Zintan	31.774878	12.25006
550	WAX	Zwara Airport	Africa	LY	Libya	An Nuqat al Khams District	Zuwara	32.952301	12.0155
551	AHY	Ambatolhy Airport	Africa	MG	Madagascar	Toliara	Ambatolahy	-20.01583333	45.535
552	AMY	Ambatomainty Airport	Africa	MG	Madagascar	Mahajanga	Ambatomainty	-17.68666667	45.62388889
553	WAM	Ambatondrazaka Airport	Africa	MG	Madagascar	Toamasina	Ambatondrazaka	-17.795378	48.442583
554	AMB	Ambilobe Airport	Africa	MG	Madagascar	Antsiranana	Ambilobe	-13.18840027	48.98799896
555	IVA	Ampampamena Airport	Africa	MG	Madagascar	Antsiranana	Ampampamena	-13.484816	48.632702
556	AMP	Ampanihy Airport	Africa	MG	Madagascar	Toliara	Ampanihy	-24.6996994	44.73419952
557	HVA	Analalava Airport	Africa	MG	Madagascar	Mahajanga	Analalava	-14.6297	47.763802
558	ZWA	Andapa Airport	Africa	MG	Madagascar	Antsiranana	Andapa	-14.65170002	49.62060165
559	DVD	Andavadoaka Airport	Africa	MG	Madagascar	Toliara	Andavadoaka	-22.06608	43.259573
560	WAD	Andriamena Airport	Africa	MG	Madagascar	Mahajanga	Andriamena	-17.631	47.7233
561	JVA	Ankavandra Airport	Africa	MG	Madagascar	Toliara	Ankavandra	-18.80501	45.273467
562	WAK	Ankazoabo Airport	Africa	MG	Madagascar	Toliara	Ankazoabo	-22.29644235	44.5315361
563	TZO	Tsimiroro Airport	Africa	MG	Madagascar	Toliara	Ankisatra	-18.345064	45.015643
564	TNR	Ivato Airport	Africa	MG	Madagascar	Antananarivo	Antananarivo	-18.7969	47.478802
565	DIE	Arrachart Airport	Africa	MG	Madagascar	Antsiranana	Antisiranana	-12.3494	49.291698
566	WAQ	Antsalova Airport	Africa	MG	Madagascar	Mahajanga	Antsalova	-18.701273	44.614921
567	ATJ	Antsirabe Airport	Africa	MG	Madagascar	Antananarivo	Antsirabe	-19.83922148	47.06371307
568	ANM	Antsirabe Airport	Africa	MG	Madagascar	Antsiranana	Antsirabe	-14.9994	50.320202
569	WAI	Ambalabe Airport	Africa	MG	Madagascar	Mahajanga	Antsohihy	-14.8987999	47.9939003
570	WBE	Ankaizina Airport	Africa	MG	Madagascar	Mahajanga	Bealanana	-14.544277	48.691413
571	WBD	Avaratra Airport	Africa	MG	Madagascar	Mahajanga	Befandriana	-15.19999981	48.48300171
572	OVA	Bekily Airport	Africa	MG	Madagascar	Toliara	Bekily	-24.23569475	45.30452728
573	BMD	Belo sur Tsiribihina Airport	Africa	MG	Madagascar	Toliara	Belo sur Tsiribihina	-19.68670082	44.54190063
574	BZM	Bemolanga Airport	Africa	MG	Madagascar	Mahajanga	Bemolanga	-17.6925	45.08883333
575	WBO	Antsoa Airport	Africa	MG	Madagascar	Toliara	Beroroha	-21.60698376	45.13602018
576	BSV	Besakoa Airport	Africa	MG	Madagascar	Mahajanga	Besakoa	-15.6725	47.06166667
577	BPY	Besalampy Airport	Africa	MG	Madagascar	Mahajanga	Besalampy	-16.74453	44.482484
578	BKU	Betioky Airport	Africa	MG	Madagascar	Toliara	Betioky	-23.7329998	44.38899994
579	DOA	Doany Airport	Africa	MG	Madagascar	Antsiranana	Doany	-14.36810017	49.51079941
580	RVA	Farafangana Airport	Africa	MG	Madagascar	Fianarantsoa	Farafangana	-22.8053	47.820599
581	WFI	Fianarantsoa Airport	Africa	MG	Madagascar	Fianarantsoa	Fianarantsoa	-21.441601	47.111698
582	IHO	Ihosy Airport	Africa	MG	Madagascar	Fianarantsoa	Ihosy	-22.4047202	46.16493702
583	ILK	Atsinanana Airport	Africa	MG	Madagascar	Toamasina	Ilaka	-19.58300018	48.8030014
584	MJN	Amborovy Airport	Africa	MG	Madagascar	Mahajanga	Mahajanga	-15.666842	46.351233
585	VVB	Mahanoro Airport	Africa	MG	Madagascar	Toamasina	Mahanoro	-19.83300018	48.79999924
586	MXT	Maintirano Airport	Africa	MG	Madagascar	Mahajanga	Maintirano	-18.049999	44.033001
587	WML	Malaimbandy Airport	Africa	MG	Madagascar	Toliara	Malaimbandy	-20.35539029	45.54337263
588	WMP	Mampikony Airport	Africa	MG	Madagascar	Mahajanga	Mampikony	-16.07226934	47.64416456
589	WVK	Manakara Airport	Africa	MG	Madagascar	Fianarantsoa	Manakara	-22.119699	48.021702
590	WMR	Mananara Nord Airport	Africa	MG	Madagascar	Toamasina	Mananara Nord	-16.16390038	49.7737999
591	MNJ	Mananjary Airport	Africa	MG	Madagascar	Fianarantsoa	Mananjary	-21.201799	48.358299
592	WMD	Mandabe Airport	Africa	MG	Madagascar	Toliara	Mandabe	-21.04630493	44.94041204
593	WMA	Mandritsara Airport	Africa	MG	Madagascar	Mahajanga	Mandritsara	-15.845992	48.834718
594	MJA	Manja Airport	Africa	MG	Madagascar	Toliara	Manja	-21.426105	44.316509
595	WMN	Maroantsetra Airport	Africa	MG	Madagascar	Toamasina	Maroantsetra	-15.437742	49.689081
596	ZVA	Miandrivazo Airport	Africa	MG	Madagascar	Toliara	Miandrivazo	-19.562799	45.450802
597	TVA	Morafenobe Airport	Africa	MG	Madagascar	Mahajanga	Morafenobe	-17.850083	44.920467
598	OHB	Ambohibary Airport	Africa	MG	Madagascar	Toamasina	Moramanga	-18.9175	48.21819444
599	MXM	Morombe Airport	Africa	MG	Madagascar	Toliara	Morombe	-21.753837	43.374753
600	MOQ	Morondava Airport	Africa	MG	Madagascar	Toliara	Morondava	-20.2847	44.3176
601	NOS	Fascene Airport	Africa	MG	Madagascar	Antsiranana	Nosy Be	-13.31210041	48.31480026
602	WPB	Port Berg?? Airport	Africa	MG	Madagascar	Mahajanga	Port Berg??	-15.584286	47.623587
603	SVB	Sambava Airport	Africa	MG	Madagascar	Antsiranana	Sambava	-14.2786	50.174702
604	DWB	Soalala Airport	Africa	MG	Madagascar	Mahajanga	Soalala	-16.10169	45.358837
605	WTA	Tambohorano Airport	Africa	MG	Madagascar	Mahajanga	Tambohorano	-17.47610092	43.97280121
606	TDV	Samangoky Airport	Africa	MG	Madagascar	Toliara	Tanandava	-21.70000076	43.73300171
607	TMM	Toamasina Ambalamanasy Airport	Africa	MG	Madagascar	Toamasina	Toamasina	-18.109501	49.392502
608	FTU	T??lanaro Airport	Africa	MG	Madagascar	Toliara	T??lanaro	-25.038099	46.9561
609	TLE	Toliara Airport	Africa	MG	Madagascar	Toliara	Toliara	-23.3834	43.7285
610	TTS	Tsaratanana Airport	Africa	MG	Madagascar	Mahajanga	Tsaratanana	-16.751064	47.619016
611	WTS	Tsiroanomandidy Airport	Africa	MG	Madagascar	Antananarivo	Tsiroanomandidy	-18.759677	46.054065
612	VND	Vangaindrano Airport	Africa	MG	Madagascar	Fianarantsoa	Vangaindrano	-23.35076659	47.58170128
613	VAT	Vatomandry Airport	Africa	MG	Madagascar	Toamasina	Vatomandry	-19.383333	48.95
614	VOH	Vohemar Airport	Africa	MG	Madagascar	Antsiranana	Vohemar	-13.3758	50.0028
615	SMS	Sainte Marie Airport	Africa	MG	Madagascar	Toamasina	Vohilava	-17.093901	49.8158
616	BLZ	Chileka International Airport	Africa	MW	Malawi	Blantyre District	Blantyre	-15.67910004	34.97399902
617	CEH	Chelinda Malawi Airport	Africa	MW	Malawi	Rumphi District	Chelinda Malawi	-10.55000019	33.79999924
618	CMK	Club Makokola Airport	Africa	MW	Malawi	Mangochi District	Club Makokola	-14.306483	35.131477
619	DWA	Dwangwa Airport	Africa	MW	Malawi	Nkhotakota District	Dwangwa	-12.517527	34.131877
620	KGJ	Karonga Airport	Africa	MW	Malawi	Karonga District	Karonga	-9.953570366	33.89300156
621	KBQ	Kasungu Airport	Africa	MW	Malawi	Kasungu District	Kasungu	-13.0145998	33.46860123
622	LIX	Likoma Island Airport	Africa	MW	Malawi	Likoma Island District	Likoma Island	-12.079787	34.736253
623	LLW	Lilongwe International Airport	Africa	MW	Malawi	Lilongwe District	Lilongwe	-13.7894001	33.78099823
624	VUU	Mvuu Camp Airport	Africa	MW	Malawi	Machinga District	Liwonde National Park	-14.838611	35.301389
625	MAI	Mangochi Airport	Africa	MW	Malawi	Mangochi District	Mangochi	-14.4829998	35.26699829
626	MYZ	Monkey Bay Airport	Africa	MW	Malawi	Mangochi District	Monkey Bay	-14.08360004	34.91970062
627	ZZU	Mzuzu Airport	Africa	MW	Malawi	Mzimba District	Mzuzu	-11.44470024	34.01179886
628	LMB	Salima Airport	Africa	MW	Malawi	Salima District	Salima	-13.7558927	34.58418846
629	BKO	Modibo Keita International Airport	Africa	ML	Mali	Koulikoro Region	Bamako	12.5335	-7.94994
630	GAQ	Gao Airport	Africa	ML	Mali	Gao Region	Gao	16.24839973	-0.005456000101
631	GUD	Goundam Airport	Africa	ML	Mali	Tombouctou Region	Goundam	16.3614006	-3.599720001
632	KYS	Kayes Dag Dag Airport	Africa	ML	Mali	Kayes Region	Kayes Dag Dag	14.4812	-11.4044
633	KNZ	Kenieba Airport	Africa	ML	Mali	Kayes Region	Kenieba	12.83300018	-11.25
634	KTX	Koutiala Airport	Africa	ML	Mali	Sikasso Region	Koutiala	12.38300037	-5.467000008
635	NRM	Nara Airport	Africa	ML	Mali	Koulikoro Region	Nara	15.21700001	-7.267000198
636	NIX	Nioro du Sahel Airport	Africa	ML	Mali	Kayes Region	Nioro du Sahel	15.23810005	-9.576109886
637	MZI	Mopti Ambod??djo International Airport	Africa	ML	Mali	Mopti Region	S??var??	14.5128	-4.07956
638	KSS	Sikasso Airport	Africa	ML	Mali	Sikasso Region	Sikasso	11.33300018	-5.699999809
639	TOM	Timbuktu Airport	Africa	ML	Mali	Gao Region	Timbuktu	16.73049927	-3.007580042
640	EYL	Y??liman?? Airport	Africa	ML	Mali	Kayes Region	Y??liman??	15.13300037	-10.56700039
641	AEO	Aioun el Atrouss Airport	Africa	MR	Mauritania	Hodh el Charbi Region	Aioun El Atrouss	16.7112999	-9.637880325
642	AJJ	Akjoujt Airport	Africa	MR	Mauritania	Inchiri Region	Akjoujt	19.73301697	-14.38324928
643	ATR	Atar International Airport	Africa	MR	Mauritania	Adrar Region	Atar	20.5067997	-13.04319954
644	BGH	Abbaye Airport	Africa	MR	Mauritania	Brakna Region	Boghe	16.63331413	-14.20000076
645	OTL	Boutilimit Airport	Africa	MR	Mauritania	Trarza Region	Boutilimit	17.53300095	-14.68299961
646	FGD	Fderik Airport	Africa	MR	Mauritania	Tiris Zemmour Region	Fderik	22.673551	-12.729262
647	KED	Ka??di Airport	Africa	MR	Mauritania	Gorgol Region	Ka??di	16.1595	-13.5076
648	KFA	Kiffa Airport	Africa	MR	Mauritania	Assaba Region	Kiffa	16.59	-11.4062
649	MOM	Letfotar Airport	Africa	MR	Mauritania	Brakna Region	Moudjeria	17.75	-12.5
650	EMN	N??ma Airport	Africa	MR	Mauritania	Hodh ech Chargui Region	N??ma	16.622	-7.3166
651	NDB	Nouadhibou International Airport	Africa	MR	Mauritania	Dakhlet Nouadhibou Region	Nouadhibou	20.93309975	-17.03000069
652	NKC	Nouakchott???Oumtounsy International Airport	Africa	MR	Mauritania	Nouakchott Region	Nouakchott	18.31	-15.9697222
653	SEY	S??libaby Airport	Africa	MR	Mauritania	Guidimaka Region	S??libaby	15.1796999	-12.20730019
654	THT	Tamchakett Airport	Africa	MR	Mauritania	Hodh el Charbi Region	Tamchakett	17.23157	-10.77923
655	THI	Tichitt Airport	Africa	MR	Mauritania	Tagant Region	Tichitt	18.45000076	-9.517000198
656	TIY	Tidjikja Airport	Africa	MR	Mauritania	Tagant Region	Tidjikja	18.570101	-11.4235
657	TMD	Timbedra Airport	Africa	MR	Mauritania	Hodh ech Chargui Region	Timbedra	16.233671	-8.163464
658	OUZ	Tazadit Airport	Africa	MR	Mauritania	Tiris Zemmour Region	Zou??rate	22.757345	-12.482228
659	MRU	Sir Seewoosagur Ramgoolam International Airport	Africa	MU	Mauritius	Grand Port	Plaine Magnein	-20.430201	57.683601
660	RRG	Sir Charles Gaetan Duval Airport	Africa	MU	Mauritius	Vacosa-Phoenix	Port Mathurin	-19.7577	63.361
661	DZA	Dzaoudzi Pamandzi International Airport	Africa	YT	Mayotte	Dzaoudzi	Dzaoudzi	-12.809319	45.281815
662	AGA	Al Massira Airport	Africa	MA	Morocco	Agadir Province	Agadir (Temsia)	30.322478	-9.412003
663	AHU	Cherif Al Idrissi Airport	Africa	MA	Morocco	Al Hoce??ma Province	Al Hoceima	35.17710114	-3.839519978
664	GMD	Ben Slimane Airport	Africa	MA	Morocco	Casablanca Province	Ben Slimane	33.655399	-7.22145
665	BEM	Beni Mellal Airport	Africa	MA	Morocco	Beni Mellal Province	Beni Mellal	32.401895	-6.315905
666	UAR	Bouarfa Airport	Africa	MA	Morocco	Figuig Province	Bouarfa	32.51430556	-1.983055556
667	CMN	Mohammed V International Airport	Africa	MA	Morocco	Casablanca Province	Casablanca	33.36750031	-7.589970112
668	ERH	Moulay Ali Cherif Airport	Africa	MA	Morocco	Errachidia Province	Errachidia	31.94750023	-4.398330212
669	ESU	Essaouira-Mogador Airport	Africa	MA	Morocco	Essaouira Province	Essaouira	31.397499	-9.68167
670	FEZ	Sa??ss Airport	Africa	MA	Morocco	F??s Province	Fes	33.9272995	-4.97796011
671	GLN	Guelmim Airport	Africa	MA	Morocco	Tiznit Province	Guelmim	29.026699	-10.0503
672	NNA	Kenitra Air Base	Africa	MA	Morocco	K??nitra Province	Kenitra	34.298901	-6.59588
673	RAK	Menara Airport	Africa	MA	Morocco	Marrakech Province	Marrakech	31.60689926	-8.036299706
674	MEK	Bassatine Airport	Africa	MA	Morocco	Mekns??s Province	Meknes	33.8791008	-5.515120029
675	NDR	Nador International Airport	Africa	MA	Morocco	Nador Province	Nador	34.98880005	-3.028209925
676	OZZ	Ouarzazate Airport	Africa	MA	Morocco	Ouarzazate Province	Ouarzazate	30.93910027	-6.909430027
677	OUD	Angads Airport	Africa	MA	Morocco	Oujda Province	Oujda	34.78720093	-1.923990011
678	RBA	Rabat-Sal?? Airport	Africa	MA	Morocco	Rabat-Sal?? Province	Rabat	34.051498	-6.75152
679	TTA	Tan Tan Airport	Africa	MA	Morocco	Tan-Tan Province	Tan Tan	28.44820023	-11.16129971
680	TNG	Tangier Ibn Battouta Airport	Africa	MA	Morocco	Tanger Province	Tangier	35.726898	-5.91689
681	TTU	Saniat R'mel Airport	Africa	MA	Morocco	T??touan Province	T??touan	35.59429932	-5.320020199
682	OZG	Zagora Airport	Africa	MA	Morocco	Tiznit Province	Zagora	30.32029915	-5.866670132
683	AME	Alto Molocue Airport	Africa	MZ	Mozambique	Zambezia Province	Alto Molocue	-15.61027778	37.68138889
684	ANO	Angoche Airport	Africa	MZ	Mozambique	Nampula Province	Angoche	-16.18186951	39.94521713
685	BZB	Bazaruto Island Airport	Africa	MZ	Mozambique	Inhambane Province	Bazaruto Island	-21.5411	35.4729
686	IBL	Indigo Bay Lodge Airport	Africa	MZ	Mozambique	Inhambane Province	Bazaruto Island	-21.708	35.452801
687	BEW	Beira Airport	Africa	MZ	Mozambique	Sofala Province	Beira	-19.79640007	34.9076004
688	BCW	Benguera Island Airport	Africa	MZ	Mozambique	Inhambane Province	Benguera Island	-21.85330009	35.43830109
689	CMZ	Caia Airport	Africa	MZ	Mozambique	Sofala Province	Caia	-17.8331	35.3341
690	VPY	Chimoio Airport	Africa	MZ	Mozambique	Manica Province	Chimoio	-19.15130043	33.42900085
691	INE	Chinde Airport	Africa	MZ	Mozambique	Zambezia Province	Chinde	-18.59	36.4489
692	TGS	Chokw?? Airport	Africa	MZ	Mozambique	Gaza Province	Chokw??	-24.52059937	32.96530151
693	FXO	Cuamba Airport	Africa	MZ	Mozambique	Niassa Province	Cuamba	-14.815	36.529999
694	VJQ	Gurue Airport	Africa	MZ	Mozambique	Zambezia Province	Gurue	-15.5062	36.9904
695	IBO	Ibo Airport	Africa	MZ	Mozambique	Cabo Delgado Province	Ibo	-12.350174	40.602297
696	IHC	Inhaca Airport	Africa	MZ	Mozambique	Maputo Province	Inhaca	-25.9971447	32.92935181
697	INH	Inhambane Airport	Africa	MZ	Mozambique	Inhambane Province	Inhambane	-23.8764	35.408501
698	IMG	Inhaminga Airport	Africa	MZ	Mozambique	Sofala Province	Inhaminga	-18.41	35.0045
699	VXC	Lichinga Airport	Africa	MZ	Mozambique	Niassa Province	Lichinga	-13.274	35.2663
700	LBM	Luabo Airport	Africa	MZ	Mozambique	Zambezia Province	Luabo	-18.4139	36.1068
701	LFB	Lumbo Airport	Africa	MZ	Mozambique	Nampula Province	Lumbo	-15.03310013	40.67169952
702	MJS	Maganja da Costa Airport	Africa	MZ	Mozambique	Zambezia Province	Maganja	-17.3087	37.5
703	MPM	Maputo Airport	Africa	MZ	Mozambique	Maputo (city)	Maputo	-25.920799	32.572601
704	RRM	Marromeu Airport	Africa	MZ	Mozambique	Sofala Province	Marromeu	-18.319259	35.949501
705	MZB	Moc??mboa da Praia Airport	Africa	MZ	Mozambique	Cabo Delgado Province	Moc??mboa da Praia	-11.36180019	40.35490036
706	MTU	Montepuez Airport	Africa	MZ	Mozambique	Cabo Delgado Province	Montepuez	-13.1218996	39.05279922
707	MUD	Mueda Airport	Africa	MZ	Mozambique	Cabo Delgado Province	Mueda	-11.6729002	39.56309891
708	MNC	Nacala Airport	Africa	MZ	Mozambique	Nampula Province	Nacala	-14.48820019	40.71220016
709	APL	Nampula Airport	Africa	MZ	Mozambique	Nampula Province	Nampula	-15.10560036	39.28179932
710	NND	Nangade Airport	Africa	MZ	Mozambique	Cabo Delgado Province	Nangade	-11.073	39.68
711	LMZ	Palma Airport	Africa	MZ	Mozambique	Cabo Delgado Province	Palma	-10.7506	40.4702
712	PEB	Pebane Airport	Africa	MZ	Mozambique	Zambezia Province	Pebane	-17.27276	38.18073
713	POL	Pemba Airport	Africa	MZ	Mozambique	Cabo Delgado Province	Pemba / Porto Amelia	-12.99176216	40.52401352
714	PDD	Ponta do Ouro Airport	Africa	MZ	Mozambique	Maputo Province	Ponta do Ouro	-26.826913	32.838444
715	UEL	Quelimane Airport	Africa	MZ	Mozambique	Zambezia Province	Quelimane	-17.85549927	36.86909866
716	NTC	Paradise Island Airport	Africa	MZ	Mozambique	Inhambane Province	Santa Carolina	-21.61499977	35.33800125
717	TET	Chingozi Airport	Africa	MZ	Mozambique	Tete Province	Tete	-16.10479927	33.64020157
718	VNX	Vilankulo Airport	Africa	MZ	Mozambique	Inhambane Province	Vilanculo	-22.01840019	35.31330109
719	VJB	Xai-Xai Airport	Africa	MZ	Mozambique	Gaza Province	Xai-Xai	-25.03779984	33.62739944
720	AIW	Ai-Ais Airport	Africa	NA	Namibia	??Karas Region	Ai-Ais	-27.995	17.5966
721	ADI	Arandis Airport	Africa	NA	Namibia	Erongo Region	Arandis	-22.461875	14.979322
722	BQI	Bagani Airport	Africa	NA	Namibia	Kavango East Region	Bagani	-18.11848	21.623296
723	GOG	Gobabis Airport	Africa	NA	Namibia	Omaheke Region	Gobabis	-22.50440025	18.97310066
724	GFY	Grootfontein Airport	Africa	NA	Namibia	Otjozondjupa Region	Grootfontein	-19.60219955	18.12269974
725	HAL	Halali Airport	Africa	NA	Namibia	Oshikoto Region	Halali	-19.0285	16.4585
726	KAS	Karasburg Airport	Africa	NA	Namibia	??Karas Region	Karasburg	-28.0297	18.7385
727	KMP	Keetmanshoop Airport	Africa	NA	Namibia	??Karas Region	Keetmanshoop	-26.53980064	18.1114006
728	LHU	Lianshulu Airport	Africa	NA	Namibia	Zambezi Region	Lianshulu Lodge	-18.116495	23.39346
1128	HEH	Heho Airport	Asia	MM	Burma	Shan State	Heho	20.74699974	96.79199982
729	LUD	Luderitz Airport	Africa	NA	Namibia	??Karas Region	Luderitz	-26.68740082	15.24289989
730	MQG	Midgard Airport	Africa	NA	Namibia	Otjozondjupa Region	Midgard	-22.0106	17.37
731	OKU	Mokuti Lodge Airport	Africa	NA	Namibia	Oshikoto Region	Mokuti Lodge	-18.81279945	17.05940056
732	MJO	Mount Etjo Airport	Africa	NA	Namibia	Otjozondjupa Region	Mount Etjo Safari Lodge	-21.02330017	16.45280075
733	MPA	Katima Mulilo Airport	Africa	NA	Namibia	Zambezi Region	Mpacha	-17.634399	24.176701
734	NNI	Namutoni Airport	Africa	NA	Namibia	Oshikoto Region	Namutoni	-18.8064	16.9272
735	OKF	Okaukuejo Airport	Africa	NA	Namibia	Kunene Region	Okaukuejo	-19.14920044	15.91189957
736	OMG	Omega Airport	Africa	NA	Namibia	Kavango East Region	Omega	-18.0303	22.189699
737	OND	Ondangwa Airport	Africa	NA	Namibia	Oshana Region	Ondangwa	-17.878201	15.9526
738	OPW	Opuwa Airport	Africa	NA	Namibia	Kunene Region	Opuwa	-18.061424	13.85047
739	OMD	Oranjemund Airport	Africa	NA	Namibia	??Karas Region	Oranjemund	-28.5847	16.446699
740	OHI	Oshakati Airport	Africa	NA	Namibia	Oshana Region	Oshakati	-17.797	15.6993
741	OTJ	Otjiwarongo Airport	Africa	NA	Namibia	Otjozondjupa Region	Otjiwarongo	-20.4347	16.660801
742	RHN	Skorpion Mine Airport	Africa	NA	Namibia	??Karas Region	Rosh Pinah	-27.87639999	16.64780045
743	NDU	Rundu Airport	Africa	NA	Namibia	Kavango East Region	Rundu	-17.9564991	19.71940041
744	SZM	Sesriem Airstrip	Africa	NA	Namibia	Hardap Region	Sesriem	-24.51280022	15.74670029
745	SWP	Swakopmund Municipal Aerodrome	Africa	NA	Namibia	Erongo Region	Swakopmund	-22.6619	14.5681
746	TCY	Terrace Bay Airport	Africa	NA	Namibia	Kunene Region	Terrace Bay	-19.9713	13.0249
747	TSB	Tsumeb Airport	Africa	NA	Namibia	Oshikoto Region	Tsumeb	-19.26189995	17.73250008
748	WVB	Walvis Bay Airport	Africa	NA	Namibia	Erongo Region	Walvis Bay	-22.9799	14.6453
749	ERS	Eros Airport	Africa	NA	Namibia	Khomas Region	Windhoek	-22.61219978	17.08040047
750	WDH	Hosea Kutako International Airport	Africa	NA	Namibia	Khomas Region	Windhoek	-22.4799	17.4709
751	AJY	Mano Dayak International Airport	Africa	NE	Niger	Agadez Region	Agadez	16.9659996	8.000109673
752	RLT	Arlit Airport	Africa	NE	Niger	Agadez Region	Arlit	18.79039955	7.365950108
753	MFQ	Maradi Airport	Africa	NE	Niger	Maradi Region	Maradi	13.50249958	7.126749992
754	NIM	Diori Hamani International Airport	Africa	NE	Niger	Niamey Capital District	Niamey	13.4815	2.18361
755	THZ	Tahoua Airport	Africa	NE	Niger	Tahoua Region	Tahoua	14.8757	5.265359879
756	ZND	Zinder Airport	Africa	NE	Niger	Zinder Region	Zinder	13.77900028	8.98375988
757	ABV	Nnamdi Azikiwe International Airport	Africa	NG	Nigeria	Abuja Capital Territory	Abuja	9.006790161	7.263169765
758	AKR	Akure Airport	Africa	NG	Nigeria	Ondo	Akure	7.246739864	5.301010132
759	ABB	Asaba International Airport	Africa	NG	Nigeria	Delta	Asaba	6.204167	6.665278
760	BCU	Sir Abubakar Tafawa Balewa International Airport	Africa	NG	Nigeria	Bauchi	Bauchi	10.482833	9.744
761	BNI	Benin Airport	Africa	NG	Nigeria	Edo	Benin	6.316979885	5.599500179
762	CBQ	Margaret Ekpo International Airport	Africa	NG	Nigeria	Cross River	Calabar	4.976019859	8.347200394
763	ENU	Akanu Ibiam International Airport	Africa	NG	Nigeria	Enugu	Enegu	6.474269867	7.56196022
764	GMO	Gombe Lawanti International Airport	Africa	NG	Nigeria	Gombe	Gombe	10.298889	10.9
765	IBA	Ibadan Airport	Africa	NG	Nigeria	Oyo	Ibadan	7.362460136	3.978329897
766	ILR	Ilorin International Airport	Africa	NG	Nigeria	Kwara	Ilorin	8.440210342	4.493919849
767	JOS	Yakubu Gowon Airport	Africa	NG	Nigeria	Plateau	Jos	9.639829636	8.869050026
768	KAD	Kaduna Airport	Africa	NG	Nigeria	Kaduna	Kaduna	10.6960001	7.320109844
769	KAN	Mallam Aminu International Airport	Africa	NG	Nigeria	Kano	Kano	12.0476	8.52462
770	DKA	Katsina Airport	Africa	NG	Nigeria	Katsina	Katsina	13.0078	7.66045
771	LOS	Murtala Muhammed International Airport	Africa	NG	Nigeria	Lagos	Lagos	6.577370167	3.321160078
772	MIU	Maiduguri International Airport	Africa	NG	Nigeria	Borno	Maiduguri	11.85529995	13.08090019
773	MDI	Makurdi Airport	Africa	NG	Nigeria	Benue	Makurdi	7.70388	8.61394
774	MXJ	Minna Airport	Africa	NG	Nigeria	Niger	Minna	9.652170181	6.462259769
775	QOW	Sam Mbakwe International Airport	Africa	NG	Nigeria	Imo	Owerri	5.427060127	7.206029892
776	PHG	Port Harcourt City Airport / Port Harcourt Air Force Base	Africa	NG	Nigeria	Rivers	Port Harcourt	4.846111	7.021389
777	PHC	Port Harcourt International Airport	Africa	NG	Nigeria	Rivers	Port Harcourt	5.015490055	6.949590206
778	SKO	Sadiq Abubakar III International Airport	Africa	NG	Nigeria	Sokoto	Sokoto	12.91629982	5.207190037
779	QUO	Akwa Ibom International Airport	Africa	NG	Nigeria	Akwa Ibom	Uyo	4.8725	8.093
780	QRW	Warri Airport	Africa	NG	Nigeria	Delta	Warri	5.59611	5.81778
781	YOL	Yola Airport	Africa	NG	Nigeria	Adamawa	Yola	9.25755024	12.43039989
782	ZAR	Zaria Airport	Africa	NG	Nigeria	Kaduna	Zaria	11.1302	7.68581
783	RUN	Roland Garros Airport	Africa	RE	R??union	St Denis	St Denis	-20.8871	55.5103
784	ZSE	Pierrefonds Airport	Africa	RE	R??union	St Pierre	St Pierre	-21.32089996	55.42499924
785	BTQ	Butare Airport	Africa	RW	Rwanda	Southern Province	Butare	-2.595829964	29.73670006
786	GYI	Gisenyi Airport	Africa	RW	Rwanda	Western Province	Gisenyi	-1.67719996	29.25889969
787	KME	Kamembe Airport	Africa	RW	Rwanda	Western Province	Kamembe	-2.462239981	28.90789986
788	KGL	Kigali International Airport	Africa	RW	Rwanda	Kigali Province	Kigali	-1.96863	30.1395
789	RHG	Ruhengeri Airport	Africa	RW	Rwanda	Northern Province	Ruhengeri	-1.496873	29.631343
790	ASI	RAF Ascension Island	Africa	SH	Saint Helena, Ascension and Tristan da Cunha	Ascension	Cat Hill	-7.9696	-14.3937
791	HLE	Saint Helena Airport	Africa	SH	Saint Helena, Ascension and Tristan da Cunha	Saint Helena	Longwood	-15.957725	-5.645943
792	TMS	S??o Tom?? International Airport	Africa	ST	S??o Tom?? and Principe	??gua Grande District	S??o Tom??	0.378175	6.71215
793	PCP	Principe Airport	Africa	ST	S??o Tom?? and Principe	Autonomous Region of Principe	S??o Tom?? & Pr??ncipe	1.66294	7.41174
794	BXE	Bakel Airport	Africa	SN	Senegal	Tambacounda Region	Bakel	14.84729958	-12.46829987
795	CSK	Cap Skirring Airport	Africa	SN	Senegal	Ziguinchor Region	Cap Skirring	12.39533	-16.748
796	DSS	Blaise Diagne International Airport	Africa	SN	Senegal	Dakar Region	Dakar	14.67	-17.073333
797	DKR	L??opold S??dar Senghor International Airport	Africa	SN	Senegal	Dakar Region	Dakar	14.7397	-17.4902
798	KLC	Kaolack Airport	Africa	SN	Senegal	Fatick Region	Kaolack	14.14690018	-16.05130005
799	KGG	K??dougou Airport	Africa	SN	Senegal	Tambacounda Region	K??dougou	12.57229996	-12.22029972
800	KDA	Kolda North Airport	Africa	SN	Senegal	Kolda Region	Kolda	12.89850044	-14.96809959
801	NIK	Niokolo-Koba Airport	Africa	SN	Senegal	Tambacounda Region	Niokolo-Koba National Park	13.052014	-12.727162
802	MAX	Ouro Sogui Airport	Africa	SN	Senegal	Matam Region	Ouro Sogui	15.5936	-13.3228
803	POD	Podor Airport	Africa	SN	Senegal	Saint-Louis Region	Podor	16.678155	-14.964957
804	RDT	Richard Toll Airport	Africa	SN	Senegal	Saint-Louis Region	Richard Toll	16.437816	-15.656376
805	XLS	Saint Louis Airport	Africa	SN	Senegal	Saint-Louis Region	Saint Louis	16.049814	-16.461039
806	SMY	Simenti Airport	Africa	SN	Senegal	Tambacounda Region	Simenti	13.04679966	-13.29539967
807	TUD	Tambacounda Airport	Africa	SN	Senegal	Tambacounda Region	Tambacounda	13.73680019	-13.65310001
808	ZIG	Ziguinchor Airport	Africa	SN	Senegal	Ziguinchor Region	Ziguinchor	12.5556	-16.281799
809	BDI	Bird Island Airport	Africa	SC	Seychelles	La Digue	Bird Island	-3.72472	55.205299
810	DEI	Denis Island Airport	Africa	SC	Seychelles	La Digue	Denis Island	-3.80222	55.666901
811	DES	Desroches Airport	Africa	SC	Seychelles	La Digue	Desroches Island	-5.6967	53.6558
812	FRK	Fr??gate Island Airport	Africa	SC	Seychelles	La Digue	Fr??gate Island	-4.582785	55.944928
813	PRI	Praslin Airport	Africa	SC	Seychelles	Grand' Anse (Praslin)	Grand Anse	-4.31929	55.691399
814	SEZ	Seychelles International Airport	Africa	SC	Seychelles	Pointe La Rue	Mahe Island	-4.67434	55.521801
815	KBS	Bo Airport	Africa	SL	Sierra Leone	Southern Province	Bo	7.944399834	-11.76099968
816	HGS	Hastings Airport	Africa	SL	Sierra Leone	Western Area	Freetown	8.394348	-13.128891
817	FNA	Lungi International Airport	Africa	SL	Sierra Leone	Northern Province	Freetown (Lungi-Town)	8.61644	-13.1955
818	GBK	Gbangbatok Airport	Africa	SL	Sierra Leone	Southern Province	Gbangbatok	7.767000198	-12.38300037
819	KBA	Kabala Airport	Africa	SL	Sierra Leone	Northern Province	Kabala	9.638322913	-11.51556015
820	KEN	Kenema Airport	Africa	SL	Sierra Leone	Eastern Province	Kenema	7.891290188	-11.17660046
821	WYE	Yengema Airport	Africa	SL	Sierra Leone	Eastern Province	Yengema	8.610469818	-11.04539967
822	AAD	Adado Airport	Africa	SO	Somalia	Galguduud	Adado	6.095802	46.6375
823	ALU	Alula Airport	Africa	SO	Somalia	Bari	Alula	11.9582	50.748
824	BIB	Baidoa Airport	Africa	SO	Somalia	Bay	Baidoa	3.10192	43.627137
825	BSY	Bardera Airport	Africa	SO	Somalia	Gedo	Bardera	2.330195	42.311802
826	BLW	Beledweyne Airport	Africa	SO	Somalia	Hiirsan	Beledweyne	4.766976	45.2388
827	BBO	Berbera Airport	Africa	SO	Somalia	Woqooyi Galbeed	Berbera	10.385035	44.936723
828	BXX	Borama Airport	Africa	SO	Somalia	Woqooyi Galbeed	Borama	9.9463	43.1495
829	BSA	Bosaso / Bender Qassim International Airport	Africa	SO	Somalia	Bari	Bosaso	11.275235	49.139231
830	BUO	Burao Airport	Africa	SO	Somalia	Togdheer	Burao	9.5275	45.5549
831	CXN	Candala Airport	Africa	SO	Somalia	Bari	Candala	11.494	49.9085
832	ERA	Erigavo Airport	Africa	SO	Somalia	Saneag	Erigavo	10.64205055	47.38798141
833	HCM	Eil Airport	Africa	SO	Somalia	Nugaal	Eyl	8.104	49.82
834	GLK	Galcaio Airport	Africa	SO	Somalia	Mudug	Galcaio	6.780829906	47.45470047
835	GBM	Garbaharey Airport	Africa	SO	Somalia	Gedo	Garbaharey	3.32294	42.21309
836	GSR	Gardo Airport	Africa	SO	Somalia	Bari	Gardo	9.517000198	49.08300018
837	GGR	Garowe Airport	Africa	SO	Somalia	Nugaal	Garowe	8.457942	48.567407
838	HGA	Egal International Airport	Africa	SO	Somalia	Woqooyi Galbeed	Hargeisa	9.513207	44.082389
839	CMO	Hobyo Airport	Africa	SO	Somalia	Mudug	Hobyo	5.358003	48.515281
840	CMS	Iskushuban Airport	Africa	SO	Somalia	Bari	Iskushuban	10.3	50.233002
841	KMU	Kismayo Airport	Africa	SO	Somalia	Jubbada Hoose	Kismayo	-0.377353	42.459202
842	LGX	Lugh Ganane Airport	Africa	SO	Somalia	Gedo	Luuq	3.8124	42.5459
843	MGQ	Aden Adde International Airport	Africa	SO	Somalia	Banaadir	Mogadishu	2.01444006	45.30469894
844	AGZ	Aggeneys Airport	Africa	ZA	South Africa	Northern Cape	Aggeneys	-29.28179932	18.81389999
845	ALJ	Alexander Bay Airport	Africa	ZA	South Africa	Northern Cape	Alexander Bay	-28.575001	16.5333
846	ADY	Alldays Airport	Africa	ZA	South Africa	Limpopo	Alldays	-22.67900085	29.05550003
847	ASS	Arathusa Safari Lodge Airport	Africa	ZA	South Africa	Limpopo	Arathusa	-24.744165	31.522499
848	GSS	Sabi Sabi Airport	Africa	ZA	South Africa	Mpumalanga	Belfast	-24.94737543	31.44884777
849	BIY	Bisho Airport	Africa	ZA	South Africa	Eastern Cape	Bisho	-32.89709854	27.27910042
850	BFN	Bram Fischer International Airport	Africa	ZA	South Africa	Free State	Bloemfontain	-29.092699	26.302401
851	UTE	Bultfontein Airport	Africa	ZA	South Africa	Free State	Bultfontein	-28.273369	26.135835
852	CPT	Cape Town International Airport	Africa	ZA	South Africa	Western Cape	Cape Town	-33.96480179	18.60169983
853	CDO	Cradock Airport	Africa	ZA	South Africa	Eastern Cape	Cradock	-32.15670013	25.64559937
854	DUR	King Shaka International Airport	Africa	ZA	South Africa	Kwazulu-Natal	Durban	-29.61444444	31.11972222
855	VIR	Virginia Airport	Africa	ZA	South Africa	Kwazulu-Natal	Durban	-29.77059937	31.0583992
856	ELS	Ben Schoeman Airport	Africa	ZA	South Africa	Eastern Cape	East London	-33.03559875	27.82589912
857	ELL	Ellisras Matimba Airport	Africa	ZA	South Africa	Limpopo	Ellisras	-23.72669983	27.68829918
858	EMG	Empangeni Airport	Africa	ZA	South Africa	Kwazulu-Natal	Empangeni	-28.71999931	31.88999939
859	FCB	Ficksburg Sentraoes Airport	Africa	ZA	South Africa	Free State	Ficksburg	-28.82309914	27.90889931
860	GRJ	George Airport	Africa	ZA	South Africa	Western Cape	George	-34.0056	22.378902
861	GIY	Giyani Airport	Africa	ZA	South Africa	Limpopo	Giyani	-23.2833004	30.64999962
862	HRS	Harrismith Airport	Africa	ZA	South Africa	Free State	Harrismith	-28.23509979	29.10619926
863	HZV	Hazyview Airport	Africa	ZA	South Africa	Mpumalanga	Hazyview	-25.05010033	31.13190079
864	HLW	Hluhluwe Airport	Africa	ZA	South Africa	Kwazulu-Natal	Hluhluwe	-28.01660499	32.27517128
865	HDS	Hoedspruit Air Force Base Airport	Africa	ZA	South Africa	Limpopo	Hoedspruit	-24.36860085	31.04870033
866	TCU	Thaba Nchu Tar Airport	Africa	ZA	South Africa	Free State	Homeward	-29.31780052	26.82279968
867	INY	Inyati Airport	Africa	ZA	South Africa	Limpopo	Inyati	-24.77770042	31.38549995
868	HLA	Lanseria International Airport	Africa	ZA	South Africa	Gauteng	Johannesburg	-25.938499	27.9261
869	JNB	OR Tambo International Airport	Africa	ZA	South Africa	Gauteng	Johannesburg	-26.1392	28.246
870	QRA	Rand Airport	Africa	ZA	South Africa	Gauteng	Johannesburg	-26.2425	28.151199
871	KHO	Khoka Moya Airport	Africa	ZA	South Africa	Limpopo	Khoka Moya	-24.59300041	31.4151001
872	KIM	Kimberley Airport	Africa	ZA	South Africa	Northern Cape	Kimberley	-28.80279922	24.76519966
873	KLZ	Kleinsee Airport	Africa	ZA	South Africa	Northern Cape	Kleinsee	-29.68840027	17.09399986
874	KXE	P C Pelser Airport	Africa	ZA	South Africa	North-West	Klerksdorp	-26.87109947	26.71800041
875	KIG	Koingnaas Airport	Africa	ZA	South Africa	Northern Cape	Koingnaas	-30.187136	17.282706
876	KOF	Komatipoort Airport	Africa	ZA	South Africa	Mpumalanga	Komatipoort	-25.44029999	31.93000031
877	KMH	Johan Pienaar Airport	Africa	ZA	South Africa	Northern Cape	Kuruman	-27.45669937	23.41139984
878	LAY	Ladysmith Airport	Africa	ZA	South Africa	Kwazulu-Natal	Ladysmith	-28.58169937	29.74970055
879	SDB	Langebaanweg Airport	Africa	ZA	South Africa	Western Cape	Langebaanweg	-32.96889877	18.1602993
880	LMR	Lime Acres Finsch Mine Airport	Africa	ZA	South Africa	Northern Cape	Lime Acres	-28.36009979	23.43910027
881	LDZ	Londolozi Airport	Africa	ZA	South Africa	Limpopo	Londolozi	-24.7478	31.4743
882	LCD	Louis Trichardt Airport	Africa	ZA	South Africa	Limpopo	Louis Trichardt	-23.06189919	29.86470032
883	LUJ	Lusikisiki Airport	Africa	ZA	South Africa	Eastern Cape	Lusikisiki	-31.36669922	29.58329964
884	MBD	Mmabatho International Airport	Africa	ZA	South Africa	North-West	Mafeking	-25.79840088	25.54800034
885	AAM	Malamala Airport	Africa	ZA	South Africa	Limpopo	Malamala	-24.81809998	31.54459953
886	LLE	Riverside Airport	Africa	ZA	South Africa	Mpumalanga	Malelane	-25.43000031	31.57670021
887	MGH	Margate Airport	Africa	ZA	South Africa	Kwazulu-Natal	Margate	-30.85740089	30.34300041
888	GCJ	Grand Central Airport	Africa	ZA	South Africa	Gauteng	Midrand	-25.98629951	28.14010048
889	MBM	Mkambati Airport	Africa	ZA	South Africa	Eastern Cape	Mkambati	-31.2849	29.9884
890	MZQ	Mkuze Airport	Africa	ZA	South Africa	Kwazulu-Natal	Mkuze	-27.62610054	32.04430008
891	MZY	Mossel Bay Airport	Africa	ZA	South Africa	Western Cape	Mossel Bay	-34.158298	22.058599
892	MWR	Motswari Airport	Africa	ZA	South Africa	Mpumalanga	Motswari Private Game Reserve	-24.1903	31.3864
893	MQP	Kruger Mpumalanga International Airport	Africa	ZA	South Africa	Mpumalanga	Mpumalanga	-25.38319969	31.10560036
894	UTT	K. D. Matanzima Airport	Africa	ZA	South Africa	Eastern Cape	Mthatha	-31.54636318	28.6733551
895	DUK	Mubatuba Airport	Africa	ZA	South Africa	Kwazulu-Natal	Mubatuba	-28.36840057	32.24810028
896	MEZ	Musina(Messina) Airport	Africa	ZA	South Africa	Limpopo	Musina	-22.3560009	29.98620033
897	NLP	Nelspruit Airport	Africa	ZA	South Africa	Mpumalanga	Nelspruit	-25.5	30.91379929
898	NCS	Newcastle Airport	Africa	ZA	South Africa	Kwazulu-Natal	Newcastle	-27.77059937	29.9769001
899	NGL	Ngala Airport	Africa	ZA	South Africa	Limpopo	Ngala	-24.389	31.326
900	OUH	Oudtshoorn Airport	Africa	ZA	South Africa	Western Cape	Oudtshoorn	-33.60699844	22.18899918
901	OVG	Overberg Airport	Africa	ZA	South Africa	Western Cape	Overberg	-34.55490112	20.2507
902	PHW	Hendrik Van Eck Airport	Africa	ZA	South Africa	Limpopo	Phalaborwa	-23.93720055	31.15539932
903	PZL	Zulu Inyala Airport	Africa	ZA	South Africa	Kwazulu-Natal	Phinda	-27.84939957	32.30970001
904	PZB	Pietermaritzburg Airport	Africa	ZA	South Africa	Kwazulu-Natal	Pietermaritzburg	-29.64900017	30.39870071
905	NTY	Pilanesberg International Airport	Africa	ZA	South Africa	North-West	Pilanesberg	-25.333799	27.173401
906	PBZ	Plettenberg Bay Airport	Africa	ZA	South Africa	Western Cape	Plettenberg Bay	-34.08816	23.328723
907	PTG	Polokwane International Airport	Africa	ZA	South Africa	Limpopo	Polokwane	-23.845269	29.458615
908	AFD	Port Alfred Airport	Africa	ZA	South Africa	Eastern Cape	Port Alfred	-33.55419922	26.87770081
909	PLZ	Chief Dawid Stuurman International Airport	Africa	ZA	South Africa	Eastern Cape	Port Elizabeth	-33.984901	25.6173
910	JOH	Port St Johns Airport	Africa	ZA	South Africa	Eastern Cape	Port St Johns	-31.60612	29.52175
911	PCF	Potchefstroom Airport	Africa	ZA	South Africa	North-West	Potchefstroom	-26.67099953	27.08189964
912	WKF	Waterkloof Air Force Base	Africa	ZA	South Africa	Gauteng	Pretoria	-25.82999992	28.22249985
913	PRY	Wonderboom Airport	Africa	ZA	South Africa	Gauteng	Pretoria	-25.6539	28.224199
914	PRK	Prieska Airport	Africa	ZA	South Africa	Northern Cape	Prieska	-29.68359947	22.77059937
915	UTW	Queenstown Airport	Africa	ZA	South Africa	Eastern Cape	Queenstown	-31.92020035	26.88220024
916	RVO	Reivilo Airport	Africa	ZA	South Africa	North-West	Reivilo	-27.54719925	24.17250061
917	RCB	Richards Bay Airport	Africa	ZA	South Africa	Kwazulu-Natal	Richards Bay	-28.74099922	32.09209824
918	ROD	Robertson Airport	Africa	ZA	South Africa	Western Cape	Robertson	-33.81219864	19.90279961
919	ZEC	Secunda Airport	Africa	ZA	South Africa	Mpumalanga	Secunda	-26.52409935	29.17009926
920	SSX	Singita Safari Lodge Airport	Africa	ZA	South Africa	Mpumalanga	Singita Safari Lodge	-24.801985	31.42194
921	SIS	Sishen Airport	Africa	ZA	South Africa	Northern Cape	Sishen	-27.64859962	22.9993
922	SZK	Skukuza Airport	Africa	ZA	South Africa	Mpumalanga	Skukuza	-24.96089935	31.58869934
923	SBU	Springbok Airport	Africa	ZA	South Africa	Northern Cape	Springbok	-29.68930054	17.93959999
924	THY	Thohoyandou Airport	Africa	ZA	South Africa	Limpopo	Thohoyandou	-23.07690048	30.38360023
925	TSD	Tshipise Airport	Africa	ZA	South Africa	Limpopo	Tshipise	-22.61930084	30.17560005
926	LTA	Tzaneen Airport	Africa	ZA	South Africa	Limpopo	Tzaneen	-23.82439995	30.32929993
927	ULD	Prince Mangosuthu Buthelezi Airport	Africa	ZA	South Africa	Kwazulu-Natal	Ulundi	-28.32060051	31.41650009
928	ULX	Ulusaba Airport	Africa	ZA	South Africa	Limpopo	Ulusaba	-24.78540039	31.35490036
929	UTN	Pierre Van Ryneveld Airport	Africa	ZA	South Africa	Northern Cape	Upington	-28.39909935	21.2602005
930	VRE	Vredendal Airport	Africa	ZA	South Africa	Western Cape	Vredendal	-31.64100075	18.5447998
931	VYD	Vryheid Airport	Africa	ZA	South Africa	Kwazulu-Natal	Vryheid	-27.78689957	30.79640007
932	VRU	Vryburg Airport	Africa	ZA	South Africa	North-West	Vyrburg	-26.98240089	24.72879982
933	TDT	Tanda Tula Airport	Africa	ZA	South Africa	Limpopo	Welverdiend	-24.53359985	31.29999924
934	AEE	Adareil Airport	Africa	SS	South Sudan	Upper Nile State	Adar	10.053611	32.959444
935	JUB	Juba International Airport	Africa	SS	South Sudan	Central Equatoria State	Juba	4.87201	31.601101
936	MAK	Malakal Airport	Africa	SS	South Sudan	Upper Nile State	Malakal	9.55897	31.652201
937	RBX	Rumbek Airport	Africa	SS	South Sudan	Lakes State	Rumbek	6.831074	29.669073
938	WUU	Wau Airport	Africa	SS	South Sudan	Western Bahr el Ghazal State	Wau	7.72583	27.975
939	RSS	Damazin Airport	Africa	SD	Sudan	Blue Nile State	Ad Damazin	11.7859	34.3367
940	EBD	El Obeid Airport	Africa	SD	Sudan	North Kurdufan State	Al-Ubayyid	13.15320015	30.23270035
941	ATB	Atbara Airport	Africa	SD	Sudan	River Nile State	Atbara	17.71034431	34.05701828
942	BJE	Baleela Airport	Africa	SD	Sudan	South Kurdufan State	Baleela Base Camp	11.19944444	28.52305556
943	DNX	Galegu Airport	Africa	SD	Sudan	Sennar State	Dinder	12.53299999	35.06700134
944	DOG	Dongola Airport	Africa	SD	Sudan	Northern State	Dongola	19.15390015	30.43009949
945	ADV	El Daein Airport	Africa	SD	Sudan	East Darfur State	El Daein	11.4023	26.1186
946	EDB	El Debba Airport	Africa	SD	Sudan	Northern State	El Debba	18.0146	30.9595
947	ELF	El Fasher Airport	Africa	SD	Sudan	North Darfur State	El Fasher	13.61489964	25.32460022
948	NUD	En Nahud Airport	Africa	SD	Sudan	North Kurdufan State	En Nahud	12.66699982	28.33300018
949	EGN	Geneina Airport	Africa	SD	Sudan	West Darfur State	Geneina	13.481882	22.467119
950	HEG	Heglig Airport	Africa	SD	Sudan	South Kurdufan State	Heglig Oilfield	9.994933	29.397718
951	KDX	Kadugli Airport	Africa	SD	Sudan	South Kurdufan State	Kadugli	11.13799953	29.7010994
952	KSL	Kassala Airport	Africa	SD	Sudan	Kassala State	Kassala	15.38749981	36.3288002
953	KRT	Khartoum International Airport	Africa	SD	Sudan	Khartoum State	Khartoum	15.5895	32.5532
954	GBU	Khashm El Girba Airport	Africa	SD	Sudan	Al Qadarif State	Khashm El Girba	14.92500019	35.87799835
955	MWE	Merowe New Airport	Africa	SD	Sudan	Northern State	Merowe	18.44333333	31.84333333
956	NHF	New Halfa Airport	Africa	SD	Sudan	Kassala State	New Halfa	15.3556	35.727798
957	UYL	Nyala Airport	Africa	SD	Sudan	South Darfur State	Nyala	12.0535	24.9562
958	PZU	Port Sudan New International Airport	Africa	SD	Sudan	Red Sea State	Port Sudan	19.43359947	37.23410034
959	DNI	Wad Medani Airport	Africa	SD	Sudan	Al Jazirah State	Wad Medani	14.295633	33.547271
960	WHF	Wadi Halfa Airport	Africa	SD	Sudan	Northern State	Wadi Halfa	21.802698	31.521578
961	ZLX	Zalingei Airport	Africa	SD	Sudan	West Darfur State	Zalingei	12.9437	23.5631
962	ARK	Arusha Airport	Africa	TZ	Tanzania	Arusha Region	Arusha	-3.367789984	36.63330078
963	JRO	Kilimanjaro International Airport	Africa	TZ	Tanzania	Arusha Region	Arusha	-3.42941	37.074501
964	BKZ	Bukoba Airport	Africa	TZ	Tanzania	Kagera Region	Bukoba	-1.332	31.8212
965	PMA	Pemba Airport	Africa	TZ	Tanzania	Tanga Region	Chake Chake	-5.25726	39.811401
966	DAR	Julius Nyerere International Airport	Africa	TZ	Tanzania	Dar-es-Salaam Region	Dar es Salaam	-6.87811	39.202599
967	DOD	Dodoma Airport	Africa	TZ	Tanzania	Dodoma Region	Dodoma	-6.17044	35.752602
968	GIT	Mchauru Airport	Africa	TZ	Tanzania	Mwanza Region	Geita	-2.813667	32.172472
969	GTZ	Kirawira B Aerodrome	Africa	TZ	Tanzania	Mara Region	Grumeti Game Reserve	-2.160833	34.225556
970	KBH	Kahama Airstrip	Africa	TZ	Tanzania	Shinyanga Region	Kahama	-3.847	32.6865
971	TKQ	Kigoma Airport	Africa	TZ	Tanzania	Xigoma Region	Kigoma	-4.8862	29.6709
972	MFA	Mafia Airport	Africa	TZ	Tanzania	Pwani Region	Kilindoni	-7.917478	39.668502
973	KIY	Kilwa Airport	Africa	TZ	Tanzania	Lindi Region	Kilwa Masoko	-8.91123	39.508619
974	LKY	Lake Manyara Airport	Africa	TZ	Tanzania	Manyara Region	Lake Manyara National Park	-3.37631011	35.81829834
975	LDI	Lindi Airport	Africa	TZ	Tanzania	Lindi Region	Lindi	-9.851005	39.75911
976	LUY	Lushoto Airport	Africa	TZ	Tanzania	Tanga Region	Lushoto	-4.783259869	38.30419922
977	XMI	Masasi Airport	Africa	TZ	Tanzania	Mtwara Region	Masasi	-10.7329998	38.76699829
978	MBI	Songwe Airport	Africa	TZ	Tanzania	Mbeya Region	Mbeya	-8.919942	33.273981
979	QSI	Moshi Airport	Africa	TZ	Tanzania	Kilimanjaro Region	Moshi	-3.363329887	37.32690048
980	NPY	Mpanda Airport	Africa	TZ	Tanzania	Rukwa Region	Mpanda	-6.355374	31.084116
981	MYW	Mtwara Airport	Africa	TZ	Tanzania	Mtwara Region	Mtwara	-10.336204	40.181997
982	MUZ	Musoma Airport	Africa	TZ	Tanzania	Mara Region	Musoma	-1.503	33.8021
983	MWN	Mwadui Airport	Africa	TZ	Tanzania	Shinyanga Region	Mwadui	-3.521332	33.615542
984	MWZ	Mwanza Airport	Africa	TZ	Tanzania	Mwanza Region	Mwanza	-2.444489956	32.93270111
985	NCH	Nachingwea Airport	Africa	TZ	Tanzania	Lindi Region	Nachingwea	-10.35750008	38.77920151
986	IRI	Iringa Airport	Africa	TZ	Tanzania	Iringa Region	Nduli	-7.668630123	35.7521019
987	JOM	Njombe Airport	Africa	TZ	Tanzania	Iringa Region	Njombe	-9.350000381	34.79999924
988	SEU	Seronera Airport	Africa	TZ	Tanzania	Mara Region	Seronera	-2.45806	34.822498
989	SHY	Shinyanga Airport	Africa	TZ	Tanzania	Shinyanga Region	Shinyanga	-3.6093	33.5035
990	SGX	Songea Airport	Africa	TZ	Tanzania	Ruvuma Region	Songea	-10.68299961	35.58300018
991	SUT	Sumbawanga Airport	Africa	TZ	Tanzania	Rukwa Region	Sumbawanga	-7.948889	31.610278
992	TBO	Tabora Airport	Africa	TZ	Tanzania	Tabora Region	Tabora	-5.07638979	32.83330154
993	TGT	Tanga Airport	Africa	TZ	Tanzania	Tanga Region	Tanga	-5.09236	39.071201
994	ZNZ	Abeid Amani Karume International Airport	Africa	TZ	Tanzania	Kaskazini Unguja Region	Zanzibar	-6.22202	39.224899
995	LFW	Lom?????Tokoin International Airport	Africa	TG	Togo	Maritime Region	Lom??	6.16561	1.25451
996	LRL	Niamtougou International Airport	Africa	TG	Togo	Kara Region	Niamtougou	9.76733017	1.091249943
997	DJE	Djerba Zarzis International Airport	Africa	TN	Tunisia	Medenine Governorate	Djerba	33.875	10.7755003
998	EBM	El Borma Airport	Africa	TN	Tunisia	Tataouine Governorate	El Borma	31.70429993	9.254619598
999	NBE	Enfidha - Hammamet International Airport	Africa	TN	Tunisia	Sousse Governorate	Enfidha	36.075833	10.438611
1000	GAE	Gab??s Matmata International Airport	Africa	TN	Tunisia	Gab??s Governorate	Gab??s	33.733691	9.91941
1001	GAF	Gafsa Ksar International Airport	Africa	TN	Tunisia	Gafsa Governorate	Gafsa	34.42200089	8.822500229
1002	MIR	Monastir Habib Bourguiba International Airport	Africa	TN	Tunisia	Monastir Governorate	Monastir	35.7580986	10.75469971
1003	SFA	Sfax Thyna International Airport	Africa	TN	Tunisia	Sfax Governorate	Sfax	34.7179985	10.69099998
1004	TBJ	Tabarka 7 Novembre Airport	Africa	TN	Tunisia	Jendouba Governorate	Tabarka	36.97999954	8.876939774
1005	TOE	Tozeur Nefta International Airport	Africa	TN	Tunisia	Tozeur Governorate	Tozeur	33.93970108	8.110560417
1006	TUN	Tunis Carthage International Airport	Africa	TN	Tunisia	Tunis Governorate	Tunis	36.85100174	10.22719955
1007	RUA	Arua Airport	Africa	UG	Uganda	Northern Region	Arua	3.049152	30.911714
1008	ULU	Gulu Airport	Africa	UG	Uganda	Northern Region	Gulu	2.805560112	32.27180099
1009	JIN	Jinja Airport	Africa	UG	Uganda	Eastern Region	Jinja	0.4499999881	33.20000076
1010	EBB	Entebbe International Airport	Africa	UG	Uganda	Central Region	Kampala	0.042386	32.443501
1011	KSE	Kasese Airport	Africa	UG	Uganda	Western Region	Kasese	0.1829999983	30.10000038
1012	KHX	Savannah Airstrip	Africa	UG	Uganda	Western Region	Kihihi	-0.7165	29.6997
1013	KCU	Masindi Airport	Africa	UG	Uganda	Western Region	Masindi	1.758059978	31.73670006
1014	MBQ	Mbarara Airport	Africa	UG	Uganda	Western Region	Mbarara	-0.555278	30.5994
1015	OYG	Moyo Airport	Africa	UG	Uganda	Northern Region	Moyo	3.64440012	31.76276207
1016	PAF	Kabalega Falls Airport	Africa	UG	Uganda	Western Region	Pakuba	2.326563	31.497698
1017	SRT	Soroti Airport	Africa	UG	Uganda	Eastern Region	Soroti	1.727689981	33.62279892
1018	TRY	Tororo Airport	Africa	UG	Uganda	Eastern Region	Tororo	0.6830000281	34.16699982
1019	VIL	Dakhla Airport	Africa	EH	Western Sahara	Dakhla	Dakhla	23.7183	-15.932
1020	EUN	Hassan I Airport	Africa	EH	Western Sahara	El Aai??n	El Aai??n	27.151699	-13.2192
1021	SMW	Smara Airport	Africa	EH	Western Sahara	Smara	Smara	26.731987	-11.683655
1022	CGJ	Kasompe Airport	Africa	ZM	Zambia	Copperbelt Province	Chingola	-12.57279968	27.89389992
1023	CIP	Chipata Airport	Africa	ZM	Zambia	Eastern Province	Chipata	-13.55830002	32.58720016
1024	JEK	Jeki Airport	Africa	ZM	Zambia	Lusaka Province	Jeki	-15.6334	29.6036
1025	KLB	Kalabo Airport	Africa	ZM	Zambia	Western Province	Kalabo	-14.998818	22.648372
1026	KMZ	Kaoma Airport	Africa	ZM	Zambia	Western Province	Kaoma	-14.80000019	24.78300095
1027	ZKB	Kasaba Bay Airport	Africa	ZM	Zambia	Northern Province	Kasaba Bay	-8.524999619	30.66300011
1028	KAA	Kasama Airport	Africa	ZM	Zambia	Northern Province	Kasama	-10.2166996	31.13330078
1029	KIW	Southdowns Airport	Africa	ZM	Zambia	Copperbelt Province	Kitwe	-12.9005003	28.14990044
1030	LVI	Harry Mwanga Nkumbula International Airport	Africa	ZM	Zambia	Southern Province	Livingstone	-17.8218	25.822701
1031	RYL	Royal Zambezi Lodge Airstrip	Africa	ZM	Zambia	Lusaka Province	Lower Zambezi River	-15.724789	29.303541
1032	LXU	Lukulu Airport	Africa	ZM	Zambia	Western Province	Lukulu	-14.375891	23.248648
1033	LUN	Kenneth Kaunda International Airport	Africa	ZM	Zambia	Lusaka Province	Lusaka	-15.330833	28.452722
1034	MNS	Mansa Airport	Africa	ZM	Zambia	Luapula Province	Mansa	-11.13700008	28.87260056
1035	MMQ	Mbala Airport	Africa	ZM	Zambia	Northern Province	Mbala	-8.85916996	31.33639908
1036	MFU	Mfuwe Airport	Africa	ZM	Zambia	Eastern Province	Mfuwe	-13.25889969	31.93659973
1037	MNR	Mongu Airport	Africa	ZM	Zambia	Western Province	Mongu	-15.25450039	23.16230011
1038	NLA	Simon Mwansa Kapwepwe International Airport	Africa	ZM	Zambia	Copperbelt Province	Ndola	-12.998512	28.664047
1039	ZGM	Ngoma Airport	Africa	ZM	Zambia	Southern Province	Ngoma	-15.9658	25.9333
1040	SXG	Senanga Airport	Africa	ZM	Zambia	Western Province	Senanga	-16.113	23.2982
1041	SJQ	Sesheke Airport	Africa	ZM	Zambia	Western Province	Sesheke	-17.47632	24.306089
1042	SLI	Solwesi Airport	Africa	ZM	Zambia	North-Western Province	Solwesi	-12.17370033	26.36510086
1043	BBZ	Zambezi Airport	Africa	ZM	Zambia	North-Western Province	Zambezi	-13.535996	23.10559
1044	BUQ	Joshua Mqabuko Nkomo International Airport	Africa	ZW	Zimbabwe	Bulawayo Metropolitan Province	Bulawayo	-20.017401	28.617901
1045	BZH	Bumi Hills Airport	Africa	ZW	Zimbabwe	Mashonaland West Province	Bumi	-16.816485	28.344786
1046	CHJ	Chipinge Airport	Africa	ZW	Zimbabwe	Manicaland Province	Chipinge	-20.20669937	32.62829971
1047	BFO	Buffalo Range Airport	Africa	ZW	Zimbabwe	Masvingo Province	Chiredzi	-21.008101	31.5786
1048	MJW	Mahenye Airport	Africa	ZW	Zimbabwe	Manicaland Province	Gonarezhou National Park	-21.231	32.3336
1049	GWE	Gweru - Thornhill Air Base	Africa	ZW	Zimbabwe	Midlands Province	Gweru	-19.436718	29.861945
1050	HRE	Robert Gabriel Mugabe International Airport	Africa	ZW	Zimbabwe	Harare Metropolitan Province	Harare	-17.931801	31.0928
1051	WKI	Hwange (Town) Airport	Africa	ZW	Zimbabwe	Matabeleland North Province	Hwange	-18.362967	26.519791
1052	HWN	Hwange National Park Airport	Africa	ZW	Zimbabwe	Matabeleland North Province	Hwange	-18.62989998	27.02099991
1053	KAB	Kariba International Airport	Africa	ZW	Zimbabwe	Mashonaland West Province	Kariba	-16.5198	28.885
1054	MVZ	Masvingo International Airport	Africa	ZW	Zimbabwe	Masvingo Province	Masvingo	-20.05529976	30.85910034
1055	UTA	Mutare Airport	Africa	ZW	Zimbabwe	Manicaland Province	Mutare	-18.99749947	32.62720108
1056	VFA	Victoria Falls International Airport	Africa	ZW	Zimbabwe	Matabeleland North Province	Victoria Falls	-18.09589958	25.8390007
1057	QET	Troll Airfield	Antarctica	AQ	Antarctica	Troll Station	Troll Station	-71.95714	2.45257
1058	TNM	Teniente Rodolfo Marsh Martin Airport	Antarctica	AQ	Antarctica	Villa Las Estrellas	Villa Las Estrellas	-62.191026	-58.98669
1059	OAI	Bagram Airfield	Asia	AF	Afghanistan	Parwan Province	Bagram	34.946098	69.264999
1060	BIN	Bamyan Airport	Asia	AF	Afghanistan	Bamiyan Province	Bamyan	34.808916	67.816629
1061	OAA	Shank Air Base	Asia	AF	Afghanistan	Logar Province	Baraki Barak	33.922217	69.07794
1062	CCN	Chaghcharan Airport	Asia	AF	Afghanistan	Gh??r Province	Chaghcharan	34.526465	65.27102
1063	DAZ	Darwaz Airport	Asia	AF	Afghanistan	Badakhshan Province	Darwaz	38.461708	70.881608
1064	FAH	Farah Airport	Asia	AF	Afghanistan	Farah Province	Farah	32.366667	62.165347
1065	FBD	Fayzabad Airport	Asia	AF	Afghanistan	Badakhshan Province	Fayzabad	37.122148	70.5201
1066	GRG	Gardez Airport	Asia	AF	Afghanistan	Paktia Province	Gardez	33.627366	69.237023
1067	GZI	Ghazni Airport	Asia	AF	Afghanistan	Ghazni Province	Ghazni	33.487853	68.525243
1068	HEA	Herat - Khwaja Abdullah Ansari International Airport	Asia	AF	Afghanistan	Herat Province	Guzara	34.209999	62.228298
1069	JAA	Jalalabad Airport	Asia	AF	Afghanistan	Nangarhar Province	Jalalabad	34.399799	70.498596
1070	KBL	Kabul International Airport	Asia	AF	Afghanistan	Kabul Province	Kabul	34.565899	69.212303
1071	KHT	Khost International Airport	Asia	AF	Afghanistan	Khost Province	Khost	33.284605	69.80734
1072	OLR	Salerno Airport	Asia	AF	Afghanistan	Khost Province	Khost	33.3638	69.9561
1073	KDH	Ahmad Shah Baba International Airport / Kandahar Airfield	Asia	AF	Afghanistan	Kandahar Province	Khvoshab	31.5058	65.847801
1074	KWH	Khwahan Airport	Asia	AF	Afghanistan	Badakhshan Province	Khwahan	37.890021	70.20383
1075	UND	Kunduz Airport	Asia	AF	Afghanistan	Kunduz Province	Kunduz	36.6651	68.910797
1076	BST	Bost Airport	Asia	AF	Afghanistan	Helmand Province	Lashkar Gah	31.5597	64.364998
1077	OAZ	Camp Shorabak Airfield	Asia	AF	Afghanistan	Helmand Province	Lashkar Gah	31.848735	64.223175
1078	MMZ	Maymana Zahiraddin Faryabi Airport	Asia	AF	Afghanistan	Faryab Province	Maymana	35.930801	64.760902
1079	MZR	Mazar-i-Sharif International Airport	Asia	AF	Afghanistan	Balkh Province	Mazar-i-Sharif	36.706902	67.209702
1080	VCC	Nili Airport	Asia	AF	Afghanistan	Daykundi Province	Nili	33.739456	66.157408
1081	URZ	Or??zg??n Airport	Asia	AF	Afghanistan	Or??zg??n Province	Or??zg??n	32.90299988	66.63089752
1082	LQN	Qala-i-Naw Airport	Asia	AF	Afghanistan	Badghis Province	Qala-i-Naw	34.985472	63.117404
1083	DWR	Dwyer Airport	Asia	AF	Afghanistan	Helmand Province	Reg	31.091265	64.066053
1084	SBF	Sardeh Band Airport	Asia	AF	Afghanistan	Ghazni Province	Sardeh Band	33.3207016	68.6364975
1085	OAS	Sharana Airstrip	Asia	AF	Afghanistan	Paktika Province	Sharana	33.12575	68.838517
1086	OAH	Shindand Air Base	Asia	AF	Afghanistan	Farah Province	Shindand	33.3913	62.261002
1087	SGA	Sheghnan Airport	Asia	AF	Afghanistan	Badakhshan Province	Shiveh	37.497642	71.508484
1088	TQN	Taleqan Airport	Asia	AF	Afghanistan	Takhar Province	Taleqan	36.770699	69.531998
1089	TII	Tarinkot Airport	Asia	AF	Afghanistan	Or??zg??n Province	Tarinkot	32.604198	65.865799
1090	URN	Urgun Airport	Asia	AF	Afghanistan	Paktika Province	Urgun	32.939933	69.150064
1091	ZAJ	Zaranj Airport	Asia	AF	Afghanistan	Nimruz Province	Zaranj	30.972222	61.865833
1092	LWN	Shirak International Airport	Asia	AM	Armenia	Shirak Province	Gyumri	40.750401	43.859299
1093	EVN	Zvartnots International Airport	Asia	AM	Armenia	Yerevan (capital district)	Yerevan	40.14730072	44.39590073
1094	GYD	Heydar Aliyev International Airport	Asia	AZ	Azerbaijan	Baku (city)	Baku	40.46749878	50.04669952
1095	ZXT	Zabrat Airport	Asia	AZ	Azerbaijan	Baku (city)	Baku	40.49554222	49.97680664
1096	FZL	Fizuli Airport	Asia	AZ	Azerbaijan	Fuzuli District	Fizuli	39.594578	47.196128
1097	GBB	Gabala International Airport	Asia	AZ	Azerbaijan	Qabala District	Gabala	40.808617	47.725389
1098	KVD	Ganja International Airport	Asia	AZ	Azerbaijan	Ganja (city)	Ganja	40.737701	46.3176
1099	LLK	Lankaran International Airport	Asia	AZ	Azerbaijan	Lankaran District	Lankaran	38.757919	48.807042
1100	NAJ	Nakhchivan Airport	Asia	AZ	Azerbaijan	Nakhchivan Autonomous Republic	Nakhchivan	39.18880081	45.45840073
1101	YLV	Yevlakh Airport	Asia	AZ	Azerbaijan	Yevlax (city)	Yevlakh	40.631901	47.141899
1102	ZTU	Zaqatala International Airport	Asia	AZ	Azerbaijan	Zaqatala District	Zaqatala	41.557823	46.669464
1103	BAH	Bahrain International Airport	Asia	BH	Bahrain	Muharraq Governorate	Manama	26.267295	50.63764
1104	BZL	Barisal Airport	Asia	BD	Bangladesh	Barisal Division	Barisal	22.8010006	90.30120087
1105	CGP	Shah Amanat International Airport	Asia	BD	Bangladesh	Chittagong Division	Chattogram (Chittagong)	22.249599	91.813301
1106	CLA	Comilla Airport	Asia	BD	Bangladesh	Chittagong Division	Comilla	23.43720055	91.18969727
1107	CXB	Cox's Bazar Airport	Asia	BD	Bangladesh	Chittagong Division	Cox's Bazar	21.45219994	91.96389771
1108	DAC	Hazrat Shahjalal International Airport	Asia	BD	Bangladesh	Dhaka Division	Dhaka	23.843347	90.397783
1109	IRD	Ishurdi Airport	Asia	BD	Bangladesh	Rajshahi Division	Ishurdi	24.15250015	89.04940033
1110	JSR	Jessore Airport	Asia	BD	Bangladesh	Khulna Division	Jashore (Jessore)	23.1838	89.160797
1111	RJH	Shah Mokhdum Airport	Asia	BD	Bangladesh	Rajshahi Division	Rajshahi	24.43720055	88.61650085
1112	SPD	Saidpur Airport	Asia	BD	Bangladesh	Rajshahi Division	Saidpur	25.75919914	88.9088974
1113	ZHM	Shamshernagar Airport	Asia	BD	Bangladesh	Sylhet Division	Shamshernagar	24.398333	91.916944
1114	ZYL	Osmany International Airport	Asia	BD	Bangladesh	Sylhet Division	Sylhet	24.963832	91.864843
1115	TKR	Thakurgaon Airport	Asia	BD	Bangladesh	Rajshahi Division	Thakurgaon	26.01639938	88.4036026
1116	GLU	Gelephu Airport	Asia	BT	Bhutan	Sarpang	Gelephu	26.88456	90.46412
1117	BUT	Bathpalathang Airport	Asia	BT	Bhutan	Bumthang	Jakar	27.5622	90.7471
1118	PBH	Paro International Airport	Asia	BT	Bhutan	Paro	Paro	27.4032	89.424599
1119	YON	Yongphulla Airport	Asia	BT	Bhutan	Trashigang	Tashigang	27.256399	91.514503
1120	NKW	Diego Garcia Naval Support Facility	Asia	IO	British Indian Ocean Territory	Diego Garcia	Diego Garcia	-7.31327	72.411102
1121	BWN	Brunei International Airport	Asia	BN	Brunei	Brunei-Muara District	Bandar Seri Begawan	4.944200039	114.9280014
1122	VBA	Ann Airport	Asia	MM	Burma	Rakhine State	Aeng	19.769199	94.0261
1123	BMO	Banmaw Airport	Asia	MM	Burma	Kachin State	Banmaw	24.2689991	97.24620056
1124	VBP	Bokpyinn Airport	Asia	MM	Burma	Tanintharyi Division	Bokpyinn	11.1494	98.735901
1125	TVY	Dawei Airport	Asia	MM	Burma	Tanintharyi Division	Dawei	14.10389996	98.20359802
1126	GAW	Gangaw Airport	Asia	MM	Burma	Magway Division	Gangaw	22.17469978	94.13439941
1129	HEB	Hinthada Airport	Asia	MM	Burma	Ayeyarwady Division	Hinthada	17.63332939	95.46669769
1130	HOX	Hommalinn Airport	Asia	MM	Burma	Sagaing Division	Hommalinn	24.89959908	94.91400146
1131	PAA	Hpa-N Airport	Asia	MM	Burma	Kayin State	Hpa-N	16.89369965	97.67459869
1132	KMV	Kalay Airport	Asia	MM	Burma	Sagaing Division	Kalemyo	23.18880081	94.05110168
1133	KHM	Kanti Airport	Asia	MM	Burma	Sagaing Division	Kanti	25.98830032	95.67440033
1134	KAW	Kawthoung Airport	Asia	MM	Burma	Tanintharyi Division	Kawthoung	10.04930019	98.53800201
1135	KET	Kengtung Airport	Asia	MM	Burma	Shan State	Kengtung	21.3015995	99.63600159
1136	KYP	Kyaukpyu Airport	Asia	MM	Burma	Rakhine State	Kyaukpyu	19.42639923	93.53479767
1137	KYT	Kyauktu Airport	Asia	MM	Burma	Magway Division	Kyauktu	21.39999962	94.13330078
1138	LSH	Lashio Airport	Asia	MM	Burma	Shan State	Lashio	22.97789955	97.75219727
1139	LIW	Loikaw Airport	Asia	MM	Burma	Kayah State	Loikaw	19.69149971	97.21479797
1140	MWQ	Magway Airport	Asia	MM	Burma	Magway Division	Magway	20.1656	94.941399
1141	MGU	Manaung Airport	Asia	MM	Burma	Rakhine State	Manaung	18.8458004	93.68890381
1142	MDL	Mandalay International Airport	Asia	MM	Burma	Mandalay Division	Mandalay	21.70219994	95.97789764
1143	MNU	Mawlamyine Airport	Asia	MM	Burma	Mon State	Mawlamyine	16.44470024	97.66069794
1144	MGZ	Myeik Airport	Asia	MM	Burma	Tanintharyi Division	Mkeik	12.43980026	98.62149811
1145	MOE	Momeik Airport	Asia	MM	Burma	Shan State	Momeik	23.09250069	96.64530182
1146	MOG	Mong Hsat Airport	Asia	MM	Burma	Shan State	Mong Hsat	20.51679993	99.25679779
1147	MGK	Mong Tong Airport	Asia	MM	Burma	Shan State	Mong Tong	20.29669952	98.89890289
1148	NYW	Monywar Airport	Asia	MM	Burma	Sagaing Division	Monywar	22.221638	95.093479
1149	MYT	Myitkyina Airport	Asia	MM	Burma	Kachin State	Myitkyina	25.38360023	97.35189819
1150	NMS	Namsang Airport	Asia	MM	Burma	Shan State	Namsang	20.89049911	97.73590088
1151	NMT	Namtu Airport	Asia	MM	Burma	Shan State	Namtu	23.083	97.383003
1152	NYU	Bagan Airport	Asia	MM	Burma	Mandalay Division	Nyaung U	21.17880058	94.93019867
1153	PPU	Hpapun Airport	Asia	MM	Burma	Kayin State	Pa Pun	18.06669998	97.44979858
1154	PKK	Pakhokku Airport	Asia	MM	Burma	Magway Division	Pakhokku	21.4043	95.11125
1155	BSX	Pathein Airport	Asia	MM	Burma	Ayeyarwady Division	Pathein	16.815201	94.7799
1156	PAU	Pauk Airport	Asia	MM	Burma	Magway Division	Pauk	21.44919968	94.48690033
1157	PBU	Putao Airport	Asia	MM	Burma	Kachin State	Putao	27.32990074	97.42630005
1158	PRU	Pyay Airport	Asia	MM	Burma	Bago Division	Pye	18.82449913	95.26599884
1159	NYT	Nay Pyi Taw International Airport	Asia	MM	Burma	Mandalay Division	Pyinmana	19.623501	96.200996
1160	AKY	Sittwe Airport	Asia	MM	Burma	Rakhine State	Sittwe	20.133165	92.870693
1161	THL	Tachileik Airport	Asia	MM	Burma	Shan State	Tachileik	20.48380089	99.93540192
1162	SNW	Thandwe Airport	Asia	MM	Burma	Rakhine State	Thandwe	18.46069908	94.30010223
1163	TIO	Tilin Airport	Asia	MM	Burma	Magway Division	Tilin	21.70000076	94.09999847
1164	RGN	Yangon International Airport	Asia	MM	Burma	Yangon Division	Yangon	16.90730095	96.1332016
1165	XYE	Ye Airport	Asia	MM	Burma	Mon State	Ye	15.30000019	97.86699677
1166	BBM	Battambang Airport	Asia	KH	Cambodia	Baat Dambang	Battambang	13.09560013	103.223999
1167	KZC	Kampong Chhnang Airport	Asia	KH	Cambodia	Kampong Chhnang	Kampong Chhnang	12.255032	104.564657
1168	KZD	Krakor Airport	Asia	KH	Cambodia	Pousaat	Krakor	12.5385	104.1486
1169	KKZ	Koh Kong Airport	Asia	KH	Cambodia	Kach Kong	Krong Khemara Phoumin	11.613397	102.997084
1170	PNH	Phnom Penh International Airport	Asia	KH	Cambodia	Phnom Penh	Phnom Penh (Pou Senchey)	11.5466	104.844002
1171	RBE	Ratanakiri Airport	Asia	KH	Cambodia	Rotanak Kiri	Ratanakiri	13.72999954	106.9869995
1172	MWV	Mondulkiri Airport	Asia	KH	Cambodia	Mondol Kiri	Sen Monorom	12.463648	107.187252
1173	REP	Siem Reap International Airport	Asia	KH	Cambodia	Siem Reab	Siem Reap	13.41155	103.813044
1174	KOS	Sihanoukville International Airport	Asia	KH	Cambodia	Xrong Preah Sihanouk	Sihanoukville	10.5797	103.637001
1175	DSY	Dara Sakor International Airport	Asia	KH	Cambodia	Kach Kong	Ta Noun	10.914244	103.226652
1176	OMY	Preah Vinhear Airport	Asia	KH	Cambodia	Preah Vihear	Tbeng Meanchey	13.7597	104.97173
1177	AHJ	Hongyuan Airport	Asia	CN	China	Sichuan Province	Aba	32.53154	102.35224
1178	AKU	Aksu Onsu Airport	Asia	CN	China	Xinjiang Autonomous Region	Aksu (Onsu)	41.262501	80.291702
1179	AAT	Altay Airport	Asia	CN	China	Xinjiang Autonomous Region	Altay	47.749886	88.085808
1180	AKA	Ankang Fuqiang Airport	Asia	CN	China	Shaanxi Province	Ankang	32.75696	108.87338
1181	AQG	Anqing Tianzhushan Airport / Anqing North Air Base	Asia	CN	China	Anhui Province	Anqing	30.582199	117.050003
1182	AOG	Anshan Teng'ao Airport / Anshan Air Base	Asia	CN	China	Liaoning Province	Anshan	41.105301	122.853996
1183	AYN	Anyang Airport	Asia	CN	China	Henan Province	Anyang	36.1339	114.344002
1184	YIE	Arxan Yi'ershi Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Arxan	47.3106	119.9117
1185	RHT	Alxa Right Banner Badanjilin Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Badanjilin	39.225	101.546
1186	DBC	Baicheng Chang'an Airport	Asia	CN	China	Jilin Province	Baicheng	45.505278	123.019722
1187	AEB	Baise Youjiang Airport	Asia	CN	China	Guangxi Autonomous Region	Baise (Tianyang)	23.7206	106.959999
1188	NBS	Changbaishan Airport	Asia	CN	China	Jilin Province	Baishan	42.066944	127.602222
1189	BPX	Qamdo Bangda Airport	Asia	CN	China	Tibet Autonomous Region	Bangda	30.55360031	97.10829926
1190	BSD	Baoshan Yunrui Airport	Asia	CN	China	Yunnan Province	Baoshan	25.053301	99.168297
1191	BAV	Baotou Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Baotou	40.56000137	109.9970016
1192	RLK	Bayannur Tianjitai Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Bavannur	40.926	107.7428
1193	AXF	Alxa Left Banner Bayanhot Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Bayanhot	38.74831	105.58858
1194	BZX	Bazhong Enyang Airport	Asia	CN	China	Sichuan Province	Bazhong	31.73842	106.644872
1195	BHY	Beihai Fucheng Airport	Asia	CN	China	Guangxi Autonomous Region	Beihai (Yinhai)	21.5394	109.293999
1196	PEK	Beijing Capital International Airport	Asia	CN	China	Beijing Municipality	Beijing	40.08010101	116.5849991
1197	PKX	Beijing Daxing International Airport	Asia	CN	China	Beijing Municipality	Beijing	39.509945	116.41092
1198	NAY	Beijing Nanjiao Airport	Asia	CN	China	Beijing Municipality	Beijing	39.48595	116.37236
1199	BFU	Bengbu Airport	Asia	CN	China	Anhui Province	Bengbu	32.84773333	117.3202444
1200	BFJ	Bijie Feixiong Airport	Asia	CN	China	Guizhou Province	Bijie	27.267066	105.472097
1201	BPL	Bole Alashankou Airport	Asia	CN	China	Xinjiang Autonomous Region	Bole	44.895	82.3
1202	KJI	Burqin Kanas Airport	Asia	CN	China	Xinjiang Autonomous Region	Burqin	48.2223	86.9959
1203	CWJ	Cangyuan Washan Airport	Asia	CN	China	Yunnan Province	Cangyuan Va Autonomous County	23.273889	99.373611
1204	CGQ	Changchun Longjia International Airport	Asia	CN	China	Jilin Province	Changchun	43.996201	125.684998
1205	CGD	Changde Taohuayuan Airport	Asia	CN	China	Hunan Province	Changde	28.9189	111.639999
1206	CNI	Changhai Airport	Asia	CN	China	Liaoning Province	Changhai, Dalian	39.266667	122.666944
1207	CSX	Changsha Huanghua International Airport	Asia	CN	China	Hunan Province	Changsha	28.18919945	113.2200012
1208	CIH	Changzhi Airport	Asia	CN	China	Shanxi Province	Changzhi	36.247501	113.125999
1209	CZX	Changzhou Benniu Airport	Asia	CN	China	Jiangsu Province	Changzhou	31.919701	119.778999
1210	CDE	Chengde Puning Airport	Asia	CN	China	Hebei Province	Chengde	41.1225	118.073889
1211	HZU	Chengdu Huaizhou Airport	Asia	CN	China	Sichuan Province	Chengdu	30.677339	104.529397
1212	CTU	Chengdu Shuangliu International Airport	Asia	CN	China	Sichuan Province	Chengdu	30.558257	103.945966
1213	HCZ	Chenzhou Beihu Airport	Asia	CN	China	Hunan Province	Chenzhou	25.753419	112.845404
1214	AEQ	Ar Horqin Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Chifeng	43.87042	120.15958
1215	CIF	Chifeng Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Chifeng	42.23500061	118.9079971
1216	JUH	Chizhou Jiuhuashan Airport	Asia	CN	China	Anhui Province	Chizhou	30.7403	117.6856
1217	CKG	Chongqing Jiangbei International Airport	Asia	CN	China	Chongqing Municipality	Chongqing	29.712254	106.651895
1218	YGA	Yongchuan Da'an General Airport	Asia	CN	China	Chongqing Municipality	Chongqing	29.356667	106.010441
1219	GHN	Guanghan Airport	Asia	CN	China	Sichuan Province	Civil Aviation Flight University of China	30.9485	104.3296
1220	DLU	Dali Huangcaoba Airport	Asia	CN	China	Yunnan Province	Dali (Xiaguan)	25.649401	100.319
1221	DFA	Shangluo Airport	Asia	CN	China	Shaanxi Province	Danfeng	33.708533	110.249284
1222	DCY	Daocheng Yading Airport	Asia	CN	China	Sichuan Province	Daocheng County	29.31632	100.060317
1223	DQA	Daqing Sa'ertu Airport	Asia	CN	China	Heilongjiang Province	Daqing	46.750883	125.138642
1224	DAT	Datong Yungang Airport	Asia	CN	China	Shanxi Province	Datong	40.061614	113.480032
1225	DAX	Dachuan Airport	Asia	CN	China	Sichuan Province	Dazhou	31.1302	107.4295
1226	DZH	Dazhou Jinya Airport	Asia	CN	China	Sichuan Province	Dazhou Shi	31.0448	107.43723
1227	DZU	Dazu Air Base	Asia	CN	China	Chongqing Municipality	Dazu	29.636227	105.773621
1228	HXD	Delingha Airport	Asia	CN	China	Qinghai Province	Delingha	37.125286	97.268658
1229	DOY	Dongying Shengli Airport	Asia	CN	China	Shandong Province	Dongying	37.50859833	118.788002
1230	DNH	Dunhuang Mogao International Airport	Asia	CN	China	Gansu Province	Dunhuang	40.161098	94.809196
1231	EJN	Ejin Banner-Taolai Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Ejin Banner	42.0155	101.0005
1232	ENH	Enshi Airport	Asia	CN	China	Hubei Province	Enshi	30.32029915	109.4850006
1233	ERL	Erenhot Saiwusu International Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Erenhot	43.4225	112.096667
1234	FUO	Foshan Shadi Airport	Asia	CN	China	Guangdong Province	Foshan (Nanhai)	23.0833	113.07
1235	FYJ	Fuyuan Dongji Aiport	Asia	CN	China	Heilongjiang Province	Fuyuan	48.197219	134.36298
1236	FYN	Fuyun Koktokay Airport	Asia	CN	China	Xinjiang Autonomous Region	Fuyun	46.804169	89.512006
1237	FOC	Fuzhou Changle International Airport	Asia	CN	China	Fujian Province	Fuzhou	25.934669	119.66318
1238	DLC	Dalian Zhoushuizi International Airport	Asia	CN	China	Liaoning Province	Ganjingzi, Dalian	38.965698	121.539001
1239	KOW	Ganzhou Huangjin Airport	Asia	CN	China	Jiangxi Province	Ganzhou	25.853333	114.778889
1240	GZG	Garze Gesar Airport	Asia	CN	China	Sichuan Province	Garze County	31.7575	99.554167
1241	GOQ	Golmud Airport	Asia	CN	China	Qinghai Province	Golmud	36.4006	94.786102
1242	GMQ	Golog Maqin Airport	Asia	CN	China	Qinghai Province	Golog	34.418066	100.301144
1243	GYS	Guangyuan Panlong Airport	Asia	CN	China	Sichuan Province	Guangyuan	32.391102	105.702003
1244	CAN	Guangzhou Baiyun International Airport	Asia	CN	China	Guangdong Province	Guangzhou (Huadu)	23.392401	113.299004
1245	KWL	Guilin Liangjiang International Airport	Asia	CN	China	Guangxi Autonomous Region	Guilin (Lingui)	25.219828	110.039553
1246	KWE	Longdongbao Airport	Asia	CN	China	Guizhou Province	Guiyang	26.53849983	106.8010025
1247	GYU	Guyuan Liupanshan Airport	Asia	CN	China	Ningxia Autonomous Region	Guyuan	36.07888889	106.2169444
1248	HAK	Haikou Meilan International Airport	Asia	CN	China	Hainan Province	Haikou (Meilan)	19.9349	110.459
1249	HLD	Hulunbuir Hailar Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Hailar	49.205002	119.824997
1250	HMI	Hami Airport	Asia	CN	China	Xinjiang Autonomous Region	Hami	42.8414	93.669197
1251	HDG	Handan Airport	Asia	CN	China	Hebei Province	Handan	36.525833	114.425556
1252	HGH	Hangzhou Xiaoshan International Airport	Asia	CN	China	Zhejiang Province	Hangzhou	30.23609	120.428865
1253	JDE	Jiande Qiandaohu General Airport	Asia	CN	China	Zhejiang Province	Hangzhou	29.360905	119.180829
1254	HZG	Hanzhong Chenggu Airport	Asia	CN	China	Shaanxi Province	Hanzhong	33.134136	107.206014
1255	HRB	Harbin Taiping International Airport	Asia	CN	China	Heilongjiang Province	Harbin	45.623402	126.25
1256	HCJ	Hechi Jinchengjiang Airport	Asia	CN	China	Guangxi Autonomous Region	Hechi (Jinchengjiang)	24.804344	107.710819
1257	HFE	Hefei Xinqiao International Airport	Asia	CN	China	Anhui Province	Hefei	31.98779	116.9769
1258	HEK	Heihe Aihui Airport	Asia	CN	China	Heilongjiang Province	Heihe	50.171621	127.308884
1259	NJJ	Nenjiang Melgen Airport	Asia	CN	China	Heilongjiang Province	Heihe	49.236372	125.337052
1260	DTU	Wudalianchi Dedu Airport	Asia	CN	China	Heilongjiang Province	Heihe	48.441037	126.128374
1261	HNY	Hengyang Nanyue Airport	Asia	CN	China	Hunan Province	Hengyang	26.72208	112.617958
1262	HZA	Heze Mudan Airport	Asia	CN	China	Shandong Province	Heze	35.212972	115.736748
1263	HET	Baita International Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Hohhot	40.851398	111.823997
1264	HUO	Holingol Huolinhe Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Holingol	45.487222	119.407222
1265	HTN	Hotan Airport	Asia	CN	China	Xinjiang Autonomous Region	Hotan	37.03850174	79.86489868
1266	YTW	Yutian Wanfang Airport	Asia	CN	China	Xinjiang Autonomous Region	Hotan (Yutian)	36.8085	81.7827
1267	HIA	Lianshui Airport	Asia	CN	China	Jiangsu Province	Huai'an	33.79083333	119.125
1268	HJJ	Huaihua Zhijiang Airport	Asia	CN	China	Hunan Province	Huaihua	27.441111	109.7
1269	KJH	Kaili Airport	Asia	CN	China	Guizhou Province	Huangping	26.972	107.988
1270	TXN	Tunxi International Airport	Asia	CN	China	Anhui Province	Huangshan	29.73329926	118.2559967
1271	HYN	Taizhou Luqiao Airport	Asia	CN	China	Zhejiang Province	Huangyan	28.562201	121.429001
1272	HUZ	Huizhou Pingtan Airport	Asia	CN	China	Guangdong Province	Huizhou (Pingtan)	23.049999	114.599998
1273	DWS	Morin Dawa Banner Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Hulunbuir	48.38745	124.43127
1274	SHE	Shenyang Taoxian International Airport	Asia	CN	China	Liaoning Province	Hunnan, Shenyang	41.639801	123.483002
1275	DEQ	Deqing Moganshan Airport	Asia	CN	China	Zhejiang Province	Huzhou	30.504264	120.107388
1276	JGD	Jagdaqi Guangming Airport	Asia	CN	China	Heilongjiang Province	Jagdaqi	50.371389	124.1175
1277	JGS	Jinggangshan Airport	Asia	CN	China	Jiangxi Province	Ji'an	26.856899	114.737
1278	JMU	Jiamusi Airport	Asia	CN	China	Heilongjiang Province	Jiamusi	46.84339905	130.4649963
1279	JSJ	Jiansanjiang Shidi Airport	Asia	CN	China	Heilongjiang Province	Jiansanjiang	47.108248	132.65792
1280	TFU	Chengdu Tianfu International Airport	Asia	CN	China	Sichuan Province	Jianyang, Chengdu	30.31252	104.441284
1281	TAO	Qingdao Jiaodong International Airport	Asia	CN	China	Shandong Province	Jiaozhou, Qingdao	36.361953	120.088171
1282	JGN	Jiayuguan Airport	Asia	CN	China	Gansu Province	Jiayuguan	39.856899	98.3414
1283	SWA	Jieyang Chaoshan International Airport	Asia	CN	China	Guangdong Province	Jieyang (Rongcheng)	23.552	116.5033
1284	JIL	Jilin Ertaizi Airport	Asia	CN	China	Jilin Province	Jilin	44.002652	126.395244
1285	TNA	Jinan Yaoqiang International Airport	Asia	CN	China	Shandong Province	Jinan	36.857201	117.216003
1286	JIC	Jinchang Jinchuan Airport	Asia	CN	China	Gansu Province	Jinchang	38.542222	102.348333
1287	JDZ	Jingdezhen Luojia Airport	Asia	CN	China	Jiangxi Province	Jingdezhen	29.3386	117.176003
1288	JHG	Xishuangbanna Gasa Airport	Asia	CN	China	Yunnan Province	Jinghong (Gasa)	21.9739	100.760002
1289	SHS	Jingzhou Shashi Airport	Asia	CN	China	Hubei Province	Jingzhou	30.29281	112.44854
1290	JNG	Jining Qufu Airport	Asia	CN	China	Shandong Province	Jining	35.292778	116.346667
1291	JIU	Jiujiang Lushan Airport	Asia	CN	China	Jiangxi Province	Jiujiang	29.476944	115.801111
1292	JZH	Jiuzhai Huanglong Airport	Asia	CN	China	Sichuan Province	Jiuzhaigou	32.85333333	103.6822222
1293	JXA	Jixi Xingkaihu Airport	Asia	CN	China	Heilongjiang Province	Jixi	45.293	131.193
1294	KGT	Kangding Airport	Asia	CN	China	Sichuan Province	Kangding	30.142464	101.73872
1295	KRY	Karamay Airport	Asia	CN	China	Xinjiang Autonomous Region	Karamay	45.46655	84.9527
1296	KHG	Kashgar Airport	Asia	CN	China	Xinjiang Autonomous Region	Kashgar	39.54290009	76.01999664
1297	KRL	Korla Airport	Asia	CN	China	Xinjiang Autonomous Region	Korla	41.69779968	86.12889862
1298	KMG	Kunming Changshui International Airport	Asia	CN	China	Yunnan Province	Kunming	25.1019444	102.9291667
1299	KCA	Kuqa Qiuci Airport	Asia	CN	China	Xinjiang Autonomous Region	Kuqa	41.677856	82.872917
1300	JMJ	Lancang Jingmai Airport	Asia	CN	China	Yunnan Province	Lancang Lahu Autonomous County	22.415833	99.786389
1301	LHW	Lanzhou Zhongchuan International Airport	Asia	CN	China	Gansu Province	Lanzhou	36.515202	103.620003
1302	YKH	Yingkou Lanqi Airport	Asia	CN	China	Liaoning Province	Laobian, Yingkou	40.542524	122.3586
1303	LXA	Lhasa Gonggar Airport	Asia	CN	China	Tibet Autonomous Region	Lhasa	29.29780006	90.91190338
1304	LIA	Liangping Airport	Asia	CN	China	Chongqing Municipality	Liangping	30.679399	107.786003
1305	LYG	Lianyungang Baitabu Airport / Baitabu Air Base	Asia	CN	China	Jiangsu Province	Lianyungang	34.571667	118.873611
1306	LLB	Libo Airport	Asia	CN	China	Guizhou Province	Libo County	25.4525	107.961667
1307	LJG	Lijiang Sanyi International Airport	Asia	CN	China	Yunnan Province	Lijiang	26.68	100.246002
1308	LNJ	Lincang Boshang Airport	Asia	CN	China	Yunnan Province	Lincang	23.7381	100.025002
1309	LFQ	Linfen Qiaoli Airport	Asia	CN	China	Shanxi Province	Linfen	36.132629	111.641236
1310	JNZ	Jinzhou Bay Airport	Asia	CN	China	Liaoning Province	Linghai, Jinzhou	40.936032	121.277114
1311	LYI	Linyi Qiyang Airport	Asia	CN	China	Shandong Province	Linyi	35.052918	118.411828
1312	HZH	Liping Airport	Asia	CN	China	Guizhou Province	Liping	26.32217	109.1499
1313	LPF	Liupanshui Yuezhao Airport	Asia	CN	China	Guizhou Province	Liupanshui	26.609417	104.979
1314	LZH	Liuzhou Bailian Airport / Bailian Air Base	Asia	CN	China	Guangxi Autonomous Region	Liuzhou (Liujiang)	24.2075	109.390999
1315	LNL	Longnan Chengzhou Airport	Asia	CN	China	Gansu Province	Longnan	33.788	105.797
1316	LCX	Longyan Guanzhishan Airport	Asia	CN	China	Fujian Province	Longyan	25.67469978	116.7470016
1317	LLV	L??liang Dawu Airport	Asia	CN	China	Shaanxi Province	L??liang	37.683333	111.142778
1318	LYA	Luoyang Beijiao Airport	Asia	CN	China	Henan Province	Luoyang	34.7411	112.388
1319	LUM	Dehong Mangshi Airport	Asia	CN	China	Yunnan Province	Mangshi	24.4011	98.5317
1320	NZH	Manzhouli Xijiao Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Manzhouli Xijiao	49.566667	117.33
1321	MXZ	Meizhou Meixian Changgangji International Airport	Asia	CN	China	Guangdong Province	Meizhou (Meixian)	24.263425	116.097857
1322	XIN	Xingning Air Base	Asia	CN	China	Guangdong Province	Meizhou (Xingning)	24.1492	115.758003
1323	HTT	Huatugou Airport	Asia	CN	China	Qinghai Province	Mengnai	38.201645	90.837843
1324	MIG	Mianyang Nanjiao Airport	Asia	CN	China	Sichuan Province	Mianyang	31.428101	104.740997
1325	OHE	Mohe Gulian Airport	Asia	CN	China	Heilongjiang Province	Mohe	52.916871	122.422759
1454	ZUH	Zhuhai Jinwan Airport	Asia	CN	China	Guangdong Province	Zhuhai (Jinwan)	22.006399	113.375999
1326	MDG	Mudanjiang Hailang International Airport	Asia	CN	China	Heilongjiang Province	Mudanjiang	44.52410126	129.5690002
1327	KHN	Nanchang Changbei International Airport	Asia	CN	China	Jiangxi Province	Nanchang	28.864815	115.90271
1328	NAO	Nanchong Gaoping Airport	Asia	CN	China	Sichuan Province	Nanchong	30.79545	106.1626
1329	NKG	Nanjing Lukou International Airport	Asia	CN	China	Jiangsu Province	Nanjing	31.735032	118.865949
1330	NNG	Nanning Wuxu Airport	Asia	CN	China	Guangxi Autonomous Region	Nanning (Jiangnan)	22.608299	108.171997
1331	NTG	Nantong Airport	Asia	CN	China	Jiangsu Province	Nantong	32.07080078	120.9759979
1332	NNY	Nanyang Jiangying Airport	Asia	CN	China	Henan Province	Nanyang	32.982696	112.617467
1333	XRQ	New Barag Right Banner Baogede Airport	Asia	CN	China	Inner Mongolia Autonomous Region	New Barag Right Banner	48.575585	116.939382
1334	NGB	Ningbo Lishe International Airport	Asia	CN	China	Zhejiang Province	Ningbo	29.82670021	121.461998
1335	NLH	Ninglang Luguhu Airport	Asia	CN	China	Yunnan Province	Ninglang	27.5403	100.7593
1336	LZY	Nyingchi Airport	Asia	CN	China	Tibet Autonomous Region	Nyingchi	29.30330086	94.33529663
1337	DSN	Ordos Ejin Horo Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Ordos	39.49	109.8613889
1338	PZI	Bao'anying Airport	Asia	CN	China	Sichuan Province	Panzhihua	26.54	101.79852
1339	SYM	Pu'er Simao Airport	Asia	CN	China	Yunnan Province	Pu'er	22.793301	100.959
1340	YSQ	Songyuan Chaganhu Airport	Asia	CN	China	Jilin Province	Qian Gorlos Mongol Autonomous County	44.938114	124.550178
1341	JIQ	Qianjiang Wulingshan Airport	Asia	CN	China	Chongqing Municipality	Qianjiang	29.51333333	108.8311111
1342	IQM	Qiemo Yudu Airport	Asia	CN	China	Xinjiang Autonomous Region	Qiemo	38.234516	85.465462
1343	HBQ	Haibei Qilian Airport	Asia	CN	China	Qinghai Province	Qilian	38.012	100.644
1344	IQN	Qingyang Xifeng Airport	Asia	CN	China	Gansu Province	Qingyang	35.799702	107.602997
1345	BPE	Qinhuangdao Beidaihe Airport	Asia	CN	China	Hebei Province	Qinhuangdao	39.666389	119.058889
1346	BAR	Qionghai Bo'ao Airport	Asia	CN	China	Hainan Province	Qionghai	19.13824	110.454775
1347	NDG	Qiqihar Sanjiazi Airport	Asia	CN	China	Heilongjiang Province	Qiqihar	47.23960114	123.9179993
1348	JJN	Quanzhou Jinjiang International Airport	Asia	CN	China	Fujian Province	Quanzhou	24.7964	118.589996
1349	JUZ	Quzhou Airport	Asia	CN	China	Zhejiang Province	Quzhou	28.965799	118.899002
1350	RIZ	Rizhao Shanzihe Airport	Asia	CN	China	Shandong Province	Rizhao	35.405033	119.324403
1351	RUG	Rugao Air Base	Asia	CN	China	Jiangsu Province	Rugao	32.25788498	120.5016556
1352	RQA	Ruoqiang Loulan Airport	Asia	CN	China	Xinjiang Autonomous Region	Ruoqiang Town	38.974722	88.008333
1353	HSC	Shaoguan Guitou Airport	Asia	CN	China	Guangdong Province	Ruyuan Yao Autonomous County (Shaoguan)	24.9786	113.420998
1354	SQJ	Sanming Shaxian Airport	Asia	CN	China	Fujian Province	Sanming	26.4263	117.8336
1355	SYX	Sanya Phoenix International Airport	Asia	CN	China	Hainan Province	Sanya (Tianya)	18.3029	109.412003
1356	QSZ	Shache Yeerqiang Airport	Asia	CN	China	Xinjiang Autonomous Region	Shache	38.24542	77.056149
1357	SHA	Shanghai Hongqiao International Airport	Asia	CN	China	Shanghai Municipality	Shanghai (Minhang)	31.198104	121.33426
1358	PVG	Shanghai Pudong International Airport	Asia	CN	China	Shanghai Municipality	Shanghai (Pudong)	31.1434	121.805
1359	SQD	Shangrao Sanqingshan Airport	Asia	CN	China	Jiangxi Province	Shangrao	28.3797	117.9643
1360	DIG	Diqing Shangri-La Airport	Asia	CN	China	Yunnan Province	Shangri-La	27.7936	99.6772
1361	SXJ	Shanshan Airport	Asia	CN	China	Xinjiang Autonomous Region	Shanshan	42.9117012	90.24749756
1362	WGN	Shaoyang Wugang Airport	Asia	CN	China	Hunan Province	Shaoyang	26.806123	110.641042
1363	HPG	Shennongjia Hongping Airport	Asia	CN	China	Hubei Province	Shennongjia	31.626	110.34
1364	SZX	Shenzhen Bao'an International Airport	Asia	CN	China	Guangdong Province	Shenzhen (Bao'an)	22.639299	113.810997
1365	SHF	Shihezi Huayuan Airport	Asia	CN	China	Xinjiang Autonomous Region	Shihezi	44.2421	85.8905
1366	LCT	Shijiazhuang Luancheng Airport	Asia	CN	China	Hebei Province	Shijiazhuang	37.91305	114.59166
1367	SJW	Shijiazhuang Zhengding International Airport	Asia	CN	China	Hebei Province	Shijiazhuang	38.280701	114.696999
1368	NGQ	Ngari Gunsa Airport	Asia	CN	China	Tibet Autonomous Region	Shiquanhe	32.1	80.05305556
1369	WDS	Shiyan Wudangshan Airport	Asia	CN	China	Hubei Province	Shiyan	32.591667	110.907778
1370	CHG	Chaoyang Airport	Asia	CN	China	Liaoning Province	Shuangta, Chaoyang	41.538101	120.434998
1371	HLJ	Zhaodong Beidahuang General Airport	Asia	CN	China	Heilongjiang Province	Suihua	46.12779	125.77354
1372	SZV	Suzhou Guangfu Airport	Asia	CN	China	Jiangsu Province	Suzhou	31.2631	120.401001
1373	TCG	Tacheng Airport	Asia	CN	China	Xinjiang Autonomous Region	Tacheng	46.67250061	83.34079742
1374	TYN	Taiyuan Wusu Airport	Asia	CN	China	Shanxi Province	Taiyuan	37.746899	112.627998
1375	TYC	Taiyuan Yaocheng Airport	Asia	CN	China	Shanxi Province	Taiyuan	37.50312	112.424126
1376	WUZ	Wuzhou Xijiang Airport	Asia	CN	China	Guangxi Autonomous Region	Tangbu	23.40316	111.09331
1377	TVS	Tangshan Sann??he Airport	Asia	CN	China	Hebei Province	Tangshan	39.71780014	118.0026245
1378	TCZ	Tengchong Tuofeng Airport	Asia	CN	China	Yunnan Province	Tengchong	24.93805556	98.48583333
1379	TSN	Tianjin Binhai International Airport	Asia	CN	China	Tianjin Municipality	Tianjin	39.12440109	117.3460007
1380	THQ	Tianshui Maijishan Airport	Asia	CN	China	Gansu Province	Tianshui	34.559399	105.860001
1381	TNH	Tonghua Sanyuanpu Airport	Asia	CN	China	Jilin Province	Tonghua	42.25388889	125.7033333
1382	TGO	Tongliao Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Tongliao	43.556702	122.199997
1383	TEN	Tongren Fenghuang Airport	Asia	CN	China	Guizhou Province	Tongren Fenghuang	27.883333	109.308889
1384	TWC	Tumxuk Tangwangcheng Airport	Asia	CN	China	Xinjiang Autonomous Region	Tumxuk	39.886663	79.233408
1385	TLQ	Turpan Jiaohe Airport	Asia	CN	China	Xinjiang Autonomous Region	Turpan	43.0308	89.0987
1386	HLH	Ulanhot Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Ulanhot	46.195333	122.008333
1387	UCB	Ulanqab Jining Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Ulanqab	41.129722	113.108056
1388	WZQ	Urad Middle Banner	Asia	CN	China	Inner Mongolia Autonomous Region	Urad Middle Banner	41.45958	108.53454
1389	URC	??r??mqi Diwopu International Airport	Asia	CN	China	Xinjiang Autonomous Region	??r??mqi	43.90710068	87.47419739
1390	WXN	Wanzhou Wuqiao Airport	Asia	CN	China	Chongqing Municipality	Wanzhou	30.8017	108.433
1391	WEF	Weifang Nanyuan Airport	Asia	CN	China	Shandong Province	Weifang	36.646702	119.119003
1392	WEH	Weihai Dashuibo Airport	Asia	CN	China	Shandong Province	Weihai	37.187099	122.228996
1393	WNH	Wenshan Puzhehei Airport	Asia	CN	China	Yunnan Province	Wenshan	23.5583	104.3255
1394	WNZ	Wenzhou Longwan International Airport	Asia	CN	China	Zhejiang Province	Wenzhou	27.912201	120.851997
1395	WUA	Wuhai Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Wuhai	39.7934	106.7993
1396	WUH	Wuhan Tianhe International Airport	Asia	CN	China	Hubei Province	Wuhan	30.774798	114.213723
1397	WHU	Wuhu Wanli Airport / Wuhu Air Base	Asia	CN	China	Anhui Province	Wuhu	31.3906	118.408997
1398	CQW	Chongqing Xiann??shan Airport	Asia	CN	China	Chongqing Municipality	Wulong	29.465658	107.693664
1399	WSK	Chongqing Wushan Airport	Asia	CN	China	Chongqing Municipality	Wushan	31.06896	109.708958
1400	WUX	Sunan Shuofang International Airport	Asia	CN	China	Jiangsu Province	Wuxi	31.49440002	120.4290009
1401	WUS	Nanping Wuyishan Airport	Asia	CN	China	Fujian Province	Wuyishan	27.7019	118.000999
1402	XIY	Xi'an Xianyang International Airport	Asia	CN	China	Shaanxi Province	Xi'an	34.447102	108.751999
1403	SIA	Xi'an Xiguan Airport	Asia	CN	China	Shaanxi Province	Xi'an	34.376701	109.120003
1404	GXH	Gannan Xiahe Airport	Asia	CN	China	Gansu Province	Xiahe	34.8105	102.6447
1405	XMN	Xiamen Gaoqi International Airport	Asia	CN	China	Fujian Province	Xiamen	24.54400063	118.1279984
1406	LHK	Guangzhou MR Air Base / Guanghua Airport	Asia	CN	China	Hubei Province	Xiangyang	32.38866	111.69425
1407	XFN	Xiangyang Liuji Airport	Asia	CN	China	Hubei Province	Xiangyang	32.152222	112.291666
1408	XIC	Xichang Qingshan Airport	Asia	CN	China	Sichuan Province	Xichang	27.9890995	102.1839981
1409	RKZ	Xigaze Peace Airport / Shigatse Air Base	Asia	CN	China	Tibet Autonomous Region	Xigaz??	29.3519	89.311401
1410	XIL	Xilinhot Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Xilinhot	43.91559982	115.9639969
1411	XEN	Xingcheng Air Base	Asia	CN	China	Liaoning Province	Xingcheng, Huludao	40.580328	120.700374
1412	XNT	Xingtai Dalian Airport	Asia	CN	China	Hebei Province	Xingtai	36.8831	114.4293
1413	ACX	Xingyi Wanfenglin Airport	Asia	CN	China	Guizhou Province	Xingyi	25.083423	104.960804
1414	XNN	Xining Caojiabu Airport	Asia	CN	China	Qinghai Province	Xining	36.5275	102.042999
1415	XAI	Xinyang Minggang Airport	Asia	CN	China	Henan Province	Xinyang	32.540819	114.079141
1416	NLT	Xinyuan Nalati Airport	Asia	CN	China	Xinjiang Autonomous Region	Xinyuan	43.4318	83.3786
1417	WUT	Xinzhou Wutaishan Airport	Asia	CN	China	Shanxi Province	Xinzhou	38.597456	112.969173
1418	AVA	Anshun Huangguoshu Airport	Asia	CN	China	Guizhou Province	Xixiu, Anshun	26.260556	105.873333
1419	XUZ	Xuzhou Guanyin International Airport	Asia	CN	China	Jiangsu Province	Xuzhou	34.059056	117.555278
1420	ENY	Yan'an Nanniwan Airport	Asia	CN	China	Shaanxi Province	Yan'an	36.479413	109.464083
1421	YNZ	Yancheng Airport	Asia	CN	China	Jiangsu Province	Yancheng	33.425833	120.203056
1422	YTY	Yangzhou Taizhou Airport	Asia	CN	China	Jiangsu Province	Yangzhou	32.5634	119.7198
1423	YNJ	Yanji Chaoyangchuan Airport	Asia	CN	China	Jilin Province	Yanji	42.88280106	129.451004
1424	YNT	Yantai Penglai International Airport	Asia	CN	China	Shandong Province	Yantai	37.659724	120.978124
1425	YBP	Yibin Wuliangye Airport	Asia	CN	China	Sichuan Province	Yibin	28.858431	104.526157
1426	YIH	Yichang Sanxia Airport	Asia	CN	China	Hubei Province	Yichang	30.55655	111.479988
1427	LDS	Lindu Airport	Asia	CN	China	Heilongjiang Province	Yichun	47.75205556	129.019125
1428	YIC	Yichun Mingyueshan Airport	Asia	CN	China	Jiangxi Province	Yichun	27.8025	114.3062
1429	INC	Yinchuan Hedong International Airport	Asia	CN	China	Ningxia Autonomous Region	Yinchuan	38.322758	106.393214
1430	YEH	Yinchuan/Xincheng Air Base	Asia	CN	China	Ningxia Autonomous Region	Yinchuan	38.481899	106.009003
1431	FUG	Fuyang Xiguan Airport	Asia	CN	China	Anhui Province	Yingzhou, Fuyang	32.882157	115.734364
1432	YIN	Yining Airport	Asia	CN	China	Xinjiang Autonomous Region	Yining	43.955799	81.330299
1433	YIW	Yiwu Airport	Asia	CN	China	Zhejiang Province	Yiwu	29.34469986	120.0319977
1434	LLF	Yongzhou Lingling Airport	Asia	CN	China	Hunan Province	Yongzhou	26.338661	111.610043
1435	YUA	Yuanmou Air Base	Asia	CN	China	Yunnan Province	Yuanmou	25.73749924	101.8820038
1436	YYA	Yueyang Sanhe Airport	Asia	CN	China	Hunan Province	Yueyang	29.311699	113.281574
1437	UYN	Yulin Yuyang Airport	Asia	CN	China	Shaanxi Province	Yulin	38.35971	109.590927
1438	YLX	Yulin Fumian Airport	Asia	CN	China	Guangxi Autonomous Region	Y??l??n	22.438056	110.120833
1439	YCU	Yuncheng Guangong Airport	Asia	CN	China	Shaanxi Province	Yuncheng	35.116391	111.0313889
1440	LZO	Luzhou Yunlong Airport	Asia	CN	China	Sichuan Province	Yunlong	29.030357	105.468407
1441	YUS	Yushu Batang Airport	Asia	CN	China	Qinghai Province	Yushu	32.83638889	97.03638889
1442	NZL	Zhalantun Genghis Khan Airport	Asia	CN	China	Inner Mongolia Autonomous Region	Zhalantun	47.865942	122.768662
1443	DYG	Zhangjiajie Hehua International Airport	Asia	CN	China	Hunan Province	Zhangjiajie	29.1028	110.443001
1444	ZQZ	Zhangjiakou Ningyuan Airport	Asia	CN	China	Hebei Province	Zhangjiakou	40.73860168	114.9300003
1445	YZY	Zhangye Ganzhou Airport	Asia	CN	China	Gansu Province	Zhangye	38.801899	100.675003
1446	ZHA	Zhanjiang Xintang Airport	Asia	CN	China	Guangdong Province	Zhanjiang (Xiashan)	21.214399	110.358002
1447	ZAT	Zhaotong Airport	Asia	CN	China	Yunnan Province	Zhaotong	27.32559967	103.7549973
1448	HSJ	Zhengzhou Shangjie Airport	Asia	CN	China	Henan Province	Zhengzhou	34.842153	113.273983
1449	CGO	Zhengzhou Xinzheng International Airport	Asia	CN	China	Henan Province	Zhengzhou	34.526497	113.849165
1450	AZJ	Zhenjiang Dalu Airport	Asia	CN	China	Jiangsu Province	Zhenjiang	32.23649	119.718683
1451	DDG	Dandong Langtou Airport	Asia	CN	China	Liaoning Province	Zhenxing, Dandong	40.0247	124.286003
1452	ZHY	Zhongwei Shapotou Airport	Asia	CN	China	Ningxia Autonomous Region	Zhongwei	37.573125	105.154454
1453	HSN	Zhoushan Putuoshan Airport	Asia	CN	China	Zhejiang Province	Zhoushan	29.9342	122.362
1455	ZKL	Zigong Fengming Airport	Asia	CN	China	Sichuan Province	Zigong	29.376484	104.625789
1456	WMT	Zunyi Maotai Airport	Asia	CN	China	Guizhou Province	Zunyi	27.81638	106.33268
1457	ZYI	Zunyi Xinzhou Airport	Asia	CN	China	Guizhou Province	Zunyi	27.5895	107.0007
1458	XCH	Christmas Island Airport	Asia	CX	Christmas Island	Flying Fish Cove	Flying Fish Cove	-10.4506	105.690002
1459	CCK	Cocos (Keeling) Islands Airport	Asia	CC	Cocos (Keeling) Islands	West Island	West Island	-12.19134	96.833696
1460	AKT	RAF Akrotiri	Asia	CY	Cyprus	Sovereign Base Areas of Akrotiri and Dhekelia	Akrotiri	34.590401	32.9879
1461	GEC	Lefkoniko Airport / Ge??itkale Air Base	Asia	CY	Cyprus	Famagusta District	Ge??itkale	35.235947	33.724358
1462	LCA	Larnaca International Airport	Asia	CY	Cyprus	Larnarca District	Larnaca	34.875099	33.624901
1463	ECN	Ercan International Airport	Asia	CY	Cyprus	Nicosia District	Nicosia	35.15470123	33.49610138
1464	PFO	Paphos International Airport	Asia	CY	Cyprus	Paphos District	Paphos	34.717999	32.485699
1465	AUE	Abu Rudeis Airport	Asia	EG	Egypt	South Sinai Governorate	Abu Rudeis	28.89900017	33.20249939
1466	AAC	El Arish International Airport	Asia	EG	Egypt	North Sinai Governorate	El Arish	31.07329941	33.83580017
1467	EGH	El Gora Airport	Asia	EG	Egypt	North Sinai Governorate	El Gora	31.072783	34.13229
1468	ELT	El Tor Airport	Asia	EG	Egypt	South Sinai Governorate	El Tor	28.209	33.6455
1469	SKV	Saint Catherine International Airport	Asia	EG	Egypt	South Sinai Governorate	Saint Catherine	28.682729	34.060503
1470	SSH	Sharm El Sheikh International Airport	Asia	EG	Egypt	South Sinai Governorate	Sharm el-Sheikh	27.977301	34.395
1471	TCP	Taba International Airport	Asia	EG	Egypt	North Sinai Governorate	Taba	29.587799	34.778099
1472	BUS	Batumi International Airport	Asia	GE	Georgia	Autonomous Republic of Adjara	Batumi	41.61029816	41.59970093
1473	KUT	David the Builder Kutaisi International Airport	Asia	GE	Georgia	Imereti	Kopitnari	42.176768	42.482393
1474	SUI	Sukhumi Babushara /  Vladislav Ardzinba International Airport	Asia	GE	Georgia	Autonomous Republic of Abkhazia	Sukhumi	42.8582	41.128101
1475	TBS	Tbilisi International Airport	Asia	GE	Georgia	Tbilisi	Tbilisi	41.6692009	44.95470047
1476	HKG	Hong Kong International Airport	Asia	HK	Hong Kong	Hong Kong	Hong Kong	22.308901	113.915001
1477	AIP	Adampur Airport	Asia	IN	India	Punjab	Adampur	31.4338	75.758797
1478	IXA	Agartala - Maharaja Bir Bikram Airport	Asia	IN	India	Tripura	Agartala	23.886999	91.240402
1479	AGX	Agatti Airport	Asia	IN	India	Lakshadweep	Agatti	10.8237	72.176003
1480	AGR	Agra Airport / Agra Air Force Station	Asia	IN	India	Uttar Pradesh	Agra	27.157683	77.960942
1481	AMD	Sardar Vallabhbhai Patel International Airport	Asia	IN	India	Gujarat	Ahmedabad	23.07719994	72.63469696
1482	AJL	Lengpui Airport	Asia	IN	India	Mizoram	Aizawl (Lengpui)	23.840599	92.619698
1483	KQH	Kishangarh Airport Ajmer	Asia	IN	India	Rajasthan	Ajmer (Kishangarh)	26.591007	74.812956
1484	AKD	Akola Airport	Asia	IN	India	Maharashtra	Akola	20.698931	77.056883
1485	IXD	Allahabad Airport	Asia	IN	India	Uttar Pradesh	Allahabad	25.4401	81.733902
1486	IXV	Along Airport	Asia	IN	India	Arunachal Pradesh	Along	28.1753006	94.80200195
1487	ATQ	Sri Guru Ram Dass Jee International Airport	Asia	IN	India	Punjab	Amritsar	31.7096	74.797302
1488	IXU	Aurangabad Airport	Asia	IN	India	Maharashtra	Aurangabad	19.86269951	75.39810181
1489	RGH	Balurghat Airport	Asia	IN	India	West Bengal	Balurghat	25.26169968	88.79560089
1490	BLR	Kempegowda International Airport	Asia	IN	India	Karnataka	Bangalore	13.1979	77.706299
1491	BEK	Bareilly Air Force Station	Asia	IN	India	Uttar Pradesh	Bareilly	28.42210007	79.45079803
1492	IXG	Belagavi Airport	Asia	IN	India	Karnataka	Belgaum	15.8593	74.618301
1493	BEP	Bellary Airport	Asia	IN	India	Karnataka	Bellary	15.16279984	76.88279724
1494	BUP	Bhatinda Air Force Station	Asia	IN	India	Punjab	Bhatinda	30.27009964	74.75579834
1495	BHU	Bhavnagar Airport	Asia	IN	India	Gujarat	Bhavnagar	21.75219917	72.18520355
1496	BHO	Raja Bhoj International Airport	Asia	IN	India	Madhya Pradesh	Bhopal	23.28750038	77.33740234
1497	BBI	Biju Patnaik Airport	Asia	IN	India	Odisha	Bhubaneswar	20.24440002	85.81780243
1498	BHJ	Bhuj Airport	Asia	IN	India	Gujarat	Bhuj	23.28779984	69.67019653
1499	KUU	Kullu Manali Airport	Asia	IN	India	Himachal Pradesh	Bhuntar	31.876699	77.154404
1500	IXX	Bidar Airport / Bidar Air Force Station	Asia	IN	India	Karnataka	Bidar	17.9081	77.487099
1501	BKB	Nal Airport	Asia	IN	India	Rajasthan	Bikaner	28.07060051	73.2071991
1502	PAB	Bilaspur Airport	Asia	IN	India	Chhattisgarh	Bilaspur	21.9884	82.111
1503	CCJ	Calicut International Airport	Asia	IN	India	Kerala	Calicut	11.1368	75.955299
1504	IXC	Chandigarh International Airport	Asia	IN	India	Chandigarh	Chandigarh	30.6735	76.788498
1505	MAA	Chennai International Airport	Asia	IN	India	Tamil Nadu	Chennai	12.990005	80.169296
1506	CJB	Coimbatore International Airport	Asia	IN	India	Tamil Nadu	Coimbatore	11.02999973	77.04340363
1507	COH	Cooch Behar Airport	Asia	IN	India	West Bengal	Cooch Behar	26.3305	89.467201
1508	NMB	Daman Airport	Asia	IN	India	Daman and Diu	Daman	20.434401	72.843201
1509	DEP	Daporijo Airport	Asia	IN	India	Arunachal Pradesh	Daporijo	27.98550034	94.22280121
1510	DBR	Darbhanga Airport	Asia	IN	India	Bihar	Darbhanga, Bihar, India	26.192801	85.916901
1511	DED	Dehradun Airport	Asia	IN	India	Uttaranchal	Dehradun	30.189699	78.180298
1512	DGH	Deoghar Airport	Asia	IN	India	Jharkhand	Deoghar	24.446842	86.704955
1513	DBD	Dhanbad Airport	Asia	IN	India	Bihar	Dhanbad	23.83399963	86.4253006
1514	DIB	Dibrugarh Airport	Asia	IN	India	Assam	Dibrugarh	27.48390007	95.01689911
1515	DMU	Dimapur Airport	Asia	IN	India	Nagaland	Dimapur	25.88389969	93.77110291
1516	DIU	Diu Airport	Asia	IN	India	Daman and Diu	Diu	20.7131	70.921097
1517	RDP	Kazi Nazrul Islam Airport	Asia	IN	India	West Bengal	Durgapur	23.6225	87.243
1518	DHM	Kangra Airport	Asia	IN	India	Himachal Pradesh	Gaggal	32.1651	76.263397
1519	VGA	Vijayawada Airport	Asia	IN	India	Andhra Pradesh	Gannavaram	16.530399	80.796799
1520	GAY	Gaya Airport	Asia	IN	India	Bihar	Gaya	24.74430084	84.95120239
1521	GDB	Gondia Airport	Asia	IN	India	Maharashtra	Gondia	21.526817	80.290347
1522	GOP	Gorakhpur Airport	Asia	IN	India	Uttar Pradesh	Gorakhpur	26.73970032	83.4496994
1523	GUX	Guna Airport	Asia	IN	India	Madhya Pradesh	Guna	24.654699	77.347298
1524	GAU	Lokpriya Gopinath Bordoloi International Airport	Asia	IN	India	Assam	Guwahati	26.10610008	91.58589935
1525	GWL	Gwalior Airport	Asia	IN	India	Madhya Pradesh	Gwalior	26.29330063	78.22779846
1526	HSS	Hissar Airport	Asia	IN	India	Haryana	Hissar	29.17939949	75.75530243
1527	HBX	Hubli Airport	Asia	IN	India	Karnataka	Hubli	15.36170006	75.0848999
1528	BPM	Begumpet Airport	Asia	IN	India	Telangana	Hyderabad	17.4531002	78.46759796
1529	HYD	Rajiv Gandhi International Airport	Asia	IN	India	Telangana	Hyderabad	17.231318	78.429855
1530	CBD	Car Nicobar Air Force Base	Asia	IN	India	Andaman and Nicobar Islands	IAF Camp	9.153056	92.819273
1531	IMF	Imphal Airport	Asia	IN	India	Manipur	Imphal	24.76000023	93.896698
1532	IDR	Devi Ahilyabai Holkar Airport	Asia	IN	India	Madhya Pradesh	Indore	22.72179985	75.80110168
1533	JLR	Jabalpur Airport	Asia	IN	India	Madhya Pradesh	Jabalpur	23.17779922	80.05200195
1534	JGB	Jagdalpur Airport	Asia	IN	India	Chhattisgarh	Jagdalpur	19.074301	82.036797
1535	JAI	Jaipur International Airport	Asia	IN	India	Rajasthan	Jaipur	26.8242	75.812202
1536	JSA	Jaisalmer Airport	Asia	IN	India	Rajasthan	Jaisalmer	26.88870049	70.86499786
1537	IXJ	Jammu Airport	Asia	IN	India	Jammu and Kashmir	Jammu	32.688849	74.838152
1538	JGA	Jamnagar Airport	Asia	IN	India	Gujarat	Jamnagar	22.46549988	70.01260376
1539	IXW	Sonari Airport	Asia	IN	India	Jharkhand	Jamshedpur	22.813786	86.169739
1540	PYB	Jeypore Airport	Asia	IN	India	Odisha	Jeypore	18.87999916	82.55200195
1541	JRG	Jharsuguda Airport	Asia	IN	India	Odisha	Jharsuguda	21.9135	84.0504
1542	JDH	Jodhpur Airport	Asia	IN	India	Rajasthan	Jodhpur	26.25110054	73.04889679
1543	JRH	Jorhat Airport	Asia	IN	India	Assam	Jorhat	26.73150063	94.17549896
1544	SLV	Shimla Airport	Asia	IN	India	Himachal Pradesh	Jubbarhatti	31.0818	77.068001
1545	CDP	Kadapa Airport	Asia	IN	India	Andhra Pradesh	Kadapa	14.513154	78.769183
1546	IXH	Kailashahar Airport	Asia	IN	India	Tripura	Kailashahar	24.308657	92.00768
1547	SAG	Shirdi Airport	Asia	IN	India	Maharashtra	Kakadi	19.688752	74.377354
1548	IXY	Kandla Airport	Asia	IN	India	Gujarat	Kandla	23.1127	70.100304
1549	CNN	Kannur International Airport	Asia	IN	India	Kerala	Kannur	11.918614	75.547211
1550	KNU	Kanpur Airport	Asia	IN	India	Uttar Pradesh	Kanpur	26.404301	80.410103
1551	IXK	Keshod Airport	Asia	IN	India	Gujarat	Keshod	21.317101	70.270401
1552	HJR	Khajuraho Airport	Asia	IN	India	Madhya Pradesh	Khajuraho	24.8172	79.918602
1553	IXN	Khowai Airport	Asia	IN	India	Tripura	Khowai	24.061899	91.603897
1554	COK	Cochin International Airport	Asia	IN	India	Kerala	Kochi	10.152	76.401901
1555	KLH	Kolhapur Airport	Asia	IN	India	Maharashtra	Kolhapur	16.66469955	74.28939819
1556	CCU	Netaji Subhash Chandra Bose International Airport	Asia	IN	India	West Bengal	Kolkata	22.65469933	88.44670105
1557	KTU	Kota Airport	Asia	IN	India	Rajasthan	Kota	25.16020012	75.84559631
1558	KBK	Kushinagar International Airport	Asia	IN	India	Uttar Pradesh	Kushinagar	26.776534	83.889214
1559	LTU	Murod Kond Airport	Asia	IN	India	Maharashtra	Latur	18.411501	76.464699
1560	IXL	Leh Kushok Bakula Rimpochee Airport	Asia	IN	India	Jammu and Kashmir	Leh	34.13589859	77.54650116
1561	IXI	North Lakhimpur Airport	Asia	IN	India	Assam	Lilabari	27.2954998	94.09760284
1562	LKO	Chaudhary Charan Singh International Airport	Asia	IN	India	Uttar Pradesh	Lucknow	26.76059914	80.88929749
1563	LUH	Ludhiana Airport	Asia	IN	India	Punjab	Ludhiana	30.85470009	75.95259857
1564	IXM	Madurai Airport	Asia	IN	India	Tamil Nadu	Madurai	9.83450985	78.09339905
1565	LDA	Malda Airport	Asia	IN	India	West Bengal	Malda	25.011	88.127
1566	IXE	Mangalore International Airport	Asia	IN	India	Karnataka	Mangalore	12.9612999	74.89009857
1567	IXQ	Kamalpur Airport	Asia	IN	India	Tripura	Manik Bhandar	24.134325	91.810769
1568	BOM	Chhatrapati Shivaji International Airport	Asia	IN	India	Maharashtra	Mumbai	19.08869934	72.86789703
1569	MZU	Muzaffarpur Airport	Asia	IN	India	Bihar	Muzaffarpur	26.11910057	85.31369781
1570	MYQ	Mysore Airport	Asia	IN	India	Karnataka	Mysore	12.23	76.655833
1571	NAG	Dr. Babasaheb Ambedkar International Airport	Asia	IN	India	Maharashtra	Nagpur	21.092199	79.047203
1572	NDC	Nanded Airport	Asia	IN	India	Maharashtra	Nanded	19.18330002	77.3167038
1573	ISK	Nashik Airport	Asia	IN	India	Maharashtra	Nasik	20.119101	73.912903
1574	DEL	Indira Gandhi International Airport	Asia	IN	India	Delhi	New Delhi	28.55563	77.09519
1575	NVY	Neyveli Airport	Asia	IN	India	Tamil Nadu	Neyveli	11.61295605	79.5273819
1576	KJB	Kurnool Airport	Asia	IN	India	Andhra Pradesh	Orvakal	15.716288	78.16923
1577	OMN	Osmanabad Airport	Asia	IN	India	Maharashtra	Osmanabad	18.281	76.0574
1578	PYG	Pakyong Airport	Asia	IN	India	Sikkim	Pakyong	27.2313	88.587196
1579	PGH	Pantnagar Airport	Asia	IN	India	Uttar Pradesh	Pantnagar	29.0334	79.473701
1580	IXT	Pasighat Airport	Asia	IN	India	Arunachal Pradesh	Pasighat	28.06609917	95.33560181
1581	IXP	Pathankot Airport	Asia	IN	India	Punjab	Pathankot	32.233611	75.634444
1582	PAT	Lok Nayak Jayaprakash Airport	Asia	IN	India	Bihar	Patna	25.59129906	85.08799744
1583	PBD	Porbandar Airport	Asia	IN	India	Gujarat	Porbandar	21.649524	69.656405
1584	IXZ	Veer Savarkar International Airport / INS Utkrosh	Asia	IN	India	Andaman and Nicobar Islands	Port Blair	11.641208	92.729643
1585	PNY	Pondicherry Airport	Asia	IN	India	Pondicherry	Puducherry (Pondicherry)	11.968	79.812
1586	PNQ	Pune Airport / Lohagaon Air Force Station	Asia	IN	India	Maharashtra	Pune	18.5821	73.919701
1587	PUT	Sri Sathya Sai Airport	Asia	IN	India	Andhra Pradesh	Puttaparthi	14.14929962	77.79109955
1588	RPR	Swami Vivekananda Airport	Asia	IN	India	Chhattisgarh	Raipur	21.180401	81.7388
1589	RJA	Rajahmundry Airport	Asia	IN	India	Andhra Pradesh	Rajahmundry	17.11039925	81.81819916
1590	RAJ	Rajkot Airport	Asia	IN	India	Gujarat	Rajkot	22.30920029	70.77950287
1591	RJI	Rajouri Airport	Asia	IN	India	Jammu and Kashmir	Rajouri	33.37789917	74.31520081
1592	RMD	Basanth Nagar Airport	Asia	IN	India	Telangana	Ramagundam	18.701	79.3923
1593	IXR	Birsa Munda Airport	Asia	IN	India	Jharkhand	Ranchi	23.31430054	85.32170105
1594	RTC	Ratnagiri Airport	Asia	IN	India	Maharashtra	Ratnagiri	17.013599	73.327797
1595	REW	Rewa Airport, Chorhata, REWA	Asia	IN	India	Madhya Pradesh	Rewa	24.503401	81.220299
1596	RRK	Rourkela Airport	Asia	IN	India	Odisha	Rourkela	22.256701	84.814598
1597	RUP	Rupsi Airport	Asia	IN	India	Assam	Rupsi	26.141867	89.907892
1598	SXV	Salem Airport	Asia	IN	India	Tamil Nadu	Salem	11.7833004	78.06559753
1599	TNI	Satna Airport	Asia	IN	India	Madhya Pradesh	Satna	24.56262	80.852927
1600	SHL	Shillong Airport	Asia	IN	India	Meghalaya	Shillong	25.70359993	91.97869873
1601	IXS	Silchar Airport	Asia	IN	India	Assam	Silchar	24.91290092	92.97869873
1602	IXB	Bagdogra Airport	Asia	IN	India	West Bengal	Siliguri	26.68120003	88.32859802
1603	SSE	Solapur Airport	Asia	IN	India	Maharashtra	Solapur	17.62800026	75.93479919
1604	SXR	Sheikh ul Alam International Airport	Asia	IN	India	Jammu and Kashmir	Srinagar	33.987099	74.7742
1605	STV	Surat Airport	Asia	IN	India	Gujarat	Surat	21.1140995	72.7417984
1606	TEZ	Tezpur Airport	Asia	IN	India	Assam	Tezpur	26.70910072	92.78469849
1607	TEI	Tezu Airport	Asia	IN	India	Arunachal Pradesh	Tezu	27.94120026	96.13439941
1608	TJV	Thanjavur Air Force Station	Asia	IN	India	Tamil Nadu	Thanjavur	10.7224	79.101601
1609	TRV	Trivandrum International Airport	Asia	IN	India	Kerala	Thiruvananthapuram	8.48211956	76.92009735
1610	TRZ	Tiruchirappalli International Airport	Asia	IN	India	Tamil Nadu	Tiruchirappalli	10.7654	78.709702
1611	TIR	Tirupati Airport	Asia	IN	India	Andhra Pradesh	Tirupati	13.63249969	79.54329681
1612	VDY	Jindal Vijaynagar Airport	Asia	IN	India	Karnataka	Toranagallu	15.175921	76.63303
1613	UDR	Maharana Pratap Airport	Asia	IN	India	Rajasthan	Udaipur	24.61770058	73.89610291
1614	BDQ	Vadodara Airport	Asia	IN	India	Gujarat	Vadodara	22.336201	73.226303
1615	TCR	Tuticorin Airport	Asia	IN	India	Tamil Nadu	Vagaikulam	8.724241	78.025803
1616	VNS	Lal Bahadur Shastri Airport	Asia	IN	India	Uttar Pradesh	Varanasi	25.452129	82.861805
1617	GOI	Dabolim Airport	Asia	IN	India	Goa	Vasco da Gama	15.38080025	73.83139801
1618	VTZ	Visakhapatnam Airport	Asia	IN	India	Andhra Pradesh	Visakhapatnam	17.721201	83.224503
1619	WGC	Warangal Airport	Asia	IN	India	Telangana	Warangal	17.9144	79.602203
1620	ZER	Ziro Airport	Asia	IN	India	Arunachal Pradesh	Ziro	27.588301	93.828102
1621	ARD	Mali Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Alor Island	-8.132340431	124.5970001
1622	AXO	Pantar Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Alor Island	-8.24638	124.21971
1623	AHI	Amahai Airport	Asia	ID	Indonesia	Maluku	Amahai-Seram Island	-3.34800005	128.9259949
1624	AMQ	Pattimura Airport, Ambon	Asia	ID	Indonesia	Maluku	Ambon	-3.710259914	128.0890045
1625	RUF	Yuruf Airport	Asia	ID	Indonesia	Papua	Amgotro	-3.6333	140.958
1626	AGD	Anggi Airport	Asia	ID	Indonesia	West Papua	Anggi-Papua Island	-1.3858	133.8737
1627	AAS	Apalapsili Airport	Asia	ID	Indonesia	Papua	Apalapsili	-3.8832	139.3108
1628	EWE	Ewer Airport	Asia	ID	Indonesia	Papua	Asmat	-5.494	138.083
1629	AKQ	Gunung Batin Airport	Asia	ID	Indonesia	Lampung	Astraksetra-Sumatra Island	-4.611139774	105.2320023
1630	ABU	AA Bere Tallo (Haliwen) Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Atambua	-9.074841	124.903285
1631	TXM	Teminabuan Airport	Asia	ID	Indonesia	West Papua	Atinjoe-Papua Island	-1.44472003	132.0209961
1632	AYW	Ayawasi Airport	Asia	ID	Indonesia	West Papua	Ayawasi-Papua Island	-1.1593	132.4633
1633	RTI	David Constantijn Saudale Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Ba'a - Rote Island	-10.7673	123.0747
1634	BXB	Babo Airport	Asia	ID	Indonesia	West Papua	Babo-Papua Island	-2.532239914	133.4389954
1635	BXD	Bade Airport	Asia	ID	Indonesia	Papua	Bade	-7.175902	139.58333
1636	BJW	Bajawa Soa Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Bajawa	-8.70743498	121.0574269
1637	NAF	Banaina Airport	Asia	ID	Indonesia	North Kalimantan	Banaina-Borneo Island	2.723050117	117.1259995
1638	BTJ	Sultan Iskandar Muda International Airport	Asia	ID	Indonesia	Aceh	Banda Aceh	5.522872024	95.42063713
1639	NDA	Bandanaira Airport	Asia	ID	Indonesia	Maluku	Banda-Naira Island	-4.5214	129.9054
1640	TKG	Radin Inten II International Airport	Asia	ID	Indonesia	Lampung	Bandar Lampung-Sumatra Island	-5.240556	105.175556
1641	KNO	Kualanamu International Airport	Asia	ID	Indonesia	Sumatera Utara	Bandara Kuala Namu	3.64177	98.885307
1642	BDO	Husein Sastranegara International Airport	Asia	ID	Indonesia	Jawa Barat	Bandung-Java Island	-6.900629997	107.5759964
1643	BDJ	Syamsudin Noor Airport	Asia	ID	Indonesia	Kalimantan Selatan	Banjarmasin-Borneo Island	-3.44236	114.763
1644	BWX	Banyuwangi International Airport	Asia	ID	Indonesia	Jawa Timur	Banyuwangi	-8.31015	114.3401
1645	BTH	Hang Nadim International Airport	Asia	ID	Indonesia	Riau	Batam Island	1.121029973	104.1190033
1646	BXM	Batom Airport	Asia	ID	Indonesia	Papua	Batom-Papua Island	-4.442687	140.883565
1647	BTW	Batu Licin Airport	Asia	ID	Indonesia	Kalimantan Selatan	Batu Licin-Borneo Island	-3.412410021	115.9950027
1648	BUW	Betoambari Airport	Asia	ID	Indonesia	Sulawesi Tenggara	Bau Bau-Butung Island	-5.486879826	122.5690002
1649	BXW	Bawean - Harun Thohir Airport	Asia	ID	Indonesia	Jawa Timur	Bawean	-5.723628	112.678889
1650	SEQ	Sungai Pakning Bengkalis Airport	Asia	ID	Indonesia	Riau	Bengkalis-Sumatra Island	1.370000005	102.1399994
1651	BKS	Fatmawati Soekarno Airport	Asia	ID	Indonesia	Bengkulu	Bengkulu	-3.8637	102.338997
1652	PXA	Bentayan Airport	Asia	ID	Indonesia	Sumatra Selatan	Bentayan-Sumatra Island	-4.0225	103.379167
1653	KSR	Selayar - Haji Aroeppala Airport	Asia	ID	Indonesia	Sulawesi Selatan	Benteng	-6.17921	120.437479
1654	BIK	Frans Kaisiepo Airport	Asia	ID	Indonesia	Papua	Biak-Supiori Island	-1.190019965	136.1080017
1655	BMU	Muhammad Salahuddin Airport	Asia	ID	Indonesia	Nusa Tenggara Barat	Bima-Sumbawa Island	-8.539649963	118.6869965
1656	NTI	Stenkol Airport	Asia	ID	Indonesia	West Papua	Bintuni	-2.1033	133.5164
1657	KJX	Blang Pidie Airport	Asia	ID	Indonesia	Aceh	Blangpidie	3.735749	96.790109
1658	BJG	Boalang Airport	Asia	ID	Indonesia	Sulawesi Tengah	Boalang-Celebes Island	-0.9728959799	122.1449966
1659	BUI	Bokondini Airport	Asia	ID	Indonesia	Papua	Bokondini	-3.6822	138.6755
1660	BXT	Bontang Airport	Asia	ID	Indonesia	East Kalimantan	Bontang-Borneo Island	0.119691	117.474998
1661	LMU	Letung Airport	Asia	ID	Indonesia	Riau	Bukit Padi	2.964167	105.754444
1662	BYQ	Bunyu Airport	Asia	ID	Indonesia	North Kalimantan	Bunju Island	3.455719948	117.8669968
1663	UOL	Buol Airport	Asia	ID	Indonesia	Sulawesi Tengah	Buol-Celebes Island	1.1027	121.4141
1664	CJN	Nusawiru Airport	Asia	ID	Indonesia	Jawa Barat	Cijulang	-7.719895	108.488995
1665	CXP	Tunggul Wulung Airport	Asia	ID	Indonesia	Jawa Tengah	Cilacap-Java Island	-7.64506	109.033997
1666	CBN	Penggung Airport	Asia	ID	Indonesia	Jawa Barat	Cirebon-Java Island	-6.757	108.538849
1667	DRH	Dabra Airport	Asia	ID	Indonesia	Papua	Dabra-Papua Island	-3.2705	138.6132
1668	DTD	Datadawai Airport	Asia	ID	Indonesia	East Kalimantan	Datadawai-Borneo Island	0.8106	114.5306
1669	DEX	Nop Goliat Airport	Asia	ID	Indonesia	Papua	Dekai - Yahukimo	-4.8557	139.482006
1670	DPS	Ngurah Rai (Bali) International Airport	Asia	ID	Indonesia	Bali	Denpasar-Bali Island	-8.748169899	115.1669998
1671	DOB	Rar Gwamar Airport	Asia	ID	Indonesia	Maluku	Dobo-Warmar Island	-5.772220135	134.2120056
1672	DUM	Pinang Kampai Airport	Asia	ID	Indonesia	Riau	Dumai	1.609114	101.433492
1673	ELR	Elelim Airport	Asia	ID	Indonesia	Papua	Elelim-Papua Island	-3.7826	139.3861
1674	EWI	Enarotali Airport	Asia	ID	Indonesia	Papua	Enarotali-Papua Island	-3.925899982	136.3769989
1675	ENE	Ende (H Hasan Aroeboesman) Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Ende-Flores Island	-8.849289894	121.6610031
1676	FKQ	Fakfak Airport	Asia	ID	Indonesia	West Papua	Fakfak-Papua Island	-2.920190096	132.2669983
1677	GAV	Gag Island Airport	Asia	ID	Indonesia	West Papua	Gag Island	-0.4005559981	129.8950043
1678	GLX	Gamarmalamo Airport	Asia	ID	Indonesia	Maluku Utara	Galela-Celebes Island	1.83833003	127.7860031
1679	GEB	Gebe Airport	Asia	ID	Indonesia	Maluku Utara	Gebe Island	-0.07888899744	129.4579926
1680	GTO	Jalaluddin Airport	Asia	ID	Indonesia	Gorontalo	Gorontalo-Celebes Island	0.6371189952	122.8499985
1681	OTI	Pitu Airport	Asia	ID	Indonesia	Maluku Utara	Gotalalamo-Morotai Island	2.04599	128.324997
1682	GNS	Binaka Airport	Asia	ID	Indonesia	Sumatera Utara	Gunungsitoli	1.16628	97.704327
1683	ILA	Illaga Airport	Asia	ID	Indonesia	Papua	Illaga-Papua Island	-3.97648	137.6225
1684	IUL	Ilu Airport	Asia	ID	Indonesia	Papua	Ilu-Papua Island	-3.7051	138.2002
1685	INX	Inanwatan Airport	Asia	ID	Indonesia	West Papua	Inanwatan Airport-Papua Island	-2.128099918	132.1609955
1686	CGK	Soekarno-Hatta International Airport	Asia	ID	Indonesia	Banten	Jakarta	-6.12556982	106.6559982
1687	HLP	Halim Perdanakusuma International Airport	Asia	ID	Indonesia	Jakarta Raya	Jakarta	-6.266610146	106.8909988
1688	PCB	Pondok Cabe Air Base	Asia	ID	Indonesia	Jakarta Raya	Jakarta	-6.336959839	106.7649994
1689	PPJ	Pulau Panjang Airport	Asia	ID	Indonesia	Jawa Barat	Jakarta	-5.644444	106.5625
1690	DJB	Sultan Thaha Airport	Asia	ID	Indonesia	Jambi	Jambi-Sumatra Island	-1.63802	103.643997
1691	DJJ	Sentani International Airport	Asia	ID	Indonesia	Papua	Jayapura-Papua Island	-2.57695	140.516006
1692	JBB	Notohadinegoro Airport	Asia	ID	Indonesia	Jawa Timur	Jember	-8.238056	113.694439
1693	GYO	Blangkejeren Airport	Asia	ID	Indonesia	Aceh	Kabupaten Gayo Lues	3.94548	97.35968
1694	KNG	Kaimana Airport	Asia	ID	Indonesia	West Papua	Kaimana-Papua Island	-3.644520044	133.6959991
1695	KBX	Kambuaya Airport	Asia	ID	Indonesia	West Papua	Kambuaya-Papua Island	-1.316815	132.286987
1696	KCD	Kamur Airport	Asia	ID	Indonesia	Papua	Kamur-Papua Island	-6.1851	138.6372
1697	KAZ	Kao Airport	Asia	ID	Indonesia	Maluku Utara	Kao-Celebes Island	1.185279965	127.8960037
1698	MNA	Melangguane Airport	Asia	ID	Indonesia	Sulawesi Utara	Karakelong Island	4.00694	126.672997
1699	KWB	Dewadaru - Kemujan Island	Asia	ID	Indonesia	Jawa Tengah	Karimunjawa	-5.80091	110.47838
1700	KBF	Karubaga Airport	Asia	ID	Indonesia	Papua	Karubaga-Papua Island	-3.684	138.479
1701	KEQ	Kebar Airport	Asia	ID	Indonesia	West Papua	Kebar-Papua Island	-0.6371009946	133.128006
1702	KEA	Keisah Airport	Asia	ID	Indonesia	Papua	Keisah-Papua Island	-7.666669846	140.5
1703	LLN	Kelila Airport	Asia	ID	Indonesia	Papua	Kelila-Papua Island	-3.728565	138.710375
1704	KDI	Wolter Monginsidi Airport	Asia	ID	Indonesia	Sulawesi Tenggara	Kendari-Celebes Island	-4.081610203	122.4179993
1705	KEI	Kepi Airport	Asia	ID	Indonesia	Papua	Kepi-Papua Island	-6.5418	139.3318
1706	KJT	Kertajati International Airport	Asia	ID	Indonesia	Jawa Barat	Kertajati	-6.648924	108.166692
1707	KTG	Rahadi Osman Airport	Asia	ID	Indonesia	Kalimantan Barat	Ketapang	-1.81664	109.962997
1708	KMM	Kiman Airport	Asia	ID	Indonesia	Papua	Kiman-Papua Island	-3.666670084	136.1666718
1709	KOX	Kokonau Airport	Asia	ID	Indonesia	Papua	Kokonau-Papua Island	-4.71075	136.43515
1710	PUM	Pomala Airport	Asia	ID	Indonesia	Sulawesi Tenggara	Kolaka	-4.181089878	121.6179962
1711	FOO	Kornasoren Airfield	Asia	ID	Indonesia	Papua	Kornasoren-Numfoor Island	-0.936325	134.871994
1712	KOD	Kotabangun Airport	Asia	ID	Indonesia	East Kalimantan	Kotabangun-Borneo Island	-0.2666699886	116.5833359
1713	BPN	Sultan Aji Muhamad Sulaiman Airport	Asia	ID	Indonesia	East Kalimantan	Kotamadya Balikpapan	-1.268270016	116.8939972
1714	TFY	Muhammad Taufiq Kiemas Airport	Asia	ID	Indonesia	Lampung	Krui	-5.211562	103.936501
1715	MEQ	Cut Nyak Dhien Airport	Asia	ID	Indonesia	Aceh	Kuala Pesisir	4.040631	96.253538
1716	KOE	El Tari Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Kupang-Timor Island	-10.17160034	123.6709976
1717	LBJ	Komodo Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Labuan Bajo - Flores Island	-8.48666	119.889
1718	LAH	Oesman Sadik Airport	Asia	ID	Indonesia	Maluku Utara	Labuha-Halmahera Island	-0.635259	127.501999
1719	LUV	Karel Sadsuitubun Airport	Asia	ID	Indonesia	Maluku	Langgur	-5.760278	132.759444
1720	LKA	Gewayentana Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Larantuka-Flores Island	-8.274424	123.002
1721	LHI	Lereh Airport	Asia	ID	Indonesia	Papua	Lereh-Papua Island	-3.0795	139.952
1722	LWE	Lewoleba Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Lewoleba-Lembata Island	-8.3629	123.438
1723	LSW	Malikus Saleh Airport	Asia	ID	Indonesia	Aceh	Lhok Seumawe-Sumatra Island	5.226679802	96.95030212
1724	LSX	Lhok Sukon Airport	Asia	ID	Indonesia	Aceh	Lhok Sukon-Sumatra Island	5.069509983	97.25920105
1725	LPU	Long Apung Airport	Asia	ID	Indonesia	North Kalimantan	Long Apung-Borneo Island	1.704486	114.970297
1726	LBW	Long Bawan Airport	Asia	ID	Indonesia	North Kalimantan	Long Bawan-Borneo Island	3.9028	115.6921
1727	LLJ	Silampari Airport	Asia	ID	Indonesia	Sumatra Selatan	Lubuk Linggau	-3.288165	102.91449
2122	KUD	Kudat Airport	Asia	MY	Malaysia	Sabah	Kudat	6.924111	116.837068
1728	LYK	Lunyuk Airport	Asia	ID	Indonesia	Nusa Tenggara Barat	Lunyuk-Simbawa Island	-8.9889	117.2158
1729	LUW	Syukuran Aminuddin Amir Airport	Asia	ID	Indonesia	Sulawesi Tengah	Luwok	-1.035893	122.773934
1730	BJK	Nangasuri Airport	Asia	ID	Indonesia	Maluku	Maikoor Island	-6.06613	134.273971
1731	TTR	Pongtiku Airport	Asia	ID	Indonesia	Sulawesi Selatan	Makale	-3.04474	119.821999
1732	MLG	Abdul Rachman Saleh Airport	Asia	ID	Indonesia	Jawa Timur	Malang	-7.92656	112.714996
1733	MPT	Maliana airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Maliana-Alor Island	-8.167739868	125.0090027
1734	MJU	Tampa Padang Airport	Asia	ID	Indonesia	Sulawesi Selatan	Mamuju-Celebes Island	-2.590267	119.025364
1735	MDC	Sam Ratulangi Airport	Asia	ID	Indonesia	Sulawesi Utara	Manado	1.54926	124.926003
1736	MAL	Mangole Airport, Falabisahaya	Asia	ID	Indonesia	Maluku Utara	Mangole Island	-1.87579	125.8300018
1737	MKW	Rendani Airport	Asia	ID	Indonesia	West Papua	Manokwari-Papua Island	-0.891833	134.048996
1738	MSI	Masalembo Airport	Asia	ID	Indonesia	Jawa Timur	Masalembo Island	-5.583330154	114.4329987
1739	MXB	Andi Jemma Airport	Asia	ID	Indonesia	Sulawesi Selatan	Masamba-Celebes Island	-2.55803	120.323997
1740	MWK	Tarempa Airport	Asia	ID	Indonesia	Riau	Matak Island	3.34812	106.258003
1741	LOP	Lombok International Airport	Asia	ID	Indonesia	Nusa Tenggara Barat	Mataram	-8.757322	116.276675
1742	AMI	Selaparang Airport	Asia	ID	Indonesia	Nusa Tenggara Barat	Mataram-Lombok Island	-8.560709953	116.0950012
1743	RKO	Rokot Airport	Asia	ID	Indonesia	Sumatra Barat	Matobe	-2.100349	99.704319
1744	MOF	Maumere(Wai Oti) Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Maumere-Flores Island	-8.640649796	122.2369995
1745	MES	Soewondo Air Force Base	Asia	ID	Indonesia	Sumatera Utara	Medan	3.559167	98.671111
1746	GHS	Melalan Airport	Asia	ID	Indonesia	East Kalimantan	Melak-Borneo Island	-0.203611	115.760002
1747	MKQ	Mopah International Airport	Asia	ID	Indonesia	Papua	Merauke	-8.52029	140.417999
1748	RDE	Merdei Airport	Asia	ID	Indonesia	West Papua	Merdei-Papua Island	-1.583330035	133.3329926
1749	MDP	Mindiptana Airport	Asia	ID	Indonesia	Papua	Mindiptana-Papua Island	-5.75	140.3670044
1750	ONI	Moanamani Airport	Asia	ID	Indonesia	Papua	Moanamani-Papua Island	-3.983402014	136.0832977
1751	MOH	Maleo Airport	Asia	ID	Indonesia	Sulawesi Tengah	Morowali	-2.203333	121.660278
1752	BUU	Muara Bungo Airport	Asia	ID	Indonesia	Jambi	Muara Bungo	-1.1278	102.135
1753	HMS	Haji Muhammad Sidik Airport	Asia	ID	Indonesia	Central Kalimantan	Muara Teweh	-1.02581	114.92881
1754	MPC	Muko Muko Airport	Asia	ID	Indonesia	Jambi	Muko Muko	-2.54186	101.087997
1755	LII	Mulia Airport	Asia	ID	Indonesia	Papua	Mulia-Papua Island	-3.7018	137.957
1756	MUF	Muting Airport	Asia	ID	Indonesia	Papua	Muting	-7.3147	140.5668
1757	NBX	Nabire Airport	Asia	ID	Indonesia	Papua	Nabire-Papua Island	-3.36818	135.496002
1758	NAM	Namlea Airport	Asia	ID	Indonesia	Maluku	Namlea-Buru Island	-3.235569954	127.0999985
1759	NRE	Namrole Airport	Asia	ID	Indonesia	Maluku	Namrole-Buru Island	-3.8548	126.7012
1760	NPO	Nanga Pinoh Airport	Asia	ID	Indonesia	Kalimantan Barat	Nanga Pinoh-Borneo Island	-0.3488689959	111.7480011
1761	NNX	Nunukan Airport	Asia	ID	Indonesia	North Kalimantan	Nunukan-Nunukan Island	4.133333333	117.6666667
1762	OBD	Obano Airport	Asia	ID	Indonesia	Papua	Obano-Papua Island	-3.9106	136.2306
1763	OKQ	Okaba Airport	Asia	ID	Indonesia	Papua	Okaba-Papua Island	-8.0946	139.7233
1764	OKL	Oksibil Airport	Asia	ID	Indonesia	Papua	Oksibil-Papua Island	-4.9071	140.6277
1765	PDG	Minangkabau International Airport	Asia	ID	Indonesia	Sumatra Barat	Padang (Katapiang)	-0.786917	100.280998
1766	AEG	Aek Godang Airport	Asia	ID	Indonesia	Sumatera Utara	Padang Sidempuan	1.4001	99.430496
1767	PKY	Tjilik Riwut Airport	Asia	ID	Indonesia	Central Kalimantan	Palangkaraya-Kalimantan Tengah	-2.22513	113.943001
1768	PLM	Sultan Mahmud Badaruddin II Airport	Asia	ID	Indonesia	Sumatra Selatan	Palembang	-2.897653	104.698147
1769	LLO	Bua - Palopo Lagaligo Airport	Asia	ID	Indonesia	Sulawesi Selatan	Palopo	-3.082997	120.245018
1770	PLW	Mutiara - SIS Al-Jufrie Airport	Asia	ID	Indonesia	Sulawesi Tengah	Palu	-0.916462	119.908647
1771	PGK	Depati Amir Airport	Asia	ID	Indonesia	Bangka Belitung	Pangkal Pinang	-2.1622	106.139
1772	PKN	Iskandar Airport	Asia	ID	Indonesia	Central Kalimantan	Pangkalanbun-Borneo Island	-2.7052	111.672997
1773	SIW	Sibisa Airport	Asia	ID	Indonesia	Sumatera Utara	Parapat-Sumatra Island	2.666666985	98.93333435
1774	PPR	Pasir Pangaraan Airport	Asia	ID	Indonesia	Riau	Pasir Pengarayan-Sumatra Island	0.8454310298	100.3700027
1775	SIQ	Dabo Airport	Asia	ID	Indonesia	Riau	Pasirkuning-Singkep Island	-0.4791890085	104.5790024
1776	PKU	Sultan Syarif Kasim Ii (Simpang Tiga) Airport	Asia	ID	Indonesia	Riau	Pekanbaru-Sumatra Island	0.4607860148	101.4449997
1777	PGQ	Buli Airport	Asia	ID	Indonesia	Maluku	Pekaulang	0.9194	128.3825
1778	PNK	Supadio Airport	Asia	ID	Indonesia	Kalimantan Barat	Pontianak-Borneo Island	-0.150711	109.4039993
1779	PSJ	Kasiguncu Airport	Asia	ID	Indonesia	Sulawesi Tengah	Poso-Celebes Island	-1.41675	120.657997
1780	PWL	Jenderal Besar Soedirman Airport	Asia	ID	Indonesia	Jawa Tengah	Purwokerto-Java Island	-7.461342	109.414612
1781	PSU	Pangsuma Airport	Asia	ID	Indonesia	Kalimantan Barat	Putussibau-Borneo Island	0.8355780244	112.9369965
1782	RAQ	Sugimanuru Airport	Asia	ID	Indonesia	Sulawesi Tenggara	Raha-Muna Island	-4.760557	122.569371
1783	NTX	Ranai Airport	Asia	ID	Indonesia	Riau	Ranai-Natuna Besar Island	3.90871	108.388
1784	RSK	Abresso Airport	Asia	ID	Indonesia	West Papua	Ransiki-Papua Island	-1.496771	134.175
1785	RGT	Japura Airport	Asia	ID	Indonesia	Riau	Rengat-Sumatra Island	-0.352808	102.334999
1786	RKI	Rokot Airport	Asia	ID	Indonesia	Sumatra Barat	Rokot-Sumatra Island	-0.9499999881	100.75
1787	SBG	Maimun Saleh Airport	Asia	ID	Indonesia	Aceh	Sabang	5.874668	95.33967
1788	SAU	Sabu-Tardanu Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Sabu-Sawu Island	-10.4924	121.8482
1789	AAP	Aji Pangeran Tumenggung Pranoto International Airport	Asia	ID	Indonesia	East Kalimantan	Samarinda	-0.374478	117.250128
1790	SMQ	Sampit(Hasan) Airport	Asia	ID	Indonesia	Central Kalimantan	Sampit-Borneo Island	-2.501389	112.975555
1791	SQN	Emalamo Sanana Airport	Asia	ID	Indonesia	Maluku Utara	Sanana-Seram Island	-2.080509901	125.9670029
1792	SGQ	Sanggata/Sangkimah Airport	Asia	ID	Indonesia	East Kalimantan	Sanggata/Sangkimah	0.3847	117.543
1793	SAE	Sangir Airport	Asia	ID	Indonesia	Nusa Tenggara Barat	Sangir-Simbawa Island	-8.366669655	118.3333588
1794	TTE	Sultan Babullah Airport	Asia	ID	Indonesia	Maluku Utara	Sango-Ternate Island	0.831414	127.380997
1795	TSX	Tanjung Santan Airport	Asia	ID	Indonesia	East Kalimantan	Santan-Borneo Island	-0.0929730013	117.4530029
1796	ZRM	Sarmi Airport	Asia	ID	Indonesia	Papua	Sarmi-Papua Island	-1.86954999	138.75
1797	RTG	Frans Sales Lega Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Satar Tacik-Flores Island	-8.597009659	120.4769974
1798	SXK	Mathilda Batlayeri Airport	Asia	ID	Indonesia	Maluku	Saumlaki-Yamdena Island	-7.848354	131.337068
1799	SRG	Achmad Yani Airport	Asia	ID	Indonesia	Jawa Tengah	Semarang-Java Island	-6.970732	110.373244
1800	SEH	Senggeh Airport	Asia	ID	Indonesia	Papua	Senggeh	-3.45	140.779
1801	ZEG	Senggo Airport	Asia	ID	Indonesia	Papua	Senggo-Papua Island	-5.6908	139.3502
1802	WBA	Wahai,Seram Island	Asia	ID	Indonesia	Maluku	Seram Island	-2.8114	129.484
1803	ZRI	Serui Airport	Asia	ID	Indonesia	Papua	Serui-Japen Island	-1.875579953	136.2409973
1804	KLP	Seruyan Kuala Pembuang Airport	Asia	ID	Indonesia	Central Kalimantan	Seruyan	-3.376062	112.536521
1805	FLZ	Dr. Ferdinand Lumban Tobing Airport	Asia	ID	Indonesia	Sumatera Utara	Sibolga (Pinangsori)	1.557127	98.887145
1806	DTB	Silangit Airport	Asia	ID	Indonesia	Sumatera Utara	Siborong-Borong	2.25973	98.991898
1807	NKD	Sinak Airport	Asia	ID	Indonesia	Papua	Sinak	-3.822	137.8406
1808	SQG	Sintang(Susilo) Airport	Asia	ID	Indonesia	Kalimantan Barat	Sintang-Borneo Island	0.0636190027	111.4729996
1809	SQR	Soroako Airport	Asia	ID	Indonesia	Sulawesi Selatan	Soroako-Celebes Island	-2.531199932	121.3580017
1810	SOQ	Domine Eduard Osok Airport	Asia	ID	Indonesia	West Papua	Sorong-Papua Island	-0.894	131.287
1811	KBU	Gusti Syamsir Alam Airport	Asia	ID	Indonesia	Kalimantan Selatan	Stagen - Laut Island	-3.29472	116.165001
1812	UGU	Bilogai-Sugapa Airport	Asia	ID	Indonesia	Papua	Sugapa-Papua Island	-3.73956	137.031998
1813	SOC	Adisumarmo International Airport	Asia	ID	Indonesia	Jawa Tengah	Sukarata(Solo)-Java Island	-7.513564	110.750494
1814	SWQ	Sumbawa Besar Airport	Asia	ID	Indonesia	Nusa Tenggara Barat	Sumbawa Island	-8.489040375	117.4120026
1815	SUP	Trunojoyo Airport	Asia	ID	Indonesia	Jawa Timur	Sumenep-Madura Island	-7.0242	113.89023
1816	KRC	Departi Parbo Airport	Asia	ID	Indonesia	Jambi	Sungai Penuh	-2.093	101.4683
1817	SUB	Juanda International Airport	Asia	ID	Indonesia	Jawa Timur	Surabaya	-7.379829884	112.7870026
1818	WAR	Waris Airport	Asia	ID	Indonesia	Papua	Swach	-3.235	140.994
1819	NAH	Naha Airport	Asia	ID	Indonesia	Sulawesi Utara	Tahuna-Sangihe Island	3.683209896	125.5279999
1820	TXE	Rembele Airport	Asia	ID	Indonesia	Aceh	Takengon	4.72113	96.851943
1821	PDO	Pendopo Airport	Asia	ID	Indonesia	Sumatra Selatan	Talang Gudang-Sumatra Island	-3.286070108	103.8799973
1822	TNB	Tanah Grogot Airport	Asia	ID	Indonesia	East Kalimantan	Tanah Grogot-Borneo Island	-1.910130024	116.2020035
1823	TMH	Tanah Merah Airport	Asia	ID	Indonesia	Papua	Tanah Merah-Papua Island	-6.099219799	140.2980042
1824	TJB	Sei Bati Airport	Asia	ID	Indonesia	Riau	Tanjung Balai-Karinmunbesar Island	1.0527	103.3931
1825	TJQ	H A S Hanandjoeddin International Airport	Asia	ID	Indonesia	Bangka Belitung	Tanjung Pandan	-2.74572	107.754997
1826	TNJ	Raja Haji Fisabilillah International Airport	Asia	ID	Indonesia	Riau	Tanjung Pinang-Bintan Island	0.9226830006	104.5319977
1827	BEJ	Kalimarau Airport	Asia	ID	Indonesia	East Kalimantan	Tanjung Redeb - Borneo Island	2.1555	117.431999
1828	TJS	Tanjung Harapan Airport	Asia	ID	Indonesia	North Kalimantan	Tanjung Selor-Borneo Island	2.835833333	117.3736111
1829	TJG	Warukin Airport	Asia	ID	Indonesia	Kalimantan Selatan	Tanta-Tabalong-Borneo Island	-2.216559887	115.435997
1830	TPK	Teuku Cut Ali Airport	Asia	ID	Indonesia	Aceh	Tapaktuan	3.16904	97.288299
1831	TRK	Juwata Airport	Asia	ID	Indonesia	North Kalimantan	Tarakan Island	3.326667	117.569444
1832	TSY	Cibeureum Airport	Asia	ID	Indonesia	Jawa Barat	Tasikmalaya-Java Island	-7.3466	108.246002
1833	JIO	Jos Orno Imsula Airport	Asia	ID	Indonesia	Maluku	Tiakur	-8.13911	127.9075
1834	TAX	Taliabu Island Airport	Asia	ID	Indonesia	Maluku Utara	Tikong-Taliabu Island	-1.642629981	124.5589981
1835	TIM	Mozes Kilangin Airport	Asia	ID	Indonesia	Papua	Timika-Papua Island	-4.52828	136.886993
1836	TMY	Tiom Airport	Asia	ID	Indonesia	Papua	Tiom-Papua Island	-3.9256	138.4555
1837	CPF	Ngloram Airport	Asia	ID	Indonesia	Jawa Tengah	Tjepu-Java Island	-7.194841667	111.5481667
1838	TLI	Sultan Bantilan Airport	Asia	ID	Indonesia	Sulawesi Tengah	Toli Toli-Celebes Island	1.123428	120.793658
1839	TRT	Toraja Airport	Asia	ID	Indonesia	Sumatra Selatan	Toraja	-3.185833	119.91775
1840	TBM	Tumbang Samba Airport	Asia	ID	Indonesia	Central Kalimantan	Tumbang Samba-Borneo Island	-1.4694	113.0833
1841	UBR	Ubrub Airport	Asia	ID	Indonesia	Papua	Ubrub-Papua Island	-3.67565	140.8838
1842	UPG	Hasanuddin International Airport	Asia	ID	Indonesia	Sulawesi Selatan	Ujung Pandang-Celebes Island	-5.061629772	119.5540009
1843	WET	Wagethe Airport	Asia	ID	Indonesia	Papua	Wagethe-Papua Island	-4.044229984	136.2779999
1844	TQQ	Maranggo Airport	Asia	ID	Indonesia	Sulawesi Tenggara	Waha-Tomea Island	-5.764570236	123.9169998
1845	TMC	Tambolaka Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Waikabubak-Sumba Island	-9.40972	119.244003
1846	WGP	Umbu Mehang Kunda Airport	Asia	ID	Indonesia	Nusa Tenggara Timur	Waingapu-Sumba Island	-9.66922	120.302002
1847	RJM	Marinda Airport	Asia	ID	Indonesia	West Papua	Waisai	-0.423056	130.773333
1848	WMX	Wamena Airport	Asia	ID	Indonesia	Papua	Wamena, Jayawijaya Regency, Papua Province	-4.10251	138.957001
1849	WNI	Matahora Airport	Asia	ID	Indonesia	Sulawesi Tenggara	Wangi-wangi Island	-5.293996	123.634
1850	WSR	Wasior Airport	Asia	ID	Indonesia	West Papua	Wasior-Papua Island	-2.721	134.5061
1851	YIA	Yogyakarta International Airport	Asia	ID	Indonesia	Yogyakarta	Yogyakarta	-7.905338	110.057264
1852	JOG	Adisutjipto International Airport	Asia	ID	Indonesia	Yogyakarta	Yogyakarta-Java Island	-7.78818	110.431999
1853	ABD	Abadan Airport	Asia	IR	Iran	Khuzestan Province	Abadan	30.367887	48.230075
1854	AEU	Abu Musa Island Airport	Asia	IR	Iran	Hormozgan Province	Abu Musa	25.8757	55.033001
1855	AKW	Aghajari Airport	Asia	IR	Iran	Khuzestan Province	Aghajari	30.7444	49.6772
1856	AWZ	Lieutenant General Qasem Soleimani International Airport	Asia	IR	Iran	Khuzestan Province	Ahvaz	31.3374	48.762001
1857	BSM	Bishe Kola Air Base	Asia	IR	Iran	Mazandaran Province	Amol	36.65510178	52.34960175
1858	AJK	Arak Airport	Asia	IR	Iran	Markazi Province	Araak	34.13809967	49.84730148
1859	ADU	Ardabil Airport	Asia	IR	Iran	Ardabil Province	Ardabil	38.32569885	48.42440033
1860	PGU	Persian Gulf International Airport	Asia	IR	Iran	Bushehr Province	Asalouyeh	27.379601	52.737701
1861	BXR	Bam Airport	Asia	IR	Iran	Kerman Province	Bam	29.0842	58.450001
1862	BND	Bandar Abbas International Airport	Asia	IR	Iran	Hormozgan Province	Bandar Abbas	27.21829987	56.37779999
1863	HDR	Havadarya Airport	Asia	IR	Iran	Hormozgan Province	Bandar Abbas	27.1583	56.172501
1864	BDH	Bandar Lengeh International Airport	Asia	IR	Iran	Hormozgan Province	Bandar Lengeh	26.532283	54.82484
1865	JSK	Jask Airport	Asia	IR	Iran	Hormozgan Province	Bandar-e-Jask	25.653601	57.799301
1866	XBJ	Birjand International Airport	Asia	IR	Iran	South Khorasan Province	Birjand	32.896525	59.281258
1867	BJB	Bojnord Airport	Asia	IR	Iran	North Khorasan Province	Bojnord	37.49300003	57.30820084
1868	BUZ	Bushehr Airport	Asia	IR	Iran	Bushehr Province	Bushehr	28.94479942	50.83459854
1869	ZBR	Konarak Airport	Asia	IR	Iran	Sistan and Baluchestan Province	Chabahar	25.44330025	60.38209915
1870	GSM	Qeshm International Airport	Asia	IR	Iran	Hormozgan Province	Dayrestan	26.754639	55.902353
1871	DEF	Dezful Airport	Asia	IR	Iran	Khuzestan Province	Dezful	32.434399	48.397598
1872	FAZ	Fasa Airport	Asia	IR	Iran	Fars Province	Fasa	28.89179993	53.72330093
1873	GCH	Gachsaran Airport	Asia	IR	Iran	Kohgiluyeh and Boyer-Ahmad Province	Gachsaran	30.33760071	50.82799912
1874	GBT	Gorgan Airport	Asia	IR	Iran	Golestan Province	Gorgan	36.90940094	54.40129852
1875	HDM	Hamadan Airport	Asia	IR	Iran	Hamadan Province	Hamadan	34.869202	48.552502
1876	IFH	Hesa Airport	Asia	IR	Iran	Esfahan Province	Hesa	32.92890167	51.56110001
1877	IIL	Ilam Airport	Asia	IR	Iran	Iiam Province	Ilam	33.58660126	46.40480042
1878	IAQ	Bahregan Airport	Asia	IR	Iran	Bushehr Province	Imam Hassan	29.840099	50.272701
1879	IHR	Iranshahr Airport	Asia	IR	Iran	Sistan and Baluchestan Province	Iranshahr	27.236099	60.720001
1880	IFN	Esfahan Shahid Beheshti International Airport	Asia	IR	Iran	Esfahan Province	Isfahan	32.75080109	51.86130142
1881	JAR	Jahrom Airport	Asia	IR	Iran	Fars Province	Jahrom	28.58670044	53.57910156
1882	JYR	Jiroft Airport	Asia	IR	Iran	Kerman Province	Jiroft	28.723519	57.675037
1883	KLM	Kalaleh Airport	Asia	IR	Iran	Golestan Province	Kalaleh	37.38330078	55.45199966
1884	KNR	Jam Airport	Asia	IR	Iran	Bushehr Province	Kangan	27.82049942	52.35219955
1885	PYK	Payam International Airport	Asia	IR	Iran	Alborz Province	Karaj	35.7761	50.826698
1886	KKS	Kashan Airport	Asia	IR	Iran	Esfahan Province	Kashan	33.895302	51.577
1887	KER	Ayatollah Hashemi Rafsanjani International Airport	Asia	IR	Iran	Kerman Province	Kerman	30.274401	56.951099
1888	KSH	Shahid Ashrafi Esfahani Airport	Asia	IR	Iran	Kermanshah Province	Kermanshah	34.34590149	47.15810013
1889	KHA	Khaneh Airport	Asia	IR	Iran	West Azerbaijan Province	Khaneh	36.73334122	45.15000153
1890	KHK	Khark Island Airport	Asia	IR	Iran	Bushehr Province	Khark	29.2603	50.323898
1891	KHD	Khoram Abad Airport	Asia	IR	Iran	Lorestan Province	Khoram Abad	33.4353981	48.28290176
1892	KHY	Khoy Airport	Asia	IR	Iran	West Azerbaijan Province	Khoy	38.42750168	44.97359848
1893	KIH	Kish International Airport	Asia	IR	Iran	Hormozgan Province	Kish Island	26.52619934	53.98020172
1894	LFM	Lamerd Airport	Asia	IR	Iran	Fars Province	Lamerd	27.3727	53.188801
1895	LRR	Lar Airport	Asia	IR	Iran	Fars Province	Lar	27.6747	54.383301
1896	LVP	Lavan Island Airport	Asia	IR	Iran	Hormozgan Province	Lavan Island	26.81030083	53.35630035
1897	MRX	Mahshahr Airport	Asia	IR	Iran	Khuzestan Province	Mahshahr	30.5562	49.151901
1898	ACP	Sahand Airport	Asia	IR	Iran	East Azerbaijan Province	Maragheh	37.34799957	46.12789917
1899	MHD	Mashhad International Airport	Asia	IR	Iran	Razavi Khorasan Province	Mashhad	36.23519897	59.64099884
1900	QMJ	Shahid Asiyaee Airport	Asia	IR	Iran	Khuzestan Province	Masjed Soleyman	32.001719	49.268599
1901	NSH	Nowshahr Airport	Asia	IR	Iran	Mazandaran Province	Nowshahr	36.664286	51.46273
1902	OMI	Omidiyeh Airport	Asia	IR	Iran	Khuzestan Province	Omidiyeh	30.83519936	49.53490067
1903	PFQ	Parsabad-Moghan Airport	Asia	IR	Iran	Ardabil Province	Parsabad	39.6036	47.8815
1904	GZW	Qazvin Airport	Asia	IR	Iran	Qazvin Province	Qazvin	36.240101	50.0471
1905	RJN	Rafsanjan Airport	Asia	IR	Iran	Kerman Province	Rafsanjan	30.298345	56.048979
1906	RZR	Ramsar Airport	Asia	IR	Iran	Mazandaran Province	Ramsar	36.90701	50.687316
1907	RAS	Sardar-e-Jangal Airport	Asia	IR	Iran	Gilan Province	Rasht	37.323333	49.617778
1908	AFZ	Sabzevar National Airport	Asia	IR	Iran	Razavi Khorasan Province	Sabzevar	36.16809845	57.59519958
1909	SDG	Sanandaj Airport	Asia	IR	Iran	Kurdistan Province	Sanandaj	35.2458992	47.00920105
1910	CKT	Sarakhs Airport	Asia	IR	Iran	Razavi Khorasan Province	Sarakhs	36.50120163	61.06489944
1911	SRY	Sari Dasht-e Naz International Airport	Asia	IR	Iran	Mazandaran Province	Sari	36.644408	53.188761
1912	SNX	Semnan Municipal Airport	Asia	IR	Iran	Semnan Province	Semnan	35.591099	53.495098
1913	CQD	Shahrekord Airport	Asia	IR	Iran	Chaharmahal and Bakhtiari Province	Shahrekord	32.29719925	50.84220123
1914	RUD	Shahroud Airport	Asia	IR	Iran	Semnan Province	Shahroud	36.4253006	55.10419846
1915	SYZ	Shiraz Shahid Dastghaib International Airport	Asia	IR	Iran	Fars Province	Shiraz	29.5392	52.589802
1916	IMQ	Maku National Airport	Asia	IR	Iran	West Azerbaijan Province	Showt	39.330002	44.43
1917	SXI	Siri Airport	Asia	IR	Iran	Hormozgan Province	Siri	25.908899	54.539398
1918	SYJ	Sirjan Airport	Asia	IR	Iran	Kerman Province	Sirjan	29.5509	55.672699
1919	TCX	Tabas Airport	Asia	IR	Iran	Yazd Province	Tabas	33.6678009	56.8927002
1920	TBZ	Tabriz International Airport	Asia	IR	Iran	East Azerbaijan Province	Tabriz	38.1339	46.235001
1921	IKA	Imam Khomeini International Airport	Asia	IR	Iran	Tehran Province	Tehran	35.41609955	51.15219879
1922	THR	Mehrabad International Airport	Asia	IR	Iran	Tehran Province	Tehran	35.68920135	51.31340027
1923	OMH	Urmia Airport	Asia	IR	Iran	West Azerbaijan Province	Urmia	37.66809845	45.06869888
1924	YES	Yasouj Airport	Asia	IR	Iran	Kohgiluyeh and Boyer-Ahmad Province	Yasouj	30.70050049	51.54510117
1925	AZD	Shahid Sadooghi Airport	Asia	IR	Iran	Yazd Province	Yazd	31.9048996	54.2765007
1926	ACZ	Zabol Airport	Asia	IR	Iran	Sistan and Baluchestan Province	Zabol	31.098301	61.5439
1927	ZAH	Zahedan International Airport	Asia	IR	Iran	Sistan and Baluchestan Province	Zahedan	29.47570038	60.90620041
1928	JWN	Zanjan Airport	Asia	IR	Iran	Zanjan Province	Zanjan	36.77370071	48.3594017
1929	TQD	Al Taqaddum Air Base	Asia	IQ	Iraq	Al-Anbar Governorate	Al Habbaniyah	33.33810043	43.5970993
1930	EBL	Erbil International Airport	Asia	IQ	Iraq	Arbil Governorate	Arbil	36.23759842	43.96319962
1931	BGW	Baghdad International Airport / New Al Muthana Air Base	Asia	IQ	Iraq	Baghdad Governorate	Baghdad	33.262501	44.2346
1932	BMN	Bamarni Airport	Asia	IQ	Iraq	Duhok Governorate	Bamarni	37.09880066	43.26660156
1933	BSR	Basra International Airport	Asia	IQ	Iraq	Basra Governorate	Basra	30.549101	47.662102
1934	IQA	Al Asad Air Base	Asia	IQ	Iraq	Al-Anbar Governorate	H??t	33.78559875	42.44120026
1935	KIK	Kirkuk Air Base	Asia	IQ	Iraq	Kirkuk Governorate	Kirkuk	35.4695015	44.34889984
1936	OSM	Mosul International Airport	Asia	IQ	Iraq	Ninawa Governorate	Mosul	36.305801	43.1474
1937	NJF	Al Najaf International Airport	Asia	IQ	Iraq	Najaf Governorate	Najaf	31.989853	44.404317
1938	XNH	Ali Air Base	Asia	IQ	Iraq	Dhi Qar Governorate	Nasiriyah	30.935801	46.090099
1939	RQW	Qayyarah West Airport	Asia	IQ	Iraq	Ninawa Governorate	Qayyarah	35.76720047	43.12509918
1940	ISU	Sulaymaniyah International Airport	Asia	IQ	Iraq	As-Sulaymaniyyah Governorate	Sulaymaniyah	35.5617485	45.31673813
1941	BEV	Beersheba (Teyman) Airport	Asia	IL	Israel	Southern District	Beersheba	31.28700066	34.72299957
1942	VTM	Nevatim Air Base	Asia	IL	Israel	Southern District	Beersheba	31.20829964	35.01229858
1943	MIP	Ramon Air Base	Asia	IL	Israel	Southern District	Beersheba	30.77610016	34.66669846
1944	VDA	Ovda Airport	Asia	IL	Israel	Southern District	Eilat	29.9403	34.935799
1945	ETM	Ramon International Airport	Asia	IL	Israel	Southern District	Eilat	29.727009	35.014116
1946	HFA	Haifa International Airport	Asia	IL	Israel	Haifa District	Haifa	32.80939865	35.04309845
1947	KSW	Kiryat Shmona Airport	Asia	IL	Israel	Northern District	Kiryat Shmona	33.21670151	35.59999847
1948	MTZ	Bar Yehuda Airfield	Asia	IL	Israel	Southern District	Masada	31.32819939	35.3885994
1949	RPN	Rosh Pina Airport	Asia	IL	Israel	Northern District	Rosh Pina	32.980999	35.571899
1950	EIY	Ein Yahav Airfield	Asia	IL	Israel	Southern District	Sapir	30.62170029	35.20330048
1951	TLV	Ben Gurion International Airport	Asia	IL	Israel	Central District	Tel Aviv	32.01139832	34.88669968
1952	YOT	Yotvata Airfield	Asia	IL	Israel	Southern District	Yotvata	29.901111	35.0675
1953	AGJ	Aguni Airport	Asia	JP	Japan	Okinawa Prefecture	Aguni	26.592755	127.240335
1954	AXT	Akita Airport	Asia	JP	Japan	Akita Prefecture	Akita	39.61560059	140.2189941
1955	TKN	Tokunoshima Airport	Asia	JP	Japan	Kagoshima Prefecture	Amagi	27.836399	128.880997
1956	AXJ	Amakusa Airport	Asia	JP	Japan	Kumamoto Prefecture	Amakusa	32.482498	130.158997
1957	ASJ	Amami Airport	Asia	JP	Japan	Kagoshima Prefecture	Amami	28.43059921	129.7129974
1958	AOJ	Aomori Airport	Asia	JP	Japan	Aomori Prefecture	Aomori	40.73469925	140.6909943
1959	AKJ	Asahikawa Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Asahikawa	43.670799	142.447006
1960	NJA	JMSDF Atsugi Air Base / Naval Air Facility Atsugi	Asia	JP	Japan	Kanagawa Prefecture	Ayase / Yamato	35.454601	139.449997
1961	FKJ	Fukui Airport	Asia	JP	Japan	Fukui Prefecture	Fukui	36.14279938	136.223999
1962	FUK	Fukuoka Airport	Asia	JP	Japan	Fukuoka Prefecture	Fukuoka	33.58589935	130.451004
1963	OKO	Yokota Air Base	Asia	JP	Japan	T??ky?? Prefecture	Fussa	35.74850082	139.3480072
1964	QGU	Gifu Airport	Asia	JP	Japan	Gifu Prefecture	Gifu	35.39410019	136.8699951
1965	FUJ	Fukue Airport	Asia	JP	Japan	Nagasaki Prefecture	Goto	32.66630173	128.8329926
1966	HAC	Hachijojima Airport	Asia	JP	Japan	T??ky?? Prefecture	Hachijojima	33.11500168	139.7859955
1967	HHE	JMSDF Hachinohe Air Base / Hachinohe Airport	Asia	JP	Japan	Aomori Prefecture	Hachinohe	40.551181	141.465428
1968	HKD	Hakodate Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Hakodate	41.77	140.822006
1969	HNA	Morioka Hanamaki Airport	Asia	JP	Japan	Iwate Prefecture	Hanamaki	39.4286	141.134995
1970	GAJ	Yamagata Airport	Asia	JP	Japan	Yamagata Prefecture	Higashine	38.4119	140.371002
1971	HIJ	Hiroshima Airport	Asia	JP	Japan	Hiroshima Prefecture	Hiroshima	34.4361	132.919006
1972	IEJ	Iejima Airport	Asia	JP	Japan	Okinawa Prefecture	Ie	26.722537	127.786801
1973	IKI	Iki Airport	Asia	JP	Japan	Nagasaki Prefecture	Iki	33.74900055	129.7850037
1974	ISG	New Ishigaki Airport	Asia	JP	Japan	Okinawa Prefecture	Ishigaki	24.396389	124.245
1975	IWK	Iwakuni Kintaikyo Airport / Marine Corps Air Station Iwakuni	Asia	JP	Japan	Yamaguchi Prefecture	Iwakuni	34.146333	132.247238
1976	OIM	Oshima Airport	Asia	JP	Japan	T??ky?? Prefecture	Izu Oshima	34.7820015	139.3600006
1977	IZO	Izumo Enmusubi Airport	Asia	JP	Japan	Shimane Prefecture	Izumo	35.413601	132.889999
1978	DNA	Kadena Air Base	Asia	JP	Japan	Okinawa Prefecture	Kadena	26.351667	127.769444
1979	KOJ	Kagoshima Airport	Asia	JP	Japan	Kagoshima Prefecture	Kagoshima	31.80340004	130.7189941
1980	KMQ	Komatsu Airport / JASDF Komatsu Air Base	Asia	JP	Japan	Ishikawa Prefecture	Kanazawa	36.3946	136.406998
1981	KKX	Kikai Airport	Asia	JP	Japan	Kagoshima Prefecture	Kikai	28.32130051	129.9279938
1982	ONJ	Odate Noshiro Airport	Asia	JP	Japan	Akita Prefecture	Kitaakita	40.191898	140.371002
1983	KTD	Kitadaito Airport	Asia	JP	Japan	Okinawa Prefecture	Kitadait??jima	25.94470024	131.3269959
1984	KKJ	Kitakyushu Airport	Asia	JP	Japan	Fukuoka Prefecture	Kitakyushu	33.845901	131.035004
1985	UKB	Kobe Airport	Asia	JP	Japan	Hy??go Prefecture	Kobe	34.63280106	135.223999
1986	KMJ	Kumamoto Airport	Asia	JP	Japan	Kumamoto Prefecture	Kumamoto	32.83729935	130.8549957
1987	UEO	Kumejima Airport	Asia	JP	Japan	Okinawa Prefecture	Kumejima	26.363445	126.71384
1988	KUH	Kushiro Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Kushiro	43.04100037	144.1929932
1989	FSZ	Mount Fuji Shizuoka Airport	Asia	JP	Japan	Shizuoka Prefecture	Makinohara / Shimada	34.796043	138.187752
1990	IWJ	Iwami Airport	Asia	JP	Japan	Shimane Prefecture	Masuda	34.67639923	131.7899933
1991	MMJ	Shinshu-Matsumoto Airport	Asia	JP	Japan	Nagano Prefecture	Matsumoto	36.166801	137.923004
1992	MYJ	Matsuyama Airport	Asia	JP	Japan	Ehime Prefecture	Matsuyama	33.82720184	132.6999969
1993	MMD	Minamidaito Airport	Asia	JP	Japan	Okinawa Prefecture	Minamidaito	25.8465	131.263
1994	MSJ	Misawa Air Base / Misawa Airport	Asia	JP	Japan	Aomori Prefecture	Misawa	40.703201	141.367996
1995	MYE	Miyakejima Airport	Asia	JP	Japan	T??ky?? Prefecture	Miyakejima	34.07360077	139.5599976
1996	MMY	Miyako Airport	Asia	JP	Japan	Okinawa Prefecture	Miyako City	24.78280067	125.2949982
1997	SHI	Miyako Shimojishima Airport	Asia	JP	Japan	Okinawa Prefecture	Miyakojima	24.8267	125.144997
1998	KMI	Miyazaki Airport	Asia	JP	Japan	Miyazaki Prefecture	Miyazaki	31.87719917	131.4490051
1999	MBE	Monbetsu Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Monbetsu	44.30390167	143.404007
2000	OMJ	JMSDF Omura Air Base	Asia	JP	Japan	Nagasaki Prefecture	Nagasaki	32.928046	129.934168
2001	NGS	Nagasaki Airport	Asia	JP	Japan	Nagasaki Prefecture	Nagasaki	32.91690063	129.9140015
2002	NKM	Nagoya Airport / JASDF Komaki Air Base	Asia	JP	Japan	Aichi Prefecture	Nagoya	35.255759	136.924095
2003	OKA	Naha Airport / JASDF Naha Air Base	Asia	JP	Japan	Okinawa Prefecture	Naha	26.195801	127.646004
2004	SHB	Nakashibetsu Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Nakashibetsu	43.57749939	144.9600067
2005	KCZ	Kochi Ryoma Airport	Asia	JP	Japan	K??chi Prefecture	Nankoku	33.546101	133.669006
2006	SDJ	Sendai Airport	Asia	JP	Japan	Miyagi Prefecture	Natori	38.139702	140.917007
2007	KIJ	Niigata Airport	Asia	JP	Japan	Niigata Prefecture	Niigata	37.95589828	139.1210022
2008	OBO	Tokachi-Obihiro Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Obihiro	42.73329926	143.2169952
2009	IWO	Ioto (Iwo Jima) Air Base	Asia	JP	Japan	T??ky?? Prefecture	Ogasawara	24.784153	141.32261
2010	MUS	JMSDF Minami Torishima Air Base	Asia	JP	Japan	T??ky?? Prefecture	Ogasawara	24.2897	153.979004
2011	OIT	Oita Airport	Asia	JP	Japan	??ita Prefecture	Oita	33.47940063	131.7369995
2012	OKJ	Okayama Momotaro Airport	Asia	JP	Japan	Okayama Prefecture	Okayama	34.756901	133.854996
2013	OKI	Oki Global Geopark Airport	Asia	JP	Japan	Shimane Prefecture	Okinoshima	36.178388	133.323566
2014	OIR	Okushiri Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Okushiri Island	42.07170105	139.4329987
2015	IBR	Ibaraki Airport / JASDF Hyakuri Air Base	Asia	JP	Japan	Ibaraki Prefecture	Omitama	36.181099	140.414993
2016	KIX	Kansai International Airport	Asia	JP	Japan	??saka Prefecture	Osaka	34.427299	135.244003
2017	ITM	Osaka International Airport	Asia	JP	Japan	??saka Prefecture	Osaka	34.78549957	135.4380035
2018	MMB	Memanbetsu Airport	Asia	JP	Japan	Hokkaid?? Prefecture	??zora	43.88059998	144.1640015
2019	RBJ	Rebun Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Rebun	45.45500183	141.0390015
2020	RIS	Rishiri Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Rishiri	45.24200058	141.1860046
2021	SDS	Sado Airport	Asia	JP	Japan	Niigata Prefecture	Sado	38.06019974	138.4140015
2022	HSG	Saga Airport	Asia	JP	Japan	Saga Prefecture	Saga	33.14970016	130.302002
2023	CTS	New Chitose Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Sapporo	42.7752	141.692001
2024	OKD	Sapporo Okadama Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Sapporo	43.117447	141.38134
2025	SHM	Nanki Shirahama Airport	Asia	JP	Japan	Wakayama Prefecture	Shirahama	33.66220093	135.3639984
2026	SYO	Shonai Airport	Asia	JP	Japan	Yamagata Prefecture	Shonai	38.812199	139.787003
2027	FKS	Fukushima Airport	Asia	JP	Japan	Fukushima Prefecture	Sukagawa	37.22740173	140.4309998
2028	TAK	Takamatsu Airport	Asia	JP	Japan	Kagawa Prefecture	Takamatsu	34.21419907	134.0160065
2029	HTR	Hateruma Airport	Asia	JP	Japan	Okinawa Prefecture	Taketomi	24.059751	123.80558
2030	TNE	New Tanegashima Airport	Asia	JP	Japan	Kagoshima Prefecture	Tanegashima	30.60510063	130.9909973
2031	TRA	Tarama Airport	Asia	JP	Japan	Okinawa Prefecture	Tarama	24.65390015	124.6750031
2032	NGO	Chubu Centrair International Airport	Asia	JP	Japan	Aichi Prefecture	Tokoname	34.85839844	136.8049927
2033	TKS	Tokushima Awaodori Airport / JMSDF Tokushima Air Base	Asia	JP	Japan	Tokushima Prefecture	Tokushima	34.132801	134.606995
2034	NRT	Narita International Airport	Asia	JP	Japan	Chiba Prefecture	Tokyo	35.764702	140.386002
2035	HND	Tokyo Haneda International Airport	Asia	JP	Japan	T??ky?? Prefecture	Tokyo	35.552299	139.779999
2036	TTJ	Tottori Sand Dunes Conan Airport	Asia	JP	Japan	Tottori Prefecture	Tottori	35.530102	134.167007
2037	TOY	Toyama Airport	Asia	JP	Japan	Toyama Prefecture	Toyama	36.64830017	137.1880035
2038	TJH	Konotori Tajima Airport	Asia	JP	Japan	Hy??go Prefecture	Toyooka	35.512798	134.787003
2039	TSJ	Tsushima Airport	Asia	JP	Japan	Nagasaki Prefecture	Tsushima	34.28490067	129.3309937
2040	UBJ	Yamaguchi Ube Airport	Asia	JP	Japan	Yamaguchi Prefecture	Ube	33.93000031	131.279007
2041	OKE	Okinoerabu Airport	Asia	JP	Japan	Kagoshima Prefecture	Wadomari	27.425501	128.701004
2042	NTQ	Noto Satoyama Airport	Asia	JP	Japan	Ishikawa Prefecture	Wajima	37.293098	136.962006
2043	WKJ	Wakkanai Airport	Asia	JP	Japan	Hokkaid?? Prefecture	Wakkanai	45.40420151	141.8009949
2044	KUM	Yakushima Airport	Asia	JP	Japan	Kagoshima Prefecture	Yakushima	30.38559914	130.6589966
2045	YGJ	Yonago Kitaro Airport / JASDF Miho Air Base	Asia	JP	Japan	Tottori Prefecture	Yonago	35.492199	133.235992
2046	OGN	Yonaguni Airport	Asia	JP	Japan	Okinawa Prefecture	Yonaguni	24.467298	122.979827
2047	RNJ	Yoron Airport	Asia	JP	Japan	Kagoshima Prefecture	Yoron	27.044001	128.401993
2048	KJP	Kerama Airport	Asia	JP	Japan	Okinawa Prefecture	Zamami	26.168337	127.293423
2049	ADJ	Amman Civil (Marka International) Airport	Asia	JO	Jordan	Amman Governorate	Amman	31.9727	35.9916
2050	AMM	Queen Alia International Airport	Asia	JO	Jordan	Amman Governorate	Amman	31.72260094	35.99319839
2051	AQJ	Aqaba King Hussein International Airport	Asia	JO	Jordan	Al 'Aqaba Governorate	Aqaba	29.61160088	35.01810074
2052	OMF	King Hussein Air College	Asia	JO	Jordan	Al Mafraq Governorate	Mafraq	32.3564	36.259201
2053	SCO	Aktau Airport	Asia	KZ	Kazakhstan	Mangystau Region	Aktau	43.860093	51.09086
2054	AKX	Aktobe Airport	Asia	KZ	Kazakhstan	Aktobe Region	Aktobe	50.2458	57.206699
2055	ALA	Almaty International Airport	Asia	KZ	Kazakhstan	Almaty Region	Almaty	43.3521	77.040497
2056	AYK	Arkalyk North Airport	Asia	KZ	Kazakhstan	Kostanay Region	Arkalyk	50.3185997	66.95279694
2057	ATX	Atbasar Airport	Asia	KZ	Kazakhstan	Akmola Region	Atbasar	51.852306	68.366892
2058	BXY	Krainiy Airport	Asia	KZ	Kazakhstan	Baikonur City	Baikonur	45.621994	63.210773
2059	BXH	Balkhash Airport	Asia	KZ	Kazakhstan	Karaganda Region	Balkhash	46.8932991	75.00499725
2060	BXJ	Boralday Airport	Asia	KZ	Kazakhstan	Almaty Region	Boralday	43.352052	76.883039
2061	EKB	Ekibastuz Airport	Asia	KZ	Kazakhstan	Pavlodar Region	Ekibastuz	51.5909996	75.21499634
2062	HSA	Hazrat Sultan International Airport	Asia	KZ	Kazakhstan	South Kazakhstan Region	Hazrat Sultan International	43.313126	68.549881
2063	KGF	Sary-Arka Airport	Asia	KZ	Kazakhstan	Karaganda Region	Karaganda	49.670799	73.334396
2064	KOV	Kokshetau Airport	Asia	KZ	Kazakhstan	Akmola Region	Kokshetau	53.329102	69.594597
2065	KSN	Kostanay West Airport	Asia	KZ	Kazakhstan	Kostanay Region	Kostanay	53.20690155	63.5503006
2066	KZO	Kyzylorda Airport	Asia	KZ	Kazakhstan	Kyzylorda Region	Kyzylorda	44.706902	65.592499
2067	NQZ	Nursultan Nazarbayev International Airport	Asia	KZ	Kazakhstan	Akmola Region	Nur-Sultan	51.022202	71.466904
2068	PWQ	Pavlodar Airport	Asia	KZ	Kazakhstan	Pavlodar Region	Pavlodar	52.19499969	77.07389832
2069	PPK	Petropavl Airport	Asia	KZ	Kazakhstan	North Kazakhstan Region	Petropavl	54.774702	69.183273
2070	PLX	Semipalatinsk Airport	Asia	KZ	Kazakhstan	East Kazakhstan Region	Semey	50.351295	80.234398
2071	CIT	Shymkent Airport	Asia	KZ	Kazakhstan	South Kazakhstan Region	Shymkent	42.36420059	69.47889709
2072	TDK	Taldykorgan Airport	Asia	KZ	Kazakhstan	Almaty Region	Taldykorgan	45.12255	78.442758
2073	DMB	Taraz Airport	Asia	KZ	Kazakhstan	Jambyl Region	Taraz	42.85359955	71.3035965
2074	URA	Uralsk Airport	Asia	KZ	Kazakhstan	West Kazakhstan Region	Uralsk	51.1507988	51.54309845
2075	UZR	Urzhar Airport	Asia	KZ	Kazakhstan	East Kazakhstan Region	Urzhar	47.09115	81.66521
2076	USJ	Usharal Airport	Asia	KZ	Kazakhstan	Almaty Region	Usharal	46.190767	80.830922
2077	UKK	Ust-Kamenogorsk Airport	Asia	KZ	Kazakhstan	East Kazakhstan Region	Ust-Kamenogorsk (Oskemen)	50.036571	82.493477
2078	SZI	Zaysan Airport	Asia	KZ	Kazakhstan	East Kazakhstan Region	Zaysan	47.487491	84.887675
2079	HRC	Sary Su Airport	Asia	KZ	Kazakhstan	Karaganda Region	Zhayrem	48.3974	70.1915
2080	DZN	Zhezkazgan Airport	Asia	KZ	Kazakhstan	Karaganda Region	Zhezkazgan	47.708302	67.733299
2081	XIJ	Ahmed Al Jaber Air Base	Asia	KW	Kuwait	Al Ahmadi Governorate	Ahmed Al Jaber AB	28.93479919	47.79190063
2082	KWI	Kuwait International Airport	Asia	KW	Kuwait	Al Farwaniyah Governorate	Kuwait City	29.22660065	47.96889877
2083	FRU	Manas International Airport	Asia	KG	Kyrgyzstan	Chuy Region	Bishkek	43.06129837	74.4776001
2084	OSS	Osh Airport	Asia	KG	Kyrgyzstan	Osh Region	Osh	40.60900116	72.79329681
2085	IKU	Issyk-Kul International Airport	Asia	KG	Kyrgyzstan	Issyk Kul Region	Tamchy	42.585584	76.701181
2086	AOU	Attopeu Airport	Asia	LA	Laos	Attapu Province	Attopeu	14.793056	107.045278
2087	HOE	Ban Huoeisay Airport	Asia	LA	Laos	Bokeo Province	Huay Xai	20.25729942	100.4369965
2088	LXG	Luang Namtha Airport	Asia	LA	Laos	Louang Namtha Province	Luang Namtha	20.966999	101.400002
2089	LPQ	Luang Phabang International Airport	Asia	LA	Laos	Louangphabang Province	Luang Phabang	19.89730072	102.1610031
2090	ODY	Oudomsay Airport	Asia	LA	Laos	Oudomxai Province	Oudomsay	20.6826992	101.9940033
2091	PKZ	Pakse International Airport	Asia	LA	Laos	Champasak Province	Pakse	15.13210011	105.7809982
2092	PCQ	Boun Neau Airport	Asia	LA	Laos	Phongsali Province	Phongsaly	21.6475	101.9
2093	ZBY	Sayaboury Airport	Asia	LA	Laos	Xaignabouli Province	Sainyabuli	19.2436	101.7093
2094	NEU	Sam Neua Airport	Asia	LA	Laos	Houaphan Province	Sam Neua	20.41839981	104.0670013
2095	VNA	Saravane Airport	Asia	LA	Laos	Salavan Province	Saravane	15.70943921	106.4106989
2096	ZVK	Savannakhet Airport	Asia	LA	Laos	Savannakhet Province	Savannakhet	16.55660057	104.7600021
2097	THK	Thakhek Airport	Asia	LA	Laos	Khammouan Province	Thakhek	17.39999962	104.8000031
2098	VTE	Wattay International Airport	Asia	LA	Laos	Vientiane Prefecture	Vientiane	17.98830032	102.5630035
2099	XKH	Xieng Khouang Airport	Asia	LA	Laos	Xiangkhoang Province	Xieng Khouang	19.450001	103.157997
2100	XIE	Xienglom Airport	Asia	LA	Laos	Bokeo Province	Xienglom	19.6203	100.815332
2101	BEY	Beirut Rafic Hariri International Airport	Asia	LB	Lebanon	Mount Lebanon Governorate	Beirut	33.82089996	35.48839951
2102	KYE	Rene Mouawad Air Base / Kleyate Airport	Asia	LB	Lebanon	North Governorate	Tripoli	34.589298	36.011299
2103	MFM	Macau International Airport	Asia	MO	Macau	Freguesia de Nossa Senhora do Carmo (Taipa)	Freguesia de Nossa Senhora do Carmo (Taipa)	22.149599	113.592003
2104	AOR	Sultan Abdul Halim Airport	Asia	MY	Malaysia	Kedah	Alor Satar	6.189670086	100.3980026
2105	BKM	Bakalalan Airport	Asia	MY	Malaysia	Sarawak	Bakalalan	3.973999977	115.6179962
2106	BBN	Bario Airport	Asia	MY	Malaysia	Sarawak	Bario	3.733890057	115.4789963
2107	BLG	Belaga Airport	Asia	MY	Malaysia	Sarawak	Belaga	2.650000095	113.7669983
2108	BTU	Bintulu Airport	Asia	MY	Malaysia	Sarawak	Bintulu	3.123850107	113.0199966
2109	BWH	RMAF Butterworth Air Base	Asia	MY	Malaysia	Pulau Pinang	Butterworth	5.46592	100.390999
2110	IPH	Sultan Azlan Shah Airport	Asia	MY	Malaysia	Perak	Ipoh	4.567969799	101.0920029
2111	JHB	Senai International Airport	Asia	MY	Malaysia	Johor	Johor Bahru	1.64131	103.669998
2112	TOD	Pulau Tioman Airport	Asia	MY	Malaysia	Pahang	Kampung Tekek	2.81818	104.160004
2113	KPI	Kapit Airport	Asia	MY	Malaysia	Sarawak	Kapit	2.010523745	112.9314682
2114	KGU	Keningau Airport	Asia	MY	Malaysia	Sabah	Keningau	5.357490063	116.1620026
2115	KTE	Kerteh Airport	Asia	MY	Malaysia	Terengganu	Kerteh	4.537220001	103.427002
2116	KBR	Sultan Ismail Petra Airport	Asia	MY	Malaysia	Kelantan	Kota Baharu	6.16685009	102.2929993
2117	BKI	Kota Kinabalu International Airport	Asia	MY	Malaysia	Sabah	Kota Kinabalu	5.937210083	116.0510025
2118	KUL	Kuala Lumpur International Airport	Asia	MY	Malaysia	Wilayah Persekutuan Kuala Lumpur	Kuala Lumpur	2.745579958	101.7099991
2119	TGG	Sultan Mahmud Airport	Asia	MY	Malaysia	Terengganu	Kuala Terengganu	5.382639885	103.1029968
2120	KUA	Kuantan Airport	Asia	MY	Malaysia	Pahang	Kuantan	3.77538991	103.2089996
2121	KCH	Kuching International Airport	Asia	MY	Malaysia	Sarawak	Kuching	1.484699965	110.3470001
2123	LBU	Labuan Airport	Asia	MY	Malaysia	Wilayah Persekutuan Labuan	Labuan	5.300680161	115.25
2124	LDU	Lahad Datu Airport	Asia	MY	Malaysia	Sabah	Lahad Datu	5.032249928	118.3239975
2125	LGK	Langkawi International Airport	Asia	MY	Malaysia	Kedah	Langkawi	6.329730034	99.72869873
2126	LWY	Lawas Airport	Asia	MY	Malaysia	Sarawak	Lawas	4.84917	115.407997
2127	LMN	Limbang Airport	Asia	MY	Malaysia	Sarawak	Limbang	4.808300018	115.0100021
2128	LKH	Long Akah Airport	Asia	MY	Malaysia	Sarawak	Long Akah	3.299999952	114.7829971
2129	LBP	Long Banga Airport	Asia	MY	Malaysia	Sarawak	Long Banga	3.202	115.4018
2130	LGL	Long Lellang Airport	Asia	MY	Malaysia	Sarawak	Long Datih	3.421000004	115.1539993
2131	LLM	Long Lama Airport	Asia	MY	Malaysia	Sarawak	Long Lama	3.766669989	114.4666672
2132	GSA	Long Pasia Airport	Asia	MY	Malaysia	Sabah	Long Miau	4.400000095	115.7170029
2133	LSM	Long Semado Airport	Asia	MY	Malaysia	Sarawak	Long Semado	4.217000008	115.5999985
2134	ODN	Long Seridan Airport	Asia	MY	Malaysia	Sarawak	Long Seridan	3.967000008	115.0500031
2135	LSU	Long Sukang Airport	Asia	MY	Malaysia	Sarawak	Long Sukang	4.552219868	115.4940033
2136	MKZ	Malacca Airport	Asia	MY	Malaysia	Melaka	Malacca	2.263360024	102.2519989
2137	MUR	Marudi Airport	Asia	MY	Malaysia	Sarawak	Marudi	4.178979874	114.3290024
2138	MEP	Mersing Airport	Asia	MY	Malaysia	Johor	Mersing	2.389148	103.874183
2139	MYY	Miri Airport	Asia	MY	Malaysia	Sarawak	Miri	4.32201004	113.9869995
2140	MZS	Mostyn Airport	Asia	MY	Malaysia	Sabah	Mostyn	4.616666794	118.1500015
2141	MKM	Mukah Airport	Asia	MY	Malaysia	Sarawak	Mukah	2.881944	112.043333
2142	MZV	Mulu Airport	Asia	MY	Malaysia	Sarawak	Mulu	4.04832983	114.8050003
2143	PAY	Pamol Airport	Asia	MY	Malaysia	Sabah	Pamol	5.999300003	117.3999176
2144	PKG	Pulau Pangkor Airport	Asia	MY	Malaysia	Perak	Pangkor Island	4.244719982	100.5530014
2145	PEN	Penang International Airport	Asia	MY	Malaysia	Pulau Pinang	Penang	5.297140121	100.2770004
2146	RNU	Ranau Airport	Asia	MY	Malaysia	Sabah	Ranau	5.949999809	116.6669998
2147	RDN	LTS Pulau Redang Airport	Asia	MY	Malaysia	Terengganu	Redang	5.764804	103.004942
2148	SXS	Sahabat [Sahabat 16] Airport	Asia	MY	Malaysia	Sabah	Sahabat	5.087779999	119.0940018
2149	SDK	Sandakan Airport	Asia	MY	Malaysia	Sabah	Sandakan	5.900899887	118.0589981
2150	BSE	Sematan Airport	Asia	MY	Malaysia	Sarawak	Sematan	1.813609958	109.7630005
2151	SMM	Semporna Airport	Asia	MY	Malaysia	Sabah	Semporna	4.449999809	118.5830002
2152	SPE	Sepulot Airport	Asia	MY	Malaysia	Sabah	Sepulot	4.732999802	116.4670029
2153	SBW	Sibu Airport	Asia	MY	Malaysia	Sarawak	Sibu	2.261600018	111.9850006
2154	SPT	Sipitang Airport	Asia	MY	Malaysia	Sabah	Sipitang	5.083333015	115.5500031
2155	SWY	Sitiawan Airport	Asia	MY	Malaysia	Perak	Sitiawan	4.2222	100.6993
2156	LAC	Layang-Layang Airport	Asia	MY	Malaysia	Sabah	Spratley Islands	7.37157011	113.8440018
2157	SZB	Sultan Abdul Aziz Shah International Airport	Asia	MY	Malaysia	Selangor	Subang	3.130579948	101.5490036
2158	GTK	Sungai Tekai Airport	Asia	MY	Malaysia	Johor	Sungai Tekai	2.64118	102.89297
2159	TPG	Taiping (Tekah) Airport	Asia	MY	Malaysia	Perak	Taiping	4.866432	100.715381
2160	SXT	Sungai Tiang Airport	Asia	MY	Malaysia	Pahang	Taman Negara	4.33027792	102.3949966
2161	TGC	Tanjung Manis Airport	Asia	MY	Malaysia	Sarawak	Tanjung Manis	2.177839994	111.2020035
2162	TWU	Tawau Airport	Asia	MY	Malaysia	Sabah	Tawau	4.320159912	118.1279984
2163	TEL	Telupid Airport	Asia	MY	Malaysia	Sabah	Telupid	5.628610134	117.1259995
2164	TMG	Tomanggong Airport	Asia	MY	Malaysia	Sabah	Tomanggong	5.40257	118.65763
2165	DRV	Dharavandhoo Airport	Asia	MV	Maldives	Baa	Baa Atoll	5.1561	73.1302
2166	FND	Funadhoo Airport	Asia	MV	Maldives	Shaviyani	Funadhoo	6.162443	73.28752
2167	FVM	Fuvahmulah Airport	Asia	MV	Maldives	Gnaviyani	Fuvahmulah Island	-0.3097222222	73.435
2168	GAN	Gan International Airport	Asia	MV	Maldives	Seenu Atoll	Gan	-0.693342	73.155602
2169	HAQ	Hanimaadhoo Airport	Asia	MV	Maldives	Haa Dhaalu Atoll	Haa Dhaalu Atoll	6.744229794	73.17050171
2170	GKK	Kooddoo Airport	Asia	MV	Maldives	Gaaf Alif	Huvadhu Atoll	0.7324	73.4336
2171	KDM	Kaadedhdhoo Airport	Asia	MV	Maldives	Gaafu Dhaalu Atoll	Huvadhu Atoll	0.4881309867	72.99690247
2172	IFU	Ifuru Airport	Asia	MV	Maldives	Raa	Ifuru Island	5.7083	73.025
2173	KDO	Kadhdhoo Airport	Asia	MV	Maldives	Laamu Atoll	Kadhdhoo	1.85916996	73.52189636
2174	DDD	Dhaalu Atoll Airport	Asia	MV	Maldives	Dhaalu	Kudahuvadhoo	2.666075	72.887118
2175	HDK	Kulhudhuffushi Airport	Asia	MV	Maldives	Haa Dhaalu Atoll	Kulhudhuffushi	6.630762	73.067815
2176	VAM	Villa Airport	Asia	MV	Maldives	Raa	Maamigili	3.470555556	72.83583333
2177	RUL	Maavaarulaa Airport	Asia	MV	Maldives	Gaafu Dhaalu Atoll	Maavaarulu	0.338085	73.512869
2178	MLE	Mal?? International Airport	Asia	MV	Maldives	Mal?? Capital	Mal??	4.191830158	73.52909851
2179	LMV	Madivaru Airport	Asia	MV	Maldives	Lhaviyani	Naifaru	5.457545	73.370261
2180	NMF	Maafaru International Airport	Asia	MV	Maldives	Noonu	Noonu Atoll	5.818394	73.469181
2181	TMF	Thimarafushi Airport	Asia	MV	Maldives	Thaa	Thimarafushi	2.211	73.1533
2182	LTI	Altai Airport	Asia	MN	Mongolia	Govi-Altay	Altai	46.37639999	96.22109985
2183	AVK	Arvaikheer Airport	Asia	MN	Mongolia	??v??rkhangai	Arvaikheer	46.25030136	102.802002
2184	UUN	Baruun Urt Airport	Asia	MN	Mongolia	Shbaatar	Baruun Urt	46.66030121	113.2850037
2185	BYN	Bayankhongor Airport	Asia	MN	Mongolia	Bayanhongor	Bayankhongor	46.16329956	100.7040024
2186	UGA	Bulgan Airport	Asia	MN	Mongolia	Bulgan	Bulgan	48.85499954	103.4759979
2187	HBU	Bulgan Sum Airport	Asia	MN	Mongolia	Khovd	Bulgan	46.100601	91.584198
2188	COQ	Choibalsan Airport	Asia	MN	Mongolia	Dornod	Choibalsan	48.13570023	114.6460037
2189	DLZ	Dalanzadgad Airport	Asia	MN	Mongolia	??mn??govi	Dalanzadgad	43.608628	104.367734
2190	ERT	Erdenet Airport	Asia	MN	Mongolia	Orhon	Erdenet	48.98305556	104.1505556
2191	HTM	Khatgal Airport	Asia	MN	Mongolia	Kh??vsg??l	Hatgal	50.435988	100.139532
2192	KHR	Kharkhorin Airport	Asia	MN	Mongolia	??v??rkhangai	Kharkhorin	47.246667	102.826111
2193	HVD	Khovd Airport	Asia	MN	Mongolia	Khovd	Khovd	47.95410156	91.62819672
2194	HJT	Khujirt Airport	Asia	MN	Mongolia	??v??rkhangai	Khujirt	46.92580032	102.7730026
2195	MXW	Mandalgobi Airport	Asia	MN	Mongolia	DundgovL	Mandalgobi	45.73809814	106.2689972
2196	MXV	M??r??n Airport	Asia	MN	Mongolia	Kh??vsg??l	M??r??n	49.66329956	100.098999
2197	ULG	??lgii Mongolei Airport	Asia	MN	Mongolia	Bayan-Olgiy	??lgii	48.993301	89.922501
2198	UNR	??nd??rkhaan Airport	Asia	MN	Mongolia	Hentiy	??nd??rkhaan	47.30486	110.6092
2199	TNZ	Tosontsengel Airport	Asia	MN	Mongolia	Dzavhan	Tosontsengel	48.73887	98.2941
2200	TSZ	Tsetserleg Airport	Asia	MN	Mongolia	Arhangay	Tsetserleg	47.461476	101.483804
2201	ULN	Buyant-Ukhaa International Airport	Asia	MN	Mongolia	Ulanbaatar	Ulaanbaatar	47.843102	106.766998
2202	UBN	Ulaanbaatar Chinggis Khaan International Airport	Asia	MN	Mongolia	Tov	Ulaanbaatar (Sergelen)	47.646916	106.819833
2203	ULO	Ulaangom Airport	Asia	MN	Mongolia	Uvs	Ulaangom	50.066588	91.938273
2204	ULZ	Donoi Airport	Asia	MN	Mongolia	Dzavhan	Uliastai	47.7093	96.5258
2205	UGT	Bulagtai Resort Airport	Asia	MN	Mongolia	??mn??govi	Umnugobitour	43.74930418	104.1149855
2206	BGL	Baglung Airport	Asia	NP	Nepal	Dhawalagiri	Baglung	28.21279907	83.66629791
2207	BIT	Baitadi Airport	Asia	NP	Nepal	Mahakali	Baitadi	29.46529961	80.54920197
2208	BJH	Bajhang Airport	Asia	NP	Nepal	Seti	Bajhang	29.53899956	81.18540192
2209	BJU	Bajura Airport	Asia	NP	Nepal	Seti	Bajura	29.50200081	81.66899872
2210	BDP	Bhadrapur Airport	Asia	NP	Nepal	Mechi	Bhadrapur	26.57080078	88.07959747
2211	BHR	Bharatpur Airport	Asia	NP	Nepal	Narayani	Bharatpur	27.678101	84.429398
2212	BHP	Bhojpur Airport	Asia	NP	Nepal	Kosi	Bhojpur	27.1473999	87.05079651
2213	BIR	Biratnagar Airport	Asia	NP	Nepal	Kosi	Biratnagar	26.48150063	87.26399994
2214	DNP	Tulsipur Airport	Asia	NP	Nepal	Rapti	Dang	28.11109924	82.29419708
2215	DAP	Darchula Airport	Asia	NP	Nepal	Mahakali	Darchula	29.6692009	80.54840088
2216	DHI	Dhangarhi Airport	Asia	NP	Nepal	Bheri	Dhangarhi	28.75329971	80.58190155
2217	DOP	Dolpa Airport	Asia	NP	Nepal	Karnali	Dolpa	28.98570061	82.81909943
2218	GKH	Palungtar Airport	Asia	NP	Nepal	Gandaki	Gorkha	28.0385	84.4664
2219	JKR	Janakpur Airport	Asia	NP	Nepal	Janakpur	Janakpur	26.70879936	85.92240143
2220	JIR	Jiri Airport	Asia	NP	Nepal	Janakpur	Jiri	27.626313	86.230581
2221	JMO	Jomsom Airport	Asia	NP	Nepal	Dhawalagiri	Jomsom	28.780426	83.723
2222	JUM	Jumla Airport	Asia	NP	Nepal	Karnali	Jumla	29.2742	82.193298
2223	KTM	Tribhuvan International Airport	Asia	NP	Nepal	Bagmati	Kathmandu	27.6966	85.3591
2224	LDN	Lamidanda Airport	Asia	NP	Nepal	Sagarmatha	Lamidanda	27.25309944	86.66999817
2225	LTG	Langtang Airport	Asia	NP	Nepal	Bagmati	Langtang	28.20000076	85.58300018
2226	LUA	Lukla Airport	Asia	NP	Nepal	Sagarmatha	Lukla	27.68689919	86.72969818
2227	XMG	Mahendranagar Airport	Asia	NP	Nepal	Mahakali	Mahendranagar	28.96319962	80.14790344
2228	MEY	Meghauli Airport	Asia	NP	Nepal	Narayani	Meghauli	27.5774	84.22875
2229	SYH	Syangboche Airport	Asia	NP	Nepal	Sagarmatha	Namche Bazaar	27.8112	86.7124
2230	KEP	Nepalgunj Airport	Asia	NP	Nepal	Bheri	Nepalgunj	28.10359955	81.66699982
2231	NGX	Manang Airport	Asia	NP	Nepal	Gandaki	Ngawal	28.641399	84.089203
2232	PPL	Phaplu Airport	Asia	NP	Nepal	Sagarmatha	Phaplu	27.517787	86.584454
2233	PKR	Pokhara Airport	Asia	NP	Nepal	Gandaki	Pokhara	28.20089912	83.98210144
2234	RJB	Rajbiraj Airport	Asia	NP	Nepal	Sagarmatha	Rajbiraj	26.510066	86.733902
2235	RHP	Ramechhap Airport	Asia	NP	Nepal	Janakpur	Ramechhap	27.3939991	86.06140137
2236	RPA	Rolpa Airport	Asia	NP	Nepal	Rapti	Rolpa	28.267292	82.756496
2237	RUK	Rukum Chaurjahari Airport	Asia	NP	Nepal	Rapti	Rukumkot	28.627001	82.194021
2238	RUM	Rumjatar Airport	Asia	NP	Nepal	Sagarmatha	Rumjatar	27.30349922	86.55039978
2239	FEB	Sanfebagar Airport	Asia	NP	Nepal	Seti	Sanfebagar	29.236629	81.215317
2240	BWA	Gautam Buddha International Airport	Asia	NP	Nepal	Lumbini	Siddharthanagar (Bhairahawa)	27.505328	83.412594
2241	SIH	Silgadi Doti Airport	Asia	NP	Nepal	Seti	Silgadi Doti	29.26309967	80.93599701
2242	SIF	Simara Airport	Asia	NP	Nepal	Narayani	Simara	27.159803	84.980021
2243	IMK	Simikot Airport	Asia	NP	Nepal	Karnali	Simikot	29.97109985	81.81890106
2244	SKH	Surkhet Airport	Asia	NP	Nepal	Bheri	Surkhet	28.586	81.636002
2245	TPJ	Taplejung Airport	Asia	NP	Nepal	Mechi	Taplejung	27.3509	87.69525
2246	TPU	Tikapur Airport	Asia	NP	Nepal	Seti	Tikapur	28.5219	81.123
2247	TMI	Tumling Tar Airport	Asia	NP	Nepal	Kosi	Tumling Tar	27.315001	87.193298
2248	RGO	Orang (Chongjin) Airport	Asia	KP	North Korea	North Hamgyong Province	Hoemun-ri	41.428538	129.647555
2249	FNJ	Pyongyang Sunan International Airport	Asia	KP	North Korea	Pyongyang (capital city)	Pyongyang	39.224098	125.669998
2250	YJS	Samjiy??n Airport	Asia	KP	North Korea	Ryanggang Province	Samjiy??n	41.907132	128.409834
2251	DSO	Sondok Airport	Asia	KP	North Korea	South Hamgyong Province	S??nd??ng-ni	39.745201	127.473999
2252	WOS	Wonsan Kalma International Airport	Asia	KP	North Korea	Kangwon Province	Wonsan	39.166801	127.486
2253	AOM	Adam Airport	Asia	OM	Oman	Ad Dakhillyah Governorate	Adam	22.49194444	57.38388889
2254	MNH	Mussanah Airport	Asia	OM	Oman	Al Batinah Governorate	Al Masna'ah	23.640556	57.4875
2255	BJQ	Bahja Airport	Asia	OM	Oman	Al Wusta Governorate	Bahja	19.87305556	56.06777778
2256	RMB	Buraimi Airport	Asia	OM	Oman	Al Buraimi Governorate	Buraimi	24.241626	55.783674
2257	BYB	Dibba Airport	Asia	OM	Oman	Musandam Governorate	Dibba al Baya	25.614229	56.2444
2258	DQM	Duqm International Airport	Asia	OM	Oman	Al Wusta Governorate	Duqm	19.501944	57.634167
2259	JNJ	Ja'Aluni Airport	Asia	OM	Oman	Al Wusta Governorate	Duqm	19.4749	57.3083
2260	FAU	Fahud Airport	Asia	OM	Oman	Az Zahirah Governorate	Fahud	22.35475932	56.48414612
2261	RNM	Qarn Alam Airport	Asia	OM	Oman	Al Wusta Governorate	Ghaba	21.38299942	57.04999924
2262	KHS	Khasab Airport	Asia	OM	Oman	Musandam Governorate	Khasab	26.171	56.240601
2263	LKW	Lekhwair Airport	Asia	OM	Oman	Az Zahirah Governorate	Lekhwair	22.804866	55.372801
2264	OMM	Marmul Airport	Asia	OM	Oman	Dhofar Governorate	Marmul	18.13599968	55.18209839
2265	MSH	RAFO Masirah	Asia	OM	Oman	Ash Sharqlyah Governorate	Masirah	20.6754	58.890499
2266	UKH	Mukhaizna Airport	Asia	OM	Oman	Al Wusta Governorate	Mukhaizna Oil Field	19.386389	56.401389
2267	MCT	Muscat International Airport	Asia	OM	Oman	Masqat Governorate	Muscat	23.59329987	58.28440094
2268	SLL	Salalah Airport	Asia	OM	Oman	Dhofar Governorate	Salalah	17.0387001	54.09130096
2269	OHS	Sohar Airport	Asia	OM	Oman	Al Batinah Governorate	Sohar	24.38604	56.62541
2270	TTH	Thumrait Air Base	Asia	OM	Oman	Dhofar Governorate	Thumrait	17.66600037	54.02460098
2271	BDN	Talhar Airport	Asia	PK	Pakistan	Sindh	Badin	24.84149933	68.83840179
2272	WGB	Bahawalnagar Airport	Asia	PK	Pakistan	Punjab	Bahawalnagar	29.94630051	73.24909973
2273	BHV	Bahawalpur Airport	Asia	PK	Pakistan	Punjab	Bahawalpur	29.34810066	71.71800232
2274	BNP	Bannu Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Bannu	32.9729	70.527901
2275	BHW	Bhagatanwala Airport	Asia	PK	Pakistan	Punjab	Bhagatanwala	32.05609894	72.9484024
2276	BHC	Bhurban Heliport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Bhurban	33.96099854	73.45200348
2277	CWP	Campbellpore Airport	Asia	PK	Pakistan	Punjab	Campbellpore	33.76670074	72.36689758
2278	REQ	Reko Diq Airport	Asia	PK	Pakistan	Balochistan	Chagai	29.04692	62.196819
2279	CHB	Chilas Airport	Asia	PK	Pakistan	Gilgit-Baltistan	Chilas	35.42670059	74.08170319
2280	CJL	Chitral Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Chitral	35.886213	71.799922
2281	DDU	Dadu West Airport	Asia	PK	Pakistan	Sindh	Dadu	26.74080086	67.66660309
2282	DBA	Dalbandin Airport	Asia	PK	Pakistan	Balochistan	Dalbandin	28.87829971	64.39980316
2283	DEA	Dera Ghazi Khan Airport	Asia	PK	Pakistan	Punjab	Dera Ghazi Khan	29.96100044	70.48590088
2284	DSK	Dera Ismael Khan Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Dera Ismael Khan	31.90940094	70.89659882
2285	LYP	Faisalabad International Airport	Asia	PK	Pakistan	Punjab	Faisalabad	31.36499977	72.99479675
2286	PZH	Zhob Airport	Asia	PK	Pakistan	Balochistan	Fort Sandeman	31.35840034	69.46360016
2287	GIL	Gilgit Airport	Asia	PK	Pakistan	Gilgit-Baltistan	Gilgit	35.91880035	74.33360291
2288	GRT	Gujrat Airport	Asia	PK	Pakistan	Punjab	Gujrat	32.62826	74.067287
2289	GWD	Gwadar International Airport	Asia	PK	Pakistan	Balochistan	Gwadar	25.232391	62.327671
2290	HDD	Hyderabad Airport	Asia	PK	Pakistan	Sindh	Hyderabad	25.3181	68.366096
2291	ISB	Islamabad International Airport	Asia	PK	Pakistan	Punjab	Islamabad	33.549	72.82566
2292	JAG	Shahbaz Air Base	Asia	PK	Pakistan	Sindh	Jacobabad	28.28420067	68.4496994
2293	JIW	Jiwani Airport	Asia	PK	Pakistan	Balochistan	Jiwani	25.06780052	61.80540085
2294	KCF	Kadanwari Airport	Asia	PK	Pakistan	Sindh	Kadanwari	27.16670036	69.3167038
2295	ATG	Minhas Air Base	Asia	PK	Pakistan	Punjab	Kamra	33.86909866	72.40090179
2296	KHI	Jinnah International Airport	Asia	PK	Pakistan	Sindh	Karachi	24.9065	67.160797
2297	KDD	Khuzdar Airport	Asia	PK	Pakistan	Balochistan	Khuzdar	27.79059982	66.64730072
2298	OHT	Kohat Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Kohat	33.56999969	71.44000244
2299	LHE	Allama Iqbal International Airport	Asia	PK	Pakistan	Punjab	Lahore	31.521601	74.403603
2300	LRG	Loralai Airport	Asia	PK	Pakistan	Balochistan	Loralai	30.35549927	68.6135025
2301	XJM	Mangla Airport	Asia	PK	Pakistan	Punjab	Mangla	33.05009842	73.63839722
2302	MWD	Mianwali Air Base	Asia	PK	Pakistan	Punjab	Mianwali	32.56309891	71.5707016
2303	SKZ	Sukkur Airport	Asia	PK	Pakistan	Sindh	Mirpur Khas	27.72200012	68.79170227
2304	MJD	Moenjodaro Airport	Asia	PK	Pakistan	Sindh	Moenjodaro	27.33519936	68.14309692
2305	MUX	Multan International Airport	Asia	PK	Pakistan	Punjab	Multan	30.20319939	71.4190979
2306	MFG	Muzaffarabad Airport	Asia	PK	Pakistan	Azad Jammu and Kashmir	Muzaffarabad	34.3390007	73.50859833
2307	WNS	Shaheed Benazirabad Airport	Asia	PK	Pakistan	Sindh	Nawabashah	26.2194	68.390099
2308	ORW	Ormara Airport	Asia	PK	Pakistan	Balochistan	Ormara Raik	25.276625	64.588343
2309	PJG	Panjgur Airport	Asia	PK	Pakistan	Balochistan	Panjgur	26.9545002	64.13249969
2310	PAJ	Parachinar Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Parachinar	33.90209961	70.07160187
2311	PSI	Pasni Airport	Asia	PK	Pakistan	Balochistan	Pasni	25.29050064	63.3451004
2312	PEW	Peshawar International Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Peshawar	33.9939003	71.51460266
2313	UET	Quetta International Airport	Asia	PK	Pakistan	Balochistan	Quetta	30.25139999	66.93779755
2314	RYK	Shaikh Zaid Airport	Asia	PK	Pakistan	Punjab	Rahim Yar Khan	28.38389969	70.27960205
2315	RAZ	Rawalakot Airport	Asia	PK	Pakistan	Azad Jammu and Kashmir	Rawalakot	33.84970093	73.79810333
2316	SDT	Saidu Sharif Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Saidu Sharif	34.81359863	72.35279846
2317	SGI	Mushaf Air Base	Asia	PK	Pakistan	Punjab	Sargodha	32.04859924	72.66500092
2318	RZS	Sawan Airport	Asia	PK	Pakistan	Sindh	Sawan Gas Field	26.9662	68.878098
2319	SYW	Sehwan Sharif Airport	Asia	PK	Pakistan	Sindh	Sehwan Sharif	26.47310066	67.71720123
2320	SKT	Sialkot International Airport	Asia	PK	Pakistan	Punjab	Sialkot	32.535557	74.363892
2321	SBQ	Sibi Airport	Asia	PK	Pakistan	Balochistan	Sibi	29.57119942	67.84790039
2322	MPD	Sindhri Tharparkar Airport	Asia	PK	Pakistan	Sindh	Sindhri	25.68280029	69.07279968
2323	KDU	Skardu Airport	Asia	PK	Pakistan	Gilgit-Baltistan	Skardu	35.33549881	75.53600311
2324	SUL	Sui Airport	Asia	PK	Pakistan	Balochistan	Sui	28.64509964	69.17690277
2325	TFT	Taftan Airport	Asia	PK	Pakistan	Balochistan	Taftan	28.96419907	61.59540176
2326	TLB	Tarbela Dam Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Tarbela	33.98609924	72.61139679
2327	TUK	Turbat International Airport	Asia	PK	Pakistan	Balochistan	Turbat	25.9864006	63.03020096
2328	WAF	Wana Airport	Asia	PK	Pakistan	Khyber Pakhtunkhwa	Waana	32.30469894	69.57039642
2329	BCD	Bacolod-Silay Airport	Asia	PH	Philippines	Negros Occidental Province	Bacolod City	10.7764	123.014999
2330	BAG	Loakan Airport	Asia	PH	Philippines	Benguet Province	Baguio City	16.37509918	120.6200027
2331	BQA	Dr Juan C Angara Airport	Asia	PH	Philippines	Aurora Province	Baler	15.729309	121.500034
2332	BSI	Balesin Island Airport	Asia	PH	Philippines	Basilan Province	Balesin	14.419365	122.039402
2333	BSO	Basco Airport	Asia	PH	Philippines	Batanes Province	Basco	20.4513	121.980003
2334	BPH	Bislig Airport	Asia	PH	Philippines	Surigao del Sur Province	Bislig	8.195949554	126.3219986
2335	BXU	Bancasi Airport	Asia	PH	Philippines	Agusan del Norte Province	Butuan	8.9515	125.4788
2336	CGY	Laguindingan Airport	Asia	PH	Philippines	Misamis Oriental Province	Cagayan de Oro	8.612203	124.456496
2337	CYP	Calbayog Airport	Asia	PH	Philippines	Samar Province	Calbayog City	12.07269955	124.5449982
2338	ICO	Sicogon Airstrip	Asia	PH	Philippines	Iloilo Province	Carles	11.4595	123.2506
2339	CGG	Casiguran Airport	Asia	PH	Philippines	Aurora Province	Casiguran	16.1941	122.0651
2340	CRM	Catarman National Airport	Asia	PH	Philippines	Northern Samar Province	Catarman	12.5024004	124.6360016
2341	CYZ	Cauayan Airport	Asia	PH	Philippines	Isabela Province	Cauayan City	16.92989922	121.7529984
2342	SGL	Danilo Atienza Air Base	Asia	PH	Philippines	Cavite Province	Cavite	14.4954	120.903999
2343	USU	Francisco B. Reyes Airport	Asia	PH	Philippines	Palawan Province	Coron	12.12150002	120.0999985
2344	CBO	Awang Airport	Asia	PH	Philippines	Maguindanao Province	Cotabato City	7.165239811	124.2099991
2345	CUJ	Culion Airport	Asia	PH	Philippines	Palawan Province	Culion Island	11.8553	119.9378
2346	CYU	Cuyo Airport	Asia	PH	Philippines	Palawan Province	Cuyo	10.85809994	121.0690002
2347	DTE	Daet Airport	Asia	PH	Philippines	Camarines Norte Province	Daet	14.12919998	122.9800034
2348	DVO	Francisco Bangoy International Airport	Asia	PH	Philippines	Davao del Sur Province	Davao	7.12552	125.646004
2349	IAO	Siargao Airport	Asia	PH	Philippines	Surigao del Norte Province	Del Carmen	9.8591	126.014
2350	DSG	Dilasag Airport	Asia	PH	Philippines	Aurora Province	Dilasag	16.44583333	122.2068056
2351	DPL	Dipolog Airport	Asia	PH	Philippines	Zamboanga del Norte Province	Dipolog City	8.601983499	123.3418751
2352	DGT	Sibulan Airport	Asia	PH	Philippines	Negros Oriental Province	Dumaguete City	9.333709717	123.3000031
2353	ENI	El Nido Airport	Asia	PH	Philippines	Palawan Province	El Nido	11.202399	119.416087
2354	MRQ	Marinduque Airport	Asia	PH	Philippines	Marinduque Province	Gasan	13.36100006	121.8259964
2355	GES	General Santos International Airport	Asia	PH	Philippines	South Cotabato Province	General Santos	6.058000088	125.0960007
2356	IGN	Maria Cristina Airport	Asia	PH	Philippines	Lanao del Norte Province	Iligan	8.13049	124.214996
2357	ILO	Iloilo International Airport	Asia	PH	Philippines	Iloilo Province	Iloilo (Cabatuan)	10.833017	122.493358
2358	IPE	Ipil Airport	Asia	PH	Philippines	Zamboanga Sibiguey Province	Ipil	7.785560131	122.6019974
2359	JOL	Jolo Airport	Asia	PH	Philippines	Sulu Province	Jolo	6.05366993	121.0110016
2360	KLO	Kalibo International Airport	Asia	PH	Philippines	Aklan Province	Kalibo	11.67940044	122.3759995
2361	LLC	Cagayan North International Airport	Asia	PH	Philippines	Cagayan Province	Lal-lo	18.182388	121.745853
2362	LAO	Laoag International Airport	Asia	PH	Philippines	Ilocos Norte Province	Laoag City	18.17810059	120.5319977
2363	CEB	Mactan Cebu International Airport	Asia	PH	Philippines	Cebu Province	Lapu-Lapu City	10.30749989	123.9789963
2364	LWA	Lebak Rural Airport	Asia	PH	Philippines	Sultan Kudarat Province	Lebak	6.6739	124.0581
2365	LGP	Legazpi City International Airport	Asia	PH	Philippines	Albay Province	Legazpi City	13.1575	123.735
2366	LBX	Lubang Airport	Asia	PH	Philippines	Occidental Mindoro Province	Lubang	13.85540009	120.1050034
2367	CRK	Diosdado Macapagal International Airport	Asia	PH	Philippines	Pampanga Province	Mabalacat	15.186	120.559998
2368	MLP	Malabang Airport	Asia	PH	Philippines	Lanao del Sur Province	Malabang	7.617219925	124.0589981
2369	MPH	Godofredo P. Ramos Airport	Asia	PH	Philippines	Aklan Province	Malay	11.9245	121.954002
2370	CGM	Camiguin Airport	Asia	PH	Philippines	Camiguin Province	Mambajao	9.253894	124.709115
2371	MBO	Mamburao Airport	Asia	PH	Philippines	Occidental Mindoro Province	Mamburao	13.208048	120.605457
2372	MNL	Ninoy Aquino International Airport	Asia	PH	Philippines	Metropolitan Manila	Manila	14.5086	121.019997
2373	CDY	Cagayan de Sulu Airport	Asia	PH	Philippines	Tawi-Tawi Province	Mapun	7.013999939	118.4960022
2374	XMA	Maramag Airport	Asia	PH	Philippines	Bukidnon Province	Maramag	7.7538	125.0333
2375	MBT	Moises R. Espinosa Airport	Asia	PH	Philippines	Masbate Province	Masbate	12.369682	123.630095
2376	MXI	Mati National Airport	Asia	PH	Philippines	Davao Oriental Province	Mati	6.949091	126.27368
2377	WNP	Naga Airport	Asia	PH	Philippines	Camarines Sur Province	Naga	13.5848999	123.2699966
2378	SFS	Subic Bay International Airport / Naval Air Station Cubi Point	Asia	PH	Philippines	Zambales Province	Olongapo	14.7944	120.271004
2379	OMC	Ormoc Airport	Asia	PH	Philippines	Leyte Province	Ormoc City	11.05799961	124.5650024
2380	OZC	Labo Airport	Asia	PH	Philippines	Misamis Occidental Province	Ozamiz City	8.178509712	123.8420029
2381	PAG	Pagadian Airport	Asia	PH	Philippines	Zamboanga del Sur Province	Pagadian City	7.830731448	123.4611797
2382	TAG	Bohol-Panglao International Airport	Asia	PH	Philippines	Bohol Province	Panglao	9.566667	123.775
2383	PPS	Puerto Princesa Airport	Asia	PH	Philippines	Palawan Province	Puerto Princesa City	9.742119789	118.7590027
2384	RXS	Roxas Airport	Asia	PH	Philippines	Capiz Province	Roxas City	11.59770012	122.7519989
2385	SFE	San Fernando Airport	Asia	PH	Philippines	La Union Province	San Fernando	16.59560013	120.3030014
2386	EUQ	Evelio Javier Airport	Asia	PH	Philippines	Antique Province	San Jose	10.766644	121.932506
2387	SJI	San Jose Airport	Asia	PH	Philippines	Occidental Mindoro Province	San Jose	12.36149979	121.0469971
2388	SWL	San Vicente Airport	Asia	PH	Philippines	Palawan Province	San Vicente	10.524298	119.272899
2389	TWT	Sanga Sanga Airport	Asia	PH	Philippines	Tawi-Tawi Province	Sanga Sanga	5.046991	119.742996
2390	XSO	Siocon Airport	Asia	PH	Philippines	Zamboanga del Norte Province	Siocon	7.710035	122.161989
2391	AAV	Allah Valley Airport	Asia	PH	Philippines	South Cotabato Province	Surallah	6.367903	124.752431
2392	SUG	Surigao Airport	Asia	PH	Philippines	Surigao del Norte Province	Surigao City	9.755838326	125.4809475
2393	TBH	Tugdan Airport	Asia	PH	Philippines	Romblon Province	Tablas Island	12.31099987	122.0849991
2394	TAC	Daniel Z. Romualdez Airport	Asia	PH	Philippines	Leyte Province	Tacloban City	11.228035	125.027761
2395	TDG	Tandag Airport	Asia	PH	Philippines	Surigao del Sur Province	Tandag	9.072002	126.17132
2396	RZP	Cesar Lim Rodriguez (Taytay-Sandoval) Airport	Asia	PH	Philippines	Palawan Province	Taytay	11.05065	119.519266
2397	TUG	Tuguegarao Airport	Asia	PH	Philippines	Cagayan Province	Tuguegarao City	17.64336768	121.7331505
2398	VRC	Virac Airport	Asia	PH	Philippines	Catanduanes Province	Virac	13.5763998	124.2060013
2399	ZAM	Zamboanga International Airport	Asia	PH	Philippines	Zamboanga del Sur Province	Zamboanga City	6.922420025	122.0599976
2400	XJD	Al Udeid Air Base	Asia	QA	Qatar	Al Rayyan Municipality	Ar Rayyan	25.11730003	51.31499863
2401	DIA	Doha International Airport	Asia	QA	Qatar	Ad-Dawhah Municipality	Doha	25.261101	51.565102
2402	DOH	Hamad International Airport	Asia	QA	Qatar	Ad-Dawhah Municipality	Doha	25.273056	51.608056
2403	ADH	Aldan Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Aldan	58.60279846	125.4089966
2404	AMV	Amderma Airport	Asia	RU	Russia	Nenets Autonomous Okrug	Amderma	69.76329803	61.5564003
2405	BAX	Barnaul Airport	Asia	RU	Russia	Altai Krai	Barnaul	53.36380005	83.53849792
2406	BQJ	Batagay Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Batagay	67.64800262	134.6950073
2407	EZV	Berezovo Airport	Asia	RU	Russia	Khanty-Mansi Autonomous Okrug	Berezovo	63.92100143	65.03050232
2408	BQS	Ignatyevo Airport	Asia	RU	Russia	Amur Oblast	Blagoveschensk	50.42539978	127.4120026
2409	ODO	Bodaybo Airport	Asia	RU	Russia	Irkutsk Oblast	Bodaybo	57.86610031	114.2429962
2410	BTK	Bratsk Airport	Asia	RU	Russia	Irkutsk Oblast	Bratsk	56.37060165	101.697998
2411	CYX	Cherskiy Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Cherskiy	68.74060059	161.3379974
2412	CKH	Chokurdakh Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Chokurdah	70.62310028	147.9019928
2413	DKS	Dikson Airport	Asia	RU	Russia	Krasnoyarsk Krai	Dikson	73.51780701	80.37966919
2414	ERG	Yerbogachen Airport	Asia	RU	Russia	Irkutsk Oblast	Erbogachen	61.27500153	108.0299988
2415	IAA	Igarka Airport	Asia	RU	Russia	Krasnoyarsk Krai	Igarka	67.43720245	86.62190247
2416	KEJ	Kemerovo Airport	Asia	RU	Russia	Kemerovo Oblast	Kemerovo	55.27009964	86.10720062
2417	HMA	Khanty Mansiysk Airport	Asia	RU	Russia	Khanty-Mansi Autonomous Okrug	Khanty-Mansiysk	61.0284996	69.08609772
2418	HTG	Khatanga Airport	Asia	RU	Russia	Krasnoyarsk Krai	Khatanga	71.97810364	102.4909973
2419	KCK	Kirensk Airport	Asia	RU	Russia	Irkutsk Oblast	Kirensk	57.773	108.064
2420	KGP	Kogalym International Airport	Asia	RU	Russia	Khanty-Mansi Autonomous Okrug	Kogalym	62.19039917	74.53379822
2421	KXK	Komsomolsk-on-Amur Airport	Asia	RU	Russia	Khabarovsk Krai	Komsomolsk-on-Amur	50.4090004	136.9340057
2422	KRO	Kurgan Airport	Asia	RU	Russia	Kurgan Oblast	Kurgan	55.47529984	65.41560364
2423	KYZ	Kyzyl Airport	Asia	RU	Russia	Tuva Republic	Kyzyl	51.66939926	94.40059662
2424	ULK	Lensk Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Lensk	60.72060013	114.8259964
2425	GDX	Sokol Airport	Asia	RU	Russia	Magadan Oblast	Magadan	59.9109993	150.7200012
2426	MJZ	Mirny Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Mirny	62.53469849	114.0390015
2427	NYM	Nadym Airport	Asia	RU	Russia	Yamalo-Nenets Autonomous Okrug	Nadym	65.48090363	72.69889832
2428	NFG	Nefteyugansk Airport	Asia	RU	Russia	Khanty-Mansi Autonomous Okrug	Nefteyugansk	61.10829926	72.65000153
2429	NER	Chulman Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Neryungri	56.91389847	124.9140015
2430	NJC	Nizhnevartovsk Airport	Asia	RU	Russia	Khanty-Mansi Autonomous Okrug	Nizhnevartovsk	60.94929886	76.4835968
2431	NSK	Norilsk-Alykel Airport	Asia	RU	Russia	Krasnoyarsk Krai	Norilsk	69.31109619	87.3321991
2432	NUX	Novy Urengoy Airport	Asia	RU	Russia	Yamalo-Nenets Autonomous Okrug	Novy Urengoy	66.06939697	76.52030182
2433	NOJ	Noyabrsk Airport	Asia	RU	Russia	Yamalo-Nenets Autonomous Okrug	Noyabrsk	63.18330002	75.26999664
2434	OHO	Okhotsk Airport	Asia	RU	Russia	Khabarovsk Krai	Okhotsk	59.4100647	143.0565033
2435	OMS	Omsk Central Airport	Asia	RU	Russia	Omsk Oblast	Omsk	54.96699905	73.3105011
2436	OSW	Orsk Airport	Asia	RU	Russia	Orenburg Oblast	Orsk	51.072498	58.5956
2437	PKC	Yelizovo Airport	Asia	RU	Russia	Kamchatka Krai	Petropavlovsk-Kamchatsky	53.16790009	158.4539948
2438	TLY	Plastun Airport	Asia	RU	Russia	Primorsky Krai	Plastun	44.81499863	136.2920074
2439	SLY	Salekhard Airport	Asia	RU	Russia	Yamalo-Nenets Autonomous Okrug	Salekhard	66.59079742	66.61100006
2440	OVS	Sovetskiy Airport	Asia	RU	Russia	Khanty-Mansi Autonomous Okrug	Sovetskiy	61.32662201	63.60191345
2441	SWT	Strezhevoy Airport	Asia	RU	Russia	Tomsk Oblast	Strezhevoy	60.70940018	77.66000366
2442	SUY	Suntar Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Suntar	62.18500137	117.6350021
2443	SGC	Surgut Airport	Asia	RU	Russia	Khanty-Mansi Autonomous Okrug	Surgut	61.34370041	73.40180206
2444	IKS	Tiksi Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Tiksi	71.6977005	128.9029999
2445	TOX	Tobolsk Airport	Asia	RU	Russia	Tyumen Oblast	Tobolsk	58.13579941	68.23190308
2446	TOF	Bogashevo Airport	Asia	RU	Russia	Tomsk Oblast	Tomsk	56.38029861	85.20829773
2447	THX	Turukhansk Airport	Asia	RU	Russia	Krasnoyarsk Krai	Turukhansk	65.79720306	87.93530273
2448	ZZO	Zonalnoye Airport	Asia	RU	Russia	Sakhalin Oblast	Tymovskoye	50.6692009	142.7610016
2449	TJM	Roshchino International Airport	Asia	RU	Russia	Tyumen Oblast	Tyumen	57.1896019	65.32430267
2450	URJ	Uray Airport	Asia	RU	Russia	Khanty-Mansi Autonomous Okrug	Uray	60.10329819	64.8266983
2451	UIK	Ust-Ilimsk Airport	Asia	RU	Russia	Irkutsk Oblast	Ust-Ilimsk	58.13610077	102.5650024
2452	UKX	Ust-Kut Airport	Asia	RU	Russia	Irkutsk Oblast	Ust-Kut	56.8567009	105.7300034
2453	VHV	Verkhnevilyuisk Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Verkhnevilyuisk	63.4580574	120.269165
2454	VYI	Vilyuisk Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Vilyuisk	63.75666809	121.6933365
2455	VKT	Vorkuta Airport	Asia	RU	Russia	Komi Republic	Vorkuta	67.48860168	63.99309921
2456	PYJ	Polyarny Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Yakutia	66.40039825	112.0299988
2457	YKS	Yakutsk Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Yakutsk	62.09329987	129.7709961
2458	SVX	Koltsovo Airport	Asia	RU	Russia	Sverdlovsk Oblast	Yekaterinburg	56.74309921	60.80270004
2459	EIE	Yeniseysk Airport	Asia	RU	Russia	Krasnoyarsk Krai	Yeniseysk	58.4742012	92.11250305
2460	ZIX	Zhigansk Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Zhigansk	66.79650116	123.3610001
2461	ZKP	Zyryanka Airport	Asia	RU	Russia	Sakha (Yakutia) Republic	Zyryanka	65.7485	150.8889
2462	AHB	Abha International Airport	Asia	SA	Saudi Arabia	Asir Region	Abha	18.2404	42.656601
2463	DMM	King Fahd International Airport	Asia	SA	Saudi Arabia	Ash Sharqiyah Region	Ad Dammam	26.47120094	49.79790115
2464	ABT	King Saud Bin Abdulaziz (Al Baha) Airport	Asia	SA	Saudi Arabia	Al Batah Region	Al Aqiq	20.298506	41.636153
2465	ULH	Majeed Bin Abdulaziz Airport	Asia	SA	Saudi Arabia	Al Madinah Region	Al Ula	26.48	38.12888889
2466	EJH	Al Wajh Domestic Airport	Asia	SA	Saudi Arabia	Tabuk Region	Al Wajh	26.198601	36.476398
2467	AJF	Al-Jawf Domestic Airport	Asia	SA	Saudi Arabia	Al Jawf Region	Al-Jawf	29.78510094	40.09999847
2468	RAE	Arar Domestic Airport	Asia	SA	Saudi Arabia	The Northern Border Region	Arar	30.90660095	41.13819885
2469	SLF	As-Sulayyil Airport	Asia	SA	Saudi Arabia	Riyadh Region	As-Sulayyil	20.464701	45.619598
2470	BHH	Bisha Airport	Asia	SA	Saudi Arabia	Asir Region	Bisha	19.9843998	42.6208992
2471	DWD	King Salman Abdulaziz Airport	Asia	SA	Saudi Arabia	Riyadh Region	Dawadmi	24.4499	44.121201
2472	DHA	King Abdulaziz Air Base	Asia	SA	Saudi Arabia	Ash Sharqiyah Region	Dhahran	26.2654	50.152
2473	ELQ	Gassim Airport	Asia	SA	Saudi Arabia	Al Qasim Region	Gassim	26.30279922	43.7743988
2474	URY	Gurayat Domestic Airport	Asia	SA	Saudi Arabia	The Northern Border Region	Gurayat	31.412413	37.278898
2475	HAS	Ha'il Airport	Asia	SA	Saudi Arabia	Ha'il Region	Ha'il	27.437901	41.686298
2476	HOF	Al-Ahsa International Airport	Asia	SA	Saudi Arabia	Ash Sharqiyah Region	Hofuf	25.285299	49.485199
2477	JED	King Abdulaziz International Airport	Asia	SA	Saudi Arabia	Makkah Region	Jeddah	21.6796	39.156502
2478	GIZ	Jizan Regional Airport / King Abdullah bin Abdulaziz Airport	Asia	SA	Saudi Arabia	Jlzan Region	Jizan	16.9011	42.5858
2479	QJB	Jubail Airport	Asia	SA	Saudi Arabia	Ash Sharqiyah Region	Jubail	27.03899956	49.40510178
2480	KMX	King Khalid Air Base	Asia	SA	Saudi Arabia	Asir Region	Khamis Mushait	18.2973	42.803501
2481	KMC	King Khaled Military City Airport	Asia	SA	Saudi Arabia	Ash Sharqiyah Region	King Khaled Military City	27.9009	45.528198
2482	MED	Prince Mohammad Bin Abdulaziz Airport	Asia	SA	Saudi Arabia	Al Madinah Region	Medina	24.5534	39.705101
2483	EAM	Najran Domestic Airport	Asia	SA	Saudi Arabia	Najran Region	Najran	17.611401	44.419201
2484	NUM	Neom Bay Airport	Asia	SA	Saudi Arabia	Tabuk Region	Neom	27.927598	35.28874
2485	AKH	Prince Sultan Air Base	Asia	SA	Saudi Arabia	Riyadh Region	Prince Sultan	24.06270027	47.58050156
2486	AQI	Al Qaisumah/Hafr Al Batin Airport	Asia	SA	Saudi Arabia	Ash Sharqiyah Region	Qaisumah	28.335199	46.125099
2487	RAH	Rafha Domestic Airport	Asia	SA	Saudi Arabia	The Northern Border Region	Rafha	29.62639999	43.49060059
2488	RUH	King Khaled International Airport	Asia	SA	Saudi Arabia	Riyadh Region	Riyadh	24.95759964	46.69879913
2489	XXN	Riyadh Air Base	Asia	SA	Saudi Arabia	Riyadh Region	Riyadh	24.70980072	46.72520065
2490	SHW	Sharurah Domestic Airport	Asia	SA	Saudi Arabia	Najran Region	Sharurah	17.4669	47.121399
2491	TIF	Ta???if Regional Airport	Asia	SA	Saudi Arabia	Makkah Region	Ta???if	21.483001	40.543442
2492	TUU	Tabuk Airport	Asia	SA	Saudi Arabia	Tabuk Region	Tabuk	28.3654	36.6189
2493	TUI	Turaif Domestic Airport	Asia	SA	Saudi Arabia	The Northern Border Region	Turaif	31.692188	38.731544
2494	WAE	Wadi Al Dawasir Domestic Airport	Asia	SA	Saudi Arabia	Riyadh Region	Wadi Al Dawasir	20.504299	45.1996
2495	YNB	Yanbu Airport / Prince Abdul Mohsin bin Abdulaziz international Airport	Asia	SA	Saudi Arabia	Al Madinah Region	Yanbu	24.144199	38.0634
2496	ZUL	Zilfi Airport	Asia	SA	Saudi Arabia	Riyadh Region	Zilfi	26.35000038	44.83300018
2497	QPG	Paya Lebar Air Base	Asia	SG	Singapore	South East	Paya Lebar	1.36042	103.910004
2498	XSP	Seletar Airport	Asia	SG	Singapore	North East	Seletar	1.416949987	103.8679962
2499	SIN	Singapore Changi Airport	Asia	SG	Singapore	South East	Singapore	1.35019	103.994003
2500	TGA	Tengah Air Base	Asia	SG	Singapore	North West	Western Water Catchment	1.387561	103.708291
2501	UJN	Uljin Airport	Asia	KR	South Korea	Gyeongsangbugdo	Bongsan-ri, Uljin	36.777049	129.461861
2502	PUS	Gimhae International Airport	Asia	KR	South Korea	Busan Gwang'yeogsi	Busan	35.17950058	128.9380035
2503	CJJ	Cheongju International Airport/Cheongju Air Base (K-59/G-513)	Asia	KR	South Korea	Chungcheongbugdo	Cheongju	36.717008	127.498741
2504	TAE	Daegu Airport	Asia	KR	South Korea	Daegu Gwang'yeogsi	Daegu	35.896872	128.65531
2505	KAG	Gangneung Airport (K-18)	Asia	KR	South Korea	Gang'weondo	Gangneung	37.753601	128.943915
2506	YNY	Yangyang International Airport	Asia	KR	South Korea	Gang'weondo	Gonghang-ro	38.061298	128.669006
2507	KWJ	Gwangju Airport	Asia	KR	South Korea	Gwangju Gwang'yeogsi	Gwangju	35.123173	126.805444
2508	CJU	Jeju International Airport	Asia	KR	South Korea	Jejudo	Jeju City	33.51129913	126.4929962
2509	JDG	Jeongseok Airport	Asia	KR	South Korea	Jejudo	Jeju Island	33.39960098	126.711998
2510	CHN	Jeonju (G 703) Air Base	Asia	KR	South Korea	Jeonrabugdo	Jeonju	35.878289	127.11894
2511	CHF	Jinhae Airbase/Airport (G-813/K-10)	Asia	KR	South Korea	Gyeongsangnamdo	Jinhae	35.140248	128.696229
2512	KUV	Kunsan Air Base	Asia	KR	South Korea	Jeonrabugdo	Kunsan	35.903801	126.615997
2513	OSN	Osan Air Base	Asia	KR	South Korea	Gyeonggido	Osan	37.090599	127.029999
2514	MWX	Muan International Airport	Asia	KR	South Korea	Jeonranamdo	Piseo-ri (Muan)	34.991406	126.382814
2515	QJP	Pocheon (G-217) Airport	Asia	KR	South Korea	Gyeonggido	Pocheon	37.864555	127.176633
2516	KPO	Pohang Airport (G-815/K-3)	Asia	KR	South Korea	Gyeongsangbugdo	Pohang	35.987955	129.420383
2517	HIN	Sacheon Air Base/Airport	Asia	KR	South Korea	Gyeongsangnamdo	Sacheon	35.088591	128.071747
2518	SSN	Seoul Air Base (K-16)	Asia	KR	South Korea	Gyeonggido	Seongnam	37.444744	127.112718
2519	HMY	Seosan Air Base	Asia	KR	South Korea	Chungcheongnamdo	Seosan	36.703999	126.486
2520	ICN	Incheon International Airport	Asia	KR	South Korea	Incheon Gwang'yeogsi	Seoul	37.46910095	126.4509964
2521	GMP	Gimpo International Airport	Asia	KR	South Korea	Seoul Teugbyeolsi	Seoul	37.5583	126.791
2522	SWU	Suwon Airport	Asia	KR	South Korea	Gyeonggido	Suwon	37.239399	127.007004
2523	QDY	Taean Airport	Asia	KR	South Korea	Chungcheongnamdo	Taean	36.593781	126.29662
2524	USN	Ulsan Airport	Asia	KR	South Korea	Ulsan Gwang'yeogsi	Ulsan	35.59349823	129.352005
2525	WJU	Wonju Airport / Hoengseong Air Base (K-38/K-46)	Asia	KR	South Korea	Gang'weondo	Wonju	37.437113	127.960051
2526	YEC	Yecheon Airbase	Asia	KR	South Korea	Gyeongsangbugdo	Yecheon-ri	36.630373	128.34971
2527	RSU	Yeosu Airport	Asia	KR	South Korea	Jeonranamdo	Yeosu	34.84230042	127.6169968
2528	ADP	Ampara Airport	Asia	LK	Sri Lanka	Eastern Province	Ampara	7.336745	81.623869
2529	AFK	Kondavattavana Tank Seaplane Base	Asia	LK	Sri Lanka	Eastern Province	Ampara	7.284	81.644
2530	ACJ	Anuradhapura Airport	Asia	LK	Sri Lanka	North Central Province	Anuradhapura	8.301542	80.42848
2531	BTC	Batticaloa Airport	Asia	LK	Sri Lanka	Eastern Province	Batticaloa	7.70576	81.678802
2532	BJT	Bentota River Waterdrome	Asia	LK	Sri Lanka	Western Province	Bentota	6.431	79.996
2533	CMB	Bandaranaike International Colombo Airport	Asia	LK	Sri Lanka	Western Province	Colombo	7.180759907	79.88410187
2534	BYV	Beira Lake Seaplane Base	Asia	LK	Sri Lanka	Western Province	Colombo	6.929444444	79.85416667
2535	RML	Colombo Ratmalana Airport	Asia	LK	Sri Lanka	Western Province	Colombo	6.821990013	79.88619995
2536	DGM	Dandugama Seaplane Base	Asia	LK	Sri Lanka	Western Province	Colombo	7.1079	79.8721
2537	KEZ	Kelani-Peliyagoda Seaplane Base	Asia	LK	Sri Lanka	Western Province	Colombo	6.95	79.93
2538	DBU	Dambulu Oya Tank Seaplane Base	Asia	LK	Sri Lanka	Central Province	Dambulla	7.8604	80.6304
2539	DIW	Mawella Lagoon Seaplane Base	Asia	LK	Sri Lanka	Southern Province	Dickwella	5.990192	80.733129
2540	KCT	Koggala Airport	Asia	LK	Sri Lanka	Southern Province	Galle	5.99368	80.32029724
2541	HBT	Hambantota Seaplane Base	Asia	LK	Sri Lanka	Southern Province	Hambantota	6.124043	81.103
2542	NUF	Castlereagh Lake Seaplane Base	Asia	LK	Sri Lanka	Central Province	Hatton	6.86	80.584
2543	IRU	Iranamadu Seaplane Base	Asia	LK	Sri Lanka	Northern Province	Iranamadu	9.299746	80.448627
2544	JAF	Jaffna International Airport	Asia	LK	Sri Lanka	Northern Province	Jaffna	9.79233	80.070099
2545	DBK	Dutch Bay SPB	Asia	LK	Sri Lanka	North Western Province	Kalpitiya Island	8.273	79.756
2546	KTY	Katukurunda Air Force Base	Asia	LK	Sri Lanka	Western Province	Kalutara	6.552120209	79.97750092
2547	KDZ	Polgolla Reservoir Seaplane Base	Asia	LK	Sri Lanka	Central Province	Kandy	7.3251	80.6422
2548	KDW	Victoria Reservoir Seaplane Base	Asia	LK	Sri Lanka	Central Province	Kandy	7.2415	80.7834
2549	HRI	Mattala Rajapaksa International Airport	Asia	LK	Sri Lanka	Southern Province	Mattala Rajapaksa International	6.284467	81.124128
2550	HIM	Hingurakgoda Air Force Base	Asia	LK	Sri Lanka	North Central Province	Polonnaruwa Town	8.04981	80.9814
2551	AYY	Arugam Bay SPB	Asia	LK	Sri Lanka	Eastern Province	Pottuvil	6.86	81.82388889
2552	GIU	Sigiriya Air Force Base	Asia	LK	Sri Lanka	Central Province	Sigiriya	7.956669807	80.72850037
2553	DWO	Diyawanna Oya Seaplane Base	Asia	LK	Sri Lanka	Western Province	Sri Jayawardenepura Kotte	6.906585	79.909
2554	TTW	Tissa Tank Waterdrome	Asia	LK	Sri Lanka	Southern Province	Tissamaharama	6.2876	81.2906
2555	TRR	China Bay Airport	Asia	LK	Sri Lanka	Eastern Province	Trincomalee	8.538510323	81.18190002
2556	THW	Trincomalee Harbor Waterdrome	Asia	LK	Sri Lanka	Eastern Province	Trincomalee	8.56	81.22
2557	WRZ	Weerawila Airport	Asia	LK	Sri Lanka	Southern Province	Weerawila	6.254489899	81.23519897
2558	SOR	Al Thaurah Airport	Asia	SY	Syria	Deir ez-Zor Governorate	Al Thaurah	34.3905	40.1524
2559	ALP	Aleppo International Airport	Asia	SY	Syria	Aleppo Governorate	Aleppo	36.180698	37.2244
2560	DAM	Damascus International Airport	Asia	SY	Syria	Damascus Governorate	Damascus	33.41149902	36.5155983
2561	DEZ	Deir ez-Zor Airport	Asia	SY	Syria	Deir ez-Zor Governorate	Deir ez-Zor	35.2854	40.175999
2562	LTK	Bassel Al-Assad International Airport	Asia	SY	Syria	Latakia Governorate	Latakia	35.4011	35.9487
2563	KAC	Qamishli Airport	Asia	SY	Syria	Al-Hasakah Governorate	Qamishly	37.020599	41.191399
2564	PMS	Palmyra Airport	Asia	SY	Syria	Homs Governorate	Tadmur	34.5574	38.316898
2565	CYI	Chiayi Airport	Asia	TW	Taiwan	Chiayi County	Chiayi City	23.46179962	120.3929977
2566	HCN	Hengchun Airport	Asia	TW	Taiwan	Pingtung County	Hengchung	22.04109955	120.7300034
2567	HSZ	Hsinchu Air Base	Asia	TW	Taiwan	Hsinchu (city)	Hsinchu City	24.81800079	120.939003
2568	HUN	Hualien Airport	Asia	TW	Taiwan	Hualien County	Hualien City	24.0230999	121.6179962
2569	MZG	Penghu Magong Airport	Asia	TW	Taiwan	Penghu County	Huxi	23.568701	119.627998
2570	DSX	Dongsha Island (Pratas Island) Airport	Asia	TW	Taiwan	Kaohsiung (municipality)	Kaohsiung (Cijin - Pratas Island)	20.7066	116.721001
2571	KHH	Kaohsiung International Airport	Asia	TW	Taiwan	Kaohsiung (municipality)	Kaohsiung (Xiaogang)	22.577101	120.349998
2572	GNI	Lyudao Airport	Asia	TW	Taiwan	Taitung County	Lyudao	22.6739006	121.4660034
2573	MFK	Matsu Beigan Airport	Asia	TW	Taiwan	Lienchiang County	Matsu (Beigan)	26.224199	120.002998
2574	LZN	Matsu Nangan Airport	Asia	TW	Taiwan	Lienchiang County	Matsu (Nangan)	26.1598	119.958
2575	KYD	Lanyu Airport	Asia	TW	Taiwan	Taitung County	Orchid Island	22.02700043	121.5350037
2576	PIF	Pingtung North Airport	Asia	TW	Taiwan	Pingtung County	Pingtung	22.70019913	120.4820023
2577	CMJ	Qimei Airport	Asia	TW	Taiwan	Penghu County	Qimei	23.213127	119.417539
2578	KNH	Kinmen Airport	Asia	TW	Taiwan	Kinmen County	Shang-I	24.4279	118.359001
2579	RMQ	Taichung International Airport / Ching Chuang Kang Air Base	Asia	TW	Taiwan	Taichung (city)	Taichung (Qingshui)	24.2647	120.621002
2580	TNN	Tainan International Airport / Tainan Air Base	Asia	TW	Taiwan	Tainan City	Tainan (Rende)	22.950399	120.206001
2581	TPE	Taiwan Taoyuan International Airport	Asia	TW	Taiwan	Taoyuan County	Taipei	25.0777	121.233002
2582	TSA	Taipei Songshan Airport	Asia	TW	Taiwan	Taipei (municipality)	Taipei City	25.06940079	121.552002
2583	TTT	Taitung Airport	Asia	TW	Taiwan	Taitung County	Taitung City	22.75499916	121.1019974
2584	WOT	Wang'an Airport	Asia	TW	Taiwan	Penghu County	Wang'an	23.369108	119.503598
2585	DYU	Dushanbe Airport	Asia	TJ	Tajikistan	Districts of Republican Subordination	Dushanbe	38.54330063	68.82499695
2586	LBD	Khujand Airport	Asia	TJ	Tajikistan	Sughd Region	Khujand	40.215401	69.694702
2587	TJU	Kulob Airport	Asia	TJ	Tajikistan	Khatlon Region	Kulyab	37.98809814	69.80500031
2588	KQT	Qurghonteppa International Airport	Asia	TJ	Tajikistan	Khatlon Region	Kurgan-Tyube	37.86640167	68.86470032
2589	BAO	Udorn Air Base	Asia	TH	Thailand	Udon Thani Province	Ban Mak Khaen	17.38299942	102.8000031
2590	DMK	Don Mueang International Airport	Asia	TH	Thailand	Bangkok (special administrative area)	Bangkok	13.91259956	100.6070023
2591	BKK	Suvarnabhumi Airport	Asia	TH	Thailand	Bangkok (special administrative area)	Bangkok	13.68109989	100.7470016
2592	BTZ	Betong International Airport	Asia	TH	Thailand	Yala Province	Betong	5.79	101.15
2593	BFV	Buri Ram Airport	Asia	TH	Thailand	Buriram Province	Buri Ram	15.22949982	103.2529984
2594	NAK	Nakhon Ratchasima Airport	Asia	TH	Thailand	Nakhon Ratchasima Province	Chaloem Phra Kiat	14.9495	102.313004
2595	CNX	Chiang Mai International Airport	Asia	TH	Thailand	Chiang Mai Province	Chiang Mai	18.76679993	98.96260071
2596	CEI	Mae Fah Luang - Chiang Rai International Airport	Asia	TH	Thailand	Chiang Rai Province	Chiang Rai	19.952299	99.882896
2597	CJM	Chumphon Airport	Asia	TH	Thailand	Chumphon Province	Chumphon	10.71119976	99.36170197
2598	HDY	Hat Yai International Airport	Asia	TH	Thailand	Songkhla Province	Hat Yai	6.933209896	100.3929977
2599	HHQ	Hua Hin Airport	Asia	TH	Thailand	Phetchaburi Province	Hua Hin	12.63619995	99.95149994
2600	KKC	Khon Kaen Airport	Asia	TH	Thailand	Khon Kaen Province	Khon Kaen	16.46660042	102.7839966
2601	KBV	Krabi Airport	Asia	TH	Thailand	Krabi Province	Krabi	8.09912014	98.98619843
2602	TDX	Trat Airport	Asia	TH	Thailand	Trat Province	Laem Ngop	12.2746	102.319
2603	LPT	Lampang Airport	Asia	TH	Thailand	Lampang Province	Lampang	18.27090073	99.5042038
2604	LOE	Loei Airport	Asia	TH	Thailand	Loei Province	Loei	17.43910027	101.7220001
2605	PYY	Mae Hong Son Airport	Asia	TH	Thailand	Mae Hong Son Province	Mae Hong Son	19.37199974	98.43699646
2606	HGN	Mae Hong Son Airport	Asia	TH	Thailand	Mae Hong Son Province	Mae Hong Son	19.30130005	97.97579956
2607	MAQ	Mae Sot Airport	Asia	TH	Thailand	Tak Province	Mae Sot	16.69989967	98.54509735
2608	USM	Samui Airport	Asia	TH	Thailand	Nakhon Si Thammarat Province	Na Thon (Ko Samui Island)	9.547789574	100.0619965
2609	KDT	Kamphaeng Saen Airport	Asia	TH	Thailand	Suphan Buri Province	Nakhon Pathom	14.10200024	99.91719818
2610	KOP	Nakhon Phanom Airport	Asia	TH	Thailand	Nakhon Phanom Province	Nakhon Phanom	17.38380051	104.6429977
2611	NST	Nakhon Si Thammarat Airport	Asia	TH	Thailand	Nakhon Si Thammarat Province	Nakhon Si Thammarat	8.539620399	99.94470215
2612	NNT	Nan Airport	Asia	TH	Thailand	Nan Province	Nan	18.80789948	100.7829971
2613	NAW	Narathiwat Airport	Asia	TH	Thailand	Narathiwat Province	Narathiwat	6.519919872	101.7429962
2614	PAN	Pattani Airport	Asia	TH	Thailand	Pattani Province	Pattani	6.785459995	101.1539993
2615	PYX	Pattaya Airpark	Asia	TH	Thailand	Chonburi Province	Pattaya	12.8325	100.949444
2616	PHY	Phetchabun Airport	Asia	TH	Thailand	Phetchabun Province	Phetchabun	16.6760006	101.1949997
2617	PHS	Phitsanulok Airport	Asia	TH	Thailand	Phitsanulok Province	Phitsanulok	16.78289986	100.2789993
2618	PRH	Phrae Airport	Asia	TH	Thailand	Phrae Province	Phrae	18.13220024	100.1650009
2619	HKT	Phuket International Airport	Asia	TH	Thailand	Phuket Province	Phuket	8.1132	98.316902
2620	UNN	Ranong Airport	Asia	TH	Thailand	Ranong Province	Ranong	9.777620316	98.58550262
2621	UTP	U-Tapao International Airport	Asia	TH	Thailand	Rayong Province	Rayong	12.67990017	101.0049973
2622	ROI	Roi Et Airport	Asia	TH	Thailand	Roi Et Province	Roi Et	16.11680031	103.7740021
2623	KKM	Sa Pran Nak Airport	Asia	TH	Thailand	Lopburi Province	Sa Pran Nak	14.94939995	100.6429977
2624	SNO	Sakon Nakhon Airport	Asia	TH	Thailand	Sakon Nakhon Province	Sakon Nakhon	17.19510078	104.1190033
2625	SGZ	Songkhla Airport	Asia	TH	Thailand	Songkhla Province	Songkhla	7.186560154	100.6080017
2626	THS	Sukhothai Airport	Asia	TH	Thailand	Sukhothai Province	Sukhothai	17.23800087	99.81819916
2627	URT	Surat Thani Airport	Asia	TH	Thailand	Surat Thani Province	Surat Thani	9.132599831	99.13559723
2628	PXR	Surin Airport	Asia	TH	Thailand	Surin Province	Surin	14.86830044	103.4980011
2629	TKT	Tak Airport	Asia	TH	Thailand	Tak Province	Tak	16.89599991	99.25330353
2630	TKH	Takhli Airport	Asia	TH	Thailand	Nakhon Sawan Province	Takhli	15.27729988	100.2959976
2631	TST	Trang Airport	Asia	TH	Thailand	Trang Province	Trang	7.50874	99.6166
2632	UBP	Ubon Ratchathani Airport	Asia	TH	Thailand	Ubon Ratchathani Province	Ubon Ratchathani	15.25129986	104.8700027
2633	UTH	Udon Thani Airport	Asia	TH	Thailand	Udon Thani Province	Udon Thani	17.38640022	102.788002
2634	UTR	Uttaradit Airport	Asia	TH	Thailand	Uttaradit Province	Uttaradit	17.61700058	100.0999985
2635	AUT	Atauro Airport	Asia	TL	Timor-Leste	Dili	Atauro	-8.243133	125.606378
2636	BCH	Cakung Airport	Asia	TL	Timor-Leste	Baucau	Baucau	-8.489029884	126.401001
2637	DIL	Presidente Nicolau Lobato International Airport	Asia	TL	Timor-Leste	Dili	Dili	-8.54640007	125.526001
2638	KCI	Kon Airport	Asia	TL	Timor-Leste	Laut??m	Kon	-8.349193	127.050793
2639	OEC	Rota Do S??ndalo Oecusse Airport	Asia	TL	Timor-Leste	Oecussi	Oecussi-Ambeno	-9.19806	124.343002
2640	UAI	Suai Airport	Asia	TL	Timor-Leste	Cova Lima	Suai	-9.303310394	125.2870026
2641	VIQ	Viqueque Airport	Asia	TL	Timor-Leste	Viqueque	Viqueque	-8.883799553	126.3730011
2642	ADF	Ad??yaman Airport	Asia	TR	Turkey	Ad??yaman Province	Ad??yaman	37.7314	38.468899
2643	AFY	Afyon Air Base	Asia	TR	Turkey	Afyonkarahisar Province	Afyonkarahisar	38.726398	30.601101
2644	AJI	A??r?? Airport	Asia	TR	Turkey	A??r?? Province	A??r??	39.655642	43.025742
2645	KZR	Zafer Airport	Asia	TR	Turkey	K??tahya Province	Alt??nta??	39.113079	30.128111
2646	MZH	Amasya Merzifon Airport	Asia	TR	Turkey	Amasya Province	Amasya	40.829399	35.521999
2647	ESB	Esenbo??a International Airport	Asia	TR	Turkey	Ankara Province	Ankara	40.12810135	32.99509811
2648	ANK	Etimesgut Air Base	Asia	TR	Turkey	Ankara Province	Ankara	39.94979858	32.68859863
2649	HTY	Hatay Airport	Asia	TR	Turkey	Hatay Province	Antakya	36.362778	36.282223
2650	AYT	Antalya International Airport	Asia	TR	Turkey	Antalya Province	Antalya	36.898701	30.800501
2651	CII	????ld??r Airport	Asia	TR	Turkey	Aydin Province	Ayd??n	37.81499863	27.89529991
2652	BZI	Bal??kesir Merkez Airport	Asia	TR	Turkey	Bal??kesir Province	Bal??kesir Merkez	39.61930084	27.9260006
2653	BDM	Band??rma Airport	Asia	TR	Turkey	Bal??kesir Province	Band??rma	40.318001	27.977699
2654	BAL	Batman Airport	Asia	TR	Turkey	Batman Province	Batman	37.92900085	41.11660004
2655	BGG	Bing??l ??eltiksuyu Airport	Asia	TR	Turkey	Bing??l Province	Bing??l	38.85926056	40.59596252
2656	BJV	Milas Bodrum International Airport	Asia	TR	Turkey	Mu??la Province	Bodrum	37.25059891	27.66430092
2657	YEI	Bursa Yeni??ehir Airport	Asia	TR	Turkey	Bursa Province	Bursa	40.25519943	29.56259918
2658	CKZ	??anakkale Airport	Asia	TR	Turkey	??anakkale Province	??anakkale	40.13769913	26.42679977
2659	DLM	Dalaman International Airport	Asia	TR	Turkey	Mu??la Province	Dalaman	36.71310043	28.79249954
2660	DNZ	??ardak Airport	Asia	TR	Turkey	Denizli Province	Denizli	37.78559875	29.70129967
2661	DIY	Diyarbak??r Airport	Asia	TR	Turkey	Diyarbak??r Province	Diyarbak??r	37.893902	40.201
2662	EDO	Bal??kesir Koca Seyit Airport	Asia	TR	Turkey	Bal??kesir Province	Edremit	39.5546	27.0138
2663	EZS	Elaz???? Airport	Asia	TR	Turkey	Elaz???? Province	Elaz????	38.597974	39.28348
2664	ERC	Erzincan Airport	Asia	TR	Turkey	Erzincan Province	Erzincan	39.71020126	39.52700043
2665	ERZ	Erzurum International Airport	Asia	TR	Turkey	Erzurum Province	Erzurum	39.956501	41.1702
2666	AOE	Anadolu Airport	Asia	TR	Turkey	Eski??ehir Province	Eski??ehir	39.809898	30.5194
2667	ESK	Eski??ehir Air Base	Asia	TR	Turkey	Eski??ehir Province	Eski??ehir	39.78409958	30.58209991
2668	GZT	Gaziantep International Airport	Asia	TR	Turkey	Gaziantep Province	Gaziantep	36.947201	37.478699
2669	GZP	Gazipa??a-Alanya Airport	Asia	TR	Turkey	Antalya Province	Gazipa??a	36.299217	32.300598
2670	YKO	Hakkari Y??ksekova Airport	Asia	TR	Turkey	Hakk??ri Province	Hakkari	37.5497	44.2381
2671	IGD	I??d??r Airport	Asia	TR	Turkey	I??d??r Province	I??d??r	39.976627	43.876648
2672	BXN	Bodrum-Ims??k Airport	Asia	TR	Turkey	Mu??la Province	Ims??k	37.140099	27.669701
2673	ISE	S??leyman Demirel International Airport	Asia	TR	Turkey	Isparta Province	Isparta	37.8554	30.368401
2674	ADB	Adnan Menderes International Airport	Asia	TR	Turkey	??zmir Province	??zmir	38.2924	27.157
2675	KCM	Kahramanmara?? Airport	Asia	TR	Turkey	Kahramanmara?? Province	Kahramanmara??	37.53882599	36.95352173
2676	IGL	??i??li Airport	Asia	TR	Turkey	??zmir Province	Kakl???? Mahallesi	38.513	27.010099
2677	KSY	Kars Airport	Asia	TR	Turkey	Kars Province	Kars	40.56219864	43.11500168
2678	KCO	Cengiz Topel Airport	Asia	TR	Turkey	Kocaeli Province	Kartepe	40.735001	30.0833
2679	KFS	Kastamonu Airport	Asia	TR	Turkey	Kastamonu Province	Kastamonu	41.314201	33.795799
2680	ASR	Kayseri Erkilet Airport	Asia	TR	Turkey	Kayseri Province	Kayseri	38.770401	35.49539948
2681	KYA	Konya Airport	Asia	TR	Turkey	Konya Province	Konya	37.979	32.561901
2682	MLX	Malatya Erha?? Airport	Asia	TR	Turkey	Malatya Province	Malatya	38.43529892	38.0909996
2683	MQM	Mardin Airport	Asia	TR	Turkey	Mardin Province	Mardin	37.22330093	40.63169861
2684	MSR	Mu?? Airport	Asia	TR	Turkey	Mu?? Province	Mu??	38.74779892	41.66120148
2685	NAV	Nev??ehir Kapadokya Airport	Asia	TR	Turkey	Nev??ehir Province	Nev??ehir	38.7719	34.5345
2686	OGU	Ordu???Giresun Airport	Asia	TR	Turkey	Ordu Province	Ordu	40.966872	38.085995
2687	SAW	Istanbul Sabiha G??k??en International Airport	Asia	TR	Turkey	??stanbul Province	Pendik, Istanbul	40.898602	29.3092
2688	RZV	Rize???Artvin Airport	Asia	TR	Turkey	Rize Province	Rize	41.179625	40.850796
2689	SZF	Samsun-??ar??amba Airport	Asia	TR	Turkey	Samsun Province	Samsun	41.254501	36.567101
2690	SFQ	??anl??urfa Airport	Asia	TR	Turkey	??anl??urfa Province	??anl??urfa	37.09429932	38.8470993
2691	GNY	??anl??urfa GAP Airport	Asia	TR	Turkey	??anl??urfa Province	??anl??urfa	37.445663	38.895592
2692	UAB	??ncirlik Air Base	Asia	TR	Turkey	Adana Province	Sar????am	37.002102	35.4259
2693	ADA	Adana ??akirpa??a Airport	Asia	TR	Turkey	Adana Province	Seyhan	36.982201	35.280399
2694	SXZ	Siirt Airport	Asia	TR	Turkey	Siirt Province	Siirt	37.97890091	41.8404007
2695	NOP	Sinop Airport	Asia	TR	Turkey	Sinop Province	Sinop	42.018313	35.071774
2696	VAS	Sivas Nuri Demira?? Airport	Asia	TR	Turkey	Sivas Province	Sivas	39.813801	36.9035
2697	NKT	????rnak ??erafettin El??i Airport	Asia	TR	Turkey	????rnak Province	????rnak	37.3647	42.0582
2698	TJK	Tokat Airport	Asia	TR	Turkey	Tokat Province	Tokat	40.30743027	36.36740875
2699	TZX	Trabzon International Airport	Asia	TR	Turkey	Trabzon Province	Trabzon	40.995098	39.7897
2700	USQ	U??ak Airport	Asia	TR	Turkey	U??ak Province	U??ak	38.68149948	29.47170067
2701	VAN	Van Ferit Melen Airport	Asia	TR	Turkey	Van Province	Van	38.46820068	43.33229828
2702	ONQ	Zonguldak ??aycuma Airport	Asia	TR	Turkey	Zonguldak Province	Zonguldak	41.506401	32.0886
2703	ASB	Ashgabat International Airport	Asia	TM	Turkmenistan	Ahal	Ashgabat	37.986801	58.361
2704	BKN	Balkanabat Airport	Asia	TM	Turkmenistan	Balkan	Balkanabat	39.480598	54.366001
2705	TAZ	Da??oguz Airport	Asia	TM	Turkmenistan	Da??oguz	Da??oguz	41.759853	59.836149
2706	MYP	Mary International Airport	Asia	TM	Turkmenistan	Mary	Mary	37.62353	61.895668
2707	CRZ	T??rkmenabat International Airport	Asia	TM	Turkmenistan	Lebap	T??rkmenabat	38.930662	63.563982
2708	KRW	Turkmenbashi International Airport	Asia	TM	Turkmenistan	Balkan	Turkmenbashi	40.063301	53.007198
2709	AUH	Abu Dhabi International Airport	Asia	AE	United Arab Emirates	Abu Dhabi Emirate	Abu Dhabi	24.443764	54.651718
2710	AZI	Al Bateen Executive Airport	Asia	AE	United Arab Emirates	Abu Dhabi Emirate	Abu Dhabi	24.428301	54.458099
2711	AYM	Yas Island Seaplane Base	Asia	AE	United Arab Emirates	Abu Dhabi Emirate	Abu Dhabi	24.467	54.6103
2712	AAN	Al Ain International Airport	Asia	AE	United Arab Emirates	Abu Dhabi Emirate	Al Ain	24.26169968	55.60919952
2713	DHF	Al Dhafra Air Base	Asia	AE	United Arab Emirates	Abu Dhabi Emirate	Al Dhafra	24.24819946	54.54769897
2714	ZDY	Delma Airport	Asia	AE	United Arab Emirates	Abu Dhabi Emirate	Delma Island	24.51	52.3352
2715	NHD	Al Minhad Air Base	Asia	AE	United Arab Emirates	Dubai Emirate	Dubai	25.02680016	55.36619949
2716	DCG	Dubai Creek SPB	Asia	AE	United Arab Emirates	Dubai Emirate	Dubai	25.24222222	55.33138889
2717	DXB	Dubai International Airport	Asia	AE	United Arab Emirates	Dubai Emirate	Dubai	25.25279999	55.36439896
2718	FJR	Fujairah International Airport	Asia	AE	United Arab Emirates	Fujairah Emirate	Fujairah International	25.11219978	56.32400131
2719	DWC	Al Maktoum International Airport	Asia	AE	United Arab Emirates	Dubai Emirate	Jebel Ali	24.896356	55.161389
2720	DJH	Jebel Ali Seaplane Base	Asia	AE	United Arab Emirates	Dubai Emirate	Jebel Ali	24.988967	55.023796
2721	RHR	Ras al Khaimah Al Hamra Seaplane Base	Asia	AE	United Arab Emirates	Ras al-Khaimah Emirate	Ras Al Khaimah	25.691	55.778
2722	RKT	Ras Al Khaimah International Airport	Asia	AE	United Arab Emirates	Ras al-Khaimah Emirate	Ras Al Khaimah	25.6135006	55.93880081
2723	SHJ	Sharjah International Airport	Asia	AE	United Arab Emirates	Sharjah Emirate	Sharjah	25.32859993	55.51720047
2724	XSB	Sir Bani Yas Airport	Asia	AE	United Arab Emirates	Abu Dhabi Emirate	Sir Bani Yas	24.283611	52.580278
2725	AZN	Andizhan Airport	Asia	UZ	Uzbekistan	Andijan Region	Andizhan	40.727699	72.293999
2726	BHK	Bukhara International Airport	Asia	UZ	Uzbekistan	Bukhara Region	Bukhara	39.775002	64.483299
2727	FEG	Fergana International Airport	Asia	UZ	Uzbekistan	Fergana Region	Fergana	40.358799	71.745003
2728	KSQ	Karshi Airport	Asia	UZ	Uzbekistan	Qashqadaryo Region	Karshi	38.802246	65.773068
2729	NMA	Namangan Airport	Asia	UZ	Uzbekistan	Namangan Region	Namangan	40.9846	71.556702
2730	NVI	Navoi Airport	Asia	UZ	Uzbekistan	Navoiy Region	Navoi	40.117199	65.170799
2731	NCU	Nukus Airport	Asia	UZ	Uzbekistan	Republic of Karakalpakstan	Nukus	42.4884	59.623299
2732	SKD	Samarkand Airport	Asia	UZ	Uzbekistan	Samarqand Region	Samarkand	39.70050049	66.9838028
2733	TAS	Tashkent International Airport	Asia	UZ	Uzbekistan	Tashkent Region	Tashkent	41.25790024	69.28119659
2734	TMJ	Termez Airport	Asia	UZ	Uzbekistan	Surxondaryo Region	Termez	37.287261	67.311869
2735	UGC	Urgench Airport	Asia	UZ	Uzbekistan	Xorazm Region	Urgench	41.58430099	60.64170074
2736	AFS	Sugraly Airport	Asia	UZ	Uzbekistan	Navoiy Region	Zarafshan	41.613899	64.2332
2737	BMV	Buon Ma Thuot Airport	Asia	VN	Vietnam	Central Highlands Region	Buon Ma Thuot	12.66829968	108.1200027
2738	CAH	C?? Mau Airport	Asia	VN	Vietnam	Southwest Region	Ca Mau City	9.177667	105.177778
2739	CXR	Cam Ranh International Airport / Cam Ranh Air Base	Asia	VN	Vietnam	South Central Coast Region	Cam Ranh	11.9982	109.219002
2740	VCA	Can Tho International Airport	Asia	VN	Vietnam	Southwest Region	Can Tho	10.0851	105.711998
2741	VCS	Con Dao Airport	Asia	VN	Vietnam	Southeast Region	Con Dao	8.73183	106.633003
2742	DLI	Lien Khuong Airport	Asia	VN	Vietnam	Central Highlands Region	Da Lat	11.75	108.366997
2743	DAD	Da Nang International Airport	Asia	VN	Vietnam	South Central Coast Region	Da Nang	16.0439	108.198997
2744	HOO	Nhon Co Airfield	Asia	VN	Vietnam	Central Highlands Region	????k R'L???p	11.9787	107.5638
2745	DIN	Dien Bien Phu Airport	Asia	VN	Vietnam	Northwest Region	Dien Bien Phu	21.39749908	103.0080032
2746	VDH	Dong Hoi Airport	Asia	VN	Vietnam	North Central Region	Dong Hoi	17.515	106.590556
2747	HPH	Cat Bi International Airport	Asia	VN	Vietnam	Red River Delta Region	Haiphong	20.81940079	106.7249985
2748	SGN	Tan Son Nhat International Airport	Asia	VN	Vietnam	Southeast Region	Ho Chi Minh City	10.8188	106.652
2749	HUI	Phu Bai International Airport	Asia	VN	Vietnam	North Central Region	Hu???	16.401501	107.703003
2750	KON	Kontum Airport	Asia	VN	Vietnam	Central Highlands Region	Kontum	14.35000038	108.0169983
2751	PHA	Phan Rang Airport	Asia	VN	Vietnam	South Central Coast Region	Phan Rang	11.6335	108.952003
2752	PQC	Phu Quoc International Airport	Asia	VN	Vietnam	Southwest Region	Phu Quoc Island	10.1698	103.9931
2753	PXU	Pleiku Airport	Asia	VN	Vietnam	Central Highlands Region	Pleiku	14.00450039	108.0169983
2754	UIH	Phu Cat Airport	Asia	VN	Vietnam	South Central Coast Region	Quy Nohn	13.955	109.042
2755	VKG	Rach Gia Airport	Asia	VN	Vietnam	Southwest Region	Rach Gia	9.958029972	105.1323795
2756	HAN	Noi Bai International Airport	Asia	VN	Vietnam	Red River Delta Region	Soc Son, Hanoi	21.221201	105.806999
2757	SOA	S??c Tr??ng Airport	Asia	VN	Vietnam	Southwest Region	S??c Tr??ng	9.5814	105.9602
2758	SQH	Na-San Airport	Asia	VN	Vietnam	Northwest Region	Son-La	21.21699905	104.0329971
2759	VCL	Chu Lai Airport	Asia	VN	Vietnam	South Central Coast Region	Tam Ngh??a	15.4033	108.706001
2760	THD	Tho Xuan Airport	Asia	VN	Vietnam	North Central Region	Thanh H??a	19.901667	105.467778
2761	TBB	Dong Tac Airport	Asia	VN	Vietnam	South Central Coast Region	Tuy Hoa	13.0496	109.334
2762	VDO	Van Don International Airport	Asia	VN	Vietnam	Northeast Region	Van Don	21.117778	107.414167
2763	VII	Vinh Airport	Asia	VN	Vietnam	North Central Region	Vinh	18.73760033	105.6709976
2764	XVL	Vinh Long Airfield	Asia	VN	Vietnam	Southwest Region	Vinh Long	10.2509	105.9445
2765	VTG	Vung Tau Airport	Asia	VN	Vietnam	Southeast Region	Vung Tau	10.37250042	107.0950012
2766	EAB	Abs Airport	Asia	YE	Yemen	San'a' Governorate	Abs	16.010983	43.176771
2767	DHL	Ad-Dali Airport	Asia	YE	Yemen	Ad Dali Governorate	Ad-Dali	13.73846	44.72719
2768	ADE	Aden International Airport	Asia	YE	Yemen	Adan Governorate	Aden	12.8295	45.028801
2769	WDA	Al Ain Airport Ain District, Shabwah Governorate, Yemen	Asia	YE	Yemen	Shabwah Governorate	Ain District	14.859579	45.545705
2770	AAY	Al Ghaydah International Airport	Asia	YE	Yemen	Al Mahrah Governorate	Al Ghaydah	16.193341	52.174186
2771	BYD	Al-Bayda Airport	Asia	YE	Yemen	Al Bayda' Governorate	Al-Bayda	14.105974	45.441079
2772	BUK	Al-Bough Airport	Asia	YE	Yemen	Sa'dah Governorate	Al-Bough	17.34670067	44.62170029
2773	AXK	Ataq Airport	Asia	YE	Yemen	Shabwah Governorate	Ataq	14.5513	46.826199
2774	BHN	Beihan Airport	Asia	YE	Yemen	Shabwah Governorate	Beihan	14.781714	45.719703
2775	DAH	Dathina Airport	Asia	YE	Yemen	Abyan Governorate	Dathina	13.866884	46.133473
2776	HOD	Hodeidah International Airport	Asia	YE	Yemen	Al Hydaydah Governorate	Hodeida	14.75300026	42.97629929
2777	KAM	Kamaran Airport	Asia	YE	Yemen	Al Hudaydah Governorate	Kamaran	15.368755	42.612515
2778	MYN	Marib Airport	Asia	YE	Yemen	Ma'rib Governorate	Marib	15.469228	45.327272
2779	UKR	Mukeiras Airport	Asia	YE	Yemen	Al Bayda' Governorate	Mukayras	13.9368	45.657
2780	IHN	Qishn Airport	Asia	YE	Yemen	Al Mahrah Governorate	Qishn	15.417	51.682999
2781	RIY	Riyan Mukalla International Airport	Asia	YE	Yemen	Hadramawt Governorate	Riyan	14.6626	49.375
2782	SYE	Sadah Airport	Asia	YE	Yemen	Sa'dah Governorate	Sa'dah	16.967542	43.728103
2783	SAH	Sana'a International Airport	Asia	YE	Yemen	San'a' Governorate	Sana'a	15.47630024	44.21969986
2784	GXF	Seiyun Hadhramaut International Airport	Asia	YE	Yemen	Hadramawt Governorate	Seiyun	15.9661	48.7883
2785	SCT	Socotra International Airport	Asia	YE	Yemen	Hadramawt Governorate	Socotra Islands	12.63070011	53.90579987
2786	TAI	Ta'izz International Airport	Asia	YE	Yemen	Ta'izz Governorate	Ta'izz	13.68599987	44.13909912
2787	KFZ	Kuk??s International Airport	Europe	AL	Albania	Kuk??s County	Kuk??s	42.035802	20.415955
2788	TIA	Tirana International Airport Mother Teresa	Europe	AL	Albania	Tirana County	Tirana	41.41469955	19.72060013
2789	GRZ	Graz Airport	Europe	AT	Austria	Styria	Graz (Feldkirchen bei Graz)	46.9911	15.4396
2790	HOH	Hohenems-Dornbirn Airfield	Europe	AT	Austria	Vorarlberg	Hohenems / Dornbirn	47.384998	9.7
2791	INN	Innsbruck Airport	Europe	AT	Austria	Tyrol	Innsbruck	47.260201	11.344
2792	KLU	Klagenfurt Airport	Europe	AT	Austria	Carinthia	Klagenfurt am W??rthersee	46.642502	14.3377
2793	LNZ	Linz-H??rsching Airport / Vogler Air Base	Europe	AT	Austria	Upper Austria	Linz	48.2332	14.1875
2794	SZG	Salzburg Airport	Europe	AT	Austria	Salzburg	Salzburg	47.79330063	13.00430012
2795	VIE	Vienna International Airport	Europe	AT	Austria	Vienna	Vienna	48.110298	16.5697
2796	BQT	Brest Airport	Europe	BY	Belarus	Brest Region	Brest	52.108299	23.8981
2797	GME	Gomel Airport	Europe	BY	Belarus	Gomel Region	Gomel	52.52700043	31.01670074
2798	GNA	Hrodna Airport	Europe	BY	Belarus	Grodno Region	Hrodna	53.60200119	24.05380058
2799	MSQ	Minsk National Airport	Europe	BY	Belarus	Minsk Region	Minsk	53.888071	28.039964
2800	MVQ	Mogilev Airport	Europe	BY	Belarus	Mogilev Region	Mogilev	53.95489883	30.0951004
2801	TXC	Orsha Airport - Balbasovo Air Base	Europe	BY	Belarus	Vitebsk Region	Orsha	54.439999	30.2967
2802	VTB	Vitebsk Vostochny Airport	Europe	BY	Belarus	Vitebsk Region	Vitebsk	55.12649918	30.34959984
2803	ANR	Antwerp International Airport (Deurne)	Europe	BE	Belgium	Antwerp Province	Antwerp	51.1894	4.46028
2804	BRU	Brussels Airport	Europe	BE	Belgium	Brussels-Capital Region	Brussels	50.90140152	4.48443985
2805	CRL	Brussels South Charleroi Airport	Europe	BE	Belgium	Hainaut Province	Brussels	50.459202	4.45382
2806	LGG	Li??ge Airport	Europe	BE	Belgium	Li??ge Province	Li??ge	50.637402	5.44322
2807	OST	Ostend-Bruges International Airport	Europe	BE	Belgium	West Flanders Province	Ostend	51.1998	2.874673
2808	KJK	Wevelgem Airport	Europe	BE	Belgium	West Flanders Province	Wevelgem	50.8172	3.20472
2809	OBL	Zoersel (Oostmalle) Airfield	Europe	BE	Belgium	Antwerp Province	Zoersel	51.2647	4.754505
2810	BNX	Banja Luka International Airport	Europe	BA	Bosnia and Herzegovina	Republika Srpska	Banja Luka	44.94139862	17.29750061
2811	OMO	Mostar International Airport	Europe	BA	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina	Mostar	43.28290176	17.84589958
2812	SJJ	Sarajevo International Airport	Europe	BA	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina	Sarajevo	43.8246	18.331499
2813	TZL	Tuzla International Airport	Europe	BA	Bosnia and Herzegovina	Federation of Bosnia and Herzegovina	Tuzla	44.458698	18.7248
2814	TGV	Targovishte Airport / Buhovtsi Airfield	Europe	BG	Bulgaria	Targovishte Province	Buhovtsi	43.306599	26.700899
2815	BOJ	Burgas Airport	Europe	BG	Bulgaria	Burgas Province	Burgas	42.56959915	27.51519966
2816	GOZ	Gorna Oryahovitsa Airport	Europe	BG	Bulgaria	Veliko Tarnovo Province	Gorna Oryahovitsa	43.15140152	25.71290016
2817	HKV	Malevo Airport	Europe	BG	Bulgaria	Haskovo Province	Haskovo	41.87179947	25.60479927
2818	PDV	Plovdiv International Airport	Europe	BG	Bulgaria	Plovdiv Province	Plovdiv	42.067799	24.8508
2819	ROU	Ruse Airport	Europe	BG	Bulgaria	Ruse Province	Shtraklevo	43.694801	26.0567
2820	SOF	Sofia Airport	Europe	BG	Bulgaria	Sofia Province	Sofia	42.69669342	23.41143608
2821	SZR	Stara Zagora Airport	Europe	BG	Bulgaria	Stara Zagora Province	Stara Zagora	42.3766667	25.655
2822	VAR	Varna Airport	Europe	BG	Bulgaria	Varna Province	Varna	43.232101	27.8251
2823	JAM	Bezmer Air Base	Europe	BG	Bulgaria	Jambol Province	Yambol	42.45489883	26.35219955
2824	BWK	Bra?? Airport	Europe	HR	Croatia	Split-Dalmatia County	Bol	43.285702	16.679701
2825	DBV	Dubrovnik Airport	Europe	HR	Croatia	Dubrovnik-Neretva County	Dubrovnik	42.56140137	18.26819992
2826	LSZ	Lo??inj Island Airport	Europe	HR	Croatia	Primorje-Gorski Kotar County	Lo??inj	44.56579971	14.39309978
2827	OSI	Osijek Airport	Europe	HR	Croatia	Osijek-Baranja County	Osijek	45.4627	18.8102
2828	PUY	Pula Airport	Europe	HR	Croatia	Istria County	Pula	44.89350128	13.9222002
2829	RJK	Rijeka Airport	Europe	HR	Croatia	Primorje-Gorski Kotar County	Rijeka	45.21689987	14.5703001
2830	SPU	Split Airport	Europe	HR	Croatia	Split-Dalmatia County	Split	43.53889847	16.29800034
2831	ZAG	Zagreb Airport	Europe	HR	Croatia	Zagreb (city)	Zagreb	45.74290085	16.06879997
2832	ZAD	Zadar Airport	Europe	HR	Croatia	Zadar County	Zemunik (Zadar)	44.108299	15.3467
2833	BRQ	Brno-Tu??any Airport	Europe	CZ	Czech Republic	South Moravian Region	Brno	49.15129852	16.69440079
2834	KLV	Karlovy Vary International Airport	Europe	CZ	Czech Republic	Carlsbad Region	Karlovy Vary	50.20299911	12.91499996
2835	OLO	Olomouc Airport	Europe	CZ	Czech Republic	Olomouc Region	Olomouc	49.587799	17.2108
2836	OSR	Ostrava Leos Jan????ek Airport	Europe	CZ	Czech Republic	Moravian-Silesian Region	Ostrava	49.69630051	18.11109924
2837	PED	Pardubice Airport	Europe	CZ	Czech Republic	Pardubice Region	Pardubice	50.01340103	15.73859978
2838	PRG	V??clav Havel Airport Prague	Europe	CZ	Czech Republic	Prague (capital city)	Prague	50.1008	14.26
2839	PRV	P??erov Air Base	Europe	CZ	Czech Republic	Olomouc Region	P??erov	49.42580032	17.40469933
2840	UHE	Kunovice Airport	Europe	CZ	Czech Republic	Zl??n Region	Uhersk?? Hradi??t??	49.02939987	17.43969917
2841	VOD	Vodochody Airport	Europe	CZ	Czech Republic	Central Bohemian Region	Vodochody	50.216599	14.3958
2842	ZBE	Zabreh Ostrava Airfield	Europe	CZ	Czech Republic	Moravian-Silesian Region	Zabreh	49.928299	18.0783
2843	AAL	Aalborg Airport	Europe	DK	Denmark	North Jutland	Aalborg	57.092759	9.849243
2844	AAR	Aarhus Airport	Europe	DK	Denmark	Central Jutland	Aarhus	56.303331	10.618286
2845	BLL	Billund Airport	Europe	DK	Denmark	South Denmark	Billund	55.74029922	9.151780128
2846	CPH	Copenhagen Kastrup Airport	Europe	DK	Denmark	Capital Region	Copenhagen	55.61790085	12.65600014
2847	RKE	Copenhagen Roskilde Airport	Europe	DK	Denmark	Zealand	Copenhagen	55.58560181	12.13140011
2848	EBJ	Esbjerg Airport	Europe	DK	Denmark	South Denmark	Esbjerg	55.525902	8.5534
2849	KRP	Karup Airport	Europe	DK	Denmark	Central Jutland	Karup	56.29750061	9.124629974
2850	BYR	L??s?? Airport	Europe	DK	Denmark	North Jutland	L??s??	57.27719879	11.00010014
2851	MRW	Lolland Falster Maribo Airport	Europe	DK	Denmark	Zealand	Lolland Falster / Maribo	54.699299	11.4401
2852	ODE	Odense Airport	Europe	DK	Denmark	South Denmark	Odense	55.47669983	10.33090019
2853	RNN	Bornholm Airport	Europe	DK	Denmark	Capital Region	R??nne	55.06330109	14.75959969
2854	CNL	Sindal Airport	Europe	DK	Denmark	North Jutland	Sindal	57.503502	10.2294
2855	SQW	Skive Airport	Europe	DK	Denmark	Central Jutland	Skive	56.55020142	9.172980309
2856	STA	Stauning Airport	Europe	DK	Denmark	Central Jutland	Skjern / Ringk??bing	55.99010086	8.353910446
2857	SGD	S??nderborg Airport	Europe	DK	Denmark	South Denmark	S??nderborg	54.96440125	9.791729927
2858	TED	Thisted Airport	Europe	DK	Denmark	North Jutland	Thisted	57.06880188	8.705220222
2859	SKS	Skrydstrup Air Base	Europe	DK	Denmark	South Denmark	Vojens	55.221048	9.26702
2860	KDL	K??rdla Airport	Europe	EE	Estonia	Hiiu County	K??rdla	58.99079895	22.83069992
2861	URE	Kuressaare Airport	Europe	EE	Estonia	Saare County	Kuressaare	58.22990036	22.5095005
2862	EPU	P??rnu Airport	Europe	EE	Estonia	P??rnu County	P??rnu	58.41899872	24.4727993
2863	TLL	Lennart Meri Tallinn Airport	Europe	EE	Estonia	Harju County	Tallinn	59.41329956	24.83279991
2864	TAY	Tartu Airport	Europe	EE	Estonia	Tartu County	Tartu	58.307499	26.690399
2865	FAE	V??gar Airport	Europe	FO	Faroe Islands	V??gar	V??gar	62.063599	-7.27722
2866	ENF	Enontekio Airport	Europe	FI	Finland	Lapland Region	Enontekio	68.36260223	23.42429924
2867	HEL	Helsinki Vantaa Airport	Europe	FI	Finland	Uusimaa Region	Helsinki	60.3172	24.963301
2868	HYV	Hyvink???? Airfield	Europe	FI	Finland	Uusimaa Region	Hyvink????	60.6544	24.8811
2869	IVL	Ivalo Airport	Europe	FI	Finland	Lapland Region	Ivalo	68.6072998	27.40530014
2870	KEV	Halli Airport	Europe	FI	Finland	Central Finland Region	J??ms??	61.856039	24.786686
2871	JOE	Joensuu Airport	Europe	FI	Finland	North Karelia Region	Joensuu / Liperi	62.662899	29.6075
2872	JYV	Jyv??skyl?? Airport	Europe	FI	Finland	Central Finland Region	Jyv??skyl??n Maalaiskunta	62.399502	25.678301
2873	KAJ	Kajaani Airport	Europe	FI	Finland	Kainuu Region	Kajaani	64.2855	27.6924
2874	KHJ	Kauhajoki Airfield	Europe	FI	Finland	South Ostrobothnia Region	Kauhajoki	62.462502	22.393101
2875	KAU	Kauhava Airfield	Europe	FI	Finland	South Ostrobothnia Region	Kauhava	63.127102	23.051399
2876	KEM	Kemi-Tornio Airport	Europe	FI	Finland	Lapland Region	Kemi / Tornio	65.77870178	24.58209991
2877	KTQ	Kitee Airport	Europe	FI	Finland	North Karelia Region	Kitee	62.1661	30.073601
2878	KTT	Kittil?? Airport	Europe	FI	Finland	Lapland Region	Kittil??	67.7009964	24.84679985
2879	KOK	Kokkola-Pietarsaari Airport	Europe	FI	Finland	Central Ostrobothnia Region	Kokkola / Kruunupyy	63.721199	23.143101
2880	KUO	Kuopio Airport	Europe	FI	Finland	Northern Savonia Region	Kuopio / Siilinj??rvi	63.007099	27.7978
2881	KAO	Kuusamo Airport	Europe	FI	Finland	North Ostrobothnia Region	Kuusamo	65.987602	29.239401
2882	LPP	Lappeenranta Airport	Europe	FI	Finland	South Karelia Region	Lappeenranta	61.044601	28.144743
2883	MHQ	Mariehamn Airport	Europe	FI	Finland	??land Islands Region	Mariehamn	60.1222	19.898199
2884	MIK	Mikkeli Airport	Europe	FI	Finland	Southern Savonia Region	Mikkeli	61.6866	27.201799
2885	OUL	Oulu Airport	Europe	FI	Finland	North Ostrobothnia Region	Oulu / Oulunsalo	64.930099	25.354601
2886	POR	Pori Airport	Europe	FI	Finland	Satakunta Region	Pori	61.4617	21.799999
2887	RVN	Rovaniemi Airport	Europe	FI	Finland	Lapland Region	Rovaniemi	66.56479645	25.83040047
2888	SVL	Savonlinna Airport	Europe	FI	Finland	Southern Savonia Region	Savonlinna	61.9431	28.945101
2889	SJY	Sein??joki Airport	Europe	FI	Finland	South Ostrobothnia Region	Sein??joki / Ilmajoki	62.692101	22.8323
2890	SOT	Sodankyla Airport	Europe	FI	Finland	Lapland Region	Sodankyla	67.39499664	26.61910057
2891	TMP	Tampere-Pirkkala Airport	Europe	FI	Finland	Pirkanmaa Region	Tampere / Pirkkala	61.414101	23.604401
2892	TKU	Turku Airport	Europe	FI	Finland	Southwest Finland Region	Turku	60.514099	22.2628
2893	UTI	Utti Air Base	Europe	FI	Finland	Kymenlaakso Region	Utti / Valkeala	60.8964	26.9384
2894	VAA	Vaasa Airport	Europe	FI	Finland	Ostrobothnia Region	Vaasa	63.050701	21.762199
2895	VRK	Varkaus Airport	Europe	FI	Finland	Southern Savonia Region	Varkaus / Joroinen	62.171101	27.868601
2896	YLI	Ylivieska Airfield	Europe	FI	Finland	North Ostrobothnia Region	Ylivieska	64.054722	24.725278
2897	AGF	Agen-La Garenne Airport	Europe	FR	France	Nouvelle-Aquitaine	Agen/La Garenne	44.17470169	0.5905560255
2898	AJA	Ajaccio-Napol??on Bonaparte Airport	Europe	FR	France	Corsica	Ajaccio/Napol??on Bonaparte	41.92359924	8.802920341
2899	BYF	Albert-Bray Airport	Europe	FR	France	Hauts-de-France	Albert/Bray	49.9715004	2.697659969
2900	LBI	Albi-Le S??questre Airport	Europe	FR	France	Occitanie	Albi/Le S??questre	43.91389847	2.113059998
2901	ANG	Angoul??me-Brie-Champniers Airport	Europe	FR	France	Nouvelle-Aquitaine	Angoul??me/Brie/Champniers	45.729198	0.221456
2902	NCY	Annecy-Haute-Savoie-Mont Blanc Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Annecy/Meythet	45.9308333	6.1063889
2903	OBS	Aubenas-Ard??che M??ridional Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Aubenas/Ard??che M??ridional	44.544203	4.372192
2904	AUR	Aurillac Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Aurillac	44.89139938	2.421940088
2905	AUF	Auxerre-Branches Airport	Europe	FR	France	Bourgogne-Franche-Comt??	Auxerre/Branches	47.85020065	3.49710989
2906	AVN	Avignon-Caumont Airport	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Avignon/Caumont	43.90729904	4.901830196
2907	BSL	EuroAirport Basel-Mulhouse-Freiburg Airport	Europe	FR	France	Grand Est	B??le/Mulhouse	47.59	7.529167
2908	BIC	A??rodrome de Belle ??le	Europe	FR	France	Brittany	Bangor	47.325256	-3.201255
2909	BIA	Bastia-Poretta Airport	Europe	FR	France	Corsica	Bastia/Poretta	42.55270004	9.483730316
2910	BVA	Paris Beauvais Till?? Airport	Europe	FR	France	Hauts-de-France	Beauvais	49.454399	2.11278
2911	EGC	Bergerac-Roumani??re Airport	Europe	FR	France	Nouvelle-Aquitaine	Bergerac/Roumani??re	44.82529831	0.5186110139
2912	BZR	B??ziers-Vias Airport	Europe	FR	France	Occitanie	B??ziers/Vias	43.32350159	3.353899956
2913	BIQ	Biarritz-Anglet-Bayonne Airport	Europe	FR	France	Nouvelle-Aquitaine	Biarritz/Anglet/Bayonne	43.4683333	-1.5311111
2914	BOD	Bordeaux-M??rignac Airport	Europe	FR	France	Nouvelle-Aquitaine	Bordeaux/M??rignac	44.8283	-0.715556
2915	BOU	Bourges Airport	Europe	FR	France	Centre-Val de Loire	Bourges	47.05810165	2.370280027
2916	BES	Brest Bretagne Airport	Europe	FR	France	Brittany	Brest/Guipavas	48.44789886	-4.418540001
2917	BVE	Brive-Souillac	Europe	FR	France	Nouvelle-Aquitaine	Brive la Gaillarde	45.039722	1.485556
2918	CFR	Caen-Carpiquet Airport	Europe	FR	France	Normandy	Caen/Carpiquet	49.173302	-0.45
2919	ZAO	A??rodrome de Cahors-Lalbenque	Europe	FR	France	Occitanie	Cahors/Lalbenque	44.351398	1.47528
2920	CLY	Calvi-Sainte-Catherine Airport	Europe	FR	France	Corsica	Calvi/Sainte-Catherine	42.5244444	8.7930556
2921	CEQ	Cannes-Mandelieu Airport	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Cannes	43.542	6.95348
2922	CCF	Carcassonne Airport	Europe	FR	France	Occitanie	Carcassonne/Salvaza	43.2159996	2.306319952
2923	DCM	Castres-Mazamet Airport	Europe	FR	France	Occitanie	Castres/Mazamet	43.55630112	2.28918004
2924	CMF	Chamb??ry-Savoie Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Chamb??ry/Aix-les-Bains	45.63809967	5.88022995
2925	CHR	Ch??teauroux-D??ols "Marcel Dassault" Airport	Europe	FR	France	Centre-Val de Loire	Ch??teauroux/D??ols	46.860278	1.721111
2926	CER	Cherbourg-Maupertus Airport	Europe	FR	France	Normandy	Cherbourg/Maupertus	49.65010071	-1.470280051
2927	CET	Cholet Le Pontreau Airport	Europe	FR	France	Pays-de-la-Loire	Cholet/Le Pontreau	47.08209991	-0.8770639896
2928	CFE	Clermont-Ferrand Auvergne Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Clermont-Ferrand/Auvergne	45.7867012	3.169169903
2929	CNG	Cognac-Ch??teaubernard (BA 709) Air Base	Europe	FR	France	Nouvelle-Aquitaine	Cognac/Ch??teaubernard	45.65829849	-0.3174999952
2930	CMR	Colmar-Houssen Airport	Europe	FR	France	Grand Est	Colmar/Houssen	48.10990143	7.35901022
2931	POX	A??rodrome de Pontoise - Cormeilles en Vexin	Europe	FR	France	??le-de-France	Cormeilles-en-Vexin	49.096667	2.040833
2932	CVF	Courchevel Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Courchevel	45.396702	6.63472
2933	CSF	Creil Air Base	Europe	FR	France	Hauts-de-France	Creil	49.25350189	2.519140005
2934	DOL	Deauville-Saint-Gatien Airport	Europe	FR	France	Normandy	Deauville	49.365299	0.154306
2935	DPE	St Aubin Airport	Europe	FR	France	Normandy	Dieppe	49.88249969	1.085279942
2936	DIJ	Dijon-Bourgogne Airport	Europe	FR	France	Bourgogne-Franche-Comt??	Dijon/Longvic	47.268902	5.09
2937	DNR	Dinard-Pleurtuit-Saint-Malo Airport	Europe	FR	France	Brittany	Dinard/Pleurtuit/Saint-Malo	48.58769989	-2.079960108
2938	DLE	Dole-Tavaux Airport	Europe	FR	France	Bourgogne-Franche-Comt??	Dole/Tavaux	47.042686	5.435063
2939	EPL	??pinal-Mirecourt Airport	Europe	FR	France	Grand Est	??pinal/Mirecourt	48.325001	6.06998
2940	EVX	??vreux-Fauville (BA 105) Air Base	Europe	FR	France	Normandy	??vreux/Fauville	49.02870178	1.219859958
2941	FSC	Figari Sud-Corse Airport	Europe	FR	France	Corsica	Figari Sud-Corse	41.500599	9.09778
2942	GAT	Gap - Tallard Airfield	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Gap - Tallard	44.455002	6.03778
2943	GFR	Granville Airport	Europe	FR	France	Normandy	Granville	48.8830986	-1.564170003
2944	IDY	??le d'Yeu Airport	Europe	FR	France	Pays-de-la-Loire	??le d'Yeu	46.71860123	-2.391109943
2945	AHZ	Altiport L'Alpe d'Huez - Henri GIRAUD	Europe	FR	France	Auvergne-Rh??ne-Alpes	L'Alpe d'Huez	45.088299	6.08472
2946	LBY	La Baule-Escoublac Airport	Europe	FR	France	Pays-de-la-Loire	La Baule-Escoublac	47.28939819	-2.346390009
2947	LTT	La M??le Airport	Europe	FR	France	Provence-Alpes-C??te-d'Azur	La M??le	43.205399	6.482
2948	EDM	La Roche-sur-Yon Airport	Europe	FR	France	Pays-de-la-Loire	La Roche-sur-Yon/Les Ajoncs	46.70190048	-1.378630042
2949	LRH	La Rochelle-??le de R?? Airport	Europe	FR	France	Nouvelle-Aquitaine	La Rochelle/??le de R??	46.17919922	-1.195279956
2950	LDV	Landivisiau Air Base	Europe	FR	France	Brittany	Landivisiau	48.53030014	-4.151639938
2951	LAI	Lannion-C??te de Granit Airport	Europe	FR	France	Brittany	Lannion	48.754398	-3.47166
2952	LVA	Laval-Entrammes Airport	Europe	FR	France	Pays-de-la-Loire	Laval/Entrammes	48.03139877	-0.7429860234
2953	BAE	Barcelonnette - Saint-Pons Airport	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Le Castellet	44.387198	6.609186
2954	CTT	Le Castellet Airport	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Le Castellet	43.25249863	5.785190105
2955	LEH	Le Havre Octeville Airport	Europe	FR	France	Normandy	Le Havre/Octeville	49.53390121	0.08805599809
2956	LME	Le Mans-Arnage Airport	Europe	FR	France	Pays-de-la-Loire	Le Mans/Arnage	47.94860077	0.2016669959
2957	LPY	Le Puy-Loudes Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Le Puy/Loudes	45.08069992	3.7628901
2958	LTQ	Le Touquet-C??te d'Opale Airport	Europe	FR	France	Hauts-de-France	Le Touquet-Paris-Plage	50.51739883	1.620589972
2959	LSO	Les Sables-d'Olonne Talmont Airport	Europe	FR	France	Pays-de-la-Loire	Les Sables-d'Olonne	46.47689819	-1.722779989
2960	LIL	Lille-Lesquin Airport	Europe	FR	France	Hauts-de-France	Lille/Lesquin	50.563332	3.086886
2961	LIG	Limoges Airport	Europe	FR	France	Nouvelle-Aquitaine	Limoges/Bellegarde	45.8628006	1.179440022
2962	LRT	Lorient South Brittany (Bretagne Sud) Airport	Europe	FR	France	Brittany	Lorient/Lann/Bihou??	47.76060104	-3.440000057
2963	LYS	Lyon Saint-Exup??ry Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Lyon	45.725556	5.081111
2964	LYN	Lyon-Bron Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Lyon/Bron	45.72719955	4.944270134
2965	CQF	Calais-Dunkerque Airport	Europe	FR	France	Hauts-de-France	Marck	50.962101	1.95476
2966	MRS	Marseille Provence Airport	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Marseille	43.43927192	5.221424103
2967	MVV	Meg??ve Altiport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Meg??ve	45.823005	6.649406
2968	MEN	Mende-Brenoux Airfield	Europe	FR	France	Occitanie	Mende/Br??noux	44.502102	3.53282
2969	MFX	M??ribel Altiport	Europe	FR	France	Auvergne-Rh??ne-Alpes	M??ribel Altiport	45.407003	6.577942
2970	HZB	Merville-Calonne Airport	Europe	FR	France	Hauts-de-France	Merville/Calonne	50.61840057	2.642240047
2971	ETZ	Metz-Nancy-Lorraine Airport	Europe	FR	France	Grand Est	Metz / Nancy	48.98210144	6.251319885
2972	SCP	Mont-Dauphin - St-Cr??pin Airfield	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Mont-Dauphin - St-Cr??pin	44.701698	6.60028
2973	MCU	Montlu??on-Gu??ret Airport	Europe	FR	France	Nouvelle-Aquitaine	Montlu??on/Gu??ret	46.22259903	2.363960028
2974	MPL	Montpellier-M??diterran??e Airport	Europe	FR	France	Occitanie	Montpellier/M??diterran??e	43.57619858	3.963010073
2975	MXN	Morlaix-Ploujean Airport	Europe	FR	France	Brittany	Morlaix/Ploujean	48.60319901	-3.815779924
2976	ENC	Nancy-Essey Airport	Europe	FR	France	Grand Est	Nancy/Essey	48.69210052	6.230460167
2977	NTE	Nantes Atlantique Airport	Europe	FR	France	Pays-de-la-Loire	Nantes	47.15319824	-1.610730052
2978	NVS	Nevers-Fourchambault Airport	Europe	FR	France	Bourgogne-Franche-Comt??	Nevers/Fourchambault	47.00260162	3.113329887
2979	NCE	Nice-C??te d'Azur Airport	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Nice	43.65840149	7.215869904
2980	FNI	N??mes-Arles-Camargue Airport	Europe	FR	France	Occitanie	N??mes/Garons	43.75740051	4.416349888
2981	NIT	Niort-Souch?? Airport	Europe	FR	France	Nouvelle-Aquitaine	Niort/Souch??	46.313477	-0.394529
2982	ORE	Orl??ans ??? Saint-Denis-de-l'H??tel Airport	Europe	FR	France	Centre-Val de Loire	Orl??ans	47.8969	2.16333
2983	CDG	Charles de Gaulle International Airport	Europe	FR	France	??le-de-France	Paris	49.012798	2.55
2984	LBG	Paris-Le Bourget Airport	Europe	FR	France	??le-de-France	Paris	48.9693985	2.441390038
2985	ORY	Paris-Orly Airport	Europe	FR	France	??le-de-France	Paris	48.7233333	2.3794444
2986	PUF	Pau Pyr??n??es Airport	Europe	FR	France	Nouvelle-Aquitaine	Pau/Pyr??n??es (Uzein)	43.38000107	-0.41861099
2987	PGX	P??rigueux-Bassillac Airport	Europe	FR	France	Nouvelle-Aquitaine	P??rigueux/Bassillac	45.19810104	0.8155559897
2988	PGF	Perpignan-Rivesaltes (Llaban??re) Airport	Europe	FR	France	Occitanie	Perpignan/Rivesaltes	42.74039841	2.87067008
2989	PIS	Poitiers-Biard Airport	Europe	FR	France	Nouvelle-Aquitaine	Poitiers/Biard	46.58769989	0.3066659868
2990	PRP	Propriano Airport	Europe	FR	France	Corsica	Propriano	41.66059875	8.889749527
2991	UIP	Quimper-Cornouaille Airport	Europe	FR	France	Brittany	Quimper/Pluguffan	47.97499847	-4.167789936
2992	RNS	Rennes-Saint-Jacques Airport	Europe	FR	France	Brittany	Rennes/Saint-Jacques	48.0695	-1.73479
2993	RNE	Roanne-Renaison Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Roanne/Renaison	46.05830002	4.00138998
2994	RCO	Rochefort-Saint-Agnant (BA 721) Airport	Europe	FR	France	Nouvelle-Aquitaine	Rochefort/Saint-Agnant	45.88779831	-0.9830560088
2995	RDZ	Rodez-Marcillac Airport	Europe	FR	France	Occitanie	Rodez/Marcillac	44.40790176	2.482670069
2996	URO	Rouen Airport	Europe	FR	France	Normandy	Rouen/Vall??e de Seine	49.38420105	1.174800038
2997	RYN	Royan-M??dis Airport	Europe	FR	France	Nouvelle-Aquitaine	Royan/M??dis	45.62810135	-0.9725000262
2998	SBK	Saint-Brieuc-Armor Airport	Europe	FR	France	Brittany	Saint-Brieuc/Armor	48.5378	-2.85444
2999	GNB	Grenoble-Is??re Airport	Europe	FR	France	Saint-??tienne-de-Saint-Geoirs	Saint-??tienne-de-Saint-Geoirs	45.3629	5.32937
3000	EBU	Saint-??tienne-Bouth??on Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Saint-??tienne/Bouth??on	45.54059982	4.296390057
3001	SNR	Saint-Nazaire-Montoir Airport	Europe	FR	France	Pays-de-la-Loire	Saint-Nazaire/Montoir	47.3105556	-2.1566667
3002	SYT	Saint-Yan Airport	Europe	FR	France	Bourgogne-Franche-Comt??	Saint-Yan	46.41249847	4.013259888
3003	SOZ	Solenzara (BA 126) Air Base	Europe	FR	France	Corsica	Solenzara	41.92440033	9.406000137
3004	SXB	Strasbourg Airport	Europe	FR	France	Grand Est	Strasbourg	48.53829956	7.628230095
3005	LDE	Tarbes-Lourdes-Pyr??n??es Airport	Europe	FR	France	Occitanie	Tarbes/Lourdes/Pyr??n??es	43.17869949	-0.006438999902
3006	ANE	Angers-Loire Airport	Europe	FR	France	Pays-de-la-Loire	TFFR	47.560299	-0.312222
3007	TLN	Toulon-Hy??res Airport	Europe	FR	France	Provence-Alpes-C??te-d'Azur	Toulon/Hy??res/Le Palyvestre	43.09730148	6.146029949
3008	TLS	Toulouse-Blagnac Airport	Europe	FR	France	Occitanie	Toulouse/Blagnac	43.629101	1.36382
3009	TUF	Tours-Val-de-Loire Airport	Europe	FR	France	Centre-Val de Loire	Tours/Val de Loire (Loire Valley)	47.43220139	0.7276059985
3010	TNF	Toussus-le-Noble Airport	Europe	FR	France	??le-de-France	Toussus-le-Noble	48.75189972	2.106189966
3011	OUI	Ouessant Airport	Europe	FR	France	Brittany	Ushant	48.4632	-5.06358
3012	VAF	Valence-Chabeuil Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Valence/Chabeuil	44.9216	4.9699
3013	VNE	Vannes-Meucon Airport	Europe	FR	France	Brittany	Vannes/Meucon	47.72330093	-2.71855998
3014	XCR	Ch??lons-Vatry Airport	Europe	FR	France	Grand Est	Vatry	48.773333	4.206111
3015	VHY	Vichy-Charmeil Airport	Europe	FR	France	Auvergne-Rh??ne-Alpes	Vichy/Charmeil	46.16970062	3.403739929
3016	VIY	Villacoublay-V??lizy (BA 107) Air Base	Europe	FR	France	??le-de-France	Villacoublay/V??lizy	48.7741667	2.1916667
3017	AAH	Aachen-Merzbr??ck Airport	Europe	DE	Germany	North Rhine-Westphalia	Aachen	50.823055	6.186389
3018	AOC	Altenburg-Nobitz Airport	Europe	DE	Germany	Thuringia	Altenburg	50.981945	12.506389
3019	AGB	Augsburg Airport	Europe	DE	Germany	Bavaria	Augsburg	48.425278	10.931667
3020	FKB	Karlsruhe Baden-Baden Airport	Europe	DE	Germany	Baden-W??rttemberg	Baden-Baden	48.7794	8.0805
3021	BMR	Baltrum Airport	Europe	DE	Germany	Lower Saxony	Baltrum	53.72472382	7.373332977
3022	BBH	Barth Airport	Europe	DE	Germany	Mecklenburg-Vorpommern	Barth	54.338253	12.710515
3023	BYU	Bayreuth Airport	Europe	DE	Germany	Bavaria	Bayreuth	49.985001	11.64
3024	BER	Berlin Brandenburg Airport	Europe	DE	Germany	Brandenburg	Berlin	52.362247	13.500672
3025	BFE	Bielefeld Airport	Europe	DE	Germany	North Rhine-Westphalia	Bielefeld	51.964722	8.544444
3026	BBJ	Bitburg Airport	Europe	DE	Germany	Rhineland-Palatinate	Bitburg	49.945278	6.565
3027	BNJ	Bonn-Hangelar Airport	Europe	DE	Germany	North Rhine-Westphalia	Bonn	50.76889038	7.163332939
3028	BMK	Borkum Airport	Europe	DE	Germany	Lower Saxony	Borkum	53.59639	6.709167
3029	BWE	Braunschweig-Wolfsburg Airport	Europe	DE	Germany	Lower Saxony	Braunschweig	52.319199	10.5561
3030	BRE	Bremen Airport	Europe	DE	Germany	Bremen	Bremen	53.047501	8.78667
3031	HEI	Heide-B??sum Airport	Europe	DE	Germany	Schleswig-Holstein	B??sum	54.15333176	8.901666641
3032	VAC	Varrelbusch Airport	Europe	DE	Germany	Lower Saxony	Cloppenburg	52.908333	8.040556
3033	CGN	Cologne Bonn Airport	Europe	DE	Germany	North Rhine-Westphalia	Cologne	50.86589813	7.142739773
3034	FCN	Nordholz Naval Airbase	Europe	DE	Germany	Lower Saxony	Cuxhaven	53.7677002	8.658499718
3035	DTM	Dortmund Airport	Europe	DE	Germany	North Rhine-Westphalia	Dortmund	51.518299	7.61224
3036	DRS	Dresden Airport	Europe	DE	Germany	Saxony	Dresden	51.134123	13.767831
3037	DUS	D??sseldorf Airport	Europe	DE	Germany	North Rhine-Westphalia	D??sseldorf	51.289501	6.76678
3038	URD	Burg Feuerstein Airport	Europe	DE	Germany	Bavaria	Ebermannstadt	49.79416656	11.13361073
3039	EIB	Eisenach-Kindel Airport	Europe	DE	Germany	Thuringia	Eisenach	50.991604	10.47973
3040	EME	Emden Airport	Europe	DE	Germany	Lower Saxony	Emden	53.391109	7.2275
3041	ERF	Erfurt Airport	Europe	DE	Germany	Thuringia	Erfurt	50.97980118	10.95810032
3042	ESS	Essen M??lheim Airport	Europe	DE	Germany	North Rhine-Westphalia	Essen M??lheim	51.402302	6.93733
3043	FLF	Flensburg-Sch??ferhaus Airport	Europe	DE	Germany	Schleswig-Holstein	Flensburg	54.7733345	9.378889084
3044	FRA	Frankfurt am Main Airport	Europe	DE	Germany	Hesse	Frankfurt am Main	50.036249	8.559294
3045	HHN	Frankfurt-Hahn Airport	Europe	DE	Germany	Rhineland-Palatinate	Frankfurt am Main	49.9487	7.26389
3046	FDH	Friedrichshafen Airport	Europe	DE	Germany	Baden-W??rttemberg	Friedrichshafen	47.67129898	9.511489868
3047	FRZ	Fritzlar Army Airfield	Europe	DE	Germany	Hesse	Fritzlar	51.1146	9.286
3048	GKE	Geilenkirchen Air Base	Europe	DE	Germany	North Rhine-Westphalia	Geilenkirchen	50.9608	6.04242
3049	GHF	Giebelstadt Airport	Europe	DE	Germany	Bavaria	Giebelstadt	49.64805603	9.966388702
3050	HAM	Hamburg Helmut Schmidt Airport	Europe	DE	Germany	Hamburg	Hamburg	53.630402	9.98823
3051	XFW	Hamburg-Finkenwerder Airport	Europe	DE	Germany	Hamburg	Hamburg	53.53527832	9.83555603
3052	HAJ	Hannover Airport	Europe	DE	Germany	Lower Saxony	Hannover	52.46110153	9.685079575
3053	HGL	Helgoland-D??ne Airport	Europe	DE	Germany	Schleswig-Holstein	Helgoland	54.18527985	7.915832996
3054	HDF	Heringsdorf Airport	Europe	DE	Germany	Mecklenburg-Vorpommern	Heringsdorf	53.87870026	14.15229988
3055	HOQ	Hof-Plauen Airport	Europe	DE	Germany	Bavaria	Hof	50.288612	11.856389
3056	QHU	Husum-Schwesing Airport	Europe	DE	Germany	Schleswig-Holstein	Husum	54.50999832	9.138333321
3057	IZE	Itzehoe/Hungriger Wolf Airfield	Europe	DE	Germany	Schleswig-Holstein	Itzehoe	53.992009	9.576409
3058	WBG	Schleswig Air Base	Europe	DE	Germany	Schleswig-Holstein	Jagel	54.459301	9.51633
3059	JUI	Juist Airport	Europe	DE	Germany	Lower Saxony	Juist	53.68111038	7.055832863
3060	KSF	Kassel-Calden Airport	Europe	DE	Germany	Hesse	Kassel	51.417273	9.384967
3061	KEL	Kiel-Holtenau Airport	Europe	DE	Germany	Schleswig-Holstein	Kiel	54.379444	10.145278
3062	KZG	Flugplatz Kitzingen	Europe	DE	Germany	Bavaria	Kitzingen	49.743099	10.2006
3063	KOQ	K??then Airport	Europe	DE	Germany	Saxony-Anhalt	K??then	51.7211113	11.95277786
3064	LHA	Lahr Airport	Europe	DE	Germany	Baden-W??rttemberg	Lahr	48.36930084	7.827720165
3065	LGO	Langeoog Airport	Europe	DE	Germany	Lower Saxony	Langeoog	53.74250031	7.497777939
3066	REB	Rechlin-L??rz Airport	Europe	DE	Germany	Mecklenburg-Vorpommern	L??rz	53.30638886	12.75222206
3067	LEJ	Leipzig/Halle Airport	Europe	DE	Germany	Saxony	Leipzig	51.423889	12.236389
3068	LBC	L??beck Blankensee Airport	Europe	DE	Germany	Schleswig-Holstein	L??beck	53.80540085	10.71920013
3069	CSO	Cochstedt Airport	Europe	DE	Germany	Saxony-Anhalt	Magdeburg	51.85639954	11.42029953
3070	ZMG	Magdeburg "City" Airport	Europe	DE	Germany	Saxony-Anhalt	Magdeburg	52.073612	11.626389
3071	IGS	Ingolstadt Manching Airport	Europe	DE	Germany	Bavaria	Manching	48.71569824	11.5340004
3072	MHG	Mannheim-City Airport	Europe	DE	Germany	Baden-W??rttemberg	Mannheim	49.473057	8.514167
3073	FMM	Memmingen Allgau Airport	Europe	DE	Germany	Bavaria	Memmingen	47.98880005	10.23950005
3074	MGL	M??nchengladbach Airport	Europe	DE	Germany	North Rhine-Westphalia	M??nchengladbach	51.230278	6.504444
3075	MUC	Munich Airport	Europe	DE	Germany	Bavaria	Munich	48.353802	11.7861
3076	FMO	M??nster Osnabr??ck Airport	Europe	DE	Germany	North Rhine-Westphalia	M??nster	52.134602	7.68483
3077	FNB	Neubrandenburg Airport	Europe	DE	Germany	Mecklenburg-Vorpommern	Neubrandenburg	53.6022	13.306
3078	EUM	Neum??nster Airport	Europe	DE	Germany	Schleswig-Holstein	Neum??nster	54.07944489	9.941389084
3079	NOD	Norden-Norddeich Airport	Europe	DE	Germany	Lower Saxony	Norddeich	53.63305664	7.190278053
3080	NRD	Norderney Airport	Europe	DE	Germany	Lower Saxony	Norderney	53.706944	7.23
3081	NUE	Nuremberg Airport	Europe	DE	Germany	Bavaria	Nuremberg	49.498699	11.078056
3082	PAD	Paderborn Lippstadt Airport	Europe	DE	Germany	North Rhine-Westphalia	Paderborn	51.61410141	8.616319656
3083	PEF	Peenem??nde Airport	Europe	DE	Germany	Mecklenburg-Vorpommern	Peenem??nde	54.15777969	13.77444363
3084	RMS	Ramstein Air Base	Europe	DE	Germany	Rhineland-Palatinate	Ramstein	49.436901	7.60028
3085	IES	Riesa-G??hlis Airport	Europe	DE	Germany	Saxony	Riesa	51.29360962	13.35611057
3086	RLG	Rostock-Laage Airport	Europe	DE	Germany	Mecklenburg-Vorpommern	Rostock	53.91820145	12.27830029
3087	GTI	Flugplatz G??ttin / R??gen	Europe	DE	Germany	Mecklenburg-Vorpommern	R??gen	54.383331	13.325556
3088	SCN	Saarbr??cken Airport	Europe	DE	Germany	Saarland	Saarbr??cken	49.21459961	7.109509945
3089	PSH	St. Peter-Ording Airport	Europe	DE	Germany	Schleswig-Holstein	Sankt Peter-Ording	54.30888748	8.686944008
3090	SZW	Schwerin Parchim Airport	Europe	DE	Germany	Mecklenburg-Vorpommern	Schwerin Parchim	53.426998	11.7834
3091	SGE	Siegerland Airport	Europe	DE	Germany	North Rhine-Westphalia	Siegerland	50.70769882	8.082969666
3092	RBM	Straubing Airport	Europe	DE	Germany	Bavaria	Straubing	48.90083313	12.51666737
3093	STR	Stuttgart Airport	Europe	DE	Germany	Baden-W??rttemberg	Stuttgart	48.68989944	9.221960068
3094	SPM	Spangdahlem Air Base	Europe	DE	Germany	Rhineland-Palatinate	Trier	49.97269821	6.692500114
3095	AGE	Wangerooge Airport	Europe	DE	Germany	Lower Saxony	Wangerooge	53.78277969	7.913888931
3096	NRN	Weeze Airport	Europe	DE	Germany	North Rhine-Westphalia	Weeze	51.60240173	6.142169952
3097	OBF	Oberpfaffenhofen Airport	Europe	DE	Germany	Bavaria	We??ling	48.081402	11.2831
3098	GWT	Westerland Sylt Airport	Europe	DE	Germany	Schleswig-Holstein	Westerland	54.91320038	8.340470314
3099	WIE	Wiesbaden Army Airfield	Europe	DE	Germany	Hesse	Wiesbaden	50.04980087	8.325400352
3100	WVN	Wilhelmshaven-Mariensiel Airport	Europe	DE	Germany	Lower Saxony	Wilhelmshaven	53.50222015	8.052222252
3101	OHR	Wyk auf F??hr Airport	Europe	DE	Germany	Schleswig-Holstein	Wyk auf F??hr	54.68444443	8.52833271
3102	ZQW	Zweibr??cken Airport	Europe	DE	Germany	Rhineland-Palatinate	Zweibr??cken	49.2094	7.40056
3103	GIB	Gibraltar Airport	Europe	GI	Gibraltar	Gibraltar	Gibraltar	36.151199	-5.34966
3104	AXD	Alexandroupoli Democritus Airport	Europe	GR	Greece	Eastern Macedonia and Thrace	Alexandroupolis	40.8559	25.956301
3105	PYR	Andravida Air Base	Europe	GR	Greece	Ilia	Andravida	37.9207	21.292601
3106	KSO	Kastoria National Airport Aristotle	Europe	GR	Greece	Kastoria	Argos Orestiko	40.446301	21.2822
3107	JTY	Astypalaia Airport	Europe	GR	Greece	Dodecanese	Astypalaia Island	36.57989883	26.37579918
3108	ATH	Athens Eleftherios Venizelos International Airport	Europe	GR	Greece	Attica	Athens	37.936401	23.9445
3109	JKH	Chios Island National Airport	Europe	GR	Greece	Chios	Chios Island	38.34320068	26.1406002
3110	JSH	Sitia Airport	Europe	GR	Greece	Lasithion	Crete Island	35.21609879	26.10129929
3111	HER	Heraklion International Nikos Kazantzakis Airport	Europe	GR	Greece	Irakleion	Heraklion	35.33969879	25.18029976
3112	JIK	Ikaria Airport	Europe	GR	Greece	Samos	Ikaria Island	37.68270111	26.3470993
3113	IOA	Ioannina Airport	Europe	GR	Greece	Ioannina	Ioannina	39.69639969	20.82250023
3114	KLX	Kalamata Airport	Europe	GR	Greece	Messinia	Kalamata	37.06829834	22.02549934
3115	JKL	Kalymnos Airport	Europe	GR	Greece	Dodecanese	Kalymnos Island	36.9632988	26.94059944
3116	AOK	Karpathos Airport	Europe	GR	Greece	Dodecanese	Karpathos Island	35.42139816	27.14599991
3117	KSJ	Kasos Airport	Europe	GR	Greece	Dodecanese	Kasos Island	35.42139816	26.90999985
3118	KZS	Kastelorizo Airport	Europe	GR	Greece	Dodecanese	Kastelorizo Island	36.14170074	29.57640076
3119	KVA	Kavala Alexander the Great International Airport	Europe	GR	Greece	Eastern Macedonia and Thrace	Kavala	40.9133	24.6192
3120	EFL	Kefallinia Airport	Europe	GR	Greece	Kefallinia	Kefallinia Island	38.12009811	20.50049973
3121	CFU	Ioannis Kapodistrias International Airport	Europe	GR	Greece	Corfu	Kerkyra Island	39.60189819	19.9116993
3122	KIT	Kithira Airport	Europe	GR	Greece	Attica	Kithira Island	36.27429962	23.0170002
3123	KGS	Kos Airport	Europe	GR	Greece	Dodecanese	Kos Island	36.79330063	27.0916996
3124	KZI	Kozani State Airport Filippos	Europe	GR	Greece	Kozani	Kozani	40.286098	21.840799
3125	LRA	Larisa Air Base	Europe	GR	Greece	Larissa	Larisa	39.650253	22.4655
3126	LRS	Leros Airport	Europe	GR	Greece	Dodecanese	Leros Island	37.184898	26.800301
3127	LXS	Limnos Airport	Europe	GR	Greece	Lesbos	Limnos Island	39.917099	25.23629951
3128	MLO	Milos Airport	Europe	GR	Greece	Cyclades	Milos Island	36.696899	24.4769
3129	JMK	Mikonos Airport	Europe	GR	Greece	Cyclades	Mykonos Island	37.43510056	25.34810066
3130	MJT	Mytilene International Airport	Europe	GR	Greece	Lesbos	Mytilene	39.05670166	26.59830093
3131	JNX	Naxos Apollon Airport	Europe	GR	Greece	Cyclades	Naxos	37.0811	25.368099
3132	VOL	Nea Anchialos National Airport	Europe	GR	Greece	Magnesia	Nea Anchialos	39.219601	22.7943
3133	PAS	Paros National Airport	Europe	GR	Greece	Cyclades	Paros	37.020495	25.113195
3134	GPA	Patras Araxos Agamemnon Airport	Europe	GR	Greece	Western Greece	Patras	38.1511	21.4256
3135	PVK	Aktion National Airport	Europe	GR	Greece	Preveza	Preveza/Lefkada	38.92549896	20.76530075
3136	RHO	Diagoras Airport	Europe	GR	Greece	Dodecanese	Rodes Island	36.40539932	28.08620071
3137	SMI	Samos Airport	Europe	GR	Greece	Samos	Samos Island	37.68999863	26.9116993
3138	JTR	Santorini Airport	Europe	GR	Greece	Cyclades	Santorini Island	36.39920044	25.47929955
3139	JSI	Skiathos Island National Airport	Europe	GR	Greece	Magnesia	Skiathos	39.17710114	23.50370026
3140	SKU	Skiros Airport	Europe	GR	Greece	Euboea	Skiros Island	38.96760178	24.48719978
3141	CHQ	Chania International Airport	Europe	GR	Greece	Chania	Souda	35.53170013	24.14970016
3142	SPJ	Sparti Airport	Europe	GR	Greece	Laconia	Sparti	36.97389984	22.52630043
3143	JSY	Syros Airport	Europe	GR	Greece	Cyclades	Syros Island	37.42279816	24.95089912
3144	SKG	Thessaloniki Macedonia International Airport	Europe	GR	Greece	Thessaloniki	Thessaloniki	40.5196991	22.97089958
3145	ZTH	Zakynthos International Airport "Dionysios Solomos"	Europe	GR	Greece	Zakynthos	Zakynthos Island	37.7509	20.8843
3146	ACI	Alderney Airport	Europe	GG	Guernsey	Saint Anne	Saint Anne	49.706104	-2.21472
3147	GCI	Guernsey Airport	Europe	GG	Guernsey	Saint Peter Port	Saint Peter Port	49.435001	-2.60197
3148	BUD	Budapest Liszt Ferenc International Airport	Europe	HU	Hungary	Pest County	Budapest	47.42976	19.261093
3149	DEB	Debrecen International Airport	Europe	HU	Hungary	Hajdu-Bihar County	Debrecen	47.488899	21.615299
3150	MCQ	Miskolc Airport	Europe	HU	Hungary	Borsod-Aba??j-Zempl??n County	Miskolc	48.13603	20.789641
3151	PEV	P??cs-Pog??ny Airport	Europe	HU	Hungary	Baranya County	P??cs-Pog??ny	45.990898	18.240996
3152	SOB	H??v??z???Balaton Airport	Europe	HU	Hungary	Zala County	S??rmell??k	46.686391	17.159084
3153	TZR	Tasz??r Air Base	Europe	HU	Hungary	Somogy County	Tasz??r	46.39310074	17.91749954
3154	AEY	Akureyri Airport	Europe	IS	Iceland	Northeastern Region	Akureyri	65.66000366	-18.0727005
3155	BJD	Bakkafj??r??ur Airport	Europe	IS	Iceland	Northeastern Region	Bakkafj??r??ur	66.02189636	-14.82439995
3156	BIU	Bildudalur Airport	Europe	IS	Iceland	Westfjords	Bildudalur	65.64129639	-23.5461998
3157	BLO	Hjaltabakki Airport	Europe	IS	Iceland	Northwestern Region	Bl??ndu??s	65.64499664	-20.28750038
3158	BGJ	Borgarfj??r??ur eystri Airport	Europe	IS	Iceland	Eastern Region	Borgarfj??r??ur eystri	65.5164032	-13.80500031
3159	BXV	Brei??dalsv??k Airport	Europe	IS	Iceland	Eastern Region	Brei??dalsv??k	64.790037	-14.043927
3160	BQD	B????ardalur Airport	Europe	IS	Iceland	Western Region	B????ardalur	65.07530212	-21.8003006
3161	DJU	Dj??pivogur Airport	Europe	IS	Iceland	Eastern Region	Dj??pivogur	64.642372	-14.277297
3162	EGS	Egilssta??ir Airport	Europe	IS	Iceland	Eastern Region	Egilssta??ir	65.28330231	-14.40139961
3163	FAG	Fagurh??lsm??ri Airport	Europe	IS	Iceland	Eastern Region	Fagurh??lsm??ri	63.87469864	-16.64109993
3164	FAS	F??skr????sfj??r??ur Airport	Europe	IS	Iceland	Eastern Region	F??skr????sfj??r??ur	64.931456	-14.047957
3165	FLI	Holt Airport	Europe	IS	Iceland	Westfjords	Flateyri	66.01418043	-23.4416914
3166	GJR	Gj??gur Airport	Europe	IS	Iceland	Westfjords	Gj??gur	65.99530029	-21.32690048
3167	GRY	Gr??msey Airport	Europe	IS	Iceland	Northeastern Region	Gr??msey	66.5458	-18.0173
3168	GUU	Grundarfj??r??ur Airport	Europe	IS	Iceland	Western Region	Grundarfj??r??ur	64.99140167	-23.22470093
3169	HFN	Hornafj??r??ur Airport	Europe	IS	Iceland	Southern Region	H??fn	64.295601	-15.2272
3170	HVK	H??lmav??k Airport	Europe	IS	Iceland	Westfjords	H??lmav??k	65.70469666	-21.69639969
3171	HZK	H??sav??k Airport	Europe	IS	Iceland	Northeastern Region	H??sav??k	65.952301	-17.426001
3172	HVM	Kr??ksta??armelar Airport	Europe	IS	Iceland	Northwestern Region	Hvammstangi	65.2664032	-20.84690094
3173	IFJ	??safj??r??ur Airport	Europe	IS	Iceland	Westfjords	??safj??r??ur	66.05809784	-23.13529968
3174	OPA	K??pasker Airport	Europe	IS	Iceland	Northeastern Region	K??pasker	66.31079865	-16.4666996
3175	MVA	Reykjahl???? Airport	Europe	IS	Iceland	Northeastern Region	Myvatn	65.65579987	-16.91810036
3176	NOR	Nor??fj??r??ur Airport	Europe	IS	Iceland	Eastern Region	Nor??fj??r??ur	65.13189697	-13.74639988
3177	OFJ	??lafsfj??r??ur Airport	Europe	IS	Iceland	Northeastern Region	??lafsfj??r??ur	66.08329773	-18.66670036
3178	HLO	Ingjaldssan??ur Airport	Europe	IS	Iceland	Westfjords	Onundarfj??r??ur	66.05000305	-23.69610023
3179	PFJ	Patreksfj??r??ur Airport	Europe	IS	Iceland	Westfjords	Patreksfj??r??ur	65.555801	-23.965
3180	RFN	Raufarh??fn Airport	Europe	IS	Iceland	Northeastern Region	Raufarh??fn	66.40640259	-15.91829967
3181	RHA	Reykh??lar Airport	Europe	IS	Iceland	Westfjords	Reykh??lar	65.45262909	-22.20611572
3182	RKV	Reykjavik Airport	Europe	IS	Iceland	Capital Region	Reykjavik	64.12999725	-21.94059944
3183	KEF	Keflavik International Airport	Europe	IS	Iceland	Southern Peninsula	Reykjav??k	63.985001	-22.6056
3184	OLI	Rif Airport	Europe	IS	Iceland	Western Region	Rif	64.91139984	-23.82309914
3185	SAK	Sau????rkr??kur Airport	Europe	IS	Iceland	Northwestern Region	Sau????rkr??kur	65.73169708	-19.57279968
3186	SIJ	Siglufj??r??ur Airport	Europe	IS	Iceland	Northeastern Region	Siglufj??r??ur	66.137847	-18.908157
3187	SYK	Stykkish??lmur Airport	Europe	IS	Iceland	Western Region	Stykkish??lmur	65.05809784	-22.7942009
3188	VEY	Vestmannaeyjar Airport	Europe	IS	Iceland	Southern Region	Vestmannaeyjar	63.42430115	-20.27890015
3189	VPN	Vopnafj??r??ur Airport	Europe	IS	Iceland	Eastern Region	Vopnafj??r??ur	65.72059631	-14.85060024
3190	TEY	??ingeyri Airport	Europe	IS	Iceland	Westfjords	??ingeyri	65.87030029	-23.55999947
3191	THO	????rsh??fn Airport	Europe	IS	Iceland	Northeastern Region	????rsh??fn	66.218498	-15.3356
3192	BYT	Bantry Aerodrome	Europe	IE	Ireland	County Cork	Bantry	51.66859818	-9.48416996
3193	BLY	Belmullet Aerodrome	Europe	IE	Ireland	County Mayo	Belmullet	54.22280121	-10.03079987
3194	NOC	Ireland West Knock Airport	Europe	IE	Ireland	County Mayo	Charlestown	53.910301	-8.81849
3195	ORK	Cork Airport	Europe	IE	Ireland	County Cork	Cork	51.841301	-8.49111
3196	CFN	Donegal Airport	Europe	IE	Ireland	County Donegal	Donegal	55.0442009	-8.340999603
3197	DUB	Dublin Airport	Europe	IE	Ireland	County Dublin	Dublin	53.421299	-6.27007
3198	GWY	Galway Airport	Europe	IE	Ireland	County Galway	Galway	53.30020142	-8.941590309
3199	IIA	Inishmaan Aerodrome	Europe	IE	Ireland	County Galway	Inis Me??in	53.0929985	-9.568059921
3200	IOR	Inishmore Aerodrome	Europe	IE	Ireland	County Galway	Inis M??r	53.1067009	-9.653610229
3201	INQ	Inisheer Aerodrome	Europe	IE	Ireland	County Galway	Inis O??rr	53.064701	-9.5109
3202	NNR	Connemara Regional Airport	Europe	IE	Ireland	County Galway	Inverin	53.2303009	-9.467780113
3203	KKY	Kilkenny Airport	Europe	IE	Ireland	County Kilkenny	Kilkenny	52.6507988	-7.296110153
3204	KIR	Kerry Airport	Europe	IE	Ireland	County Kerry	Killarney	52.180901	-9.52378
3205	LTR	Letterkenny Airfield	Europe	IE	Ireland	County Donegal	Letterkenny	54.951302	-7.67283
3206	SNN	Shannon Airport	Europe	IE	Ireland	County Clare	Shannon	52.702	-8.92482
3207	SXL	Sligo Airport	Europe	IE	Ireland	County Sligo	Sligo	54.28020096	-8.599209785
3208	WAT	Waterford Airport	Europe	IE	Ireland	County Waterford	Waterford	52.18719864	-7.086959839
3209	IOM	Isle of Man Airport	Europe	IM	Isle of Man	Castletown	Castletown	54.083302	-4.62389
3210	ALL	Villanova D'Albenga International Airport	Europe	IT	Italy	Liguria	Albenga (SV)	44.050598	8.12743
3211	AHO	Alghero-Fertilia Airport	Europe	IT	Italy	Sardinia	Alghero	40.632099	8.29077
3212	AOI	Marche Airport	Europe	IT	Italy	Marche	Ancona	43.616299	13.3623
3213	AOT	Aosta Airport	Europe	IT	Italy	Valle d'Aosta	Aosta	45.738499	7.36872
3214	TTB	Tortol?? Airport	Europe	IT	Italy	Sardinia	Arbatax	39.9188	9.68298
3215	AVB	Aviano Air Base	Europe	IT	Italy	Friuli-Venezia Giulia	Aviano (PN)	46.031898	12.596503
3216	BRI	Bari Karol Wojty??a Airport	Europe	IT	Italy	Apulia	Bari	41.138901	16.760599
3217	BLX	Belluno Airport	Europe	IT	Italy	Veneto	Belluno (BL)	46.166549	12.250389
3218	BLQ	Bologna Guglielmo Marconi Airport	Europe	IT	Italy	Emilia-Romagna	Bologna	44.5354	11.2887
3219	BZO	Bolzano Airport	Europe	IT	Italy	Trentino-Alto Adige	Bolzano	46.460201	11.3264
3220	BDS	Brindisi Airport	Europe	IT	Italy	Apulia	Brindisi	40.6576	17.947001
3221	CAG	Cagliari Elmas Airport	Europe	IT	Italy	Sardinia	Cagliari	39.251499	9.05428
3222	CTA	Catania-Fontanarossa Airport	Europe	IT	Italy	Sicily	Catania	37.466801	15.0664
3223	CIY	Comiso Airport	Europe	IT	Italy	Sicily	Comiso	36.994601	14.607182
3224	CRV	Crotone Airport	Europe	IT	Italy	Calabria	Crotone	38.9972	17.0802
3225	CUF	Cuneo International Airport	Europe	IT	Italy	Piedmont	Cuneo	44.547001	7.62322
3226	DCI	Decimomannu Air Base	Europe	IT	Italy	Sardinia	Decimomannu	39.354198	8.97248
3227	FLR	Peretola Airport	Europe	IT	Italy	Tuscany	Firenze	43.810001	11.2051
3228	FOG	Foggia "Gino Lisa" Airport	Europe	IT	Italy	Apulia	Foggia	41.432899	15.535
3229	FRL	Forl?? Airport	Europe	IT	Italy	Emilia-Romagna	Forl?? (FC)	44.194801	12.0701
3230	GOA	Genoa Cristoforo Colombo Airport	Europe	IT	Italy	Liguria	Genova	44.4133	8.8375
3231	GRS	Grosseto Air Base	Europe	IT	Italy	Tuscany	Grosetto	42.759701	11.0719
3232	TAR	Taranto-Grottaglie "Marcello Arlotta" Airport	Europe	IT	Italy	Apulia	Grottaglie	40.517502	17.4032
3233	QAQ	L'Aquila???Preturo Airport	Europe	IT	Italy	Abruzzi	L'Aquila	42.379902	13.3092
3234	SUF	Lamezia Terme Airport	Europe	IT	Italy	Calabria	Lamezia Terme (CZ)	38.905399	16.2423
3235	LMP	Lampedusa Airport	Europe	IT	Italy	Sicily	Lampedusa	35.497898	12.6181
3236	LCC	Lecce Galatina Air Base	Europe	IT	Italy	Apulia	Lecce Galatina	40.239201	18.133301
3237	LCV	Lucca-Tassignano Airport	Europe	IT	Italy	Tuscany	Lucca	43.825825	10.577928
3238	EBA	Marina Di Campo Airport	Europe	IT	Italy	Tuscany	Marina  Di Campo	42.7603	10.2394
3239	MXP	Malpensa International Airport	Europe	IT	Italy	Lombardy	Milan	45.6306	8.72811
3240	BGY	Milan Bergamo Airport	Europe	IT	Italy	Lombardy	Milan	45.673901	9.70417
3241	LIN	Milano Linate Airport	Europe	IT	Italy	Lombardy	Milan	45.445099	9.27674
3242	VBS	Brescia Airport	Europe	IT	Italy	Lombardy	Montichiari (BS)	45.428902	10.3306
3243	NAP	Naples International Airport	Europe	IT	Italy	Campania	N??poli	40.886002	14.2908
3244	OLB	Olbia Costa Smeralda Airport	Europe	IT	Italy	Sardinia	Olbia (SS)	40.898701	9.51763
3245	FNU	Oristano-Fenosu Airport	Europe	IT	Italy	Sardinia	Oristano	39.895308	8.642661
3246	PMO	Falcone???Borsellino Airport	Europe	IT	Italy	Sicily	Palermo	38.175999	13.091
3247	PNL	Pantelleria Airport	Europe	IT	Italy	Sicily	Pantelleria (TP)	36.816502	11.9689
3248	PMF	Parma Airport	Europe	IT	Italy	Emilia-Romagna	Parma	44.824501	10.2964
3249	PEG	Perugia San Francesco d'Assisi ??? Umbria International Airport	Europe	IT	Italy	Umbria	Perugia	43.095901	12.5132
3250	PSR	Abruzzo Airport	Europe	IT	Italy	Abruzzi	Pescara	42.431702	14.1811
3251	PSA	Pisa International Airport	Europe	IT	Italy	Tuscany	Pisa	43.683899	10.3927
3252	RAN	Ravenna Airport	Europe	IT	Italy	Emilia-Romagna	Ravenna	44.36391	12.224978
3253	REG	Reggio Calabria Airport	Europe	IT	Italy	Calabria	Reggio Calabria	38.071201	15.6516
3254	RMI	Federico Fellini International Airport	Europe	IT	Italy	Emilia-Romagna	Rimini	44.020302	12.6117
3255	CIA	Ciampino???G. B. Pastine International Airport	Europe	IT	Italy	Lazio	Rome	41.7994	12.5949
3256	FCO	Rome???Fiumicino Leonardo da Vinci International Airport	Europe	IT	Italy	Lazio	Rome	41.804532	12.251998
3257	QSR	Salerno Costa d'Amalfi Airport	Europe	IT	Italy	Campania	Salerno	40.620399	14.9113
3258	SAY	Siena-Ampugnano Airport	Europe	IT	Italy	Tuscany	Siena	43.256302	11.255
3259	NSY	Sigonella Navy Air Base	Europe	IT	Italy	Sicily	Sigonella (CT)	37.401699	14.9224
3260	TRN	Turin Airport	Europe	IT	Italy	Piedmont	Torino	45.200802	7.64963
3261	TPS	Vincenzo Florio Airport Trapani-Birgi	Europe	IT	Italy	Sicily	Trapani (TP)	37.9114	12.488
3262	TSF	Treviso-Sant'Angelo Airport	Europe	IT	Italy	Veneto	Treviso	45.648399	12.1944
3263	TRS	Trieste???Friuli Venezia Giulia Airport	Europe	IT	Italy	Friuli-Venezia Giulia	Trieste	45.827499	13.4722
3264	UDN	Udine-Campoformido Air Base	Europe	IT	Italy	Friuli-Venezia Giulia	Udine	46.0322	13.1868
3265	VCE	Venice Marco Polo Airport	Europe	IT	Italy	Veneto	Venice	45.505299	12.3519
3266	VRN	Verona-Villafranca Valerio Catullo Airport	Europe	IT	Italy	Veneto	Villafranca di Verona	45.394955	10.887303
3267	JER	Jersey Airport	Europe	JE	Jersey	Saint Helier	Saint Helier	49.207901	-2.195509911
3268	GUW	Atyrau International Airport	Europe	KZ	Kazakhstan	Atyrau Region	Atyrau	47.122559	51.819321
3269	PRN	Pri??tina Adem Jashari International Airport	Europe	XK	Kosovo	Pristina District	Prishtina	42.5728	21.035801
3270	DGP	Daugavpils International Airport	Europe	LV	Latvia	Aug??daugava Municipality	Daugavpils	55.944721	26.665001
3271	LPX	Liep??ja International Airport	Europe	LV	Latvia	South Kurzeme Municipality	Liep??ja	56.51750183	21.09690094
3272	RIX	Riga International Airport	Europe	LV	Latvia	M??rupe Municipality	Riga	56.923599	23.9711
3273	VNT	Ventspils International Airport	Europe	LV	Latvia	Ventspils (city)	Ventspils	57.35779953	21.5442009
3274	KUN	Kaunas International Airport	Europe	LT	Lithuania	Kaunas County	Kaunas	54.96390152	24.08480072
3275	PLQ	Palanga International Airport	Europe	LT	Lithuania	Klaip??da County	Palanga	55.97320175	21.09390068
3276	PNV	Panev????ys Air Base	Europe	LT	Lithuania	Panev????ys County	Panev????ys	55.72940063	24.46080017
3277	SQQ	??iauliai International Airport	Europe	LT	Lithuania	??iauliai County	??iauliai	55.89390182	23.39500046
3278	VNO	Vilnius International Airport	Europe	LT	Lithuania	Vilnius County	Vilnius	54.634102	25.285801
3279	LUX	Luxembourg-Findel International Airport	Europe	LU	Luxembourg	Luxembourg	Luxembourg	49.6233333	6.2044444
3280	MLA	Malta International Airport	Europe	MT	Malta	Luqa	Valletta	35.857498	14.4775
3281	BZY	B??l??i International Airport	Europe	MD	Moldova	R????cani District	B??l??i	47.843056	27.777222
3282	KIV	Chi??in??u International Airport	Europe	MD	Moldova	Chi??in??u (city)	Chi??in??u	46.92770004	28.93099976
3283	IVG	Berane Airport	Europe	ME	Montenegro	Berane Municipality	Berane	42.8390007	19.86199951
3284	TGD	Podgorica Airport / Podgorica Golubovci Airbase	Europe	ME	Montenegro	Podgorica Municipality	Podgorica	42.359402	19.2519
3285	TIV	Tivat Airport	Europe	ME	Montenegro	Tivat Municipality	Tivat	42.40470123	18.72330093
3286	AMS	Amsterdam Airport Schiphol	Europe	NL	Netherlands	Noord-Holland	Amsterdam	52.308601	4.76389
3287	WOE	Woensdrecht Air Base	Europe	NL	Netherlands	Noord-Brabant	Bergen Op Zoom	51.4491	4.34203
3288	GLZ	Gilze Rijen Air Base	Europe	NL	Netherlands	Noord-Brabant	Breda	51.56740189	4.931829929
3289	DHR	De Kooy Airport	Europe	NL	Netherlands	Noord-Holland	Den Helder	52.92340088	4.780620098
3290	EIN	Eindhoven Airport	Europe	NL	Netherlands	Noord-Brabant	Eindhoven	51.45009995	5.374529839
3291	ENS	Twente Airport	Europe	NL	Netherlands	Overijssel	Enschede	52.275833	6.889167
3292	GRQ	Eelde Airport	Europe	NL	Netherlands	Drente	Groningen	53.11970139	6.579440117
3293	LWR	Leeuwarden Air Base	Europe	NL	Netherlands	Friesland	Leeuwarden	53.22859955	5.760560036
3294	LEY	Lelystad Airport	Europe	NL	Netherlands	Flevoland	Lelystad	52.4603	5.52722
3295	MST	Maastricht Aachen Airport	Europe	NL	Netherlands	Limburg	Maastricht	50.911701	5.77014
3296	RTM	Rotterdam The Hague Airport	Europe	NL	Netherlands	Zuid-Holland	Rotterdam	51.956902	4.43722
3297	OHD	Ohrid St. Paul the Apostle Airport	Europe	MK	North Macedonia	Southwestern Statistical Region	Ohrid	41.18	20.7423
3298	SKP	Skopje International Airport	Europe	MK	North Macedonia	Southeastern Statistical Region	Skopje	41.961601	21.621401
3299	AES	??lesund Airport, Vigra	Europe	NO	Norway	M??re og Romsdal	??lesund	62.5625	6.1197
3300	SSJ	Sandnessj??en Airport, Stokka	Europe	NO	Norway	Nordland	Alstahaug	65.956802	12.4689
3301	ALF	Alta Airport	Europe	NO	Norway	Troms og Finnmark	Alta	69.97609711	23.37170029
3302	ANX	And??ya Airport, Andenes	Europe	NO	Norway	Nordland	Andenes	69.292503	16.144199
3303	MOL	Molde Airport, ??r??	Europe	NO	Norway	M??re og Romsdal	??r??	62.744701	7.2625
3304	BJF	B??tsfjord Airport	Europe	NO	Norway	Troms og Finnmark	B??tsfjord	70.60050201	29.69140053
3305	BGO	Bergen Airport, Flesland	Europe	NO	Norway	Vestland	Bergen	60.2934	5.21814
3306	BVG	Berlev??g Airport	Europe	NO	Norway	Troms og Finnmark	Berlev??g	70.871399	29.034201
3307	BOO	Bod?? Airport	Europe	NO	Norway	Nordland	Bod??	67.269203	14.3653
3308	BNN	Br??nn??ysund Airport, Br??nn??y	Europe	NO	Norway	Nordland	Br??nn??y	65.461098	12.2175
3309	DLD	Geilo Airport Dagali	Europe	NO	Norway	Viken	Dagali	60.41730118	8.518349648
3310	EVE	Harstad/Narvik Airport, Evenes	Europe	NO	Norway	Nordland	Evenes	68.49130249	16.67810059
3311	VDB	Fagernes Airport, Leirin	Europe	NO	Norway	Innlandet	Fagernes	61.015598	9.28806
3312	FAN	Lista Airport	Europe	NO	Norway	Agder	Farsund	58.09949875	6.626049995
3313	FRO	Flor?? Airport	Europe	NO	Norway	Vestland	Flor??	61.58359909	5.024720192
3314	FDE	F??rde Airport, Bringeland	Europe	NO	Norway	Vestland	F??rde	61.391102	5.75694
3315	SKE	Skien Airport	Europe	NO	Norway	Vestfold og Telemark	Geiteryggen	59.18500137	9.566940308
3316	SKN	Stokmarknes Airport, Skagen	Europe	NO	Norway	Nordland	Hadsel	68.578827	15.033417
3317	HMR	Hamar Lufthavn, Stavsberg	Europe	NO	Norway	Innlandet	Hamar	60.8181	11.068
3318	HFT	Hammerfest Airport	Europe	NO	Norway	Troms og Finnmark	Hammerfest	70.67970276	23.66860008
3319	HAA	Hasvik Airport	Europe	NO	Norway	Troms og Finnmark	Hasvik	70.48670197	22.13969994
3320	HVG	Honningsv??g Airport, Valan	Europe	NO	Norway	Troms og Finnmark	Honningsv??g	71.009697	25.983601
3321	HAU	Haugesund Airport, Karm??y	Europe	NO	Norway	Rogaland	Karm??y	59.345299	5.20836
3322	KKN	Kirkenes Airport, H??ybuktmoen	Europe	NO	Norway	Troms og Finnmark	Kirkenes	69.7258	29.8913
3323	KRS	Kristiansand Airport, Kjevik	Europe	NO	Norway	Agder	Kjevik	58.204201	8.08537
3324	GLL	Gol Airport	Europe	NO	Norway	Viken	Klanten flyplass	60.791066	9.048672
3325	KSU	Kristiansund Airport, Kvernberget	Europe	NO	Norway	M??re og Romsdal	Kvernberget	63.111801	7.82452
3326	LKL	Lakselv Airport, Banak	Europe	NO	Norway	Troms og Finnmark	Lakselv	70.068802	24.973499
3327	SRP	Stord Airport, S??rstokken	Europe	NO	Norway	Vestland	Leirvik	59.791901	5.34085
3328	LKN	Leknes Airport	Europe	NO	Norway	Nordland	Leknes	68.15249634	13.6093998
3329	LYR	Svalbard Airport, Longyear	Europe	NO	Norway	Svalbard	Longyearbyen	78.24610138	15.46560001
3330	BDU	Bardufoss Airport	Europe	NO	Norway	Troms og Finnmark	M??lselv	69.05580139	18.54039955
3331	MEH	Mehamn Airport	Europe	NO	Norway	Troms og Finnmark	Mehamn	71.02970123	27.82670021
3332	MQN	Mo i Rana Airport, R??ssvoll	Europe	NO	Norway	Nordland	Mo i Rana	66.36389923	14.30140018
3333	MJF	Mosj??en Airport, Kj??rstad	Europe	NO	Norway	Nordland	Mosj??en	65.783997	13.2149
3334	OSY	Namsos Airport	Europe	NO	Norway	Tr??ndelag	Namsos	64.472198	11.5786
3335	NTB	Notodden Airport	Europe	NO	Norway	Vestfold og Telemark	Notodden	59.565701	9.21222
3336	OLA	??rland Airport	Europe	NO	Norway	Tr??ndelag	??rland	63.69889832	9.604000092
3337	HOV	??rsta-Volda Airport, Hovden	Europe	NO	Norway	M??re og Romsdal	??rsta	62.18000031	6.074100018
3338	RYG	Moss Airport, Rygge	Europe	NO	Norway	Viken	Oslo	59.378817	10.785439
3339	OSL	Oslo Airport, Gardermoen	Europe	NO	Norway	Viken	Oslo	60.193901	11.1004
3340	RRS	R??ros Airport	Europe	NO	Norway	Tr??ndelag	R??ros	62.57839966	11.34230042
3341	RVK	R??rvik Airport, Ryum	Europe	NO	Norway	Tr??ndelag	R??rvik	64.83830261	11.14610004
3342	RET	R??st Airport	Europe	NO	Norway	Nordland	R??st	67.52780151	12.10330009
3343	SDN	Sandane Airport, Anda	Europe	NO	Norway	Vestland	Sandane	61.830002	6.10583
3344	SOG	Sogndal Airport, Hauk??sen	Europe	NO	Norway	Vestland	Sogndal	61.156101	7.13778
3345	SOJ	S??rkjosen Airport	Europe	NO	Norway	Troms og Finnmark	S??rkjosen	69.78679657	20.95940018
3346	SVG	Stavanger Airport, Sola	Europe	NO	Norway	Rogaland	Stavanger	58.876701	5.63778
3347	SVJ	Svolv??r Airport, Helle	Europe	NO	Norway	Nordland	Svolv??r	68.243301	14.6692
3348	TRF	Sandefjord Airport, Torp	Europe	NO	Norway	Vestfold og Telemark	Torp	59.18669891	10.25860024
3349	TOS	Troms?? Airport, Langnes	Europe	NO	Norway	Troms og Finnmark	Troms??	69.683296	18.9189
3350	TRD	Trondheim Airport, V??rnes	Europe	NO	Norway	Tr??ndelag	Trondheim	63.457802	10.924
3351	VDS	Vads?? Airport	Europe	NO	Norway	Troms og Finnmark	Vads??	70.06529999	29.84469986
3352	VAW	Vard?? Airport, Svartnes	Europe	NO	Norway	Troms og Finnmark	Vard??	70.35540009	31.04490089
3353	IEG	Zielona G??ra-Babimost Airport	Europe	PL	Poland	Lubusz Voivodeship	Babimost	52.13850021	15.7986002
3354	BZG	Bydgoszcz Ignacy Jan Paderewski Airport	Europe	PL	Poland	Kuyavian-Pomeranian Voivodeship	Bydgoszcz	53.096802	17.977699
3355	CZW	Cz??stochowa-Rudniki	Europe	PL	Poland	Silesian Voivodeship	Cz??stochowa	50.884998	19.2047
3356	GDN	Gda??sk Lech Wa????sa Airport	Europe	PL	Poland	Pomeranian Voivodeship	Gda??sk	54.37760162	18.46619987
3357	SZZ	Szczecin-Goleni??w "Solidarno????" Airport	Europe	PL	Poland	West Pomeranian Voivodeship	Goleniow	53.584702	14.9022
3358	KTW	Katowice International Airport	Europe	PL	Poland	Silesian Voivodeship	Katowice	50.4743	19.08
3359	KRK	Krak??w John Paul II International Airport	Europe	PL	Poland	Lesser Poland Voivodeship	Krak??w	50.077702	19.7848
3360	LCJ	????d?? W??adys??aw Reymont Airport	Europe	PL	Poland	????d?? Voivodeship	????d??	51.72190094	19.3980999
3361	LUZ	Lublin Airport	Europe	PL	Poland	Lublin Voivodeship	Lublin	51.240278	22.713611
3362	SZY	Olsztyn-Mazury Airport	Europe	PL	Poland	Warmian-Masurian Voivodeship	Olsztyn	53.481899	20.9377
3363	POZ	Pozna??-??awica Airport	Europe	PL	Poland	Greater Poland Voivodeship	Pozna??	52.421001	16.8263
3364	RDO	Radom Airport	Europe	PL	Poland	Masovian Voivodeship	Radom	51.389198	21.213301
3365	RZE	Rzesz??w-Jasionka Airport	Europe	PL	Poland	Subcarpathian Voivodeship	Rzesz??w	50.110001	22.018999
3366	WMI	Modlin Airport	Europe	PL	Poland	Masovian Voivodeship	Warsaw	52.451099	20.6518
3367	WAW	Warsaw Chopin Airport	Europe	PL	Poland	Masovian Voivodeship	Warsaw	52.16569901	20.96710014
3368	WRO	Copernicus Wroc??aw Airport	Europe	PL	Poland	Lower Silesian Voivodeship	Wroc??aw	51.102699	16.885799
3369	BYJ	Beja Airport / Airbase	Europe	PT	Portugal	Beja District	Beja	38.078899	-7.9324
3370	BGZ	Braga Municipal Aerodrome	Europe	PT	Portugal	Braga District	Braga	41.58710098	-8.445139885
3371	BGC	Bragan??a Airport	Europe	PT	Portugal	Bragan??a District	Bragan??a	41.8578	-6.70713
3372	CAT	Cascais Airport	Europe	PT	Portugal	Lisbon District	Cascais	38.724998	-9.35523
3373	CHV	Aerodromo de Chaves	Europe	PT	Portugal	Vila Real District	Chaves	41.722356	-7.463064
3374	CVU	Corvo Airport	Europe	PT	Portugal	Autonomous Region of Azores	Corvo	39.671501	-31.1136
3375	FAO	Faro Airport	Europe	PT	Portugal	Faro District	Faro	37.01440048	-7.965909958
3376	FNC	Madeira International Airport Cristiano Ronaldo	Europe	PT	Portugal	Autonomous Region of Madeira	Funchal	32.697899	-16.7745
3377	HOR	Horta Airport	Europe	PT	Portugal	Autonomous Region of Azores	Horta	38.51990128	-28.71590042
3378	LIS	Humberto Delgado Airport (Lisbon Portela Airport)	Europe	PT	Portugal	Lisbon District	Lisbon	38.7813	-9.13592
3379	QLR	Monte Real Air Base	Europe	PT	Portugal	Leiria District	Monte Real	39.828335	-8.8875
3380	PIX	Pico Airport	Europe	PT	Portugal	Autonomous Region of Azores	Pico Island	38.554298	-28.441299
3381	PDL	Jo??o Paulo II Airport	Europe	PT	Portugal	Autonomous Region of Azores	Ponta Delgada	37.74119949	-25.69790077
3382	PRM	Portim??o Airport	Europe	PT	Portugal	Faro District	Portim??o	37.1493	-8.58396
3383	OPO	Francisco de S?? Carneiro Airport	Europe	PT	Portugal	Oporto District	Porto	41.24810028	-8.681389809
3384	TER	Lajes Airport	Europe	PT	Portugal	Autonomous Region of Azores	Praia da Vit??ria	38.761799	-27.090799
3385	GRW	Graciosa Airport	Europe	PT	Portugal	Autonomous Region of Azores	Santa Cruz da Graciosa	39.09220123	-28.02980042
3386	FLW	Flores Airport	Europe	PT	Portugal	Autonomous Region of Azores	Santa Cruz das Flores	39.45529938	-31.13139915
3387	SJZ	S??o Jorge Airport	Europe	PT	Portugal	Autonomous Region of Azores	Velas	38.665501	-28.1758
3388	PXO	Porto Santo Airport	Europe	PT	Portugal	Autonomous Region of Madeira	Vila Baleira	33.07339859	-16.35000038
3389	SMA	Santa Maria Airport	Europe	PT	Portugal	Autonomous Region of Azores	Vila do Porto	36.97140121	-25.17060089
3390	AVR	Alverca Air Base	Europe	PT	Portugal	Lisbon District	Vila Franca de Xira	38.883301	-9.0301
3391	VRL	Vila Real Airport	Europe	PT	Portugal	Vila Real District	Vila Real	41.2743	-7.72047
3392	VSE	Aerodromo Goncalves Lobato (Viseu Airport)	Europe	PT	Portugal	Viseu District	Viseu	40.725498	-7.88899
3393	ARW	Arad International Airport	Europe	RO	Romania	Arad County	Arad	46.17660141	21.26199913
3394	BCM	Bac??u Airport	Europe	RO	Romania	Bac??u County	Bac??u	46.52190018	26.9102993
3395	BAY	Maramure?? International Airport	Europe	RO	Romania	Maramure?? County	Baia Mare	47.660598	23.467252
3396	BBU	B??neasa International Airport	Europe	RO	Romania	Bucharest (municipality)	Bucharest	44.503201	26.1021
3397	OTP	Henri Coand?? International Airport	Europe	RO	Romania	Ilfov County	Bucharest	44.571111	26.085
3398	CSB	Caransebe?? Airport	Europe	RO	Romania	Caras-Severin County	Caransebe??	45.41999817	22.25329971
3399	CLJ	Cluj-Napoca International Airport	Europe	RO	Romania	Cluj County	Cluj-Napoca	46.785198	23.686199
3400	CND	Mihail Kog??lniceanu International Airport	Europe	RO	Romania	Constan??a County	Constan??a	44.36220169	28.48830032
3401	CRA	Craiova Airport	Europe	RO	Romania	Dolj County	Craiova	44.3181	23.888599
3402	IAS	Ia??i Airport	Europe	RO	Romania	Ia??i County	Ia??i	47.180278	27.620833
3403	OMR	Oradea International Airport	Europe	RO	Romania	Bihor County	Oradea	47.02529907	21.90250015
3404	SUJ	Satu Mare Airport	Europe	RO	Romania	Satu Mare County	Satu Mare	47.70330048	22.88570023
3405	SBZ	Sibiu International Airport	Europe	RO	Romania	Sibiu County	Sibiu	45.78559875	24.09129906
3406	SCV	Suceava Stefan cel Mare Airport	Europe	RO	Romania	Suceava County	Suceava	47.6875	26.35409927
3407	TGM	Transilvania T??rgu Mure?? International Airport	Europe	RO	Romania	Mure?? County	T??rgu Mure??	46.46770096	24.41250038
3408	TSR	Timi??oara Traian Vuia Airport	Europe	RO	Romania	Timi?? County	Timi??oara	45.80989838	21.33790016
3409	TCE	Tulcea Danube Delta Airport	Europe	RO	Romania	Tulcea County	Tulcea	45.0625	28.7143
3410	ABA	Abakan International Airport	Europe	RU	Russia	Republic of Khakassia	Abakan	53.740002	91.385002
3411	ACS	Achinsk Airport	Europe	RU	Russia	Krasnoyarsk Krai	Achinsk	56.269185	90.57511
3412	UHS	Aleksandrovsk-Sakhalinskiy Airport	Europe	RU	Russia	Sakhalin Oblast	Aleksandrovsk-Sakhalinskiy	50.878037	142.174682
3413	AEM	Amgu Airport	Europe	RU	Russia	Primorsky Krai	Amgu	45.84126	137.673568
3414	DYR	Ugolny Yuri Ryktheu Airport	Europe	RU	Russia	Chukotka Autonomous Okrug	Anadyr	64.734902	177.740997
3415	PWE	Pevek Airport	Europe	RU	Russia	Chukotka Autonomous Okrug	Apapelgino	69.783302	170.597
3416	KVK	Kirovsk-Apatity Airport	Europe	RU	Russia	Murmansk Oblast	Apatity	67.46330261	33.5882988
3417	ARH	Talagi Airport	Europe	RU	Russia	Arkhangelsk Oblast	Archangelsk	64.60030365	40.71670151
3418	VVO	Vladivostok International Airport	Europe	RU	Russia	Primorsky Krai	Artyom	43.396256	132.148155
3419	ASF	Astrakhan Airport	Europe	RU	Russia	Astrakhan Oblast	Astrakhan	46.28329849	48.00630188
3420	BWO	Balakovo Airport	Europe	RU	Russia	Saratov Oblast	Balakovo	51.85829926	47.74560165
3421	SUK	Sakkyryr Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Batagay-Alyta	67.792	130.394
3422	BGN	Belaya Gora Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Belaya Gora	68.556227	146.22784
3423	EGO	Belgorod International Airport	Europe	RU	Russia	Belgorod Oblast	Belgorod	50.64379883	36.59009933
3424	BCX	Beloretsk Airport	Europe	RU	Russia	Republic of Bashkortostan	Beloretsk	53.938389	58.340113
3425	EYK	Beloyarskiy Airport	Europe	RU	Russia	Khanty-Mansi Autonomous Okrug	Beloyarskiy	63.686901	66.698601
3426	OGZ	Vladikavkaz Beslan International Airport	Europe	RU	Russia	Republic of North Ossetia-Alania	Beslan	43.205101	44.606602
3427	BQG	Bogorodskoye Airport	Europe	RU	Russia	Khabarovsk Krai	Bogorodskoye	52.381041	140.449378
3428	TGP	Podkamennaya Tunguska Airport	Europe	RU	Russia	Krasnoyarsk Krai	Bor	61.589699	89.994003
3429	BVJ	Bovanenkovo Airport	Europe	RU	Russia	Yamalo-Nenets Autonomous Okrug	Bovanenkovo	70.315278	68.333611
3430	BZK	Bryansk Airport	Europe	RU	Russia	Bryansk Oblast	Bryansk	53.214199	34.176399
3431	UUA	Bugulma Airport	Europe	RU	Russia	Republic of Tatarstan	Bugulma	54.63999939	52.80170059
3432	CSY	Cheboksary Airport	Europe	RU	Russia	Chuvash Republic	Cheboksary	56.09030151	47.34730148
3433	CEK	Chelyabinsk Balandino Airport	Europe	RU	Russia	Chelyabinsk Oblast	Chelyabinsk	55.305801	61.5033
3434	ULY	Ulyanovsk East Airport	Europe	RU	Russia	Ulyanovsk Oblast	Cherdakly	54.401001	48.8027
3435	CEE	Cherepovets Airport	Europe	RU	Russia	Vologda Oblast	Cherepovets	59.27360153	38.01580048
3436	HTA	Chita-Kadala International Airport	Europe	RU	Russia	Zabaykalsky Krai	Chita	52.026299	113.306
3437	PVS	Provideniya Bay Airport	Europe	RU	Russia	Chukotka Autonomous Okrug	Chukotka	64.37809753	-173.2429962
3438	DHG	Dalnegorsk Airport	Europe	RU	Russia	Primorsky Krai	Dalnegorsk	44.558748	135.490005
3439	DLR	Dalnerechensk Airport	Europe	RU	Russia	Primorsky Krai	Dalnerechensk	45.877949	133.735822
3440	DPT	Deputatskiy Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Deputatskiy	69.392503	139.890012
3441	ESL	Elista Airport	Europe	RU	Russia	Republic of Kalmykia	Elista	46.37390137	44.33089828
3442	SWV	Severo-Evensk Airport	Europe	RU	Russia	Magadan Oblast	Evensk	61.921786	159.229059
3443	GDZ	Gelendzhik Airport	Europe	RU	Russia	Krasnodar Krai	Gelendzhik	44.58209263	38.01248074
3444	RGK	Gorno-Altaysk Airport	Europe	RU	Russia	Altai Republic	Gorno-Altaysk	51.969204	85.836539
3445	GRV	Grozny Airport	Europe	RU	Russia	Chechen Republic	Grozny	43.388106	45.699772
3446	IRM	Igrim Airport	Europe	RU	Russia	Khanty-Mansi Autonomous Okrug	Igrim	63.200391	64.440136
3447	INA	Inta Airport	Europe	RU	Russia	Komi Republic	Inta	66.053372	60.105786
3448	IKT	Irkutsk International Airport	Europe	RU	Russia	Irkutsk Oblast	Irkutsk	52.268002	104.389
3449	IWA	Ivanovo South Airport	Europe	RU	Russia	Ivanovo Oblast	Ivanovo	56.93939972	40.94079971
3450	IJK	Izhevsk Airport	Europe	RU	Russia	Udmurt Republic	Izhevsk	56.8280983	53.45750046
3451	KGD	Khrabrovo Airport	Europe	RU	Russia	Kaliningrad Oblast	Kaliningrad	54.88999939	20.59259987
3452	KLF	Grabtsevo Airport	Europe	RU	Russia	Kaluga Oblast	Kaluga	54.54999924	36.3666687
3453	KVR	Kavalerovo Airport	Europe	RU	Russia	Primorsky Krai	Kavalerovo	44.2726	135.029
3454	KZN	Kazan International Airport	Europe	RU	Russia	Republic of Tatarstan	Kazan	55.60620117	49.27870178
3455	KPW	Keperveem Airport	Europe	RU	Russia	Chukotka Autonomous Okrug	Keperveem	67.845001	166.139999
3456	KHV	Khabarovsk Novy Airport	Europe	RU	Russia	Khabarovsk Krai	Khabarovsk	48.528338	135.188588
3457	KDY	Typliy Klyuch Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Khandyga	62.78900146	136.8549957
3458	MQJ	Moma Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Khonuu	66.450861	143.261551
3459	KVX	Pobedilovo Airport	Europe	RU	Russia	Kirov Oblast	Kirov	58.503883	49.347831
3460	KMW	Kostroma Sokerkino Airport	Europe	RU	Russia	Kostroma Oblast	Kostroma	57.7969017	41.01940155
3461	KSZ	Kotlas Airport	Europe	RU	Russia	Arkhangelsk Oblast	Kotlas	61.2358017	46.69749832
3462	KRR	Krasnodar Pashkovsky International Airport	Europe	RU	Russia	Krasnodar Krai	Krasnodar	45.03469849	39.17050171
3463	KKQ	Krasnoselkup Airport	Europe	RU	Russia	Yamalo-Nenets Autonomous Okrug	Krasnoselkup	65.717	82.455
3464	KJA	Krasnoyarsk International Airport	Europe	RU	Russia	Krasnoyarsk Krai	Krasnoyarsk	56.173077	92.492437
3465	AAQ	Anapa Vityazevo Airport	Europe	RU	Russia	Krasnodar Krai	Krasnyi Kurgan	45.002102	37.347301
3466	BVV	Burevestnik Airport	Europe	RU	Russia	Sakhalin Oblast	Kurilsk	44.919998	147.621994
3467	ITU	Iturup Airport	Europe	RU	Russia	Sakhalin Oblast	Kurilsk	45.256389	147.95549
3468	URS	Kursk East Airport	Europe	RU	Russia	Kursk Oblast	Kursk	51.75059891	36.29560089
3469	OKT	Oktyabrskiy Airport	Europe	RU	Russia	Republic of Tatarstan	Kzyl-Yar	54.43999863	53.38830185
3470	LDG	Leshukonskoye Airport	Europe	RU	Russia	Arkhangelsk Oblast	Leshukonskoye	64.89600372	45.72299957
3471	LPK	Lipetsk Airport	Europe	RU	Russia	Lipetsk Oblast	Lipetsk	52.70280075	39.53779984
3472	GYG	Magan Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Magan	62.103484	129.545288
3473	GDG	Magdagachi Airport	Europe	RU	Russia	Amur Oblast	Magdagachi	53.472467	125.798094
3474	MQF	Magnitogorsk International Airport	Europe	RU	Russia	Republic of Bashkortostan	Magnitogorsk	53.39310074	58.75569916
3475	MCX	Makhachkala Uytash International Airport	Europe	RU	Russia	Republic of Dagestan	Makhachkala	42.816799	47.652302
3476	KVM	Markovo Airport	Europe	RU	Russia	Chukotka Autonomous Okrug	Markovo	64.665088	170.429782
3477	MRV	Mineralnyye Vody Airport	Europe	RU	Russia	Stavropol Krai	Mineralnyye Vody	44.22510147	43.08190155
3478	CKL	Chkalovskiy Air Base	Europe	RU	Russia	Moscow Oblast	Moscow	55.8783	38.061699
3479	DME	Domodedovo International Airport	Europe	RU	Russia	Moscow Oblast	Moscow	55.40879822	37.90629959
3480	OSF	Ostafyevo International Airport	Europe	RU	Russia	Moscow Oblast	Moscow	55.511667	37.507222
3481	SVO	Sheremetyevo International Airport	Europe	RU	Russia	Moscow Oblast	Moscow	55.972599	37.4146
3482	VKO	Vnukovo International Airport	Europe	RU	Russia	Moscow Oblast	Moscow	55.59149933	37.26150131
3483	ZIA	Zhukovsky International Airport	Europe	RU	Russia	Moscow Oblast	Moscow	55.553299	38.150002
3484	MMK	Murmansk Airport	Europe	RU	Russia	Murmansk Oblast	Murmansk	68.78170013	32.75080109
3485	YMK	Mys Kamenny Airport	Europe	RU	Russia	Yamalo-Nenets Autonomous Okrug	Mys Kamennyi	68.467676	73.596733
3486	NAL	Nalchik Airport	Europe	RU	Russia	Kabardino-Balkar Republic	Nalchik	43.51290131	43.63660049
3487	NNM	Naryan Mar Airport	Europe	RU	Russia	Nenets Autonomous Okrug	Naryan Mar	67.63999939	53.12189865
3488	NEF	Neftekamsk Airport	Europe	RU	Russia	Republic of Bashkortostan	Neftekamsk	56.10689926	54.34719849
3489	NLI	Nikolayevsk-na-Amure Airport	Europe	RU	Russia	Khabarovsk Krai	Nikolayevsk-na-Amure Airport	53.154999	140.649994
3490	NBC	Begishevo Airport	Europe	RU	Russia	Republic of Tatarstan	Nizhnekamsk	55.56470108	52.09249878
3491	GOJ	Nizhny Novgorod Strigino International Airport	Europe	RU	Russia	Nizhny Novgorod Oblast	Nizhny Novgorod	56.23009872	43.7840004
3492	NGK	Nogliki Airport	Europe	RU	Russia	Sakhalin Oblast	Nogliki	51.782337	143.140783
3493	NOZ	Spichenkovo Airport	Europe	RU	Russia	Kemerovo Oblast	Novokuznetsk	53.811401	86.877197
3494	OVB	Novosibirsk Tolmachevo Airport	Europe	RU	Russia	Novosibirsk Oblast	Novosibirsk	55.019756	82.618675
3495	NYA	Nyagan Airport	Europe	RU	Russia	Khanty-Mansi Autonomous Okrug	Nyagan	62.110001	65.614998
3496	NYR	Nyurba Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Nyurba	63.294998	118.336998
3497	OHH	Okha Airport	Europe	RU	Russia	Sakhalin Oblast	Okha	53.517656	142.879772
3498	ONK	Olenyok Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Olenyok	68.514999	112.480003
3499	OLZ	Olyokminsk Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Olyokminsk	60.397499	120.471001
3500	OEL	Oryol Yuzhny Airport	Europe	RU	Russia	Oryol Oblast	Orel	52.93470001	36.00220108
3501	REN	Orenburg Central Airport	Europe	RU	Russia	Orenburg Oblast	Orenburg	51.79579926	55.45669937
3502	PEX	Pechora Airport	Europe	RU	Russia	Komi Republic	Pechora	65.12110138	57.13079834
3503	PEZ	Penza Airport	Europe	RU	Russia	Penza Oblast	Penza	53.11059952	45.02109909
3504	PEE	Perm International Airport	Europe	RU	Russia	Perm Krai	Perm	57.914501	56.021198
3505	PES	Petrozavodsk Airport	Europe	RU	Russia	Republic of Karelia	Petrozavodsk	61.8852005	34.15470123
3506	RZH	Preobrazheniye Airport	Europe	RU	Russia	Primorsky Krai	Preobrazheniye	42.921698	133.904438
3507	PKV	Pskov Airport	Europe	RU	Russia	Pskov Oblast	Pskov	57.78390121	28.39559937
3508	ROV	Platov International Airport	Europe	RU	Russia	Rostov Oblast	Rostov-on-Don	47.493888	39.924722
3509	RZN	Turlatovo Airport	Europe	RU	Russia	Ryazan Oblast	Ryazan	54.55590057	39.85520172
3510	RYB	Staroselye Airport	Europe	RU	Russia	Yaroslavl Oblast	Rybinsk	58.10419846	38.9294014
3511	SBT	Sabetta International Airport	Europe	RU	Russia	Yamalo-Nenets Autonomous Okrug	Sabetta	71.219167	72.052222
3512	KUF	Kurumoch International Airport	Europe	RU	Russia	Samara Oblast	Samara	53.50490189	50.16429901
3513	SKX	Saransk Airport	Europe	RU	Russia	Republic of Mordovia	Saransk	54.1251297	45.21225739
3514	GSV	Gagarin International Airport	Europe	RU	Russia	Saratov Oblast	Saratov	51.712778	46.171111
3515	SYS	Saskylakh Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Saskylakh	71.927902	114.080002
3516	EKS	Shakhtyorsk Airport	Europe	RU	Russia	Sakhalin Oblast	Shakhtyorsk	49.1903	142.082993
3517	LNX	Smolensk North Airport	Europe	RU	Russia	Smolensk Oblast	Smolensk	54.824	32.025
3518	AER	Sochi International Airport	Europe	RU	Russia	Krasnodar Krai	Sochi	43.449902	39.9566
3519	CSH	Solovki Airport	Europe	RU	Russia	Arkhangelsk Oblast	Solovetsky Islands	65.02999878	35.73333359
3520	GVN	Sovetskaya Gavan (Maygatka) Airport	Europe	RU	Russia	Khabarovsk Krai	Sovetskaya Gavan	48.925067	140.035348
3521	SEK	Srednekolymsk Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Srednekolymsk	67.4805	153.7364
3522	LED	Pulkovo Airport	Europe	RU	Russia	Saint Petersburg (city)	St. Petersburg	59.8003006	30.26250076
3523	STW	Stavropol Shpakovskoye Airport	Europe	RU	Russia	Stavropol Krai	Stavropol	45.10919952	42.1128006
3524	IGT	Magas Airport	Europe	RU	Russia	Republic of Ingushetia	Sunzha	43.323268	45.012568
3525	ETL	Svetlaya Airport	Europe	RU	Russia	Primorsky Krai	Svetlaya	46.541704	138.321703
3526	SCW	Syktyvkar Airport	Europe	RU	Russia	Komi Republic	Syktyvkar	61.64699936	50.8451004
3527	TGK	Taganrog Yuzhny Airport	Europe	RU	Russia	Rostov Oblast	Taganrog	47.1983333	38.8491667
3528	TLK	Talakan Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Talakan Oil Field	59.876389	111.044444
3529	TBW	Donskoye Airport	Europe	RU	Russia	Tambov Oblast	Tambov	52.80609894	41.48279953
3530	TQL	Tarko-Sale Airport	Europe	RU	Russia	Yamalo-Nenets Autonomous Okrug	Tarko-Sale	64.930485	77.811295
3531	NEI	Terney Airport	Europe	RU	Russia	Primorsky Krai	Terney	45.0825	136.5912
3532	RMZ	Remezov Airport	Europe	RU	Russia	Tyumen Oblast	Tobolsk	58.058466	68.343392
3533	TYA	Klokovo Airfield	Europe	RU	Russia	Tula Oblast	Tula	54.239	37.6
3534	IAR	Tunoshna Airport	Europe	RU	Russia	Yaroslavl Oblast	Tunoshna	57.560699	40.157398
3535	KLD	Migalovo Air Base	Europe	RU	Russia	Tver Oblast	Tver	56.8246994	35.75770187
3536	TYD	Tynda Airport	Europe	RU	Russia	Amur Oblast	Tynda	55.284199	124.778999
3537	UFA	Ufa International Airport	Europe	RU	Russia	Republic of Bashkortostan	Ufa	54.55749893	55.87440109
3538	UCT	Ukhta Airport	Europe	RU	Russia	Komi Republic	Ukhta	63.56689835	53.80469894
3539	UUD	Baikal International Airport	Europe	RU	Russia	Republic of Buryat	Ulan Ude	51.808614	107.439652
3540	ULV	Ulyanovsk Baratayevka Airport	Europe	RU	Russia	Ulyanovsk Oblast	Ulyanovsk	54.268299	48.2267
3541	UEN	Urengoy Airport	Europe	RU	Russia	Yamalo-Nenets Autonomous Okrug	Urengoy	65.95999908	78.43699646
3542	USK	Usinsk Airport	Europe	RU	Russia	Komi Republic	Usinsk	66.00469971	57.36719894
3543	UKG	Ust-Kuyga Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Ust-Kuyga	70.011002	135.645004
3544	UMS	Ust-Maya Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Ust-Maya	60.35699844	134.4349976
3545	USR	Ust-Nera Airport	Europe	RU	Russia	Sakha (Yakutia) Republic	Ust-Nera	64.55000305	143.1150055
3546	UTS	Ust-Tsylma Airport	Europe	RU	Russia	Komi Republic	Ust-Tsylma	65.43729401	52.20033646
3547	VRI	Varandey Airport	Europe	RU	Russia	Nenets Autonomous Okrug	Varandey	68.848503	58.201401
3548	VUS	Velikiy Ustyug Airport	Europe	RU	Russia	Vologda Oblast	Velikiy Ustyug	60.78829956	46.25999832
3549	VLU	Velikiye Luki Airport	Europe	RU	Russia	Pskov Oblast	Velikiye Luki	56.3810997	30.60810089
3550	VOG	Volgograd International Airport	Europe	RU	Russia	Volgograd Oblast	Volgograd	48.78250122	44.34550095
3551	VGD	Vologda Airport	Europe	RU	Russia	Vologda Oblast	Vologda	59.28250122	39.94440079
3552	VOZ	Voronezh International Airport	Europe	RU	Russia	Voronezh Oblast	Voronezh	51.81420135	39.229599
3553	EDN	Yedinka Airport	Europe	RU	Russia	Primorsky Krai	Yedinka	47.178201	138.657357
3554	EIK	Yeysk Airport	Europe	RU	Russia	Krasnodar Krai	Yeysk	46.68	38.21
3555	JOK	Yoshkar-Ola Airport	Europe	RU	Russia	Mari El Republic	Yoshkar-Ola	56.70059967	47.90470123
3556	DEE	Yuzhno-Kurilsk Mendeleyevo Airport	Europe	RU	Russia	Sakhalin Oblast	Yuzhno-Kurilsk	43.961066	145.684977
3557	UUS	Yuzhno-Sakhalinsk Airport	Europe	RU	Russia	Sakhalin Oblast	Yuzhno-Sakhalinsk	46.885461	142.717466
3558	BJY	Batajnica Air Base	Europe	RS	Serbia	Srem District	Batajnica	44.935299	20.2575
3559	BEG	Belgrade Nikola Tesla Airport	Europe	RS	Serbia	Beograd (city)	Belgrade	44.81840134	20.3090992
3560	KVO	Morava Airport	Europe	RS	Serbia	Ra??ka District	Kraljevo	43.818298	20.5872
3561	INI	Nis Airport	Europe	RS	Serbia	Ni??ava District	Nis	43.337299	21.853701
3562	UZC	Ponikve Airport	Europe	RS	Serbia	Zlatibor District	U??ice	43.898899	19.697701
3563	BTS	M. R. ??tef??nik Airport	Europe	SK	Slovakia	Bratislava Region	Bratislava	48.17020035	17.21269989
3564	KSC	Ko??ice Airport	Europe	SK	Slovakia	Ko??ice Region	Ko??ice	48.6631012	21.24110031
3565	LUE	Lu??enec Airport	Europe	SK	Slovakia	Bansk?? Bystrica Region	Lu??enec	48.33940125	19.73579979
3566	PZY	Pie????any Airport	Europe	SK	Slovakia	Trnava Region	Pie????any	48.62519836	17.82839966
3567	TAT	Poprad-Tatry Airport	Europe	SK	Slovakia	Pre??ov Region	Poprad	49.073601	20.2411
3568	POV	Pre??ov Air Base	Europe	SK	Slovakia	Pre??ov Region	Pre??ov	49.02970123	21.31559944
3569	SLD	Slia?? Airport	Europe	SK	Slovakia	Bansk?? Bystrica Region	Slia??	48.63779831	19.13409996
3570	ILZ	??ilina Airport	Europe	SK	Slovakia	??ilina Region	??ilina	49.231499	18.613501
3571	LJU	Ljubljana Jo??e Pu??nik Airport	Europe	SI	Slovenia	Ljubljana	Ljubljana	46.223701	14.4576
3572	MBX	Maribor Airport	Europe	SI	Slovenia	Maribor	Maribor	46.4799	15.6861
3573	POW	Portoro?? Airport	Europe	SI	Slovenia	Piran	Portoro??	45.4734	13.615
3574	GMZ	La Gomera Airport	Europe	ES	Spain	Canary Islands	Alajero, La Gomera Island	28.0296	-17.2146
3575	VIT	Vitoria Airport	Europe	ES	Spain	Basque Country	Alava	42.882801	-2.72447
3576	ABC	Albacete Airport / Los Llanos Air Base	Europe	ES	Spain	Albacete	Albacete	38.948502	-1.86352
3577	ALC	Alicante-Elche Miguel Hern??ndez Airport	Europe	ES	Spain	Valencia	Alicante	38.2822	-0.558156
3578	LEI	Almer??a Airport	Europe	ES	Spain	Andaluc??a	Almer??a	36.843899	-2.3701
3579	BJZ	Badajoz Airport	Europe	ES	Spain	Extremadura	Badajoz	38.8913	-6.82133
3580	BCN	Josep Tarradellas Barcelona-El Prat Airport	Europe	ES	Spain	Catalonia	Barcelona	41.2971	2.07846
3581	BIO	Bilbao Airport	Europe	ES	Spain	Basque Country	Bilbao	43.301102	-2.91061
3582	RGS	Burgos Airport	Europe	ES	Spain	Castilla y Le??n	Burgos	42.357601	-3.62076
3583	CDT	Castell??n-Costa Azahar Airport	Europe	ES	Spain	Castell??n	Castell??n de la Plana	40.213889	0.073333
3584	CQM	Ciudad Real International Airport	Europe	ES	Spain	Ciudad Real	Ciudad Real	38.856479	-3.969944
3585	ODB	C??rdoba Airport	Europe	ES	Spain	Andaluc??a	C??rdoba	37.841999	-4.84888
3586	RMU	Regi??n de Murcia International Airport	Europe	ES	Spain	Murcia	Corvera	37.803	-1.125
3587	LCG	A Coru??a Airport	Europe	ES	Spain	Galicia	Culleredo	43.302101	-8.37726
3588	VDE	El Hierro Airport	Europe	ES	Spain	Canary Islands	El Hierro Island	27.8148	-17.8871
3589	FUE	Fuerteventura Airport	Europe	ES	Spain	Canary Islands	Fuerteventura Island	28.4527	-13.8638
3590	GRO	Girona-Costa Brava Airport	Europe	ES	Spain	Girona	Girona	41.901001	2.76055
3591	LPA	Gran Canaria Airport	Europe	ES	Spain	Canary Islands	Gran Canaria Island	27.9319	-15.3866
3592	GRX	F.G.L. Airport Granada-Ja??n Airport	Europe	ES	Spain	Andaluc??a	Granada	37.188702	-3.77736
3593	EAS	San Sebasti??n Airport	Europe	ES	Spain	Basque Country	Hondarribia	43.356499	-1.79061
3594	IBZ	Ibiza Airport	Europe	ES	Spain	Baleares	Ibiza	38.872898	1.37312
3595	XRY	Jerez Airport	Europe	ES	Spain	Andaluc??a	Jerez de la Frontera	36.744598	-6.06011
3596	LEU	Pirineus - la Seu d'Urgel Airport	Europe	ES	Spain	Catalonia	La Seu d'Urgell Pyrenees and Andorra	42.3386	1.40917
3597	ACE	C??sar Manrique-Lanzarote Airport	Europe	ES	Spain	Canary Islands	Lanzarote Island	28.945499	-13.6052
3598	LEN	Le??n Airport	Europe	ES	Spain	Castilla y Le??n	Le??n	42.589001	-5.65556
3599	ILD	Lleida-Alguaire Airport	Europe	ES	Spain	Catalonia	Lleida	41.728185	0.535023
3600	RJL	Logro??o-Agoncillo Airport	Europe	ES	Spain	La Rioja	Logro??o	42.460953	-2.322235
3601	MAD	Adolfo Su??rez Madrid???Barajas Airport	Europe	ES	Spain	Madrid	Madrid	40.471926	-3.56264
3602	ECV	Madrid-Cuatro Vientos Airport	Europe	ES	Spain	Madrid	Madrid	40.370701	-3.78514
3603	TOJ	Madrid???Torrej??n Airport / Torrej??n Air Base	Europe	ES	Spain	Madrid	Madrid	40.487875	-3.456808
3604	AGP	M??laga-Costa del Sol Airport	Europe	ES	Spain	Andaluc??a	M??laga	36.6749	-4.49911
3605	MLN	Melilla Airport	Europe	ES	Spain	Melilla	Melilla	35.2798	-2.95626
3606	MAH	Menorca Airport	Europe	ES	Spain	Baleares	Menorca Island	39.862598	4.21865
3607	HSK	Huesca-Pirineos Airport	Europe	ES	Spain	Arag??n	Monflorite/Alcal?? del Obispo	42.076099	-0.316667
3608	OZP	Moron Air Base	Europe	ES	Spain	Andaluc??a	Mor??n	37.17490005	-5.615940094
3609	PMI	Palma de Mallorca Airport	Europe	ES	Spain	Baleares	Palma De Mallorca	39.551701	2.73881
3610	PNA	Pamplona Airport	Europe	ES	Spain	Navarra	Pamplona	42.77	-1.64633
3611	OVD	Asturias Airport	Europe	ES	Spain	Asturias	Ran??n	43.563599	-6.03462
3612	REU	Reus Airport	Europe	ES	Spain	Catalonia	Reus	41.1474	1.16717
3613	ROZ	Rota Naval Station Airport	Europe	ES	Spain	Andaluc??a	Rota	36.64519882	-6.349460125
3614	QSA	Sabadell Airfield	Europe	ES	Spain	Catalonia	Sabadell	41.520901	2.10508
3615	SLM	Salamanca Airport	Europe	ES	Spain	Castilla y Le??n	Salamanca	40.952099	-5.50199
3616	MJV	San Javier Airport	Europe	ES	Spain	Murcia	San Javier	37.775002	-0.812389
3617	SDR	Seve Ballesteros-Santander Airport	Europe	ES	Spain	Cantabria	Santander	43.427101	-3.82001
3618	SCQ	Santiago-Rosal??a de Castro Airport	Europe	ES	Spain	Galicia	Santiago de Compostela	42.896301	-8.41514
3619	SVQ	Sevilla Airport	Europe	ES	Spain	Andaluc??a	Sevilla	37.417999	-5.89311
3620	SPC	La Palma Airport	Europe	ES	Spain	Canary Islands	Sta Cruz de la Palma, La Palma Island	28.626499	-17.7556
3621	TFN	Tenerife Norte-Ciudad de La Laguna Airport	Europe	ES	Spain	Canary Islands	Tenerife	28.4827	-16.341499
3622	TFS	Tenerife Sur Airport	Europe	ES	Spain	Canary Islands	Tenerife	28.0445	-16.5725
3623	TEV	Teruel Airport	Europe	ES	Spain	Arag??n	Teruel	40.403	-1.2183
3624	VLC	Valencia Airport	Europe	ES	Spain	Valencia	Valencia	39.4893	-0.481625
3625	VLL	Valladolid Airport	Europe	ES	Spain	Castilla y Le??n	Valladolid	41.7061	-4.85194
3626	VGO	Vigo Airport	Europe	ES	Spain	Galicia	Vigo	42.2318	-8.62677
3627	ZAZ	Zaragoza Airport	Europe	ES	Spain	Arag??n	Zaragoza	41.666199	-1.04155
3628	AGH	??ngelholm-Helsingborg Airport	Europe	SE	Sweden	Sk??ne l??n	??ngelholm	56.29610062	12.84710026
3629	AJR	Arvidsjaur Airport	Europe	SE	Sweden	Norrbottena l??n	Arvidsjaur	65.59030151	19.28190041
3630	BLE	Dala Airport	Europe	SE	Sweden	Dalarnas l??n	Borlange	60.422001	15.5152
3631	EKT	Eskilstuna Airport	Europe	SE	Sweden	S??dermanlands l??n	Eskilstuna	59.35110092	16.70840073
3632	GEV	G??llivare Airport	Europe	SE	Sweden	Norrbottena l??n	G??llivare	67.13240051	20.81459999
3633	GVX	G??vle Sandviken Airport	Europe	SE	Sweden	G??vleborge l??n	G??vle / Sandviken	60.59329987	16.95140076
3634	GSE	Gothenburg City Airport	Europe	SE	Sweden	V??stra G??talands l??n	Gothenburg	57.7747	11.8704
3635	GOT	Gothenburg-Landvetter Airport	Europe	SE	Sweden	V??stra G??talands l??n	Gothenburg	57.66279984	12.27980042
3636	HAD	Halmstad Airport	Europe	SE	Sweden	Hallands l??n	Halmstad	56.69110107	12.82019997
3637	HMV	Hemavan Airport	Europe	SE	Sweden	V??sterbottens l??n	Hemavan	65.806099	15.0828
3638	HLF	Hultsfred Airport	Europe	SE	Sweden	Kalmar l??n	Hultsfred	57.525799	15.8233
3639	IDB	Idre Airport	Europe	SE	Sweden	Dalarnas l??n	Idre	61.86970139	12.68939972
3640	JKG	J??nk??ping Airport	Europe	SE	Sweden	J??nk??pings l??n	J??nk??ping	57.75759888	14.06869984
3641	KLR	Kalmar Airport	Europe	SE	Sweden	Kalmar l??n	Kalmar	56.685501	16.2876
3642	KSK	Karlskoga Airport	Europe	SE	Sweden	??rebro l??n	Karlskoga	59.34590149	14.49590015
3643	KSD	Karlstad Airport	Europe	SE	Sweden	V??rmlanda l??n	Karlstad	59.44469833	13.33740044
3644	KRN	Kiruna Airport	Europe	SE	Sweden	Norrbottena l??n	Kiruna	67.8219986	20.33679962
3645	KID	Kristianstad Airport	Europe	SE	Sweden	Sk??ne l??n	Kristianstad	55.92169952	14.08549976
3646	LDK	Lidk??ping-Hovby Airport	Europe	SE	Sweden	V??stra G??talands l??n	Lidk??ping	58.4655	13.1744
3647	LPI	Link??ping City Airport	Europe	SE	Sweden	??sterg??tlands l??n	Link??ping	58.40620041	15.68050003
3648	LLA	Lule?? Airport	Europe	SE	Sweden	Norrbottena l??n	Lule??	65.5438	22.122
3649	LYC	Lycksele Airport	Europe	SE	Sweden	V??sterbottens l??n	Lycksele	64.548302	18.7162
3650	MMX	Malm?? Sturup Airport	Europe	SE	Sweden	Sk??ne l??n	Malm??	55.536305	13.376198
3651	MXX	Mora Airport	Europe	SE	Sweden	Dalarnas l??n	Mora	60.957901	14.5114
3652	NRK	Norrk??ping Airport	Europe	SE	Sweden	??sterg??tlands l??n	Norrk??ping	58.5862999	16.25060081
3653	KRF	Kramfors-Sollefte?? H??ga Kusten Airport	Europe	SE	Sweden	V??sternorrlands l??n	Nyland	63.048599	17.7689
3654	ORB	??rebro Airport	Europe	SE	Sweden	??rebro l??n	??rebro	59.22370148	15.03800011
3655	OER	??rnsk??ldsvik Airport	Europe	SE	Sweden	V??sternorrlands l??n	??rnsk??ldsvik	63.40829849	18.98999977
3656	OSK	Oskarshamn Airport	Europe	SE	Sweden	Kalmar l??n	Oskarshamn	57.350498	16.497999
3657	OSD	??re ??stersund Airport	Europe	SE	Sweden	J??mtlande l??n	??stersund	63.19440079	14.50030041
3658	PJA	Pajala Airport	Europe	SE	Sweden	Norrbottena l??n	Pajala	67.24559784	23.06889915
3659	HFS	Hagfors Airport	Europe	SE	Sweden	V??rmlanda l??n	R??da	60.0201	13.5789
3660	RNB	Ronneby Airport	Europe	SE	Sweden	Blekinge l??n	Ronneby	56.266701	15.265
3661	SCR	Scandinavian Mountains Airport	Europe	SE	Sweden	Dalarnas l??n	S??len / Trysil	61.158393	12.842503
3662	SFT	Skellefte?? Airport	Europe	SE	Sweden	V??sterbottens l??n	Skellefte??	64.62480164	21.07690048
3663	KVB	Sk??vde Airport	Europe	SE	Sweden	V??stra G??talands l??n	Sk??vde	58.45640182	13.97270012
3664	SOO	S??derhamn Airport	Europe	SE	Sweden	G??vleborge l??n	S??derhamn	61.26150131	17.09910011
3665	NYO	Stockholm Skavsta Airport	Europe	SE	Sweden	S??dermanlands l??n	Stockholm	58.788601	16.912201
3666	ARN	Stockholm-Arlanda Airport	Europe	SE	Sweden	Stockholms l??n	Stockholm	59.65190125	17.91860008
3667	BMA	Stockholm-Bromma Airport	Europe	SE	Sweden	Stockholms l??n	Stockholm	59.35440063	17.94169998
3668	VST	Stockholm V??ster??s Airport	Europe	SE	Sweden	V??stmanlanda l??n	Stockholm / V??ster??s	59.58940125	16.63360023
3669	SQO	Storuman Airport	Europe	SE	Sweden	V??sterbottens l??n	Storuman	64.960899	17.6966
3670	SDL	Sundsvall-H??rn??sand Airport	Europe	SE	Sweden	V??sternorrlands l??n	Sundsvall/ H??rn??sand	62.52809906	17.44389915
3671	EVG	Sveg Airport	Europe	SE	Sweden	J??mtlande l??n	Sveg	62.047798	14.4229
3672	TYF	Torsby Airport	Europe	SE	Sweden	V??rmlanda l??n	Torsby	60.1576	12.9913
3673	THN	Trollh??ttan-V??nersborg Airport	Europe	SE	Sweden	V??stra G??talands l??n	Trollh??ttan	58.31809998	12.34500027
3674	UME	Ume?? Airport	Europe	SE	Sweden	V??sterbottens l??n	Ume??	63.79180145	20.28280067
3675	VVK	V??stervik Airport	Europe	SE	Sweden	Kalmar l??n	V??stervik	57.779999	16.5236
3676	VXO	V??xj?? Kronoberg Airport	Europe	SE	Sweden	Kronoberge l??n	V??xj??	56.92910004	14.72799969
3677	VHM	Vilhelmina South Lapland Airport	Europe	SE	Sweden	V??sterbottens l??n	Vilhelmina	64.579102	16.833599
3678	VBY	Visby Airport	Europe	SE	Sweden	Gotlands l??n	Visby	57.66279984	18.34620094
3679	ACH	St Gallen Altenrhein Airport	Europe	CH	Switzerland	Canton of St. Gallen	Altenrhein	47.485001	9.56077
3680	BRN	Bern Belp Airport	Europe	CH	Switzerland	Canton of Berne	Bern	46.91410065	7.497149944
3681	BXO	Buochs Airport	Europe	CH	Switzerland	Canton of Nidwalden	Buochs	46.974444	8.396944
3682	EML	Emmen Air Base	Europe	CH	Switzerland	Canton of Lucerne	Emmen	47.092444	8.305184
3683	GVA	Geneva Cointrin International Airport	Europe	CH	Switzerland	Canton of Geneva	Geneva	46.23809814	6.108950138
3684	ZHI	Grenchen Airport	Europe	CH	Switzerland	Canton of Solothurn	Grenchen	47.181599	7.41719
3685	ZJI	Locarno Airport	Europe	CH	Switzerland	Canton of Ticino	Locarno	46.16080093	8.878609657
3686	LUG	Lugano Airport	Europe	CH	Switzerland	Canton of Ticino	Lugano	46.00429916	8.910579681
3687	SMV	Samedan Airport	Europe	CH	Switzerland	Canton of Grisons	Samedan	46.53409958	9.884110451
3688	SIR	Sion Airport	Europe	CH	Switzerland	Canton of Valais	Sion	46.219166	7.326944
3689	ZRH	Z??rich Airport	Europe	CH	Switzerland	Canton of Zurich	Zurich	47.458056	8.548056
3690	IST	??stanbul Airport	Europe	TR	Turkey	??stanbul Province	Arnavutk??y, Istanbul	41.261297	28.741951
3691	ISL	??stanbul Atat??rk Airport	Europe	TR	Turkey	??stanbul Province	Bak??rk??y, Istanbul	40.971913	28.823714
3692	TEQ	Tekirda?? ??orlu Airport	Europe	TR	Turkey	Tekirda?? Province	??orlu	41.13819885	27.91909981
3693	GKD	G??k??eada Airport	Europe	TR	Turkey	??anakkale Province	G??k??eada	40.204498	25.883302
3694	CKC	Cherkasy International Airport	Europe	UA	Ukraine	Cherkasy Oblast	Cherkasy	49.41559982	31.99530029
3695	CWC	Chernivtsi International Airport	Europe	UA	Ukraine	Chernivtsi Oblast	Chernivtsi	48.25930023	25.98080063
3696	DNK	Dnipropetrovsk International Airport	Europe	UA	Ukraine	Dnipropetrovsk Oblast	Dnipropetrovsk	48.35720062	35.1006012
3697	IFO	Ivano-Frankivsk International Airport	Europe	UA	Ukraine	Ivano-Frankivsk Oblast	Ivano-Frankivsk	48.88420105	24.68610001
3698	KHC	Kerch Airport	Europe	UA	Ukraine	Crimea (autonomous republic)	Kerch	45.37250137	36.40140152
3699	HRK	Kharkiv International Airport	Europe	UA	Ukraine	Kharkiv Oblast	Kharkiv	49.924801	36.290001
3700	KHE	Kherson International Airport	Europe	UA	Ukraine	Kherson Oblast	Kherson	46.6758	32.506401
3701	HMJ	Khmelnytskyi Airport	Europe	UA	Ukraine	Khmelnytskyi Oblast	Khmelnytskyi	49.359699	26.933399
3702	KBP	Boryspil International Airport	Europe	UA	Ukraine	Kiev Oblast	Kiev	50.34500122	30.8946991
3703	GML	Hostomel Airport	Europe	UA	Ukraine	Kiev Oblast	Kiev	50.6035	30.1919
3704	IEV	Kiev Zhuliany International Airport	Europe	UA	Ukraine	Kiev Oblast	Kiev	50.40194	30.45194
3705	KGO	Kirovograd Airport	Europe	UA	Ukraine	Kirovohrad Oblast	Kirovograd	48.5428009	32.28499985
3706	KRQ	Kramatorsk Airport	Europe	UA	Ukraine	Donetsk Oblast	Kramatorsk	48.706799	37.630922
3707	KHU	Kakhnovka Airfield	Europe	UA	Ukraine	Poltava Oblast	Kremenchuk	49.136799	33.477893
3708	KWG	Kryvyi Rih International Airport	Europe	UA	Ukraine	Dnipropetrovsk Oblast	Kryvyi Rih	48.04330063	33.20999908
3709	VSG	Luhansk International Airport	Europe	UA	Ukraine	Luhansk Oblast	Luhansk	48.41740036	39.37409973
3710	UCK	Lutsk Airport	Europe	UA	Ukraine	Volyn Oblast	Lutsk	50.678404	25.487165
3711	LWO	Lviv International Airport	Europe	UA	Ukraine	Lviv Oblast	Lviv	49.8125	23.9561
3712	MPW	Mariupol International Airport	Europe	UA	Ukraine	Donetsk Oblast	Mariupol	47.0760994	37.44960022
3713	MXR	Myrhorod Air Base	Europe	UA	Ukraine	Poltava Oblast	Myrhorod	49.932	33.641
3714	NLV	Mykolaiv International Airport	Europe	UA	Ukraine	Mykolaiv Oblast	Nikolayev	47.057899	31.9198
3715	ODS	Odessa International Airport	Europe	UA	Ukraine	Odessa Oblast	Odessa	46.4268	30.6765
3716	PLV	Suprunovka Airport	Europe	UA	Ukraine	Poltava Oblast	Poltava	49.5685997	34.39720154
3717	RWN	Rivne International Airport	Europe	UA	Ukraine	Rivne Oblast	Rivne	50.60710144	26.14159966
3718	UKS	Sevastopol International Airport / Belbek Air Base	Europe	UA	Ukraine	Crimea (autonomous republic)	Sevastopol	44.691822	33.57462
3719	SEV	Sievierodonetsk Airport	Europe	UA	Ukraine	Luhansk Oblast	Sievierodonetsk	48.900926	38.54279
3720	SIP	Simferopol International Airport	Europe	UA	Ukraine	Crimea (autonomous republic)	Simferopol	45.0522	33.975101
3721	UMY	Sumy Airport	Europe	UA	Ukraine	Sumy Oblast	Sumy	50.85829926	34.76250076
3722	UDJ	Uzhhorod International Airport	Europe	UA	Ukraine	Zakarpattia Oblast	Uzhhorod	48.63430023	22.26339912
3723	VIN	Vinnytsia/Gavyryshivka International Airport	Europe	UA	Ukraine	Vinnytsia Oblast	Vinnitsa	49.242531	28.613778
3724	OZH	Zaporizhzhia International Airport	Europe	UA	Ukraine	Zaporizhia Oblast	Zaporizhia	47.86700058	35.31570053
3725	ZTR	Zhytomyr Airport	Europe	UA	Ukraine	Zhytomyr Oblast	Zhytomyr	50.270556	28.738611
3726	ABZ	Aberdeen Dyce Airport	Europe	GB	United Kingdom	Scotland	Aberdeen	57.2019	-2.19778
3727	VLY	Anglesey Airport	Europe	GB	United Kingdom	Wales	Angelsey	53.24810028	-4.535339832
3728	TRE	Tiree Airport	Europe	GB	United Kingdom	Scotland	Balemartine	56.49919891	-6.869170189
3729	BEB	Benbecula Airport	Europe	GB	United Kingdom	Scotland	Balivanich	57.48109818	-7.362780094
3730	BWF	Barrow Walney Island Airport	Europe	GB	United Kingdom	England	Barrow-in-Furness	54.1286111	-3.2675
3731	BFS	Belfast International Airport	Europe	GB	United Kingdom	Northern Ireland	Belfast	54.65750122	-6.215829849
3732	BHD	George Best Belfast City Airport	Europe	GB	United Kingdom	Northern Ireland	Belfast	54.618099	-5.8725
3733	BBP	Bembridge Airport	Europe	GB	United Kingdom	England	Bembridge	50.67810059	-1.109439969
3734	BEX	RAF Benson	Europe	GB	United Kingdom	England	Benson	51.61640167	-1.095829964
3735	BHX	Birmingham International Airport	Europe	GB	United Kingdom	England	Birmingham	52.45389938	-1.748029947
3736	BLK	Blackpool International Airport	Europe	GB	United Kingdom	England	Blackpool	53.77170181	-3.028609991
3737	BOH	Bournemouth Airport	Europe	GB	United Kingdom	England	Bournemouth	50.779999	-1.8425
3738	ESH	Shoreham Airport	Europe	GB	United Kingdom	England	Brighton	50.835602	-0.297222
3739	BRS	Bristol Airport	Europe	GB	United Kingdom	England	Bristol	51.382702	-2.71909
3740	BZZ	RAF Brize Norton	Europe	GB	United Kingdom	England	Brize Norton	51.75	-1.58362
3741	CBG	Cambridge Airport	Europe	GB	United Kingdom	England	Cambridge	52.205002	0.175
3742	CAL	Campbeltown Airport	Europe	GB	United Kingdom	Scotland	Campbeltown	55.43719864	-5.686389923
3743	CWL	Cardiff International Airport	Europe	GB	United Kingdom	Wales	Cardiff	51.396702	-3.34333
3744	CAX	Carlisle Airport	Europe	GB	United Kingdom	England	Carlisle	54.9375	-2.809170008
3745	QUG	Goodwood Aerodrome	Europe	GB	United Kingdom	England	Chichester	50.859402	-0.759167
3746	COL	Coll Airport	Europe	GB	United Kingdom	Scotland	Coll Island	56.60189819	-6.617780209
3747	CSA	Colonsay Airstrip	Europe	GB	United Kingdom	Scotland	Colonsay	56.057499	-6.24306
3748	QCY	RAF Coningsby	Europe	GB	United Kingdom	England	Coningsby	53.0929985	-0.1660140008
3749	CVT	Coventry Airport	Europe	GB	United Kingdom	England	Coventry	52.36970139	-1.479719996
3750	MME	Teesside International Airport	Europe	GB	United Kingdom	England	Darlington, Durham	54.509201	-1.42941
3751	LDY	City of Derry Airport	Europe	GB	United Kingdom	Northern Ireland	Derry	55.0428009	-7.161109924
3752	DSA	Robin Hood Doncaster Sheffield Airport	Europe	GB	United Kingdom	England	Doncaster	53.480538	-1.010656
3753	DOC	Dornoch Airfield	Europe	GB	United Kingdom	Scotland	Dornoch, Sunderland	57.868999	-4.023
3754	DND	Dundee Airport	Europe	GB	United Kingdom	Scotland	Dundee	56.45249939	-3.02583003
3755	EOI	Eday Airport	Europe	GB	United Kingdom	Scotland	Eday	59.19060135	-2.772219896
3756	EDI	Edinburgh Airport	Europe	GB	United Kingdom	Scotland	Edinburgh	55.950145	-3.372288
3757	ENK	Enniskillen/St Angelo Airport	Europe	GB	United Kingdom	Northern Ireland	Enniskillen	54.398899	-7.65167
3758	BRR	Barra Airport	Europe	GB	United Kingdom	Scotland	Eoligarry	57.0228	-7.44306
3759	EXT	Exeter International Airport	Europe	GB	United Kingdom	England	Exeter	50.734402	-3.41389
3760	FIE	Fair Isle Airport	Europe	GB	United Kingdom	Scotland	Fair Isle	59.535801	-1.62806
3761	FFD	RAF Fairford	Europe	GB	United Kingdom	England	Fairford	51.682201	-1.79003
3762	FAB	Farnborough Airport	Europe	GB	United Kingdom	England	Farnborough	51.2757988	-0.7763329744
3763	FEA	Fetlar Airport	Europe	GB	United Kingdom	Scotland	Fetlar Island	60.60333333	-0.8727777778
3764	FLH	Flotta Isle Airport	Europe	GB	United Kingdom	Scotland	Flotta Isle	58.82580185	-3.142780066
3765	FOA	Foula Airfield	Europe	GB	United Kingdom	Scotland	Foula	60.121725	-2.053202
3766	HUY	Humberside Airport	Europe	GB	United Kingdom	England	Grimsby	53.57440186	-0.3508329988
3767	OUK	Out Skerries Airfield	Europe	GB	United Kingdom	Scotland	Grunay Island	60.4252	-0.75
3768	HAW	Haverfordwest Airport	Europe	GB	United Kingdom	Wales	Haverfordwest	51.83309937	-4.961110115
3769	CEG	Hawarden Airport	Europe	GB	United Kingdom	Wales	Hawarden	53.178101	-2.97778
3770	HYC	Wycombe Air Park	Europe	GB	United Kingdom	England	High Wycombe	51.61169815	-0.8083329797
3771	INV	Inverness Airport	Europe	GB	United Kingdom	Scotland	Inverness	57.54249954	-4.047500134
3772	GBA	Cotswold Airport	Europe	GB	United Kingdom	England	Kemble	51.668095	-2.05694
3773	OXF	Oxford (Kidlington) Airport	Europe	GB	United Kingdom	England	Kidlington	51.8368988	-1.320000052
3774	FSS	RAF Kinloss	Europe	GB	United Kingdom	Scotland	Kinloss	57.6493988	-3.560640097
3775	LKZ	RAF Lakenheath	Europe	GB	United Kingdom	England	Lakenheath	52.409302	0.561
3776	LEQ	Land's End Airport	Europe	GB	United Kingdom	England	Land's End	50.102798	-5.67056
3777	LBA	Leeds Bradford Airport	Europe	GB	United Kingdom	England	Leeds	53.865898	-1.66057
3778	LWK	Lerwick / Tingwall Airport	Europe	GB	United Kingdom	Scotland	Lerwick	60.19219971	-1.243610024
3779	LSI	Sumburgh Airport	Europe	GB	United Kingdom	Scotland	Lerwick	59.87889862	-1.295560002
3780	ADX	Leuchars Station Airfield	Europe	GB	United Kingdom	Scotland	Leuchars, Fife	56.37398	-2.868862
3781	HRT	RAF Linton-On-Ouse	Europe	GB	United Kingdom	England	Linton-On-Ouse	54.0489006	-1.252750039
3782	LPL	Liverpool John Lennon Airport	Europe	GB	United Kingdom	England	Liverpool	53.333599	-2.84972
3783	BQH	London Biggin Hill Airport	Europe	GB	United Kingdom	England	London	51.3307991	0.03249999881
3784	LCY	London City Airport	Europe	GB	United Kingdom	England	London	51.505299	0.055278
3785	LGW	London Gatwick Airport	Europe	GB	United Kingdom	England	London	51.148102	-0.190278
3786	LHR	London Heathrow Airport	Europe	GB	United Kingdom	England	London	51.4706	-0.461941
3787	LTN	London Luton Airport	Europe	GB	United Kingdom	England	London	51.87469864	-0.3683330119
3788	STN	London Stansted Airport	Europe	GB	United Kingdom	England	London	51.88499832	0.2349999994
3789	NHT	RAF Northolt	Europe	GB	United Kingdom	England	London	51.5530014	-0.418166995
3790	SEN	Southend Airport	Europe	GB	United Kingdom	England	London	51.5714	0.695556
3791	LMO	RAF Lossiemouth	Europe	GB	United Kingdom	Scotland	Lossiemouth	57.7052002	-3.339169979
3792	LYX	Lydd Airport	Europe	GB	United Kingdom	England	Lydd, Ashford	50.9561	0.939167
3793	MAN	Manchester Airport	Europe	GB	United Kingdom	England	Manchester	53.349375	-2.279521
3794	KNF	RAF Marham	Europe	GB	United Kingdom	England	Marham	52.648395	0.550692
3795	MHZ	RAF Mildenhall	Europe	GB	United Kingdom	England	Mildenhall	52.3619	0.486406
3796	NCL	Newcastle Airport	Europe	GB	United Kingdom	England	Newcastle	55.037498	-1.69167
3797	NQY	Newquay Cornwall Airport	Europe	GB	United Kingdom	England	Newquay	50.44060135	-4.995409966
3798	OBN	Oban Airport	Europe	GB	United Kingdom	Scotland	North Connel	56.46350098	-5.399670124
3799	NRL	North Ronaldsay Airport	Europe	GB	United Kingdom	Scotland	North Ronaldsay	59.36750031	-2.434439898
3800	ORM	Sywell Aerodrome	Europe	GB	United Kingdom	England	Northampton	52.30530167	-0.7930560112
3801	NWI	Norwich International Airport	Europe	GB	United Kingdom	England	Norwich	52.6758	1.28278
3802	EMA	East Midlands Airport	Europe	GB	United Kingdom	England	Nottingham	52.8311	-1.32806
3803	NQT	Nottingham Airport	Europe	GB	United Kingdom	England	Nottingham	52.919998	-1.07917
3804	ODH	RAF Odiham	Europe	GB	United Kingdom	England	Odiham	51.23410034	-0.9428250194
3805	KOI	Kirkwall Airport	Europe	GB	United Kingdom	Scotland	Orkney Islands	58.95780182	-2.904999971
3806	GLA	Glasgow International Airport	Europe	GB	United Kingdom	Scotland	Paisley, Renfrewshire	55.871899	-4.43306
3807	PSV	Papa Stour Airport	Europe	GB	United Kingdom	Scotland	Papa Stour Island	60.321701	-1.69306
3808	PPW	Papa Westray Airport	Europe	GB	United Kingdom	Scotland	Papa Westray	59.35169983	-2.900279999
3809	PSL	Perth/Scone Airport	Europe	GB	United Kingdom	Scotland	Perth	56.43920135	-3.372220039
3810	ILY	Islay Airport	Europe	GB	United Kingdom	Scotland	Port Ellen	55.68190002	-6.256669998
3811	PIK	Glasgow Prestwick Airport	Europe	GB	United Kingdom	Scotland	Prestwick, South Ayrshire	55.502003	-4.587019
3812	KRH	Redhill Aerodrome	Europe	GB	United Kingdom	England	Redhill	51.21360016	-0.1386110038
3813	RCS	Rochester Airport	Europe	GB	United Kingdom	England	Rochester	51.35189819	0.5033329725
3814	NDY	Sanday Airport	Europe	GB	United Kingdom	Scotland	Sanday	59.25030136	-2.576669931
3815	SQZ	RAF Scampton	Europe	GB	United Kingdom	England	Scampton	53.30780029	-0.5508329868
3816	SCS	Scatsta Airport	Europe	GB	United Kingdom	Scotland	Shetland Islands	60.43280029	-1.296110034
3817	UNT	Unst Airport	Europe	GB	United Kingdom	Scotland	Shetland Islands	60.74720001	-0.8538500071
3818	SOU	Southampton Airport	Europe	GB	United Kingdom	England	Southampton	50.950298	-1.3568
3819	QUY	RAF Wyton	Europe	GB	United Kingdom	England	St. Ives	52.35720062	-0.107832998
3820	ISC	St. Mary's Airport	Europe	GB	United Kingdom	England	St. Mary's	49.9133	-6.29167
3821	GLO	Gloucestershire Airport	Europe	GB	United Kingdom	England	Staverton	51.89419937	-2.167220116
3822	SYY	Stornoway Airport	Europe	GB	United Kingdom	Scotland	Stornoway, Western Isles	58.215599	-6.33111
3823	SOY	Stronsay Airport	Europe	GB	United Kingdom	Scotland	Stronsay	59.15530014	-2.641390085
3824	SWS	Swansea Airport	Europe	GB	United Kingdom	Wales	Swansea	51.6053009	-4.067830086
3825	BEQ	RAF Honington	Europe	GB	United Kingdom	England	Thetford	52.34260178	0.7729390264
3826	UPV	Upavon Aerodrome	Europe	GB	United Kingdom	England	Upavon	51.28620148	-1.782019973
3827	WTN	RAF Waddington	Europe	GB	United Kingdom	England	Waddington	53.16619873	-0.5238109827
3828	WRT	Warton Aerodrome	Europe	GB	United Kingdom	England	Warton	53.745098	-2.88306
3829	WRY	Westray Airport	Europe	GB	United Kingdom	Scotland	Westray	59.35029984	-2.950000048
3830	WHS	Whalsay Airstrip	Europe	GB	United Kingdom	Scotland	Whalsay, Shetlands	60.376835	-0.927229
3831	WIC	Wick Airport	Europe	GB	United Kingdom	Scotland	Wick	58.45890045	-3.093060017
3832	BBS	Blackbushe Airport	Europe	GB	United Kingdom	England	Yateley	51.32389832	-0.8475000262
3833	YEO	RNAS Yeovilton	Europe	GB	United Kingdom	England	Yeovil	51.00939941	-2.638819933
3834	AXA	Clayton J Lloyd International Airport	North America	AI	Anguilla	The Valley	The Valley	18.204773	-63.05383
3835	BBQ	Codrington Airport	North America	AG	Antigua and Barbuda	Barbuda Dependency	Codrington	17.635799	-61.828602
3836	ANU	V.C. Bird International Airport	North America	AG	Antigua and Barbuda	Saint George Parish	St. John's	17.1367	-61.792702
3837	AUA	Queen Beatrix International Airport	North America	AW	Aruba	Oranjestad	Oranjestad	12.5014	-70.015198
3838	MYG	Mayaguana Airport	North America	BS	Bahamas	Mayaguana	Abrahams Bay	22.379499	-73.013494
3839	TZN	Congo Town Airport	North America	BS	Bahamas	South Andros	Andros	24.158701	-77.589798
3840	SAQ	San Andros Airport	North America	BS	Bahamas	North Andros	Andros Island	25.05380058	-78.0490036
3841	ASD	Andros Town Airport	North America	BS	Bahamas	North Andros	Andros Town	24.69790077	-77.79560089
3842	ATC	Arthur's Town Airport	North America	BS	Bahamas	Cat Island	Arthur's Town	24.6294	-75.673797
3843	NSB	Bimini North Seaplane Base	North America	BS	Bahamas	Bimini	Bimini	25.7670002	-79.25
3844	GHC	Great Harbour Cay Airport	North America	BS	Bahamas	Berry Islands	Bullocks Harbour	25.7383	-77.840103
3845	TBI	New Bight Airport	North America	BS	Bahamas	Cat Island	Cat Island	24.3153	-75.452301
3846	CCZ	Chub Cay Airport	North America	BS	Bahamas	North Andros	Chub Cay	25.41710091	-77.88089752
3847	CRI	Colonel Hill Airport	North America	BS	Bahamas	Crooked Island and Long Cay	Colonel Hill	22.7456	-74.182404
3848	LGI	Deadman's Cay Airport	North America	BS	Bahamas	Long Island	Deadman's Cay	23.17900085	-75.09359741
3849	DCT	Duncan Town Airport	North America	BS	Bahamas	Ragged Island	Duncan Town	22.18180084	-75.72949982
3850	FPO	Grand Bahama International Airport	North America	BS	Bahamas	City of Freeport	Freeport	26.55870056	-78.69560242
3851	GHB	Governor's Harbour Airport	North America	BS	Bahamas	Central Eleuthera	Governor's Harbour	25.2847	-76.331001
3852	GBI	Grand Bahama Auxiliary Airfield	North America	BS	Bahamas	East Grand Bahama	High Rock	26.631901	-78.3592
3853	MAY	Clarence A. Bain Airport	North America	BS	Bahamas	South Andros	Mangrove Cay	24.28770065	-77.68460083
3854	MHH	Leonard M Thompson International Airport	North America	BS	Bahamas	Central Abaco	Marsh Harbour	26.5114	-77.083503
3855	IGA	Inagua Airport	North America	BS	Bahamas	Inagua	Matthew Town	20.97500038	-73.66690063
3856	GGT	Exuma International Airport	North America	BS	Bahamas	Exuma	Moss Town	23.562599	-75.877998
3857	NAS	Lynden Pindling International Airport	North America	BS	Bahamas	New Providence	Nassau	25.039	-77.466202
3858	NMC	Normans Cay Airport	North America	BS	Bahamas	Exuma	Normans Cay	24.594299	-76.820198
3859	ELH	North Eleuthera Airport	North America	BS	Bahamas	Harbour Island	North Eleuthera	25.47489929	-76.6835022
3860	PWN	Pitts Town Airport	North America	BS	Bahamas	Crooked Island and Long Cay	Pitts Town	22.8297	-74.3461
3861	RSD	Rock Sound Airport	North America	BS	Bahamas	South Eleuthera	Rock Sound	24.89507873	-76.17688179
3862	RCY	Rum Cay Airport	North America	BS	Bahamas	Rum Cay	Rum Cay	23.68440056	-74.8361969
3863	ZSA	San Salvador Airport	North America	BS	Bahamas	San Salvador	San Salvador	24.063299	-74.524002
3864	BIM	South Bimini Airport	North America	BS	Bahamas	Bimini	South Bimini	25.69989967	-79.26470184
3865	AXP	Spring Point Airport	North America	BS	Bahamas	Acklins	Spring Point	22.44179916	-73.97090149
3866	TYM	Staniel Cay Airport	North America	BS	Bahamas	Exuma	Staniel Cay	24.16909981	-76.43910217
3867	SML	Stella Maris Airport	North America	BS	Bahamas	Long Island	Stella Maris	23.582317	-75.268621
3868	TCB	Treasure Cay Airport	North America	BS	Bahamas	Central Abaco	Treasure Cay	26.74530029	-77.39129639
3869	WKR	Walkers Cay Airport	North America	BS	Bahamas	North Abaco	Walkers Cay	27.259656	-78.400455
3870	WTD	West End Airport	North America	BS	Bahamas	West Grand Bahama	West End	26.685301	-78.974998
3871	BGI	Grantley Adams International Airport	North America	BB	Barbados	Christ Church	Bridgetown	13.0746	-59.4925
3872	BZE	Philip S. W. Goldson International Airport	North America	BZ	Belize	Belize District	Belize City	17.53910065	-88.30819702
3873	TZA	Sir Barry Bowen Municipal Airport	North America	BZ	Belize	Belize District	Belize City	17.51639	-88.194443
3874	BCV	Hector Silva Airstrip	North America	BZ	Belize	Cayo District	Belmopan	17.269603	-88.776496
3875	BGK	Big Creek Airport	North America	BZ	Belize	Stann Creek District	Big Creek	16.519369	-88.407913
3876	CUK	Caye Caulker Airport	North America	BZ	Belize	Belize District	Caye Caulker	17.735015	-88.032862
3877	CYC	Caye Chapel Airport	North America	BZ	Belize	Belize District	Caye Chapel	17.683792	-88.044985
3878	CZH	Corozal Municipal Airport	North America	BZ	Belize	Corozal District	Corozal	18.38220024	-88.41190338
3879	DGA	Dangriga Airport	North America	BZ	Belize	Stann Creek District	Dangriga	16.98251	-88.230988
3880	INB	Independence Airport	North America	BZ	Belize	Stann Creek District	Independence	16.5345	-88.441299
3881	MZE	Manatee Airport	North America	BZ	Belize	Cayo District	Manatee	17.27846	-89.0238
3882	CYD	San Ignacio Town (Maya Flats) Airstrip	North America	BZ	Belize	Cayo District	Maya Flats	17.104872	-89.101129
3883	MDB	Melinda Airport	North America	BZ	Belize	Stann Creek District	Melinda	17.00429916	-88.30419922
3884	ORZ	Orange Walk Airport	North America	BZ	Belize	Orange Walk District	Orange Walk	18.04676628	-88.58386993
3885	PLJ	Placencia Airport	North America	BZ	Belize	Stann Creek District	Placencia	16.53695679	-88.36151123
3886	PND	Punta Gorda Airport	North America	BZ	Belize	Toledo District	Punta Gorda	16.10239983	-88.8082962
3887	SQS	Matthew Spain Airport	North America	BZ	Belize	Cayo District	San Ignacio	17.1859	-89.0098
3888	SPR	John Greif II Airport	North America	BZ	Belize	Cayo District	San Pedro	17.9139	-87.9711
3889	STU	Santa Cruz Airport	North America	BZ	Belize	Corozal District	Santa Cruz	18.27210045	-88.45629883
3890	SJX	Sartaneja Airport	North America	BZ	Belize	Corozal District	Sartaneja	18.35610008	-88.13079834
3891	SVK	Silver Creek Airport	North America	BZ	Belize	Stann Creek District	Silver Creek	16.728338	-88.369174
3892	BDA	L.F. Wade International International Airport	North America	BM	Bermuda	Hamilton	Hamilton	32.36399841	-64.67870331
3893	NGD	Captain Auguste George Airport	North America	VG	British Virgin Islands	Anegada	Anegada	18.727734	-64.32852
3894	EIS	Terrance B. Lettsome International Airport	North America	VG	British Virgin Islands	Road Town	Road Town	18.445492	-64.541707
3895	VIJ	Virgin Gorda Airport	North America	VG	British Virgin Islands	Spanish Town	Spanish Town	18.44639969	-64.42749786
3896	TOV	Tortola West End Seaplane Base	North America	VG	British Virgin Islands	Tortola	Tortola	18.45	-64.583333
3897	ZMH	South Cariboo Region / 108 Mile Airport	North America	CA	Canada	British Columbia	108 Mile	51.73609924	-121.3330002
3898	YXX	Abbotsford International Airport	North America	CA	Canada	British Columbia	Abbotsford	49.025299	-122.361
3899	LAK	Aklavik/Freddie Carmichael Airport	North America	CA	Canada	Northwest Territories	Aklavik	68.223297	-135.00599
3900	AKV	Akulivik Airport	North America	CA	Canada	Quebec	Akulivik	60.8185997	-78.14859772
3901	JHL	Fort MacKay/Albian Aerodrome	North America	CA	Canada	Alberta	Albian Village	57.22389984	-111.4189987
3902	YLT	Alert Airport	North America	CA	Canada	Nunavut	Alert	82.517799	-62.280602
3903	YAL	Alert Bay Airport	North America	CA	Canada	British Columbia	Alert Bay	50.5821991	-126.9160004
3904	YTF	Alma Airport	North America	CA	Canada	Quebec	Alma	48.50889969	-71.64189911
3905	YEY	Amos/Magny Airport	North America	CA	Canada	Quebec	Amos	48.563903	-78.249702
3906	YAA	Anahim Lake Airport	North America	CA	Canada	British Columbia	Anahim Lake	52.451501	-125.303776
3907	YAX	Wapekeka Airport	North America	CA	Canada	Ontario	Angling Lake	53.8492012	-89.57939911
3908	YAB	Arctic Bay Airport	North America	CA	Canada	Nunavut	Arctic Bay	73.006101	-85.04616
3909	YYW	Armstrong Airport	North America	CA	Canada	Ontario	Armstrong	50.29029846	-88.90969849
3910	YEK	Arviat Airport	North America	CA	Canada	Nunavut	Arviat	61.09420013	-94.07080078
3911	YIB	Atikokan Municipal Airport	North America	CA	Canada	Ontario	Atikokan	48.77389908	-91.63860321
3912	YAT	Attawapiskat Airport	North America	CA	Canada	Ontario	Attawapiskat	52.92750168	-82.43190002
3913	YPJ	Aupaluk Airport	North America	CA	Canada	Quebec	Aupaluk	59.29669952	-69.59970093
3914	YBG	CFB Bagotville	North America	CA	Canada	Quebec	Bagotville	48.33060074	-70.99639893
3915	YBC	Baie-Comeau Airport	North America	CA	Canada	Quebec	Baie-Comeau	49.1325	-68.204399
3916	YBJ	Baie-Johan-Beetz Water Aerodrome	North America	CA	Canada	Quebec	Baie-Johan-Beetz	50.283745	-62.81004
3917	YBK	Baker Lake Airport	North America	CA	Canada	Nunavut	Baker Lake	64.29889679	-96.07779694
3918	YBF	Bamfield Seaplane Base	North America	CA	Canada	British Columbia	Bamfield	48.83330154	-125.1330032
3919	YBA	Banff Airport	North America	CA	Canada	Alberta	Banff	51.208222	-115.540624
3920	YEB	Bar River Airport	North America	CA	Canada	Ontario	Bar River	46.42029953	-84.09220123
3921	YLK	Barrie-Lake Simcoe Regional Airport	North America	CA	Canada	Ontario	Barrie	44.485989	-79.555687
3922	ZBF	Bathurst Airport	North America	CA	Canada	New Brunswick	Bathurst	47.6297	-65.738899
3923	XBE	Bearskin Lake Airport	North America	CA	Canada	Ontario	Bearskin Lake	53.96559906	-91.02719879
3924	YXQ	Beaver Creek Airport	North America	CA	Canada	Yukon	Beaver Creek	62.41030121	-140.8670044
3925	YBW	Bedwell Harbour Seaplane Base	North America	CA	Canada	British Columbia	Bedwell Harbour	48.75	-123.2330017
3926	ZEL	Bella Bella (Campbell Island) Airport	North America	CA	Canada	British Columbia	Bella Bella	52.185001	-128.156994
3927	YSX	Bella Bella/Shearwater Seaplane Base	North America	CA	Canada	British Columbia	Bella Bella	52.150002	-128.08299
3928	QBC	Bella Coola Airport	North America	CA	Canada	British Columbia	Bella Coola	52.387501	-126.596001
3929	YBV	Berens River Airport	North America	CA	Canada	Manitoba	Berens River	52.358898	-97.018303
3930	YRR	Stuart Island Airstrip	North America	CA	Canada	British Columbia	Big Bay	50.40944743	-125.1316166
3931	YTL	Big Trout Lake Airport	North America	CA	Canada	Ontario	Big Trout Lake	53.81779861	-89.89689636
3932	YBI	Black Tickle Airport	North America	CA	Canada	Newfoundland and Labrador	Black Tickle	53.4693985	-55.78499985
3933	YDV	Bloodvein River Airport	North America	CA	Canada	Manitoba	Bloodvein River	51.784568	-96.692305
3934	XBB	Blubber Bay Seaplane Base	North America	CA	Canada	British Columbia	Blubber Bay	49.793958	-124.621064
3935	YBO	Bob Quinn Lake Airport	North America	CA	Canada	British Columbia	Bob Quinn Lake	56.96670151	-130.25
3936	YVB	Bonaventure Airport	North America	CA	Canada	Quebec	Bonaventure	48.07109833	-65.46029663
3937	YBY	Bonnyville Airport	North America	CA	Canada	Alberta	Bonnyville	54.304199	-110.744003
3938	YBR	Brandon Municipal Airport	North America	CA	Canada	Manitoba	Brandon	49.91	-99.951897
3939	YBT	Brochet Airport	North America	CA	Canada	Manitoba	Brochet	57.8894	-101.679001
3940	XBR	Brockville - Thousand Islands Regional Tackaberry Airport	North America	CA	Canada	Ontario	Brockville	44.63940048	-75.75029755
3941	ZBM	Bromont (Roland D??sourdy) Airport	North America	CA	Canada	Quebec	Bromont	45.290798	-72.741402
3942	YGN	Greenway Sound Seaplane Base	North America	CA	Canada	British Columbia	Broughton Island	50.839	-126.775
3943	YVT	Buffalo Narrows Airport	North America	CA	Canada	Saskatchewan	Buffalo Narrows	55.84189987	-108.4179993
3944	YBH	Bull Harbour Water Aerodrome	North America	CA	Canada	British Columbia	Bull Harbour	50.9179	-127.9372
3945	YPZ	Burns Lake Airport	North America	CA	Canada	British Columbia	Burns Lake	54.37639999	-125.9509964
3946	YDB	Burwash Airport	North America	CA	Canada	Yukon	Burwash	61.37110138	-139.0410004
3947	YZA	Cache Creek-Ashcroft Regional Airport	North America	CA	Canada	British Columbia	Cache Creek	50.775258	-121.321314
3948	YYC	Calgary International Airport	North America	CA	Canada	Alberta	Calgary	51.11389923	-114.0199966
3949	YCB	Cambridge Bay Airport	North America	CA	Canada	Nunavut	Cambridge Bay	69.10810089	-105.1380005
3950	YBL	Campbell River Airport	North America	CA	Canada	British Columbia	Campbell River	49.950802	-125.271004
3951	YHH	Campbell River Seaplane Base	North America	CA	Canada	British Columbia	Campbell River	50.049999	-125.25
3952	YRF	Cartwright Airport	North America	CA	Canada	Newfoundland and Labrador	Cartwright	53.68280029	-57.04190063
3953	YCG	Castlegar/West Kootenay Regional Airport	North America	CA	Canada	British Columbia	Castlegar	49.29639816	-117.6320038
3954	YAC	Cat Lake Airport	North America	CA	Canada	Ontario	Cat Lake	51.72719955	-91.82440186
3955	YLD	Chapleau Airport	North America	CA	Canada	Ontario	Chapleau	47.81999969	-83.34670258
3956	YML	Charlevoix Airport	North America	CA	Canada	Quebec	Charlevoix	47.59749985	-70.22389984
3957	YCL	Charlo Airport	North America	CA	Canada	New Brunswick	Charlo	47.990799	-66.330299
3958	YYG	Charlottetown Airport	North America	CA	Canada	Prince Edward Island	Charlottetown	46.29000092	-63.12110138
3959	XCM	Chatham Kent Airport	North America	CA	Canada	Ontario	Chatham-Kent	42.3064003	-82.08190155
3960	TIL	Cheadle Airport	North America	CA	Canada	Alberta	Cheadle	51.05749893	-113.6240005
3961	YCS	Chesterfield Inlet Airport	North America	CA	Canada	Nunavut	Chesterfield Inlet	63.34690094	-90.73110199
3962	YCQ	Chetwynd Airport	North America	CA	Canada	British Columbia	Chetwynd	55.68719864	-121.6269989
3963	YHR	Chevery Airport	North America	CA	Canada	Quebec	Chevery	50.46889877	-59.63669968
3964	YMT	Chapais Airport	North America	CA	Canada	Quebec	Chibougamau	49.77190018	-74.52809906
3965	CJH	Chilko Lake (Tsylos Park Lodge) Airport	North America	CA	Canada	British Columbia	Chilko Lake	51.625797	-124.144478
3966	YCW	Chilliwack Airport	North America	CA	Canada	British Columbia	Chilliwack	49.153157	-121.939309
3967	YKU	Chisasibi Airport	North America	CA	Canada	Quebec	Chisasibi	53.80559921	-78.91690063
3968	YYQ	Churchill Airport	North America	CA	Canada	Manitoba	Churchill	58.73920059	-94.06500244
3969	ZUM	Churchill Falls Airport	North America	CA	Canada	Newfoundland and Labrador	Churchill Falls	53.56190109	-64.10639954
3970	YWQ	Chute-Des-Passes/Lac Margane Seaplane Base	North America	CA	Canada	Quebec	Chutes-des-Passes	49.9434	-71.138
3971	XCL	Cluff Lake Airport	North America	CA	Canada	Saskatchewan	Cluff Lake	58.39110184	-109.5159988
3972	YCY	Clyde River Airport	North America	CA	Canada	Nunavut	Clyde River	70.48609924	-68.51670074
3973	YCN	Cochrane Airport	North America	CA	Canada	Ontario	Cochrane	49.10559845	-81.01360321
3974	YOD	CFB Cold Lake	North America	CA	Canada	Alberta	Cold Lake	54.40499878	-110.2789993
3975	YKC	Collins Bay Airport	North America	CA	Canada	Saskatchewan	Collins Bay	58.23609924	-103.6780014
3976	YCK	Tommy Kochon Airport	North America	CA	Canada	Northwest Territories	Colville Lake	67.02	-126.126
3977	YQQ	Comox Valley Airport / CFB Comox	North America	CA	Canada	British Columbia	Comox	49.7108	-124.887001
3978	CFM	Conklin (Leismer) Airport	North America	CA	Canada	Alberta	Conklin	55.695301	-111.278999
3979	YZS	Coral Harbour Airport	North America	CA	Canada	Nunavut	Coral Harbour	64.19329834	-83.35939789
3980	YCC	Cornwall Regional Airport	North America	CA	Canada	Ontario	Cornwall	45.092637	-74.567724
3981	YCT	Coronation Airport	North America	CA	Canada	Alberta	Coronation	52.07500076	-111.4449997
3982	YCF	Cortes Bay Water Aerodrome	North America	CA	Canada	British Columbia	Cortes Bay	50.063	-124.930002
3983	YCA	Courtenay Airpark	North America	CA	Canada	British Columbia	Courtenay	49.6794014	-124.9820023
3984	YYM	Cowley Airport	North America	CA	Canada	Alberta	Cowley	49.63639832	-114.0940018
3985	YXC	Cranbrook/Canadian Rockies International Airport	North America	CA	Canada	British Columbia	Cranbrook	49.6108017	-115.7819977
3986	CFQ	Creston Valley Regional Airport - Art Sutcliffe Field	North America	CA	Canada	British Columbia	Creston	49.03689957	-116.4980011
3987	YCR	Cross Lake (Charlie Sinclair Memorial) Airport	North America	CA	Canada	Manitoba	Cross Lake	54.61059952	-97.76080322
3988	YDN	Dauphin Barker Airport	North America	CA	Canada	Manitoba	Dauphin	51.10079956	-100.052002
3989	YDA	Dawson City Airport	North America	CA	Canada	Yukon	Dawson City	64.04309845	-139.128006
3990	YDQ	Dawson Creek Airport	North America	CA	Canada	British Columbia	Dawson Creek	55.74229813	-120.1829987
3991	YDL	Dease Lake Airport	North America	CA	Canada	British Columbia	Dease Lake	58.42219925	-130.0319977
3992	YDF	Deer Lake Airport	North America	CA	Canada	Newfoundland and Labrador	Deer Lake	49.21080017	-57.39139938
3993	YVZ	Deer Lake Airport	North America	CA	Canada	Ontario	Deer Lake	52.65579987	-94.06140137
3994	YWJ	D??line Airport	North America	CA	Canada	Northwest Territories	D??line	65.21109772	-123.435997
3995	YRC	Refuge Cove Seaplane Base	North America	CA	Canada	British Columbia	Desolation Sound	50.1234	-124.843
3996	DVK	Diavik Airport	North America	CA	Canada	Northwest Territories	Diavik	64.51139832	-110.2890015
3997	YDG	Digby / Annapolis Regional Airport	North America	CA	Canada	Nova Scotia	Digby	44.54584504	-65.78542471
3998	YDO	Dolbeau St Felicien Airport	North America	CA	Canada	Quebec	Dolbeau-St-F??licien	48.7784996	-72.375
3999	YOE	Donnelly Airport	North America	CA	Canada	Alberta	Donnelly	55.7094	-117.094002
4000	DGF	Douglas Lake Airport	North America	CA	Canada	British Columbia	Douglas Lake	50.16546005	-120.1712734
4001	YDC	Drayton Valley Industrial Airport	North America	CA	Canada	Alberta	Drayton Valley	53.26580048	-114.9599991
4002	YHD	Dryden Regional Airport	North America	CA	Canada	Ontario	Dryden	49.831699	-92.744202
4003	DUQ	Duncan Airport	North America	CA	Canada	British Columbia	Duncan	48.754534	-123.709702
4004	YXR	Earlton (Timiskaming Regional) Airport	North America	CA	Canada	Ontario	Earlton	47.69740065	-79.84734535
4005	ZEM	Eastmain River Airport	North America	CA	Canada	Quebec	Eastmain River	52.22639847	-78.52249908
4006	YEG	Edmonton International Airport	North America	CA	Canada	Alberta	Edmonton	53.30970001	-113.5800018
4007	YET	Edson Airport	North America	CA	Canada	Alberta	Edson	53.57889938	-116.4649963
4008	YOA	Ekati Airport	North America	CA	Canada	Northwest Territories	Ekati	64.69889832	-110.6149979
4009	YOI	Opinaca Aerodrome	North America	CA	Canada	Quebec	??l??onore Mine	52.221944	-76.611944
4010	YEL	Elliot Lake Municipal Airport	North America	CA	Canada	Ontario	Elliot Lake	46.35139847	-82.56140137
4011	YEN	Estevan Airport	North America	CA	Canada	Saskatchewan	Estevan	49.21030045	-102.9660034
4012	YEU	Eureka Airport	North America	CA	Canada	Nunavut	Eureka	79.99469757	-85.81420136
4013	YCZ	Fairmont Hot Springs Airport	North America	CA	Canada	British Columbia	Fairmont Hot Springs	50.331052	-115.873739
4014	ZFW	Fairview Airport	North America	CA	Canada	Alberta	Fairview	56.08140183	-118.4349976
4015	ZFA	Faro Airport	North America	CA	Canada	Yukon	Faro	62.20750046	-133.3760071
4016	YFO	Flin Flon Airport	North America	CA	Canada	Manitoba	Flin Flon	54.67810059	-101.6819992
4017	ZFD	Fond-Du-Lac Airport	North America	CA	Canada	Saskatchewan	Fond-Du-Lac	59.33440018	-107.1819992
4018	YFG	Fontanges Airport	North America	CA	Canada	Quebec	Fontanges	54.55390167	-71.1733017
4019	YFE	Forestville Airport	North America	CA	Canada	Quebec	Forestville	48.74610138	-69.09719849
4020	YFA	Fort Albany Airport	North America	CA	Canada	Ontario	Fort Albany	52.20140076	-81.69689941
4021	YPY	Fort Chipewyan Airport	North America	CA	Canada	Alberta	Fort Chipewyan	58.76720047	-111.1169968
4022	YAG	Fort Frances Municipal Airport	North America	CA	Canada	Ontario	Fort Frances	48.655749	-93.44349
4023	YGH	Fort Good Hope Airport	North America	CA	Canada	Northwest Territories	Fort Good Hope	66.24079895	-128.651001
4024	YFH	Fort Hope Airport	North America	CA	Canada	Ontario	Fort Hope	51.56190109	-87.90779877
4025	YJF	Fort Liard Airport	North America	CA	Canada	Northwest Territories	Fort Liard	60.2358017	-123.4690018
4026	HZP	Fort Mackay / Horizon Airport	North America	CA	Canada	Alberta	Fort Mackay	57.38169861	-111.7009964
4027	NML	Fort McMurray / Mildred Lake Airport	North America	CA	Canada	Alberta	Fort McMurray	57.05559921	-111.5739975
4028	YMM	Fort McMurray Airport	North America	CA	Canada	Alberta	Fort McMurray	56.65330124	-111.2220001
4029	ZFM	Fort Mcpherson Airport	North America	CA	Canada	Northwest Territories	Fort Mcpherson	67.40750122	-134.8609924
4030	YYE	Fort Nelson Airport	North America	CA	Canada	British Columbia	Fort Nelson	58.83639908	-122.5970001
4031	YFL	Fort Reliance Seaplane Base	North America	CA	Canada	Northwest Territories	Fort Reliance	62.7	-109.167
4032	YFR	Fort Resolution Airport	North America	CA	Canada	Northwest Territories	Fort Resolution	61.18080139	-113.6900024
4033	YER	Fort Severn Airport	North America	CA	Canada	Ontario	Fort Severn	56.01890182	-87.67610168
4034	YFS	Fort Simpson Airport	North America	CA	Canada	Northwest Territories	Fort Simpson	61.7602005	-121.2369995
4035	YSM	Fort Smith Airport	North America	CA	Canada	Northwest Territories	Fort Smith	60.020302	-111.961998
4036	YXJ	Fort St John Airport	North America	CA	Canada	British Columbia	Fort St.John	56.238098	-120.739998
4037	YFC	Fredericton Airport	North America	CA	Canada	New Brunswick	Fredericton	45.8689003	-66.53720093
4038	YSI	Parry Sound/Frying Pan Island-Sans Souci Seaplane Base	North America	CA	Canada	Ontario	Frying Pan Island	45.173302	-80.137497
4039	SYF	Silva Bay Seaplane Base	North America	CA	Canada	British Columbia	Gabriola Island	49.15	-123.696
4040	GHK	Gahcho Kue	North America	CA	Canada	Northwest Territories	Gahcho Kue	63.435198	-109.144812
4041	YRA	Rae Lakes Airport	North America	CA	Canada	Northwest Territories	Gam??t??	64.1160965	-117.3099976
4042	YQX	Gander International Airport	North America	CA	Canada	Newfoundland and Labrador	Gander	48.93690109	-54.56809998
4043	YGP	Gasp?? (Michel-Pouliot) Airport	North America	CA	Canada	Quebec	Gasp??	48.77529907	-64.47859955
4044	YND	Ottawa / Gatineau Airport	North America	CA	Canada	Quebec	Gatineau	45.521702	-75.563599
4045	YGQ	Geraldton Greenstone Regional Airport	North America	CA	Canada	Ontario	Geraldton	49.77830124	-86.93939972
4046	YGX	Gillam Airport	North America	CA	Canada	Manitoba	Gillam	56.35749817	-94.71060181
4047	YGM	Gimli Industrial Park Airport	North America	CA	Canada	Manitoba	Gimli	50.62810135	-97.04329681
4048	YHK	Gjoa Haven Airport	North America	CA	Canada	Nunavut	Gjoa Haven	68.63559723	-95.84970093
4049	YGO	Gods Lake Narrows Airport	North America	CA	Canada	Manitoba	Gods Lake Narrows	54.55889893	-94.49140167
4050	ZGI	Gods River Airport	North America	CA	Canada	Manitoba	Gods River	54.83969879	-94.07859802
4051	YYR	Goose Bay Airport	North America	CA	Canada	Newfoundland and Labrador	Goose Bay	53.31919861	-60.42580032
4052	YZE	Gore Bay Manitoulin Airport	North America	CA	Canada	Ontario	Gore Bay	45.8853	-82.567802
4053	YGE	Gorge Harbour Seaplane Base	North America	CA	Canada	British Columbia	Gorge Harbour	50.0994	-125.0235
4054	ZGF	Grand Forks Airport	North America	CA	Canada	British Columbia	Grand Forks	49.015598	-118.431
4055	YQU	Grande Prairie Airport	North America	CA	Canada	Alberta	Grande Prairie	55.17969894	-118.8850021
4056	DAS	Great Bear Lake Airport	North America	CA	Canada	Northwest Territories	Great Bear Lake	66.70310211	-119.7070007
4057	YZX	CFB Greenwood	North America	CA	Canada	Nova Scotia	Greenwood	44.9844017	-64.91690063
4058	YGZ	Grise Fiord Airport	North America	CA	Canada	Nunavut	Grise Fiord	76.42610168	-82.90920258
4059	YHT	Haines Junction Airport	North America	CA	Canada	Yukon	Haines Junction	60.78919983	-137.5460052
4060	YHZ	Halifax / Stanfield International Airport	North America	CA	Canada	Nova Scotia	Halifax	44.88079834	-63.50859833
4061	YHM	John C. Munro Hamilton International Airport	North America	CA	Canada	Ontario	Hamilton	43.17359924	-79.93499756
4062	YTB	Hartley Bay Seaplane Base	North America	CA	Canada	British Columbia	Hartley Bay	53.416698	-129.25
4063	YDJ	Hatchet Lake Airport	North America	CA	Canada	Saskatchewan	Hatchet Lake	58.66249847	-103.538002
4064	YGV	Havre-Saint-Pierre Airport	North America	CA	Canada	Quebec	Havre-Saint-Pierre	50.281898	-63.611401
4065	YHY	Hay River / Merlyn Carter Airport	North America	CA	Canada	Northwest Territories	Hay River	60.83969879	-115.7829971
4066	YHF	Hearst Ren?? Fontaine Municipal Airport	North America	CA	Canada	Ontario	Hearst	49.71419907	-83.68609619
4067	ZHH	Herschel Island Field	North America	CA	Canada	Yukon	Herschel Island (Yukon Territory)	69.548229	-139.091608
4068	YOJ	High Level Airport	North America	CA	Canada	Alberta	High Level	58.62139893	-117.1650009
4069	ZHP	High Prairie Airport	North America	CA	Canada	Alberta	High Prairie	55.39360046	-116.4749985
4070	YJP	Hinton/Jasper-Hinton Airport	North America	CA	Canada	Alberta	Hinton	53.31919861	-117.7529984
4071	YHE	Hope Airport / FVRD Regional Airpark	North America	CA	Canada	British Columbia	Hope	49.368865	-121.49495
4072	JOJ	Doris Lake	North America	CA	Canada	Nunavut	Hope Bay	68.12527466	-106.5852814
4073	UZM	Hope Bay Aerodrome	North America	CA	Canada	Nunavut	Hope Bay	68.156	-106.618
4074	YHO	Hopedale Airport	North America	CA	Canada	Newfoundland and Labrador	Hopedale	55.44829941	-60.22859955
4075	YHN	Hornepayne Municipal Airport	North America	CA	Canada	Ontario	Hornepayne	49.19309998	-84.7589035
4076	YHB	Hudson Bay Airport	North America	CA	Canada	Saskatchewan	Hudson Bay	52.81669998	-102.310997
4077	YNH	Hudsons Hope Airport	North America	CA	Canada	British Columbia	Hudson's Hope	56.03559875	-121.9759979
4078	YCE	Centralia / James T. Field Memorial Aerodrome	North America	CA	Canada	Ontario	Huron Park	43.285599	-81.508301
4079	YGT	Igloolik Airport	North America	CA	Canada	Nunavut	Igloolik	69.36470032	-81.81610107
4080	ZUC	Ignace Municipal Airport	North America	CA	Canada	Ontario	Ignace	49.428204	-91.720418
4081	YGR	??les-de-la-Madeleine Airport	North America	CA	Canada	Quebec	??les-de-la-Madeleine	47.42470169	-61.77809906
4082	ILF	Ilford Airport	North America	CA	Canada	Manitoba	Ilford	56.05163	-95.620523
4083	YPH	Inukjuak Airport	North America	CA	Canada	Quebec	Inukjuak	58.47190094	-78.07689667
4084	YEV	Inuvik Mike Zubko Airport	North America	CA	Canada	Northwest Territories	Inuvik	68.30419922	-133.4830017
4085	YFB	Iqaluit Airport	North America	CA	Canada	Nunavut	Iqaluit	63.756402	-68.555801
4086	YIV	Island Lake Airport	North America	CA	Canada	Manitoba	Island Lake	53.85720062	-94.6536026
4087	YIK	Ivujivik Airport	North America	CA	Canada	Quebec	Ivujivik	62.41730118	-77.9253006
4088	YJA	Jasper Airport	North America	CA	Canada	Alberta	Jasper	52.996418	-118.060233
4089	ZJG	Jenpeg Airport	North America	CA	Canada	Manitoba	Jenpeg	54.51890182	-98.0460968
4090	YKA	Kamloops Airport	North America	CA	Canada	British Columbia	Kamloops	50.70220184	-120.4440002
4091	XGR	Kangiqsualujjuaq (Georges River) Airport	North America	CA	Canada	Quebec	Kangiqsualujjuaq	58.71139908	-65.99279785
4092	YWB	Kangiqsujuaq (Wakeham Bay) Airport	North America	CA	Canada	Quebec	Kangiqsujuaq	61.58860016	-71.92939758
4093	YKG	Kangirsuk Airport	North America	CA	Canada	Quebec	Kangirsuk	60.02719879	-69.99919891
4094	YYU	Kapuskasing Airport	North America	CA	Canada	Ontario	Kapuskasing	49.41389847	-82.46749878
4095	XKS	Kasabonika Airport	North America	CA	Canada	Ontario	Kasabonika	53.52470016	-88.64279938
4096	YDU	Kasba Lake Airport	North America	CA	Canada	Northwest Territories	Kasba Lake	60.29190063	-102.5019989
4097	ZKE	Kashechewan Airport	North America	CA	Canada	Ontario	Kashechewan	52.28250122	-81.67780304
4098	YAU	Donaldson Airport	North America	CA	Canada	Quebec	Kattiniq	61.66220093	-73.3214035
4099	KEW	Keewaywin Airport	North America	CA	Canada	Ontario	Keewaywin	52.99110031	-92.83640289
4100	ZKG	Kegaska Airport	North America	CA	Canada	Quebec	Kegaska	50.19580078	-61.26580048
4101	YLW	Kelowna International Airport	North America	CA	Canada	British Columbia	Kelowna	49.9561	-119.377998
4102	KES	Kelsey Airport	North America	CA	Canada	Manitoba	Kelsey	56.03749847	-96.50969696
4103	YQK	Kenora Airport	North America	CA	Canada	Ontario	Kenora	49.78829956	-94.36309814
4104	YKJ	Key Lake Airport	North America	CA	Canada	Saskatchewan	Key Lake	57.2560997	-105.6179962
4105	YLC	Kimmirut Airport	North America	CA	Canada	Nunavut	Kimmirut	62.84999847	-69.88330078
4106	YRD	Dean River Airport	North America	CA	Canada	British Columbia	Kimsquit Valley	52.82371	-126.964957
4107	YKD	Kincardine Municipal Airport	North America	CA	Canada	Ontario	Kincardine	44.201401	-81.606697
4108	YKY	Kindersley Airport	North America	CA	Canada	Saskatchewan	Kindersley	51.51750183	-109.1809998
4109	KIF	Kingfisher Lake Airport	North America	CA	Canada	Ontario	Kingfisher Lake	53.01250076	-89.8553009
4110	YGK	Kingston Norman Rogers Airport	North America	CA	Canada	Ontario	Kingston	44.22529984	-76.59690094
4111	YTE	Cape Dorset Airport	North America	CA	Canada	Nunavut	Kinngait	64.230003	-76.526703
4112	KFM	Kirby Lake Airport	North America	CA	Canada	Alberta	Kirby Lake	55.355598	-110.637001
4113	YKX	Kirkland Lake Airport	North America	CA	Canada	Ontario	Kirkland Lake	48.21030045	-79.98139954
4114	YKF	Waterloo Airport	North America	CA	Canada	Ontario	Kitchener	43.46080017	-80.37860107
4115	YKK	Kitkatla Seaplane Base	North America	CA	Canada	British Columbia	Kitkatla	53.79999924	-130.4329987
4116	YKT	Klemtu Water Aerodrome	North America	CA	Canada	British Columbia	Klemtu	52.60763455	-128.5217571
4117	YKE	Knee Lake Airport	North America	CA	Canada	Manitoba	Knee Lake	54.915298	-94.798103
4118	YBB	Kugaaruk Airport	North America	CA	Canada	Nunavut	Kugaaruk	68.534401	-89.808098
4119	YCO	Kugluktuk Airport	North America	CA	Canada	Nunavut	Kugluktuk	67.816704	-115.143997
4120	YVP	Kuujjuaq Airport	North America	CA	Canada	Quebec	Kuujjuaq	58.09609985	-68.42690277
4121	YGW	Kuujjuarapik Airport	North America	CA	Canada	Quebec	Kuujjuarapik	55.2818985	-77.76529694
4122	YGL	La Grande Rivi??re Airport	North America	CA	Canada	Quebec	La Grande Rivi??re	53.62530136	-77.70420074
4123	YAR	La Grande-3 Airport	North America	CA	Canada	Quebec	La Grande-3	53.57170105	-76.1964035
4124	YAH	La Grande-4 Airport	North America	CA	Canada	Quebec	La Grande-4	53.75469971	-73.6753006
4125	YTM	Mont-Tremblant International Airport	North America	CA	Canada	Quebec	La Macaza	46.409401	-74.779999
4126	ZGS	La Romaine Airport	North America	CA	Canada	Quebec	La Romaine	50.259701	-60.679401
4127	YVC	La Ronge Airport	North America	CA	Canada	Saskatchewan	La Ronge	55.15140152	-105.262001
4128	SSQ	La Sarre Airport	North America	CA	Canada	Quebec	La Sarre	48.91719818	-79.1785965
4129	ZLT	La Tabati??re Airport	North America	CA	Canada	Quebec	La Tabati??re	50.8307991	-58.9756012
4130	YLQ	La Tuque Airport	North America	CA	Canada	Quebec	La Tuque	47.40969849	-72.78890228
4131	XLB	Lac Brochet Airport	North America	CA	Canada	Manitoba	Lac Brochet	58.61750031	-101.4690018
4132	YLB	Lac La Biche Airport	North America	CA	Canada	Alberta	Lac La Biche	54.77030182	-112.0319977
4133	YLY	Langley Airport	North America	CA	Canada	British Columbia	Langley Twp	49.1008	-122.630997
4134	YLH	Lansdowne House Airport	North America	CA	Canada	Ontario	Lansdowne House	52.1955986	-87.93419647
4135	LRQ	Laurie River Airport	North America	CA	Canada	Manitoba	Laurie River	56.24860001	-101.3040009
4136	YLR	Leaf Rapids Airport	North America	CA	Canada	Manitoba	Leaf Rapids	56.51330185	-99.98529816
4137	YLS	Lebel-sur-Quevillon Airport	North America	CA	Canada	Quebec	Lebel-sur-Qu??villon	49.03030014	-77.01719666
4138	YQL	Lethbridge County Airport	North America	CA	Canada	Alberta	Lethbridge	49.63029861	-112.8000031
4139	ZGR	Little Grand Rapids Airport	North America	CA	Canada	Manitoba	Little Grand Rapids	52.04560089	-95.46579742
4140	YLL	Lloydminster Airport	North America	CA	Canada	Alberta	Lloydminster	53.30920029	-110.072998
4141	YXU	London Airport	North America	CA	Canada	Ontario	London	43.035599	-81.1539
4142	YLP	Mingan Airport	North America	CA	Canada	Quebec	Longue-Pointe-de-Mingan	50.2869	-64.1528
4143	YBX	Lourdes-de-Blanc-Sablon Airport	North America	CA	Canada	Quebec	Lourdes-de-Blanc-Sablon	51.4436	-57.185299
4144	YSG	Lutselk'e Airport	North America	CA	Canada	Northwest Territories	Lutselk'e	62.418303	-110.681998
4145	YYL	Lynn Lake Airport	North America	CA	Canada	Manitoba	Lynn Lake	56.86389923	-101.0759964
4146	XMP	Macmillan Pass Airport	North America	CA	Canada	Yukon	Macmillan Pass	63.18109894	-130.2019959
4147	YMN	Makkovik Airport	North America	CA	Canada	Newfoundland and Labrador	Makkovik	55.07690048	-59.18640137
4148	YMG	Manitouwadge Airport	North America	CA	Canada	Ontario	Manitouwadge	49.08390045	-85.86060333
4149	YMW	Maniwaki Airport	North America	CA	Canada	Quebec	Maniwaki	46.2728	-75.990601
4150	YMU	Mansons Landing Seaplane Base	North America	CA	Canada	British Columbia	Mansons Landing Seaplane Base	50.06669998	-124.9830017
4151	YAQ	Maple Bay Seaplane Base	North America	CA	Canada	British Columbia	Maple Bay	48.8167	-123.6084
4152	YSP	Marathon Airport	North America	CA	Canada	Ontario	Marathon	48.75529861	-86.3443985
4153	YMV	Mary River Aerodrome	North America	CA	Canada	Nunavut	Mary River	71.324167	-79.356944
4154	YMH	Mary's Harbour Airport	North America	CA	Canada	Newfoundland and Labrador	Mary's Harbour	52.30279922	-55.84719849
4155	ZMT	Masset Airport	North America	CA	Canada	British Columbia	Masset	54.02750015	-132.125
4156	YNM	Matagami Airport	North America	CA	Canada	Quebec	Matagami	49.76169968	-77.80280304
4157	YME	Matane Airport	North America	CA	Canada	Quebec	Matane	48.85689926	-67.45330048
4158	YMA	Mayo Airport	North America	CA	Canada	Yukon	Mayo	63.61640167	-135.8679962
4159	YLJ	Meadow Lake Airport	North America	CA	Canada	Saskatchewan	Meadow Lake	54.12530136	-108.5230026
4160	YXH	Medicine Hat Regional Airport	North America	CA	Canada	Alberta	Medicine Hat	50.018902	-110.721001
4161	YMB	Merritt Airport	North America	CA	Canada	British Columbia	Merritt	50.12279892	-120.7470016
4162	YCH	Miramichi Airport	North America	CA	Canada	New Brunswick	Miramichi	47.007801	-65.449203
4163	YQM	Greater Moncton Rom??o LeBlanc International Airport	North America	CA	Canada	New Brunswick	Moncton	46.112202	-64.678596
4164	YYY	Mont Joli Airport	North America	CA	Canada	Quebec	Mont-Joli	48.60860062	-68.20809937
4165	YUL	Montreal / Pierre Elliott Trudeau International Airport	North America	CA	Canada	Quebec	Montr??al	45.47060013	-73.74079895
4166	YHU	Montr??al / Saint-Hubert Airport	North America	CA	Canada	Quebec	Montr??al	45.51750183	-73.41690063
4167	YMX	Montreal International (Mirabel) Airport	North America	CA	Canada	Quebec	Montr??al	45.679501	-74.038696
4168	YMJ	Moose Jaw Air Vice Marshal C. M. McEwen Airport	North America	CA	Canada	Saskatchewan	Moose Jaw	50.33029938	-105.5589981
4169	YMO	Moosonee Airport	North America	CA	Canada	Ontario	Moosonee	51.29109955	-80.60780334
4170	YQA	Muskoka Airport	North America	CA	Canada	Ontario	Muskoka	44.97470093	-79.30329895
4171	MSA	Muskrat Dam Airport	North America	CA	Canada	Ontario	Muskrat Dam	53.44139862	-91.76280212
4172	YDP	Nain Airport	North America	CA	Canada	Newfoundland and Labrador	Nain	56.54919815	-61.68030167
4173	YQN	Nakina Airport	North America	CA	Canada	Ontario	Nakina	50.18280029	-86.6964035
4174	ZNU	Namu Water Aerodrome	North America	CA	Canada	British Columbia	Namu	51.862825	-127.869357
4175	YCD	Nanaimo Airport	North America	CA	Canada	British Columbia	Nanaimo	49.05497	-123.869863
4176	ZNA	Nanaimo Harbour Water Airport	North America	CA	Canada	British Columbia	Nanaimo	49.169813	-123.933845
4177	YNA	Natashquan Airport	North America	CA	Canada	Quebec	Natashquan	50.18999863	-61.78919983
4178	YNP	Natuashish Airport	North America	CA	Canada	Newfoundland and Labrador	Natuashish	55.913898	-61.184399
4179	YNS	Nemiscau Airport	North America	CA	Canada	Quebec	Nemiscau	51.69110107	-76.13559723
4180	YVQ	Norman Wells Airport	North America	CA	Canada	Northwest Territories	Norman Wells	65.28160095	-126.7979965
4181	YQW	North Battleford Airport	North America	CA	Canada	Saskatchewan	North Battleford	52.769409	-108.243742
4182	YYB	North Bay Jack Garland Airport	North America	CA	Canada	Ontario	North Bay	46.363602	-79.422798
4183	YNO	North Spirit Lake Airport	North America	CA	Canada	Ontario	North Spirit Lake	52.49000168	-92.97109985
4184	YNE	Norway House Airport	North America	CA	Canada	Manitoba	Norway House	53.95830154	-97.84420013
4185	YDW	North of Sixty Airport	North America	CA	Canada	Northwest Territories	Obre Lake	60.31639862	-103.1289978
4186	ZOF	Ocean Falls Seaplane Base	North America	CA	Canada	British Columbia	Ocean Falls	52.36669922	-127.7170029
4187	YOG	Ogoki Post Airport	North America	CA	Canada	Ontario	Ogoki Post	51.65859985	-85.90170288
4188	YOC	Old Crow Airport	North America	CA	Canada	Yukon	Old Crow	67.57060242	-139.8390045
4189	YBS	Opapimiskan Lake Airport	North America	CA	Canada	Ontario	Opapimiskan Lake	52.6067009	-90.37689972
4190	YOO	Oshawa Executive Airport	North America	CA	Canada	Ontario	Oshawa	43.922798	-78.894997
4191	YRO	Ottawa / Rockcliffe Airport	North America	CA	Canada	Ontario	Ottawa	45.46030045	-75.64610291
4192	TR7	Ottawa / Rockcliffe Seaplane Base	North America	CA	Canada	Ontario	Ottawa	45.46383295	-75.64254284
4193	YOW	Ottawa Macdonald-Cartier International Airport	North America	CA	Canada	Ontario	Ottawa	45.32249832	-75.66919708
4194	YOS	Owen Sound / Billy Bishop Regional Airport	North America	CA	Canada	Ontario	Owen Sound	44.59030151	-80.83750153
4195	YOH	Oxford House Airport	North America	CA	Canada	Manitoba	Oxford House	54.93330002	-95.27890015
4196	YXP	Pangnirtung Airport	North America	CA	Canada	Nunavut	Pangnirtung	66.14499664	-65.71360016
4197	YPD	Parry Sound Area Municipal Airport	North America	CA	Canada	Ontario	Parry Sound	45.2575	-79.829697
4198	YPC	Paulatuk (Nora Aliqatchialuk Ruben) Airport	North America	CA	Canada	Northwest Territories	Paulatuk	69.36083812	-124.07547
4199	YPE	Peace River Airport	North America	CA	Canada	Alberta	Peace River	56.226898	-117.446999
4200	YPO	Peawanuck Airport	North America	CA	Canada	Ontario	Peawanuck	54.98809814	-85.44329834
4201	YTA	Pembroke Airport	North America	CA	Canada	Ontario	Pembroke	45.86439896	-77.25170135
4202	YYF	Penticton Airport	North America	CA	Canada	British Columbia	Penticton	49.46310043	-119.6019974
4203	YWA	Petawawa Airport	North America	CA	Canada	Ontario	Petawawa	45.95220184	-77.31919861
4204	YPQ	Peterborough Municipal Airport	North America	CA	Canada	Ontario	Peterborough	44.23	-78.363297
4205	YPL	Pickle Lake Airport	North America	CA	Canada	Ontario	Pickle Lake	51.44639969	-90.21420288
4206	YPM	Pikangikum Airport	North America	CA	Canada	Ontario	Pikangikum	51.81969833	-93.97329712
4207	PIW	Pikwitonei Airport	North America	CA	Canada	Manitoba	Pikwitonei	55.58890152	-97.16419983
4208	WPC	Pincher Creek Airport	North America	CA	Canada	Alberta	Pincher Creek	49.52059937	-113.9970016
4209	ZPO	Pinehouse Lake Airport	North America	CA	Canada	Saskatchewan	Pinehouse Lake	55.52809906	-106.5820007
4210	YNL	Points North Landing Airport	North America	CA	Canada	Saskatchewan	Points North Landing	58.27669907	-104.0820007
4211	YIO	Pond Inlet Airport	North America	CA	Canada	Nunavut	Pond Inlet	72.6832962	-77.96669769
4212	YHP	Poplar Hill Airport	North America	CA	Canada	Ontario	Poplar Hill	52.1133	-94.2556
4213	XPP	Poplar River Airport	North America	CA	Canada	Manitoba	Poplar River	52.99652588	-97.27419376
4214	YPB	Alberni Valley Regional Airport	North America	CA	Canada	British Columbia	Port Alberni	49.321899	-124.931
4215	YZT	Port Hardy Airport	North America	CA	Canada	British Columbia	Port Hardy	50.68059921	-127.3669968
4216	YPS	Port Hawkesbury Airport	North America	CA	Canada	Nova Scotia	Port Hawkesbury	45.65670013	-61.36809921
4217	YHA	Port Hope Simpson Airport	North America	CA	Canada	Newfoundland and Labrador	Port Hope Simpson	52.52809906	-56.28609848
4218	YMP	Port Mcneill Airport	North America	CA	Canada	British Columbia	Port Mcneill	50.57559967	-127.0289993
4219	YPN	Port Menier Airport	North America	CA	Canada	Quebec	Port-Menier	49.83639908	-64.28859711
4220	YPG	Portage-la-Prairie / Southport Airport	North America	CA	Canada	Manitoba	Portage la Prairie	49.903099	-98.273817
4221	YSO	Postville Airport	North America	CA	Canada	Newfoundland and Labrador	Postville	54.9105	-59.78507
4222	WPL	Powell Lake Seaplane Base	North America	CA	Canada	British Columbia	Powell Lake Seaplane Base	49.88330078	-124.5329971
4223	YPW	Powell River Airport	North America	CA	Canada	British Columbia	Powell River	49.83420181	-124.5
4224	YPA	Prince Albert Glass Field	North America	CA	Canada	Saskatchewan	Prince Albert	53.21419907	-105.6729965
4225	YXS	Prince George Airport	North America	CA	Canada	British Columbia	Prince George	53.88940048	-122.6790009
4226	YPR	Prince Rupert Airport	North America	CA	Canada	British Columbia	Prince Rupert	54.28609848	-130.4450073
4227	ZSW	Prince Rupert/Seal Cove Seaplane Base	North America	CA	Canada	British Columbia	Prince Rupert/Seal Cove Seaplane Base	54.33330154	-130.2830048
4228	XPK	Pukatawagan Airport	North America	CA	Canada	Manitoba	Pukatawagan	55.74919891	-101.2659988
4229	YPX	Puvirnituq Airport	North America	CA	Canada	Quebec	Puvirnituq	60.05059814	-77.28690338
4230	YVM	Qikiqtarjuaq Airport	North America	CA	Canada	Nunavut	Qikiqtarjuaq	67.54579926	-64.03140259
4231	YQJ	April Point Seaplane Base	North America	CA	Canada	British Columbia	Quadra Island	50.065	-125.235
4232	XQU	Qualicum Beach Airport	North America	CA	Canada	British Columbia	Qualicum Beach	49.3372	-124.393997
4233	YQC	Quaqtaq Airport	North America	CA	Canada	Quebec	Quaqtaq	61.04639816	-69.61779785
4234	YQB	Quebec Jean Lesage International Airport	North America	CA	Canada	Quebec	Quebec	46.7911	-71.393303
4235	YQZ	Quesnel Airport	North America	CA	Canada	British Columbia	Quesnel	53.02610016	-122.5100021
4236	YOP	Rainbow Lake Airport	North America	CA	Canada	Alberta	Rainbow Lake	58.49140167	-119.4079971
4237	YRT	Rankin Inlet Airport	North America	CA	Canada	Nunavut	Rankin Inlet	62.81140137	-92.11579895
4238	YRL	Red Lake Airport	North America	CA	Canada	Ontario	Red Lake	51.06689835	-93.79309845
4239	YRS	Red Sucker Lake Airport	North America	CA	Canada	Manitoba	Red Sucker Lake	54.16719818	-93.55719757
4240	YQR	Regina International Airport	North America	CA	Canada	Saskatchewan	Regina	50.43190002	-104.6660004
4241	YUT	Naujaat Airport	North America	CA	Canada	Nunavut	Repulse Bay	66.5214	-86.224701
4242	YRB	Resolute Bay Airport	North America	CA	Canada	Nunavut	Resolute Bay	74.71690369	-94.9693985
4243	YRV	Revelstoke Airport	North America	CA	Canada	British Columbia	Revelstoke	50.962245	-118.184258
4244	YRG	Rigolet Airport	North America	CA	Canada	Newfoundland and Labrador	Rigolet	54.17969894	-58.45750046
4245	YXK	Rimouski Airport	North America	CA	Canada	Quebec	Rimouski	48.47809982	-68.49690247
4246	YRN	Rivers Inlet Seaplane Base	North America	CA	Canada	British Columbia	Rivers Inlet	51.683985	-127.264044
4247	YRI	Rivi??re-du-Loup Airport	North America	CA	Canada	Quebec	Rivi??re-du-Loup	47.76440048	-69.58470154
4248	YRJ	Roberval Airport	North America	CA	Canada	Quebec	Roberval	48.52000046	-72.26560211
4249	YRM	Rocky Mountain House Airport	North America	CA	Canada	Alberta	Rocky Mountain House	52.42969894	-114.9039993
4250	XRR	Ross River Airport	North America	CA	Canada	Yukon	Ross River	61.97060013	-132.4230042
4251	ZRJ	Round Lake (Weagamow Lake) Airport	North America	CA	Canada	Ontario	Round Lake	52.9435997	-91.31279755
4252	YUY	Rouyn Noranda Airport	North America	CA	Canada	Quebec	Rouyn-Noranda	48.20610046	-78.83560181
4253	YSA	Sable Island Landing Strip	North America	CA	Canada	Nova Scotia	Sable Island	43.930951	-59.996147
4254	ZPB	Sachigo Lake Airport	North America	CA	Canada	Ontario	Sachigo Lake	53.89110184	-92.1964035
4255	YSY	Sachs Harbour (David Nasogaluak Jr. Saaryuaq) Airport	North America	CA	Canada	Northwest Territories	Sachs Harbour	71.99389648	-125.2429962
4256	YSJ	Saint John Airport	North America	CA	Canada	New Brunswick	Saint John	45.31610107	-65.89029694
4257	YZG	Salluit Airport	North America	CA	Canada	Quebec	Salluit	62.1794014	-75.66719818
4258	YSN	Shuswap Regional Airport	North America	CA	Canada	British Columbia	Salmon Arm	50.682802	-119.228996
4259	YGG	Ganges Seaplane Base	North America	CA	Canada	British Columbia	Salt Spring Island	48.8545	-123.4969
4260	YZP	Sandspit Airport	North America	CA	Canada	British Columbia	Sandspit	53.25429916	-131.8139954
4261	ZSJ	Sandy Lake Airport	North America	CA	Canada	Ontario	Sandy Lake	53.06420135	-93.3443985
4262	YSK	Sanikiluaq Airport	North America	CA	Canada	Nunavut	Sanikiluaq	56.53779984	-79.24669647
4263	YUX	Hall Beach Airport	North America	CA	Canada	Nunavut	Sanirajak	68.7761	-81.2425
4264	YZR	Chris Hadfield Airport	North America	CA	Canada	Ontario	Sarnia	42.99940109	-82.30889893
4265	YXE	Saskatoon John G. Diefenbaker International Airport	North America	CA	Canada	Saskatchewan	Saskatoon	52.17079926	-106.6999969
4266	YAJ	Lyall Harbour Seaplane Base	North America	CA	Canada	British Columbia	Saturna Island	48.7952	-123.1816
4267	YAM	Sault Ste Marie Airport	North America	CA	Canada	Ontario	Sault Ste Marie	46.485001	-84.509399
4268	YKL	Schefferville Airport	North America	CA	Canada	Quebec	Schefferville	54.80530167	-66.80529785
4269	YHS	Sechelt-Gibsons Airport	North America	CA	Canada	British Columbia	Sechelt	49.46060181	-123.7190018
4270	YZV	Sept-??les Airport	North America	CA	Canada	Quebec	Sept-??les	50.22330093	-66.26560211
4271	ZTM	Shamattawa Airport	North America	CA	Canada	Manitoba	Shamattawa	55.86560059	-92.08139801
4272	YEM	Manitoulin East Municipal Airport	North America	CA	Canada	Ontario	Sheguiandah	45.842435	-81.857595
4273	YSC	Sherbrooke Airport	North America	CA	Canada	Quebec	Sherbrooke	45.438599	-71.691399
4274	YXL	Sioux Lookout Airport	North America	CA	Canada	Ontario	Sioux Lookout	50.11389923	-91.90529633
4275	YZH	Slave Lake Airport	North America	CA	Canada	Alberta	Slave Lake	55.29309845	-114.7770004
4276	YSU	Summerside Airport	North America	CA	Canada	Prince Edward Island	Slemon Park	46.440601	-63.833599
4277	YYD	Smithers Airport	North America	CA	Canada	British Columbia	Smithers	54.8246994	-127.1829987
4278	YSH	Smiths Falls-Montague (Russ Beach) Airport	North America	CA	Canada	Ontario	Smiths Falls	44.945801	-75.940598
4279	YNX	Snap Lake Airport	North America	CA	Canada	Northwest Territories	Snap Lake Mine	63.593601	-110.905998
4280	XSI	South Indian Lake Airport	North America	CA	Canada	Manitoba	South Indian Lake	56.7928009	-98.90720367
4281	YQF	Red Deer Regional Airport	North America	CA	Canada	Alberta	Springbrook	52.182201	-113.893997
4282	YSE	Squamish Airport	North America	CA	Canada	British Columbia	Squamish	49.78170013	-123.1620026
4283	YCM	Niagara District Airport	North America	CA	Canada	Ontario	St Catharines	43.19169998	-79.17169952
4284	YJN	St Jean Airport	North America	CA	Canada	Quebec	St Jean	45.29439926	-73.28109741
4285	YSL	St Leonard Airport	North America	CA	Canada	New Brunswick	St Leonard	47.15750122	-67.83470154
4286	YQS	St Thomas Municipal Airport	North America	CA	Canada	Ontario	St Thomas	42.77000046	-81.1108017
4287	YIF	St Augustin Airport	North America	CA	Canada	Quebec	St-Augustin	51.21170044	-58.65829849
4288	YAY	St. Anthony Airport	North America	CA	Canada	Newfoundland and Labrador	St. Anthony	51.39189911	-56.08309937
4289	YYT	St. John's International Airport	North America	CA	Canada	Newfoundland and Labrador	St. John's	47.61859894	-52.75189972
4290	YFX	St. Lewis (Fox Harbour) Airport	North America	CA	Canada	Newfoundland and Labrador	St. Lewis	52.37279892	-55.6739006
4291	ZSP	St. Paul Airport	North America	CA	Canada	Alberta	St. Paul	53.99330139	-111.3799973
4292	YST	St. Theresa Point Airport	North America	CA	Canada	Manitoba	St. Theresa Point	53.84560013	-94.85189819
4293	YJT	Stephenville Airport	North America	CA	Canada	Newfoundland and Labrador	Stephenville	48.5442009	-58.54999924
4294	ZST	Stewart Airport	North America	CA	Canada	British Columbia	Stewart	55.93541045	-129.9824345
4295	YSF	Stony Rapids Airport	North America	CA	Canada	Saskatchewan	Stony Rapids	59.25030136	-105.8410034
4296	YIG	Big Bay Seaplane Base	North America	CA	Canada	British Columbia	Stuart Island	50.3923	-125.1372
4297	YSB	Sudbury Airport	North America	CA	Canada	Ontario	Sudbury	46.625	-80.79889679
4298	YTG	Sullivan Bay Seaplane Base	North America	CA	Canada	British Columbia	Sullivan Bay	50.885359	-126.831069
4299	SUR	Summer Beaver Airport	North America	CA	Canada	Ontario	Summer Beaver	52.70859909	-88.54190063
4300	YFI	Fort Mackay / Firebag	North America	CA	Canada	Alberta	Suncor Energy Site	57.275833	-110.976666
4301	YPT	Pender Harbour Seaplane Base	North America	CA	Canada	British Columbia	Sunshine Coast	49.623785	-124.024884
4302	ZJN	Swan River Airport	North America	CA	Canada	Manitoba	Swan River	52.120602	-101.236
4303	YYN	Swift Current Airport	North America	CA	Canada	Saskatchewan	Swift Current	50.29190063	-107.6910019
4304	YQY	Sydney / J.A. Douglas McCurdy Airport	North America	CA	Canada	Nova Scotia	Sydney	46.1614	-60.047798
4305	XTL	Tadoule Lake Airport	North America	CA	Canada	Manitoba	Tadoule Lake	58.7061	-98.512199
4306	ZTS	Tahsis Seaplane Base	North America	CA	Canada	British Columbia	Tahsis	49.91669846	-126.6669998
4307	YYH	Taloyoak Airport	North America	CA	Canada	Nunavut	Taloyoak	69.5467	-93.576698
4308	GSL	Taltheilei Narrows Airport	North America	CA	Canada	Northwest Territories	Taltheilei Narrows	62.59809875	-111.5429993
4309	YTQ	Tasiujaq Airport	North America	CA	Canada	Quebec	Tasiujaq	58.6678009	-69.95580292
4310	YXT	Northwest Regional Airport Terrace-Kitimat	North America	CA	Canada	British Columbia	Terrace	54.468498	-128.576009
4311	YZW	Teslin Airport	North America	CA	Canada	Yukon	Teslin	60.17279816	-132.7429962
4312	ZTB	T??te-??-la-Baleine Airport	North America	CA	Canada	Quebec	T??te-??-la-Baleine	50.67440033	-59.38359833
4313	YGB	Texada Gillies Bay Airport	North America	CA	Canada	British Columbia	Texada	49.69419861	-124.5179977
4314	YQD	The Pas Airport	North America	CA	Canada	Manitoba	The Pas	53.97140121	-101.0910034
4315	YBQ	Telegraph Harbour Seaplane Base	North America	CA	Canada	British Columbia	Thetis Island	48.97	-123.664
4316	YTD	Thicket Portage Airport	North America	CA	Canada	Manitoba	Thicket Portage	55.31890106	-97.70780182
4317	YTH	Thompson Airport	North America	CA	Canada	Manitoba	Thompson	55.80110168	-97.86419678
4318	YQT	Thunder Bay Airport	North America	CA	Canada	Ontario	Thunder Bay	48.37189865	-89.32389832
4319	YTS	Timmins/Victor M. Power	North America	CA	Canada	Ontario	Timmins	48.56969833	-81.37670136
4320	YTT	Tisdale Airport	North America	CA	Canada	Saskatchewan	Tisdale	52.83670044	-104.0670013
4321	YAZ	Tofino / Long Beach Airport	North America	CA	Canada	British Columbia	Tofino	49.079833	-125.775583
4322	YTP	Tofino Harbour Seaplane Base	North America	CA	Canada	British Columbia	Tofino Harbour	49.155	-125.91
4323	YTZ	Billy Bishop Toronto City Centre Airport	North America	CA	Canada	Ontario	Toronto	43.627499	-79.396202
4324	YKZ	Buttonville Municipal Airport	North America	CA	Canada	Ontario	Toronto	43.86220169	-79.37000275
4325	YYZ	Lester B. Pearson International Airport	North America	CA	Canada	Ontario	Toronto	43.67720032	-79.63059998
4326	YZZ	Trail Airport	North America	CA	Canada	British Columbia	Trail	49.055599	-117.609001
4327	YTR	CFB Trenton	North America	CA	Canada	Ontario	Trenton	44.1189003	-77.52809906
4328	YRQ	Trois-Rivi??res Airport	North America	CA	Canada	Quebec	Trois-Rivi??res	46.35279846	-72.67939758
4329	YUB	Tuktoyaktuk / James Gruben Airport	North America	CA	Canada	Northwest Territories	Tuktoyaktuk	69.433296	-133.026001
4330	ZFN	Tulita Airport	North America	CA	Canada	Northwest Territories	Tulita	64.909697	-125.572998
4331	TUX	Tumbler Ridge Airport	North America	CA	Canada	British Columbia	Tumbler Ridge	55.02500153	-120.9349976
4332	TNS	Tungsten (Cantung) Airport	North America	CA	Canada	Northwest Territories	Tungsten	61.95690155	-128.2030029
4333	YHI	Ulukhaktok Holman Airport	North America	CA	Canada	Northwest Territories	Ulukhaktok	70.76280212	-117.8059998
4334	YUD	Umiujaq Airport	North America	CA	Canada	Quebec	Umiujaq	56.53609848	-76.51830292
4335	YBE	Uranium City Airport	North America	CA	Canada	Saskatchewan	Uranium City	59.56140137	-108.4810028
4336	YVO	Val-d'Or Airport	North America	CA	Canada	Quebec	Val-d'Or	48.05329895	-77.78279877
4337	YDT	Boundary Bay Airport	North America	CA	Canada	British Columbia	Vancouver	49.0742	-123.012001
4338	CXH	Vancouver Harbour Water Aerodrome	North America	CA	Canada	British Columbia	Vancouver	49.291265	-123.11717
4339	YVR	Vancouver International Airport	North America	CA	Canada	British Columbia	Vancouver	49.19390106	-123.1839981
4340	YVG	Vermilion Airport	North America	CA	Canada	Alberta	Vermilion	53.35580063	-110.8239975
4341	YVE	Vernon Airport	North America	CA	Canada	British Columbia	Vernon	50.24810028	-119.3310013
4342	YWH	Victoria Harbour Seaplane Base	North America	CA	Canada	British Columbia	Victoria	48.423782	-123.37198
4343	YYJ	Victoria International Airport	North America	CA	Canada	British Columbia	Victoria	48.6469	-123.426003
4344	YWK	Wabush Airport	North America	CA	Canada	Newfoundland and Labrador	Wabush	52.9219017	-66.86440277
4345	YKQ	Waskaganish Airport	North America	CA	Canada	Quebec	Waskaganish	51.47330093	-78.75830078
4346	YQH	Watson Lake Airport	North America	CA	Canada	Yukon	Watson Lake	60.11640167	-128.8220062
4347	YXZ	Wawa Airport	North America	CA	Canada	Ontario	Wawa	47.96670151	-84.78669739
4348	YWP	Webequie Airport	North America	CA	Canada	Ontario	Webequie	52.9593934	-87.37486839
4349	YFJ	Wekwe??t?? Airport	North America	CA	Canada	Northwest Territories	Wekwe??t??	64.190804	-114.077002
4350	YNC	Wemindji Airport	North America	CA	Canada	Quebec	Wemindji	53.01060104	-78.83110046
4351	YXN	Whale Cove Airport	North America	CA	Canada	Nunavut	Whale Cove	62.24000168	-92.59809875
4352	YLE	What?? Airport	North America	CA	Canada	Northwest Territories	What??	63.13169861	-117.2460022
4353	YWS	Whistler/Green Lake Water Aerodrome	North America	CA	Canada	British Columbia	Whistler	50.14360046	-122.9489975
4354	YWR	White River Seaplane Base	North America	CA	Canada	Ontario	White River	48.6269	-85.223297
4355	YZU	Whitecourt Airport	North America	CA	Canada	Alberta	Whitecourt	54.14390182	-115.7870026
4356	YXY	Whitehorse / Erik Nielsen International Airport	North America	CA	Canada	Yukon	Whitehorse	60.709599	-135.067001
4357	YVV	Wiarton Airport	North America	CA	Canada	Ontario	Wiarton	44.7458	-81.107201
4358	YWM	Williams Harbour Airport	North America	CA	Canada	Newfoundland and Labrador	Williams Harbour	52.56689835	-55.78469849
4359	YWL	Williams Lake Airport	North America	CA	Canada	British Columbia	Williams Lake	52.18310165	-122.0540009
4360	YQG	Windsor Airport	North America	CA	Canada	Ontario	Windsor	42.27560043	-82.95559692
4361	YWG	Winnipeg / James Armstrong Richardson International Airport	North America	CA	Canada	Manitoba	Winnipeg	49.90999985	-97.23989868
4362	ZWL	Wollaston Lake Airport	North America	CA	Canada	Saskatchewan	Wollaston Lake	58.10689926	-103.1719971
4363	YWY	Wrigley Airport	North America	CA	Canada	Northwest Territories	Wrigley	63.20940018	-123.4369965
4364	WNN	Wunnumin Lake Airport	North America	CA	Canada	Ontario	Wunnumin Lake	52.89390182	-89.28919983
4365	YQI	Yarmouth Airport	North America	CA	Canada	Nova Scotia	Yarmouth	43.82690048	-66.08809662
4366	YZF	Yellowknife International Airport	North America	CA	Canada	Northwest Territories	Yellowknife	62.462799	-114.440002
4367	ZAC	York Landing Airport	North America	CA	Canada	Manitoba	York Landing	56.08940125	-96.08920288
4368	YQV	Yorkton Municipal Airport	North America	CA	Canada	Saskatchewan	Yorkton	51.26470184	-102.461998
4369	BON	Flamingo International Airport	North America	BQ	Caribbean Netherlands	Kralendijk, Bonaire	Kralendijk, Bonaire	12.131	-68.268501
4370	SAB	Juancho E. Yrausquin Airport	North America	BQ	Caribbean Netherlands	Saba	Saba	17.64500046	-63.22000122
4371	EUX	F. D. Roosevelt Airport	North America	BQ	Caribbean Netherlands	Sint Eustatius	Sint Eustatius	17.49650002	-62.97940063
4372	CYB	Charles Kirkconnell International Airport	North America	KY	Cayman Islands	Cayman Brac	Cayman Brac	19.687	-79.882797
4373	GCM	Owen Roberts International Airport	North America	KY	Cayman Islands	Georgetown	Georgetown	19.2928009	-81.35769653
4374	LYB	Edward Bodden Little Cayman Airfield	North America	KY	Cayman Islands	Little Cayman	Little Cayman	19.660161	-80.088826
4375	ACM	Arica Airport	North America	CO	Colombia	Amazonas Department	Arica	-2.144851	-71.758389
4376	FMG	Flamingo Airport	North America	CR	Costa Rica	Guanacaste	Brasilito	10.41860008	-85.78269958
4377	CSC	Mojica Airport	North America	CR	Costa Rica	Guanacaste	Ca??as	10.4307003	-85.17459869
4378	PLD	Playa Samara/Carrillo Airport	North America	CR	Costa Rica	Guanacaste	Carrillo	9.870510101	-85.48139954
4379	OTR	Coto 47 Airport	North America	CR	Costa Rica	Puntarenas	Corredores	8.601559639	-82.96859741
4380	TOO	San Vito De Java Airport	North America	CR	Costa Rica	Puntarenas	Coto Brus	8.826109886	-82.95890045
4381	GLF	Golfito Airport	North America	CR	Costa Rica	Puntarenas	Golfito	8.654009819	-83.18219757
4382	FON	La Fortuna Arenal Airport	North America	CR	Costa Rica	Alajuela	La Fortuna	10.469311	-84.579073
4383	LIR	Guanacaste Airport	North America	CR	Costa Rica	Guanacaste	Liberia	10.5933	-85.544403
4384	LSL	Los Chiles Airport	North America	CR	Costa Rica	Alajuela	Los Chiles	11.03530025	-84.70610046
4385	PBP	Islita Airport	North America	CR	Costa Rica	Guanacaste	Nandayure	9.856109619	-85.3707962
4386	NOB	Nosara Airport	North America	CR	Costa Rica	Guanacaste	Nicoya	9.976490021	-85.65299988
4387	TMU	Tambor Airport	North America	CR	Costa Rica	Puntarenas	Nicoya	9.739307	-85.016199
4388	NCT	Guanacaste Airport	North America	CR	Costa Rica	Guanacaste	Nicoya/Guanacate	10.13939953	-85.44580078
4389	PMZ	Palmar Sur Airport	North America	CR	Costa Rica	Puntarenas	Palmar Sur	8.951029778	-83.46859741
4390	IPZ	San Isidro del General Airport	North America	CR	Costa Rica	San Jose	P??rez Zeled??n	9.35262	-83.713097
4391	BCL	Barra del Colorado Airport	North America	CR	Costa Rica	Limon	Pococi	10.76869965	-83.58560181
4392	GPL	Guapiles Airport	North America	CR	Costa Rica	Limon	Pococi	10.21720028	-83.79699707
4393	PJM	Puerto Jimenez Airport	North America	CR	Costa Rica	Puntarenas	Puerto Jimenez	8.533329964	-83.30000305
4394	LIO	Limon International Airport	North America	CR	Costa Rica	Limon	Puerto Limon	9.957960129	-83.02200317
4395	BAI	Buenos Aires Airport	North America	CR	Costa Rica	Puntarenas	Punta Arenas	9.163949	-83.330171
4396	JAP	Chacarita Airport	North America	CR	Costa Rica	Puntarenas	Puntarenas	9.981410027	-84.77269745
4397	DRK	Drake Bay Airport	North America	CR	Costa Rica	Puntarenas	Puntarenas	8.71889019	-83.64170074
4398	XQP	Quepos Managua Airport	North America	CR	Costa Rica	Puntarenas	Quepos	9.443160057	-84.12979889
4399	RFR	Rio Frio / Progreso Airport	North America	CR	Costa Rica	Heredia	Rio Frio / Progreso	10.32740021	-83.88760376
4400	TTQ	Aerotortuguero Airport	North America	CR	Costa Rica	Limon	Roxana	10.42	-83.6095
4401	SYQ	Tob??as Bola??os International Airport	North America	CR	Costa Rica	San Jose	San Jose	9.95705	-84.139801
4402	SJO	Juan Santamar??a International Airport	North America	CR	Costa Rica	Alajuela	San Jos?? (Alajuela)	9.99386	-84.208801
4403	TNO	Tamarindo Airport	North America	CR	Costa Rica	Guanacaste	Tamarindo	10.3135004	-85.81549835
4404	UPL	Upala Airport	North America	CR	Costa Rica	Alajuela	Upala	10.8922	-85.016197
4405	BCA	Gustavo Rizo Airport	North America	CU	Cuba	Guant??namo Province	Baracoa	20.36529922	-74.5062027
4406	BYM	Carlos Manuel de Cespedes Airport	North America	CU	Cuba	Granma Province	Bayamo	20.39640045	-76.62139893
4407	CMW	Ignacio Agramonte International Airport	North America	CU	Cuba	Camag??ey Province	Camaguey	21.42029953	-77.84750366
4408	CCC	Jardines Del Rey Airport	North America	CU	Cuba	Ciego de ??vila Province	Cayo Coco	22.46100044	-78.32839966
4409	CYO	Vilo Acu??a International Airport	North America	CU	Cuba	Isla de la Juventud (special municipality)	Cayo Largo del Sur	21.61650085	-81.54599762
4410	BWW	Las Brujas Airport	North America	CU	Cuba	Sancti Sp??ritus	Cayo Santa Maria	22.62129974	-79.14720154
4411	AVI	Maximo Gomez Airport	North America	CU	Cuba	Ciego de ??vila Province	Ciego de Avila	22.02709961	-78.78959656
4412	CFG	Jaime Gonzalez Airport	North America	CU	Cuba	Cienfuegos Province	Cienfuegos	22.14999962	-80.41419983
4413	GAO	Mariana Grajales Airport	North America	CU	Cuba	Guant??namo Province	Guant??namo	20.08530045	-75.15830231
4414	NBW	Leeward Point Field	North America	CU	Cuba	Guant??namo Province	Guantanamo Bay Naval Station	19.90649986	-75.20709991
4415	UPB	Playa Baracoa Airport	North America	CU	Cuba	Artemisa Province	Havana	23.03280067	-82.57939911
4416	HAV	Jos?? Mart?? International Airport	North America	CU	Cuba	La Habana Province	Havana	22.98920059	-82.40910339
4417	HOG	Frank Pais International Airport	North America	CU	Cuba	Holgu??n Province	Holguin	20.78560066	-76.31510162
4418	SZJ	Siguanea Airport	North America	CU	Cuba	Isla de la Juventud (special municipality)	Isla de la Juventud	21.64249992	-82.95510101
4419	VTU	Hermanos Ameijeiras Airport	North America	CU	Cuba	Las Tunas Province	Las Tunas	20.98760033	-76.93579865
4420	UMA	Punta de Maisi Airport	North America	CU	Cuba	Guant??namo Province	Maisi	20.242374	-74.148268
4421	MZO	Sierra Maestra Airport	North America	CU	Cuba	Granma Province	Manzanillo	20.28809929	-77.08920288
4422	MJG	Mayajigua Airport	North America	CU	Cuba	Sancti Sp??ritus	Mayajigua	22.23080063	-79.06220245
4423	MOA	Orestes Acosta Airport	North America	CU	Cuba	Holgu??n Province	Moa	20.65390015	-74.92220306
4424	ICR	Nicaro Airport	North America	CU	Cuba	Holgu??n Province	Nicaro	20.68860054	-75.53150177
4425	GER	Rafael Cabrera Airport	North America	CU	Cuba	Isla de la Juventud (special municipality)	Nueva Gerona	21.83469963	-82.78379822
4426	LCL	La Coloma Airport	North America	CU	Cuba	Pinar del R??o Province	Pinar del Rio	22.33609962	-83.64189911
4427	SNJ	San Julian Air Base	North America	CU	Cuba	Pinar del R??o Province	Pinar Del Rio	22.09530067	-84.15200043
4428	QSN	San Nicolas De Bari Airport	North America	CU	Cuba	Mayabeque Province	San Nicol??s	22.7561	-81.920898
4429	USS	Sancti Spiritus Airport	North America	CU	Cuba	Sancti Sp??ritus	Sancti Spiritus	21.9704	-79.442703
4430	SNU	Abel Santamaria Airport	North America	CU	Cuba	Villa Clara Province	Santa Clara	22.49220085	-79.94360352
4431	SCU	Antonio Maceo International Airport	North America	CU	Cuba	Santiago de Cuba Province	Santiago	19.96980095	-75.83540344
4432	TND	Alberto Delgado Airport	North America	CU	Cuba	Sancti Sp??ritus	Trinidad	21.78829956	-79.99720001
4433	VRA	Juan Gualberto Gomez International Airport	North America	CU	Cuba	Matanzas Province	Varadero	23.03440094	-81.43530273
4434	VRO	Kawama Airport	North America	CU	Cuba	Matanzas Province	Varadero	23.124001	-81.301598
4435	CUR	Hato International Airport	North America	CW	Cura??ao	Willemstad	Willemstad	12.1889	-68.959801
4436	DCF	Canefield Airport	North America	DM	Dominica	Saint Paul Parish	Canefield	15.336693	-61.392108
4437	DOM	Douglas-Charles Airport	North America	DM	Dominica	Saint Andrew Parish	Marigot	15.547	-61.299999
4438	BRX	Maria Montez International Airport	North America	DO	Dominican Republic	Barahona Province	Barahona	18.25149918	-71.12039948
4439	CBJ	Cabo Rojo Airport	North America	DO	Dominican Republic	Pedernales Province	Cabo Rojo	17.92900085	-71.64479828
4440	COZ	Constanza - Expedici??n 14 de Junio National Airport	North America	DO	Dominican Republic	La Vega Province	Costanza	18.907499	-70.721901
4441	JBQ	La Isabela International Airport	North America	DO	Dominican Republic	Distrito Nacional	La Isabela	18.57250023	-69.98560333
4442	LRM	Casa De Campo International Airport	North America	DO	Dominican Republic	La Romana Province	La Romana	18.45070076	-68.91179657
4443	POP	Gregorio Luperon International Airport	North America	DO	Dominican Republic	Puerto Plata Province	Puerto Plata	19.75790024	-70.56999969
4444	PUJ	Punta Cana International Airport	North America	DO	Dominican Republic	La Altagracia Province	Punta Cana	18.56739998	-68.36340332
4445	AZS	Saman?? El Catey International Airport	North America	DO	Dominican Republic	Saman?? Province	Samana	19.269259	-69.737405
4446	STI	Cibao International Airport	North America	DO	Dominican Republic	Santiago de los Caballeros Province	Santiago	19.40609932	-70.60469818
4447	SDQ	Las Am??ricas International Airport	North America	DO	Dominican Republic	Distrito Nacional	Santo Domingo	18.42970085	-69.66889954
4448	SAL	Monse??or ??scar Arnulfo Romero International Airport	North America	SV	El Salvador	La Paz	San Salvador (San Luis Talpa)	13.4409	-89.055702
4449	JEG	Aasiaat Airport	North America	GL	Greenland	Aasiaat	Aasiaat	68.721802	-52.784698
4450	JAV	Ilulissat Airport	North America	GL	Greenland	Ilulissat	Ilulissat	69.243202	-51.057098
4451	SFJ	Kangerlussuaq Airport	North America	GL	Greenland	Kangerlussuaq	Kangerlussuaq	67.012222	-50.711603
4452	KUS	Kulusuk Airport	North America	GL	Greenland	Kulusuk	Kulusuk	65.573601	-37.1236
4453	JSU	Maniitsoq Airport	North America	GL	Greenland	Maniitsoq	Maniitsoq	65.412498	-52.9394
4454	UAK	Narsarsuaq Airport	North America	GL	Greenland	Narsarsuaq	Narsarsuaq	61.1605	-45.425999
4455	CNP	Neerlerit Inaat Airport	North America	GL	Greenland	Neerlerit Inaat	Neerlerit Inaat	70.74310303	-22.65049934
4456	GOH	Godthaab / Nuuk Airport	North America	GL	Greenland	Nuuk	Nuuk	64.190903	-51.678101
4457	JFR	Paamiut Airport	North America	GL	Greenland	Paamiut	Paamiut	62.01473618	-49.67093658
4458	NAQ	Qaanaaq Airport	North America	GL	Greenland	Qaanaaq	Qaanaaq	77.48860168	-69.38870239
4459	JHS	Sisimiut Airport	North America	GL	Greenland	Sisimiut	Sisimiut	66.951302	-53.729301
4460	THU	Thule Air Base	North America	GL	Greenland	Thule	Thule	76.53119659	-68.70320129
4461	JUV	Upernavik Airport	North America	GL	Greenland	Upernavik	Upernavik	72.79019928	-56.13059998
4462	JQA	Qaarsut Airport	North America	GL	Greenland	Uummannaq	Uummannaq	70.73419952	-52.69620132
4463	CRU	Lauriston Airport	North America	GD	Grenada	Saint Patrick	Carriacou Island	12.4761	-61.472801
4464	GND	Point Salines International Airport	North America	GD	Grenada	Saint George	Saint George's	12.00419998	-61.78620148
4465	BBR	Basse-Terre Baillif Airport	North America	GP	Guadeloupe	Basse-Terre	Basse-Terre	16.013648	-61.742928
4466	GBJ	Les Bases Airport	North America	GP	Guadeloupe	Grand Bourg	Grand Bourg	15.86870003	-61.27000046
4467	DSD	La D??sirade Airport	North America	GP	Guadeloupe	Grande Anse	Grande Anse	16.296902	-61.0844
4468	LSS	Terre-de-Haut Airport	North America	GP	Guadeloupe	Les Saintes	Les Saintes	15.86439991	-61.58060074
4469	PTP	Pointe-??-Pitre Le Raizet International  Airport	North America	GP	Guadeloupe	Pointe-??-Pitre	Pointe-??-Pitre	16.265301	-61.531799
4470	SFC	St-Fran??ois Airport	North America	GP	Guadeloupe	St-Fran??ois	St-Fran??ois	16.257799	-61.262501
4471	CMM	Carmelita Airport	North America	GT	Guatemala	Pet??n Department	Carmelita	17.46120071	-90.05370331
4472	CIQ	Chiquimula Airport	North America	GT	Guatemala	Chiquimula Department	Chiquimula	14.83092	-89.520938
4473	CTF	Coatepeque Airport	North America	GT	Guatemala	Quetzaltenango Department	Coatepeque	14.69419956	-91.88249969
4474	CBV	Coban Airport	North America	GT	Guatemala	Alta Verapez Department	Coban	15.46899986	-90.40670013
4475	DON	Dos Lagunas Airport	North America	GT	Guatemala	Pet??n Department	Dos Lagunas	17.61240005	-89.68840027
4476	ENJ	El Naranjo Airport	North America	GT	Guatemala	Escuintla Department	El Naranjo	14.106931	-90.817496
4477	GUA	La Aurora Airport	North America	GT	Guatemala	Guatemala Department	Guatemala City	14.5833	-90.527496
4478	HUG	Huehuetenango Airport	North America	GT	Guatemala	Huehuetenango Department	Huehuetenango	15.32740021	-91.46240234
4479	MCR	Melchor de Mencos Airport	North America	GT	Guatemala	Pet??n Department	Melchor de Mencos	17.06860924	-89.15222168
4480	PCG	Paso Caballos Airport	North America	GT	Guatemala	Pet??n Department	Paso Caballos	17.26390076	-90.25630188
4481	PKJ	Playa Grande Airport	North America	GT	Guatemala	Quich?? Department	Playa Grande	15.99750042	-90.74169922
4482	PON	Popt??n Airport	North America	GT	Guatemala	Pet??n Department	Popt??n	16.32579994	-89.41609955
4483	PBR	Puerto Barrios Airport	North America	GT	Guatemala	Izabal Department	Puerto Barrios	15.7309	-88.583801
4484	GSJ	San Jos?? Airport	North America	GT	Guatemala	Escuintla Department	Puerto San Jos??	13.93620014	-90.83580017
4485	AAZ	Quezaltenango Airport	North America	GT	Guatemala	Quetzaltenango Department	Quezaltenango	14.8656	-91.501999
4486	RER	Retalhuleu Airport	North America	GT	Guatemala	Retalhuleu Department	Retalhuleu	14.521431	-91.697001
4487	LCF	Las Vegas Airport	North America	GT	Guatemala	Izabal Department	Rio Dulce	15.668363	-88.961763
4488	RUV	Rubelsanto Airport	North America	GT	Guatemala	Alta Verapez Department	Rubelsanto	15.99199963	-90.44529724
4489	FRS	Mundo Maya International Airport	North America	GT	Guatemala	Pet??n Department	San Benito	16.91379929	-89.86640167
4490	AQB	Quich?? Airport	North America	GT	Guatemala	Quich?? Department	Santa Cruz del Quich??	15.0122	-91.150597
4491	TKM	El Pet??n Airport	North America	GT	Guatemala	Pet??n Department	Tikal	17.22638893	-89.60500336
4492	UAX	Uaxactun Airport	North America	GT	Guatemala	Pet??n Department	Uaxactun	17.39388847	-89.63274384
4493	CAP	Cap Haitien International Airport	North America	HT	Haiti	Nord Department	Cap Haitien	19.726734	-72.199576
4494	JAK	Jacmel Airport	North America	HT	Haiti	Sud-Est Department	Jacmel	18.24110031	-72.51850128
4495	JEE	J??r??mie Airport	North America	HT	Haiti	Grande'Anse Department	Jeremie	18.66309929	-74.17030334
4496	CYA	Les Cayes Airport	North America	HT	Haiti	Sud Department	Les Cayes	18.27109909	-73.78829956
4497	PAP	Toussaint Louverture International Airport	North America	HT	Haiti	Ouest Department	Port-au-Prince	18.58	-72.292503
4498	PAX	Port-de-Paix Airport	North America	HT	Haiti	Nord-Ouest Department	Port-de-Paix	19.934045	-72.84801
4499	AHS	Ahuas Airport	North America	HN	Honduras	Gracias a Dios Department	Ahuas	15.4722	-84.352203
4500	BHG	Brus Laguna Airport	North America	HN	Honduras	Gracias a Dios Department	Brus Laguna	15.7631	-84.543602
4501	CAA	Catacamas Airport	North America	HN	Honduras	Olancho Department	Catacamas	14.91699982	-85.90000153
4502	CDD	Cauquira Airport	North America	HN	Honduras	Gracias a Dios Department	Cauquira	15.316667	-83.591667
4503	RUY	Cop??n Ruinas Airport	North America	HN	Honduras	Cop??n Department	Cop??n Ruinas	14.914885	-89.007837
4504	CYL	Coyoles Airport	North America	HN	Honduras	Yoro Department	Coyoles	15.445556	-86.675278
4505	EDQ	Erandique Airport	North America	HN	Honduras	Lempira Department	Erandique	14.235833	-88.437225
4506	GAC	Celaque Airport	North America	HN	Honduras	Lempira Department	Gracias	14.573492	-88.595801
4507	GJA	La Laguna Airport	North America	HN	Honduras	Islas de la Bah??a Department	Guanaja	16.4454	-85.906601
4508	IRN	Iriona Airport	North America	HN	Honduras	Col??n Department	Iriona	15.93916702	-85.13722229
4509	GUO	Jicalapa Airport	North America	HN	Honduras	Olancho Department	Jicalapa	15.006111	-86.049164
4510	JUT	Jutigalpa airport	North America	HN	Honduras	Olancho Department	Jutigalpa	14.65260029	-86.22029877
4511	LCE	Goloson International Airport	North America	HN	Honduras	Atl??ntida Department	La Ceiba	15.7425	-86.852997
4512	LEZ	La Esperanza Airport	North America	HN	Honduras	Intibuc?? Department	La Esperanza	14.291111	-88.175003
4513	LLH	Reginaldo Hammer Airport	North America	HN	Honduras	Cort??s Department	La Lima	15.4422	-87.8988
4514	LUI	Carta Airport	North America	HN	Honduras	Olancho Department	La Uni??n	15.033192	-86.692334
4515	OAN	El Array??n Airport	North America	HN	Honduras	Yoro Department	Olanchito	15.505556	-86.574722
4516	PCH	Palacios Airport	North America	HN	Honduras	Gracias a Dios Department	Palacios	15.955	-84.941391
4517	PEU	Puerto Lempira Airport	North America	HN	Honduras	Gracias a Dios Department	Puerto Lempira	15.2622	-83.781197
4518	RTB	Juan Manuel G??lvez International Airport	North America	HN	Honduras	Islas de la Bah??a Department	Roat??n	16.316799	-86.523003
4519	SAP	Ram??n Villeda Morales International Airport	North America	HN	Honduras	Cort??s Department	San Pedro Sula	15.4526	-87.923599
4520	SCD	Sulaco Airport	North America	HN	Honduras	Yoro Department	Sulaco	14.90719986	-87.26339722
4521	XPL	Palmerola International Airport	North America	HN	Honduras	Comayagua Department	Tegucigalpa	14.3824	-87.621201
4522	TGU	Toncont??n International Airport	North America	HN	Honduras	Francisco Moraz??n Department	Tegucigalpa	14.06089973	-87.21720123
4523	TEA	Tela Airport	North America	HN	Honduras	Atl??ntida Department	Tela	15.7759	-87.4758
4524	TJI	Trujillo Airport	North America	HN	Honduras	Col??n Department	Trujillo	15.926599	-85.938573
4525	UII	Utila Airport	North America	HN	Honduras	Islas de la Bah??a Department	Utila Island	16.1131	-86.880302
4526	ORO	Yoro Airport	North America	HN	Honduras	Yoro Department	Yoro	15.1275	-87.135
4527	OCJ	Ian Fleming International Airport	North America	JM	Jamaica	Saint Mary	Boscobel	18.404079	-76.969754
4528	POT	Ken Jones Airport	North America	JM	Jamaica	Portland	Ken Jones	18.19879913	-76.53450012
4529	KIN	Norman Manley International Airport	North America	JM	Jamaica	Kingston	Kingston	17.93569946	-76.78749847
4530	MBJ	Sangster International Airport	North America	JM	Jamaica	Saint James	Montego Bay	18.50370026	-77.91339874
4531	NEG	Negril Airport	North America	JM	Jamaica	Hanover	Negril	18.341712	-78.334164
4532	KTP	Tinson Pen Airport	North America	JM	Jamaica	Saint Andrew	Tinson Pen	17.98859978	-76.82379913
4533	FDF	Martinique Aim?? C??saire International Airport	North America	MQ	Martinique	Fort-de-France	Fort-de-France	14.591	-61.003201
4534	ACA	General Juan N Alvarez International Airport	North America	MX	Mexico	Guerrero	Acapulco	16.757099	-99.753998
4535	AGU	Governor Jes??s Ter??n Peredo International Airport	North America	MX	Mexico	Aguascalientes	Aguascalientes	21.699589	-102.318372
4536	XAL	??lamos Airport	North America	MX	Mexico	Sonora	??lamos	27.035701	-108.947998
4537	AZG	Apatzing??n - Pablo L. Sidar Airport	North America	MX	Mexico	Michoac??n	Apatzing??n	19.093399	-102.393997
4538	CPE	Ingeniero Alberto Acu??a Ongay International Airport	North America	MX	Mexico	Campeche	Campeche	19.81679916	-90.50029755
4539	CNA	Cananea National Airport	North America	MX	Mexico	Sonora	Cananea	31.06615	-110.097878
4540	CUN	Canc??n International Airport	North America	MX	Mexico	Quintana Roo	Canc??n	21.03650093	-86.87709808
4541	CYW	Captain Rogelio Castillo National Airport	North America	MX	Mexico	Guanajuato	Celaya	20.546	-100.887001
4542	CTM	Chetumal International Airport	North America	MX	Mexico	Quintana Roo	Chetumal	18.50469971	-88.32679749
4543	CZA	Chichen Itza International Airport	North America	MX	Mexico	Yucat??n	Chichen Itza	20.6413002	-88.44619751
4544	CUU	General Roberto Fierro Villalobos International Airport	North America	MX	Mexico	Chihuahua	Chihuahua	28.70289993	-105.9649963
4545	ACN	Ciudad Acu??a New International Airport	North America	MX	Mexico	Coahuila	Ciudad Acu??a	29.333662	-101.100555
4546	CME	Ciudad del Carmen International Airport	North America	MX	Mexico	Campeche	Ciudad del Carmen	18.65369987	-91.7990036
4547	CJS	Abraham Gonz??lez International Airport	North America	MX	Mexico	Chihuahua	Ciudad Ju??rez	31.63610077	-106.4290009
4548	AZP	Atizap??n de Zaragoza - Doctor Jorge Jim??nez Cantu National Airport	North America	MX	Mexico	M??xico (state)	Ciudad L??pez Mateos	19.574496	-99.289241
4549	MMC	Ciudad Mante National Airport	North America	MX	Mexico	Tamaulipas	Ciudad Mante	22.743177	-99.017372
4550	CEN	Ciudad Obreg??n International Airport	North America	MX	Mexico	Sonora	Ciudad Obreg??n	27.39259911	-109.8330002
4551	CVM	General Pedro Jose Mendez International Airport	North America	MX	Mexico	Tamaulipas	Ciudad Victoria	23.70330048	-98.95649719
4552	CLQ	Licenciado Miguel de la Madrid Airport	North America	MX	Mexico	Colima	Colima	19.277	-103.577002
4553	CJT	San Antonio Copalar Airport	North America	MX	Mexico	Chiapas	Comit??n	16.176701	-92.050598
4554	CUA	Ciudad Constituci??n National Airport	North America	MX	Mexico	Baja California Sur	Comond??	25.053801	-111.614998
4555	CZM	Cozumel International Airport	North America	MX	Mexico	Quintana Roo	Cozumel	20.5223999	-86.92559814
4556	CUL	Bachigualato Federal International Airport	North America	MX	Mexico	Sinaloa	Culiac??n	24.76504	-107.475228
4557	DGO	General Guadalupe Victoria International Airport	North America	MX	Mexico	Durango	Durango	24.12420082	-104.5279999
4558	BHL	Bah??a de los ??ngeles Airport	North America	MX	Mexico	Baja California	Ensenada	28.9786	-113.560997
4559	ESE	Ensenada International Airport / El Cipres Air Base	North America	MX	Mexico	Baja California	Ensenada	31.7953	-116.602997
4560	GUB	Guerrero Negro Airport	North America	MX	Mexico	Baja California	Ensenada	28.0261	-114.024002
4561	SNQ	San Quint??n Military Airstrip	North America	MX	Mexico	Baja California	Ensenada	30.5288	-115.9462
4562	GDL	Don Miguel Hidalgo Y Costilla International Airport	North America	MX	Mexico	Jalisco	Guadalajara	20.52179909	-103.310997
4563	GYM	General Jos?? Mar??a Y????ez International Airport	North America	MX	Mexico	Sonora	Guaymas	27.96899986	-110.9250031
4564	HMO	General Ignacio P. Garcia International Airport	North America	MX	Mexico	Sonora	Hermosillo	29.09589958	-111.0479965
4565	HUX	Bah??as de Huatulco International Airport	North America	MX	Mexico	Oaxaca	Huatulco	15.775611	-96.26079
4566	ISJ	Isla Mujeres Airport	North America	MX	Mexico	Quintana Roo	Isla Mujeres	21.24500084	-86.73999786
4567	ZIH	Ixtapa Zihuatanejo International Airport	North America	MX	Mexico	Guerrero	Ixtapa	17.60160065	-101.4609985
4568	IZT	Ixtepec Airport	North America	MX	Mexico	Oaxaca	Ixtepec	16.449301	-95.093697
4569	LAP	Manuel M??rquez de Le??n International Airport	North America	MX	Mexico	Baja California Sur	La Paz	24.0727005	-110.3619995
4570	PCO	Punta Colorada Airport	North America	MX	Mexico	Baja California Sur	La Ribera	23.575011	-109.535826
4571	LOM	Francisco Primo de Verdad y Ramos Airport	North America	MX	Mexico	Jalisco	Lagos de Moreno	21.258983	-101.943758
4572	LZC	L??zaro C??rdenas Airport	North America	MX	Mexico	Michoac??n	L??zaro C??rdenas	18.00169945	-102.2210007
4573	LTO	Loreto International Airport	North America	MX	Mexico	Baja California Sur	Loreto	25.98920059	-111.3479996
4574	LMM	Valle del Fuerte International Airport	North America	MX	Mexico	Sinaloa	Los Mochis	25.685447	-109.081055
4575	ZLO	Playa De Oro International Airport	North America	MX	Mexico	Colima	Manzanillo	19.1448	-104.558998
4576	MAM	General Servando Canales International Airport	North America	MX	Mexico	Tamaulipas	Matamoros	25.76989937	-97.52529907
4577	MZT	General Rafael Buelna International Airport	North America	MX	Mexico	Sinaloa	Mazatl??n	23.1614	-106.265999
4578	MID	Licenciado Manuel Crescencio Rejon Int Airport	North America	MX	Mexico	Yucat??n	M??rida	20.93700027	-89.65769959
4579	MXL	General Rodolfo S??nchez Taboada International Airport	North America	MX	Mexico	Baja California	Mexicali	32.6306	-115.241997
4580	SFH	San Felipe International Airport	North America	MX	Mexico	Baja California	Mexicali	30.929912	-114.808388
4581	MEX	Licenciado Benito Juarez International Airport	North America	MX	Mexico	Ciudad de M??xico	Mexico City	19.4363	-99.072098
4582	NLU	Santa Luc??a Air Force Base / General Felipe ??ngeles International Airport	North America	MX	Mexico	M??xico (state)	Mexico City (Santa Luc??a)	19.7458	-99.0145
4583	MTT	Minatitl??n/Coatzacoalcos National Airport	North America	MX	Mexico	Veracruz	Minatitl??n	18.10339928	-94.58070374
4584	LOV	Monclova International Airport	North America	MX	Mexico	Coahuila	Monclova International	26.9557	-101.470001
4585	NTR	Del Norte International Airport	North America	MX	Mexico	Nuevo Le??n	Monterrey	25.865601	-100.237
4586	MTY	General Mariano Escobedo International Airport	North America	MX	Mexico	Nuevo Le??n	Monterrey	25.7785	-100.107002
4587	MLM	General Francisco J. Mujica International Airport	North America	MX	Mexico	Michoac??n	Morelia	19.849899	-101.025002
4588	MUG	Mulege Airport	North America	MX	Mexico	Baja California Sur	Mulege	26.905347	-111.970725
4589	SRL	Palo Verde Airport	North America	MX	Mexico	Baja California Sur	Muleg??	27.0927	-112.0985
4590	AJS	Punta Abreojos Airport	North America	MX	Mexico	Baja California Sur	Muleg??	26.7272	-113.558998
4591	PCV	Punta Chivato Airport	North America	MX	Mexico	Baja California Sur	Muleg??	27.069201	-111.961998
4592	SGM	San Ignacio Airport	North America	MX	Mexico	Baja California Sur	Muleg??	27.2966	-112.938004
4593	NOG	Nogales International Airport	North America	MX	Mexico	Sonora	Nogales	31.225756	-110.976934
4594	NCG	Nuevo Casas Grandes Municipal Airport	North America	MX	Mexico	Chihuahua	Nuevo Casas Grandes	30.3974	-107.875
4595	NLD	Quetzalc??atl International Airport	North America	MX	Mexico	Tamaulipas	Nuevo Laredo	27.443899	-99.570503
4596	OAX	Xoxocotl??n International Airport	North America	MX	Mexico	Oaxaca	Oaxaca	16.99990082	-96.72660065
4597	PQM	Palenque International Airport	North America	MX	Mexico	Chiapas	Palenque	17.533153	-92.015484
4598	PDS	Piedras Negras International Airport	North America	MX	Mexico	Coahuila	Piedras Negras International	28.627399	-100.535004
4599	PAZ	El Taj??n National Airport	North America	MX	Mexico	Veracruz	Poza Rica	20.60269928	-97.46080017
4600	PBC	Hermanos Serd??n International Airport	North America	MX	Mexico	Puebla	Puebla	19.15810013	-98.37139893
4601	PXM	Puerto Escondido International Airport	North America	MX	Mexico	Oaxaca	Puerto Escondido	15.8769	-97.089103
4602	PPE	Mar de Cort??s International Airport	North America	MX	Mexico	Sonora	Puerto Pe??asco	31.351987	-113.305177
4603	PVR	President Gustavo D??az Ordaz International Airport	North America	MX	Mexico	Jalisco	Puerto Vallarta	20.680099	-105.253998
4604	QRO	Quer??taro Intercontinental Airport	North America	MX	Mexico	Quer??taro	Quer??taro	20.6173	-100.185997
4605	REX	General Lucio Blanco International Airport	North America	MX	Mexico	Tamaulipas	Reynosa	26.0089	-98.2285
4606	SCX	Salina Cruz Naval Air Station	North America	MX	Mexico	Oaxaca	Salina Cruz	16.21260071	-95.20159912
4607	SLW	Plan De Guadalupe International Airport	North America	MX	Mexico	Coahuila	Saltillo	25.54949951	-100.9290009
4608	SJD	Los Cabos International Airport	North America	MX	Mexico	Baja California Sur	San Jos?? del Cabo	23.1518	-109.721001
4609	SLP	Ponciano Arriaga International Airport	North America	MX	Mexico	San Luis Potos??	San Luis Potos??	22.25429916	-100.9309998
4610	UAC	San Luis R??o Colorado Airport	North America	MX	Mexico	Sonora	San Luis R??o Colorado	32.445301	-114.797997
4611	BJX	Del Baj??o International Airport	North America	MX	Mexico	Guanajuato	Silao	20.9935	-101.481003
4612	PCM	Playa del Carmen Airport	North America	MX	Mexico	Quintana Roo	Solidaridad	20.62249947	-87.0821991
4613	TAM	General Francisco Javier Mina International Airport	North America	MX	Mexico	Tamaulipas	Tampico	22.29640007	-97.86589813
4614	TSL	Tamuin Airport	North America	MX	Mexico	San Luis Potos??	Tamuin	22.0383	-98.806502
4615	TAP	Tapachula International Airport	North America	MX	Mexico	Chiapas	Tapachula	14.79430008	-92.37000275
4616	TCN	Tehuacan Airport	North America	MX	Mexico	Puebla	Tehuacan	18.49720001	-97.41989899
4617	CVJ	Cuernavaca - General Mariano Matamoros Airport	North America	MX	Mexico	Morelos	Temixco	18.834801	-99.261299
4618	TPQ	Amado Nervo National Airport	North America	MX	Mexico	Nayarit	Tepic	21.4195	-104.843002
4619	TIJ	General Abelardo L. Rodr??guez International Airport	North America	MX	Mexico	Baja California	Tijuana	32.54109955	-116.9700012
4620	TZM	Cupul Airport	North America	MX	Mexico	Yucat??n	Tizimin	21.155716	-88.172918
4621	TLC	President Adolfo L??pez Mateos International Airport	North America	MX	Mexico	M??xico (state)	Toluca	19.337099	-99.566002
4622	TRC	Francisco Sarabia Tinoco International Airport	North America	MX	Mexico	Coahuila	Torre??n	25.5683	-103.411003
4623	TUY	Tulum Naval Air Station	North America	MX	Mexico	Quintana Roo	Tulum	20.227301	-87.438203
4624	TGZ	Angel Albino Corzo International Airport	North America	MX	Mexico	Chiapas	Tuxtla Guti??rrez	16.56360054	-93.02249908
4625	UPN	Uruapan - Licenciado y General Ignacio Lopez Rayon International Airport	North America	MX	Mexico	Michoac??n	Uruapan	19.3967	-102.039001
4626	VER	General Heriberto Jara International Airport	North America	MX	Mexico	Veracruz	Veracruz	19.14590073	-96.18730164
4627	VSA	Carlos Rovirosa P??rez International Airport	North America	MX	Mexico	Tabasco	Villahermosa	17.99699974	-92.81739807
4628	JAL	El Lencero Airport	North America	MX	Mexico	Veracruz	Xalapa	19.47509956	-96.79750061
4629	ZCL	General Leobardo C. Ruiz International Airport	North America	MX	Mexico	Zacatecas	Zacatecas	22.89710045	-102.6869965
4630	ZMM	Zamora Airport	North America	MX	Mexico	Michoac??n	Zamora	20.045	-102.276001
4631	MNI	John A. Osborne Airport	North America	MS	Montserrat	Gerald's Park	Gerald's Park	16.79140091	-62.19329834
4632	BEF	Bluefields Airport	North America	NI	Nicaragua	Atlantico Sur	Bluefileds	11.99100018	-83.77410126
4633	BZA	San Pedro Airport	North America	NI	Nicaragua	Atlantico Norte	Bonanza	14.031524	-84.624311
4634	RNI	Corn Island Airport	North America	NI	Nicaragua	Atlantico Sur	Corn Island	12.174785	-83.059445
4635	RFS	Rosita Airport	North America	NI	Nicaragua	Atlantico Norte	La Rosita	13.88969994	-84.4088974
4636	MGA	Augusto C. Sandino (Managua) International Airport	North America	NI	Nicaragua	Managua	Managua	12.14150047	-86.16819763
4637	NVG	Nueva Guinea Airport	North America	NI	Nicaragua	Atlantico Sur	Nueva Guinea	11.66666698	-84.44999695
4638	PUZ	Puerto Cabezas Airport	North America	NI	Nicaragua	Atlantico Norte	Puerto Cabezas	14.0472002	-83.38670349
4639	NCR	San Carlos	North America	NI	Nicaragua	Rio San Juan	San Carlos	11.13339996	-84.76999664
4640	SIU	Siuna	North America	NI	Nicaragua	Atlantico Norte	Siuna	13.72722244	-84.77777863
4641	ECI	Costa Esmeralda Airport	North America	NI	Nicaragua	Rivas	Tola	11.427542	-86.033361
4642	WSP	Waspam Airport	North America	NI	Nicaragua	Atlantico Norte	Waspam	14.73919964	-83.9693985
4643	ACU	Achutupu Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Achutupo	9.188481	-77.994153
4644	PAC	Marcos A. Gelabert International Airport	North America	PA	Panama	Panam?? Province	Albrook	8.973340034	-79.55560303
4645	AIL	Alligandi Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Alligandi	9.2226	-78.0236
4646	BFQ	Bahia Pi??a Airport	North America	PA	Panama	Dari??n Province	Bahia Pi??a	7.586764	-78.180251
4647	SAX	Samb?? Airport	North America	PA	Panama	Dari??n Province	Boca de S??balo	8.026279	-78.209555
4648	CTE	Carti Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Carti	9.313469887	-79.10160065
4649	NBL	San Blas Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Carti	9.452863	-78.978917
4650	CHX	Cap Manuel Ni??o International Airport	North America	PA	Panama	Bocas del Toro Province	Changuinola	9.458962	-82.515062
4651	CTD	Alonso Valderrama Airport	North America	PA	Panama	Herrera Province	Chitr??	7.98784	-80.409837
4652	ONX	Enrique Adolfo Jimenez Airport	North America	PA	Panama	Col??n Province	Col??n	9.356639862	-79.86740112
4653	OTD	Raul Arias Espinoza Airport	North America	PA	Panama	Panam?? Province	Contadora Island	8.62876	-79.034698
4654	CZJ	Coraz??n de Jes??s Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Coraz??n de Jes??s and Nargan?? Islands	9.4446	-78.5888
4655	DAV	Enrique Malek International Airport	North America	PA	Panama	Chiriqu?? Province	David	8.391	-82.434998
4656	PVE	El Porvenir Airport	North America	PA	Panama	Kuna Yala Indigenous Region	El Porvenir	9.559212	-78.946631
4657	ELE	EL Real Airport	North America	PA	Panama	Dari??n Province	El Real de Santa Mar??a	8.1072	-77.7252
4658	GHE	Garachin?? Airport	North America	PA	Panama	Dari??n Province	Garachin??	8.0644	-78.3673
4659	BOC	Bocas del Toro International Airport	North America	PA	Panama	Bocas del Toro Province	Isla Col??n	9.34085	-82.250801
4660	NMG	San Miguel Airport	North America	PA	Panama	Panam?? Province	Isla del Rey	8.4566	-78.9339
4661	TUE	Tupile Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Isla Tupile	9.4468	-78.5757
4662	IVI	Viveros Island Airport	North America	PA	Panama	Panam?? Province	Isla Viveros	8.4693	-79.0016
4663	JQE	Jaqu?? Airport	North America	PA	Panama	Dari??n Province	Jaqu??	7.51778	-78.157204
4664	SIC	San Jos?? Island Airport	North America	PA	Panama	Panam?? Province	Las Perlas	8.2622	-79.078
4665	MPI	Mamitupo Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Mamitupo	9.1851	-77.9841
4666	MPP	Mulatupo Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Mulatupo	8.9453	-77.7331
4667	BLB	Panam?? Pac??fico International Airport	North America	PA	Panama	Panam?? Oeste Province	Panam?? City	8.91479	-79.599602
4668	PDM	Capt. J. Montenegro Airport	North America	PA	Panama	Los Santos Province	Pedas??	7.534801	-80.043347
4669	PYC	Play??n Chico Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Play??n Chico	9.305184161	-78.23587418
4670	PUE	Puerto Obald??a Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Puerto Obald??a	8.668639	-77.417393
4671	RIH	Scarlett Martinez International Airport	North America	PA	Panama	Cocl?? Province	R??o Hato	8.375880241	-80.12789917
4672	SYP	Ruben Cantu Airport	North America	PA	Panama	Veraguas Province	Santiago	8.085599899	-80.94529724
4673	TJC	Ticantiki Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Ticantiqui	9.4185	-78.4896
4674	PTY	Tocumen International Airport	North America	PA	Panama	Panam?? Province	Tocumen	9.071359634	-79.38349915
4675	OGM	Ogubsucum Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Ustupo	9.1383	-77.93385
4676	UTU	Ustupo Airport	North America	PA	Panama	Kuna Yala Indigenous Region	Ustupo	9.1283	-77.9337
4677	PYV	Yaviza Airport	North America	PA	Panama	Dari??n Province	Yaviza	8.1528	-77.687
4678	BQN	Rafael Hern??ndez International Airport	North America	PR	Puerto Rico	Aguadilla	Aguadilla	18.4949	-67.129402
4679	ARE	Antonio Nery Juarbe Pol Airport	North America	PR	Puerto Rico	Arecibo	Arecibo	18.45085	-66.675768
4680	NRR	Jos?? Aponte de la Torre Airport	North America	PR	Puerto Rico	Ceiba	Ceiba	18.2453	-65.643402
4681	CPX	Benjamin Rivera Noriega Airport	North America	PR	Puerto Rico	Culebra	Culebra	18.312954	-65.303893
4682	HUC	Humacao Airport	North America	PR	Puerto Rico	Humacao	Humacao	18.13809967	-65.80130005
4683	MAZ	Eugenio Maria De Hostos Airport	North America	PR	Puerto Rico	Mayaguez	Mayaguez	18.25569916	-67.14849854
4684	PSE	Mercedita Airport	North America	PR	Puerto Rico	Ponce	Ponce	18.00830078	-66.56300354
4685	SIG	Fernando Luis Ribas Dominicci Airport	North America	PR	Puerto Rico	San Juan	San Juan	18.45680046	-66.09809875
4686	SJU	Luis Munoz Marin International Airport	North America	PR	Puerto Rico	San Juan	San Juan	18.43939972	-66.00180054
4687	VQS	Antonio Rivera Rodriguez Airport	North America	PR	Puerto Rico	Vieques	Vieques	18.1348	-65.493599
4688	SBH	Saint Barth??lemy - R??my de Haenen Airport	North America	BL	Saint Barth??lemy	Gustavia / Saint-Jean	Gustavia / Saint-Jean	17.9044	-62.843601
4689	SKB	Robert L. Bradshaw International Airport	North America	KN	Saint Kitts and Nevis	Basseterre	Basseterre	17.31119919	-62.71870041
4690	NEV	Vance W. Amory International Airport	North America	KN	Saint Kitts and Nevis	Charlestown	Charlestown	17.20569992	-62.58990097
4691	SLU	George F. L. Charles Airport	North America	LC	Saint Lucia	Castries	Castries	14.0202	-60.992901
4692	UVF	Hewanorra International Airport	North America	LC	Saint Lucia	Vieux Fort	Vieux Fort	13.7332	-60.952599
4693	SFG	Grand Case-Esp??rance Airport	North America	MF	Saint Martin	Grand Case	Grand Case	18.099899	-63.047199
4694	MSB	Marigot Seaplane Base	North America	MF	Saint Martin	Saint Martin	Saint Martin	18.0696	-63.087
4695	MQC	Miquelon Airport	North America	PM	Saint Pierre and Miquelon	Miquelon-Langlade	Miquelon	47.095501	-56.380299
4696	FSP	St Pierre Airport	North America	PM	Saint Pierre and Miquelon	Saint-Pierre	Saint-Pierre	46.76290131	-56.17309952
4697	BQU	J F Mitchell Airport	North America	VC	Saint Vincent and the Grenadines	Grenadines	Bequia	12.9884	-61.262001
4698	CIW	Canouan Airport	North America	VC	Saint Vincent and the Grenadines	Grenadines	Canouan	12.699	-61.3424
4699	SVD	Argyle International Airport	North America	VC	Saint Vincent and the Grenadines	Saint George	Kingstown	13.156695	-61.149945
4700	MQS	Mustique Airport	North America	VC	Saint Vincent and the Grenadines	Grenadines	Mustique Island	12.88790035	-61.18019867
4701	UNI	Union Island International Airport	North America	VC	Saint Vincent and the Grenadines	Grenadines	Union Island	12.60013485	-61.41194534
4702	SXM	Princess Juliana International Airport	North America	SX	Sint Maarten	Saint Martin	Saint Martin	18.041	-63.108898
4703	POS	Piarco International Airport	North America	TT	Trinidad and Tobago	Tunapuna-Piarco	Port of Spain	10.59539986	-61.33720016
4704	TAB	Tobago-Crown Point Airport	North America	TT	Trinidad and Tobago	Western Tobago	Scarborough	11.14970016	-60.8321991
4705	GDT	JAGS McCartney International Airport	North America	TC	Turks and Caicos Islands	Grand Turk	Cockburn Town	21.4445	-71.142303
4706	MDS	Middle Caicos Airport	North America	TC	Turks and Caicos Islands	Middle Caicos	Middle Caicos	21.82602	-71.8025
4707	NCA	North Caicos Airport	North America	TC	Turks and Caicos Islands	North Caicos	North Caicos	21.916094	-71.942954
4708	PIC	Pine Cay Airport	North America	TC	Turks and Caicos Islands	Pine Cay	Pine Cay	21.874661	-72.090573
4709	PLS	Providenciales International Airport	North America	TC	Turks and Caicos Islands	Providenciales	Providenciales	21.773697	-72.268321
4710	SLX	Salt Cay Airport	North America	TC	Turks and Caicos Islands	Salt Cay	Salt Cay	21.33300018	-71.19999695
4711	XSC	South Caicos Airport	North America	TC	Turks and Caicos Islands	South Caicos	South Caicos	21.515699	-71.528503
4712	STT	Cyril E. King Airport	North America	VI	U.S. Virgin Islands	Charlotte Amalie	Charlotte Amalie	18.337091	-64.977251
4713	SPB	Charlotte Amalie Harbor Seaplane Base	North America	VI	U.S. Virgin Islands	Charlotte Amalie St Thomas	Charlotte Amalie St Thomas	18.33860016	-64.94069672
4714	STX	Henry E Rohlsen Airport	North America	VI	U.S. Virgin Islands	Christiansted	Christiansted	17.70190048	-64.79859924
4715	SSB	Christiansted Harbor Seaplane Base	North America	VI	U.S. Virgin Islands	Christiansted St Croix	Christiansted St Croix	17.74720001	-64.70490265
4716	SJF	Cruz Bay Seaplane Base	North America	VI	U.S. Virgin Islands	Saint John Island	Saint John Island	18.3315	-64.796
4717	ABR	Aberdeen Regional Airport	North America	US	United States	South Dakota	Aberdeen	45.44910049	-98.42179871
4718	APG	Phillips Army Air Field	North America	US	United States	Maryland	Aberdeen Proving Grounds(Aberdeen)	39.466202	-76.1688
4719	ABI	Abilene Regional Airport	North America	US	United States	Texas	Abilene	32.41130066	-99.68190002
4720	DYS	Dyess Air Force Base	North America	US	United States	Texas	Abilene	32.420799	-99.854599
4721	VJI	Virginia Highlands Airport	North America	US	United States	Virginia	Abingdon	36.687099	-82.033302
4722	ADT	Ada Regional Airport	North America	US	United States	Oklahoma	Ada	34.805214	-96.671988
4723	ADK	Adak Airport	North America	US	United States	Alaska	Adak	51.883564	-176.642783
4724	ADG	Lenawee County Airport	North America	US	United States	Michigan	Adrian	41.866205	-84.077983
4725	NRI	Grand Lake Regional Airport	North America	US	United States	Oklahoma	Afton	36.57759857	-94.86190033
4726	AFO	Afton Municipal Airport	North America	US	United States	Wyoming	Afton	42.71120071	-110.9420013
4727	AIK	Aiken Regional Airport	North America	US	United States	South Carolina	Aiken	33.649399	-81.684998
4728	ANW	Ainsworth Regional Airport	North America	US	United States	Nebraska	Ainsworth	42.579201	-99.992995
4729	AKK	Akhiok Airport	North America	US	United States	Alaska	Akhiok	56.93870163	-154.1829987
4730	KKI	Akiachak Airport	North America	US	United States	Alaska	Akiachak	60.90480042	-161.4219971
4731	AKI	Akiak Airport	North America	US	United States	Alaska	Akiak	60.9029007	-161.2310028
4732	AKO	Colorado Plains Regional Airport	North America	US	United States	Colorado	Akron	40.17559814	-103.2220001
4733	CAK	Akron Canton Regional Airport	North America	US	United States	Ohio	Akron	40.91609955	-81.44219971
4734	AKC	Akron Executive Airport	North America	US	United States	Ohio	Akron	41.037498	-81.466904
4735	KQA	Akutan Airport	North America	US	United States	Alaska	Akutan	54.14459	-165.604332
4736	AUK	Alakanuk Airport	North America	US	United States	Alaska	Alakanuk	62.68004227	-164.6599274
4737	ALM	Alamogordo White Sands Regional Airport	North America	US	United States	New Mexico	Alamogordo	32.83990097	-105.9909973
4738	HMN	Holloman Air Force Base	North America	US	United States	New Mexico	Alamogordo	32.852501	-106.107002
4739	ALS	San Luis Valley Regional Airport/Bergman Field	North America	US	United States	Colorado	Alamosa	37.434898	-105.866997
4740	ABY	Southwest Georgia Regional Airport	North America	US	United States	Georgia	Albany	31.532946	-84.196215
4741	ALB	Albany International Airport	North America	US	United States	New York	Albany	42.74829865	-73.80169678
4742	AEL	Albert Lea Municipal Airport	North America	US	United States	Minnesota	Albert Lea	43.68149948	-93.36720276
4743	ABQ	Albuquerque International Sunport	North America	US	United States	New Mexico	Albuquerque	35.040199	-106.609001
4744	WKK	Aleknagik / New Airport	North America	US	United States	Alaska	Aleknagik	59.2826004	-158.6179962
4745	ALX	Thomas C Russell Field	North America	US	United States	Alabama	Alexander City	32.91469955	-85.96299744
4746	AEX	Alexandria International Airport	North America	US	United States	Louisiana	Alexandria	31.3274	-92.549797
4747	ESF	Esler Army Airfield / Esler Regional Airport	North America	US	United States	Louisiana	Alexandria	31.394266	-92.294082
4748	AXN	Chandler Field	North America	US	United States	Minnesota	Alexandria	45.866299	-95.394699
4749	AXB	Maxson Airfield	North America	US	United States	New York	Alexandria Bay	44.312002	-75.90034
4750	AXG	Algona Municipal Airport	North America	US	United States	Iowa	Algona	43.07789993	-94.27200317
4751	ALI	Alice International Airport	North America	US	United States	Texas	Alice	27.7409	-98.026901
4752	AIV	George Downer Airport	North America	US	United States	Alabama	Aliceville	33.106499	-88.1978
4753	AET	Allakaket Airport	North America	US	United States	Alaska	Allakaket	66.55180359	-152.621994
4754	ABE	Lehigh Valley International Airport	North America	US	United States	Pennsylvania	Allentown	40.651773	-75.442797
4755	AIA	Alliance Municipal Airport	North America	US	United States	Nebraska	Alliance	42.05319977	-102.8040009
4756	AMN	Gratiot Community Airport	North America	US	United States	Michigan	Alma	43.32210159	-84.68800354
4757	APN	Alpena County Regional Airport	North America	US	United States	Michigan	Alpena	45.0780983	-83.56030273
4758	ALE	Alpine Casparis Municipal Airport	North America	US	United States	Texas	Alpine	30.38419914	-103.6839981
4759	RUI	Sierra Blanca Regional Airport	North America	US	United States	New Mexico	Alto	33.462799	-105.535004
4760	ALN	St Louis Regional Airport	North America	US	United States	Illinois	Alton/St Louis	38.89030075	-90.04599762
4761	AOO	Altoona Blair County Airport	North America	US	United States	Pennsylvania	Altoona	40.296398	-78.32
4762	LTS	Altus Air Force Base	North America	US	United States	Oklahoma	Altus	34.667099	-99.266701
4763	AXS	Altus Quartz Mountain Regional Airport	North America	US	United States	Oklahoma	Altus	34.697952	-99.3385
4764	AMA	Rick Husband Amarillo International Airport	North America	US	United States	Texas	Amarillo	35.219398	-101.706001
4765	TDW	Tradewind Airport	North America	US	United States	Texas	Amarillo	35.16989899	-101.8259964
4766	ABL	Ambler Airport	North America	US	United States	Alaska	Ambler	67.107043	-157.854308
4767	AHH	Amery Municipal Airport	North America	US	United States	Wisconsin	Amery	45.28110123	-92.37539673
4768	AMW	Ames Municipal Airport	North America	US	United States	Iowa	Ames	41.992001	-93.621803
4769	AOS	Amook Bay Seaplane Base	North America	US	United States	Alaska	Amook Bay	57.4715004	-153.8150024
4770	OTS	Anacortes Airport	North America	US	United States	Washington	Anacortes	48.499	-122.662003
4771	AKP	Anaktuvuk Pass Airport	North America	US	United States	Alaska	Anaktuvuk Pass	68.13359833	-151.7429962
4772	EDF	Elmendorf Air Force Base	North America	US	United States	Alaska	Anchorage	61.251709	-149.807097
4773	MRI	Merrill Field	North America	US	United States	Alaska	Anchorage	61.21350098	-149.8439941
4774	ANC	Ted Stevens Anchorage International Airport	North America	US	United States	Alaska	Anchorage	61.1744	-149.996002
4775	AID	Anderson Municipal Darlington Field	North America	US	United States	Indiana	Anderson	40.10860062	-85.61299896
4776	AND	Anderson Regional Airport	North America	US	United States	South Carolina	Anderson	34.49459839	-82.70939636
4777	ADR	Robert F Swinnie Airport	North America	US	United States	South Carolina	Andrews	33.4516983	-79.52619934
4778	AXX	Angel Fire Airport	North America	US	United States	New Mexico	Angel Fire	36.42200089	-105.2900009
4779	LJN	Texas Gulf Coast Regional Airport	North America	US	United States	Texas	Angleton	29.108601	-95.462097
4780	ANQ	Tri State Steuben County Airport	North America	US	United States	Indiana	Angola	41.639702	-85.083504
4781	AGN	Angoon Seaplane Base	North America	US	United States	Alaska	Angoon	57.497097	-134.56722
4782	ANI	Aniak Airport	North America	US	United States	Alaska	Aniak	61.58160019	-159.5429993
4783	ARB	Ann Arbor Municipal Airport	North America	US	United States	Michigan	Ann Arbor	42.22299957	-83.74559784
4784	ANP	Lee Airport	North America	US	United States	Maryland	Annapolis	38.942902	-76.568398
4785	ANB	Anniston Regional Airport	North America	US	United States	Alabama	Anniston	33.5882	-85.8581
4786	ANY	Anthony Municipal Airport	North America	US	United States	Kansas	Anthony	37.158501	-98.079597
4787	ATE	Antlers Municipal Airport	North America	US	United States	Oklahoma	Antlers	34.19260025	-95.64990234
4788	ANV	Anvik Airport	North America	US	United States	Alaska	Anvik	62.646702	-160.190994
4789	AAF	Apalachicola Regional Airport	North America	US	United States	Florida	Apalachicola	29.72750092	-85.02749634
4790	APV	Apple Valley Airport	North America	US	United States	California	Apple Valley	34.57529831	-117.185997
4791	ATW	Appleton International Airport	North America	US	United States	Wisconsin	Appleton	44.2580986	-88.51909637
4792	AHF	Arapahoe Municipal Airport	North America	US	United States	Nebraska	Arapahoe	40.33950043	-99.90650177
4793	ACV	California Redwood Coast-Humboldt County Airport	North America	US	United States	California	Arcata/Eureka	40.978101	-124.109
4794	ARC	Arctic Village Airport	North America	US	United States	Alaska	Arctic Village	68.1147	-145.578995
4795	AHD	Ardmore Downtown Executive Airport	North America	US	United States	Oklahoma	Ardmore	34.14699936	-97.12270355
4796	ADM	Ardmore Municipal Airport	North America	US	United States	Oklahoma	Ardmore	34.30301	-97.0196342
4797	ATS	Artesia Municipal Airport	North America	US	United States	New Mexico	Artesia	32.85250092	-104.4680023
4798	CKK	Sharp County Regional Airport	North America	US	United States	Arkansas	Ash Flat	36.26490021	-91.56259918
4799	AVL	Asheville Regional Airport	North America	US	United States	North Carolina	Asheville	35.436199	-82.541801
4800	AHM	Ashland Municipal Airport-Sumner Parker Field	North America	US	United States	Oregon	Ashland	42.190265	-122.660648
4801	ASX	John F Kennedy Memorial Airport	North America	US	United States	Wisconsin	Ashland	46.54850006	-90.91899872
4802	ASY	Ashley Municipal Airport	North America	US	United States	North Dakota	Ashley	46.02389908	-99.3526001
4803	JFN	Northeast Ohio Regional Airport	North America	US	United States	Ohio	Ashtabula	41.778	-80.695503
4804	ASE	Aspen-Pitkin Co/Sardy Field	North America	US	United States	Colorado	Aspen	39.22320175	-106.8690033
4805	AST	Astoria Regional Airport	North America	US	United States	Oregon	Astoria	46.15800095	-123.8789978
4806	AHN	Athens Ben Epps Airport	North America	US	United States	Georgia	Athens	33.94860077	-83.32630157
4807	MMI	McMinn County Airport	North America	US	United States	Tennessee	Athens	35.39730072	-84.56259918
4808	ATO	Ohio University Snyder Field	North America	US	United States	Ohio	Athens/Albany	39.21099854	-82.23139954
4809	AKB	Atka Airport	North America	US	United States	Alaska	Atka	52.22029877	-174.2059937
4810	PDK	DeKalb Peachtree Airport	North America	US	United States	Georgia	Atlanta	33.87559891	-84.30200195
4811	FTY	Fulton County Airport Brown Field	North America	US	United States	Georgia	Atlanta	33.77909851	-84.52140045
4812	ATL	Hartsfield Jackson Atlanta International Airport	North America	US	United States	Georgia	Atlanta	33.6367	-84.428101
4813	AIO	Atlantic Municipal Airport	North America	US	United States	Iowa	Atlantic	41.40729904	-95.04689789
4814	ACY	Atlantic City International Airport	North America	US	United States	New Jersey	Atlantic City	39.45759964	-74.57720184
4815	ATT	Atmautluak Airport	North America	US	United States	Alaska	Atmautluak	60.866699	-162.272996
4816	ATK	Atqasuk Edward Burnell Sr Memorial Airport	North America	US	United States	Alaska	Atqasuk	70.46704	-157.436013
4817	AUO	Auburn University Regional Airport	North America	US	United States	Alabama	Auburn	32.615101	-85.433998
4818	AUN	Auburn Municipal Airport	North America	US	United States	California	Auburn	38.95479965	-121.0820007
4819	LEW	Auburn Lewiston Municipal Airport	North America	US	United States	Maine	Auburn/Lewiston	44.04850006	-70.28350067
4820	AGS	Augusta Regional At Bush Field	North America	US	United States	Georgia	Augusta	33.3699	-81.9645
4821	DNL	Daniel Field	North America	US	United States	Georgia	Augusta	33.46649933	-82.03939819
4822	AUG	Augusta State Airport	North America	US	United States	Maine	Augusta	44.3205986	-69.79730225
4823	BFK	Buckley Space Force Base	North America	US	United States	Colorado	Aurora	39.701698	-104.751999
4824	AUM	Austin Municipal Airport	North America	US	United States	Minnesota	Austin	43.66500092	-92.93340302
4825	ASQ	Austin Airport	North America	US	United States	Nevada	Austin	39.467998	-117.195
4826	AUS	Austin Bergstrom International Airport	North America	US	United States	Texas	Austin	30.197535	-97.662015
4827	AVX	Catalina Airport	North America	US	United States	California	Avalon	33.4049	-118.416
4828	AVO	Avon Park Executive Airport	North America	US	United States	Florida	Avon Park	27.59119987	-81.52780151
4829	BGT	Bagdad Airport	North America	US	United States	Arizona	Bagdad	34.592796	-113.171993
4830	BGE	Decatur County Industrial Air Park	North America	US	United States	Georgia	Bainbridge	30.9715004	-84.63739777
4831	BKE	Baker City Municipal Airport	North America	US	United States	Oregon	Baker City	44.83729935	-117.8089981
4832	BFL	Meadows Field	North America	US	United States	California	Bakersfield	35.433601	-119.056999
4833	BWI	Baltimore/Washington International Thurgood Marshall Airport	North America	US	United States	Maryland	Baltimore	39.1754	-76.668297
4834	MTN	Martin State Airport	North America	US	United States	Maryland	Baltimore	39.325699	-76.413803
4835	BDY	Bandon State Airport	North America	US	United States	Oregon	Bandon	43.08649826	-124.4079971
4836	BGR	Bangor International Airport	North America	US	United States	Maine	Bangor	44.8074	-68.828102
4837	BNG	Banning Municipal Airport	North America	US	United States	California	Banning	33.922548	-116.850672
4838	BHB	Hancock County-Bar Harbor Airport	North America	US	United States	Maine	Bar Harbor	44.45000076	-68.3615036
4839	BNF	Baranof Warm Springs Float and Seaplane Base	North America	US	United States	Alaska	Baranof	57.088799	-134.833146
4840	BRY	Samuels Field	North America	US	United States	Kentucky	Bardstown	37.81430054	-85.49960327
4841	BNL	Barnwell Regional Airport	North America	US	United States	South Carolina	Barnwell	33.25780106	-81.38829803
4842	MPV	Edward F Knapp State Airport	North America	US	United States	Vermont	Barre/Montpelier	44.20349884	-72.56230164
4843	BTI	Barter Island Long Range Radar Station Airport	North America	US	United States	Alaska	Barter Island	70.134003	-143.582001
4844	BVO	Bartlesville Municipal Airport	North America	US	United States	Oklahoma	Bartlesville	36.76250076	-96.01119995
4845	BOW	Bartow Executive Airport	North America	US	United States	Florida	Bartow	27.943399	-81.783401
4846	BVX	Batesville Regional Airport	North America	US	United States	Arkansas	Batesville	35.7262001	-91.64730072
4847	HLB	Hillenbrand Industries Airport	North America	US	United States	Indiana	Batesville	39.3445015	-85.25830078
4848	BTR	Baton Rouge Metropolitan Airport	North America	US	United States	Louisiana	Baton Rouge	30.533199	-91.149597
4849	BTL	Battle Creek Executive Airport at Kellogg Field	North America	US	United States	Michigan	Battle Creek	42.307301	-85.251503
4850	BAM	Battle Mountain Airport	North America	US	United States	Nevada	Battle Mountain	40.59899902	-116.8740005
4851	BDE	Baudette International Airport	North America	US	United States	Minnesota	Baudette	48.72840118	-94.61219788
4852	BBC	Bay City Regional Airport	North America	US	United States	Texas	Bay City	28.973301	-95.863503
4853	HPY	Baytown Airport	North America	US	United States	Texas	Baytown	29.78610039	-94.95269775
4854	BCC	Bear Creek 3 Airport	North America	US	United States	Alaska	Bear Creek	63.57331604	-156.1494541
4855	BIE	Beatrice Municipal Airport	North America	US	United States	Nebraska	Beatrice	40.30130005	-96.75409698
4856	BTY	Beatty Airport	North America	US	United States	Nevada	Beatty	36.86109924	-116.7870026
4857	BFT	Beaufort County Airport	North America	US	United States	South Carolina	Beaufort	32.41220093	-80.63439941
4858	BMT	Beaumont Municipal Airport	North America	US	United States	Texas	Beaumont	30.070635	-94.215746
4859	BPT	Jack Brooks Regional Airport	North America	US	United States	Texas	Beaumont/Port Arthur	29.9508	-94.020699
4860	WBQ	Beaver Airport	North America	US	United States	Alaska	Beaver	66.36219788	-147.4069977
4861	BFP	Beaver County Airport	North America	US	United States	Pennsylvania	Beaver Falls	40.77249908	-80.3914032
4862	BKW	Raleigh County Memorial Airport	North America	US	United States	West Virginia	Beckley	37.78730011	-81.12419891
4863	NVN	Nervino Airport	North America	US	United States	California	Beckwourth	39.81850052	-120.3529968
4864	BFR	Virgil I Grissom Municipal Airport	North America	US	United States	Indiana	Bedford	38.84000015	-86.44539642
4865	BED	Laurence G Hanscom Field	North America	US	United States	Massachusetts	Bedford	42.47000122	-71.28900146
4866	NIR	Chase Field Industrial Airport	North America	US	United States	Texas	Beeville	28.362444	-97.661917
4867	KBE	Bell Island Hot Springs Seaplane Base	North America	US	United States	Alaska	Bell Island	55.92910004	-131.5720062
4868	ACB	Antrim County Airport	North America	US	United States	Michigan	Bellaire	44.988602	-85.198402
4869	BCS	Southern Seaplane Airport	North America	US	United States	Louisiana	Belle Chasse	29.866078	-90.021608
4870	BLV	Scott AFB/Midamerica Airport	North America	US	United States	Illinois	Belleville	38.5452	-89.835197
4871	BLI	Bellingham International Airport	North America	US	United States	Washington	Bellingham	48.7928009	-122.538002
4872	BLM	Monmouth Executive Airport	North America	US	United States	New Jersey	Belmar/Farmingdale	40.18690109	-74.12490082
4873	BVU	Beluga Airport	North America	US	United States	Alaska	Beluga	61.17219925	-151.0440063
4874	BJI	Bemidji Regional Airport	North America	US	United States	Minnesota	Bemidji	47.50939941	-94.93370056
4875	BTN	Marlboro County Jetport H.E. Avent Field	North America	US	United States	South Carolina	Bennettsville	34.62170029	-79.73439789
4876	BBB	Benson Municipal Airport	North America	US	United States	Minnesota	Benson	45.33190155	-95.65059662
4877	BEH	Southwest Michigan Regional Airport	North America	US	United States	Michigan	Benton Harbor	42.12860107	-86.42849731
4878	BML	Berlin Regional Airport	North America	US	United States	New Hampshire	Berlin	44.57540131	-71.17590332
4879	BET	Bethel Airport	North America	US	United States	Alaska	Bethel	60.77980042	-161.8379974
4880	JBT	Bethel Seaplane Base	North America	US	United States	Alaska	Bethel	60.7820015	-161.7429962
4881	BTT	Bettles Airport	North America	US	United States	Alaska	Bettles	66.91390228	-151.529007
4882	BVY	Beverly Regional Airport	North America	US	United States	Massachusetts	Beverly / Danvers	42.584202	-70.916496
4883	RBF	Big Bear City Airport	North America	US	United States	California	Big Bear	34.26380157	-116.8560028
4884	BGQ	Big Lake Airport	North America	US	United States	Alaska	Big Lake	61.534658	-149.812936
4885	BMX	Big Mountain Airport	North America	US	United States	Alaska	Big Mountain	59.362274	-155.260148
4886	BPI	Miley Memorial Field	North America	US	United States	Wyoming	Big Piney	42.58509827	-110.1110001
4887	WBR	Roben Hood Airport	North America	US	United States	Michigan	Big Rapids	43.72259903	-85.50409698
4888	HCA	Big Spring Mc Mahon-Wrinkle Airport	North America	US	United States	Texas	Big Spring	32.212601	-101.522003
4889	BIL	Billings Logan International Airport	North America	US	United States	Montana	Billings	45.807701	-108.542999
4890	BIX	Keesler Air Force Base	North America	US	United States	Mississippi	Biloxi	30.41040039	-88.92440033
4891	BGM	Greater Binghamton/Edwin A Link field	North America	US	United States	New York	Binghamton	42.20869827	-75.97979736
4892	KBC	Birch Creek Airport	North America	US	United States	Alaska	Birch Creek	66.27400208	-145.8240051
4893	BHM	Birmingham-Shuttlesworth International Airport	North America	US	United States	Alabama	Birmingham	33.562901	-86.753502
4894	BSQ	Bisbee Municipal Airport	North America	US	United States	Arizona	Bisbee	31.36400032	-109.8830032
4895	BIH	Eastern Sierra Regional Airport	North America	US	United States	California	Bishop	37.37310028	-118.3639984
4896	BIS	Bismarck Municipal Airport	North America	US	United States	North Dakota	Bismarck	46.77270126	-100.7460022
4897	BCB	Virginia Tech Montgomery Executive Airport	North America	US	United States	Virginia	Blacksburg	37.20759964	-80.40779877
4898	BKT	Allen C Perkinson Blackstone Army Air Field	North America	US	United States	Virginia	Blackstone	37.07419968	-77.95749664
4899	BWL	Earl Henry Airport	North America	US	United States	Oklahoma	Blackwell	36.79589844	-97.31700134
4900	BYW	Blakely Island Airport	North America	US	United States	Washington	Blakely Island	48.57899857	-122.8259964
4901	BDG	Blanding Municipal Airport	North America	US	United States	Utah	Blanding	37.58330154	-109.4830017
4902	BID	Block Island State Airport	North America	US	United States	Rhode Island	Block Island	41.16809845	-71.57779694
4903	BMG	Monroe County Airport	North America	US	United States	Indiana	Bloomington	39.14599991	-86.61669922
4904	BMI	Central Illinois Regional Airport at Bloomington-Normal	North America	US	United States	Illinois	Bloomington/Normal	40.4771	-88.915901
4905	BLF	Mercer County Airport	North America	US	United States	West Virginia	Bluefield	37.29579926	-81.20770264
4906	BLH	Blythe Airport	North America	US	United States	California	Blythe	33.61920166	-114.7170029
4907	BYH	Arkansas International Airport	North America	US	United States	Arkansas	Blytheville	35.96429825	-89.94400024
4908	HKA	Blytheville Municipal Airport	North America	US	United States	Arkansas	Blytheville	35.94039917	-89.83080292
4909	BCT	Boca Raton Airport	North America	US	United States	Florida	Boca Raton	26.37849998	-80.10769653
4910	BXA	George R Carr Memorial Air Field	North America	US	United States	Louisiana	Bogalusa	30.81369972	-89.86499786
4911	BOI	Boise Air Terminal/Gowen Field	North America	US	United States	Idaho	Boise	43.5644	-116.223
4912	BNW	Boone Municipal Airport	North America	US	United States	Iowa	Boone	42.04959869	-93.84760284
4913	BGD	Hutchinson County Airport	North America	US	United States	Texas	Borger	35.70090103	-101.3939972
4914	BXS	Borrego Valley Airport	North America	US	United States	California	Borrego Springs	33.25899887	-116.3209991
4915	BAD	Barksdale Air Force Base	North America	US	United States	Louisiana	Bossier City	32.501801	-93.662697
4916	BNH	Cape Air Seaplanes on Boston Harbor Seaplane Base	North America	US	United States	Massachusetts	Boston	42.352502	-71.025832
4917	BOS	Logan International Airport	North America	US	United States	Massachusetts	Boston	42.3643	-71.005203
4918	BSW	Boswell Bay Airport	North America	US	United States	Alaska	Boswell Bay	60.42309952	-146.1459961
4919	WBU	Boulder Municipal Airport	North America	US	United States	Colorado	Boulder	40.03939819	-105.2259979
4920	BLD	Boulder City-Lake Mead International Airport	North America	US	United States	Nevada	Boulder City	35.947498	-114.861
4921	BYA	Boundary Airport	North America	US	United States	Alaska	Boundary	64.07830048	-141.1130066
4922	BTF	Skypark Airport	North America	US	United States	Utah	Bountiful	40.86940002	-111.927002
4923	BWG	Bowling Green Warren County Regional Airport	North America	US	United States	Kentucky	Bowling Green	36.96450043	-86.41970062
4924	BWM	Bowman Regional Airport	North America	US	United States	North Dakota	Bowman	46.1655193	-103.30075
4925	BZN	Gallatin Field	North America	US	United States	Montana	Bozeman	45.77750015	-111.1529999
4926	BDF	Rinkenberger Restricted Landing Area	North America	US	United States	Illinois	Bradford	41.23089981	-89.61569977
4927	BFD	Bradford Regional Airport	North America	US	United States	Pennsylvania	Bradford	41.80310059	-78.64009857
4928	BBD	Curtis Field	North America	US	United States	Texas	Brady	31.17930031	-99.32389832
4929	BRD	Brainerd Lakes Regional Airport	North America	US	United States	Minnesota	Brainerd	46.402861	-94.129727
4930	BKG	Branson Airport	North America	US	United States	Missouri	Branson	36.532082	-93.200544
4931	PLK	M. Graham Clark Downtown Airport	North America	US	United States	Missouri	Branson / Hollister	36.62590027	-93.22889709
4932	BWC	Brawley Municipal Airport	North America	US	United States	California	Brawley	32.99290085	-115.5169983
4933	BZT	Eagle Air Park	North America	US	United States	Texas	Brazoria	28.98220062	-95.57969666
4934	BKD	Stephens County Airport	North America	US	United States	Texas	Breckenridge	32.71900177	-98.89099884
4935	PWT	Bremerton National Airport	North America	US	United States	Washington	Bremerton	47.49020004	-122.7649994
4936	KTS	Brevig Mission Airport	North America	US	United States	Alaska	Brevig Mission	65.33129883	-166.4660034
4937	BDR	Igor I Sikorsky Memorial Airport	North America	US	United States	Connecticut	Bridgeport	41.16350174	-73.12619781
4938	BMC	Brigham City Regional Airport	North America	US	United States	Utah	Brigham City	41.552399	-112.061996
4939	TRI	Tri-Cities Regional TN/VA Airport	North America	US	United States	Tennessee	Bristol/Johnson/Kingsport	36.475201	-82.407401
4940	TTO	Britton Municipal Airport	North America	US	United States	South Dakota	Britton	45.81520081	-97.74310303
4941	BDX	Broadus Airport	North America	US	United States	Montana	Broadus	45.47249985	-105.4540024
4942	BBW	Broken Bow Municipal Airport	North America	US	United States	Nebraska	Broken Bow	41.43650055	-99.64219666
4943	BOK	Brookings Airport	North America	US	United States	Oregon	Brookings	42.0746	-124.290001
4944	BKX	Brookings Regional Airport	North America	US	United States	South Dakota	Brookings	44.304798	-96.816902
4945	BRO	Brownsville South Padre Island International Airport	North America	US	United States	Texas	Brownsville	25.90679932	-97.42590332
4946	BWD	Brownwood Regional Airport	North America	US	United States	Texas	Brownwood	31.79360008	-98.95649719
4947	BQK	Brunswick Golden Isles Airport	North America	US	United States	Georgia	Brunswick	31.25880051	-81.46649933
4948	NHZ	Brunswick Executive Airport	North America	US	United States	Maine	Brunswick	43.89220047	-69.93859863
4949	CFD	Coulter Field	North America	US	United States	Texas	Bryan	30.71570015	-96.33139801
4950	BCE	Bryce Canyon Airport	North America	US	United States	Utah	Bryce Canyon	37.70640183	-112.1449966
4951	BXK	Buckeye Municipal Airport	North America	US	United States	Arizona	Buckeye	33.422397	-112.686317
4952	BKC	Buckland Airport	North America	US	United States	Alaska	Buckland	65.981598	-161.149002
4953	BUF	Buffalo Niagara International Airport	North America	US	United States	New York	Buffalo	42.94049835	-78.73220062
4954	BYG	Johnson County Airport	North America	US	United States	Wyoming	Buffalo	44.3810997	-106.7220001
4955	BFG	Bullfrog Basin Airport	North America	US	United States	Utah	Bullfrog	37.547827	-110.712898
4956	IFP	Laughlin Bullhead International Airport	North America	US	United States	Arizona	Bullhead City	35.157398	-114.559998
4957	BUR	Bob Hope Airport	North America	US	United States	California	Burbank	34.197703	-118.356378
4958	BYI	Burley Municipal Airport	North America	US	United States	Idaho	Burley	42.54259872	-113.7720032
4959	BRL	Southeast Iowa Regional Airport	North America	US	United States	Iowa	Burlington	40.78319931	-91.12550354
4960	MVW	Skagit Regional Airport	North America	US	United States	Washington	Burlington	48.470901	-122.420998
4961	BNO	Burns Municipal Airport	North America	US	United States	Oregon	Burns	43.59189987	-118.9550018
4962	BUB	Cram Field	North America	US	United States	Nebraska	Burwell	41.77669907	-99.14969635
4963	BUM	Butler Memorial Airport	North America	US	United States	Missouri	Butler	38.28979874	-94.34010315
4964	BTP	Pittsburgh/Butler Regional Airport	North America	US	United States	Pennsylvania	Butler	40.776901	-79.949699
4965	BTM	Bert Mooney Airport	North America	US	United States	Montana	Butte	45.95479965	-112.4970016
4966	CAD	Wexford County Airport	North America	US	United States	Michigan	Cadillac	44.275749	-85.421534
4967	CPS	St Louis Downtown Airport	North America	US	United States	Illinois	Cahokia/St Louis	38.5707016	-90.15619659
4968	CIR	Cairo Regional Airport	North America	US	United States	Illinois	Cairo	37.0644989	-89.21959686
4969	CDW	Essex County Airport	North America	US	United States	New Jersey	Caldwell	40.87519836	-74.28140259
4970	CXL	Calexico International Airport	North America	US	United States	California	Calexico	32.66949844	-115.5130005
4971	LTW	St. Mary's County Regional Airport	North America	US	United States	Maryland	California	38.315399	-76.550102
4972	CLR	Cliff Hatfield Memorial Airport	North America	US	United States	California	Calipatria	33.13150024	-115.5210037
4973	CTO	Calverton Executive Airpark	North America	US	United States	New York	Calverton	40.9151001	-72.79190063
4974	CGE	Cambridge Dorchester Airport	North America	US	United States	Maryland	Cambridge	38.53929901	-76.03040314
4975	CDH	Harrell Field	North America	US	United States	Arkansas	Camden	33.62279892	-92.76339722
4976	CDN	Woodward Field	North America	US	United States	South Carolina	Camden	34.28359985	-80.56490326
4977	VOK	Volk Field	North America	US	United States	Wisconsin	Camp Douglas	43.93899918	-90.25340271
4978	ADW	Joint Base Andrews	North America	US	United States	Maryland	Camp Springs	38.810799	-76.866997
4979	CDL	Candle 2 Airport	North America	US	United States	Alaska	Candle	65.90769959	-161.9259949
4980	CTK	Canton Municipal Airport	North America	US	United States	South Dakota	Canton	43.308899	-96.570999
4981	CGI	Cape Girardeau Regional Airport	North America	US	United States	Missouri	Cape Girardeau	37.2253	-89.570801
4982	LUR	Cape Lisburne LRRS Airport	North America	US	United States	Alaska	Cape Lisburne	68.87509918	-166.1100006
4983	EHM	Cape Newenham LRRS Airport	North America	US	United States	Alaska	Cape Newenham	58.64640045	-162.0630035
4984	CZP	Cape Pole Seaplane Base	North America	US	United States	Alaska	Cape Pole	55.96630096	-133.7969971
4985	CZF	Cape Romanzof LRRS Airport	North America	US	United States	Alaska	Cape Romanzof	61.78030014	-166.0390015
4986	MDH	Southern Illinois Airport	North America	US	United States	Illinois	Carbondale/Murphysboro	37.77809906	-89.2519989
4987	CAR	Caribou Municipal Airport	North America	US	United States	Maine	Caribou	46.871498	-68.017899
4988	CLD	McClellan-Palomar Airport	North America	US	United States	California	Carlsbad	33.1283	-117.279999
4989	CNM	Cavern City Air Terminal	North America	US	United States	New Mexico	Carlsbad	32.33750153	-104.2630005
4990	TZC	Tuscola Area Airport	North America	US	United States	Michigan	Caro	43.45880127	-83.44550323
4991	CZT	Dimmit County Airport	North America	US	United States	Texas	Carrizo Springs	28.52219963	-99.82360077
4992	CIN	Arthur N Neu Airport	North America	US	United States	Iowa	Carroll	42.0461998	-94.78900146
4993	CSN	Carson Airport	North America	US	United States	Nevada	Carson City	39.19219971	-119.7340012
4994	SOP	Moore County Airport	North America	US	United States	North Carolina	Carthage	35.237184	-79.389381
4995	CGZ	Casa Grande Municipal Airport	North America	US	United States	Arizona	Casa Grande	32.954899	-111.766998
4996	ICS	Cascade Airport	North America	US	United States	Idaho	Cascade	44.49380112	-116.0159988
4997	CZK	Cascade Locks State Airport	North America	US	United States	Oregon	Cascade Locks	45.676599	-121.878879
4998	CPR	Casper-Natrona County International Airport	North America	US	United States	Wyoming	Casper	42.908001	-106.463997
4999	CDC	Cedar City Regional Airport	North America	US	United States	Utah	Cedar City	37.70100021	-113.098999
5000	CID	The Eastern Iowa Airport	North America	US	United States	Iowa	Cedar Rapids	41.884701	-91.7108
5001	CWS	Center Island Airport	North America	US	United States	Washington	Center Island	48.49010086	-122.8320007
5002	GHM	Centerville Municipal Airport	North America	US	United States	Tennessee	Centerville	35.83739853	-87.44539642
5003	CEM	Central Airport	North America	US	United States	Alaska	Central	65.57379913	-144.7830048
5004	ENL	Centralia Municipal Airport	North America	US	United States	Illinois	Centralia	38.51509857	-89.0911026
5005	CDR	Chadron Municipal Airport	North America	US	United States	Nebraska	Chadron	42.83760071	-103.0950012
5006	CIK	Chalkyitsik Airport	North America	US	United States	Alaska	Chalkyitsik	66.64499664	-143.7400055
5007	CHL	Challis Airport	North America	US	United States	Idaho	Challis	44.522999	-114.218002
5008	WCR	Chandalar Lake Airport	North America	US	United States	Alaska	Chandalar Lake	67.50450134	-148.4830017
5009	CNU	Chanute Martin Johnson Airport	North America	US	United States	Kansas	Chanute	37.668173	-95.486727
5010	CCY	Northeast Iowa Regional Airport	North America	US	United States	Iowa	Charles City	43.07260132	-92.6108017
5011	CHS	Charleston International Airport	North America	US	United States	South Carolina	Charleston	32.898602	-80.040497
5012	CRW	Yeager Airport	North America	US	United States	West Virginia	Charleston	38.3731	-81.593201
5013	CLT	Charlotte Douglas International Airport	North America	US	United States	North Carolina	Charlotte	35.2140007	-80.94309998
5014	CHO	Charlottesville Albemarle Airport	North America	US	United States	Virginia	Charlottesville	38.1385994	-78.45290375
5015	CYM	Chatham Seaplane Base	North America	US	United States	Alaska	Chatham	57.5149	-134.945999
5016	CHA	Chattanooga Metropolitan Airport (Lovell Field)	North America	US	United States	Tennessee	Chattanooga	35.035301	-85.203796
5017	CYF	Chefornak Airport	North America	US	United States	Alaska	Chefornak	60.136667	-164.279167
5018	CLS	Chehalis Centralia Airport	North America	US	United States	Washington	Chehalis	46.67699814	-122.9830017
5019	CEX	Chena Hot Springs Airport	North America	US	United States	Alaska	Chena Hot Springs	65.05180359	-146.0469971
5020	NCN	Chenega Bay Airport	North America	US	United States	Alaska	Chenega	60.077602	-147.99468
5021	HCW	Cheraw Municipal Airport/Lynch Bellinger Field	North America	US	United States	South Carolina	Cheraw	34.71289825	-79.95700073
5022	KCN	Chernofski Harbor Seaplane Base	North America	US	United States	Alaska	Chernofski Harbor	53.40289934	-167.5202715
5023	CKA	Kegelman AF Aux Field	North America	US	United States	Oklahoma	Cherokee	36.7439003	-98.12310028
5024	HTW	Lawrence County Airpark	North America	US	United States	Ohio	Chesapeake/Huntington Wva	38.4193	-82.494301
5025	VAK	Chevak Airport	North America	US	United States	Alaska	Chevak	61.5409	-165.6005
5026	CYS	Cheyenne Regional Jerry Olson Field	North America	US	United States	Wyoming	Cheyenne	41.15570068	-104.8119965
5027	MDW	Chicago Midway International Airport	North America	US	United States	Illinois	Chicago	41.785999	-87.752403
5028	ORD	Chicago O'Hare International Airport	North America	US	United States	Illinois	Chicago	41.9786	-87.9048
5029	AUZ	Aurora Municipal Airport	North America	US	United States	Illinois	Chicago/Aurora	41.77190018	-88.47570038
5030	PWK	Chicago Executive Airport	North America	US	United States	Illinois	Chicago/Prospect Heights/Wheeling	42.114222	-87.901494
5031	RFD	Chicago Rockford International Airport	North America	US	United States	Illinois	Chicago/Rockford	42.1954	-89.097198
5032	LOT	Lewis University Airport	North America	US	United States	Illinois	Chicago/Romeoville	41.6072998	-88.09619904
5033	UGN	Waukegan National Airport	North America	US	United States	Illinois	Chicago/Waukegan	42.42219925	-87.86789703
5034	DPA	Dupage Airport	North America	US	United States	Illinois	Chicago/West Chicago	41.90779877	-88.24859619
5035	CHK	Chickasha Municipal Airport	North America	US	United States	Oklahoma	Chickasha	35.09740067	-97.96769714
5036	CKX	Chicken Airport	North America	US	United States	Alaska	Chicken	64.07129669	-141.9519959
5037	CIC	Chico Municipal Airport	North America	US	United States	California	Chico	39.79539871	-121.8580017
5038	KBW	Chignik Bay Seaplane Base	North America	US	United States	Alaska	Chignik	56.29560089	-158.401001
5039	KCL	Chignik Lagoon Airport	North America	US	United States	Alaska	Chignik Flats	56.31119919	-158.5359955
5040	KCQ	Chignik Lake Airport	North America	US	United States	Alaska	Chignik Lake	56.25500107	-158.7749939
5041	CDS	Childress Municipal Airport	North America	US	United States	Texas	Childress	34.43379974	-100.288002
5042	CHZ	Chiloquin State Airport	North America	US	United States	Oregon	Chiloquin	42.57944049	-121.8790627
5043	CNO	Chino Airport	North America	US	United States	California	Chino	33.97470093	-117.637001
5044	CZN	Chisana Airport	North America	US	United States	Alaska	Chisana	62.07120132	-142.0480042
5045	CZO	Chistochina Airport	North America	US	United States	Alaska	Chistochina	62.56349945	-144.6690063
5046	CXC	Chitina Airport	North America	US	United States	Alaska	Chitina	61.582901	-144.427002
5047	CIV	Chomley Seaplane Base	North America	US	United States	Alaska	Chomley	55.217	-132.21
5048	CHU	Chuathbaluk Airport	North America	US	United States	Alaska	Chuathbaluk	61.579102	-159.216003
5049	LUK	Cincinnati Municipal Airport Lunken Field	North America	US	United States	Ohio	Cincinnati	39.10329819	-84.41860199
5050	CVG	Cincinnati Northern Kentucky International Airport	North America	US	United States	Kentucky	Cincinnati / Covington	39.048801	-84.667801
5051	IRC	Circle City (New) Airport	North America	US	United States	Alaska	Circle	65.827673	-144.076195
5052	CHP	Circle Hot Springs Airport	North America	US	United States	Alaska	Circle Hot Springs	65.48549652	-144.6109924
5053	CNH	Claremont Municipal Airport	North America	US	United States	New Hampshire	Claremont	43.37039948	-72.36869812
5054	ICL	Schenck Field	North America	US	United States	Iowa	Clarinda	40.72180176	-95.02639771
5055	CLP	Clarks Point Airport	North America	US	United States	Alaska	Clarks Point	58.83369827	-158.529007
5056	CKB	North Central West Virginia Airport	North America	US	United States	West Virginia	Clarksburg	39.29660034	-80.22810364
5057	CKM	Fletcher Field	North America	US	United States	Mississippi	Clarksdale	34.29970169	-90.51229858
5058	CKV	Clarksville???Montgomery County Regional Airport	North America	US	United States	Tennessee	Clarksville	36.62189865	-87.41500092
5059	CAO	Clayton Municipal Airpark	North America	US	United States	New Mexico	Clayton	36.44620132	-103.1669998
5060	MCW	Mason City Municipal Airport	North America	US	United States	Iowa	Clear Lake	43.157799	-93.331299
5061	CLW	Clearwater Air Park	North America	US	United States	Florida	Clearwater	27.97669983	-82.75869751
5062	CEU	Oconee County Regional Airport	North America	US	United States	South Carolina	Clemson	34.6719017	-82.8864975
5063	BKL	Burke Lakefront Airport	North America	US	United States	Ohio	Cleveland	41.51750183	-81.6832962
5064	CLE	Cleveland Hopkins International Airport	North America	US	United States	Ohio	Cleveland	41.4117012	-81.84980011
5065	CGF	Cuyahoga County Airport	North America	US	United States	Ohio	Cleveland	41.56510162	-81.48639679
5066	CFT	Greenlee County Airport	North America	US	United States	Arizona	Clifton/Morenci	32.957039	-109.211397
5067	CWI	Clinton Municipal Airport	North America	US	United States	Iowa	Clinton	41.83110046	-90.32910156
5068	CTZ	Sampson County Airport	North America	US	United States	North Carolina	Clinton	34.9756012	-78.36460114
5069	CLK	Clinton Regional Airport	North America	US	United States	Oklahoma	Clinton	35.53829956	-98.93270111
5070	CSM	Clinton Sherman Airport	North America	US	United States	Oklahoma	Clinton	35.33980179	-99.20050049
5071	CLI	Clintonville Municipal Airport	North America	US	United States	Wisconsin	Clintonville	44.61380005	-88.73130035
5072	CVS	Cannon Air Force Base	North America	US	United States	New Mexico	Clovis	34.382801	-103.321999
5073	CVN	Clovis Municipal Airport	North America	US	United States	New Mexico	Clovis	34.42509842	-103.0790024
5074	CLG	New Coalinga Municipal Airport	North America	US	United States	California	Coalinga	36.1631012	-120.2939987
5075	CTH	Chester County G O Carlson Airport	North America	US	United States	Pennsylvania	Coatesville	39.97900009	-75.8655014
5076	COF	Patrick Air Force Base	North America	US	United States	Florida	Cocoa Beach	28.23489952	-80.61009979
5077	COD	Yellowstone Regional Airport	North America	US	United States	Wyoming	Cody	44.52019882	-109.0240021
5078	COE	Coeur D'Alene - Pappy Boyington Field	North America	US	United States	Idaho	Coeur d'Alene	47.77429962	-116.8199997
5079	CFV	Coffeyville Municipal Airport	North America	US	United States	Kansas	Coffeyville	37.09400177	-95.57189941
5080	KCC	Coffman Cove Seaplane Base	North America	US	United States	Alaska	Coffman Cove	56.00320053	-132.8419952
5081	CBK	Shalz Field	North America	US	United States	Kansas	Colby	39.42750168	-101.0469971
5082	CDB	Cold Bay Airport	North America	US	United States	Alaska	Cold Bay	55.2061	-162.725006
5083	PML	Port Moller Airport	North America	US	United States	Alaska	Cold Bay	56.00600052	-160.5610046
5084	CXF	Coldfoot Airport	North America	US	United States	Alaska	Coldfoot	67.25219727	-150.2039948
5085	COM	Coleman Municipal Airport	North America	US	United States	Texas	Coleman	31.84110069	-99.4036026
5086	CGS	College Park Airport	North America	US	United States	Maryland	College Park	38.98059845	-76.92230225
5087	CLL	Easterwood Field	North America	US	United States	Texas	College Station	30.58860016	-96.36380005
5088	KCR	Colorado Creek Airport	North America	US	United States	Alaska	Colorado Creek	63.56769943	-155.9889984
5089	COS	City of Colorado Springs Municipal Airport	North America	US	United States	Colorado	Colorado Springs	38.805801	-104.700996
5090	AFF	USAF Academy Airfield	North America	US	United States	Colorado	Colorado Springs	38.96969986	-104.8130035
5091	COA	Columbia Airport	North America	US	United States	California	Columbia	38.03039932	-120.4150009
5092	COU	Columbia Regional Airport	North America	US	United States	Missouri	Columbia	38.8181	-92.219597
5093	CAE	Columbia Metropolitan Airport	North America	US	United States	South Carolina	Columbia	33.938801	-81.119499
5094	CUB	Jim Hamilton L.B. Owens Airport	North America	US	United States	South Carolina	Columbia	33.97050095	-80.99520111
5095	MRC	Maury County Airport	North America	US	United States	Tennessee	Columbia/Mount Pleasant	35.55410004	-87.17890167
5096	CSG	Columbus Metropolitan Airport	North America	US	United States	Georgia	Columbus	32.5163002	-84.93890381
5097	CLU	Columbus Municipal Airport	North America	US	United States	Indiana	Columbus	39.262386	-85.895576
5098	CBM	Columbus Air Force Base	North America	US	United States	Mississippi	Columbus	33.643799	-88.443802
5099	UBS	Columbus Lowndes County Airport	North America	US	United States	Mississippi	Columbus	33.4654007	-88.38030243
5100	CMH	John Glenn Columbus International Airport	North America	US	United States	Ohio	Columbus	39.998001	-82.891899
5101	LCK	Rickenbacker International Airport	North America	US	United States	Ohio	Columbus	39.813801	-82.927803
5102	OSU	The Ohio State University Airport - Don Scott Field	North America	US	United States	Ohio	Columbus	40.0798	-83.072998
5103	GTR	Golden Triangle Regional Airport	North America	US	United States	Mississippi	Columbus/W Point/Starkville	33.45029831	-88.59140015
5104	CPM	Compton Woodley Airport	North America	US	United States	California	Compton	33.88999939	-118.2440033
5105	CCR	Buchanan Field	North America	US	United States	California	Concord	37.98970032	-122.0569992
5106	CON	Concord Municipal Airport	North America	US	United States	New Hampshire	Concord	43.20270157	-71.50229645
5107	USA	Concord-Padgett Regional Airport	North America	US	United States	North Carolina	Concord	35.387798	-80.709099
5108	CNK	Blosser Municipal Airport	North America	US	United States	Kansas	Concordia	39.54930115	-97.65229797
5109	CEV	Mettel Field	North America	US	United States	Indiana	Connersville	39.69850159	-85.12969971
5110	JLA	Quartz Creek Airport	North America	US	United States	Alaska	Cooper Landing	60.48270035	-149.7189941
5111	COP	Cooperstown-Westville Airport	North America	US	United States	New York	Cooperstown	42.629552	-74.890445
5112	CZC	Copper Center 2 Airport	North America	US	United States	Alaska	Copper Center	61.943713	-145.299398
5113	CRO	Corcoran Airport	North America	US	United States	California	Corcoran	36.102502	-119.595001
5114	CKU	Cordova Municipal Airport	North America	US	United States	Alaska	Cordova	60.54389954	-145.727005
5115	CDV	Merle K (Mudhole) Smith Airport	North America	US	United States	Alaska	Cordova	60.491798	-145.477997
5116	CRX	Roscoe Turner Airport	North America	US	United States	Mississippi	Corinth	34.91500092	-88.60350037
5117	DUF	Pine Island Airport	North America	US	United States	North Carolina	Corolla	36.25350189	-75.78849792
5118	CRP	Corpus Christi International Airport	North America	US	United States	Texas	Corpus Christi	27.770399	-97.501198
5119	CRS	C David Campbell Field Corsicana Municipal Airport	North America	US	United States	Texas	Corsicana	32.02809906	-96.40059662
5120	CEZ	Cortez Municipal Airport	North America	US	United States	Colorado	Cortez	37.3030014	-108.6279984
5121	CTX	Cortland County Chase Field	North America	US	United States	New York	Cortland	42.59260178	-76.21489716
5122	CVO	Corvallis Municipal Airport	North America	US	United States	Oregon	Corvallis	44.49720001	-123.2900009
5123	COT	Cotulla-La Salle County Airport	North America	US	United States	Texas	Cotulla	28.45669937	-99.22029877
5124	CIL	Council Airport	North America	US	United States	Alaska	Council	64.89790344	-163.7030029
5125	CBF	Council Bluffs Municipal Airport	North America	US	United States	Iowa	Council Bluffs	41.25920105	-95.76059723
5126	CGA	Craig Seaplane Base	North America	US	United States	Alaska	Craig	55.47880173	-133.147995
5127	CIG	Craig Moffat Airport	North America	US	United States	Colorado	Craig	40.49520111	-107.5220032
5128	CCG	Crane County Airport	North America	US	United States	Texas	Crane	31.4151001	-102.362999
5129	CKR	Crane Island Airstrip	North America	US	United States	Washington	Crane Island	48.5978	-122.9979
5130	CEC	Jack Mc Namara Field Airport	North America	US	United States	California	Crescent City	41.78020096	-124.2369995
5131	CSE	Crested Butte Airpark	North America	US	United States	Colorado	Crested Butte	38.851918	-106.928341
5132	CSQ	Creston Municipal Airport	North America	US	United States	Iowa	Creston	41.02140045	-94.36329651
5133	CEW	Bob Sikes Airport	North America	US	United States	Florida	Crestview	30.77879906	-86.52210236
5134	EGI	Duke Field	North America	US	United States	Florida	Crestview	30.65040016	-86.52290344
5135	CKD	Crooked Creek Airport	North America	US	United States	Alaska	Crooked Creek	61.86790085	-158.1349945
5136	CKN	Crookston Municipal Kirkwood Field	North America	US	United States	Minnesota	Crookston	47.84170151	-96.62159729
5137	CTY	Cross City Airport	North America	US	United States	Florida	Cross City	29.63549995	-83.10479736
5138	CRT	Z M Jack Stell Field	North America	US	United States	Arkansas	Crossett	33.17829895	-91.88020325
5139	CSV	Crossville Memorial Whitson Field	North America	US	United States	Tennessee	Crossville	35.95130157	-85.08499908
5140	CUH	Cushing Municipal Airport	North America	US	United States	Oklahoma	Cushing	35.950496	-96.772371
5141	CTB	Cut Bank International Airport	North America	US	United States	Montana	Cut Bank	48.608657	-112.378183
5142	DAG	Barstow Daggett Airport	North America	US	United States	California	Daggett	34.85369873	-116.7870026
5143	DCK	Dahl Creek Airport	North America	US	United States	Alaska	Dahl Creek	66.94329834	-156.9049988
5144	DGN	Dahlgren Naval Surface Warfare Center Airport	North America	US	United States	Virginia	Dahlgren	38.33250046	-77.03720093
5145	DHT	Dalhart Municipal Airport	North America	US	United States	Texas	Dalhart	36.02259827	-102.5469971
5146	ADS	Addison Airport	North America	US	United States	Texas	Dallas	32.96860123	-96.83640289
5147	RBD	Dallas Executive Airport	North America	US	United States	Texas	Dallas	32.68090057	-96.86820221
5148	DAL	Dallas Love Field	North America	US	United States	Texas	Dallas	32.847099	-96.851799
5149	DFW	Dallas Fort Worth International Airport	North America	US	United States	Texas	Dallas-Fort Worth	32.896801	-97.038002
5150	DLS	Columbia Gorge Regional Airport	North America	US	United States	Oregon	Dallesport / The Dalles	45.620979	-121.170777
5151	DNN	Dalton Municipal Airport	North America	US	United States	Georgia	Dalton	34.72290039	-84.87020111
5152	DXR	Danbury Municipal Airport	North America	US	United States	Connecticut	Danbury	41.37149811	-73.48220062
5153	DSV	Dansville Municipal Airport	North America	US	United States	New York	Dansville	42.57089996	-77.71309662
5154	DNV	Vermilion Regional Airport	North America	US	United States	Illinois	Danville	40.199124	-87.59663
5155	DAN	Danville Regional Airport	North America	US	United States	Virginia	Danville	36.572899	-79.336098
5156	DVN	Davenport Municipal Airport	North America	US	United States	Iowa	Davenport	41.610432	-90.589693
5157	MGY	Dayton-Wright Brothers Airport	North America	US	United States	Ohio	Dayton	39.5890007	-84.22489929
5158	DAY	James M Cox Dayton International Airport	North America	US	United States	Ohio	Dayton	39.902401	-84.219398
5159	FFO	Wright-Patterson Air Force Base	North America	US	United States	Ohio	Dayton	39.826099	-84.048302
5160	DAB	Daytona Beach International Airport	North America	US	United States	Florida	Daytona Beach	29.179899	-81.058098
5161	SCC	Deadhorse Airport	North America	US	United States	Alaska	Deadhorse	70.19470215	-148.4649963
5162	DTH	Furnace Creek Airport	North America	US	United States	California	Death Valley	36.463799	-116.880997
5163	DCU	Pryor Field Regional Airport	North America	US	United States	Alabama	Decatur	34.65269852	-86.94539642
5164	DEC	Decatur Airport	North America	US	United States	Illinois	Decatur	39.83459854	-88.86569977
5165	DTR	Decatur Shores Airport	North America	US	United States	Washington	Decatur	48.49980164	-122.814003
5166	DEH	Decorah Municipal Airport	North America	US	United States	Iowa	Decorah	43.275501	-91.739403
5167	DHB	Deer Harbor SPB	North America	US	United States	Washington	Deer Harbor	48.61666667	-123.0027778
5168	DRG	Deering Airport	North America	US	United States	Alaska	Deering	66.069603	-162.766006
5169	DFI	Defiance Memorial Airport	North America	US	United States	Ohio	Defiance	41.33750153	-84.42880249
5170	DRT	Del Rio International Airport	North America	US	United States	Texas	Del Rio	29.37420082	-100.927002
5171	DLF	Laughlin Air Force Base	North America	US	United States	Texas	Del Rio	29.359501	-100.778002
5172	DTA	Delta Municipal Airport	North America	US	United States	Utah	Delta	39.38059998	-112.5080032
5173	DJN	Delta Junction Airport	North America	US	United States	Alaska	Delta Junction	64.05039978	-145.7169952
5174	BIG	Allen Army Airfield	North America	US	United States	Alaska	Delta Junction Ft Greely	63.99449921	-145.7220001
5175	DMN	Deming Municipal Airport	North America	US	United States	New Mexico	Deming	32.26229858	-107.7210007
5176	DNS	Denison Municipal Airport	North America	US	United States	Iowa	Denison	41.9864006	-95.38069916
5177	APA	Centennial Airport	North America	US	United States	Colorado	Denver	39.57009888	-104.848999
5178	DEN	Denver International Airport	North America	US	United States	Colorado	Denver	39.86169815	-104.6729965
5179	BJC	Rocky Mountain Metropolitan Airport	North America	US	United States	Colorado	Denver	39.90879822	-105.1169968
5180	DRI	Beauregard Regional Airport	North America	US	United States	Louisiana	DeRidder	30.831699	-93.339897
5181	DSM	Des Moines International Airport	North America	US	United States	Iowa	Des Moines	41.534	-93.663101
5182	DSI	Destin Executive Airport	North America	US	United States	Florida	Destin	30.40010071	-86.47149658
5183	DET	Coleman A. Young Municipal Airport	North America	US	United States	Michigan	Detroit	42.40919876	-83.00990295
5184	DTW	Detroit Metropolitan Wayne County Airport	North America	US	United States	Michigan	Detroit	42.21239853	-83.35340118
5185	YIP	Willow Run Airport	North America	US	United States	Michigan	Detroit	42.23789978	-83.53040314
5186	DTL	Detroit Lakes Airport - Wething Field	North America	US	United States	Minnesota	Detroit Lakes	46.82519913	-95.88569641
5187	DVL	Devils Lake Regional Airport	North America	US	United States	North Dakota	Devils Lake	48.11420059	-98.90879822
5188	DIK	Dickinson Theodore Roosevelt Regional Airport	North America	US	United States	North Dakota	Dickinson	46.79740143	-102.802002
5189	DLG	Dillingham Airport	North America	US	United States	Alaska	Dillingham	59.04470062	-158.5050049
5190	DLN	Dillon Airport	North America	US	United States	Montana	Dillon	45.25540161	-112.5530014
5191	DLL	Dillon County Airport	North America	US	United States	South Carolina	Dillon	34.44910049	-79.36859894
5192	DDC	Dodge City Regional Airport	North America	US	United States	Kansas	Dodge City	37.76340103	-99.96559906
5193	DHN	Dothan Regional Airport	North America	US	United States	Alabama	Dothan	31.32130051	-85.44960022
5194	DGL	Douglas Municipal Airport	North America	US	United States	Arizona	Douglas	31.34259987	-109.5059967
5195	DGW	Converse County Airport	North America	US	United States	Wyoming	Douglas	42.79719925	-105.3860016
5196	DUG	Bisbee Douglas International Airport	North America	US	United States	Arizona	Douglas Bisbee	31.46899986	-109.6039963
5197	DOV	Dover Air Force Base	North America	US	United States	Delaware	Dover	39.129501	-75.466003
5198	DYL	Doylestown Airport	North America	US	United States	Pennsylvania	Doylestown	40.33300018	-75.12229919
5199	DRU	Drummond Airport	North America	US	United States	Montana	Drummond	46.621599	-113.201751
5200	DRE	Drummond Island Airport	North America	US	United States	Michigan	Drummond Island	46.00930023	-83.74389648
5201	DBN	W H 'Bud' Barron Airport	North America	US	United States	Georgia	Dublin	32.5644	-82.985298
5202	PSK	New River Valley Airport	North America	US	United States	Virginia	Dublin	37.13729858	-80.67849731
5203	DBS	Dubois Municipal Airport	North America	US	United States	Idaho	Dubois	44.162057	-112.220581
5204	DUJ	DuBois Regional Airport	North America	US	United States	Pennsylvania	Dubois	41.17829895	-78.8986969
5205	DBQ	Dubuque Regional Airport	North America	US	United States	Iowa	Dubuque	42.402	-90.709503
5206	DPG	Michael AAF (Dugway Proving Ground) Airport	North America	US	United States	Utah	Dugway Proving Ground	40.19940186	-112.9369965
5207	DLH	Duluth International Airport	North America	US	United States	Minnesota	Duluth	46.842098	-92.193604
5208	DUC	Halliburton Field	North America	US	United States	Oklahoma	Duncan	34.47090149	-97.9598999
5209	DKK	Chautauqua County-Dunkirk Airport	North America	US	United States	New York	Dunkirk	42.49247	-79.273102
5210	MHS	Dunsmuir Muni-Mott Airport	North America	US	United States	California	Dunsmuir	41.263199	-122.272003
5211	AMK	Animas Air Park	North America	US	United States	Colorado	Durango	37.20320129	-107.8690033
5212	DRO	Durango La Plata County Airport	North America	US	United States	Colorado	Durango	37.1515007	-107.7539978
5213	DUA	Durant Regional Airport - Eaker Field	North America	US	United States	Oklahoma	Durant	33.942299	-96.395057
5214	EAA	Eagle Airport	North America	US	United States	Alaska	Eagle	64.77639771	-141.151001
5215	EGE	Eagle County Regional Airport	North America	US	United States	Colorado	Eagle	39.64260101	-106.9179993
5216	ELA	Eagle Lake Airport	North America	US	United States	Texas	Eagle Lake	29.60059929	-96.32189941
5217	EGP	Maverick County Memorial International Airport	North America	US	United States	Texas	Eagle Pass	28.859766	-100.516682
5218	EGV	Eagle River Union Airport	North America	US	United States	Wisconsin	Eagle River	45.93230057	-89.26830292
5219	HTO	East Hampton Airport	North America	US	United States	New York	East Hampton	40.95959854	-72.25180054
5220	ESP	Stroudsburg Pocono Airport	North America	US	United States	Pennsylvania	East Stroudsburg	41.03580093	-75.16059875
5221	ECA	Iosco County Airport	North America	US	United States	Michigan	East Tawas	44.312801	-83.422302
5222	ETN	Eastland Municipal Airport	North America	US	United States	Texas	Eastland	32.41350174	-98.80979919
5223	ESN	Easton Airport / Newnam Field	North America	US	United States	Maryland	Easton	38.804199	-76.069
5224	ESW	Easton State Airport	North America	US	United States	Washington	Easton	47.25419998	-121.185997
5225	MMT	Mc Entire Joint National Guard Base	North America	US	United States	South Carolina	Eastover	33.92079926	-80.80130005
5226	ESD	Orcas Island Airport	North America	US	United States	Washington	Eastsound	48.70819855	-122.9100037
5227	WDN	Waldron Airstrip	North America	US	United States	Washington	Eastsound	48.7118	-123.017998
5228	EAU	Chippewa Valley Regional Airport	North America	US	United States	Wisconsin	Eau Claire	44.86579895	-91.48429871
5229	EDE	Northeastern Regional Airport	North America	US	United States	North Carolina	Edenton	36.02769852	-76.56710052
5230	EDA	Edna Bay Seaplane Base	North America	US	United States	Alaska	Edna Bay	55.949653	-133.661012
5231	EDW	Edwards Air Force Base	North America	US	United States	California	Edwards	34.905399	-117.884003
5232	EEK	Eek Airport	North America	US	United States	Alaska	Eek	60.21367264	-162.0438843
5233	EGX	Egegik Airport	North America	US	United States	Alaska	Egegik	58.184386	-157.374873
5234	KKU	Ekuk Airport	North America	US	United States	Alaska	Ekuk	58.81119919	-158.5590057
5235	KEK	Ekwok Airport	North America	US	United States	Alaska	Ekwok	59.35680008	-157.470993
5236	NJK	El Centro NAF Airport (Vraciu Field)	North America	US	United States	California	El Centro	32.829201	-115.671996
5237	ELD	South Arkansas Regional At Goodwin Field	North America	US	United States	Arkansas	El Dorado	33.22100067	-92.81330109
5238	EDK	Captain Jack Thomas El Dorado Airport	North America	US	United States	Kansas	El Dorado	37.77410126	-96.81759644
5239	EMT	San Gabriel Valley Airport	North America	US	United States	California	El Monte	34.086102	-118.035004
5240	ELP	El Paso International Airport	North America	US	United States	Texas	El Paso	31.80719948	-106.3779984
5241	RQO	El Reno Regional Airport	North America	US	United States	Oklahoma	El Reno	35.47269821	-98.00579834
5242	GCD	Grand Coulee Dam Airport	North America	US	United States	Washington	Electric City	47.92200089	-119.0830002
5243	ELV	Elfin Cove Seaplane Base	North America	US	United States	Alaska	Elfin Cove	58.19520187	-136.3470001
5244	ELI	Elim Airport	North America	US	United States	Alaska	Elim	64.61470032	-162.2720032
5245	MOS	Moses Point Airport	North America	US	United States	Alaska	Elim	64.694116	-162.060699
5246	ECG	Elizabeth City Regional Airport & Coast Guard Air Station	North America	US	United States	North Carolina	Elizabeth City	36.260601	-76.174599
5247	EKX	Addington Field / Elizabethtown Regional Airport	North America	US	United States	Kentucky	Elizabethtown	37.686001	-85.925003
5248	ELK	Elk City Regional Business Airport	North America	US	United States	Oklahoma	Elk City	35.43080139	-99.39430237
5249	EKI	Elkhart Municipal Airport	North America	US	United States	Indiana	Elkhart	41.7193985	-86.00319672
5250	EKN	Elkins-Randolph County Regional Airport	North America	US	United States	West Virginia	Elkins	38.889759	-79.857651
5251	EKO	Elko Regional Airport	North America	US	United States	Nevada	Elko	40.82490158	-115.7919998
5252	ELW	Ellamar Seaplane Base	North America	US	United States	Alaska	Ellamar	60.893818	-146.704038
5253	ELN	Bowers Field	North America	US	United States	Washington	Ellensburg	47.03300095	-120.5309982
5254	ELM	Elmira Corning Regional Airport	North America	US	United States	New York	Elmira/Corning	42.15990067	-76.89160156
5255	LYU	Ely Municipal Airport	North America	US	United States	Minnesota	Ely	47.82450104	-91.83070374
5256	ELY	Ely Airport Yelland Field	North America	US	United States	Nevada	Ely	39.29970169	-114.8420029
5257	BLU	Blue Canyon Nyack Airport	North America	US	United States	California	Emigrant Gap	39.27500153	-120.7099991
5258	EMK	Emmonak Airport	North America	US	United States	Alaska	Emmonak	62.78609848	-164.4909973
5259	EMP	Emporia Municipal Airport	North America	US	United States	Kansas	Emporia	38.33209991	-96.19120026
5260	WDG	Enid Woodring Regional Airport	North America	US	United States	Oklahoma	Enid	36.37919998	-97.79109955
5261	END	Vance Air Force Base	North America	US	United States	Oklahoma	Enid	36.339199	-97.916496
5262	ETS	Enterprise Municipal Airport	North America	US	United States	Alabama	Enterprise	31.29969978	-85.89990234
5263	HBH	Entrance Island Seaplane Base	North America	US	United States	Alaska	Entrance Island	57.412201	-133.43848
5264	EPH	Ephrata Municipal Airport	North America	US	United States	Washington	Ephrata	47.307598	-119.515999
5265	ERI	Erie International Tom Ridge Field	North America	US	United States	Pennsylvania	Erie	42.083127	-80.173867
5266	ERR	Errol Airport	North America	US	United States	New Hampshire	Errol	44.79249954	-71.16419983
5267	ESC	Delta County Airport	North America	US	United States	Michigan	Escanaba	45.72269821	-87.09369659
5268	ESO	Ohkay Owingeh Airport	North America	US	United States	New Mexico	Espanola	36.02999878	-106.0459976
5269	PSQ	Philadelphia Seaplane Base	North America	US	United States	Pennsylvania	Essington	39.85900116	-75.29959869
5270	EST	Estherville Municipal Airport	North America	US	United States	Iowa	Estherville	43.40739822	-94.74639893
5271	EUF	Weedon Field	North America	US	United States	Alabama	Eufaula	31.95129967	-85.12889862
5272	EUG	Mahlon Sweet Field	North America	US	United States	Oregon	Eugene	44.12459946	-123.211998
5273	UCE	Eunice Airport	North America	US	United States	Louisiana	Eunice	30.46629906	-92.42379761
5274	EKA	Murray Field	North America	US	United States	California	Eureka	40.80339813	-124.112999
5275	EUE	Eureka Airport	North America	US	United States	Nevada	Eureka	39.60419846	-116.0049973
5276	EVW	Evanston-Uinta County Airport-Burns Field	North America	US	United States	Wyoming	Evanston	41.27479935	-111.0350037
5277	EVV	Evansville Regional Airport	North America	US	United States	Indiana	Evansville	38.03699875	-87.53240204
5278	EVM	Eveleth Virginia Municipal Airport	North America	US	United States	Minnesota	Eveleth	47.42509842	-92.49849701
5279	PAE	Snohomish County (Paine Field) Airport	North America	US	United States	Washington	Everett	47.9063	-122.281998
5280	EXI	Excursion Inlet Seaplane Base	North America	US	United States	Alaska	Excursion Inlet	58.420502	-135.449005
5281	EIL	Eielson Air Force Base	North America	US	United States	Alaska	Fairbanks	64.66570282	-147.102005
5282	FAI	Fairbanks International Airport	North America	US	United States	Alaska	Fairbanks	64.81510162	-147.8560028
5283	MTX	Metro Field	North America	US	United States	Alaska	Fairbanks	64.80680084	-147.7619934
5284	FBK	Ladd AAF Airfield	North America	US	United States	Alaska	Fairbanks/Ft Wainwright	64.83750153	-147.6139984
5285	FBY	Fairbury Municipal Airport	North America	US	United States	Nebraska	Fairbury	40.18299866	-97.16929626
5286	SUU	Travis Air Force Base	North America	US	United States	California	Fairfield	38.262699	-121.927002
5287	FFL	Fairfield Municipal Airport	North America	US	United States	Iowa	Fairfield	41.053024	-91.980114
5288	FRM	Fairmont Municipal Airport	North America	US	United States	Minnesota	Fairmont	43.64390183	-94.41560364
5289	FLX	Fallon Municipal Airport	North America	US	United States	Nevada	Fallon	39.49909973	-118.7490005
5290	NFL	Fallon Naval Air Station	North America	US	United States	Nevada	Fallon	39.41659927	-118.7009964
5291	FMH	Cape Cod Coast Guard Air Station	North America	US	United States	Massachusetts	Falmouth	41.657899	-70.52163
5292	FAK	False Island Seaplane Base	North America	US	United States	Alaska	False Island	57.53219986	-135.2129974
5293	KFP	False Pass Airport	North America	US	United States	Alaska	False Pass	54.84740067	-163.4100037
5294	FWL	Farewell Airport	North America	US	United States	Alaska	Farewell	62.509327	-153.892279
5295	FAR	Hector International Airport	North America	US	United States	North Dakota	Fargo	46.92070007	-96.81580353
5296	FBL	Faribault Municipal Airport-Liz Wall Strohfus Field	North America	US	United States	Minnesota	Faribault	44.32844	-93.312534
5297	FRG	Republic Airport	North America	US	United States	New York	Farmingdale	40.72880173	-73.41339874
5298	FAM	Farmington Regional Airport	North America	US	United States	Missouri	Farmington	37.76110077	-90.4285965
5299	FMN	Four Corners Regional Airport	North America	US	United States	New Mexico	Farmington	36.741199	-108.230003
5300	FYV	Drake Field	North America	US	United States	Arkansas	Fayetteville	36.00510025	-94.17009735
5301	FAY	Fayetteville Regional Airport - Grannis Field	North America	US	United States	North Carolina	Fayetteville	34.991199	-78.880302
5302	POB	Pope Field	North America	US	United States	North Carolina	Fayetteville	35.17089844	-79.01450348
5303	FYM	Fayetteville Municipal Airport	North America	US	United States	Tennessee	Fayetteville	35.05970001	-86.56400299
5304	XNA	Northwest Arkansas Regional Airport	North America	US	United States	Arkansas	Fayetteville/Springdale/Rogers	36.281898	-94.306801
5305	FFM	Fergus Falls Municipal Airport - Einar Mickelson Field	North America	US	United States	Minnesota	Fergus Falls	46.28440094	-96.15670013
5306	FIL	Fillmore Municipal Airport	North America	US	United States	Utah	Fillmore	38.95830154	-112.362999
5307	FDY	Findlay Airport	North America	US	United States	Ohio	Findlay	41.01350021	-83.66870117
5308	FID	Elizabeth Field	North America	US	United States	New York	Fishers Island	41.25130081	-72.03160095
5309	FLG	Flagstaff Pulliam International Airport	North America	US	United States	Arizona	Flagstaff	35.1385	-111.670998
5310	FLT	Flat Airport	North America	US	United States	Alaska	Flat	62.45259857	-157.9889984
5311	FNT	Bishop International Airport	North America	US	United States	Michigan	Flint	42.9654007	-83.74359894
5312	FLP	Marion County Regional Airport	North America	US	United States	Arkansas	Flippin	36.29090118	-92.59030151
5313	FMU	Florence Municipal Airport	North America	US	United States	Oregon	Florence	43.98279953	-124.1110001
5314	FLO	Florence Regional Airport	North America	US	United States	South Carolina	Florence	34.1853981	-79.72389984
5315	NHX	Naval Outlying Field Barin	North America	US	United States	Alabama	Foley	30.38909912	-87.63529968
5316	FLD	Fond du Lac County Airport	North America	US	United States	Wisconsin	Fond du Lac	43.77119827	-88.48840332
5317	FXY	Forest City Municipal Airport	North America	US	United States	Iowa	Forest City	43.23469925	-93.62409973
5318	FCY	Forrest City Municipal Airport	North America	US	United States	Arkansas	Forrest City	34.94200134	-90.77500153
5319	APH	A P Hill AAF (Fort A P Hill) Airport	North America	US	United States	Virginia	Fort A. P. Hill	38.068902	-77.318298
5320	DAA	Davison Army Air Field	North America	US	United States	Virginia	Fort Belvoir	38.71500015	-77.18099976
5321	LSF	Lawson Army Air Field (Fort Benning)	North America	US	United States	Georgia	Fort Benning(Columbus)	32.33729935	-84.99130249
5322	BIF	Biggs Army Air Field (Fort Bliss)	North America	US	United States	Texas	Fort Bliss/El Paso	31.84950066	-106.3799973
5323	FOB	Fort Bragg Airport	North America	US	United States	California	Fort Bragg	39.47430038	-123.7959976
5324	FBG	Simmons Army Air Field	North America	US	United States	North Carolina	Fort Bragg	35.13180161	-78.93669891
5325	FBR	Fort Bridger Airport	North America	US	United States	Wyoming	Fort Bridger	41.39189911	-110.4069977
5326	HOP	Campbell AAF (Fort Campbell) Air Field	North America	US	United States	Kentucky	Fort Campbell/Hopkinsville	36.66859818	-87.49620056
5327	FCS	Butts AAF (Fort Carson) Air Field	North America	US	United States	Colorado	Fort Carson	38.67839813	-104.7570038
5328	FOD	Fort Dodge Regional Airport	North America	US	United States	Iowa	Fort Dodge	42.55149841	-94.19259644
5329	FAF	Felker Army Air Field	North America	US	United States	Virginia	Fort Eustis	37.13249969	-76.6088028
5330	HLR	Hood Army Air Field	North America	US	United States	Texas	Fort Hood	31.1387	-97.7145
5331	FHU	Sierra Vista Municipal Airport / Libby Army Air Field	North America	US	United States	Arizona	Fort Huachuca / Sierra Vista	31.587383	-110.348225
5332	MUI	Muir Army Air Field (Fort Indiantown Gap) Airport	North America	US	United States	Pennsylvania	Fort Indiantown Gap(Annville)	40.434799	-76.569397
5333	BYS	Bicycle Lake Army Air Field	North America	US	United States	California	Fort Irwin/Barstow	35.2804985	-116.6299973
5334	FTK	Godman Army Air Field	North America	US	United States	Kentucky	Fort Knox	37.90710068	-85.9720993
5335	FXE	Fort Lauderdale Executive Airport	North America	US	United States	Florida	Fort Lauderdale	26.19729996	-80.17070007
5336	FLL	Fort Lauderdale Hollywood International Airport	North America	US	United States	Florida	Fort Lauderdale	26.072599	-80.152702
5337	FLV	Sherman Army Air Field	North America	US	United States	Kansas	Fort Leavenworth	39.36830139	-94.91470337
5338	TBN	Waynesville-St. Robert Regional Forney field	North America	US	United States	Missouri	Fort Leonard Wood	37.74160004	-92.14070129
5339	GRF	Gray Army Air Field	North America	US	United States	Washington	Fort Lewis/Tacoma	47.07920074	-122.5810013
5340	FMS	Fort Madison Municipal Airport	North America	US	United States	Iowa	Fort Madison	40.659113	-91.327763
5341	FME	Tipton Airport	North America	US	United States	Maryland	Fort Meade(Odenton)	39.08539963	-76.75939941
5342	FMY	Page Field	North America	US	United States	Florida	Fort Myers	26.58659935	-81.86329651
5343	RSW	Southwest Florida International Airport	North America	US	United States	Florida	Fort Myers	26.53619957	-81.75520325
5344	FPR	St Lucie County International Airport	North America	US	United States	Florida	Fort Pierce	27.49510002	-80.36830139
5345	POE	Polk Army Air Field	North America	US	United States	Louisiana	Fort Polk	31.0447998	-93.1917038
5346	FRI	Marshall Army Air Field	North America	US	United States	Kansas	Fort Riley (Junction City)	39.053021	-96.764202
5347	OZR	Cairns AAF (Fort Rucker) Air Field	North America	US	United States	Alabama	Fort Rucker/Ozark	31.27569962	-85.71340179
5348	FSK	Fort Scott Municipal Airport	North America	US	United States	Kansas	Fort Scott	37.79840088	-94.76940155
5349	FSI	Henry Post Army Air Field (Fort Sill)	North America	US	United States	Oklahoma	Fort Sill	34.64979935	-98.40219879
5350	FSM	Fort Smith Regional Airport	North America	US	United States	Arkansas	Fort Smith	35.336601	-94.367401
5351	FST	Fort Stockton Pecos County Airport	North America	US	United States	Texas	Fort Stockton	30.91570091	-102.9160004
5352	FSU	Fort Sumner Municipal Airport	North America	US	United States	New Mexico	Fort Sumner	34.48339844	-104.2170029
5353	FWA	Fort Wayne International Airport	North America	US	United States	Indiana	Fort Wayne	40.9785	-85.195099
5354	SMD	Smith Field	North America	US	United States	Indiana	Fort Wayne	41.14339828	-85.15280151
5355	AFW	Fort Worth Alliance Airport	North America	US	United States	Texas	Fort Worth	32.99044	-97.31947
5356	FTW	Fort Worth Meacham International Airport	North America	US	United States	Texas	Fort Worth	32.819801	-97.362396
5357	FWH	NAS Fort Worth JRB / Carswell Field	North America	US	United States	Texas	Fort Worth	32.769199	-97.441498
5358	FYU	Fort Yukon Airport	North America	US	United States	Alaska	Fort Yukon	66.57150269	-145.25
5359	FFT	Capital City Airport	North America	US	United States	Kentucky	Frankfort	38.18249893	-84.90470123
5360	FKL	Venango Regional Airport	North America	US	United States	Pennsylvania	Franklin	41.37789917	-79.86039734
5361	FKN	Franklin Regional Airport	North America	US	United States	Virginia	Franklin	36.698101	-76.903801
5362	FDK	Frederick Municipal Airport	North America	US	United States	Maryland	Frederick	39.41759872	-77.3742981
5363	FDR	Frederick Regional Airport	North America	US	United States	Oklahoma	Frederick	34.35200119	-98.98390198
5364	FEP	Albertus Airport	North America	US	United States	Illinois	Freeport	42.24620056	-89.58200073
5365	FET	Fremont Municipal Airport	North America	US	United States	Nebraska	Fremont	41.44910049	-96.52020264
5366	FRH	French Lick Municipal Airport	North America	US	United States	Indiana	French Lick	38.50619888	-86.63690186
5367	WFK	Northern Aroostook Regional Airport	North America	US	United States	Maine	Frenchville	47.28549957	-68.31279755
5368	FCH	Fresno Chandler Executive Airport	North America	US	United States	California	Fresno	36.732399	-119.82
5369	FAT	Fresno Yosemite International Airport	North America	US	United States	California	Fresno	36.776199	-119.718002
5370	FRD	Friday Harbor Airport	North America	US	United States	Washington	Friday Harbor	48.52199936	-123.0240021
5371	FBS	Friday Harbor Seaplane Base	North America	US	United States	Washington	Friday Harbor	48.53730011	-123.0100021
5372	SSW	Stuart Island Airpark	North America	US	United States	Washington	Friday Harbor	48.673379	-123.175439
5373	FRR	Front Royal Warren County Airport	North America	US	United States	Virginia	Front Royal	38.91749954	-78.25350189
5374	FRY	Eastern Slopes Regional Airport	North America	US	United States	Maine	Fryeburg	43.99110031	-70.94789886
5375	FUL	Fullerton Municipal Airport	North America	US	United States	California	Fullerton	33.87200165	-117.9800034
5376	FNR	Funter Bay Seaplane Base	North America	US	United States	Alaska	Funter Bay	58.25439835	-134.897995
5377	GAB	Gabbs Airport	North America	US	United States	Nevada	Gabbs	38.923173	-117.9572
5378	GAD	Northeast Alabama Regional Airport	North America	US	United States	Alabama	Gadsden	33.972599	-86.088996
5379	GAG	Gage Airport	North America	US	United States	Oklahoma	Gage	36.29550171	-99.77639771
5380	GNV	Gainesville Regional Airport	North America	US	United States	Florida	Gainesville	29.69009972	-82.27179718
5381	GVL	Lee Gilmer Memorial Airport	North America	US	United States	Georgia	Gainesville	34.27259827	-83.8302002
5382	GLE	Gainesville Municipal Airport	North America	US	United States	Texas	Gainesville	33.65140152	-97.1969986
5383	GAI	Montgomery County Airpark	North America	US	United States	Maryland	Gaithersburg	39.168301	-77.166
5384	GBH	Galbraith Lake Airport	North America	US	United States	Alaska	Galbraith Lake	68.47969818	-149.4900055
5385	GAL	Edward G. Pitka Sr Airport	North America	US	United States	Alaska	Galena	64.73619843	-156.9369965
5386	GBG	Galesburg Municipal Airport	North America	US	United States	Illinois	Galesburg	40.93799973	-90.43109894
5387	GQQ	Galion Municipal Airport	North America	US	United States	Ohio	Galion	40.7533989	-82.72380066
5388	GUP	Gallup Municipal Airport	North America	US	United States	New Mexico	Gallup	35.51110077	-108.7890015
5389	GLS	Scholes International At Galveston Airport	North America	US	United States	Texas	Galveston	29.26530075	-94.86039734
5390	GAM	Gambell Airport	North America	US	United States	Alaska	Gambell	63.76679993	-171.7330017
5391	GCK	Garden City Regional Airport	North America	US	United States	Kansas	Garden City	37.92750168	-100.723999
5392	GDM	Gardner Municipal Airport	North America	US	United States	Massachusetts	Gardner	42.54999924	-72.01609802
5393	GYY	Gary Chicago International Airport	North America	US	United States	Indiana	Gary	41.61629868	-87.41280365
5394	GLR	Gaylord Regional Airport	North America	US	United States	Michigan	Gaylord	45.01350021	-84.70359802
5395	GED	Delaware Coastal Airport	North America	US	United States	Delaware	Georgetown	38.689201	-75.358902
5396	GGE	Georgetown County Airport	North America	US	United States	South Carolina	Georgetown	33.31169891	-79.31960297
5397	GTY	Gettysburg Regional Airport	North America	US	United States	Pennsylvania	Gettysburg	39.841222	-77.274699
5398	GCC	Northeast Wyoming Regional Airport	North America	US	United States	Wyoming	Gillette	44.3489	-105.539001
5399	AQY	Girdwood Airport	North America	US	United States	Alaska	Girdwood	60.968774	-149.119792
5400	KGZ	Glacier Creek Airport	North America	US	United States	Alaska	Glacier Creek	61.45510101	-142.3809967
5401	GDW	Gladwin Zettel Memorial Airport	North America	US	United States	Michigan	Gladwin	43.97060013	-84.47499847
5402	GLW	Glasgow Municipal Airport	North America	US	United States	Kentucky	Glasgow	37.03179932	-85.9536972
5403	GGW	Wokal Field/Glasgow-Valley County Airport	North America	US	United States	Montana	Glasgow	48.212502	-106.614998
5404	LUF	Luke Air Force Base	North America	US	United States	Arizona	Glendale	33.535	-112.383003
5405	GWV	Glendale Fokker Field	North America	US	United States	West Virginia	Glendale	39.94869995	-80.7594986
5406	GDV	Dawson Community Airport	North America	US	United States	Montana	Glendive	47.13869858	-104.8069992
5407	GFL	Floyd Bennett Memorial Airport	North America	US	United States	New York	Glens Falls	43.34120178	-73.61029816
5408	GWS	Glenwood Springs Municipal Airport	North America	US	United States	Colorado	Glenwood Springs	39.50830078	-107.310997
5409	GLB	San Carlos Apache Airport	North America	US	United States	Arizona	Globe	33.3531	-110.667
5410	GOL	Gold Beach Municipal Airport	North America	US	United States	Oregon	Gold Beach	42.41339874	-124.4240036
5411	GDH	Golden Horn Lodge Seaplane Base	North America	US	United States	Alaska	Golden Horn Lodge	59.74700165	-158.875
5412	GSB	Seymour Johnson Air Force Base	North America	US	United States	North Carolina	Goldsboro	35.339401	-77.960602
5413	GLV	Golovin Airport	North America	US	United States	Alaska	Golovin	64.55049896	-163.0070038
5414	GNG	Gooding Municipal Airport	North America	US	United States	Idaho	Gooding	42.91719818	-114.7649994
5415	GLD	Renner Field-Goodland Municipal Airport	North America	US	United States	Kansas	Goodland	39.37060165	-101.6989975
5416	GNU	Goodnews Airport	North America	US	United States	Alaska	Goodnews	59.11740112	-161.5769959
5417	GYR	Phoenix Goodyear Airport	North America	US	United States	Arizona	Goodyear	33.42250061	-112.3759995
5418	GRN	Gordon Municipal Airport	North America	US	United States	Nebraska	Gordon	42.80599976	-102.1750031
5419	GVE	Gordonsville Municipal Airport	North America	US	United States	Virginia	Gordonsville	38.15599823	-78.165802
5420	GSH	Goshen Municipal Airport	North America	US	United States	Indiana	Goshen	41.52640152	-85.79290009
5421	VLE	Valle Airport	North America	US	United States	Arizona	Grand Canyon	35.65060043	-112.1480026
5422	GCN	Grand Canyon National Park Airport	North America	US	United States	Arizona	Grand Canyon - Tusayan	35.9524	-112.147003
5423	RDR	Grand Forks Air Force Base	North America	US	United States	North Dakota	Grand Forks	47.96110153	-97.40119934
5424	GFK	Grand Forks International Airport	North America	US	United States	North Dakota	Grand Forks	47.949299	-97.176102
5425	GRI	Central Nebraska Regional Airport	North America	US	United States	Nebraska	Grand Island	40.96749878	-98.30960083
5426	GJT	Grand Junction Regional Airport	North America	US	United States	Colorado	Grand Junction	39.126663	-108.529387
5427	GRM	Grand Marais Cook County Airport	North America	US	United States	Minnesota	Grand Marais	47.8382988	-90.38289642
5428	GRR	Gerald R. Ford International Airport	North America	US	United States	Michigan	Grand Rapids	42.88079834	-85.52279663
5429	GPZ	Grand Rapids Itasca Co-Gordon Newstrom field	North America	US	United States	Minnesota	Grand Rapids	47.21110153	-93.50980377
5430	IDH	Idaho County Airport	North America	US	United States	Idaho	Grangeville	45.9426	-116.123001
5431	GMT	Granite Mountain Air Station	North America	US	United States	Alaska	Granite Mountain	65.40209961	-161.2810059
5432	GNT	Grants-Milan Municipal Airport	North America	US	United States	New Mexico	Grants	35.16730118	-107.9020004
5433	GTP	Grants Pass Airport	North America	US	United States	Oregon	Grants Pass	42.510101	-123.388
5434	GTG	Grantsburg Municipal Airport	North America	US	United States	Wisconsin	Grantsburg	45.79809952	-92.66439819
5435	KGX	Grayling Airport	North America	US	United States	Alaska	Grayling	62.895187	-160.066289
5436	GBR	Walter J. Koladza Airport	North America	US	United States	Massachusetts	Great Barrington	42.18420029	-73.40319824
5437	GBD	Great Bend Municipal Airport	North America	US	United States	Kansas	Great Bend	38.34429932	-98.85919952
5438	GTF	Great Falls International Airport	North America	US	United States	Montana	Great Falls	47.48199844	-111.3710022
5439	GXY	Greeley???Weld County Airport	North America	US	United States	Colorado	Greeley	40.43740082	-104.6330032
5440	GRB	Austin Straubel International Airport	North America	US	United States	Wisconsin	Green Bay	44.483459	-88.130805
5441	RVR	Green River Municipal Airport	North America	US	United States	Utah	Green River	38.96139908	-110.2269974
5442	GCY	Greeneville Municipal Airport	North America	US	United States	Tennessee	Greeneville	36.195648	-82.811482
5443	GFD	Pope Field	North America	US	United States	Indiana	Greenfield	39.79029846	-85.73609924
5444	GSO	Piedmont Triad International Airport	North America	US	United States	North Carolina	Greensboro	36.097801	-79.937302
5445	GRE	Greenville Airport	North America	US	United States	Illinois	Greenville	38.836844	-89.376525
5446	GLH	Mid Delta Regional Airport	North America	US	United States	Mississippi	Greenville	33.48289871	-90.98560333
5447	PGV	Pitt Greenville Airport	North America	US	United States	North Carolina	Greenville	35.6352005	-77.38529968
5448	GDC	Donaldson Field Airport	North America	US	United States	South Carolina	Greenville	34.758301	-82.376404
5449	GMU	Greenville Downtown Airport	North America	US	United States	South Carolina	Greenville	34.84790039	-82.34999847
5450	GVT	Majors Airport	North America	US	United States	Texas	Greenville	33.06779861	-96.06529999
5451	GWO	Greenwood???Leflore Airport	North America	US	United States	Mississippi	Greenwood	33.49430084	-90.08470154
5452	GRD	Greenwood County Airport	North America	US	United States	South Carolina	Greenwood	34.24869919	-82.15910339
5453	GSP	Greenville Spartanburg International Airport	North America	US	United States	South Carolina	Greer	34.895699	-82.218903
5454	GEY	South Big Horn County Airport	North America	US	United States	Wyoming	Greybull	44.51679993	-108.0830002
5455	GON	Groton New London Airport	North America	US	United States	Connecticut	Groton (New London)	41.33010101	-72.04509735
5456	GUF	Jack Edwards National Airport	North America	US	United States	Alabama	Gulf Shores	30.290501	-87.671799
5457	GPT	Gulfport Biloxi International Airport	North America	US	United States	Mississippi	Gulfport	30.407301	-89.070099
5458	GKN	Gulkana Airport	North America	US	United States	Alaska	Gulkana	62.155859	-145.454662
5459	GUC	Gunnison Crested Butte Regional Airport	North America	US	United States	Colorado	Gunnison	38.53390121	-106.9329987
5460	BQV	Bartlett Cove Seaplane Base	North America	US	United States	Alaska	Gustavus	58.4552002	-135.8849945
5461	GST	Gustavus Airport	North America	US	United States	Alaska	Gustavus	58.4253006	-135.7070007
5462	GOK	Guthrie-Edmond Regional Airport	North America	US	United States	Oklahoma	Guthrie	35.84980011	-97.41560364
5463	GUY	Guymon Municipal Airport	North America	US	United States	Oklahoma	Guymon	36.68510056	-101.5080032
5464	MQT	Sawyer International Airport	North America	US	United States	Michigan	Gwinn	46.3536	-87.395401
5465	HGR	Hagerstown Regional Richard A Henson Field	North America	US	United States	Maryland	Hagerstown	39.707901	-77.72949982
5466	SUN	Friedman Memorial Airport	North America	US	United States	Idaho	Hailey	43.50439835	-114.2959976
5467	HNS	Haines Airport	North America	US	United States	Alaska	Haines	59.24380112	-135.5240021
5468	HAF	Half Moon Bay Airport	North America	US	United States	California	Half Moon Bay	37.51340103	-122.5009995
5469	HAB	Marion County Rankin Fite Airport	North America	US	United States	Alabama	Hamilton	34.11759949	-87.99819946
5470	HAO	Butler Co Regional Airport - Hogan Field	North America	US	United States	Ohio	Hamilton	39.36380005	-84.52200317
5471	HPT	Hampton Municipal Airport	North America	US	United States	Iowa	Hampton	42.72370148	-93.2263031
5472	LFI	Langley Air Force Base	North America	US	United States	Virginia	Hampton	37.082901	-76.360497
5473	CMX	Houghton County Memorial Airport	North America	US	United States	Michigan	Hancock	47.16839981	-88.4890976
5474	HVE	Hanksville Airport	North America	US	United States	Utah	Hanksville	38.41799927	-110.7040024
5475	HRL	Valley International Airport	North America	US	United States	Texas	Harlingen	26.22850037	-97.65440369
5476	HSB	Harrisburg-Raleigh Airport	North America	US	United States	Illinois	Harrisburg	37.81129837	-88.5503006
5477	HAR	Capital City Airport	North America	US	United States	Pennsylvania	Harrisburg	40.21709824	-76.85150146
5478	MDT	Harrisburg International Airport	North America	US	United States	Pennsylvania	Harrisburg	40.19350052	-76.76339722
5479	HRO	Boone County Airport	North America	US	United States	Arkansas	Harrison	36.26150131	-93.15470123
5480	BDL	Bradley International Airport	North America	US	United States	Connecticut	Hartford	41.93851	-72.688066
5481	HFD	Hartford Brainard Airport	North America	US	United States	Connecticut	Hartford	41.73669815	-72.6493988
5482	HVS	Hartsville Regional Airport	North America	US	United States	South Carolina	Hartsville	34.40309906	-80.11920166
5483	HSI	Hastings Municipal Airport	North America	US	United States	Nebraska	Hastings	40.6053009	-98.42790222
5484	HNC	Billy Mitchell Airport	North America	US	United States	North Carolina	Hatteras	35.23279953	-75.61779785
5485	HBG	Hattiesburg Bobby L Chain Municipal Airport	North America	US	United States	Mississippi	Hattiesburg	31.26479912	-89.25279999
5486	HVR	Havre City County Airport	North America	US	United States	Montana	Havre	48.542999	-109.762001
5487	HHR	Jack Northrop Field Hawthorne Municipal Airport	North America	US	United States	California	Hawthorne	33.922798	-118.334999
5488	HTH	Hawthorne Industrial Airport	North America	US	United States	Nevada	Hawthorne	38.544399	-118.634002
5489	HAY	Haycock Airport	North America	US	United States	Alaska	Haycock	65.2009964	-161.1569977
5490	HDN	Yampa Valley Airport	North America	US	United States	Colorado	Hayden	40.48120117	-107.2180023
5491	HYS	Hays Regional Airport	North America	US	United States	Kansas	Hays	38.84220123	-99.27320099
5492	HWD	Hayward Executive Airport	North America	US	United States	California	Hayward	37.65919876	-122.1220016
5493	HYR	Sawyer County Airport	North America	US	United States	Wisconsin	Hayward	46.02519989	-91.44429779
5494	HZL	Hazleton Municipal Airport	North America	US	United States	Pennsylvania	Hazleton	40.98680115	-75.99490356
5495	HKB	Healy Lake Airport	North America	US	United States	Alaska	Healy Lake	63.9958	-144.6926
5496	HLN	Helena Regional Airport	North America	US	United States	Montana	Helena	46.6068	-111.983002
5497	HMT	Hemet Ryan Airport	North America	US	United States	California	Hemet	33.73400116	-117.0230026
5498	HED	Herendeen Bay Airport	North America	US	United States	Alaska	Herendeen Bay	55.80139923	-160.8990021
5499	AHC	Amedee Army Air Field	North America	US	United States	California	Herlong	40.26620102	-120.1529999
5500	HES	Hermiston Municipal Airport	North America	US	United States	Oregon	Hermiston	45.828223	-119.259024
5501	HIB	Range Regional Airport	North America	US	United States	Minnesota	Hibbing	47.3866	-92.838997
5502	HKY	Hickory Regional Airport	North America	US	United States	North Carolina	Hickory	35.74110031	-81.38950348
5503	HLC	Hill City Municipal Airport	North America	US	United States	Kansas	Hill City	39.37879944	-99.83149719
5504	HHH	Hilton Head Airport	North America	US	United States	South Carolina	Hilton Head Island	32.22439957	-80.69750214
5505	LIY	MidCoast Regional Airport at Wright Army Airfield	North America	US	United States	Georgia	Hinesville	31.891237	-81.561003
5506	HBR	Hobart Regional Airport	North America	US	United States	Oklahoma	Hobart	34.991317	-99.051313
5507	HBB	Industrial Airpark	North America	US	United States	New Mexico	Hobbs	32.7668	-103.209
5508	HOB	Lea County Regional Airport	North America	US	United States	New Mexico	Hobbs	32.6875	-103.2170029
5509	HFF	Mackall Army Air Field	North America	US	United States	North Carolina	Hoffman	35.036087	-79.498615
5510	HGZ	Hog River Airport	North America	US	United States	Alaska	Hogatza	66.2161026	-155.6690063
5511	HBK	Holbrook Municipal Airport	North America	US	United States	Arizona	Holbrook	34.94070053	-110.1380005
5512	HDE	Brewster Field	North America	US	United States	Nebraska	Holdrege	40.452099	-99.336502
5513	HLM	Park Township Airport	North America	US	United States	Michigan	Holland	42.795898	-86.162003
5514	HYL	Hollis Clark Bay Seaplane Base	North America	US	United States	Alaska	Hollis	55.48160172	-132.6459961
5515	HLI	Hollister Municipal Airport	North America	US	United States	California	Hollister	36.8932991	-121.4100037
5516	HWO	North Perry Airport	North America	US	United States	Florida	Hollywood	26.0012	-80.2407
5517	HCR	Holy Cross Airport	North America	US	United States	Alaska	Holy Cross	62.18830109	-159.7749939
5518	HOM	Homer Airport	North America	US	United States	Alaska	Homer	59.64559937	-151.477005
5519	HST	Homestead ARB Airport	North America	US	United States	Florida	Homestead	25.48859978	-80.38359833
5520	HNH	Hoonah Airport	North America	US	United States	Alaska	Hoonah	58.0961	-135.410111
5521	HPB	Hooper Bay Airport	North America	US	United States	Alaska	Hooper Bay	61.52389908	-166.1470032
5522	HQM	Bowerman Airport	North America	US	United States	Washington	Hoquiam	46.97119904	-123.9369965
5523	HOT	Memorial Field Airport	North America	US	United States	Arkansas	Hot Springs	34.4788	-93.096262
5524	HSP	Ingalls Field	North America	US	United States	Virginia	Hot Springs	37.95140076	-79.83390045
5525	HTL	Roscommon County - Blodgett Memorial Airport	North America	US	United States	Michigan	Houghton Lake	44.359798	-84.671095
5526	HUL	Houlton International Airport	North America	US	United States	Maine	Houlton	46.12310028	-67.792099
5527	HUM	Houma Terrebonne Airport	North America	US	United States	Louisiana	Houma	29.56649971	-90.66040039
5528	CXO	Conroe-North Houston Regional Airport	North America	US	United States	Texas	Houston	30.351801	-95.414497
5529	DWH	David Wayne Hooks Memorial Airport	North America	US	United States	Texas	Houston	30.0618	-95.55280304
5530	EFD	Ellington Airport	North America	US	United States	Texas	Houston	29.6072998	-95.15879822
5531	IAH	George Bush Intercontinental Houston Airport	North America	US	United States	Texas	Houston	29.9843998	-95.34140015
5532	SGR	Sugar Land Regional Airport	North America	US	United States	Texas	Houston	29.62229919	-95.65650177
5533	IWS	West Houston Airport	North America	US	United States	Texas	Houston	29.818199	-95.6726
5534	HOU	William P Hobby Airport	North America	US	United States	Texas	Houston	29.645399	-95.2789
5535	HCC	Columbia County Airport	North America	US	United States	New York	Hudson	42.29130173	-73.71029663
5536	HUS	Hughes Airport	North America	US	United States	Alaska	Hughes	66.04109955	-154.2630005
5537	HUJ	Stan Stamper Municipal Airport	North America	US	United States	Oklahoma	Hugo	34.03480148	-95.54190063
5538	HUD	Humboldt Municipal Airport	North America	US	United States	Iowa	Humboldt	42.73609924	-94.24520111
5539	HNB	Huntingburg Airport	North America	US	United States	Indiana	Huntingburg	38.24900055	-86.9536972
5540	HTS	Tri-State/Milton J. Ferguson Field	North America	US	United States	West Virginia	Huntington	38.366699	-82.557999
5541	HSV	Huntsville International Carl T Jones Field	North America	US	United States	Alabama	Huntsville	34.637199	-86.775101
5542	HTV	Huntsville Regional Airport	North America	US	United States	Texas	Huntsville	30.74690056	-95.58719635
5543	HON	Huron Regional Airport	North America	US	United States	South Dakota	Huron	44.3852005	-98.22850037
5544	HSL	Huslia Airport	North America	US	United States	Alaska	Huslia	65.69789886	-156.3509979
5545	HUT	Hutchinson Municipal Airport	North America	US	United States	Kansas	Hutchinson	38.06549835	-97.86060333
5546	HYA	Barnstable Municipal Boardman Polando Field	North America	US	United States	Massachusetts	Hyannis	41.66930008	-70.28040314
5547	HYG	Hydaburg Seaplane Base	North America	US	United States	Alaska	Hydaburg	55.20629883	-132.8280029
5548	WHD	Hyder Seaplane Base	North America	US	United States	Alaska	Hyder	55.903324	-130.009975
5549	ICY	Icy Bay Airport	North America	US	United States	Alaska	Icy Bay	59.966269	-141.660118
5550	IDA	Idaho Falls Regional Airport	North America	US	United States	Idaho	Idaho Falls	43.514599	-112.070999
5551	IGG	Igiugig Airport	North America	US	United States	Alaska	Igiugig	59.32400131	-155.9019928
5552	ILI	Iliamna Airport	North America	US	United States	Alaska	Iliamna	59.75439835	-154.9109955
5553	IMM	Immokalee Regional Airport	North America	US	United States	Florida	Immokalee	26.43320084	-81.40100098
5554	IPL	Imperial County Airport	North America	US	United States	California	Imperial	32.83420181	-115.5790024
5555	IML	Imperial Municipal Airport	North America	US	United States	Nebraska	Imperial	40.50930023	-101.6210022
5556	NRS	Naval Outlying Field Imperial Beach (Ream Field)	North America	US	United States	California	Imperial Beach	32.5667	-117.116997
5557	IDP	Independence Municipal Airport	North America	US	United States	Kansas	Independence	37.15840149	-95.77839661
5558	INS	Creech Air Force Base	North America	US	United States	Nevada	Indian Springs	36.58720016	-115.6729965
5559	IDI	Indiana County/Jimmy Stewart Fld/ Airport	North America	US	United States	Pennsylvania	Indiana	40.63219833	-79.10549927
5560	IND	Indianapolis International Airport	North America	US	United States	Indiana	Indianapolis	39.7173	-86.294403
5561	INL	Falls International Airport	North America	US	United States	Minnesota	International Falls	48.56620026	-93.40309906
5562	IYK	Inyokern Airport	North America	US	United States	California	Inyokern	35.65879822	-117.8300018
5563	IOW	Iowa City Municipal Airport	North America	US	United States	Iowa	Iowa City	41.6391983	-91.54650116
5564	IFA	Iowa Falls Municipal Airport	North America	US	United States	Iowa	Iowa Falls	42.47079849	-93.26999664
5565	IRB	Iraan Municipal Airport	North America	US	United States	Texas	Iraan	30.90570068	-101.8919983
5566	IMT	Ford Airport	North America	US	United States	Michigan	Iron Mountain / Kingsford	45.81840134	-88.11450195
5567	IWD	Gogebic Iron County Airport	North America	US	United States	Michigan	Ironwood	46.5275	-90.131401
5568	ISP	Long Island Mac Arthur Airport	North America	US	United States	New York	Islip	40.79520035	-73.10019684
5569	ITH	Ithaca Tompkins Regional Airport	North America	US	United States	New York	Ithaca	42.49100113	-76.45839691
5570	KIB	Ivanof Bay Seaplane Base	North America	US	United States	Alaska	Ivanof Bay	55.89749908	-159.4889984
5571	KPT	Jackpot Airport/Hayden Field	North America	US	United States	Nevada	Jackpot	41.97600174	-114.6579971
5572	JXN	Jackson County Reynolds Field	North America	US	United States	Michigan	Jackson	42.25979996	-84.45939636
5573	HKS	Hawkins Field	North America	US	United States	Mississippi	Jackson	32.33449936	-90.22219849
5574	JAN	Jackson-Medgar Wiley Evers International Airport	North America	US	United States	Mississippi	Jackson	32.311199	-90.075897
5575	MKL	McKellar-Sipes Regional Airport	North America	US	United States	Tennessee	Jackson	35.599899	-88.915604
5576	JAC	Jackson Hole Airport	North America	US	United States	Wyoming	Jackson	43.6072998	-110.737999
5577	LRF	Little Rock Air Force Base	North America	US	United States	Arkansas	Jacksonville	34.91690063	-92.14969635
5578	VQQ	Cecil Airport	North America	US	United States	Florida	Jacksonville	30.21870041	-81.87670136
5579	CRG	Jacksonville Executive at Craig Airport	North America	US	United States	Florida	Jacksonville	30.3362999	-81.51439667
5580	JAX	Jacksonville International Airport	North America	US	United States	Florida	Jacksonville	30.49410057	-81.68789673
5581	NIP	Jacksonville Naval Air Station (Towers Field)	North America	US	United States	Florida	Jacksonville	30.2358	-81.680603
5582	NEN	Whitehouse Naval Outlying Field	North America	US	United States	Florida	Jacksonville	30.35390091	-81.87190247
5583	JKV	Cherokee County Airport	North America	US	United States	Texas	Jacksonville	31.86930084	-95.2173996
5584	AFN	Jaffrey Airport Silver Ranch Airport	North America	US	United States	New Hampshire	Jaffrey	42.80509949	-72.00299835
5585	JHW	Chautauqua County-Jamestown Airport	North America	US	United States	New York	Jamestown	42.15425	-79.254008
5586	JMS	Jamestown Regional Airport	North America	US	United States	North Dakota	Jamestown	46.92969894	-98.67819977
5587	JVL	Southern Wisconsin Regional Airport	North America	US	United States	Wisconsin	Janesville	42.62030029	-89.04160309
5588	APT	Marion County Brown Field	North America	US	United States	Tennessee	Jasper	35.060699	-85.585297
5589	JAS	Jasper County Airport Bell Field	North America	US	United States	Texas	Jasper	30.8857	-94.034897
5590	EFW	Jefferson Municipal Airport	North America	US	United States	Iowa	Jefferson	42.0102005	-94.34259796
5591	JEF	Jefferson City Memorial Airport	North America	US	United States	Missouri	Jefferson City	38.59120178	-92.15609741
5592	JDA	Grant Co Regional/Ogilvie Field	North America	US	United States	Oregon	John Day	44.40420151	-118.9629974
5593	JCY	LBJ Ranch Airport	North America	US	United States	Texas	Johnson City	30.25180054	-98.62249756
5594	JST	John Murtha Johnstown Cambria County Airport	North America	US	United States	Pennsylvania	Johnstown	40.31610107	-78.83390045
5595	JOT	Joliet Regional Airport	North America	US	United States	Illinois	Joliet	41.51779938	-88.17549896
5596	JBR	Jonesboro Municipal Airport	North America	US	United States	Arkansas	Jonesboro	35.83169937	-90.64640045
5597	JLN	Joplin Regional Airport	North America	US	United States	Missouri	Joplin	37.151798	-94.498299
5598	JDN	Jordan Airport	North America	US	United States	Montana	Jordan	47.3288002	-106.9530029
5599	JCT	Kimble County Airport	North America	US	United States	Texas	Junction	30.51129913	-99.7634964
5600	JNU	Juneau International Airport	North America	US	United States	Alaska	Juneau	58.35499954	-134.576004
5601	UNU	Dodge County Airport	North America	US	United States	Wisconsin	Juneau	43.42660141	-88.70320129
5602	AIZ	Lee C Fine Memorial Airport	North America	US	United States	Missouri	Kaiser Lake Ozark	38.09600067	-92.54949951
5603	KAE	Kake Seaplane Base	North America	US	United States	Alaska	Kake	56.973	-133.945999
5604	KKK	Kalakaket Creek AS Airport	North America	US	United States	Alaska	Kalakaket Creek	64.4166257	-156.8203926
5605	AZO	Kalamazoo Battle Creek International Airport	North America	US	United States	Michigan	Kalamazoo	42.23490143	-85.55210114
5606	FCA	Glacier Park International Airport	North America	US	United States	Montana	Kalispell	48.3105011	-114.2559967
5607	KLG	Kalskag Airport	North America	US	United States	Alaska	Kalskag	61.53630066	-160.3410034
5608	KAL	Kaltag Airport	North America	US	United States	Alaska	Kaltag	64.31909943	-158.7409973
5609	IKK	Greater Kankakee Airport	North America	US	United States	Illinois	Kankakee	41.07139969	-87.84629822
5610	MKC	Charles B. Wheeler Downtown Airport	North America	US	United States	Missouri	Kansas City	39.12319946	-94.59279633
5611	MCI	Kansas City International Airport	North America	US	United States	Missouri	Kansas City	39.2976	-94.713898
5612	KYK	Karluk Airport	North America	US	United States	Alaska	Karluk	57.56710052	-154.4499969
5613	KKL	Karluk Lake Seaplane Base	North America	US	United States	Alaska	Karluk Lake	57.36700058	-154.0279999
5614	KXA	Kasaan Seaplane Base	North America	US	United States	Alaska	Kasaan	55.53739929	-132.397995
5615	KUK	Kasigluk Airport	North America	US	United States	Alaska	Kasigluk	60.87440109	-162.5240021
5616	BKF	Lake Brooks Seaplane Base	North America	US	United States	Alaska	Katmai National Park	58.55479813	-155.7769928
5617	MVM	Kayenta Airport	North America	US	United States	Arizona	Kayenta	36.716444	-110.228444
5618	EAR	Kearney Regional Airport	North America	US	United States	Nebraska	Kearney	40.727001	-99.006798
5619	EEN	Dillant Hopkins Airport	North America	US	United States	New Hampshire	Keene	42.898399	-72.270798
5620	KLS	Southwest Washington Regional Airport	North America	US	United States	Washington	Kelso	46.11800003	-122.8980026
5621	EMM	Kemmerer Municipal Airport	North America	US	United States	Wyoming	Kemmerer	41.82410049	-110.5569992
5622	DRF	Drift River Airport	North America	US	United States	Alaska	Kenai	60.58890152	-152.1620026
5623	ENA	Kenai Municipal Airport	North America	US	United States	Alaska	Kenai	60.57310104	-151.2449951
5624	KEH	Kenmore Air Harbor Inc Seaplane Base	North America	US	United States	Washington	Kenmore	47.75479889	-122.2590027
5625	KNT	Kennett Memorial Airport	North America	US	United States	Missouri	Kennett	36.22589874	-90.03659821
5626	ENW	Kenosha Regional Airport	North America	US	United States	Wisconsin	Kenosha	42.59569931	-87.92780304
5627	KKT	Kentland Municipal Airport	North America	US	United States	Indiana	Kentland	40.75870132	-87.42819977
5628	EOK	Keokuk Municipal Airport	North America	US	United States	Iowa	Keokuk	40.4598999	-91.42849731
5629	ERV	Kerrville Municipal Louis Schreiner Field	North America	US	United States	Texas	Kerrville	29.97669983	-99.08570099
5630	WFB	Ketchikan Harbor Seaplane Base	North America	US	United States	Alaska	Ketchikan	55.349899	-131.677002
5631	KTN	Ketchikan International Airport	North America	US	United States	Alaska	Ketchikan	55.35559845	-131.7140045
5632	OCA	Ocean Reef Club Airport	North America	US	United States	Florida	Key Largo	25.3253994	-80.27480316
5633	EYW	Key West International Airport	North America	US	United States	Florida	Key West	24.556101	-81.759598
5634	NQX	Naval Air Station Key West/Boca Chica Field	North America	US	United States	Florida	Key West	24.57579994	-81.68890381
5635	IAN	Bob Baker Memorial Airport	North America	US	United States	Alaska	Kiana	66.97599792	-160.4369965
5636	FFA	First Flight Airport	North America	US	United States	North Carolina	Kill Devil Hills	36.01819992	-75.6713028
5637	GRK	Killeen-Fort Hood Regional Airport / Robert Gray Army Air Field	North America	US	United States	Texas	Killeen	31.0672	-97.828903
5638	ILE	Skylark Field	North America	US	United States	Texas	Killeen	31.08580017	-97.68650055
5639	KIC	Mesa Del Rey Airport	North America	US	United States	California	King City	36.22800064	-121.1220016
5640	KVC	King Cove Airport	North America	US	United States	Alaska	King Cove	55.11629868	-162.2660065
5641	AKN	King Salmon Airport	North America	US	United States	Alaska	King Salmon	58.677845	-156.651965
5642	IGM	Kingman Airport	North America	US	United States	Arizona	Kingman	35.259499	-113.938004
5643	NQI	Kingsville Naval Air Station	North America	US	United States	Texas	Kingsville	27.50720024	-97.80970001
5644	ISO	Kinston Regional Jetport At Stallings Field	North America	US	United States	North Carolina	Kinston	35.33140183	-77.6088028
5645	KPN	Kipnuk Airport	North America	US	United States	Alaska	Kipnuk	59.93299866	-164.0310059
5646	IRK	Kirksville Regional Airport	North America	US	United States	Missouri	Kirksville	40.09349823	-92.54489899
5647	KKB	Kitoi Bay Seaplane Base	North America	US	United States	Alaska	Kitoi Bay	58.1908989	-152.3699951
5648	KVL	Kivalina Airport	North America	US	United States	Alaska	Kivalina	67.73619843	-164.5630035
5649	LMT	Crater Lake-Klamath Regional Airport	North America	US	United States	Oregon	Klamath Falls	42.156101	-121.733002
5650	KLW	Klawock Airport	North America	US	United States	Alaska	Klawock	55.57920074	-133.076004
5651	NLN	Kneeland Airport	North America	US	United States	California	Kneeland	40.718639	-123.927298
5652	SZL	Whiteman Air Force Base	North America	US	United States	Missouri	Knob Noster	38.730301	-93.547897
5653	TYS	McGhee Tyson Airport	North America	US	United States	Tennessee	Knoxville	35.811001	-83.994003
5654	OBU	Kobuk Airport	North America	US	United States	Alaska	Kobuk	66.91230011	-156.8970032
5655	ADQ	Kodiak Airport	North America	US	United States	Alaska	Kodiak	57.75	-152.4940033
5656	KDK	Kodiak Municipal Airport	North America	US	United States	Alaska	Kodiak	57.80590057	-152.3739929
5657	KNK	Kokhanok Airport	North America	US	United States	Alaska	Kokhanok	59.43320084	-154.8040009
5658	OKK	Kokomo Municipal Airport	North America	US	United States	Indiana	Kokomo	40.52819824	-86.05899811
5659	KGK	Koliganek Airport	North America	US	United States	Alaska	Koliganek	59.72660065	-157.2590027
5660	KKH	Kongiganak Airport	North America	US	United States	Alaska	Kongiganak	59.96080017	-162.8809967
5661	KOT	Kotlik Airport	North America	US	United States	Alaska	Kotlik	63.0306015	-163.5330048
5662	OTZ	Ralph Wien Memorial Airport	North America	US	United States	Alaska	Kotzebue	66.88469696	-162.598999
5663	KKA	Koyuk Alfred Adams Airport	North America	US	United States	Alaska	Koyuk	64.9394989	-161.154007
5664	KYU	Koyukuk Airport	North America	US	United States	Alaska	Koyukuk	64.87609863	-157.727005
5665	LKK	Kulik Lake Airport	North America	US	United States	Alaska	Kulik Lake	58.98210144	-155.1210022
5666	UUK	Ugnu-Kuparuk Airport	North America	US	United States	Alaska	Kuparuk	70.33080292	-149.5980072
5667	KWT	Kwethluk Airport	North America	US	United States	Alaska	Kwethluk	60.79029846	-161.4440002
5668	KWK	Kwigillingok Airport	North America	US	United States	Alaska	Kwigillingok	59.876499	-163.169005
5669	LSE	La Crosse Regional Airport	North America	US	United States	Wisconsin	La Crosse	43.879002	-91.256699
5670	LGD	La Grande/Union County Airport	North America	US	United States	Oregon	La Grande	45.29019928	-118.0070038
5671	LPO	La Porte Municipal Airport	North America	US	United States	Indiana	La Porte	41.57249832	-86.73449707
5672	POC	Brackett Field	North America	US	United States	California	La Verne	34.09159851	-117.7819977
5673	LCI	Laconia Municipal Airport	North America	US	United States	New Hampshire	Laconia / Gilford	43.572701	-71.4189
5674	LFT	Lafayette Regional Airport	North America	US	United States	Louisiana	Lafayette	30.205299	-91.987602
5675	LGC	LaGrange Callaway Airport	North America	US	United States	Georgia	LaGrange	33.008873	-85.074331
5676	CWF	Chennault International Airport	North America	US	United States	Louisiana	Lake Charles	30.2105999	-93.14320374
5677	LCH	Lake Charles Regional Airport	North America	US	United States	Louisiana	Lake Charles	30.12610054	-93.22329712
5678	LCQ	Lake City Gateway Airport	North America	US	United States	Florida	Lake City	30.18199921	-82.57689667
5679	XES	Grand Geneva Resort Airport	North America	US	United States	Wisconsin	Lake Geneva	42.614899	-88.389603
5680	HII	Lake Havasu City International Airport	North America	US	United States	Arizona	Lake Havasu City	34.571098	-114.358002
5681	LKP	Lake Placid Airport	North America	US	United States	New York	Lake Placid	44.26449966	-73.9618988
5682	NEL	Lakehurst Maxfield Field Airport	North America	US	United States	New Jersey	Lakehurst	40.03329849	-74.353302
5683	LAL	Lakeland Linder International Airport	North America	US	United States	Florida	Lakeland	27.988899	-82.018602
5684	CKE	Lampson Field	North America	US	United States	California	Lakeport	38.99060059	-122.901001
5685	LKV	Lake County Airport	North America	US	United States	Oregon	Lakeview	42.16109848	-120.3990021
5686	LAA	Southeast Colorado Regional Airport	North America	US	United States	Colorado	Lamar	38.066126	-102.690169
5687	WJF	General WM J Fox Airfield	North America	US	United States	California	Lancaster	34.74110031	-118.2190018
5688	LNS	Lancaster Airport	North America	US	United States	Pennsylvania	Lancaster	40.12170029	-76.2960968
5689	LND	Hunt Field	North America	US	United States	Wyoming	Lander	42.81520081	-108.7300034
5690	LAN	Capital City Airport	North America	US	United States	Michigan	Lansing	42.77870178	-84.58740234
5691	LAR	Laramie Regional Airport	North America	US	United States	Wyoming	Laramie	41.31209946	-105.6750031
5692	LRD	Laredo International Airport	North America	US	United States	Texas	Laredo	27.54380035	-99.46160126
5693	KLN	Larsen Bay Airport	North America	US	United States	Alaska	Larsen Bay	57.535099	-153.977993
5694	LRU	Las Cruces International Airport	North America	US	United States	New Mexico	Las Cruces	32.28939819	-106.9219971
5695	HSH	Henderson Executive Airport	North America	US	United States	Nevada	Las Vegas	35.97280121	-115.1340027
5696	LAS	McCarran International Airport	North America	US	United States	Nevada	Las Vegas	36.08010101	-115.1520004
5697	LSV	Nellis Air Force Base	North America	US	United States	Nevada	Las Vegas	36.23619843	-115.0339966
5698	VGT	North Las Vegas Metropolitan International Airport	North America	US	United States	Nevada	Las Vegas	36.210701	-115.194
5699	LVS	Las Vegas Municipal Airport	North America	US	United States	New Mexico	Las Vegas	35.654202	-105.141998
5700	LBE	Arnold Palmer Regional Airport	North America	US	United States	Pennsylvania	Latrobe	40.275902	-79.4048
5701	LUL	Hesler Noble Field	North America	US	United States	Mississippi	Laurel	31.67259979	-89.17220306
5702	LWC	Lawrence Municipal Airport	North America	US	United States	Kansas	Lawrence	39.01119995	-95.21659851
5703	LWM	Lawrence Municipal Airport	North America	US	United States	Massachusetts	Lawrence	42.71720123	-71.12339783
5704	LZU	Gwinnett County Briscoe Field	North America	US	United States	Georgia	Lawrenceville	33.97809982	-83.96240234
5705	LWV	Lawrenceville Vincennes International Airport	North America	US	United States	Illinois	Lawrenceville	38.7643013	-87.60549927
5706	OEA	O'Neal Airport	North America	US	United States	Illinois	Lawrenceville	38.68521	-87.543138
5707	LVL	Brunswick Municipal Airport	North America	US	United States	Virginia	Lawrenceville	36.7728	-77.794296
5708	LAW	Lawton Fort Sill Regional Airport	North America	US	United States	Oklahoma	Lawton	34.56769943	-98.41660309
5709	ALZ	Alitak Seaplane Base	North America	US	United States	Alaska	Lazy Bay	56.8995018	-154.2480011
5710	LRJ	Le Mars Municipal Airport	North America	US	United States	Iowa	Le Mars	42.77799988	-96.1937027
5711	LXV	Lake County Airport	North America	US	United States	Colorado	Leadville	39.22029877	-106.3170013
5712	LEB	Lebanon Municipal Airport	North America	US	United States	New Hampshire	Lebanon	43.62609863	-72.30419922
5713	LEE	Leesburg International Airport	North America	US	United States	Florida	Leesburg	28.82309914	-81.80870056
5714	LEM	Lemmon Municipal Airport	North America	US	United States	South Dakota	Lemmon	45.91870117	-102.1060028
5715	NLC	Lemoore Naval Air Station (Reeves Field) Airport	North America	US	United States	California	Lemoore	36.33300018	-119.9520035
5716	KLL	Levelock Airport	North America	US	United States	Alaska	Levelock	59.12606	-156.860906
5717	LWB	Greenbrier Valley Airport	North America	US	United States	West Virginia	Lewisburg	37.85829926	-80.39949799
5718	LWS	Lewiston Nez Perce County Airport	North America	US	United States	Idaho	Lewiston	46.37450027	-117.0149994
5719	LWT	Lewistown Municipal Airport	North America	US	United States	Montana	Lewistown	47.04930115	-109.4670029
5720	LEX	Blue Grass Airport	North America	US	United States	Kentucky	Lexington	38.036499	-84.605904
5721	LXN	Jim Kelly Field	North America	US	United States	Nebraska	Lexington	40.79100037	-99.77729797
5722	LBL	Liberal Mid-America Regional Airport	North America	US	United States	Kansas	Liberal	37.0442009	-100.9599991
5723	AOH	Lima Allen County Airport	North America	US	United States	Ohio	Lima	40.706902	-84.026703
5724	LVD	Lime Village Airport	North America	US	United States	Alaska	Lime Village	61.35910034	-155.4400024
5725	LIZ	Loring International Airport	North America	US	United States	Maine	Limestone	46.950401	-67.885902
5726	LIC	Limon Municipal Airport	North America	US	United States	Colorado	Limon	39.27479935	-103.6660004
5727	LNK	Lincoln Airport	North America	US	United States	Nebraska	Lincoln	40.85100174	-96.75920105
5728	LDJ	Linden Airport	North America	US	United States	New Jersey	Linden	40.61740112	-74.24459839
5729	LIT	Bill & Hillary Clinton National Airport/Adams Field	North America	US	United States	Arkansas	Little Rock	34.729582	-92.223728
5730	GCT	Grand Canyon Bar Ten Airstrip	North America	US	United States	Arizona	Littlefield	36.258614	-113.231159
5731	LIV	Livengood Camp Airport	North America	US	United States	Alaska	Livengood	65.467	-148.6534
5732	LVK	Livermore Municipal Airport	North America	US	United States	California	Livermore	37.69340134	-121.8199997
5733	LVM	Mission Field	North America	US	United States	Montana	Livingston	45.69940186	-110.447998
5734	LHV	William T. Piper Memorial Airport	North America	US	United States	Pennsylvania	Lock Haven	41.13560104	-77.42230225
5735	LGU	Logan-Cache Airport	North America	US	United States	Utah	Logan	41.79119873	-111.8519974
5736	LPC	Lompoc Airport	North America	US	United States	California	Lompoc	34.66559982	-120.4680023
5737	VBG	Vandenberg Air Force Base	North America	US	United States	California	Lompoc	34.737301	-120.584
5738	LOZ	London-Corbin Airport/Magee Field	North America	US	United States	Kentucky	London	37.0821991	-84.0848999
5739	LNR	Tri-County Regional Airport	North America	US	United States	Wisconsin	Lone Rock	43.21170044	-90.18160248
5740	LGB	Long Beach Airport (Daugherty Field)	North America	US	United States	California	Long Beach	33.817699	-118.152
5741	GGG	East Texas Regional Airport	North America	US	United States	Texas	Longview	32.38399887	-94.71150208
5742	LPS	Lopez Island Airport	North America	US	United States	Washington	Lopez	48.48389816	-122.9380035
5743	LSB	Lordsburg Municipal Airport	North America	US	United States	New Mexico	Lordsburg	32.33349991	-108.6920013
5744	WLR	Loring Seaplane Base	North America	US	United States	Alaska	Loring	55.60129929	-131.6369934
5745	LAM	Los Alamos Airport	North America	US	United States	New Mexico	Los Alamos	35.87979889	-106.2689972
5746	LAX	Los Angeles International Airport	North America	US	United States	California	Los Angeles	33.942501	-118.407997
5747	WHP	Whiteman Airport	North America	US	United States	California	Los Angeles	34.25930023	-118.413002
5748	LSN	Los Banos Municipal Airport	North America	US	United States	California	Los Banos	37.06290054	-120.8690033
5749	LOW	Louisa County Airport/Freeman Field	North America	US	United States	Virginia	Louisa	38.00979996	-77.9701004
5750	LFN	Triangle North Executive Airport	North America	US	United States	North Carolina	Louisburg	36.0233	-78.330299
5751	LOU	Bowman Field	North America	US	United States	Kentucky	Louisville	38.22800064	-85.66369629
5752	SDF	Louisville Muhammad Ali International Airport	North America	US	United States	Kentucky	Louisville	38.1744	-85.736
5753	LMS	Louisville Winston County Airport	North America	US	United States	Mississippi	Louisville	33.14619827	-89.0625
5754	FNL	Northern Colorado Regional Airport	North America	US	United States	Colorado	Loveland	40.448763	-105.011244
5755	LOL	Derby Field	North America	US	United States	Nevada	Lovelock	40.06639862	-118.5650024
5756	LBB	Lubbock Preston Smith International Airport	North America	US	United States	Texas	Lubbock	33.663601	-101.822998
5757	REE	Reese Airpark	North America	US	United States	Texas	Lubbock	33.59030151	-102.0370026
5758	LDM	Mason County Airport	North America	US	United States	Michigan	Ludington	43.96250153	-86.40789795
5759	LFK	Angelina County Airport	North America	US	United States	Texas	Lufkin	31.23399925	-94.75
5760	LLY	South Jersey Regional Airport	North America	US	United States	New Jersey	Lumberton	39.942902	-74.845703
5761	LBT	Lumberton Regional Airport	North America	US	United States	North Carolina	Lumberton	34.60990143	-79.05940247
5762	LSK	Lusk Municipal Airport	North America	US	United States	Wyoming	Lusk	42.75379944	-104.4049988
5763	LYH	Lynchburg Regional Preston Glenn Field	North America	US	United States	Virginia	Lynchburg	37.3266983	-79.20040131
5764	LLX	Caledonia County Airport	North America	US	United States	Vermont	Lyndonville	44.56909943	-72.01799774
5765	LYO	Lyons-Rice County Municipal Airport	North America	US	United States	Kansas	Lyons	38.34280014	-98.22689819
5766	MCD	Mackinac Island Airport	North America	US	United States	Michigan	Mackinac Island	45.86489868	-84.63729858
5767	MQB	Macomb Municipal Airport	North America	US	United States	Illinois	Macomb	40.52009964	-90.65239716
5768	MAC	Macon Downtown Airport	North America	US	United States	Georgia	Macon	32.82210159	-83.56199646
5769	MCN	Middle Georgia Regional Airport	North America	US	United States	Georgia	Macon	32.69279861	-83.64920044
5770	MAE	Madera Municipal Airport	North America	US	United States	California	Madera	36.98860168	-120.1119995
5771	MDN	Madison Municipal Airport	North America	US	United States	Indiana	Madison	38.75889969	-85.46549988
5772	DXE	Bruce Campbell Field	North America	US	United States	Mississippi	Madison	32.438702	-90.103104
5773	XMD	Madison Municipal Airport	North America	US	United States	South Dakota	Madison	44.01599884	-97.08589935
5774	MSN	Dane County Regional Truax Field	North America	US	United States	Wisconsin	Madison	43.1399	-89.337502
5775	MDJ	Madras Municipal Airport	North America	US	United States	Oregon	Madras	44.67020035	-121.1549988
5776	AGO	Magnolia Municipal Airport / Ralph C Weiser Field	North America	US	United States	Arkansas	Magnolia	33.228001	-93.217002
5777	MAW	Malden Regional Airport	North America	US	United States	Missouri	Malden	36.6006012	-89.99220276
5778	MLK	Malta Airport	North America	US	United States	Montana	Malta	48.3669014	-107.9189987
5779	MMH	Mammoth Yosemite Airport	North America	US	United States	California	Mammoth Lakes	37.62409973	-118.8379974
5959	EWK	Newton City-County Airport	North America	US	United States	Kansas	Newton	38.05820084	-97.27449799
5780	MNZ	Manassas Regional Airport/Harry P. Davis Field	North America	US	United States	Virginia	Manassas	38.72140121	-77.51540375
5781	MHT	Manchester-Boston Regional Airport	North America	US	United States	New Hampshire	Manchester	42.932598	-71.435699
5782	MHK	Manhattan Regional Airport	North America	US	United States	Kansas	Manhattan	39.14099884	-96.67079926
5783	MXA	Manila Municipal Airport	North America	US	United States	Arkansas	Manila	35.894402	-90.154602
5784	MBL	Manistee County Blacker Airport	North America	US	United States	Michigan	Manistee	44.272738	-86.251945
5785	ISQ	Schoolcraft County Airport	North America	US	United States	Michigan	Manistique	45.97460175	-86.17179871
5786	MTW	Manitowoc County Airport	North America	US	United States	Wisconsin	Manitowoc	44.127116	-87.681983
5787	MLY	Manley Hot Springs Airport	North America	US	United States	Alaska	Manley Hot Springs	64.99759674	-150.6439972
5788	KMO	Manokotak Airport	North America	US	United States	Alaska	Manokotak	58.99020004	-159.0500031
5789	MFD	Mansfield Lahm Regional Airport	North America	US	United States	Ohio	Mansfield	40.82139969	-82.51660156
5790	MEO	Dare County Regional Airport	North America	US	United States	North Carolina	Manteo	35.91899872	-75.69550323
5791	NTJ	Manti-Ephraim Airport	North America	US	United States	Utah	Manti	39.32910156	-111.6149979
5792	JVI	Central Jersey Regional Airport	North America	US	United States	New Jersey	Manville	40.5243988	-74.5983963
5793	AVW	Marana Regional Airport	North America	US	United States	Arizona	Marana	32.409065	-111.216199
5794	MZJ	Pinal Airpark	North America	US	United States	Arizona	Marana	32.51060104	-111.3280029
5795	MTH	The Florida Keys Marathon Airport	North America	US	United States	Florida	Marathon	24.726101	-81.051399
5796	MRK	Marco Island Executive Airport	North America	US	United States	Florida	Marco Island	25.995001	-81.672501
5797	MRF	Marfa Municipal Airport	North America	US	United States	Texas	Marfa	30.369593	-104.015893
5798	MGE	Dobbins Air Reserve Base	North America	US	United States	Georgia	Marietta	33.915401	-84.516296
5799	OAR	Marina Municipal Airport	North America	US	United States	California	Marina	36.68190002	-121.762001
5800	MWA	Veterans Airport of Southern Illinois	North America	US	United States	Illinois	Marion	37.751208	-89.016568
5801	MZZ	Marion Municipal Airport	North America	US	United States	Indiana	Marion	40.48989868	-85.67970276
5802	MNN	Marion Municipal Airport	North America	US	United States	Ohio	Marion	40.61619949	-83.06349945
5803	RMY	Mariposa Yosemite Airport	North America	US	United States	California	Mariposa	37.51089859	-120.0400009
5804	MMS	Selfs Airport	North America	US	United States	Mississippi	Marks	34.231499	-90.289597
5805	MLL	Marshall Don Hunter Sr Airport	North America	US	United States	Alaska	Marshall	61.86429977	-162.026001
5806	MML	Southwest Minnesota Regional Airport - Marshall/Ryan Field	North America	US	United States	Minnesota	Marshall	44.45050049	-95.82189941
5807	MHL	Marshall Memorial Municipal Airport	North America	US	United States	Missouri	Marshall	39.09579849	-93.20290375
5808	ASL	Harrison County Airport	North America	US	United States	Texas	Marshall	32.52050018	-94.30780029
5809	MFI	Marshfield Municipal Airport	North America	US	United States	Wisconsin	Marshfield	44.63690186	-90.18930054
5810	MVY	Martha's Vineyard Airport	North America	US	United States	Massachusetts	Martha's Vineyard	41.39310074	-70.61430359
5811	MRB	Eastern WV Regional Airport/Shepherd Field	North America	US	United States	West Virginia	Martinsburg	39.40190125	-77.98459625
5812	BAB	Beale Air Force Base	North America	US	United States	California	Marysville	39.136101	-121.436996
5813	MYV	Yuba County Airport	North America	US	United States	California	Marysville	39.09780121	-121.5699997
5814	MSS	Massena International Airport Richards Field	North America	US	United States	New York	Massena	44.936157	-74.844304
5815	MTO	Coles County Memorial Airport	North America	US	United States	Illinois	Mattoon	39.477901	-88.279198
5816	MXE	Laurinburg Maxton Airport	North America	US	United States	North Carolina	Maxton	34.791901	-79.365799
5817	MYK	May Creek Airport	North America	US	United States	Alaska	May Creek	61.33570099	-142.6869965
5818	NRB	Naval Station Mayport (Admiral David L. Mcdonald Field)	North America	US	United States	Florida	Mayport	30.39109993	-81.42469788
5819	MLC	Mc Alester Regional Airport	North America	US	United States	Oklahoma	Mc Alester	34.882401	-95.783501
5820	MCK	Mc Cook Ben Nelson Regional Airport	North America	US	United States	Nebraska	Mc Cook	40.20629883	-100.5920029
5821	RNC	Warren County Memorial Airport	North America	US	United States	Tennessee	Mc Minnville	35.69869995	-85.84380341
5822	MFE	McAllen Miller International Airport	North America	US	United States	Texas	McAllen	26.176141	-98.237965
5823	MYL	McCall Municipal Airport	North America	US	United States	Idaho	McCall	44.88970184	-116.1009979
5824	MXY	Mc Carthy Airport	North America	US	United States	Alaska	Mccarthy	61.43709946	-142.904007
5825	MCB	McComb-Pike County Airport / John E Lewis Field	North America	US	United States	Mississippi	McComb	31.178499	-90.471901
5826	MCG	McGrath Airport	North America	US	United States	Alaska	McGrath	62.95289993	-155.6060028
5827	MCL	McKinley National Park Airport	North America	US	United States	Alaska	McKinley Park	63.73260117	-148.9109955
5828	MEJ	Port Meadville Airport	North America	US	United States	Pennsylvania	Meadville	41.62649918	-80.21469879
5829	MFR	Rogue Valley International Medford Airport	North America	US	United States	Oregon	Medford	42.37419891	-122.8730011
5830	MDF	Taylor County Airport	North America	US	United States	Wisconsin	Medford	45.10100174	-90.30329895
5831	MYU	Mekoryuk Airport	North America	US	United States	Alaska	Mekoryuk	60.37139893	-166.2709961
5832	MLB	Melbourne Orlando International Airport	North America	US	United States	Florida	Melbourne	28.1028	-80.645302
5833	MFV	Accomack County Airport	North America	US	United States	Virginia	Melfa	37.64690018	-75.76110077
5834	MEM	Memphis International Airport	North America	US	United States	Tennessee	Memphis	35.04240036	-89.97669983
5835	MNM	Menominee Regional Airport	North America	US	United States	Michigan	Menominee	45.126701	-87.638397
5836	MER	Castle Airport	North America	US	United States	California	Merced	37.38050079	-120.5680008
5837	MCE	Merced Regional Macready Field	North America	US	United States	California	Merced	37.28469849	-120.5139999
5838	DRA	Desert Rock Airport	North America	US	United States	Nevada	Mercury	36.6194	-116.032997
5839	UCC	Yucca Airstrip	North America	US	United States	Nevada	Mercury	36.94580078	-116.038002
5840	MEI	Key Field / Meridian Regional Airport	North America	US	United States	Mississippi	Meridian	32.3326	-88.7519
5841	RRL	Merrill Municipal Airport	North America	US	United States	Wisconsin	Merrill	45.19889832	-89.71289825
5842	COI	Merritt Island Airport	North America	US	United States	Florida	Merritt Island	28.34160042	-80.6855011
5843	MSC	Falcon Field	North America	US	United States	Arizona	Mesa	33.46080017	-111.7279968
5844	AZA	Phoenix???Mesa Gateway Airport	North America	US	United States	Arizona	Mesa	33.3078	-111.654999
5845	MFH	Mesquite International Airport	North America	US	United States	Nevada	Mesquite	36.833105	-114.055928
5846	ANN	Annette Island Airport	North America	US	United States	Alaska	Metlakatla	55.037026	-131.572695
5847	MTM	Metlakatla Seaplane Base	North America	US	United States	Alaska	Metlakatla	55.131001	-131.578003
5848	WMK	Meyers Chuck Seaplane Base	North America	US	United States	Alaska	Meyers Chuck	55.73960114	-132.2550049
5849	TNT	Dade Collier Training and Transition Airport	North America	US	United States	Florida	Miami	25.86179924	-80.89700317
5850	TMB	Miami Executive Airport	North America	US	United States	Florida	Miami	25.6479	-80.4328
5851	MIA	Miami International Airport	North America	US	United States	Florida	Miami	25.79319954	-80.29060364
5852	MPB	Miami Seaplane Base	North America	US	United States	Florida	Miami	25.77829933	-80.17030334
5853	OPF	Miami-Opa Locka Executive Airport	North America	US	United States	Florida	Miami	25.907	-80.278397
5854	MGC	Michigan City Municipal Airport	North America	US	United States	Indiana	Michigan City	41.70330048	-86.82119751
5855	MDO	Middleton Island Airport	North America	US	United States	Alaska	Middleton Island	59.44990158	-146.3070068
5856	MWO	Middletown Regional Airport	North America	US	United States	Ohio	Middletown	39.530998	-84.395302
5857	MDD	Midland Airpark	North America	US	United States	Texas	Midland	32.03649902	-102.1009979
5858	MAF	Midland International Airport	North America	US	United States	Texas	Midland	31.94249916	-102.2020035
5859	MLS	Frank Wiley Field	North America	US	United States	Montana	Miles City	46.4280014	-105.8860016
5860	NQA	Millington-Memphis Airport	North America	US	United States	Tennessee	Millington	35.356701	-89.8703
5861	MIV	Millville Municipal Airport	North America	US	United States	New Jersey	Millville	39.367802	-75.072197
5862	NSE	Whiting Field Naval Air Station - North	North America	US	United States	Florida	Milton	30.7241993	-87.02189636
5863	MKE	General Mitchell International Airport	North America	US	United States	Wisconsin	Milwaukee	42.94720078	-87.89659882
5864	MWC	Lawrence J Timmerman Airport	North America	US	United States	Wisconsin	Milwaukee	43.110401	-88.034401
5865	LMA	Minchumina Airport	North America	US	United States	Alaska	Minchumina	63.886002	-152.302002
5866	MEV	Minden-Tahoe Airport	North America	US	United States	Nevada	Minden	39.00030136	-119.7509995
5867	MWL	Mineral Wells Regional Airport	North America	US	United States	Texas	Mineral Wells	32.781601	-98.060204
5868	FCM	Flying Cloud Airport	North America	US	United States	Minnesota	Minneapolis	44.82720184	-93.45709991
5869	MSP	Minneapolis???Saint Paul International Airport / Wold???Chamberlain Field	North America	US	United States	Minnesota	Minneapolis	44.882	-93.221802
5870	ARV	Lakeland-Noble F. Lee Memorial field	North America	US	United States	Wisconsin	Minocqua-Woodruff	45.92789841	-89.73090363
5871	MIB	Minot Air Force Base	North America	US	United States	North Dakota	Minot	48.4156	-101.358002
5872	MOT	Minot International Airport	North America	US	United States	North Dakota	Minot	48.25939941	-101.2799988
5873	MNT	Minto Al Wright Airport	North America	US	United States	Alaska	Minto	65.1437	-149.369995
5874	MSO	Missoula International Airport	North America	US	United States	Montana	Missoula	46.91630173	-114.0910034
5875	MHE	Mitchell Municipal Airport	North America	US	United States	South Dakota	Mitchell	43.77479935	-98.03859711
5876	CNY	Canyonlands Field	North America	US	United States	Utah	Moab	38.75500107	-109.7549973
5877	MBY	Omar N Bradley Airport	North America	US	United States	Missouri	Moberly	39.464393	-92.428365
5878	BFM	Mobile Downtown Airport	North America	US	United States	Alabama	Mobile	30.62680054	-88.06809998
5879	MOB	Mobile Regional Airport	North America	US	United States	Alabama	Mobile	30.6912	-88.242798
5880	MBG	Mobridge Municipal Airport	North America	US	United States	South Dakota	Mobridge	45.54650116	-100.4079971
5881	MOD	Modesto City Co-Harry Sham Field	North America	US	United States	California	Modesto	37.625801	-120.954002
5882	MHV	Mojave Airport	North America	US	United States	California	Mojave	35.05939865	-118.1520004
5883	MLI	Quad City International Airport	North America	US	United States	Illinois	Moline	41.448502	-90.5075
5884	MIF	Roy Hurd Memorial Airport	North America	US	United States	Texas	Monahans	31.58250046	-102.9089966
5885	MLU	Monroe Regional Airport	North America	US	United States	Louisiana	Monroe	32.510899	-92.037697
5886	MVC	Monroe County Aeroplex Airport	North America	US	United States	Alabama	Monroeville	31.458	-87.350996
5887	ROF	Montague-Yreka Rohrer Field	North America	US	United States	California	Montague	41.73040009	-122.5459976
5888	MTP	Montauk Airport	North America	US	United States	New York	Montauk	41.0765	-71.920797
5889	MRY	Monterey Peninsula Airport	North America	US	United States	California	Monterey	36.5870018	-121.8430023
5890	MVE	Montevideo Chippewa County Airport	North America	US	United States	Minnesota	Montevideo	44.969101	-95.710297
5891	MXF	Maxwell Air Force Base	North America	US	United States	Alabama	Montgomery	32.3829	-86.365799
5892	MGM	Montgomery Regional (Dannelly Field) Airport	North America	US	United States	Alabama	Montgomery	32.300598	-86.393997
5893	MGJ	Orange County Airport	North America	US	United States	New York	Montgomery	41.50999832	-74.26460266
5894	MSV	Sullivan County International Airport	North America	US	United States	New York	Monticello	41.701596	-74.794997
5895	MXC	Monticello Airport	North America	US	United States	Utah	Monticello	37.93243	-109.341225
5896	MTJ	Montrose Regional Airport	North America	US	United States	Colorado	Montrose	38.50979996	-107.8939972
5897	MRN	Foothills Regional Airport	North America	US	United States	North Carolina	Morganton	35.820202	-81.611397
5898	MGW	Morgantown Municipal Walter L. Bill Hart Field	North America	US	United States	West Virginia	Morgantown	39.64289856	-79.91629791
5899	MPJ	Petit Jean Park Airport	North America	US	United States	Arkansas	Morrilton	35.138901	-92.909202
5900	MMU	Morristown Municipal Airport	North America	US	United States	New Jersey	Morristown	40.79940033	-74.41490173
5901	MVL	Morrisville-Stowe State Airport	North America	US	United States	Vermont	Morrisville	44.534599	-72.613998
5902	PIB	Hattiesburg Laurel Regional Airport	North America	US	United States	Mississippi	Moselle	31.4671	-89.337097
5903	KMY	Moser Bay Seaplane Base	North America	US	United States	Alaska	Moser Bay	57.0256	-154.145996
5904	MWH	Grant County International Airport	North America	US	United States	Washington	Moses Lake	47.20769882	-119.3199997
5905	CWA	Central Wisconsin Airport	North America	US	United States	Wisconsin	Mosinee	44.77759933	-89.66680145
5906	MGR	Moultrie Municipal Airport	North America	US	United States	Georgia	Moultrie	31.0848999	-83.80329895
5907	MTC	Selfridge Air National Guard Base Airport	North America	US	United States	Michigan	Mount Clemens	42.613463	-82.836919
5908	MPZ	Mount Pleasant Municipal Airport	North America	US	United States	Iowa	Mount Pleasant	40.94660187	-91.51110077
5909	MPO	Pocono Mountains Municipal Airport	North America	US	United States	Pennsylvania	Mount Pocono	41.136025	-75.379572
5910	WMH	Ozark Regional Airport	North America	US	United States	Arkansas	Mountain Home	36.3689003	-92.47049713
5911	MUO	Mountain Home Air Force Base	North America	US	United States	Idaho	Mountain Home	43.043598	-115.872002
5912	NUQ	Moffett Federal Airfield	North America	US	United States	California	Mountain View	37.4161	-122.049004
5913	MOU	Mountain Village Airport	North America	US	United States	Alaska	Mountain Village	62.09540176	-163.6820068
5914	MHN	Hooker County Airport	North America	US	United States	Nebraska	Mullen	42.042155	-101.059113
5915	MIE	Delaware County Johnson Field	North America	US	United States	Indiana	Muncie	40.24229813	-85.39589691
5916	CEY	Kyle Oakley Field	North America	US	United States	Kentucky	Murray	36.66460037	-88.37280273
5917	RBK	French Valley Airport	North America	US	United States	California	Murrieta	33.5742	-117.127998
5918	MUT	Muscatine Municipal Airport	North America	US	United States	Iowa	Muscatine	41.367803	-91.148201
5919	MSL	Northwest Alabama Regional Airport	North America	US	United States	Alabama	Muscle Shoals	34.74530029	-87.61019897
5920	MKG	Muskegon County Airport	North America	US	United States	Michigan	Muskegon	43.169498	-86.238197
5921	MYR	Myrtle Beach International Airport	North America	US	United States	South Carolina	Myrtle Beach	33.67969894	-78.92829895
5922	OCH	A L Mangham Jr. Regional Airport	North America	US	United States	Texas	Nacogdoches	31.57799911	-94.70950317
5923	NNK	Naknek Airport	North America	US	United States	Alaska	Naknek	58.735633	-157.02216
5924	ACK	Nantucket Memorial Airport	North America	US	United States	Massachusetts	Nantucket	41.25310135	-70.06020355
5925	KEB	Nanwalek Airport	North America	US	United States	Alaska	Nanwalek	59.35210037	-151.9250031
5926	APC	Napa County Airport	North America	US	United States	California	Napa	38.2132	-122.280998
5927	WNA	Napakiak Airport	North America	US	United States	Alaska	Napakiak	60.69029999	-161.9790039
5928	PKA	Napaskiak Airport	North America	US	United States	Alaska	Napaskiak	60.70289993	-161.7779999
5929	APF	Naples Municipal Airport	North America	US	United States	Florida	Naples	26.15259933	-81.77529907
5930	ASH	Nashua Airport / Boire Field	North America	US	United States	New Hampshire	Nashua	42.7817	-71.514801
5931	BNA	Nashville International Airport	North America	US	United States	Tennessee	Nashville	36.12450027	-86.67819977
5932	HEZ	Natchez???Adams County Airport / Hardy-Anders Field	North America	US	United States	Mississippi	Natchez	31.614817	-91.297331
5933	EED	Needles Airport	North America	US	United States	California	Needles	34.7663002	-114.6230011
5934	NLG	Nelson Lagoon Airport	North America	US	United States	Alaska	Nelson Lagoon	56.00749969	-161.1600037
5935	ENN	Nenana Municipal Airport	North America	US	United States	Alaska	Nenana	64.54730225	-149.0740051
5936	NPH	J. Randy McKnight Nephi Municipal Airport	North America	US	United States	Utah	Nephi	39.73681	-111.870063
5937	EWB	New Bedford Regional Airport	North America	US	United States	Massachusetts	New Bedford	41.67610168	-70.95690155
5938	EWN	Coastal Carolina Regional Airport	North America	US	United States	North Carolina	New Bern	35.07300186	-77.04290009
5939	HVN	Tweed New Haven Airport	North America	US	United States	Connecticut	New Haven	41.26369858	-72.88680267
5940	ARA	Acadiana Regional Airport	North America	US	United States	Louisiana	New Iberia	30.0378	-91.883904
5941	NEW	Lakefront Airport	North America	US	United States	Louisiana	New Orleans	30.04240036	-90.02829742
5942	MSY	Louis Armstrong New Orleans International Airport	North America	US	United States	Louisiana	New Orleans	29.99340057	-90.25800323
5943	NBG	New Orleans NAS JRB/Alvin Callender Field	North America	US	United States	Louisiana	New Orleans	29.82530022	-90.03500366
5944	PHD	Harry Clever Field	North America	US	United States	Ohio	New Philadelphia	40.47090149	-81.41970062
5945	KNW	New Stuyahok Airport	North America	US	United States	Alaska	New Stuyahok	59.44990158	-157.3280029
5946	ULM	New Ulm Municipal Airport	North America	US	United States	Minnesota	New Ulm	44.31959915	-94.50229645
5947	EWR	Newark Liberty International Airport	North America	US	United States	New Jersey	New York	40.692501	-74.168701
5948	JFK	John F Kennedy International Airport	North America	US	United States	New York	New York	40.639801	-73.7789
5949	LGA	La Guardia Airport	North America	US	United States	New York	New York	40.777199	-73.872597
5950	QNY	New York Skyports Inc Seaplane Base	North America	US	United States	New York	New York	40.735061	-73.972814
5951	SWF	New York Stewart International Airport	North America	US	United States	New York	Newburgh	41.504101	-74.104797
5952	ECS	Mondell Field	North America	US	United States	Wyoming	Newcastle	43.885399	-104.318001
5953	ONP	Newport Municipal Airport	North America	US	United States	Oregon	Newport	44.580399	-124.057999
5954	NPT	Newport State Airport	North America	US	United States	Rhode Island	Newport	41.532398	-71.281502
5955	EFK	Northeast Kingdom International Airport	North America	US	United States	Vermont	Newport	44.888802	-72.229202
5956	PHF	Newport News Williamsburg International Airport	North America	US	United States	Virginia	Newport News	37.131901	-76.492996
5957	WWT	Newtok Airport	North America	US	United States	Alaska	Newtok	60.93909836	-164.6410065
5958	TNU	Newton Municipal Airport	North America	US	United States	Iowa	Newton	41.67440033	-93.021698
5960	IAG	Niagara Falls International Airport	North America	US	United States	New York	Niagara Falls	43.1073	-78.946198
5961	NME	Nightmute Airport	North America	US	United States	Alaska	Nightmute	60.47100067	-164.701004
5962	NIB	Nikolai Airport	North America	US	United States	Alaska	Nikolai	63.0186	-154.358002
5963	IKO	Nikolski Air Station	North America	US	United States	Alaska	Nikolski	52.9416008	-168.848999
5964	NLE	Jerry Tyler Memorial Airport	North America	US	United States	Michigan	Niles	41.83589935	-86.22519684
5965	WTK	Noatak Airport	North America	US	United States	Alaska	Noatak	67.56610107	-162.9750061
5966	OLS	Nogales International Airport	North America	US	United States	Arizona	Nogales	31.4177	-110.848
5967	OME	Nome Airport	North America	US	United States	Alaska	Nome	64.5121994	-165.4450073
5968	NNL	Nondalton Airport	North America	US	United States	Alaska	Nondalton	59.98020172	-154.8390045
5969	ORV	Robert (Bob) Curtis Memorial Airport	North America	US	United States	Alaska	Noorvik	66.817902	-161.018997
5970	OFK	Karl Stefan Memorial Airport	North America	US	United States	Nebraska	Norfolk	41.98550034	-97.43509674
5971	ORF	Norfolk International Airport	North America	US	United States	Virginia	Norfolk	36.8946	-76.201202
5972	NGU	Norfolk Naval Station (Chambers Field)	North America	US	United States	Virginia	Norfolk	36.937599	-76.289299
5973	OUN	University of Oklahoma Westheimer Airport	North America	US	United States	Oklahoma	Norman	35.2456	-97.472099
5974	OWK	Central Maine Airport of Norridgewock	North America	US	United States	Maine	Norridgewock	44.71549988	-69.86650085
5975	OTH	Southwest Oregon Regional Airport	North America	US	United States	Oregon	North Bend	43.417099	-124.2460022
5976	NCO	Quonset State Airport	North America	US	United States	Rhode Island	North Kingstown	41.5970993	-71.41210175
5977	CRE	Grand Strand Airport	North America	US	United States	South Carolina	North Myrtle Beach	33.81169891	-78.72389984
5978	LBF	North Platte Regional Airport Lee Bird Field	North America	US	United States	Nebraska	North Platte	41.12620163	-100.6839981
5979	IKB	Wilkes County Airport	North America	US	United States	North Carolina	North Wilkesboro	36.22280121	-81.09829712
5980	ORT	Northway Airport	North America	US	United States	Alaska	Northway	62.9612999	-141.9290009
5981	OIC	Lt Warren Eaton Airport	North America	US	United States	New York	Norwich	42.5666008	-75.52410126
5982	OWD	Norwood Memorial Airport	North America	US	United States	Massachusetts	Norwood	42.19049835	-71.17289734
5983	NOT	Marin County Airport - Gnoss Field	North America	US	United States	California	Novato	38.14360046	-122.5559998
5984	DQH	Alpine Airstrip	North America	US	United States	Alaska	Nuiqsut	70.344299	-150.945007
5985	NUI	Nuiqsut Airport	North America	US	United States	Alaska	Nuiqsut	70.209999	-151.005998
5986	NUL	Nulato Airport	North America	US	United States	Alaska	Nulato	64.729301	-158.074005
5987	SXP	Nunam Iqua Airport	North America	US	United States	Alaska	Nunam Iqua	62.520599	-164.848006
5988	NUP	Nunapitchuk Airport	North America	US	United States	Alaska	Nunapitchuk	60.905591	-162.440454
5989	ZNC	Nyac Airport	North America	US	United States	Alaska	Nyac	60.98070145	-159.9940033
5990	ONL	The O'Neill Municipal John L Baker Field	North America	US	United States	Nebraska	O'Neill	42.469898	-98.688103
5991	ODW	AJ Eisenberg Airport	North America	US	United States	Washington	Oak Harbor	48.25149918	-122.6740036
5992	NUW	Whidbey Island Naval Air Station (Ault Field)	North America	US	United States	Washington	Oak Harbor	48.351799	-122.655998
5993	ODC	Oakdale Airport	North America	US	United States	California	Oakdale	37.75630188	-120.8000031
5994	OAK	Metropolitan Oakland International Airport	North America	US	United States	California	Oakland	37.721298	-122.221001
5995	OTN	Ed-Air Airport	North America	US	United States	Indiana	Oaktown	38.851782	-87.49987
5996	OCF	Ocala International Airport - Jim Taylor Field	North America	US	United States	Florida	Ocala	29.17259979	-82.22419739
5997	OCE	Ocean City Municipal Airport	North America	US	United States	Maryland	Ocean City	38.3103981	-75.12400055
5998	OCN	Oceanside Municipal Airport	North America	US	United States	California	Oceanside	33.217947	-117.351683
5999	OGA	Searle Field	North America	US	United States	Nebraska	Ogallala	41.11949921	-101.7699966
6000	HIF	Hill Air Force Base	North America	US	United States	Utah	Ogden	41.12403	-111.973086
6001	OGD	Ogden Hinckley Airport	North America	US	United States	Utah	Ogden	41.19589996	-112.012001
6002	OGS	Ogdensburg International Airport	North America	US	United States	New York	Ogdensburg	44.6819	-75.4655
6003	OBE	Okeechobee County Airport	North America	US	United States	Florida	Okeechobee	27.26280022	-80.84980011
6004	TIK	Tinker Air Force Base	North America	US	United States	Oklahoma	Oklahoma City	35.4147	-97.386597
6005	PWA	Wiley Post Airport	North America	US	United States	Oklahoma	Oklahoma City	35.53419876	-97.64710236
6006	OKC	Will Rogers World Airport	North America	US	United States	Oklahoma	Oklahoma City	35.393101	-97.6007
6007	OKM	Okmulgee Regional Airport	North America	US	United States	Oklahoma	Okmulgee	35.66809845	-95.94869995
6008	OJC	Johnson County Executive Airport	North America	US	United States	Kansas	Olathe	38.84759903	-94.73760223
6009	JCI	New Century Aircenter Airport	North America	US	United States	Kansas	Olathe	38.83089828	-94.89029694
6010	OLH	Old Harbor Airport	North America	US	United States	Alaska	Old Harbor	57.218102	-153.270004
6011	OLD	Dewitt Field - Old Town Municipal Airport	North America	US	United States	Maine	Old Town	44.952801	-68.674301
6012	KOY	Olga Bay Seaplane Base	North America	US	United States	Alaska	Olga Bay	57.16149902	-154.2299957
6013	OLV	Olive Branch Airport	North America	US	United States	Mississippi	Olive Branch	34.97869873	-89.78690338
6014	GMV	Monument Valley Airport	North America	US	United States	Utah	Oljato-Monument Valley	37.015868	-110.202031
6015	OLM	Olympia Regional Airport	North America	US	United States	Washington	Olympia	46.9693985	-122.9029999
6016	OMA	Eppley Airfield	North America	US	United States	Nebraska	Omaha	41.3032	-95.894096
6017	OFF	Offutt Air Force Base	North America	US	United States	Nebraska	Omaha	41.11830139	-95.91249847
6018	OMK	Omak Airport	North America	US	United States	Washington	Omak	48.46440125	-119.5179977
6019	ONT	Ontario International Airport	North America	US	United States	California	Ontario	34.05599976	-117.6009979
6020	ONO	Ontario Municipal Airport	North America	US	United States	Oregon	Ontario	44.02050018	-117.0139999
6081	CNE	Fremont County Airport	North America	US	United States	Colorado	Penrose	38.428534	-105.106299
6021	IUA	Canandaigua Airport	North America	US	United States	New York	Ontario County IDA	42.908902	-77.325226
6022	OGB	Orangeburg Municipal Airport	North America	US	United States	South Carolina	Orangeburg	33.45679855	-80.85949707
6023	ISM	Kissimmee Gateway Airport	North America	US	United States	Florida	Orlando	28.28980064	-81.43710327
6024	ORL	Orlando Executive Airport	North America	US	United States	Florida	Orlando	28.5455	-81.332901
6025	MCO	Orlando International Airport	North America	US	United States	Florida	Orlando	28.42939949	-81.30899811
6026	SFB	Orlando Sanford International Airport	North America	US	United States	Florida	Orlando	28.77759933	-81.23750305
6027	OVE	Oroville Municipal Airport	North America	US	United States	California	Oroville	39.4878006	-121.6220016
6028	OEO	L O Simenstad Municipal Airport	North America	US	United States	Wisconsin	Osceola	45.31000137	-92.69190216
6029	OSC	Oscoda Wurtsmith Airport	North America	US	United States	Michigan	Oscoda	44.451599	-83.394096
6030	OKS	Garden County Airport/King Rhiley Field	North America	US	United States	Nebraska	Oshkosh	41.401001	-102.355003
6031	OSH	Wittman Regional Airport	North America	US	United States	Wisconsin	Oshkosh	43.9844017	-88.55699921
6032	OTM	Ottumwa Regional Airport	North America	US	United States	Iowa	Ottumwa	41.106368	-92.449837
6033	KOZ	Ouzinkie Airport	North America	US	United States	Alaska	Ouzinkie	57.925362	-152.496715
6034	OWA	Owatonna Degner Regional Airport	North America	US	United States	Minnesota	Owatonna	44.12340164	-93.26059723
6035	OWB	Owensboro Daviess County Airport	North America	US	United States	Kentucky	Owensboro	37.74010086	-87.16680145
6036	OXC	Waterbury Oxford Airport	North America	US	United States	Connecticut	Oxford	41.47859955	-73.1352005
6037	UOX	University Oxford Airport	North America	US	United States	Mississippi	Oxford	34.38430023	-89.53679657
6038	OXD	Miami University Airport	North America	US	United States	Ohio	Oxford	39.50230026	-84.78440094
6039	OXR	Oxnard Airport	North America	US	United States	California	Oxnard	34.20080185	-119.2070007
6040	OZA	Ozona Municipal Airport	North America	US	United States	Texas	Ozona	30.73530006	-101.2030029
6041	PFC	Pacific City State Airport	North America	US	United States	Oregon	Pacific City	45.19979858	-123.961998
6042	PAH	Barkley Regional Airport	North America	US	United States	Kentucky	Paducah	37.06079865	-88.77380371
6043	PGA	Page Municipal Airport	North America	US	United States	Arizona	Page	36.92610168	-111.447998
6044	PGO	Stevens Field	North America	US	United States	Colorado	Pagosa Springs	37.28630066	-107.0559998
6045	PHK	Palm Beach County Glades Airport	North America	US	United States	Florida	Pahokee	26.78499985	-80.69339752
6046	PSX	Palacios Municipal Airport	North America	US	United States	Texas	Palacios	28.72750092	-96.25099945
6047	PSN	Palestine Municipal Airport	North America	US	United States	Texas	Palestine	31.77969933	-95.70629883
6048	UDD	Bermuda Dunes Airport	North America	US	United States	California	Palm Springs	33.74840164	-116.2750015
6049	TRM	Jacqueline Cochran Regional Airport	North America	US	United States	California	Palm Springs	33.62670135	-116.1600037
6050	PSP	Palm Springs International Airport	North America	US	United States	California	Palm Springs	33.8297	-116.507004
6051	PMD	Palmdale Regional Airport / USAF Plant 42 Airport	North America	US	United States	California	Palmdale	34.629398	-118.084999
6052	PAQ	Warren "Bud" Woods Palmer Municipal Airport	North America	US	United States	Alaska	Palmer	61.594898	-149.08901
6053	PAO	Palo Alto Airport of Santa Clara County	North America	US	United States	California	Palo Alto	37.46110153	-122.1149979
6054	PPA	Perry Lefors Field	North America	US	United States	Texas	Pampa	35.61299896	-100.9960022
6055	PAM	Tyndall Air Force Base	North America	US	United States	Florida	Panama City	30.069599	-85.575401
6056	ECP	Northwest Florida Beaches International Airport	North America	US	United States	Florida	Panama City Beach	30.357106	-85.795414
6057	PNU	Panguitch Municipal Airport	North America	US	United States	Utah	Panguitch	37.84519958	-112.3919983
6058	WPO	North Fork Valley Airport	North America	US	United States	Colorado	Paonia	38.83169937	-107.6460037
6059	PGR	Kirk Field	North America	US	United States	Arkansas	Paragould	36.06290054	-90.50779724
6060	PHT	Henry County Airport	North America	US	United States	Tennessee	Paris	36.33819962	-88.38289642
6061	PRX	Cox Field	North America	US	United States	Texas	Paris	33.63660049	-95.45079803
6062	PKF	Park Falls Municipal Airport	North America	US	United States	Wisconsin	Park Falls	45.95500183	-90.42440033
6063	PKD	Park Rapids Municipal Konshok Field	North America	US	United States	Minnesota	Park Rapids	46.9006	-95.073095
6064	PKB	Mid Ohio Valley Regional Airport	North America	US	United States	West Virginia	Parkersburg	39.3451004	-81.43920135
6065	PPF	Tri-City Airport	North America	US	United States	Kansas	Parsons	37.32989883	-95.5062027
6066	PGL	Trent Lott International Airport	North America	US	United States	Mississippi	Pascagoula	30.46279907	-88.52919769
6067	PSC	Tri Cities Airport	North America	US	United States	Washington	Pasco	46.26470184	-119.1190033
6068	PRB	Paso Robles Municipal Airport	North America	US	United States	California	Paso Robles	35.67290115	-120.6269989
6069	PTN	Harry P Williams Memorial Airport	North America	US	United States	Louisiana	Patterson	29.70949936	-91.33899689
6070	NHK	Patuxent River Naval Air Station (Trapnell Field)	North America	US	United States	Maryland	Patuxent River	38.285999	-76.411797
6071	SFZ	North Central State Airport	North America	US	United States	Rhode Island	Pawtucket	41.92079926	-71.49140167
6072	PJB	Payson Airport	North America	US	United States	Arizona	Payson	34.25680161	-111.3389969
6073	GCW	Grand Canyon West Airport	North America	US	United States	Arizona	Peach Springs	35.985787	-113.817072
6074	PEQ	Pecos Municipal Airport	North America	US	United States	Texas	Pecos	31.38240051	-103.5110016
6075	PDB	Pedro Bay Airport	North America	US	United States	Alaska	Pedro Bay	59.78960037	-154.1239929
6076	PEC	Pelican Seaplane Base	North America	US	United States	Alaska	Pelican	57.9552002	-136.2359924
6077	PLR	St Clair County Airport	North America	US	United States	Alabama	Pell City	33.55879974	-86.24909973
6078	PLN	Pellston Regional Airport of Emmet County Airport	North America	US	United States	Michigan	Pellston	45.57089996	-84.79669952
6079	PMB	Pembina Municipal Airport	North America	US	United States	North Dakota	Pembina	48.94250107	-97.24079895
6080	PDT	Eastern Oregon Regional At Pendleton Airport	North America	US	United States	Oregon	Pendleton	45.69509888	-118.8410034
6082	NPA	Naval Air Station Pensacola Forrest Sherman Field	North America	US	United States	Florida	Pensacola	30.352699	-87.318604
6083	PNS	Pensacola International Airport	North America	US	United States	Florida	Pensacola	30.4734	-87.1866
6084	PIA	General Wayne A. Downing Peoria International Airport	North America	US	United States	Illinois	Peoria	40.6642	-89.693298
6085	FPY	Perry-Foley Airport	North America	US	United States	Florida	Perry	30.0693	-83.580597
6086	PRO	Perry Municipal Airport	North America	US	United States	Iowa	Perry	41.82799911	-94.15989685
6087	PYL	Perry Island Seaplane Base	North America	US	United States	Alaska	Perry Island	60.68529892	-147.9190063
6088	KPV	Perryville Airport	North America	US	United States	Alaska	Perryville	55.905725	-159.162188
6089	VYS	Illinois Valley Regional Airport-Walter A Duncan Field	North America	US	United States	Illinois	Peru	41.351898	-89.153099
6090	GUS	Grissom Air Reserve Base	North America	US	United States	Indiana	Peru	40.648102	-86.1521
6091	PSG	Petersburg James A Johnson Airport	North America	US	United States	Alaska	Petersburg	56.80170059	-132.9450073
6092	PTB	Dinwiddie County Airport	North America	US	United States	Virginia	Petersburg	37.18379974	-77.50740051
6093	PGC	Grant County Airport	North America	US	United States	West Virginia	Petersburg	38.99489975	-79.14589691
6094	PNE	Northeast Philadelphia Airport	North America	US	United States	Pennsylvania	Philadelphia	40.081902	-75.010597
6095	PHL	Philadelphia International Airport	North America	US	United States	Pennsylvania	Philadelphia	39.87189865	-75.2410965
6096	BBX	Wings Field	North America	US	United States	Pennsylvania	Philadelphia	40.13750076	-75.26509857
6097	PHP	Philip Airport	North America	US	United States	South Dakota	Philip	44.04859924	-101.598999
6098	DVT	Phoenix Deer Valley Airport	North America	US	United States	Arizona	Phoenix	33.68830109	-112.0830002
6099	PHX	Phoenix Sky Harbor International Airport	North America	US	United States	Arizona	Phoenix	33.435302	-112.005905
6100	LQK	Pickens County Airport	North America	US	United States	South Carolina	Pickens	34.81000137	-82.70290375
6101	PIR	Pierre Regional Airport	North America	US	United States	South Dakota	Pierre	44.38270187	-100.2860031
6102	PVL	Pike County-Hatcher Field	North America	US	United States	Kentucky	Pikeville	37.5617981	-82.56639862
6103	PIP	Pilot Point Airport	North America	US	United States	Alaska	Pilot Point	57.58039856	-157.5720062
6104	UGB	Ugashik Bay Airport	North America	US	United States	Alaska	Pilot Point	57.424052	-157.74479
6105	PQS	Pilot Station Airport	North America	US	United States	Alaska	Pilot Station	61.934601	-162.899994
6106	PBF	Pine Bluff Regional Airport, Grider Field	North America	US	United States	Arkansas	Pine Bluff	34.1731	-91.9356
6107	PIM	Harris County Airport	North America	US	United States	Georgia	Pine Mountain	32.84069824	-84.88240051
6108	XPR	Pine Ridge Airport	North America	US	United States	South Dakota	Pine Ridge	43.02249908	-102.5110016
6109	PWY	Ralph Wenz Field	North America	US	United States	Wyoming	Pinedale	42.79550171	-109.8069992
6110	AGC	Allegheny County Airport	North America	US	United States	Pennsylvania	Pittsburgh	40.354401	-79.930199
6111	PIT	Pittsburgh International Airport	North America	US	United States	Pennsylvania	Pittsburgh	40.49150085	-80.23290253
6112	PSF	Pittsfield Municipal Airport	North America	US	United States	Massachusetts	Pittsfield	42.4268	-73.2929
6113	PVF	Placerville Airport	North America	US	United States	California	Placerville	38.7242012	-120.7529984
6114	PVW	Hale County Airport	North America	US	United States	Texas	Plainview	34.16809845	-101.7170029
6115	PTU	Platinum Airport	North America	US	United States	Alaska	Platinum	59.01139832	-161.8200073
6116	PBG	Plattsburgh International Airport	North America	US	United States	New York	Plattsburgh	44.65090179	-73.4681015
6117	PWD	Sher-Wood Airport	North America	US	United States	Montana	Plentywood	48.79029846	-104.5339966
6118	PLY	Plymouth Municipal Airport	North America	US	United States	Indiana	Plymouth	41.36510086	-86.30049896
6119	PYM	Plymouth Municipal Airport	North America	US	United States	Massachusetts	Plymouth	41.909	-70.728798
6120	PIH	Pocatello Regional Airport	North America	US	United States	Idaho	Pocatello	42.90980148	-112.5960007
6121	KPB	Point Baker Seaplane Base	North America	US	United States	Alaska	Point Baker	56.35189819	-133.6230011
6122	PHO	Point Hope Airport	North America	US	United States	Alaska	Point Hope	68.34880066	-166.798996
6123	PIZ	Point Lay LRRS Airport	North America	US	United States	Alaska	Point Lay	69.73290253	-163.0050049
6124	LNI	Point Lonely Short Range Radar Site Airfield	North America	US	United States	Alaska	Point Lonely	70.911118	-153.237766
6125	NTD	Point Mugu Naval Air Station (Naval Base Ventura Co)	North America	US	United States	California	Point Mugu	34.12030029	-119.1210022
6126	PXL	Polacca Airport	North America	US	United States	Arizona	Polacca	35.79169846	-110.4229965
6127	PPM	Pompano Beach Airpark	North America	US	United States	Florida	Pompano Beach	26.24710083	-80.11109924
6128	PNC	Ponca City Regional Airport	North America	US	United States	Oklahoma	Ponca City	36.73199844	-97.09980011
6129	PTK	Oakland County International Airport	North America	US	United States	Michigan	Pontiac	42.66550064	-83.42009735
6130	POF	Poplar Bluff Municipal Airport	North America	US	United States	Missouri	Poplar Bluff	36.77389908	-90.32489777
6131	PCU	Poplarville Pearl River County Airport	North America	US	United States	Mississippi	Poplarville	30.7859993	-89.50450134
6132	PTD	Port Alexander Seaplane Base	North America	US	United States	Alaska	Port Alexander	56.24679947	-134.647995
6133	PTC	Port Alice Seaplane Base	North America	US	United States	Alaska	Port Alice	55.803	-133.597
6134	PTA	Port Alsworth Airport	North America	US	United States	Alaska	Port Alsworth	60.201681	-154.325863
6135	CLM	William R Fairchild International Airport	North America	US	United States	Washington	Port Angeles	48.12020111	-123.5
6136	KPY	Port Bailey Seaplane Base	North America	US	United States	Alaska	Port Bailey	57.93009949	-153.0410004
6137	KPC	Port Clarence Coast Guard Station	North America	US	United States	Alaska	Port Clarence	65.25370026	-166.8589935
6138	PGM	Port Graham Airport	North America	US	United States	Alaska	Port Graham	59.34830093	-151.8320007
6139	PTH	Port Heiden Airport	North America	US	United States	Alaska	Port Heiden	56.959359	-158.62106
6140	PHN	St Clair County International Airport	North America	US	United States	Michigan	Port Huron	42.9109993	-82.52890015
6141	ORI	Port Lions Airport	North America	US	United States	Alaska	Port Lions	57.885399	-152.845993
6142	PPV	Port Protection Seaplane Base	North America	US	United States	Alaska	Port Protection	56.3288002	-133.6100006
6143	TWD	Jefferson County International Airport	North America	US	United States	Washington	Port Townsend	48.05379868	-122.810997
6144	PWR	Port Walter Seaplane Base	North America	US	United States	Alaska	Port Walter	56.381001	-134.651001
6145	KPR	Port Williams Seaplane Base	North America	US	United States	Alaska	Port Williams	58.49010086	-152.5820007
6146	PCA	Portage Creek Airport	North America	US	United States	Alaska	Portage Creek	58.9065	-157.714
6147	PTV	Porterville Municipal Airport	North America	US	United States	California	Porterville	36.02959824	-119.0630035
6148	PWM	Portland International Jetport	North America	US	United States	Maine	Portland	43.646198	-70.309303
6149	HIO	Portland Hillsboro Airport	North America	US	United States	Oregon	Portland	45.540401	-122.949997
6150	PDX	Portland International Airport	North America	US	United States	Oregon	Portland	45.58869934	-122.5979996
6151	TTD	Portland Troutdale Airport	North America	US	United States	Oregon	Portland	45.54940033	-122.401001
6152	PSM	Portsmouth International at Pease Airport	North America	US	United States	New Hampshire	Portsmouth	43.07789993	-70.82330322
6153	PMH	Greater Portsmouth Regional Airport	North America	US	United States	Ohio	Portsmouth	38.84049988	-82.84729767
6154	PTW	Heritage Field	North America	US	United States	Pennsylvania	Pottstown	40.239601	-75.556702
6155	POU	Dutchess County Airport	North America	US	United States	New York	Poughkeepsie	41.62659836	-73.88420105
6156	PUL	Port of Poulsbo Marina Moorage Seaplane Base	North America	US	United States	Washington	Poulsbo	47.73400116	-122.6470032
6157	POY	Powell Municipal Airport	North America	US	United States	Wyoming	Powell	44.86719894	-108.7929993
6158	PCD	Prairie Du Chien Municipal Airport	North America	US	United States	Wisconsin	Prairie Du Chien	43.01929855	-91.123703
6159	PTT	Pratt Regional Airport	North America	US	United States	Kansas	Pratt	37.70159912	-98.74690247
6160	PRW	Prentice Airport	North America	US	United States	Wisconsin	Prentice	45.542999	-90.279297
6161	PRC	Prescott International Airport - Ernest A. Love Field	North America	US	United States	Arizona	Prescott	34.654499	-112.419998
6162	PQI	Presque Isle International Airport	North America	US	United States	Maine	Presque Isle	46.688999	-68.0448
6163	PUC	Carbon County Regional/Buck Davis Field	North America	US	United States	Utah	Price	39.61389923	-110.7509995
6164	PNN	Princeton Municipal Airport	North America	US	United States	Maine	Princeton	45.20069885	-67.56439972
6165	PCT	Princeton Airport	North America	US	United States	New Jersey	Princeton/Rocky Hill	40.39920044	-74.6588974
6166	PRZ	Prineville Airport	North America	US	United States	Oregon	Prineville	44.28699875	-120.9039993
6167	PPC	Prospect Creek Airport	North America	US	United States	Alaska	Prospect Creek	66.81410217	-150.6439972
6168	PVD	Theodore Francis Green State Airport	North America	US	United States	Rhode Island	Providence	41.725038	-71.425668
6169	PVC	Provincetown Municipal Airport	North America	US	United States	Massachusetts	Provincetown	42.07189941	-70.2213974
6170	PVU	Provo-Utah Lake International Airport	North America	US	United States	Utah	Provo	40.2192	-111.723
6171	PUB	Pueblo Memorial Airport	North America	US	United States	Colorado	Pueblo	38.289101	-104.497002
6172	PUW	Pullman Moscow Regional Airport	North America	US	United States	Washington	Pullman/Moscow	46.7439	-117.110001
6173	PGD	Charlotte County Airport	North America	US	United States	Florida	Punta Gorda	26.9202	-81.990501
6174	UKT	Quakertown Airport	North America	US	United States	Pennsylvania	Quakertown	40.43519974	-75.38189697
6175	UIL	Quillayute Airport	North America	US	United States	Washington	Quillayute	47.93659973	-124.5630035
6176	GNF	Gansner Field	North America	US	United States	California	Quincy	39.943902	-120.945
6177	UIN	Quincy Regional Baldwin Field	North America	US	United States	Illinois	Quincy	39.94269943	-91.19460297
6178	KWN	Quinhagak Airport	North America	US	United States	Alaska	Quinhagak	59.7551	-161.845
6179	RAC	John H Batten Airport	North America	US	United States	Wisconsin	Racine	42.76060104	-87.81520081
6180	RDU	Raleigh Durham International Airport	North America	US	United States	North Carolina	Raleigh/Durham	35.87760162	-78.78749847
6181	RMP	Rampart Airport	North America	US	United States	Alaska	Rampart	65.507896	-150.141007
6182	RGR	Ranger Municipal Airport	North America	US	United States	Texas	Ranger	32.45259857	-98.68280029
6183	RCA	Ellsworth Air Force Base	North America	US	United States	South Dakota	Rapid City	44.14500046	-103.1039963
6184	RAP	Rapid City Regional Airport	North America	US	United States	South Dakota	Rapid City	44.04529953	-103.0569992
6185	RTN	Raton Municipal Airport / Crews Field	North America	US	United States	New Mexico	Raton	36.741501	-104.501999
6186	RWL	Rawlins Municipal Airport/Harvey Field	North America	US	United States	Wyoming	Rawlins	41.80559921	-107.1999969
6187	RDG	Reading Regional Airport (Carl A Spaatz Field)	North America	US	United States	Pennsylvania	Reading	40.378502	-75.965202
6188	RBL	Red Bluff Municipal Airport	North America	US	United States	California	Red Bluff	40.15069962	-122.2519989
6189	RDV	Red Devil Airport	North America	US	United States	Alaska	Red Devil	61.7881012	-157.3500061
6190	RDB	Red Dog Airport	North America	US	United States	Alaska	Red Dog	68.03209686	-162.8990021
6191	BZF	Benton Field	North America	US	United States	California	Redding	40.57490158	-122.4079971
6192	RDD	Redding Municipal Airport	North America	US	United States	California	Redding	40.50899887	-122.2929993
6193	RDM	Roberts Field	North America	US	United States	Oregon	Redmond	44.2541008	-121.1500015
6194	HUA	Redstone Army Air Field	North America	US	United States	Alabama	Redstone Arsnl Huntsville	34.67869949	-86.68479919
6195	RWF	Redwood Falls Municipal Airport	North America	US	United States	Minnesota	Redwood Falls	44.54719925	-95.08229828
6196	RCT	Nartron Field	North America	US	United States	Michigan	Reed City	43.90000153	-85.51670074
6197	RED	Mifflin County Airport	North America	US	United States	Pennsylvania	Reedsville	40.67739868	-77.62680054
6198	RFG	Rooke Field	North America	US	United States	Texas	Refugio	28.2936	-97.322998
6199	RNO	Reno Tahoe International Airport	North America	US	United States	Nevada	Reno	39.49909973	-119.7679977
6200	RNZ	Jasper County Airport	North America	US	United States	Indiana	Rensselaer	40.94789886	-87.18260193
6201	RNT	Renton Municipal Airport	North America	US	United States	Washington	Renton	47.49309921	-122.2160034
6202	RXE	Rexburg Madison County Airport	North America	US	United States	Idaho	Rexburg	43.8339	-111.805002
6203	RHI	Rhinelander Oneida County Airport	North America	US	United States	Wisconsin	Rhinelander	45.63119888	-89.46749878
6204	RIE	Rice Lake Regional Airport - Carl's Field	North America	US	United States	Wisconsin	Rice Lake	45.423024	-91.773127
6205	OAJ	Albert J Ellis Airport	North America	US	United States	North Carolina	Richlands	34.829201	-77.612099
6206	RIC	Richmond International Airport	North America	US	United States	Virginia	Richmond	37.50519943	-77.31970215
6207	RIL	Garfield County Regional Airport	North America	US	United States	Colorado	Rifle	39.526299	-107.726997
6208	RIV	March Air Reserve Base	North America	US	United States	California	Riverside	33.880699	-117.259003
6209	RAL	Riverside Municipal Airport	North America	US	United States	California	Riverside	33.9519	-117.445
6210	RIW	Riverton Regional Airport	North America	US	United States	Wyoming	Riverton	43.06420136	-108.4599991
6211	ROA	Roanoke???Blacksburg Regional Airport	North America	US	United States	Virginia	Roanoke	37.3255	-79.975403
6212	RCE	Roche Harbor Airport	North America	US	United States	Washington	Roche Harbor	48.61230087	-123.1389999
6213	RCR	Fulton County Airport	North America	US	United States	Indiana	Rochester	41.06560135	-86.18170166
6214	RST	Rochester International Airport	North America	US	United States	Minnesota	Rochester	43.908298	-92.5
6215	ROC	Greater Rochester International Airport	North America	US	United States	New York	Rochester	43.1189	-77.672401
6216	SQI	Whiteside County Airport - Joseph H Bittorf Field	North America	US	United States	Illinois	Rock Falls	41.742802	-89.6763
6217	RKH	Rock Hill - York County Airport	North America	US	United States	South Carolina	Rock Hill	34.9878006	-81.05719757
6218	RKS	Southwest Wyoming Regional Airport	North America	US	United States	Wyoming	Rock Springs	41.5942	-109.065001
6219	RCK	H H Coffield Regional Airport	North America	US	United States	Texas	Rockdale	30.63159943	-96.98970032
6220	RKD	Knox County Regional Airport	North America	US	United States	Maine	Rockland	44.06010056	-69.09919739
6221	RKP	Aransas County Airport	North America	US	United States	Texas	Rockport	28.08679962	-97.04460144
6222	RKW	Rockwood Municipal Airport	North America	US	United States	Tennessee	Rockwood	35.92229843	-84.68969727
6223	RWI	Rocky Mount Wilson Regional Airport	North America	US	United States	North Carolina	Rocky Mount	35.85630035	-77.89189911
6224	ROG	Rogers Municipal Airport-Carter Field	North America	US	United States	Arkansas	Rogers	36.37229919	-94.10690308
6225	RLA	Rolla Downtown Airport	North America	US	United States	Missouri	Rolla	37.93569946	-91.81349945
6226	VIH	Rolla National Airport	North America	US	United States	Missouri	Rolla/Vichy	38.12739944	-91.76950073
6227	RMG	Richard B Russell Airport	North America	US	United States	Georgia	Rome	34.3506012	-85.15799713
6228	RME	Griffiss International Airport	North America	US	United States	New York	Rome	43.23379898	-75.40699768
6229	REO	Rome State Airport	North America	US	United States	Oregon	Rome	42.57770157	-117.8850021
6230	ROL	Roosevelt Municipal Airport	North America	US	United States	Utah	Roosevelt	40.278301	-110.051003
6231	RSJ	Rosario Seaplane Base	North America	US	United States	Washington	Rosario	48.64569855	-122.8679962
6232	ROX	Roseau Municipal Rudy Billberg Field	North America	US	United States	Minnesota	Roseau	48.85599899	-95.6969986
6233	RBG	Roseburg Regional Airport	North America	US	United States	Oregon	Roseburg	43.23880005	-123.3560028
6234	ROW	Roswell Air Center Airport	North America	US	United States	New Mexico	Roswell	33.301601	-104.530998
6235	RPX	Roundup Airport	North America	US	United States	Montana	Roundup	46.475095	-108.541497
6236	RSX	Rouses Point Seaplane Base	North America	US	United States	New York	Rouses Point	44.99169922	-73.3635025
6237	RBY	Ruby Airport	North America	US	United States	Alaska	Ruby	64.72720337	-155.4700012
6238	RSL	Russell Municipal Airport	North America	US	United States	Kansas	Russell	38.87210083	-98.8117981
6239	RSH	Russian Mission Airport	North America	US	United States	Alaska	Russian Mission	61.77888489	-161.319458
6240	RSN	Ruston Regional Airport	North America	US	United States	Louisiana	Ruston	32.514187	-92.588517
6241	RUT	Rutland - Southern Vermont Regional Airport	North America	US	United States	Vermont	Rutland	43.5294	-72.9496
6242	MCC	Mc Clellan Airfield	North America	US	United States	California	Sacramento	38.66759872	-121.401001
6243	SAC	Sacramento Executive Airport	North America	US	United States	California	Sacramento	38.51250076	-121.4929962
6244	SMF	Sacramento International Airport	North America	US	United States	California	Sacramento	38.69540024	-121.5910034
6245	MHR	Sacramento Mather Airport	North America	US	United States	California	Sacramento	38.553902	-121.297997
6246	SAD	Safford Regional Airport	North America	US	United States	Arizona	Safford	32.85480118	-109.6350021
6247	MBS	MBS International Airport	North America	US	United States	Michigan	Saginaw	43.532902	-84.079597
6248	SGW	Saginaw Seaplane Base	North America	US	United States	Alaska	Saginaw Bay	56.88629913	-134.1580048
6249	STC	Saint Cloud Regional Airport	North America	US	United States	Minnesota	Saint Cloud	45.5466	-94.059898
6250	SLO	Salem???Leckrone Airport	North America	US	United States	Illinois	Salem	38.642899	-88.964203
6251	SLE	Salem Municipal Airport/McNary Field	North America	US	United States	Oregon	Salem	44.90950012	-123.0029984
6252	SLT	Salida Airport - Harriet Alexander Field	North America	US	United States	Colorado	Salida	38.5383	-106.049004
6253	SLN	Salina Municipal Airport	North America	US	United States	Kansas	Salina	38.79100037	-97.65219879
6254	SBO	Salina Gunnison Airport	North America	US	United States	Utah	Salina	39.02909851	-111.8379974
6255	SNS	Salinas Municipal Airport	North America	US	United States	California	Salinas	36.66279984	-121.6060028
6256	SBY	Salisbury Ocean City Wicomico Regional Airport	North America	US	United States	Maryland	Salisbury	38.34049988	-75.51029968
6257	SRW	Mid-Carolina Regional Airport	North America	US	United States	North Carolina	Salisbury	35.645901	-80.520302
6258	SMN	Lemhi County Airport	North America	US	United States	Idaho	Salmon	45.12379837	-113.8809967
6259	SLC	Salt Lake City International Airport	North America	US	United States	Utah	Salt Lake City	40.785749	-111.979746
6260	SAS	Salton Sea Airport	North America	US	United States	California	Salton City	33.24140167	-115.9520035
6261	SJT	San Angelo Regional Mathis Field	North America	US	United States	Texas	San Angelo	31.35770035	-100.4960022
6262	SKF	Lackland Air Force Base	North America	US	United States	Texas	San Antonio	29.38419914	-98.58110046
6263	SAT	San Antonio International Airport	North America	US	United States	Texas	San Antonio	29.533701	-98.469803
6264	SSF	Stinson Municipal Airport	North America	US	United States	Texas	San Antonio	29.33699989	-98.47109985
6265	SBD	San Bernardino International Airport	North America	US	United States	California	San Bernardino	34.095402	-117.235001
6266	SQL	San Carlos Airport	North America	US	United States	California	San Carlos	37.51190186	-122.25
6267	SDM	Brown Field Municipal Airport	North America	US	United States	California	San Diego	32.57229996	-116.9800034
6268	NKX	Miramar Marine Corps Air Station - Mitscher Field	North America	US	United States	California	San Diego	32.86840057	-117.1429977
6269	MYF	Montgomery-Gibbs Executive Airport	North America	US	United States	California	San Diego	32.8157	-117.139999
6270	NZY	North Island Naval Air Station-Halsey Field	North America	US	United States	California	San Diego	32.69919968	-117.2149963
6271	SAN	San Diego International Airport	North America	US	United States	California	San Diego	32.73360062	-117.1900024
6272	SEE	Gillespie Field	North America	US	United States	California	San Diego/El Cajon	32.82619858	-116.9720001
6273	SFO	San Francisco International Airport	North America	US	United States	California	San Francisco	37.61899948	-122.375
6274	SJC	Norman Y. Mineta San Jose International Airport	North America	US	United States	California	San Jose	37.362598	-121.929001
6275	RHV	Reid-Hillview Airport of Santa Clara County	North America	US	United States	California	San Jose	37.332901	-121.8190002
6276	UGI	San Juan /Uganik/ Seaplane Base	North America	US	United States	Alaska	San Juan	57.7304	-153.320999
6277	SBP	San Luis County Regional Airport	North America	US	United States	California	San Luis Obispo	35.23680115	-120.6419983
6278	SDP	Sand Point Airport	North America	US	United States	Alaska	Sand Point	55.31499863	-160.522995
6279	SFM	Sanford Seacoast Regional Airport	North America	US	United States	Maine	Sanford	43.39390182	-70.70800018
6280	SNA	John Wayne Airport-Orange County Airport	North America	US	United States	California	Santa Ana	33.675701	-117.867996
6281	SBA	Santa Barbara Municipal Airport	North America	US	United States	California	Santa Barbara	34.42620087	-119.8399963
6282	SZN	Santa Cruz Island Airport	North America	US	United States	California	Santa Cruz Island	34.06007	-119.915229
6283	SAF	Santa Fe Municipal Airport	North America	US	United States	New Mexico	Santa Fe	35.61709976	-106.0889969
6284	SMX	Santa Maria Public Airport Captain G Allan Hancock Field	North America	US	United States	California	Santa Maria	34.898899	-120.457001
6285	SMO	Santa Monica Municipal Airport	North America	US	United States	California	Santa Monica	34.0158	-118.450996
6286	SZP	Santa Paula Airport	North America	US	United States	California	Santa Paula	34.34719849	-119.060997
6287	STS	Charles M. Schulz Sonoma County Airport	North America	US	United States	California	Santa Rosa	38.50899887	-122.8130035
6288	SQA	Santa Ynez Airport	North America	US	United States	California	Santa Ynez	34.60680008	-120.0759964
6289	SLK	Adirondack Regional Airport	North America	US	United States	New York	Saranac Lake	44.38691	-74.204629
6290	SRQ	Sarasota Bradenton International Airport	North America	US	United States	Florida	Sarasota/Bradenton	27.395399	-82.554398
6291	SAA	Shively Field	North America	US	United States	Wyoming	Saratoga	41.444901	-106.823997
6292	CIU	Chippewa County International Airport	North America	US	United States	Michigan	Sault Ste Marie	46.25080109	-84.47239685
6293	SVN	Hunter Army Air Field	North America	US	United States	Georgia	Savannah	32.00999832	-81.14569855
6294	SAV	Savannah Hilton Head International Airport	North America	US	United States	Georgia	Savannah	32.12760162	-81.20210266
6295	SVA	Savoonga Airport	North America	US	United States	Alaska	Savoonga	63.68640137	-170.4929962
6296	CMI	University of Illinois Willard Airport	North America	US	United States	Illinois	Savoy	40.039819	-88.276249
6297	SCM	Scammon Bay Airport	North America	US	United States	Alaska	Scammon Bay	61.84529877	-165.5709991
6298	SCH	Schenectady County Airport	North America	US	United States	New York	Schenectady	42.85250092	-73.92890167
6299	BFF	Western Neb. Rgnl/William B. Heilig Airport	North America	US	United States	Nebraska	Scottsbluff	41.87400055	-103.5960007
6300	SCF	Scottsdale Airport	North America	US	United States	Arizona	Scottsdale	33.6228981	-111.9110031
6301	SCB	Scribner State Airport	North America	US	United States	Nebraska	Scribner	41.61029816	-96.62989807
6302	SYB	Seal Bay Seaplane Base	North America	US	United States	Alaska	Seal Bay	58.373291	-152.201797
6303	BFI	Boeing Field King County International Airport	North America	US	United States	Washington	Seattle	47.529999	-122.302002
6304	LKE	Kenmore Air Harbor Seaplane Base	North America	US	United States	Washington	Seattle	47.62900162	-122.3389969
6305	SEA	Seattle Tacoma International Airport	North America	US	United States	Washington	Seattle	47.449001	-122.308998
6306	SEF	Sebring Regional Airport	North America	US	United States	Florida	Sebring	27.45639992	-81.3423996
6307	DMO	Sedalia Memorial Airport	North America	US	United States	Missouri	Sedalia	38.70740128	-93.17590332
6308	SDX	Sedona Airport	North America	US	United States	Arizona	Sedona	34.84859848	-111.788002
6309	WLK	Selawik Airport	North America	US	United States	Alaska	Selawik	66.600098	-159.985992
6310	SOV	Seldovia Airport	North America	US	United States	Alaska	Seldovia	59.44240189	-151.7039948
6311	SEG	Penn Valley Airport	North America	US	United States	Pennsylvania	Selinsgrove	40.8205986	-76.86389923
6312	SEM	Craig Field	North America	US	United States	Alabama	Selma	32.34389877	-86.9878006
6313	SQV	Sequim Valley Airport	North America	US	United States	Washington	Sequim	48.09809875	-123.1869965
6314	GKT	Gatlinburg-Pigeon Forge Airport	North America	US	United States	Tennessee	Sevierville	35.85779953	-83.52870178
6315	UOS	Franklin County Airport	North America	US	United States	Tennessee	Sewanee	35.20510101	-85.89810181
6316	SWD	Seward Airport	North America	US	United States	Alaska	Seward	60.130478	-149.418612
6317	SER	Freeman Municipal Airport	North America	US	United States	Indiana	Seymour	38.92359924	-85.90740204
6318	MIT	Shafter Airport - Minter Field	North America	US	United States	California	Shafter	35.507401	-119.192002
6319	SHX	Shageluk Airport	North America	US	United States	Alaska	Shageluk	62.69229889	-159.5690002
6320	SKK	Shaktoolik Airport	North America	US	United States	Alaska	Shaktoolik	64.37110138	-161.223999
6321	SNL	Shawnee Regional Airport	North America	US	United States	Oklahoma	Shawnee	35.35789871	-96.94280243
6322	SBM	Sheboygan County Memorial Airport	North America	US	United States	Wisconsin	Sheboygan	43.76959991	-87.85140228
6323	SMU	Sheep Mountain Airport	North America	US	United States	Alaska	Sheep Mountain	61.81200027	-147.5070038
6324	SBX	Shelby Airport	North America	US	United States	Montana	Shelby	48.54069901	-111.8710022
6325	SYI	Bomar Field Shelbyville Municipal Airport	North America	US	United States	Tennessee	Shelbyville	35.56010056	-86.44249725
6326	SHN	Sanderson Field	North America	US	United States	Washington	Shelton	47.23360062	-123.1480026
6327	SYA	Eareckson Air Station	North America	US	United States	Alaska	Shemya	52.71229935	174.1139984
6328	SHR	Sheridan County Airport	North America	US	United States	Wyoming	Sheridan	44.76919937	-106.9800034
6329	PNX	North Texas Regional Airport/Perrin Field	North America	US	United States	Texas	Sherman/Denison	33.71409988	-96.67369843
6330	WSH	Brookhaven Airport	North America	US	United States	New York	Shirley	40.82189941	-72.86940002
6331	SHH	Shishmaref Airport	North America	US	United States	Alaska	Shishmaref	66.249604	-166.089112
6332	SOW	Show Low Regional Airport	North America	US	United States	Arizona	Show Low	34.265049	-110.007084
6333	DTN	Shreveport Downtown Airport	North America	US	United States	Louisiana	Shreveport	32.54019928	-93.74500275
6334	SHV	Shreveport Regional Airport	North America	US	United States	Louisiana	Shreveport	32.446602	-93.8256
6335	SHG	Shungnak Airport	North America	US	United States	Alaska	Shungnak	66.88809967	-157.1620026
6336	SDY	Sidney - Richland Regional Airport	North America	US	United States	Montana	Sidney	47.706902	-104.193001
6337	SNY	Sidney Municipal-Lloyd W Carr Field	North America	US	United States	Nebraska	Sidney	41.10129929	-102.9850006
6338	SXY	Sidney Municipal Airport	North America	US	United States	New York	Sidney	42.30260086	-75.41600037
6339	SIK	Sikeston Memorial Municipal Airport	North America	US	United States	Missouri	Sikeston	36.89889908	-89.5617981
6340	SLG	Smith Field	North America	US	United States	Arkansas	Siloam Springs	36.19189835	-94.48999786
6341	SVC	Grant County Airport	North America	US	United States	New Mexico	Silver City	32.632293	-108.154263
6342	SUX	Sioux Gateway Airport / Brigadier General Bud Day Field	North America	US	United States	Iowa	Sioux City	42.397605	-96.382237
6343	FSD	Sioux Falls Regional Airport / Joe Foss Field	North America	US	United States	South Dakota	Sioux Falls	43.585463	-96.741152
6344	SIT	Sitka Rocky Gutierrez Airport	North America	US	United States	Alaska	Sitka	57.04710007	-135.3619995
6345	SGY	Skagway Airport	North America	US	United States	Alaska	Skagway	59.46009827	-135.3159943
6346	SKW	Skwentna Airport	North America	US	United States	Alaska	Skwentna	61.96530151	-151.1909943
6347	NSL	Slayton Municipal Airport	North America	US	United States	Minnesota	Slayton	43.98680115	-95.7826004
6348	SLQ	Sleetmute Airport	North America	US	United States	Alaska	Sleetmute	61.70050049	-157.1660004
6349	MQY	Smyrna Airport	North America	US	United States	Tennessee	Smyrna	36.00899887	-86.52010345
6350	SNK	Winston Field	North America	US	United States	Texas	Snyder	32.690212	-100.948918
6351	SXQ	Soldotna Airport	North America	US	United States	Alaska	Soldotna	60.474935	-151.038471
6352	SOL	Solomon State Field	North America	US	United States	Alaska	Solomon	64.5605	-164.4457
6353	SME	Lake Cumberland Regional Airport	North America	US	United States	Kentucky	Somerset	37.05339813	-84.61589813
6354	SBN	South Bend Regional Airport	North America	US	United States	Indiana	South Bend	41.708698	-86.317299
6355	BTV	Burlington International Airport	North America	US	United States	Vermont	South Burlington	44.471901	-73.153297
6356	TVL	Lake Tahoe Airport	North America	US	United States	California	South Lake Tahoe	38.89390182	-119.9950027
6357	WSN	South Naknek Number 2 Airport	North America	US	United States	Alaska	South Naknek	58.703202	-157.006373
6358	SVW	Sparrevohn LRRS Airport	North America	US	United States	Alaska	Sparrevohn	61.09740067	-155.5740051
6359	SAR	Sparta Community Hunter Field	North America	US	United States	Illinois	Sparta	38.14889908	-89.69869995
6360	CMY	Sparta Fort Mc Coy Airport	North America	US	United States	Wisconsin	Sparta	43.958302	-90.7379
6361	SPA	Spartanburg Downtown Memorial Airport	North America	US	United States	South Carolina	Spartanburg	34.91569901	-81.95649719
6362	SPF	Black Hills Airport-Clyde Ice Field	North America	US	United States	South Dakota	Spearfish	44.4803009	-103.7829971
6363	SPW	Spencer Municipal Airport	North America	US	United States	Iowa	Spencer	43.16550064	-95.20279694
6364	RTL	Spirit Lake Municipal Airport	North America	US	United States	Iowa	Spirit Lake	43.38750076	-95.1391983
6365	SKA	Fairchild Air Force Base	North America	US	United States	Washington	Spokane	47.615101	-117.655998
6366	SFF	Felts Field	North America	US	United States	Washington	Spokane	47.68280029	-117.322998
6367	GEG	Spokane International Airport	North America	US	United States	Washington	Spokane	47.6199	-117.533997
6368	SPZ	Springdale Municipal Airport	North America	US	United States	Arkansas	Springdale	36.17639923	-94.11930084
6369	SPI	Abraham Lincoln Capital Airport	North America	US	United States	Illinois	Springfield	39.844101	-89.677902
6370	SGF	Springfield Branson National Airport	North America	US	United States	Missouri	Springfield	37.245701	-93.388603
6371	SGH	Springfield-Beckley Municipal Airport	North America	US	United States	Ohio	Springfield	39.84030151	-83.84020233
6372	VSF	Hartness State (Springfield) Airport	North America	US	United States	Vermont	Springfield	43.34360123	-72.51730347
6373	CEF	Westover ARB/Metropolitan Airport	North America	US	United States	Massachusetts	Springfield/Chicopee	42.19400024	-72.53479767
6374	UST	Northeast Florida Regional Airport	North America	US	United States	Florida	St Augustine	29.9592	-81.339798
6375	STG	St George Airport	North America	US	United States	Alaska	St George	56.5783	-169.662003
6376	SGU	St George Regional Airport	North America	US	United States	Utah	St George	37.036389	-113.510306
6377	SJN	St Johns Industrial Air Park	North America	US	United States	Arizona	St Johns	34.51860046	-109.3789978
6378	STJ	Rosecrans Memorial Airport	North America	US	United States	Missouri	St Joseph	39.77190018	-94.90969849
6379	SUS	Spirit of St Louis Airport	North America	US	United States	Missouri	St Louis	38.662102	-90.652
6380	STL	St Louis Lambert International Airport	North America	US	United States	Missouri	St Louis	38.748697	-90.370003
6381	KSM	St Mary's Airport	North America	US	United States	Alaska	St Mary's	62.0605011	-163.302002
6382	STQ	St Marys Municipal Airport	North America	US	United States	Pennsylvania	St Marys	41.41249847	-78.50260162
6383	SMK	St Michael Airport	North America	US	United States	Alaska	St Michael	63.49010086	-162.1100006
6384	STP	St Paul Downtown Holman Field	North America	US	United States	Minnesota	St Paul	44.93450165	-93.05999756
6385	SNP	St Paul Island Airport	North America	US	United States	Alaska	St Paul Island	57.166311	-170.222555
6386	SPG	Albert Whitted Airport	North America	US	United States	Florida	St Petersburg	27.7651	-82.626999
6387	PIE	St Petersburg Clearwater International Airport	North America	US	United States	Florida	St Petersburg-Clearwater	27.91020012	-82.68740082
6388	SSI	St Simons Island Airport	North America	US	United States	Georgia	St Simons Island	31.1518	-81.391296
6389	SYN	Stanton Airfield	North America	US	United States	Minnesota	Stanton	44.4754982	-93.01629639
6390	SCE	University Park Airport	North America	US	United States	Pennsylvania	State College	40.849374	-77.84852
6391	TBR	Statesboro Bulloch County Airport	North America	US	United States	Georgia	Statesboro	32.48270035	-81.73690033
6392	SVH	Statesville Regional Airport	North America	US	United States	North Carolina	Statesville	35.76530075	-80.9539032
6393	WSB	Steamboat Bay Seaplane Base	North America	US	United States	Alaska	Steamboat Bay	55.532662	-133.638167
6394	SBS	Steamboat Springs Bob Adams Field	North America	US	United States	Colorado	Steamboat Springs	40.5163002	-106.8659973
6395	WBB	Stebbins Airport	North America	US	United States	Alaska	Stebbins	63.51599884	-162.2779999
6396	SEP	Stephenville Clark Regional Airport	North America	US	United States	Texas	Stephenville	32.215302	-98.177696
6397	STK	Sterling Municipal Airport	North America	US	United States	Colorado	Sterling	40.613497	-103.263833
6398	STE	Stevens Point Municipal Airport	North America	US	United States	Wisconsin	Stevens Point	44.54520035	-89.53029633
6399	SVS	Stevens Village Airport	North America	US	United States	Alaska	Stevens Village	66.0172	-149.0545
6400	SWO	Stillwater Regional Airport	North America	US	United States	Oklahoma	Stillwater	36.16120148	-97.08570099
6401	SCK	Stockton Metropolitan Airport	North America	US	United States	California	Stockton	37.89419937	-121.237999
6402	SRV	Stony River 2 Airport	North America	US	United States	Alaska	Stony River	61.78969955	-156.5890045
6403	SLB	Storm Lake Municipal Airport	North America	US	United States	Iowa	Storm Lake	42.59730148	-95.24069977
6404	SUD	Stroud Municipal Airport	North America	US	United States	Oklahoma	Stroud	35.78960037	-96.65570068
6405	SUA	Witham Field	North America	US	United States	Florida	Stuart	27.18169975	-80.22109985
6406	SUE	Door County Cherryland Airport	North America	US	United States	Wisconsin	Sturgeon Bay	44.84370041	-87.42150116
6407	IRS	Kirsch Municipal Airport	North America	US	United States	Michigan	Sturgis	41.81330109	-85.43900299
6408	SGT	Stuttgart Municipal Airport / Carl Humphrey Field	North America	US	United States	Arkansas	Stuttgart	34.599499	-91.574997
6409	SIV	Sullivan County Airport	North America	US	United States	Indiana	Sullivan	39.1147	-87.448303
6410	SLR	Sulphur Springs Municipal Airport	North America	US	United States	Texas	Sulphur Springs	33.15980148	-95.62110138
6411	UMM	Summit Airport	North America	US	United States	Alaska	Summit	63.33150101	-149.1269989
6412	SSC	Shaw Air Force Base	North America	US	United States	South Carolina	Sumter	33.972698	-80.470596
6413	SUM	Sumter Airport	North America	US	United States	South Carolina	Sumter	33.99499893	-80.36129761
6414	SUO	Sunriver Airport	North America	US	United States	Oregon	Sunriver	43.87630081	-121.4530029
6415	SUW	Richard I Bong Memorial Airport	North America	US	United States	Wisconsin	Superior	46.688612	-92.095041
6416	SVE	Susanville Municipal Airport	North America	US	United States	California	Susanville	40.375702	-120.572998
6417	SWW	Avenger Field	North America	US	United States	Texas	Sweetwater	32.4673996	-100.4670029
6418	SYV	Sylvester Airport	North America	US	United States	Georgia	Sylvester	31.55850029	-83.89569855
6419	SYR	Syracuse Hancock International Airport	North America	US	United States	New York	Syracuse	43.11119843	-76.10630035
6420	TCM	McChord Air Force Base	North America	US	United States	Washington	Tacoma	47.137699	-122.475998
6421	TIW	Tacoma Narrows Airport	North America	US	United States	Washington	Tacoma	47.26789856	-122.5780029
6422	TCT	Takotna Airport	North America	US	United States	Alaska	Takotna	62.993206	-156.029026
6423	TLJ	Tatalina LRRS Airport	North America	US	United States	Alaska	Takotna	62.89440155	-155.977005
6424	TKL	Taku Lodge Seaplane Base	North America	US	United States	Alaska	Taku Lodge	58.48970032	-133.9429932
6425	TKA	Talkeetna Airport	North America	US	United States	Alaska	Talkeetna	62.32049942	-150.0939941
6426	ASN	Talladega Municipal Airport	North America	US	United States	Alabama	Talladega	33.56990051	-86.05090332
6427	TLH	Tallahassee Regional Airport	North America	US	United States	Florida	Tallahassee	30.3965	-84.350304
6428	MCF	Mac Dill Air Force Base	North America	US	United States	Florida	Tampa	27.8493	-82.521202
6429	TPF	Peter O Knight Airport	North America	US	United States	Florida	Tampa	27.91559982	-82.44930267
6430	TPA	Tampa International Airport	North America	US	United States	Florida	Tampa	27.97550011	-82.53320313
6431	KYO	Tampa North Aero Park Airport	North America	US	United States	Florida	Tampa	28.22130013	-82.37449646
6432	TSG	Tanacross Airport	North America	US	United States	Alaska	Tanacross	63.37440109	-143.3359985
6433	TAL	Ralph M Calhoun Memorial Airport	North America	US	United States	Alaska	Tanana	65.17440033	-152.1089935
6434	TSM	Taos Regional Airport	North America	US	United States	New Mexico	Taos	36.45819855	-105.6719971
6435	TEK	Tatitlek Airport	North America	US	United States	Alaska	Tatitlek	60.871449	-146.690297
6436	TWE	Taylor Airport	North America	US	United States	Alaska	Taylor	65.6792984	-164.798996
6437	TYZ	Taylor Airport	North America	US	United States	Arizona	Taylor	34.45280075	-110.1149979
6438	TSP	Tehachapi Municipal Airport	North America	US	United States	California	Tehachapi	35.13499832	-118.439003
6439	TLF	Telida Airport	North America	US	United States	Alaska	Telida	63.39390182	-153.2689972
6440	TLA	Teller Airport	North America	US	United States	Alaska	Teller	65.24040222	-166.3390045
6441	TEX	Telluride Regional Airport	North America	US	United States	Colorado	Telluride	37.9538002	-107.9079971
6442	TPL	Draughon Miller Central Texas Regional Airport	North America	US	United States	Texas	Temple	31.15250015	-97.40779877
6443	TKE	Tenakee Seaplane Base	North America	US	United States	Alaska	Tenakee Springs	57.77970123	-135.2180023
6444	HUF	Terre Haute Regional Airport, Hulman Field	North America	US	United States	Indiana	Terre Haute	39.4515	-87.307602
6445	TRL	Terrell Municipal Airport	North America	US	United States	Texas	Terrell	32.70920181	-96.26740265
6446	TEB	Teterboro Airport	North America	US	United States	New Jersey	Teterboro	40.85010147	-74.06079865
6447	TXK	Texarkana Regional Webb Field	North America	US	United States	Arkansas	Texarkana	33.45370102	-93.99099731
6448	THP	Hot Springs County Airport	North America	US	United States	Wyoming	Thermopolis	43.713602	-108.389687
6449	TVF	Thief River Falls Regional Airport	North America	US	United States	Minnesota	Thief River Falls	48.06570053	-96.18499756
6450	TVI	Thomasville Regional Airport	North America	US	United States	Georgia	Thomasville	30.90159988	-83.88130188
6451	THV	York Airport	North America	US	United States	Pennsylvania	Thomasville	39.917	-76.873001
6452	THM	Thompson Falls Airport	North America	US	United States	Montana	Thompson Falls	47.57350159	-115.2809982
6453	KTB	Thorne Bay Seaplane Base	North America	US	United States	Alaska	Thorne Bay	55.68799973	-132.5370026
6454	HAI	Three Rivers Municipal Dr Haines Airport	North America	US	United States	Michigan	Three Rivers	41.95980072	-85.59339905
6455	TMA	Henry Tift Myers Airport	North America	US	United States	Georgia	Tifton	31.42900085	-83.4885025
6456	KTH	Tikchik Lodge Seaplane Base	North America	US	United States	Alaska	Tikchik	59.96319962	-158.477005
6457	OTK	Tillamook Airport	North America	US	United States	Oregon	Tillamook	45.41820145	-123.814003
6458	TNC	Tin City Long Range Radar Station Airport	North America	US	United States	Alaska	Tin City	65.56310272	-167.9219971
6459	VEX	Tioga Municipal Airport	North America	US	United States	North Dakota	Tioga	48.38050079	-102.8980026
6460	TIX	Space Coast Regional Airport	North America	US	United States	Florida	Titusville	28.51479912	-80.79920197
6461	TOC	Toccoa Airport - R.G. Letourneau Field	North America	US	United States	Georgia	Toccoa	34.59379959	-83.29579926
6462	TOG	Togiak Airport	North America	US	United States	Alaska	Togiak Village	59.05279922	-160.3970032
6463	TKJ	Tok Junction Airport	North America	US	United States	Alaska	Tok	63.32949829	-142.9539948
6464	TKI	Tokeen Seaplane Base	North America	US	United States	Alaska	Tokeen	55.93709946	-133.3269959
6465	OOK	Toksook Bay Airport	North America	US	United States	Alaska	Toksook Bay	60.54140091	-165.0870056
6466	TOL	Eugene F. Kranz Toledo Express Airport	North America	US	United States	Ohio	Toledo	41.5868	-83.8078
6467	TDZ	Toledo Executive Airport	North America	US	United States	Ohio	Toledo	41.56489944	-83.4822998
6468	TDO	Ed Carlson Memorial Field South Lewis County Airport	North America	US	United States	Washington	Toledo	46.47719955	-122.8059998
6469	MJX	Ocean County Airport	North America	US	United States	New Jersey	Toms River	39.92750168	-74.29239655
6470	TPH	Tonopah Airport	North America	US	United States	Nevada	Tonopah	38.06019974	-117.086998
6471	XSD	Tonopah Test Range Airport	North America	US	United States	Nevada	Tonopah	37.79880142	-116.7809982
6472	TOP	Philip Billard Municipal Airport	North America	US	United States	Kansas	Topeka	39.069899	-95.622606
6473	FOE	Topeka Regional Airport	North America	US	United States	Kansas	Topeka	38.950901	-95.663597
6474	TOA	Zamperini Field	North America	US	United States	California	Torrance	33.80339813	-118.3399963
6475	TOR	Torrington Municipal Airport	North America	US	United States	Wyoming	Torrington	42.0644989	-104.1529999
6476	TVC	Cherry Capital Airport	North America	US	United States	Michigan	Traverse City	44.74140167	-85.5821991
6477	TTN	Trenton Mercer Airport	North America	US	United States	New Jersey	Trenton	40.27669907	-74.81349945
6478	TAD	Perry Stokes Airport	North America	US	United States	Colorado	Trinidad	37.25939941	-104.3410034
6479	TRH	Trona Airport	North America	US	United States	California	Trona	35.8125	-117.3270035
6480	TOI	Troy Municipal Airport at N Kenneth Campbell Field	North America	US	United States	Alabama	Troy	31.860399	-86.012101
6481	TKF	Truckee Tahoe Airport	North America	US	United States	California	Truckee	39.31999969	-120.1399994
6482	TCS	Truth or Consequences Municipal Airport	North America	US	United States	New Mexico	Truth or Consequences	33.2369	-107.272003
6483	TBC	Tuba City Airport	North America	US	United States	Arizona	Tuba City	36.091146	-111.38286
6484	DMA	Davis Monthan Air Force Base	North America	US	United States	Arizona	Tucson	32.16650009	-110.8830032
6485	TUS	Tucson International Airport / Morris Air National Guard Base	North America	US	United States	Arizona	Tucson	32.115004	-110.938053
6486	TCC	Tucumcari Municipal Airport	North America	US	United States	New Mexico	Tucumcari	35.18280029	-103.6029968
6487	TLR	Mefford Field	North America	US	United States	California	Tulare	36.15629959	-119.3259964
6488	TUH	Arnold Air Force Base	North America	US	United States	Tennessee	Tullahoma	35.39260101	-86.08580017
6489	THA	Tullahoma Regional Arpt/Wm Northern Field	North America	US	United States	Tennessee	Tullahoma	35.38010025	-86.24639893
6490	RVS	Richard Lloyd Jones Jr Airport	North America	US	United States	Oklahoma	Tulsa	36.03960037	-95.98459625
6491	TUL	Tulsa International Airport	North America	US	United States	Oklahoma	Tulsa	36.19839859	-95.88809967
6492	TLT	Tuluksak Airport	North America	US	United States	Alaska	Tuluksak	61.09680176	-160.9689941
6493	UTM	Tunica Municipal Airport	North America	US	United States	Mississippi	Tunica	34.68099976	-90.34670258
6494	WTL	Tuntutuliak Airport	North America	US	United States	Alaska	Tuntutuliak	60.33530045	-162.6670074
6495	TNK	Tununak Airport	North America	US	United States	Alaska	Tununak	60.57550049	-165.2720032
6496	TUP	Tupelo Regional Airport	North America	US	United States	Mississippi	Tupelo	34.26810074	-88.76989746
6497	TCL	Tuscaloosa Regional Airport	North America	US	United States	Alabama	Tuscaloosa	33.22060013	-87.61139679
6498	TGE	Sharpe Field	North America	US	United States	Alabama	Tuskegee	32.4919014	-85.77559662
6499	NKI	Naukati Bay Seaplane Base	North America	US	United States	Alaska	Tuxekan Island	55.849602	-133.227994
6500	TNP	Twentynine Palms Airport	North America	US	United States	California	Twentynine Palms	34.133901	-115.947347
6501	TWF	Joslin Field Magic Valley Regional Airport	North America	US	United States	Idaho	Twin Falls	42.4818	-114.487999
6502	TWA	Twin Hills Airport	North America	US	United States	Alaska	Twin Hills	59.07559967	-160.272995
6503	TWH	Two Harbors Amphibious Terminal	North America	US	United States	California	Two Harbors	33.43222222	-118.5086111
6504	TYR	Tyler Pounds Regional Airport	North America	US	United States	Texas	Tyler	32.35409927	-95.40239716
6505	TYE	Tyonek Airport	North America	US	United States	Alaska	Tyonek	61.076556	-151.131363
6506	UGS	Ugashik Airport	North America	US	United States	Alaska	Ugashik	57.523476	-157.396344
6507	UKI	Ukiah Municipal Airport	North America	US	United States	California	Ukiah	39.12599945	-123.2009964
6508	UMT	Umiat Airport	North America	US	United States	Alaska	Umiat	69.37110138	-152.1360016
6509	UNK	Unalakleet Airport	North America	US	United States	Alaska	Unalakleet	63.88840103	-160.798996
6510	DUT	Tom Madsen (Dutch Harbor) Airport	North America	US	United States	Alaska	Unalaska	53.89881	-166.544996
6511	UCY	Everett-Stewart Regional Airport	North America	US	United States	Tennessee	Union City	36.38180161	-88.98539734
6512	RND	Randolph Air Force Base	North America	US	United States	Texas	Universal City	29.529699	-98.2789
6513	CCB	Cable Airport	North America	US	United States	California	Upland	34.11159897	-117.6880035
6514	UTO	Indian Mountain LRRS Airport	North America	US	United States	Alaska	Utopia Creek	65.99279785	-153.7039948
6515	BRW	Wiley Post Will Rogers Memorial Airport	North America	US	United States	Alaska	Utqia??vik	71.285402	-156.766008
6516	UVA	Garner Field	North America	US	United States	Texas	Uvalde	29.2112999	-99.74359894
6517	VDZ	Valdez Pioneer Field	North America	US	United States	Alaska	Valdez	61.1339	-146.248001
6518	VAD	Moody Air Force Base	North America	US	United States	Georgia	Valdosta	30.96780014	-83.19300079
6519	VLD	Valdosta Regional Airport	North America	US	United States	Georgia	Valdosta	30.78249931	-83.27670288
6520	VTN	Miller Field	North America	US	United States	Nebraska	Valentine	42.85779953	-100.5479965
6521	VPS	Destin-Fort Walton Beach Airport	North America	US	United States	Florida	Valparaiso	30.4832	-86.525398
6522	VPZ	Porter County Municipal Airport	North America	US	United States	Indiana	Valparaiso	41.45399857	-87.00710297
6523	VHN	Culberson County Airport	North America	US	United States	Texas	Van Horn	31.05780029	-104.7839966
6524	VNY	Van Nuys Airport	North America	US	United States	California	Van Nuys	34.20980072	-118.4899979
6525	VLA	Vandalia Municipal Airport	North America	US	United States	Illinois	Vandalia	38.99150085	-89.16619873
6526	VEE	Venetie Airport	North America	US	United States	Alaska	Venetie	67.00869751	-146.3659973
6527	VNC	Venice Municipal Airport	North America	US	United States	Florida	Venice	27.07159996	-82.44029999
6528	VEL	Vernal Regional Airport	North America	US	United States	Utah	Vernal	40.4408989	-109.5100021
6529	WIB	Wilbarger County Airport	North America	US	United States	Texas	Vernon	34.22570038	-99.28379822
6530	VRB	Vero Beach Regional Airport	North America	US	United States	Florida	Vero Beach	27.6556	-80.417901
6531	VRS	Roy Otten Memorial Airfield	North America	US	United States	Missouri	Versailles	38.42779922	-92.87519836
6532	VKS	Vicksburg Municipal Airport	North America	US	United States	Mississippi	Vicksburg	32.23929977	-90.92839813
6533	VCT	Victoria Regional Airport	North America	US	United States	Texas	Victoria	28.8526001	-96.91850281
6534	VCV	Southern California Logistics Airport	North America	US	United States	California	Victorville	34.59749985	-117.3830032
6535	VDI	Vidalia Regional Airport	North America	US	United States	Georgia	Vidalia	32.19269943	-82.37120056
6536	NTU	Oceana Naval Air Station	North America	US	United States	Virginia	Virginia Beach	36.820702	-76.033501
6537	VIS	Visalia International Airport	North America	US	United States	California	Visalia	36.318699	-119.392998
6538	CNW	TSTC Waco Airport	North America	US	United States	Texas	Waco	31.641129	-97.073335
6539	ACT	Waco Regional Airport	North America	US	United States	Texas	Waco	31.61129951	-97.23049927
6540	WAH	Harry Stern Airport	North America	US	United States	North Dakota	Wahpeton	46.24409866	-96.60739899
6541	AIN	Wainwright Airport	North America	US	United States	Alaska	Wainwright	70.63800049	-159.9949951
6542	WAA	Wales Airport	North America	US	United States	Alaska	Wales	65.622593	-168.095
6543	ALW	Walla Walla Regional Airport	North America	US	United States	Washington	Walla Walla	46.09489822	-118.288002
6544	WAL	Wallops Flight Facility Airport	North America	US	United States	Virginia	Wallops Island	37.94020081	-75.46640015
6545	ARG	Walnut Ridge Regional Airport	North America	US	United States	Arkansas	Walnut Ridge	36.124667	-90.925111
6546	RBW	Lowcountry Regional Airport	North America	US	United States	South Carolina	Walterboro	32.92100143	-80.64060211
6547	AXV	Neil Armstrong Airport	North America	US	United States	Ohio	Wapakoneta	40.49340057	-84.29889679
6548	UWA	Ware Airport	North America	US	United States	Massachusetts	Ware	42.2820015	-72.21479797
6549	WRB	Robins Air Force Base	North America	US	United States	Georgia	Warner Robins	32.640099	-83.591904
6550	RRT	Warroad International Memorial Airport	North America	US	United States	Minnesota	Warroad	48.94139862	-95.3483963
6551	DCA	Ronald Reagan Washington National Airport	North America	US	United States	District of Columbia	Washington	38.8521	-77.037697
6552	OCW	Warren Field	North America	US	United States	North Carolina	Washington	35.57049942	-77.04979706
6553	WSG	Washington County Airport	North America	US	United States	Pennsylvania	Washington	40.136501	-80.290199
6554	IAD	Washington Dulles International Airport	North America	US	United States	Virginia	Washington, DC	38.9445	-77.455803
6555	WWA	Wasilla Airport	North America	US	United States	Alaska	Wasilla	61.57170105	-149.5399933
6556	KWF	Waterfall Seaplane Base	North America	US	United States	Alaska	Waterfall	55.296299	-133.242996
6557	ALO	Waterloo Regional Airport	North America	US	United States	Iowa	Waterloo	42.55709839	-92.40029907
6558	ART	Watertown International Airport	North America	US	United States	New York	Watertown	43.9919014	-76.021698
6559	ATY	Watertown Regional Airport	North America	US	United States	South Dakota	Watertown	44.91400146	-97.15470123
6560	WVL	Waterville Robert Lafleur Airport	North America	US	United States	Maine	Waterville	44.53319931	-69.67549896
6561	WVI	Watsonville Municipal Airport	North America	US	United States	California	Watsonville	36.93569946	-121.7900009
6562	UES	Waukesha County Airport	North America	US	United States	Wisconsin	Waukesha	43.04100037	-88.23709869
6563	UKN	Waukon Municipal Airport	North America	US	United States	Iowa	Waukon	43.2804985	-91.46949768
6564	AUW	Wausau Downtown Airport	North America	US	United States	Wisconsin	Wausau	44.92620087	-89.62660217
6565	AYS	Waycross Ware County Airport	North America	US	United States	Georgia	Waycross	31.24909973	-82.39550018
6566	WAY	Greene County Airport	North America	US	United States	Pennsylvania	Waynesburg	39.90010071	-80.13310242
6567	WEA	Parker County Airport	North America	US	United States	Texas	Weatherford	32.74629974	-97.68240356
6568	EBS	Webster City Municipal Airport	North America	US	United States	Iowa	Webster City	42.43659973	-93.86889648
6569	EPG	Browns Airport	North America	US	United States	Nebraska	Weeping Water	40.86750031	-96.11000061
6570	LWL	Wells Municipal Airport/Harriet Field	North America	US	United States	Nevada	Wells	41.11709976	-114.9219971
6571	ELZ	Wellsville Municipal Arpt,Tarantine Field	North America	US	United States	New York	Wellsville	42.10950089	-77.98999786
6572	EAT	Pangborn Memorial Airport	North America	US	United States	Washington	Wenatchee	47.39889908	-120.2070007
6573	ENV	Wendover Airport	North America	US	United States	Utah	Wendover	40.71870041	-114.0309982
6574	ETB	West Bend Municipal Airport	North America	US	United States	Wisconsin	West Bend	43.422278	-88.128966
6575	WBK	West Branch Community Airport	North America	US	United States	Michigan	West Branch	44.244801	-84.179802
6576	HEE	Thompson-Robbins Airport	North America	US	United States	Arkansas	West Helena	34.576571	-90.67616
6577	LAF	Purdue University Airport	North America	US	United States	Indiana	West Lafayette	40.4123	-86.936897
6578	AWM	West Memphis Municipal Airport	North America	US	United States	Arkansas	West Memphis	35.13510132	-90.23439789
6579	LNA	Palm Beach County Park Airport	North America	US	United States	Florida	West Palm Beach	26.59300041	-80.08509827
6580	PBI	Palm Beach International Airport	North America	US	United States	Florida	West Palm Beach	26.68320084	-80.09559631
6581	KWP	West Point Village Seaplane Base	North America	US	United States	Alaska	West Point	57.77009964	-153.548996
6582	WSX	Westsound/WSX Seaplane Base	North America	US	United States	Washington	West Sound	48.617901	-122.956903
6583	WYS	Yellowstone Airport	North America	US	United States	Montana	West Yellowstone	44.68840027	-111.1179962
6584	WST	Westerly State Airport	North America	US	United States	Rhode Island	Westerly	41.34960175	-71.80339813
6585	BAF	Westfield-Barnes Regional Airport	North America	US	United States	Massachusetts	Westfield/Springfield	42.157799	-72.715599
6586	FOK	Francis S Gabreski Airport	North America	US	United States	New York	Westhampton Beach	40.84370041	-72.63179779
6587	SHD	Shenandoah Valley Regional Airport	North America	US	United States	Virginia	Weyers Cave	38.263802	-78.8964
6588	WWP	Whale Pass Seaplane Float Harbor Facility	North America	US	United States	Alaska	Whale Pass	56.116299	-133.121994
6589	WHT	Wharton Regional Airport	North America	US	United States	Texas	Wharton	29.254299	-96.154404
6590	EAN	Phifer Airfield	North America	US	United States	Wyoming	Wheatland	42.0555	-104.929001
6591	HLG	Wheeling Ohio County Airport	North America	US	United States	West Virginia	Wheeling	40.17499924	-80.64630127
6592	WMO	White Mountain Airport	North America	US	United States	Alaska	White Mountain	64.68920136	-163.4129944
6593	HPN	Westchester County Airport	North America	US	United States	New York	White Plains	41.06700134	-73.70760345
6594	WSD	Condron Army Air Field	North America	US	United States	New Mexico	White Sands	32.34149933	-106.4029999
6595	HIE	Mount Washington Regional Airport	North America	US	United States	New Hampshire	Whitefield	44.36752	-71.545765
6596	WTR	Whiteriver Airport	North America	US	United States	Arizona	Whiteriver	33.810175	-109.986555
6597	BEC	Beech Factory Airport	North America	US	United States	Kansas	Wichita	37.69449997	-97.21499634
6598	CEA	Cessna Aircraft Field	North America	US	United States	Kansas	Wichita	37.64860153	-97.25060272
6599	IAB	Mc Connell Air Force Base	North America	US	United States	Kansas	Wichita	37.62189865	-97.26820374
6600	ICT	Wichita Eisenhower National Airport	North America	US	United States	Kansas	Wichita	37.649899	-97.433098
6601	KIP	Kickapoo Downtown Airport	North America	US	United States	Texas	Wichita Falls	33.85779953	-98.49040222
6602	SPS	Sheppard Air Force Base / Wichita Falls Municipal Airport	North America	US	United States	Texas	Wichita Falls	33.9888	-98.491898
6603	WWD	Cape May County Airport	North America	US	United States	New Jersey	Wildwood	39.00849915	-74.90830231
6604	CBE	Greater Cumberland Regional Airport	North America	US	United States	West Virginia	Wiley Ford	39.615398	-78.760902
6605	WBW	Wilkes Barre Wyoming Valley Airport	North America	US	United States	Pennsylvania	Wilkes-Barre	41.29719925	-75.85119629
6606	AVP	Wilkes Barre Scranton International Airport	North America	US	United States	Pennsylvania	Wilkes-Barre/Scranton	41.33850098	-75.7233963
6607	CWX	Cochise County Airport	North America	US	United States	Arizona	Willcox	32.24539948	-109.8949966
6608	IPT	Williamsport Regional Airport	North America	US	United States	Pennsylvania	Williamsport	41.2417984	-76.9210968
6609	XWA	Williston Basin International Airport	North America	US	United States	North Dakota	Williston	48.258387	-103.748797
6610	ILL	Willmar Municipal Airport John L Rice Field (2006)	North America	US	United States	Minnesota	Willmar	45.117552	-95.132259
6611	LNN	Lake County Executive Airport	North America	US	United States	Ohio	Willoughby	41.683998	-81.389702
6612	WOW	Willow Airport	North America	US	United States	Alaska	Willow	61.75419998	-150.052002
6613	WLW	Willows Glenn County Airport	North America	US	United States	California	Willows	39.51639938	-122.2180023
6614	ILG	New Castle Airport	North America	US	United States	Delaware	Wilmington	39.67869949	-75.60649872
6615	ILM	Wilmington International Airport	North America	US	United States	North Carolina	Wilmington	34.27059937	-77.90260315
6616	ILN	Wilmington Airpark	North America	US	United States	Ohio	Wilmington	39.42789841	-83.792099
6617	WGO	Winchester Regional Airport	North America	US	United States	Virginia	Winchester	39.14350128	-78.14440155
6618	WDR	Barrow County Airport	North America	US	United States	Georgia	Winder	33.98289871	-83.66739655
6619	WLD	Strother Field	North America	US	United States	Kansas	Winfield / Arkansas City	37.168598	-97.037598
6620	INK	Winkler County Airport	North America	US	United States	Texas	Wink	31.77960014	-103.2009964
6621	WMC	Winnemucca Municipal Airport	North America	US	United States	Nevada	Winnemucca	40.89659882	-117.8059998
6622	INW	Winslow Lindbergh Regional Airport	North America	US	United States	Arizona	Winslow	35.02190018	-110.7229996
6623	INT	Smith Reynolds Airport	North America	US	United States	North Carolina	Winston Salem	36.13370132	-80.22200012
6624	GIF	Winter Haven Regional Airport - Gilbert Field	North America	US	United States	Florida	Winter Haven	28.062901	-81.753304
6625	ISS	Wiscasset Airport	North America	US	United States	Maine	Wiscasset	43.96139908	-69.71260071
6626	ISW	Alexander Field South Wood County Airport	North America	US	United States	Wisconsin	Wisconsin Rapids	44.36029816	-89.83899689
6627	LNP	Lonesome Pine Airport	North America	US	United States	Virginia	Wise	36.98749924	-82.52999878
6628	WSM	Wiseman Airport	North America	US	United States	Alaska	Wiseman	67.40460205	-150.1230011
6629	OLF	L M Clayton Airport	North America	US	United States	Montana	Wolf Point	48.0945015	-105.5749969
6630	WWR	West Woodward Airport	North America	US	United States	Oklahoma	Woodward	36.438	-99.5226667
6631	BJJ	Wayne County Airport	North America	US	United States	Ohio	Wooster	40.87480164	-81.88829803
6632	ORH	Worcester Regional Airport	North America	US	United States	Massachusetts	Worcester	42.2673	-71.875702
6633	WRL	Worland Municipal Airport	North America	US	United States	Wyoming	Worland	43.965698	-107.950996
6634	WRG	Wrangell Airport	North America	US	United States	Alaska	Wrangell	56.48429871	-132.3699951
6635	WRI	Mc Guire Air Force Base	North America	US	United States	New Jersey	Wrightstown	40.0155983	-74.59169769
6636	CYT	Yakataga Airport	North America	US	United States	Alaska	Yakataga	60.080974	-142.494541
6637	YKM	Yakima Air Terminal McAllister Field	North America	US	United States	Washington	Yakima	46.56819916	-120.5439987
6638	YAK	Yakutat Airport	North America	US	United States	Alaska	Yakutat	59.508717	-139.660435
6639	YKN	Chan Gurney Municipal Airport	North America	US	United States	South Dakota	Yankton	42.91669846	-97.3859024
6640	EYR	Yerington Municipal Airport	North America	US	United States	Nevada	Yerington	39.0041008	-119.1579971
6641	WYB	Yes Bay Lodge Seaplane Base	North America	US	United States	Alaska	Yes Bay	55.91630173	-131.8009949
6642	YNG	Youngstown Warren Regional Airport	North America	US	United States	Ohio	Youngstown/Warren	41.26070023	-80.67910004
6643	YUM	Yuma International Airport / Marine Corps Air Station Yuma	North America	US	United States	Arizona	Yuma	32.656601	-114.606003
6644	LGF	Laguna Army Airfield	North America	US	United States	Arizona	Yuma Proving Ground(Yuma)	32.86000061	-114.3970032
6645	KZB	Zachar Bay Seaplane Base	North America	US	United States	Alaska	Zachar Bay	57.553001	-153.746052
6646	ZZV	Zanesville Municipal Airport	North America	US	United States	Ohio	Zanesville	39.94440079	-81.89209747
6647	ZPH	Zephyrhills Municipal Airport	North America	US	United States	Florida	Zephyrhills	28.22820091	-82.15589905
6648	FTI	Fitiuta Airport	Oceania	AS	American Samoa	Manu??a District	Fitiuta Village	-14.215622	-169.424254
6649	OFU	Ofu Airport	Oceania	AS	American Samoa	Manu??a District	Ofu	-14.1844	-169.669998
6650	PPG	Pago Pago International Airport	Oceania	AS	American Samoa	Western District	Pago Pago	-14.331	-170.710007
6651	ABG	Abingdon Downs Airport	Oceania	AU	Australia	Queensland	Abingdon Downs	-17.607542	143.183245
6652	ADL	Adelaide International Airport	Oceania	AU	Australia	South Australia	Adelaide	-34.947512	138.533393
6653	AGW	Agnew Airport	Oceania	AU	Australia	Queensland	Agnew	-12.14560032	142.1490021
6654	ALH	Albany Airport	Oceania	AU	Australia	Western Australia	Albany	-34.94329834	117.8089981
6655	WOL	Shellharbour Airport	Oceania	AU	Australia	New South Wales	Albion Park Rail	-34.5611	150.789001
6656	ABX	Albury Airport	Oceania	AU	Australia	New South Wales	Albury	-36.066758	146.959148
6657	AXL	Alexandria Homestead Airport	Oceania	AU	Australia	Northern Territory	Alexandria Homestead	-19.06019974	136.7100067
6658	ASP	Alice Springs Airport	Oceania	AU	Australia	Northern Territory	Alice Springs	-23.80669975	133.9019928
6659	ABH	Alpha Airport	Oceania	AU	Australia	Queensland	Alpha	-23.653275	146.582479
6660	LNH	Lake Nash Airport	Oceania	AU	Australia	Northern Territory	Alpurrurulam	-20.9807	137.9178
6661	AYD	Alroy Downs Airport	Oceania	AU	Australia	Northern Territory	Alroy Downs	-19.2908	136.078995
6662	AWN	Alton Downs Airport	Oceania	AU	Australia	South Australia	Alton Downs	-26.488959	139.259906
6663	AMT	Amata Airport	Oceania	AU	Australia	South Australia	Amata	-26.097363	131.202732
6664	AMX	Ammaroo Airport	Oceania	AU	Australia	Northern Territory	Ammaroo	-21.73830032	135.2420044
6665	ADO	Andamooka Airport	Oceania	AU	Australia	South Australia	Andamooka	-30.438299	137.136993
6666	ANZ	Angus Downs Airport	Oceania	AU	Australia	Northern Territory	Angus Downs Station	-25.0325	132.2748
6667	TTX	Truscott-Mungalalu Airport	Oceania	AU	Australia	Western Australia	Anjo Peninsula	-14.08969975	126.3809967
6668	AYL	Anthony Lagoon Airport	Oceania	AU	Australia	Northern Territory	Anthony Lagoon	-18.01807903	135.5350685
6669	AXC	Aramac Airport	Oceania	AU	Australia	Queensland	Aramac	-22.95788	145.249504
6670	ARY	Ararat Airport	Oceania	AU	Australia	Victoria	Ararat	-37.309978	142.988688
6671	GYL	Argyle Airport	Oceania	AU	Australia	Western Australia	Argyle	-16.6369	128.451004
6672	AGY	Argyle Downs Airport	Oceania	AU	Australia	Western Australia	Argyle Downs	-16.508604	128.922485
6673	ARM	Armidale Airport	Oceania	AU	Australia	New South Wales	Armidale	-30.52809906	151.6170044
6674	AUD	Augustus Downs Airport	Oceania	AU	Australia	Queensland	Augustus Downs	-18.51499939	139.878006
6675	AUU	Aurukun Airport	Oceania	AU	Australia	Queensland	Aurukun	-13.354067	141.72065
6676	AWP	Austral Downs Airport	Oceania	AU	Australia	Northern Territory	Austral Downs	-20.5	137.75
6677	AVG	Auvergne Airport	Oceania	AU	Australia	Northern Territory	Auvergne	-15.69999981	130
6678	AYQ	Ayers Rock Connellan Airport	Oceania	AU	Australia	Northern Territory	Ayers Rock	-25.1861	130.975998
6679	AYR	Ayr Airport	Oceania	AU	Australia	Queensland	Ayr	-19.595832	147.324495
6680	BDD	Badu Island Airport	Oceania	AU	Australia	Queensland	Badu Island	-10.14999962	142.1734
6681	BSJ	Bairnsdale Airport	Oceania	AU	Australia	Victoria	Bairnsdale	-37.88750076	147.5679932
6682	LCN	Balcanoona Airport	Oceania	AU	Australia	South Australia	Balcanoona	-30.53499985	139.3370056
6683	BQW	Balgo Hill Airport	Oceania	AU	Australia	Western Australia	Balgo	-20.1483	127.973
6684	BBL	Ballera Airport	Oceania	AU	Australia	Queensland	Ballera	-27.405633	141.809458
6685	BNK	Ballina Byron Gateway Airport	Oceania	AU	Australia	New South Wales	Ballina	-28.833236	153.561471
6686	BZD	Balranald Airport	Oceania	AU	Australia	New South Wales	Balranald	-34.62360001	143.5780029
6687	ABM	Northern Peninsula Airport	Oceania	AU	Australia	Queensland	Bamaga	-10.946194	142.455081
6688	BYX	Baniyala Airport	Oceania	AU	Australia	Northern Territory	Baniyala	-13.19810009	136.227005
6689	BCI	Barcaldine Airport	Oceania	AU	Australia	Queensland	Barcaldine	-23.566268	145.302086
6690	BYP	Barimunya Airport	Oceania	AU	Australia	Western Australia	Barimunya	-22.6739006	119.1660004
6691	BKP	Barkly Downs Airport	Oceania	AU	Australia	Queensland	Barkly Downs	-20.49583333	138.4747222
6692	BWB	Barrow Island Airport	Oceania	AU	Australia	Western Australia	Barrow Island	-20.86440086	115.4059982
6693	NMP	New Moon Airport	Oceania	AU	Australia	Queensland	Basalt	-19.2	145.773
6694	BVW	Batavia Downs Airport	Oceania	AU	Australia	Queensland	Batavia Downs	-12.65919971	142.6750031
6695	BHS	Bathurst Airport	Oceania	AU	Australia	New South Wales	Bathurst	-33.406817	149.651161
6696	BDW	Bedford Downs Airport	Oceania	AU	Australia	Western Australia	Bedford Downs	-17.2866993	127.4629974
6697	BEU	Bedourie Airport	Oceania	AU	Australia	Queensland	Bedourie	-24.34609985	139.4600067
6698	BLN	Benalla Airport	Oceania	AU	Australia	Victoria	Benalla	-36.551899	146.007004
6699	BXG	Bendigo Airport	Oceania	AU	Australia	Victoria	Bendigo	-36.73939896	144.3300018
6700	BTX	Betoota Airport	Oceania	AU	Australia	Queensland	Betoota	-25.694791	140.738339
6701	BVZ	Beverley Springs Airport	Oceania	AU	Australia	Western Australia	Beverley Springs	-16.733252	125.439245
6702	BCZ	Milyakburra Airport	Oceania	AU	Australia	Northern Territory	Bickerton Island	-13.78083333	136.2016667
6703	BBE	Big Bell Airport	Oceania	AU	Australia	Western Australia	Big Bell	-27.32859993	117.6729965
6704	BIW	Billiluna Airport	Oceania	AU	Australia	Western Australia	Billiluna	-19.56669998	127.6669998
6705	ZBL	Biloela Airport	Oceania	AU	Australia	Queensland	Biloela	-24.320816	150.509627
6706	THG	Thangool Airport	Oceania	AU	Australia	Queensland	Biloela	-24.494863	150.577967
6707	BVI	Birdsville Airport	Oceania	AU	Australia	Queensland	Birdsville	-25.89749908	139.3480072
6708	BKQ	Blackall Airport	Oceania	AU	Australia	Queensland	Blackall	-24.431678	145.429716
6709	BLT	Blackwater Airport	Oceania	AU	Australia	Queensland	Blackwater	-23.60309982	148.8070068
6710	BFC	Bloomfield River Airport	Oceania	AU	Australia	Queensland	Bloomfield River	-15.87360001	145.3300018
6711	GIC	Boigu Airport	Oceania	AU	Australia	Queensland	Boigu	-9.232780457	142.2180023
6712	BLS	Bollon Airport	Oceania	AU	Australia	Queensland	Bollon	-28.051247	147.481799
6713	BCK	Bolwarra Airport	Oceania	AU	Australia	Queensland	Bolwarra	-17.38829994	144.1690063
6714	OCM	Boolgeeda	Oceania	AU	Australia	Western Australia	Boolgeeda	-22.54	117.275
6715	BOX	Borroloola Airport	Oceania	AU	Australia	Northern Territory	Borroloola	-16.07530022	136.302002
6716	BQL	Boulia Airport	Oceania	AU	Australia	Queensland	Boulia	-22.91329956	139.8999939
6717	BRK	Bourke Airport	Oceania	AU	Australia	New South Wales	Bourke	-30.03919983	145.9519958
6718	ZBO	Bowen Airport	Oceania	AU	Australia	Queensland	Bowen	-20.017999	148.215245
6719	BMP	Brampton Island Airport	Oceania	AU	Australia	Queensland	Brampton Island	-20.804633	149.279931
6720	BWQ	Brewarrina Airport	Oceania	AU	Australia	New South Wales	Brewarrina	-29.97389984	146.8170013
6721	BHT	Brighton Downs Airport	Oceania	AU	Australia	Queensland	Brighton Downs	-23.36388889	141.5627778
6722	BNE	Brisbane International Airport	Oceania	AU	Australia	Queensland	Brisbane	-27.38419914	153.1170044
6723	BHQ	Broken Hill Airport	Oceania	AU	Australia	New South Wales	Broken Hill	-32.00139999	141.4720001
6724	BME	Broome International Airport	Oceania	AU	Australia	Western Australia	Broome	-17.949055	122.228329
6725	BTD	Brunette Downs Airport	Oceania	AU	Australia	Northern Territory	Brunette Downs	-18.637472	135.938355
6726	BIP	Bulimba Airport	Oceania	AU	Australia	Queensland	Bulimba	-16.88080025	143.4790039
6727	BUY	Bunbury Airport	Oceania	AU	Australia	Western Australia	Bunbury	-33.37829971	115.677002
6728	BDB	Bundaberg Airport	Oceania	AU	Australia	Queensland	Bundaberg	-24.905039	152.322612
6729	BUC	Burketown Airport	Oceania	AU	Australia	Queensland	Burketown	-17.74860001	139.5339966
6730	BWT	Wynyard Airport	Oceania	AU	Australia	Tasmania	Burnie	-40.997039	145.726
6731	BQB	Busselton Regional Airport	Oceania	AU	Australia	Western Australia	Busselton Regional	-33.68842316	115.4015961
6732	CGV	Caiguna Airport	Oceania	AU	Australia	Western Australia	Caiguna	-32.280457	125.477943
6733	CNS	Cairns International Airport	Oceania	AU	Australia	Queensland	Cairns	-16.88579941	145.7550049
6734	CUD	Caloundra Airport	Oceania	AU	Australia	Queensland	Caloundra	-26.80336	153.104975
6735	CFI	Camfield Airport	Oceania	AU	Australia	Northern Territory	Camfield	-17.02169991	131.3269958
6736	CML	Camooweal Airport	Oceania	AU	Australia	Queensland	Camooweal	-19.9116993	138.125
6737	NIF	Camp Nifty Airport	Oceania	AU	Australia	Western Australia	Camp Nifty	-21.67169952	121.586998
6738	CBR	Canberra International Airport	Oceania	AU	Australia	Australian Capital Territory	Canberra	-35.3069	149.195007
6739	CBY	Canobie Airport	Oceania	AU	Australia	Queensland	Canobie	-19.47940063	140.927002
6740	CBI	Cape Barren Island Airport	Oceania	AU	Australia	Tasmania	Cape Barren Island	-40.39170074	148.0169983
6741	CQP	Cape Flattery Airport	Oceania	AU	Australia	Queensland	Cape Flattery	-14.970832	145.311667
6742	CRY	Carlton Hill Airport	Oceania	AU	Australia	Western Australia	Carlton Hill	-15.50189972	128.5339966
6743	CVQ	Carnarvon Airport	Oceania	AU	Australia	Western Australia	Carnarvon	-24.880091	113.670752
6744	WCD	Carosue Dam Airport	Oceania	AU	Australia	Western Australia	Carosue Dam Gold Mine	-30.1737	122.3221
6745	CFP	Carpentaria Downs Airport	Oceania	AU	Australia	Queensland	Carpentaria Downs	-18.718481	144.313028
6746	CSI	Casino Airport	Oceania	AU	Australia	New South Wales	Casino	-28.881304	153.060724
6747	CTR	Cattle Creek Airport	Oceania	AU	Australia	Northern Territory	Cattle Creek	-17.60700035	131.548996
6748	CED	Ceduna Airport	Oceania	AU	Australia	South Australia	Ceduna	-32.13059998	133.7100067
6749	CES	Cessnock Airport	Oceania	AU	Australia	New South Wales	Cessnock	-32.787498	151.341995
6750	CTL	Charleville Airport	Oceania	AU	Australia	Queensland	Charleville	-26.41329956	146.2619934
6751	CXT	Charters Towers Airport	Oceania	AU	Australia	Queensland	Charters Towers	-20.04310036	146.272995
6752	CRH	Cherrabah Airport	Oceania	AU	Australia	Queensland	Cherrabah Homestead Resort	-28.4301	152.08895
6753	CBC	Cherrabun Airport	Oceania	AU	Australia	Western Australia	Cherrabun	-18.91777778	125.5377778
6754	LLG	Chillagoe Airport	Oceania	AU	Australia	Queensland	Chillagoe	-17.14279938	144.529007
6755	CCL	Chinchilla Airport	Oceania	AU	Australia	Queensland	Chinchilla	-26.77499962	150.6170044
6756	CKW	Christmas Creek Airport	Oceania	AU	Australia	Western Australia	Christmas Creek Mine	-22.3543	119.6426
6757	CMQ	Clermont Airport	Oceania	AU	Australia	Queensland	Clermont	-22.7730999	147.6210022
6758	CVC	Cleve Airport	Oceania	AU	Australia	South Australia	Cleve	-33.70970154	136.5050049
6759	CFH	Clifton Hills Airport	Oceania	AU	Australia	South Australia	Clifton Hills	-27.0182991	138.8919983
6760	CNJ	Cloncurry Airport	Oceania	AU	Australia	Queensland	Cloncurry	-20.66860008	140.5039978
6761	KFE	Fortescue - Dave Forrest Aerodrome	Oceania	AU	Australia	Western Australia	Cloudbreak Village	-22.290754	119.437143
6762	CZY	Cluny Airport	Oceania	AU	Australia	Queensland	Cluny	-24.51670074	139.6170044
6763	CAZ	Cobar Airport	Oceania	AU	Australia	New South Wales	Cobar	-31.53829956	145.7940063
6764	CDU	Camden Airport	Oceania	AU	Australia	New South Wales	Cobbitty	-34.038338	150.686406
6765	CNC	Coconut Island Airport	Oceania	AU	Australia	Queensland	Coconut Island	-10.05000019	143.0700073
6766	CUQ	Coen Airport	Oceania	AU	Australia	Queensland	Coen	-13.761133	143.113311
6767	CFS	Coffs Harbour Airport	Oceania	AU	Australia	New South Wales	Coffs Harbour	-30.320601	153.115997
6768	XCO	Colac Airport	Oceania	AU	Australia	Victoria	Colac	-38.286701	143.679993
6769	CRB	Collarenebri Airport	Oceania	AU	Australia	New South Wales	Collarenebri	-29.52169991	148.5820007
6770	CIE	Collie Airport	Oceania	AU	Australia	Western Australia	Collie	-33.36669922	116.2170029
6771	KCE	Collinsville Airport	Oceania	AU	Australia	Queensland	Collinsville	-20.59670067	147.8600006
6772	CBX	Condobolin Airport	Oceania	AU	Australia	New South Wales	Condobolin	-33.06565	147.21316
6773	CPD	Coober Pedy Airport	Oceania	AU	Australia	South Australia	Coober Pedy	-29.04000092	134.720993
6774	CDA	Cooinda Airport	Oceania	AU	Australia	Northern Territory	Cooinda	-12.90330029	132.5319977
6775	CTN	Cooktown Airport	Oceania	AU	Australia	Queensland	Cooktown	-15.443649	145.183221
6776	CLH	Coolah Airport	Oceania	AU	Australia	New South Wales	Coolah	-31.773864	149.615322
6777	COY	Coolawanyah Airport	Oceania	AU	Australia	Western Australia	Coolawanyah Station	-21.7946	117.755
6778	COB	Coolibah Airport	Oceania	AU	Australia	Northern Territory	Coolibah	-15.54829979	130.9620056
6779	OOM	Cooma Snowy Mountains Airport	Oceania	AU	Australia	New South Wales	Cooma	-36.300445	148.972408
6780	COJ	Coonabarabran Airport	Oceania	AU	Australia	New South Wales	Coonabarabran	-31.33250046	149.2669983
6781	CNB	Coonamble Airport	Oceania	AU	Australia	New South Wales	Coonamble	-30.980946	148.377833
6782	CJF	Coondewanna Airport	Oceania	AU	Australia	Western Australia	Coondewanna	-22.9666996	118.8130035
6783	CRJ	Coorabie Airport	Oceania	AU	Australia	South Australia	Coorabie	-31.89439964	132.2960052
6784	CMD	Cootamundra Airport	Oceania	AU	Australia	New South Wales	Cootamundra	-34.62390137	148.0279999
6785	ODL	Cordillo Downs Airport	Oceania	AU	Australia	South Australia	Cordillo Downs	-26.74530029	140.6380005
6786	CWW	Corowa Airport	Oceania	AU	Australia	New South Wales	Corowa	-35.99470139	146.3569946
6787	CYG	Corryong Airport	Oceania	AU	Australia	Victoria	Corryong	-36.18280029	147.8880005
6788	CWR	Cowarie Airport	Oceania	AU	Australia	South Australia	Cowarie	-27.71170044	138.3280029
6789	CCW	Cowell Airport	Oceania	AU	Australia	South Australia	Cowell	-33.66669846	136.8919983
6790	CWT	Cowra Airport	Oceania	AU	Australia	New South Wales	Cowra	-33.846894	148.648007
6791	CSD	Cresswell Downs Airport	Oceania	AU	Australia	Northern Territory	Cresswell Downs	-17.94799995	135.9160004
6792	CKI	Croker Island Airport	Oceania	AU	Australia	Northern Territory	Croker Island	-11.16499996	132.4830017
6793	CDQ	Croydon Airport	Oceania	AU	Australia	Queensland	Croydon	-18.22500038	142.2579956
6794	CUG	Cudal Airport	Oceania	AU	Australia	New South Wales	Cudal	-33.278026	148.768708
6795	CUY	Cue Airport	Oceania	AU	Australia	Western Australia	Cue	-27.44669914	117.9179993
6796	CMA	Cunnamulla Airport	Oceania	AU	Australia	Queensland	Cunnamulla	-28.03000069	145.621994
6797	DJR	Dajarra Airport	Oceania	AU	Australia	Queensland	Dajarra	-21.70829964	139.5330048
6798	DBY	Dalby Airport	Oceania	AU	Australia	Queensland	Dalby	-27.15530014	151.2669983
6799	DGD	Dalgaranga Gold Mine Airport	Oceania	AU	Australia	Western Australia	Dalgaranga Gold Mine	-27.83027778	117.3163889
6800	DVR	Daly River Airport	Oceania	AU	Australia	Northern Territory	Daly River	-13.7498064	130.6938782
6801	DYW	Daly Waters Airport	Oceania	AU	Australia	Northern Territory	Daly Waters	-16.26469507	133.383379
6802	BEE	Beagle Bay Airport	Oceania	AU	Australia	Western Australia	Dampier Peninsula	-17.0165	122.6464
6803	NLF	Darnley Island Airport	Oceania	AU	Australia	Queensland	Darnley Island	-9.583330154	143.7669983
6804	DRW	Darwin International Airport	Oceania	AU	Australia	Northern Territory	Darwin	-12.414322	130.879741
6805	DVP	Davenport Downs Airport	Oceania	AU	Australia	Queensland	Davenport Downs	-24.14999962	141.1080017
6806	DLV	Delissaville Airport	Oceania	AU	Australia	Northern Territory	Delissaville	-12.55000019	130.6849976
6807	DDN	Delta Downs Airport	Oceania	AU	Australia	Queensland	Delta Downs	-16.99169922	141.3170013
6808	MJK	Shark Bay Airport	Oceania	AU	Australia	Western Australia	Denham	-25.89389992	113.5770035
6809	DNQ	Deniliquin Airport	Oceania	AU	Australia	New South Wales	Deniliquin	-35.55939865	144.9459991
6810	DRB	Derby Airport	Oceania	AU	Australia	Western Australia	Derby	-17.37193	123.66221
6811	DCN	RAAF Base Curtin	Oceania	AU	Australia	Western Australia	Derby	-17.5814	123.828003
6812	DPO	Devonport Airport	Oceania	AU	Australia	Tasmania	Devonport	-41.16970062	146.4299927
6813	DYM	Diamantina Lakes Airport	Oceania	AU	Australia	Queensland	Diamantina Lakes	-23.76169968	141.1450043
6814	DRN	Dirranbandi Airport	Oceania	AU	Australia	Queensland	Dirranbandi	-28.587912	148.217161
6815	DKV	Docker River Airport	Oceania	AU	Australia	Northern Territory	Docker River	-24.86000061	129.0700073
6816	DOX	Dongara Airport	Oceania	AU	Australia	Western Australia	Dongara	-29.298128	114.927334
6817	DMD	Doomadgee Airport	Oceania	AU	Australia	Queensland	Doomadgee	-17.9403	138.822006
6818	DNG	Doongan Airport	Oceania	AU	Australia	Western Australia	Doongan	-15.386429	126.302235
6819	DRD	Dorunda Airport	Oceania	AU	Australia	Queensland	Dorunda Outstation	-16.5537	141.8238
6820	DFP	Drumduff Airport	Oceania	AU	Australia	Queensland	Drumduff	-16.0529995	143.0119934
6821	DRY	Drysdale River Airport	Oceania	AU	Australia	Western Australia	Drysdale River	-15.71357	126.381097
6822	DBO	Dubbo City Regional Airport	Oceania	AU	Australia	New South Wales	Dubbo	-32.21670151	148.5749969
6823	DLK	Dulkaninna Airport	Oceania	AU	Australia	South Australia	Dulkaninna	-29.01329994	138.4810028
6824	DNB	Dunbar Airport	Oceania	AU	Australia	Queensland	Dunbar	-16.04999924	142.3999939
6825	DKI	Dunk Island Airport	Oceania	AU	Australia	Queensland	Dunk Island	-17.93913	146.141447
6826	DHD	Durham Downs Airport	Oceania	AU	Australia	Queensland	Durham Downs	-27.07500076	141.8999939
6827	DRR	Durrie Airport	Oceania	AU	Australia	Queensland	Durrie	-25.68499947	140.2279968
6828	DYA	Dysart Airport	Oceania	AU	Australia	Queensland	Dysart	-22.62220001	148.3639984
6829	ECH	Echuca Airport	Oceania	AU	Australia	Victoria	Echuca	-36.15719986	144.7619934
6830	EIH	Einasleigh Airport	Oceania	AU	Australia	Queensland	Einasleigh	-18.50329971	144.0939941
6831	ELC	Elcho Island Airport	Oceania	AU	Australia	Northern Territory	Elcho Island	-12.01939964	135.5709991
6832	WHB	Eliwana	Oceania	AU	Australia	Western Australia	Eliwana	-22.428395	116.887879
6833	EKD	Elkedra Airport	Oceania	AU	Australia	Northern Territory	Elkedra	-21.17250061	135.4440002
6834	ERQ	Elrose Airport	Oceania	AU	Australia	Queensland	Elrose Mine	-20.9764	141.0066
6835	EMD	Emerald Airport	Oceania	AU	Australia	Queensland	Emerald	-23.56749916	148.1790009
6836	ENB	Eneabba Airport	Oceania	AU	Australia	Western Australia	Eneabba	-29.83250046	115.2460022
6837	EDD	Erldunda Airport	Oceania	AU	Australia	Northern Territory	Erldunda	-25.2057991	133.2539978
6838	ERB	Ernabella Airport	Oceania	AU	Australia	South Australia	Ernabella	-26.26329994	132.1820068
6839	EPR	Esperance Airport	Oceania	AU	Australia	Western Australia	Esperance	-33.684399	121.822998
6840	MEB	Melbourne Essendon Airport	Oceania	AU	Australia	Victoria	Essendon Fields	-37.7281	144.901993
6841	ETD	Etadunna Airport	Oceania	AU	Australia	South Australia	Etadunna	-28.74080086	138.5890045
6842	EUC	Eucla Airport	Oceania	AU	Australia	Western Australia	Eucla	-31.707084	128.877243
6843	EVD	Eva Downs Airport	Oceania	AU	Australia	Northern Territory	Eva Downs	-18.00099945	134.8630066
6844	EVH	Evans Head Aerodrome	Oceania	AU	Australia	New South Wales	Evans Head Aerodrome	-29.101786	153.419255
6845	LEA	Learmonth Airport	Oceania	AU	Australia	Western Australia	Exmouth	-22.235201	114.090024
6846	EXM	Exmouth Airport	Oceania	AU	Australia	Western Australia	Exmouth	-22.040677	114.102663
6847	FIK	Finke Airport	Oceania	AU	Australia	Northern Territory	Finke	-25.59469986	134.5829926
6848	FLY	Finley Airport	Oceania	AU	Australia	New South Wales	Finley	-35.658918	145.561214
6849	FIZ	Fitzroy Crossing Airport	Oceania	AU	Australia	Western Australia	Fitzroy Crossing	-18.18190002	125.5589981
6850	FLS	Flinders Island Airport	Oceania	AU	Australia	Tasmania	Flinders Island	-40.09170151	147.9929962
6851	FVL	Flora Valley Airport	Oceania	AU	Australia	Western Australia	Flora Valley	-18.2833004	128.4170074
6852	FRB	Forbes Airport	Oceania	AU	Australia	New South Wales	Forbes	-33.363602	147.934998
6853	FOS	Forrest Airport	Oceania	AU	Australia	Western Australia	Forrest	-30.83662	128.112811
6854	FOT	Forster (Wallis Is) Airport	Oceania	AU	Australia	New South Wales	Forster (Wallis Is)	-32.20420074	152.4790039
6855	FSL	Fossil Downs Airport	Oceania	AU	Australia	Western Australia	Fossil Downs Station	-18.1321	125.7873
6856	GBP	Gamboola Airport	Oceania	AU	Australia	Queensland	Gamboola	-16.54999924	143.6670074
6857	GPN	Garden Point Airport	Oceania	AU	Australia	Northern Territory	Garden Point	-11.40250015	130.4219971
6858	GSC	Gascoyne Junction Airport	Oceania	AU	Australia	Western Australia	Gascoyne Junction	-25.0546	115.2026
6859	GAH	Gayndah Airport	Oceania	AU	Australia	Queensland	Gayndah	-25.61440086	151.6190033
6860	GTT	Georgetown Airport	Oceania	AU	Australia	Queensland	Georgetown	-18.302676	143.530925
6861	GEE	Georgetown (Tas) Airport	Oceania	AU	Australia	Tasmania	Georgetown (Tas)	-41.079368	146.839851
6862	GET	Geraldton Airport	Oceania	AU	Australia	Western Australia	Geraldton	-28.796101	114.707001
6863	GBV	Gibb River Airport	Oceania	AU	Australia	Western Australia	Gibb	-16.418661	126.445685
6864	GBW	Ginbata Airport	Oceania	AU	Australia	Western Australia	Ginbata	-22.5812	120.03553
6865	GLT	Gladstone Airport	Oceania	AU	Australia	Queensland	Gladstone	-23.869763	151.225439
6866	GLI	Glen Innes Airport	Oceania	AU	Australia	New South Wales	Glen Innes	-29.67499924	151.6889954
6867	GLG	Glengyle Airport	Oceania	AU	Australia	Queensland	Glengyle	-24.80830002	139.6000061
6868	GLM	Glenormiston Airport	Oceania	AU	Australia	Queensland	Glenormiston	-22.88829994	138.8249969
6869	OOL	Gold Coast Airport	Oceania	AU	Australia	Queensland	Gold Coast	-28.165962	153.506641
6870	GOO	Goondiwindi Airport	Oceania	AU	Australia	Queensland	Goondiwindi	-28.52140045	150.3200073
6871	GDD	Gordon Downs Airport	Oceania	AU	Australia	Western Australia	Gordon Downs	-18.67810059	128.5919952
6872	GUL	Goulburn Airport	Oceania	AU	Australia	New South Wales	Goulburn	-34.81029892	149.7259979
6873	GFN	Grafton Airport	Oceania	AU	Australia	New South Wales	Grafton	-29.75939941	153.0299988
6874	GKL	Great Keppel Is Airport	Oceania	AU	Australia	Queensland	Great Keppel Island	-23.184575	150.94164
6875	GVP	Greenvale Airport	Oceania	AU	Australia	Queensland	Greenvale	-18.9966	145.0136
6876	GGD	Gregory Downs Airport	Oceania	AU	Australia	Queensland	Gregory Downs	-18.625	139.2330017
6877	GFE	Grenfell Airport	Oceania	AU	Australia	New South Wales	Grenfell	-34	148.1329956
6878	GFF	Griffith Airport	Oceania	AU	Australia	New South Wales	Griffith	-34.25080109	146.0670013
6879	GTE	Groote Eylandt Airport	Oceania	AU	Australia	Northern Territory	Groote Eylandt	-13.97500038	136.4600067
6880	GUH	Gunnedah Airport	Oceania	AU	Australia	New South Wales	Gunnedah	-30.96109962	150.2510071
6881	GYP	Gympie Airport	Oceania	AU	Australia	Queensland	Gympie	-26.290149	152.702998
6882	HCQ	Halls Creek Airport	Oceania	AU	Australia	Western Australia	Halls Creek	-18.23390007	127.6699982
6883	HLT	Hamilton Airport	Oceania	AU	Australia	Victoria	Hamilton	-37.64889908	142.0650024
6884	HTI	Hamilton Island Airport	Oceania	AU	Australia	Queensland	Hamilton Island	-20.35810089	148.9519959
6885	HWK	Wilpena Pound Airport	Oceania	AU	Australia	South Australia	Hawker	-31.85590744	138.4680786
6886	HXX	Hay Airport	Oceania	AU	Australia	New South Wales	Hay	-34.53139877	144.8300018
6887	HIS	Hayman Island Resort Seaplane Base	Oceania	AU	Australia	Queensland	Hayman Island	-20.05999947	148.8809967
6888	HIP	Headingly Airport	Oceania	AU	Australia	Queensland	Headingly	-21.33329964	138.2830048
6889	HAT	Heathlands Airport	Oceania	AU	Australia	Queensland	Heathlands	-11.73690033	142.5769959
6890	HLV	Helenvale Airport	Oceania	AU	Australia	Queensland	Helenvale	-15.6857996	145.2149963
6891	HRY	Henbury Airport	Oceania	AU	Australia	Northern Territory	Henbury	-24.584	133.236
6892	HMG	Hermannsburg Airport	Oceania	AU	Australia	Northern Territory	Hermannsburg	-23.93000031	132.8049927
6893	HVB	Hervey Bay Airport	Oceania	AU	Australia	Queensland	Hervey Bay	-25.320127	152.880662
6894	HIG	Highbury Airport	Oceania	AU	Australia	Queensland	Highbury	-16.42440033	143.1459961
6895	HLL	Hillside Airport	Oceania	AU	Australia	Western Australia	Hillside	-21.718283	119.440334
6896	HBA	Hobart International Airport	Oceania	AU	Australia	Tasmania	Hobart	-42.83610153	147.5099945
6897	HPE	Hope Vale Airport	Oceania	AU	Australia	Queensland	Hope Vale	-15.2923	145.1035
6898	HTU	Hopetoun Airport	Oceania	AU	Australia	Victoria	Hopetoun	-35.71530151	142.3600006
6899	HID	Horn Island Airport	Oceania	AU	Australia	Queensland	Horn Island	-10.585628	142.292653
6900	HSM	Horsham Airport	Oceania	AU	Australia	Victoria	Horsham	-36.66970062	142.1730042
6901	HGD	Hughenden Airport	Oceania	AU	Australia	Queensland	Hughenden	-20.81500053	144.2250061
6902	HUB	Humbert River Airport	Oceania	AU	Australia	Northern Territory	Humbert River	-16.4896698	130.6302795
6903	IFF	Iffley Airport	Oceania	AU	Australia	Queensland	Iffley	-18.89999962	141.2169952
6904	IDK	Indulkana Airport	Oceania	AU	Australia	South Australia	Indulkana	-26.9666996	133.3249969
6905	IGH	Ingham Airport	Oceania	AU	Australia	Queensland	Ingham	-18.664149	146.145804
6906	INJ	Injune Airport	Oceania	AU	Australia	Queensland	Injune	-25.851	148.5497
6907	IKP	Inkerman Airport	Oceania	AU	Australia	Queensland	Inkerman	-16.229225	141.434607
6908	INM	Innamincka Airport	Oceania	AU	Australia	South Australia	Innamincka	-27.697589	140.739498
6909	IFL	Innisfail Airport	Oceania	AU	Australia	Queensland	Innisfail	-17.55940056	146.0119934
6910	IVR	Inverell Airport	Oceania	AU	Australia	New South Wales	Inverell	-29.88829994	151.1439972
6911	IVW	Inverway Airport	Oceania	AU	Australia	Northern Territory	Inverway	-17.84110069	129.6430054
6912	PEA	Penneshaw Airport	Oceania	AU	Australia	South Australia	Ironstone	-35.75584629	137.9628754
6913	ISI	Isisford Airport	Oceania	AU	Australia	Queensland	Isisford	-24.25830078	144.4250031
6914	JAB	Jabiru Airport	Oceania	AU	Australia	Northern Territory	Jabiru	-12.6583004	132.8930054
6915	QJD	Jindabyne Airport	Oceania	AU	Australia	New South Wales	Jindabyne	-36.429573	148.599916
6916	JCK	Julia Creek Airport	Oceania	AU	Australia	Queensland	Julia Creek	-20.66830063	141.7230072
6917	JUN	Jundah Airport	Oceania	AU	Australia	Queensland	Jundah	-24.838045	143.061962
6918	JUR	Jurien Bay Airport	Oceania	AU	Australia	Western Australia	Jurien Bay	-30.302699	115.055551
6919	KAX	Kalbarri Airport	Oceania	AU	Australia	Western Australia	Kalbarri	-27.692813	114.259169
6920	KGI	Kalgoorlie Boulder Airport	Oceania	AU	Australia	Western Australia	Kalgoorlie	-30.7894001	121.461998
6921	KFG	Kalkgurung Airport	Oceania	AU	Australia	Northern Territory	Kalkgurung	-17.43190002	130.8079987
6922	KPP	Kalpowar Airport	Oceania	AU	Australia	Queensland	Kalpower	-14.89	144.22
6923	UBU	Kalumburu Airport	Oceania	AU	Australia	Western Australia	Kalumburu	-14.28829956	126.6320038
6924	KDS	Kamaran Downs Airport	Oceania	AU	Australia	Queensland	Kamaran Downs	-24.3388	139.2785
6925	KDB	Kambalda Airport	Oceania	AU	Australia	Western Australia	Kambalda	-31.1907	121.5978
6926	KML	Kamileroi Airport	Oceania	AU	Australia	Queensland	Kamileroi	-19.375	140.0570068
6927	PDN	Parndana Airport	Oceania	AU	Australia	South Australia	Kangaroo Island	-35.807	137.264
6928	SLJ	Solomon Airport	Oceania	AU	Australia	Western Australia	Karijini National Park	-22.25677	117.850454
6929	KTA	Karratha Airport	Oceania	AU	Australia	Western Australia	Karratha	-20.71220016	116.7730026
6930	KRB	Karumba Airport	Oceania	AU	Australia	Queensland	Karumba	-17.45669937	140.8300018
6931	KNI	Katanning Airport	Oceania	AU	Australia	Western Australia	Katanning	-33.699423	117.65703
6932	KPS	Kempsey Airport	Oceania	AU	Australia	New South Wales	Kempsey	-31.07439995	152.7700043
6933	KRA	Kerang Airport	Oceania	AU	Australia	Victoria	Kerang	-35.75139999	143.9389954
6934	KBD	Kimberley Downs Airport	Oceania	AU	Australia	Western Australia	Kimberley Downs	-17.39780045	124.3550034
6935	KNS	King Island Airport	Oceania	AU	Australia	Tasmania	King Island	-39.87749863	143.878006
6936	KGY	Kingaroy Airport	Oceania	AU	Australia	Queensland	Kingaroy	-26.581077	151.839927
6937	KBJ	Kings Canyon Airport	Oceania	AU	Australia	Northern Territory	Kings Canyon Resort	-24.26000023	131.4900055
6938	KCS	Kings Creek Airport	Oceania	AU	Australia	Northern Territory	Kings Creek	-24.42329979	131.8350067
6939	KGC	Kingscote Airport	Oceania	AU	Australia	South Australia	Kingscote	-35.71390152	137.5209961
6940	KBB	Kirkimbie Station Airport	Oceania	AU	Australia	Northern Territory	Kirkimbie	-17.7791996	129.2100067
6941	OOD	Koodaideri Mine Airport	Oceania	AU	Australia	Western Australia	Koodaideri Mine	-22.504291	119.07683
6942	KOH	Koolatah Airport	Oceania	AU	Australia	Queensland	Koolatah	-15.88860035	142.4389954
6943	KKP	Koolburra Airport	Oceania	AU	Australia	Queensland	Koolburra	-15.31890011	143.9550018
6944	KWM	Kowanyama Airport	Oceania	AU	Australia	Queensland	Kowanyama	-15.48516	141.751852
6945	KGR	Kulgera Airport	Oceania	AU	Australia	Northern Territory	Kulgera	-25.84280014	133.2920074
6946	KNX	East Kimberley Regional (Kununurra) Airport	Oceania	AU	Australia	Western Australia	Kununurra	-15.7781	128.707993
6947	KRD	Kurundi Airport	Oceania	AU	Australia	Northern Territory	Kurundi Station	-20.51	134.6706
6948	LYT	Lady Elliot Island Airstrip	Oceania	AU	Australia	Queensland	Lady Elliot Island	-24.1129	152.7156
6949	HOK	Hooker Creek Airport	Oceania	AU	Australia	Northern Territory	Lajamanu	-18.33670044	130.6380005
6950	LEL	Lake Evella Airport	Oceania	AU	Australia	Northern Territory	Lake Evella	-12.49890041	135.8059998
6951	LGE	Mulan Airport	Oceania	AU	Australia	Western Australia	Lake Gregory	-20.1089	127.619
6952	BEO	Lake Macquarie Airport	Oceania	AU	Australia	New South Wales	Lake Macquarie	-33.065975	151.646283
6953	LFP	Lakefield Airport	Oceania	AU	Australia	Queensland	Lakefield	-14.9207	144.203
6954	BZP	Bizant Airport	Oceania	AU	Australia	Queensland	Lakefield National Park	-14.74027778	144.1194444
6955	LKD	Lakeland Airport	Oceania	AU	Australia	Queensland	Lakeland Downs	-15.841213	144.849118
6956	LDW	Lansdowne Airport	Oceania	AU	Australia	Western Australia	Lansdowne Station	-17.6128	126.743
6957	AVV	Avalon Airport	Oceania	AU	Australia	Victoria	Lara	-38.039398	144.468994
6958	LST	Launceston Airport	Oceania	AU	Australia	Tasmania	Launceston	-41.54529953	147.2140045
6959	LUU	Laura Airport	Oceania	AU	Australia	Queensland	Laura	-15.560495	144.451418
6960	LUT	New Laura Airport	Oceania	AU	Australia	Queensland	Laura Station	-15.182758	144.345535
6961	LVO	Laverton Airport	Oceania	AU	Australia	Western Australia	Laverton	-28.614267	122.428673
6962	LWH	Lawn Hill Airport	Oceania	AU	Australia	Queensland	Lawn Hill	-18.56830025	138.6349945
6963	LGH	Leigh Creek Airport	Oceania	AU	Australia	South Australia	Leigh Creek	-30.598301	138.425995
6964	LER	Leinster Airport	Oceania	AU	Australia	Western Australia	Leinster	-27.84329987	120.7030029
6965	LNO	Leonora Airport	Oceania	AU	Australia	Western Australia	Leonora	-28.87809944	121.3150024
6966	LHG	Lightning Ridge Airport	Oceania	AU	Australia	New South Wales	Lightning Ridge	-29.452857	147.977146
6967	LIB	Limbunya Airport	Oceania	AU	Australia	Northern Territory	Limbunya	-17.23559952	129.8820038
6968	LDC	Lindeman Island Airport	Oceania	AU	Australia	Queensland	Lindeman Island	-20.45359993	149.0399933
6969	LSY	Lismore Airport	Oceania	AU	Australia	New South Wales	Lismore	-28.830689	153.258419
6970	LLL	Lissadell Airport	Oceania	AU	Australia	Western Australia	Lissadell Station	-16.661	128.594
6971	LZR	Lizard Island Airport	Oceania	AU	Australia	Queensland	Lizard Island	-14.673273	145.454571
6972	LOC	Lock Airport	Oceania	AU	Australia	South Australia	Lock	-33.5442009	135.6929932
6973	IRG	Lockhart River Airport	Oceania	AU	Australia	Queensland	Lockhart River	-12.7869	143.304993
6974	LRE	Longreach Airport	Oceania	AU	Australia	Queensland	Longreach	-23.43420029	144.2799988
6975	LDH	Lord Howe Island Airport	Oceania	AU	Australia	New South Wales	Lord Howe Island	-31.538204	159.07546
6976	LOA	Lorraine Airport	Oceania	AU	Australia	Queensland	Lorraine	-18.99329948	139.9069977
6977	LTV	Lotus Vale Airport	Oceania	AU	Australia	Queensland	Lotus Vale	-17.04829979	141.3760071
6978	LTP	Lyndhurst Airport	Oceania	AU	Australia	Queensland	Lyndhurst	-19.19580078	144.3710022
6979	UBB	Mabuiag Island Airport	Oceania	AU	Australia	Queensland	Mabuiag Island	-9.950168	142.19523
6980	MNW	Macdonald Downs Airport	Oceania	AU	Australia	Northern Territory	Macdonald Downs	-22.44400024	135.1990051
6981	MKY	Mackay Airport	Oceania	AU	Australia	Queensland	Mackay	-21.170816	149.182588
6982	MIZ	Mainoru Airstrip	Oceania	AU	Australia	Northern Territory	Mainoru	-14.0533	134.0942
6983	MTL	Maitland Airport	Oceania	AU	Australia	New South Wales	Maitland	-32.701265	151.492912
6984	XMC	Mallacoota Airport	Oceania	AU	Australia	Victoria	Mallacoota	-37.59830093	149.7200012
6985	MQA	Mandora Airport	Oceania	AU	Australia	Western Australia	Mandora	-19.73830032	120.8379974
6986	MNG	Maningrida Airport	Oceania	AU	Australia	Northern Territory	Maningrida	-12.05609989	134.2339935
6987	MJP	Manjimup Airport	Oceania	AU	Australia	Western Australia	Manjimup	-34.26530075	116.1399994
6988	MFP	Manners Creek Airport	Oceania	AU	Australia	Northern Territory	Manners Creek	-22.10000038	137.9830017
6989	MBB	Marble Bar Airport	Oceania	AU	Australia	Western Australia	Marble Bar	-21.16329956	119.8330002
6990	MRG	Mareeba Airport	Oceania	AU	Australia	Queensland	Mareeba	-17.06920052	145.4190063
6991	MQZ	Margaret River Airport	Oceania	AU	Australia	Western Australia	Margaret River	-33.93059921	115.0999985
6992	MGV	Margaret River (Station) Airport	Oceania	AU	Australia	Western Australia	Margaret River (Station)	-18.62170029	126.8830032
6993	MXD	Marion Downs Airport	Oceania	AU	Australia	Queensland	Marion Downs	-23.363702	139.649663
6994	MRP	Marla Airport	Oceania	AU	Australia	South Australia	Marla	-27.33329964	133.6269989
6995	MCY	Sunshine Coast Airport	Oceania	AU	Australia	Queensland	Maroochydore	-26.593324	153.08319
6996	MQE	Marqua Airport	Oceania	AU	Australia	Northern Territory	Marqua	-22.80579948	137.2510071
6997	RRE	Marree Airport	Oceania	AU	Australia	South Australia	Marree	-29.66329956	138.0650024
6998	MBH	Maryborough Airport	Oceania	AU	Australia	Queensland	Maryborough	-25.513528	152.713603
6999	MCV	McArthur River Mine Airport	Oceania	AU	Australia	Northern Territory	McArthur River Mine	-16.44249916	136.0839996
7000	MKR	Meekatharra Airport	Oceania	AU	Australia	Western Australia	Meekatharra	-26.61170006	118.5479965
7001	MEL	Melbourne International Airport	Oceania	AU	Australia	Victoria	Melbourne	-37.673302	144.843002
7002	MBW	Melbourne Moorabbin Airport	Oceania	AU	Australia	Victoria	Melbourne	-37.97579956	145.102005
7003	MIM	Merimbula Airport	Oceania	AU	Australia	New South Wales	Merimbula	-36.90859985	149.901001
7004	MLV	Merluna Airport	Oceania	AU	Australia	Queensland	Merluna	-13.0649	142.4536
7005	RTY	Merty Merty Airport	Oceania	AU	Australia	South Australia	Merty Merty	-28.582713	140.303264
7006	MMM	Middlemount Airport	Oceania	AU	Australia	Queensland	Middlemount	-22.801444	148.706796
7007	MQL	Mildura Airport	Oceania	AU	Australia	Victoria	Mildura	-34.22919846	142.0859985
7008	WLE	Miles Airport	Oceania	AU	Australia	Queensland	Miles	-26.806447	150.168953
7009	MGT	Milingimbi Airport	Oceania	AU	Australia	Northern Territory	Milingimbi Island	-12.09440041	134.8939972
7010	MLR	Millicent Airport	Oceania	AU	Australia	South Australia	Millicent	-37.58359909	140.3659973
7011	XML	Minlaton Airport	Oceania	AU	Australia	South Australia	Minlaton	-34.743801	137.529087
7012	MIN	Minnipa Airport	Oceania	AU	Australia	South Australia	Minnipa	-32.84329987	135.1450043
7013	MWY	Miranda Downs Airport	Oceania	AU	Australia	Queensland	Miranda Downs	-17.328899	141.886002
7014	MTQ	Mitchell Airport	Oceania	AU	Australia	Queensland	Mitchell	-26.48329926	147.9369965
7015	MIH	Mitchell Plateau Airport	Oceania	AU	Australia	Western Australia	Mitchell Plateau	-14.79139996	125.8239975
7016	MIY	Mittebah Airport	Oceania	AU	Australia	Northern Territory	Mittebah	-18.8093	137.0815
7017	KUG	Kubin Airport	Oceania	AU	Australia	Queensland	Moa Island	-10.22500038	142.2180023
7018	ONR	Monkira Airport	Oceania	AU	Australia	Queensland	Monkira	-24.81669998	140.5330048
7019	MNQ	Monto Airport	Oceania	AU	Australia	Queensland	Monto	-24.892267	151.101787
7020	MWT	Moolawatana Airport	Oceania	AU	Australia	South Australia	Moolawatana Station	-29.9069	139.765
7021	MOO	Moomba Airport	Oceania	AU	Australia	South Australia	Moomba	-28.09939957	140.1970062
7022	OOR	Mooraberree Airport	Oceania	AU	Australia	Queensland	Mooraberree	-25.25	140.9830017
7023	MOV	Moranbah Airport	Oceania	AU	Australia	Queensland	Moranbah	-22.05780029	148.0769959
7024	MWB	Morawa Airport	Oceania	AU	Australia	Western Australia	Morawa	-29.20170021	116.0220032
7025	MRZ	Moree Airport	Oceania	AU	Australia	New South Wales	Moree	-29.49889946	149.8450012
7026	MET	Moreton Airport	Oceania	AU	Australia	Queensland	Moreton	-12.44419956	142.6380005
7027	OXY	Morney Airport	Oceania	AU	Australia	Queensland	Morney	-25.35829926	141.4329987
7028	ONG	Mornington Island Airport	Oceania	AU	Australia	Queensland	Mornington Island	-16.66250038	139.1779938
7029	MRT	Moroak Airport	Oceania	AU	Australia	Northern Territory	Moroak	-14.818133	133.700594
7030	MYA	Moruya Airport	Oceania	AU	Australia	New South Wales	Moruya	-35.89780045	150.1439972
7031	TGN	Latrobe Valley Airport	Oceania	AU	Australia	Victoria	Morwell	-38.211004	146.470817
7032	MKV	Mount Cavenagh Airport	Oceania	AU	Australia	Northern Territory	Mount Cavenagh	-25.9666996	133.1999969
7033	MGB	Mount Gambier Airport	Oceania	AU	Australia	South Australia	Mount Gambier	-37.745602	140.785004
7034	GPD	Mount Gordon Airport	Oceania	AU	Australia	Queensland	Mount Gordon Mine	-19.77265	139.40425
7035	GSN	Mount Gunson Airport	Oceania	AU	Australia	South Australia	Mount Gunson	-31.4597	137.1744433
7036	MHU	Mount Hotham Airport	Oceania	AU	Australia	Victoria	Mount Hotham	-37.04750061	147.3339996
7037	ISA	Mount Isa Airport	Oceania	AU	Australia	Queensland	Mount Isa	-20.66390038	139.4889984
7038	WME	Mount Keith Airport	Oceania	AU	Australia	Western Australia	Mount Keith	-27.28733	120.554937
7039	MMG	Mount Magnet Airport	Oceania	AU	Australia	Western Australia	Mount Magnet	-28.11610031	117.8420029
7040	MTD	Mount Sanford Station Airport	Oceania	AU	Australia	Northern Territory	Mount Sanford Station	-16.97830009	130.5549927
7041	MSF	Mount Swan Airport	Oceania	AU	Australia	Northern Territory	Mount Swan	-22.624696	135.034512
7042	MUQ	Muccan Station Airport	Oceania	AU	Australia	Western Australia	Muccan Station	-20.65889931	120.0670013
7043	DGE	Mudgee Airport	Oceania	AU	Australia	New South Wales	Mudgee	-32.564794	149.609452
7044	MUP	Mulga Park Airport	Oceania	AU	Australia	Northern Territory	Mulga Park	-25.86000061	131.6499939
7045	MVK	Mulka Airport	Oceania	AU	Australia	South Australia	Mulka	-28.3477993	138.6499939
7046	MXU	Mullewa Airport	Oceania	AU	Australia	Western Australia	Mullewa	-28.47500038	115.5169983
7047	MNE	Mungeranie Airport	Oceania	AU	Australia	South Australia	Mungeranie	-28.00919914	138.6569977
7048	MYI	Murray Island Airport	Oceania	AU	Australia	Queensland	Murray Island	-9.915105	144.054644
7049	WUI	Murrin Murrin Airport	Oceania	AU	Australia	Western Australia	Murrin Murrin	-28.705299	121.89099
7050	MVU	Musgrave Airport	Oceania	AU	Australia	Queensland	Musgrave	-14.7757	143.5047
7051	UTB	Muttaburra Airport	Oceania	AU	Australia	Queensland	Muttaburra	-22.58329964	144.5330048
7052	MYO	Camballin Airport	Oceania	AU	Australia	Western Australia	Myroodah	-18.12470055	124.2720032
7053	NBH	Nambucca Heads Airport	Oceania	AU	Australia	New South Wales	Nambucca Heads	-30.673058	152.984233
7054	NMR	Nappa Merrie Airport	Oceania	AU	Australia	Queensland	Nappa Merrie	-27.549201	141.158416
7055	NPP	Napperby Airport	Oceania	AU	Australia	Northern Territory	Napperby	-22.5312	132.7632
7056	NAC	Naracoorte Airport	Oceania	AU	Australia	South Australia	Naracoorte	-36.98529816	140.7250061
7057	NAA	Narrabri Airport	Oceania	AU	Australia	New South Wales	Narrabri	-30.31920052	149.8269959
7058	NRA	Narrandera Airport	Oceania	AU	Australia	New South Wales	Narrandera	-34.70220184	146.5119934
7059	NRG	Narrogin Airport	Oceania	AU	Australia	Western Australia	Narrogin	-32.93	117.080002
7060	QRM	Narromine Airport	Oceania	AU	Australia	New South Wales	Narromine	-32.21469879	148.2250061
7061	DXD	Dixie Airport	Oceania	AU	Australia	Queensland	New Dixie	-15.11749443	143.3160496
7062	ZNE	Newman Airport	Oceania	AU	Australia	Western Australia	Newman	-23.4178009	119.8030014
7063	NRY	Newry Airport	Oceania	AU	Australia	Northern Territory	Newry	-16.0442	129.2638
7064	RPM	Ngukurr Airport	Oceania	AU	Australia	Northern Territory	Ngukurr	-14.72280025	134.746994
7065	GOV	Gove Airport	Oceania	AU	Australia	Northern Territory	Nhulunbuy	-12.26939964	136.8179932
7066	NLS	Nicholson Airport	Oceania	AU	Australia	Western Australia	Nicholson	-18.04999924	128.8999939
7067	NKB	Noonkanbah Airport	Oceania	AU	Australia	Western Australia	Noonkanbah	-18.49469948	124.8519974
7068	NSV	Noosa Airport	Oceania	AU	Australia	Queensland	Noosa	-26.423177	153.064935
7069	NTN	Normanton Airport	Oceania	AU	Australia	Queensland	Normanton	-17.68409	141.069664
7070	NSM	Norseman Airport	Oceania	AU	Australia	Western Australia	Norseman	-32.203	121.758127
7071	NOA	Naval Air Station Nowra - HMAS Albatross	Oceania	AU	Australia	New South Wales	Nowra Hill	-34.9466	150.542451
7072	NUR	Nullabor Motel Airport	Oceania	AU	Australia	South Australia	Nullabor Motel	-31.44169998	130.9019928
7073	NLL	Nullagine Airport	Oceania	AU	Australia	Western Australia	Nullagine	-21.91329956	120.197998
7074	NUB	Numbulwar Airport	Oceania	AU	Australia	Northern Territory	Numbulwar	-14.27169991	135.7169952
7075	UTD	Nutwood Downs Airport	Oceania	AU	Australia	Northern Territory	Nutwood Downs	-15.8074	134.1459
7076	NYN	Nyngan Airport	Oceania	AU	Australia	New South Wales	Nyngan	-31.55109978	147.2030029
7077	OKY	Oakey Army Aviation Centre	Oceania	AU	Australia	Queensland	Oakey Army Aviation Centre	-27.409262	151.736727
7078	OPI	Oenpelli Airport	Oceania	AU	Australia	Northern Territory	Oenpelli	-12.32499981	133.0059967
7079	OLP	Olympic Dam Airport	Oceania	AU	Australia	South Australia	Olympic Dam	-30.48500061	136.8769989
7080	ONS	Onslow Airport	Oceania	AU	Australia	Western Australia	Onslow	-21.670161	115.114902
7081	ODD	Oodnadatta Airport	Oceania	AU	Australia	South Australia	Oodnadatta	-27.562473	135.442946
7082	FVR	Oombulgurri Airport	Oceania	AU	Australia	Western Australia	Oombulgurri	-15.1647	127.8401
7083	OAG	Orange Airport	Oceania	AU	Australia	New South Wales	Orange	-33.382014	149.131262
7084	RBS	Orbost Airport	Oceania	AU	Australia	Victoria	Orbost	-37.79000092	148.6100006
7085	OKB	Orchid Beach Airport	Oceania	AU	Australia	Queensland	Orchid Beach	-24.95940018	153.3150024
7086	ODR	Ord River Airport	Oceania	AU	Australia	Western Australia	Ord River	-17.34079933	128.9120026
7087	OXO	Orientos Airport	Oceania	AU	Australia	Queensland	Orientos	-28.0598	141.5361
7088	OSO	Osborne Mine Airport	Oceania	AU	Australia	Queensland	Osborne Mine	-22.08169937	140.5549927
7089	OYN	Ouyen Airport	Oceania	AU	Australia	Victoria	Ouyen	-35.08901243	142.3544884
7090	PXH	Prominent Hill Airport	Oceania	AU	Australia	South Australia	OZ Minerals Prominent Hill Mine	-29.716	135.5244
7091	PMK	Palm Island Airport	Oceania	AU	Australia	Queensland	Palm Island	-18.75530052	146.5809937
7092	PDE	Pandie Pandie Airport	Oceania	AU	Australia	South Australia	Pandie Pandie	-26.122248	139.403501
7093	PBO	Paraburdoo Airport	Oceania	AU	Australia	Western Australia	Paraburdoo	-23.17110062	117.7450027
7094	PRD	Pardoo Airport	Oceania	AU	Australia	Western Australia	Pardoo	-20.119428	119.571945
7095	PKE	Parkes Airport	Oceania	AU	Australia	New South Wales	Parkes	-33.13140106	148.2389984
7096	PEY	Penong Airport	Oceania	AU	Australia	South Australia	Penong	-31.91670036	133
7097	PEP	Peppimenarti Airport	Oceania	AU	Australia	Northern Territory	Peppimenarti	-14.14420033	130.0910034
7098	PER	Perth International Airport	Oceania	AU	Australia	Western Australia	Perth	-31.94029999	115.9670029
7099	JAD	Perth Jandakot Airport	Oceania	AU	Australia	Western Australia	Perth	-32.09749985	115.8809967
7100	PHQ	The Monument Airport	Oceania	AU	Australia	Queensland	Phosphate Hill	-21.81110001	139.923996
7101	EDR	Pormpuraaw Airport	Oceania	AU	Australia	Queensland	Pormpuraaw	-14.896451	141.60908
7102	PUG	Port Augusta Airport	Oceania	AU	Australia	South Australia	Port Augusta	-32.50690079	137.7169952
7103	PHE	Port Hedland International Airport	Oceania	AU	Australia	Western Australia	Port Hedland	-20.37779999	118.6259995
7104	PLO	Port Lincoln Airport	Oceania	AU	Australia	South Australia	Port Lincoln	-34.6053009	135.8800049
7105	PQQ	Port Macquarie Airport	Oceania	AU	Australia	New South Wales	Port Macquarie	-31.43580055	152.8630066
7106	PPI	Port Pirie Airport	Oceania	AU	Australia	South Australia	Port Pirie	-33.23889923	137.9949951
7107	PTJ	Portland Airport	Oceania	AU	Australia	Victoria	Portland	-38.31809998	141.470993
7108	PPP	Proserpine Whitsunday Coast Airport	Oceania	AU	Australia	Queensland	Proserpine	-20.494416	148.553583
7109	BXF	Bellburn Airstrip	Oceania	AU	Australia	Western Australia	Pumululu National Park	-17.545	128.305
7110	UEE	Queenstown Airport	Oceania	AU	Australia	Tasmania	Queenstown	-42.075001	145.531998
7111	ULP	Quilpie Airport	Oceania	AU	Australia	Queensland	Quilpie	-26.61219978	144.253006
7112	UIR	Quirindi Airport	Oceania	AU	Australia	New South Wales	Quirindi	-31.498177	150.521708
7113	RAM	Ramingining Airport	Oceania	AU	Australia	Northern Territory	Ramingining	-12.35639954	134.897995
7114	RVT	Ravensthorpe Airport	Oceania	AU	Australia	Western Australia	Ravensthorpe	-33.79719925	120.2080002
7115	RMK	Renmark Airport	Oceania	AU	Australia	South Australia	Renmark	-34.19639969	140.673996
7116	XRH	RAAF Base Richmond	Oceania	AU	Australia	New South Wales	Richmond	-33.604652	150.783051
7117	RCM	Richmond Airport	Oceania	AU	Australia	Queensland	Richmond	-20.70190048	143.1150055
7118	ROH	Robinhood Airport	Oceania	AU	Australia	Queensland	Robinhood	-18.84499931	143.7100067
7119	RRV	Robinson River Airport	Oceania	AU	Australia	Northern Territory	Robinson River	-16.71829987	136.9450073
7120	RBC	Robinvale Airport	Oceania	AU	Australia	Victoria	Robinvale	-34.642887	142.773042
7121	ROK	Rockhampton Airport	Oceania	AU	Australia	Queensland	Rockhampton	-23.380019	150.475359
7122	RDA	Rockhampton Downs Airport	Oceania	AU	Australia	Northern Territory	Rockhampton Downs	-18.95330048	135.201004
7123	RBU	Roebourne Airport	Oceania	AU	Australia	Western Australia	Roebourne	-20.763898	117.155199
7124	RKY	Rokeby Airport	Oceania	AU	Australia	Queensland	Rokeby	-13.6434	142.641
7125	RMA	Roma Airport	Oceania	AU	Australia	Queensland	Roma	-26.54500008	148.7749939
7126	RPB	Roper Bar Airport	Oceania	AU	Australia	Northern Territory	Roper Bar	-14.734814	134.525485
7127	RPV	Roper Valley Airport	Oceania	AU	Australia	Northern Territory	Roper Valley	-14.9215	134.05
7128	RSB	Roseberth Airport	Oceania	AU	Australia	Queensland	Roseberth	-25.825737	139.627476
7129	RLP	Rosella Plains Airport	Oceania	AU	Australia	Queensland	Rosella Plains	-18.4253	144.4587
7130	RTS	Rottnest Island Airport	Oceania	AU	Australia	Western Australia	Rottnest Island	-32.006699	115.540001
7131	RHL	Roy Hill Station Airport	Oceania	AU	Australia	Western Australia	Roy Hill Station	-22.62581589	119.9590302
7132	SBR	Saibai Island Airport	Oceania	AU	Australia	Queensland	Saibai Island	-9.378330231	142.625
7133	SXE	West Sale Airport	Oceania	AU	Australia	Victoria	Sale	-38.090827	146.965335
7134	SRM	Sandringham Airport	Oceania	AU	Australia	Queensland	Sandringham Station	-24.0568	139.0821
7135	NDS	Sandstone Airport	Oceania	AU	Australia	Western Australia	Sandstone	-27.97999954	119.2969971
7136	NSO	Scone Airport	Oceania	AU	Australia	New South Wales	Scone	-32.03720093	150.8320007
7137	SWB	Shaw River Airport	Oceania	AU	Australia	Western Australia	Shaw River	-21.51029968	119.3619995
7138	SGP	Shay Gap Airport	Oceania	AU	Australia	Western Australia	Shay Gap	-20.42469978	120.1409988
7139	SHT	Shepparton Airport	Oceania	AU	Australia	Victoria	Shepparton	-36.428341	145.391473
7140	JHQ	Shute Harbour Airport	Oceania	AU	Australia	Queensland	Shute Harbour	-20.277221	148.755556
7141	SSP	Silver Plains Airport	Oceania	AU	Australia	Queensland	Silver Plains	-13.9754	143.5537
7142	SIX	Singleton Airport	Oceania	AU	Australia	New South Wales	Singleton	-32.600832	151.193056
7143	SHU	Smith Point Airport	Oceania	AU	Australia	Northern Territory	Smith Point	-11.133566	132.15957
7144	SIO	Smithton Airport	Oceania	AU	Australia	Tasmania	Smithton	-40.83499908	145.0839996
7145	SNB	Snake Bay Airport	Oceania	AU	Australia	Northern Territory	Snake Bay	-11.42280006	130.654007
7146	ZGL	South Galway Airport	Oceania	AU	Australia	Queensland	South Galway	-25.68330002	142.1080017
7147	GBL	South Goulburn Is Airport	Oceania	AU	Australia	Northern Territory	South Goulburn Is	-11.64999962	133.3820038
7148	SQC	Southern Cross Airport	Oceania	AU	Australia	Western Australia	Southern Cross	-31.23999977	119.3600006
7149	SHQ	Southport Airport	Oceania	AU	Australia	Queensland	Southport	-27.921848	153.371469
7150	SCG	Spring Creek Airport	Oceania	AU	Australia	Queensland	Spring Creek	-18.637704	144.545672
7151	KSV	Springvale Airport	Oceania	AU	Australia	Queensland	Springvale	-23.54999924	140.6999969
7152	ZVG	Springvale Airport	Oceania	AU	Australia	Western Australia	Springvale	-17.78689957	127.6699982
7153	SGO	St George Airport	Oceania	AU	Australia	Queensland	St George	-28.04969978	148.5950012
7154	HLS	St Helens Airport	Oceania	AU	Australia	Tasmania	St Helens	-41.33670044	148.2819977
7155	SNH	Stanthorpe Airport	Oceania	AU	Australia	Queensland	Stanthorpe	-28.620113	151.983281
7156	SWC	Stawell Airport	Oceania	AU	Australia	Victoria	Stawell	-37.07170105	142.7409973
7157	STF	Stephens Island Seaplane Base	Oceania	AU	Australia	Queensland	Stephens Island	-9.51	143.55
7158	SRR	Dunwich Airport	Oceania	AU	Australia	Queensland	Stradbroke Island	-27.519942	153.42802
7159	SRN	Strahan Airport	Oceania	AU	Australia	Tasmania	Strahan	-42.15499878	145.2920074
7160	STH	Strathmore Airport	Oceania	AU	Australia	Queensland	Strathmore	-17.862709	142.557788
7161	KBY	Streaky Bay Airport	Oceania	AU	Australia	South Australia	Streaky Bay	-32.83580017	134.2929993
7162	SSK	Sturt Creek Airport	Oceania	AU	Australia	Western Australia	Sturt Creek	-19.16640091	128.173996
7163	SYU	Warraber Island Airport	Oceania	AU	Australia	Queensland	Sue Islet	-10.20829964	142.8249969
7164	SWH	Swan Hill Airport	Oceania	AU	Australia	Victoria	Swan Hill	-35.37580109	143.5330048
7165	RSE	Rose Bay Seaplane Base	Oceania	AU	Australia	New South Wales	Sydney	-33.869	151.262
7166	BWU	Sydney Bankstown Airport	Oceania	AU	Australia	New South Wales	Sydney	-33.923618	150.990792
7167	SYD	Sydney Kingsford Smith International Airport	Oceania	AU	Australia	New South Wales	Sydney	-33.94609833	151.177002
7168	LBH	Palm Beach Seaplane Base	Oceania	AU	Australia	Victoria	Sydney	-33.5871	151.3234
7169	TBL	Tableland Homestead Airport	Oceania	AU	Australia	Western Australia	Tableland Homestead	-17.2833004	126.9000015
7170	TMW	Tamworth Airport	Oceania	AU	Australia	New South Wales	Tamworth	-31.077898	150.845484
7171	AAB	Arrabury Airport	Oceania	AU	Australia	Queensland	Tanbar	-26.69639	141.048718
7172	TXR	Tanbar Airport	Oceania	AU	Australia	Queensland	Tanbar Station	-25.8477993	141.9279938
7173	TAN	Tangalooma Airport	Oceania	AU	Australia	Queensland	Tangalooma	-27.137693	153.364141
7174	XTR	Tara Airport	Oceania	AU	Australia	Queensland	Tara	-27.163054	150.476423
7175	TAQ	Tarcoola Airport	Oceania	AU	Australia	South Australia	Tarcoola	-30.70330048	134.5839996
7176	TRO	Taree Airport	Oceania	AU	Australia	New South Wales	Taree	-31.8885994	152.5140076
7177	XTO	Taroom Airport	Oceania	AU	Australia	Queensland	Taroom	-25.80170059	149.8999939
7178	TEF	Telfer Airport	Oceania	AU	Australia	Western Australia	Telfer	-21.71500015	122.2289963
7179	TEM	Temora Airport	Oceania	AU	Australia	New South Wales	Temora	-34.421398	147.511993
7180	TCA	Tennant Creek Airport	Oceania	AU	Australia	Northern Territory	Tennant Creek	-19.63439941	134.1829987
7181	XTG	Thargomindah Airport	Oceania	AU	Australia	Queensland	Thargomindah	-27.9864006	143.8110046
7182	GTS	The Granites Airport	Oceania	AU	Australia	Northern Territory	The Granites Gold Mine	-20.5483	130.347
7183	TDN	Theda Station Airport	Oceania	AU	Australia	Western Australia	Theda Station	-14.78810024	126.4960022
7184	TDR	Theodore Airport	Oceania	AU	Australia	Queensland	Theodore	-24.99329948	150.0930023
7185	TYG	Thylungra Airport	Oceania	AU	Australia	Queensland	Thylungra	-26.08329964	143.4669952
7186	TYB	Tibooburra Airport	Oceania	AU	Australia	New South Wales	Tibooburra	-29.4510994	142.0579987
7187	TBK	Timber Creek Airport	Oceania	AU	Australia	Northern Territory	Timber Creek	-15.61999989	130.4450073
7188	KTR	Tindal Airport	Oceania	AU	Australia	Northern Territory	Tindal	-14.52110004	132.378006
7189	TYP	Tobermorey Airport	Oceania	AU	Australia	Northern Territory	Tobermorey	-22.25580025	137.9530029
7190	TCW	Tocumwal Airport	Oceania	AU	Australia	New South Wales	Tocumwal	-35.81169891	145.6080017
7191	TPR	Tom Price Airport	Oceania	AU	Australia	Western Australia	Tom Price	-22.74600029	117.8690033
7192	TWB	Toowoomba Airport	Oceania	AU	Australia	Queensland	Toowoomba	-27.543365	151.919112
7193	WTB	Toowoomba Wellcamp Airport	Oceania	AU	Australia	Queensland	Toowoomba	-27.558332	151.793335
7194	TWP	Torwood Airport	Oceania	AU	Australia	Queensland	Torwood	-17.36330032	143.75
7195	TSV	Townsville Airport / RAAF Base Townsville	Oceania	AU	Australia	Queensland	Townsville	-19.252904	146.766512
7196	TQP	Trepell Airport	Oceania	AU	Australia	Queensland	Trepell	-21.83499908	140.8880005
7197	TUM	Tumut Airport	Oceania	AU	Australia	New South Wales	Tumut	-35.268657	148.240474
7198	TKY	Turkey Creek Airport	Oceania	AU	Australia	Western Australia	Turkey Creek	-17.04080009	128.2059937
7199	UDA	Undara Airport	Oceania	AU	Australia	Queensland	Undara	-18.20000076	144.6000061
7200	USL	Useless Loop Airport	Oceania	AU	Australia	Western Australia	Useless Loop	-26.157923	113.394817
7201	VNR	Vanrook Station Airport	Oceania	AU	Australia	Queensland	Vanrook Station	-16.9633007	141.9499969
7202	VCD	Victoria River Downs Airport	Oceania	AU	Australia	Northern Territory	Victoria River Downs	-16.4021244	131.0049744
7203	PKT	Port Keats Airport	Oceania	AU	Australia	Northern Territory	Wadeye	-14.25	129.529007
7204	WGA	Wagga Wagga City Airport	Oceania	AU	Australia	New South Wales	Wagga Wagga	-35.163484	147.46832
7205	WLC	Walcha Airport	Oceania	AU	Australia	New South Wales	Walcha	-31.01001	151.548216
7206	WGE	Walgett Airport	Oceania	AU	Australia	New South Wales	Walgett	-30.03280067	148.1260071
7207	WLA	Wallal Airport	Oceania	AU	Australia	Western Australia	Wallal	-19.77359962	120.6490021
7208	MFL	Mount Full Stop Airport	Oceania	AU	Australia	Queensland	Wando Vale	-19.67	144.8852
7209	WGT	Wangaratta Airport	Oceania	AU	Australia	Victoria	Wangaratta	-36.41579819	146.3070068
7210	CXQ	Christmas Creek Station Airport	Oceania	AU	Australia	Western Australia	Wangkat Jungka	-18.8728	125.934
7211	WKB	Warracknabeal Airport	Oceania	AU	Australia	Victoria	Warracknabeal	-36.32109833	142.4190063
7212	WRW	Warrawagine Airport	Oceania	AU	Australia	Western Australia	Warrawagine	-20.84420013	120.7020035
7213	QRR	Warren Airport	Oceania	AU	Australia	New South Wales	Warren	-31.73329926	147.8029938
7214	WMB	Warrnambool Airport	Oceania	AU	Australia	Victoria	Warrnambool	-38.29529953	142.4470062
7215	WAZ	Warwick Airport	Oceania	AU	Australia	Queensland	Warwick	-28.14940071	151.9429932
7216	WLO	Waterloo Airport	Oceania	AU	Australia	Northern Territory	Waterloo	-16.62999916	129.3200073
7217	WAU	Wauchope Airport	Oceania	AU	Australia	Northern Territory	Wauchope	-20.640614	134.215276
7218	WAV	Wave Hill Airport	Oceania	AU	Australia	Northern Territory	Wave Hill	-17.3932991	131.1179962
7219	WAN	Waverney Airport	Oceania	AU	Australia	Queensland	Waverney	-25.3563	141.9254
7220	WEW	Wee Waa Airport	Oceania	AU	Australia	New South Wales	Wee Waa	-30.25830078	149.4080048
7221	WEI	Weipa Airport	Oceania	AU	Australia	Queensland	Weipa	-12.67860031	141.9250031
7222	WHL	Welshpool Airport	Oceania	AU	Australia	Victoria	Welshpool	-38.682382	146.445331
7223	WLP	West Angelas Airport	Oceania	AU	Australia	Western Australia	West Angelas	-23.13555556	118.7072222
7224	WWY	West Wyalong Airport	Oceania	AU	Australia	New South Wales	West Wyalong	-33.93719864	147.1909943
7225	WSY	Whitsunday Island Airport	Oceania	AU	Australia	Queensland	Whitsunday Island	-20.27611	148.755
7226	WYA	Whyalla Airport	Oceania	AU	Australia	South Australia	Whyalla	-33.05889893	137.5140076
7227	WIO	Wilcannia Airport	Oceania	AU	Australia	New South Wales	Wilcannia	-31.522082	143.378358
7228	NTL	Newcastle Airport	Oceania	AU	Australia	New South Wales	Williamtown	-32.79499817	151.8339996
7229	WUN	Wiluna Airport	Oceania	AU	Australia	Western Australia	Wiluna	-26.62919998	120.2210007
7230	WRN	Windarling Airport	Oceania	AU	Australia	Western Australia	Windarling Mine	-30.032277	119.386489
7231	WND	Windarra Airport	Oceania	AU	Australia	Western Australia	Windarra	-28.47500038	122.2419968
7232	WNR	Windorah Airport	Oceania	AU	Australia	Queensland	Windorah	-25.41309929	142.6670074
7233	WIN	Winton Airport	Oceania	AU	Australia	Queensland	Winton	-22.36359978	143.0859985
7234	WIT	Wittenoom Airport	Oceania	AU	Australia	Western Australia	Wittenoom	-22.224992	118.353739
7235	WLL	Wollogorang Airport	Oceania	AU	Australia	Northern Territory	Wollogorang	-17.2199	137.93453
7236	WDI	Wondai Airport	Oceania	AU	Australia	Queensland	Wondai	-26.277392	151.861673
7237	WON	Wondoola Airport	Oceania	AU	Australia	Queensland	Wondoola	-18.57500076	140.8919983
7238	WWI	Woodie Woodie Airport	Oceania	AU	Australia	Western Australia	Woodie Woodie	-21.64551	121.191184
7239	UMR	Woomera Airfield	Oceania	AU	Australia	South Australia	Woomera	-31.14419937	136.8170013
7240	WPK	Wrotham Park Airport	Oceania	AU	Australia	Queensland	Wrotham Park	-16.6583004	144.0019989
7241	WUD	Wudinna Airport	Oceania	AU	Australia	South Australia	Wudinna	-33.04330063	135.4470062
7242	MHO	Mount House Airport	Oceania	AU	Australia	Western Australia	Wunaamin Miliwundi Ranges	-17.051917	125.712491
7243	BRT	Bathurst Island Airport	Oceania	AU	Australia	Northern Territory	Wurrumiyanga	-11.764966	130.615774
7244	WYN	Wyndham Airport	Oceania	AU	Australia	Western Australia	Wyndham	-15.51140022	128.1529999
7245	RTP	Rutland Plains Airport	Oceania	AU	Australia	Queensland	Yagoonya	-15.644963	141.844373
7246	KYI	Yalata Mission Airport	Oceania	AU	Australia	South Australia	Yalata Mission	-31.47060013	131.8249969
7247	YLG	Yalgoo Airport	Oceania	AU	Australia	Western Australia	Yalgoo	-28.3553009	116.6839981
7248	XMY	Yam Island Airport	Oceania	AU	Australia	Queensland	Yam Island	-9.899187	142.774265
7249	KYF	Yeelirrie Airport	Oceania	AU	Australia	Western Australia	Yeelirrie	-27.27706004	120.0956726
7250	OKR	Yorke Island Airport	Oceania	AU	Australia	Queensland	Yorke Island	-9.752801	143.405673
7251	ORR	Yorketown Airport	Oceania	AU	Australia	South Australia	Yorketown	-35.003564	137.619295
7252	NGA	Young Airport	Oceania	AU	Australia	New South Wales	Young	-34.25559998	148.2480011
7253	YUE	Yuendumu Airport	Oceania	AU	Australia	Northern Territory	Yuendumu	-22.25419998	131.7819977
7254	AIT	Aitutaki Airport	Oceania	CK	Cook Islands	Aitutaki	Aitutaki	-18.83090019	-159.7640076
7255	AIU	Enua Airport	Oceania	CK	Cook Islands	Atiu Island	Atiu Island	-19.96780014	-158.1190033
7256	RAR	Rarotonga International Airport	Oceania	CK	Cook Islands	Avarua	Avarua	-21.20269966	-159.8059998
7257	MGS	Mangaia Island Airport	Oceania	CK	Cook Islands	Mangaia Island	Mangaia Island	-21.89598656	-157.906662
7258	MHX	Manihiki Island Airport	Oceania	CK	Cook Islands	Manihiki Island	Manihiki Island	-10.3767004	-161.0019989
7259	MUK	Mauke Airport	Oceania	CK	Cook Islands	Mauke Island	Mauke Island	-20.13610077	-157.3450012
7260	MOI	Mitiaro Island Airport	Oceania	CK	Cook Islands	Mitiaro Island	Mitiaro Island	-19.842501	-157.703003
7261	PYE	Tongareva Airport	Oceania	CK	Cook Islands	Penrhyn Island	Penrhyn Island	-9.014369965	-158.0324097
7262	PZK	Pukapuka Island Airport	Oceania	CK	Cook Islands	Pukapuka Atoll	Pukapuka Atoll	-10.9145	-165.8393
7263	LEV	Levuka Airfield	Oceania	FJ	Fiji	Eastern	Bureta	-17.71109962	178.7590027
7264	CST	Castaway Island Seaplane Base	Oceania	FJ	Fiji	Western	Castaway Island	-17.7358	177.129
7265	ICI	Cicia Airport	Oceania	FJ	Fiji	Eastern	Cicia	-17.74329948	-179.3419952
7266	KXF	Koro Island Airport	Oceania	FJ	Fiji	Eastern	Koro Island	-17.3458004	179.4219971
7267	LBS	Labasa Airport	Oceania	FJ	Fiji	Northern	Labasa	-16.4666996	179.3399963
7268	LKB	Lakeba Island Airport	Oceania	FJ	Fiji	Eastern	Lakeba Island	-18.19919968	-178.8170013
7269	LUC	Laucala Island Airport	Oceania	FJ	Fiji	Northern	Laucala Island	-16.74810028	-179.6670074
7270	PTF	Malolo Lailai Island Airport	Oceania	FJ	Fiji	Western	Malolo Lailai Island	-17.7779007	177.1970062
7271	MNF	Mana Island Airport	Oceania	FJ	Fiji	Western	Mana Island	-17.672844	177.0985
7272	TVU	Matei Airport	Oceania	FJ	Fiji	Northern	Matei	-16.690599	-179.876999
7273	MFJ	Moala Airport	Oceania	FJ	Fiji	Eastern	Moala	-18.56669998	179.951004
7274	NAN	Nadi International Airport	Oceania	FJ	Fiji	Western	Nadi	-17.7553997	177.4429932
7275	BXL	Blue Lagoon Seaplane Base	Oceania	FJ	Fiji	Western	Nanuya Lailai Island	-16.943	177.368
7276	TTL	Turtle Island Seaplane Base	Oceania	FJ	Fiji	Western	Nanuya Levu Island	-16.966	177.368
7277	SUV	Nausori International Airport	Oceania	FJ	Fiji	Central	Nausori	-18.04330063	178.5590057
7278	NGI	Ngau Airport	Oceania	FJ	Fiji	Eastern	Ngau	-18.11560059	179.3399963
7279	ONU	Ono-i-Lau Airport	Oceania	FJ	Fiji	Eastern	Ono-i-Lau	-20.6589	-178.7411
7280	RBI	Rabi Island Airport	Oceania	FJ	Fiji	Northern	Rabi Island	-16.5337	179.9757
7281	RTA	Rotuma Airport	Oceania	FJ	Fiji	Rotuma	Rotuma	-12.48250008	177.0709991
7282	SVU	Savusavu Airport	Oceania	FJ	Fiji	Northern	Savusavu	-16.803394	179.340587
7283	VBV	Vanua Balavu Airport	Oceania	FJ	Fiji	Eastern	Vanua Balavu	-17.2689991	-178.9759979
7284	VAU	Vatukoula Airport	Oceania	FJ	Fiji	Western	Vatukoula	-17.5	177.8419952
7285	VTF	Vatulele Airport	Oceania	FJ	Fiji	Western	Vatulele	-18.51250076	177.6390076
7286	KDV	Vunisea Airport	Oceania	FJ	Fiji	Eastern	Vunisea	-19.05809975	178.1569977
7287	KAY	Wakaya Island Airport	Oceania	FJ	Fiji	Eastern	Wakaya Island	-17.61700058	179.0169983
7288	YAS	Yasawa Island Airport	Oceania	FJ	Fiji	Western	Yasawa Island	-16.75889969	177.5449982
7289	AHE	Ahe Airport	Oceania	PF	French Polynesia	Ahe Atoll	Ahe Atoll	-14.42809963	-146.2570038
7290	AAA	Anaa Airport	Oceania	PF	French Polynesia	Anaa	Anaa	-17.3526	-145.509995
7291	APK	Apataki Airport	Oceania	PF	French Polynesia	Apataki	Apataki	-15.5736	-146.414993
7292	RKA	Aratika Nord Airport	Oceania	PF	French Polynesia	Aratika Nord	Aratika Nord	-15.48530006	-145.4700012
7293	AXR	Arutua Airport	Oceania	PF	French Polynesia	Arutua	Arutua	-15.2482996	-146.6170044
7294	FAC	Faaite Airport	Oceania	PF	French Polynesia	Faaite	Faaite	-16.68657	-145.329394
7295	FHZ	Fakahina Airport	Oceania	PF	French Polynesia	Fakahina	Fakahina	-15.992259	-140.164246
7296	FAV	Fakarava Airport	Oceania	PF	French Polynesia	Fakarava	Fakarava	-16.05410004	-145.6569977
7297	FGU	Fangatau Airport	Oceania	PF	French Polynesia	Fangatau	Fangatau	-15.81995	-140.88729
7298	HUH	Huahine-Fare Airport	Oceania	PF	French Polynesia	Fare	Fare	-16.687084	-151.021593
7299	HHZ	Hikueru Airport	Oceania	PF	French Polynesia	Hikueru	Hikueru	-17.548297	-142.612037
7300	AUQ	Hiva Oa-Atuona Airport	Oceania	PF	French Polynesia	Hiva Oa Island	Hiva Oa Island	-9.768790245	-139.0110016
7301	KXU	Katiu Airport	Oceania	PF	French Polynesia	Katiu	Katiu	-16.33939934	-144.4029999
7302	KHZ	Kauehi Airport	Oceania	PF	French Polynesia	Kauehi	Kauehi	-15.78079987	-145.1239929
7303	MKP	Makemo Airport	Oceania	PF	French Polynesia	Makemo	Makemo	-16.5839	-143.658005
7304	XMH	Manihi Airport	Oceania	PF	French Polynesia	Manihi	Manihi	-14.4368	-146.0700073
7305	MVT	Mataiva Airport	Oceania	PF	French Polynesia	Mataiva	Mataiva	-14.86810017	-148.7169952
7306	MAU	Maupiti Airport	Oceania	PF	French Polynesia	Maupiti	Maupiti	-16.42650032	-152.2440033
7307	MOZ	Moorea Temae Airport	Oceania	PF	French Polynesia	Moorea-Maiao	Moorea-Maiao	-17.48979	-149.761777
7308	UOA	Moruroa Airport	Oceania	PF	French Polynesia	Moruroa Atoll	Moruroa Atoll	-21.80978	-138.813385
7309	BOB	Bora Bora Airport	Oceania	PF	French Polynesia	Motu Mute	Motu Mute	-16.44440079	-151.7510071
7310	NIU	Naiu Airport	Oceania	PF	French Polynesia	Naiu Atoll	Naiu Atoll	-16.1191	-146.3683
7311	NAU	Napuka Island Airport	Oceania	PF	French Polynesia	Napuka Island	Napuka Island	-14.17679977	-141.2669983
7312	NHV	Nuku Hiva Airport	Oceania	PF	French Polynesia	Nuku Hiva	Nuku Hiva	-8.7956	-140.229004
7313	NUK	Nukutavake Airport	Oceania	PF	French Polynesia	Nukutavake	Nukutavake	-19.284613	-138.768367
7314	NKP	Nukutepipi Airport	Oceania	PF	French Polynesia	Nukutepipi	Nukutepipi	-20.701286	-143.044681
7315	HOI	Hao Airport	Oceania	PF	French Polynesia	Otepa	Otepa	-18.0748	-140.945999
7316	PPT	Faa'a International Airport	Oceania	PF	French Polynesia	Papeete	Papeete	-17.553699	-149.606995
7317	PKP	Puka Puka Airport	Oceania	PF	French Polynesia	Puka Puka	Puka Puka	-14.80949974	-138.8130035
7318	PUK	Pukaruha Airport	Oceania	PF	French Polynesia	Pukaruha	Pukaruha	-18.295726	-137.016291
7319	KKR	Kaukura Airport	Oceania	PF	French Polynesia	Raitahiti	Raitahiti	-15.6633	-146.884995
7320	RVV	Raivavae Airport	Oceania	PF	French Polynesia	Raivavae	Raivavae	-23.8852005	-147.6620026
7321	RGI	Rangiroa Airport	Oceania	PF	French Polynesia	Rangiroa	Rangiroa	-14.95429993	-147.6609955
7322	RRR	Raroia Airport	Oceania	PF	French Polynesia	Raroia	Raroia	-16.050485	-142.476568
7323	REA	Reao Airport	Oceania	PF	French Polynesia	Reao	Reao	-18.46652	-136.43855
7324	RMT	Rimatara Airport	Oceania	PF	French Polynesia	Rimatara Island	Rimatara Island	-22.63725	-152.8059
7325	RUR	Rurutu Airport	Oceania	PF	French Polynesia	Rurutu	Rurutu	-22.4340992	-151.3609924
7326	TKP	Takapoto Airport	Oceania	PF	French Polynesia	Takapoto	Takapoto	-14.70950031	-145.2460022
7327	TKX	Takaroa Airport	Oceania	PF	French Polynesia	Takaroa	Takaroa	-14.45580006	-145.0249939
7328	TJN	Takume Airport	Oceania	PF	French Polynesia	Takume	Takume	-15.857434	-142.266469
7329	TKV	Tatakoto Airport	Oceania	PF	French Polynesia	Tatakoto	Tatakoto	-17.355226	-138.44734
7330	TTI	Tetiaroa Airport	Oceania	PF	French Polynesia	Tetiaroa	Tetiaroa	-17.015095	-149.589372
7331	TIH	Tikehau Airport	Oceania	PF	French Polynesia	Tikehau	Tikehau	-15.1196003	-148.2310028
7332	GMR	Totegegie Airport	Oceania	PF	French Polynesia	Totegegie	Totegegie	-23.07990074	-134.8899994
7333	TUB	Tubuai Airport	Oceania	PF	French Polynesia	Tubuai	Tubuai	-23.36540031	-149.5240021
7334	TPX	Tupai Airport	Oceania	PF	French Polynesia	Tupai Atoll	Tupai Atoll	-16.2423	-151.8338
7335	ZTA	Tureia Airport	Oceania	PF	French Polynesia	Tureia	Tureia	-20.785461	-138.568153
7336	UAH	Ua Huka Airport	Oceania	PF	French Polynesia	Ua Huka	Ua Huka	-8.936228	-139.554062
7337	UAP	Ua Pou Airport	Oceania	PF	French Polynesia	Ua Pou	Ua Pou	-9.35167	-140.078003
7338	RFP	Raiatea Airport	Oceania	PF	French Polynesia	Uturoa	Uturoa	-16.7229	-151.466003
7339	VHZ	Vahitahi Airport	Oceania	PF	French Polynesia	Vahitahi	Vahitahi	-18.780697	-138.85568
7340	GUM	Antonio B. Won Pat International Airport	Oceania	GU	Guam	Hag??t??a, Guam International Airport	Hag??t??a, Guam International Airport	13.4834	144.796005
7341	UAM	Andersen Air Force Base	Oceania	GU	Guam	Yigo, Mariana Island	Yigo, Mariana Island	13.584	144.929998
7342	ABF	Abaiang Airport	Oceania	KI	Kiribati	Gilbert Islands	Abaiang	1.79861	173.041
7343	CIS	Canton Island Airport	Oceania	KI	Kiribati	Phoenix Islands	Abariringa	-2.76812005	-171.7100067
7344	AEA	Abemama Airport	Oceania	KI	Kiribati	Gilbert Islands	Abemama	0.490833	173.828995
7345	AIS	Arorae Island Airport	Oceania	KI	Kiribati	Gilbert Islands	Arorae Island	-2.616110086	176.8029938
7346	CXI	Cassidy International Airport	Oceania	KI	Kiribati	Line Islands	Banana	1.98616004	-157.3500061
7347	BEZ	Beru Airport	Oceania	KI	Kiribati	Gilbert Islands	Beru	-1.354719996	176.0070038
7348	AAK	Aranuka Airport	Oceania	KI	Kiribati	Gilbert Islands	Buariki	0.185278	173.636993
7349	BBG	Butaritari Airport	Oceania	KI	Kiribati	Gilbert Islands	Butaritari	3.08583	172.811005
7350	KUC	Kuria Airport	Oceania	KI	Kiribati	Gilbert Islands	Kuria	0.218611002	173.4420013
7351	MNK	Maiana Airport	Oceania	KI	Kiribati	Gilbert Islands	Maiana	1.003610015	173.0310059
7352	MTK	Makin Island Airport	Oceania	KI	Kiribati	Gilbert Islands	Makin Island	3.374439955	172.9920044
7353	MZK	Marakei Airport	Oceania	KI	Kiribati	Gilbert Islands	Marakei	2.058609962	173.2709961
7354	NIG	Nikunau Airport	Oceania	KI	Kiribati	Gilbert Islands	Nikunau	-1.314440012	176.4100037
7355	NON	Nonouti Airport	Oceania	KI	Kiribati	Gilbert Islands	Nonouti	-0.6397219896	174.4279938
7356	OOT	Onotoa Airport	Oceania	KI	Kiribati	Gilbert Islands	Onotoa	-1.796110034	175.526001
7357	TBF	Tabiteuea North Airport	Oceania	KI	Kiribati	Gilbert Islands	Tabiteuea North	-1.224470019	174.776001
7358	TSU	Tabiteuea South Airport	Oceania	KI	Kiribati	Gilbert Islands	Tabiteuea South	-1.474439979	175.0639954
7359	TNV	Tabuaeran Island Airport	Oceania	KI	Kiribati	Line Islands	Tabuaeran Island	3.89944005	-159.3890076
7360	TMN	Tamana Island Airport	Oceania	KI	Kiribati	Gilbert Islands	Tamana Island	-2.485830069	175.9700012
7361	TRW	Bonriki International Airport	Oceania	KI	Kiribati	Gilbert Islands	Tarawa	1.38164	173.147003
7362	TNQ	Washington Island Airstrip	Oceania	KI	Kiribati	Line Islands	Teraina	4.698359	-160.394376
7363	JAT	Jabot Airport	Oceania	MH	Marshall Islands	Ailinglapalap	Ailinglapalap Atoll	7.749774756	168.9778376
7364	JEJ	Jeh Airport	Oceania	MH	Marshall Islands	Ailinglapalap	Ailinglapalap Atoll	7.565350056	168.9620056
7365	AIM	Ailuk Airport	Oceania	MH	Marshall Islands	Ailuk	Ailuk Island	10.21679974	169.9830017
7366	IMI	Ine Airport	Oceania	MH	Marshall Islands	Arno	Arno Atoll	7.005553	171.656959
7367	TIC	Tinak Airport	Oceania	MH	Marshall Islands	Arno	Arno Atoll	7.133329868	171.9170074
7368	AUL	Aur Island Airport	Oceania	MH	Marshall Islands	Aur	Aur Atoll	8.145279884	171.1730042
7369	AIC	Ailinglaplap Airok Airport	Oceania	MH	Marshall Islands	Ailinglapalap	Bigatyelang Island	7.279422	168.8257
7370	BII	Enyu Airfield	Oceania	MH	Marshall Islands	Bikini	Bikini Atoll	11.5225	165.565002
7371	EBN	Ebadon Airport	Oceania	MH	Marshall Islands	Kwajalein	Ebadon Island	9.330559731	166.8200073
7372	EBO	Ebon Airport	Oceania	MH	Marshall Islands	Ebon	Ebon Atoll	4.5982	168.752
7373	EJT	Enejit Airport	Oceania	MH	Marshall Islands	Mili	Enejit Island	6.0404	171.9846
7374	ENT	Eniwetok Airport	Oceania	MH	Marshall Islands	Eniwetok	Eniwetok Atoll	11.34070015	162.3280029
7375	UIT	Jaluit Airport	Oceania	MH	Marshall Islands	Jaluit	Jabor Jaluit Atoll	5.90924	169.636993
7376	KBT	Kaben Airport	Oceania	MH	Marshall Islands	Maloelap	Kaben	8.90056	170.843994
7377	KIO	Kili Airport	Oceania	MH	Marshall Islands	Kili	Kili Island	5.644515	169.119507
7378	KWA	Bucholz Army Air Field	Oceania	MH	Marshall Islands	Kwajalein	Kwajalein	8.72012043	167.7319946
7379	LML	Lae Island Airport	Oceania	MH	Marshall Islands	Lae	Lae Island	8.921110153	166.2649994
7380	LIK	Likiep Airport	Oceania	MH	Marshall Islands	Likiep	Likiep Island	9.82316	169.307999
7381	MJE	Majkin Airport	Oceania	MH	Marshall Islands	Namu	Majkin	7.76291	168.26576
7382	MAJ	Marshall Islands International Airport	Oceania	MH	Marshall Islands	Majuro	Majuro Atoll	7.064760208	171.2720032
7383	MAV	Maloelap Island Airport	Oceania	MH	Marshall Islands	Maloelap	Maloelap Island	8.704440117	171.2299957
7384	EAL	Elenak Airport	Oceania	MH	Marshall Islands	Kwajalein	Mejato Island	9.319305556	166.8477778
7385	MJB	Mejit Atoll Airport	Oceania	MH	Marshall Islands	Mejit	Mejit Atoll	10.283302	170.869
7386	MIJ	Mili Island Airport	Oceania	MH	Marshall Islands	Mili	Mili Island	6.08333	171.733002
7387	NDK	Namorik Atoll Airport	Oceania	MH	Marshall Islands	Namorik	Namorik Atoll	5.631669998	168.125
7388	RNP	Rongelap Island Airport	Oceania	MH	Marshall Islands	Rongelap	Rongelap Island	11.1572	166.886993
7389	TBV	Tabal Airstrip	Oceania	MH	Marshall Islands	Aur	Tabal Island	8.3027	171.1615
7390	UJE	Ujae Atoll Airport	Oceania	MH	Marshall Islands	Ujae	Ujae Atoll	8.928059578	165.7619934
7391	UTK	Utirik Airport	Oceania	MH	Marshall Islands	Utirik	Utirik Island	11.222	169.852005
7392	WJA	Woja Airport	Oceania	MH	Marshall Islands	Ailinglapalap	Woja	7.450833333	168.55
7393	WTO	Wotho Island Airport	Oceania	MH	Marshall Islands	Wotho	Wotho Island	10.17329979	166.003006
7394	WTE	Wotje Airport	Oceania	MH	Marshall Islands	Wotje	Wotje	9.458333	170.238611
7395	ULI	Ulithi Airport	Oceania	FM	Micronesia	Yap State	Falalop Island	10.0198	139.789993
7396	KSA	Kosrae International Airport	Oceania	FM	Micronesia	Kosrae State	Okat	5.35698	162.957993
7397	PNI	Pohnpei International Airport	Oceania	FM	Micronesia	Pohnpei State	Pohnpei Island	6.985099792	158.2089996
7398	TKK	Chuuk International Airport	Oceania	FM	Micronesia	Chuuk State	Weno Island	7.461870193	151.8430023
7399	YAP	Yap International Airport	Oceania	FM	Micronesia	Yap State	Yap Island	9.49891	138.082993
7400	INU	Nauru International Airport	Oceania	NR	Nauru	Yaren	Yaren District	-0.547458	166.919006
7401	HLU	Nesson Airport	Oceania	NC	New Caledonia	Houailou	Houailou	-21.257288	165.61821
7402	ILP	??le des Pins Airport	Oceania	NC	New Caledonia	??le des Pins	??le des Pins	-22.58889961	167.4559937
7403	KNQ	Kon?? Airport	Oceania	NC	New Caledonia	Kon??	Kon??	-21.053551	164.838768
7404	KOC	Koumac Airport	Oceania	NC	New Caledonia	Koumac	Koumac	-20.546323	164.255648
7405	LIF	Lifou Airport	Oceania	NC	New Caledonia	Lifou	Lifou	-20.77479935	167.2400055
7406	PUV	Poum / Malabou Airport	Oceania	NC	New Caledonia	Malabou	Malabou	-20.289155	164.09935
7407	MEE	Mar?? Airport	Oceania	NC	New Caledonia	Mar??	Mar??	-21.4817009	168.0379944
7408	PDC	Mueo Airport	Oceania	NC	New Caledonia	N??poui	N??poui	-21.316456	164.999399
7409	GEA	Noum??a Magenta Airport	Oceania	NC	New Caledonia	Noum??a	Noum??a	-22.258301	166.473007
7410	NOU	La Tontouta International Airport	Oceania	NC	New Caledonia	Noum??a (La Tontouta)	Noum??a (La Tontouta)	-22.014601	166.212997
7411	UVE	Ouv??a Airport	Oceania	NC	New Caledonia	Ouv??a	Ouv??a	-20.6406002	166.572998
7412	TGJ	Tiga Airport	Oceania	NC	New Caledonia	Tiga	Tiga	-21.09609985	167.8040009
7413	TOU	Touho Airport	Oceania	NC	New Caledonia	Touho	Touho	-20.790127	165.259524
7414	BMY	??le Art - Waala Airport	Oceania	NC	New Caledonia	Waala	Waala	-19.720521	163.661077
7415	ALR	Alexandra Aerodrome	Oceania	NZ	New Zealand	Otago Region	Alexandra	-45.210495	169.371113
7416	ASG	Ashburton Aerodrome	Oceania	NZ	New Zealand	Canterbury Region	Ashburton Aerodrome	-43.90330124	171.7969971
7417	AKL	Auckland International Airport	Oceania	NZ	New Zealand	Auckland Region	Auckland	-37.01199	174.786331
7418	BHE	Woodbourne Airport	Oceania	NZ	New Zealand	Marlborough Region	Blenheim	-41.5182991	173.8699951
7419	CHC	Christchurch International Airport	Oceania	NZ	New Zealand	Canterbury Region	Christchurch	-43.48939896	172.5319977
7420	GBZ	Great Barrier Aerodrome	Oceania	NZ	New Zealand	Auckland Region	Claris	-36.24140167	175.4720001
7421	CMV	Coromandel Aerodrome	Oceania	NZ	New Zealand	Waikato Region	Coromandel Aerodrome	-36.79169846	175.5090027
7422	DGR	Dargaville Aerodrome	Oceania	NZ	New Zealand	Northland Region	Dargaville Aerodrome	-35.93970108	173.8939972
7423	DUD	Dunedin International Airport	Oceania	NZ	New Zealand	Otago Region	Dunedin	-45.928101	170.197998
7424	WHO	Franz Josef Aerodrome	Oceania	NZ	New Zealand	West Coast Region	Franz Josef Aerodrome	-43.36309814	170.1340027
7425	GIS	Gisborne Airport	Oceania	NZ	New Zealand	Gisborne Region	Gisborne	-38.66329956	177.9779968
7426	GTN	Glentanner Airport	Oceania	NZ	New Zealand	Canterbury Region	Glentanner Station	-43.90670013	170.128006
7427	GMN	Greymouth Airport	Oceania	NZ	New Zealand	West Coast Region	Greymouth	-42.46170044	171.1900024
7428	HLZ	Hamilton International Airport	Oceania	NZ	New Zealand	Waikato Region	Hamilton	-37.86669922	175.3320007
7429	HKK	Hokitika Airfield	Oceania	NZ	New Zealand	West Coast Region	Hokitika	-42.71360016	170.9850006
7430	IVC	Invercargill Airport	Oceania	NZ	New Zealand	Southland Region	Invercargill	-46.41239929	168.3130035
7431	KKO	Kaikohe Airport	Oceania	NZ	New Zealand	Northland Region	Kaikohe	-35.4510994	173.8170013
7432	KBZ	Kaikoura Airport	Oceania	NZ	New Zealand	Canterbury Region	Kaikoura	-42.42499924	173.6049957
7433	KAT	Kaitaia Airport	Oceania	NZ	New Zealand	Northland Region	Kaitaia	-35.06999969	173.2850037
7434	KKE	Kerikeri Airport	Oceania	NZ	New Zealand	Northland Region	Kerikeri	-35.26279831	173.9120026
7435	PCN	Picton Aerodrome	Oceania	NZ	New Zealand	Marlborough Region	Koromiko	-41.34609985	173.9559937
7436	TEU	Manapouri Airport	Oceania	NZ	New Zealand	Southland Region	Manapouri	-45.53310013	167.6499939
7437	AMZ	Ardmore Airport	Oceania	NZ	New Zealand	Auckland Region	Manurewa	-37.02970123	174.9730072
7438	MRO	Hood Airport	Oceania	NZ	New Zealand	Wellington Region	Masterton	-40.97330093	175.6340027
7439	MTA	Matamata Glider Airport	Oceania	NZ	New Zealand	Waikato Region	Matamata Glider	-37.7344017	175.7420044
7440	MFN	Milford Sound Airport	Oceania	NZ	New Zealand	Southland Region	Milford Sound	-44.6733017	167.9230042
7441	MZP	Motueka Airport	Oceania	NZ	New Zealand	Tasman Region	Motueka	-41.12329865	172.9889984
7442	MON	Mount Cook Airport	Oceania	NZ	New Zealand	Canterbury Region	Mount Cook	-43.76499939	170.1329956
7443	NPE	Hawke's Bay Airport	Oceania	NZ	New Zealand	Hawke's Bay Region	Napier	-39.465801	176.869995
7444	NSN	Nelson Airport	Oceania	NZ	New Zealand	Nelson Region	Nelson	-41.298302	173.220993
7445	NPL	New Plymouth Airport	Oceania	NZ	New Zealand	Taranaki Region	New Plymouth	-39.00859833	174.1790009
7446	OAM	Oamaru Airport	Oceania	NZ	New Zealand	Otago Region	Oamaru	-44.97000122	171.0820007
7447	SZS	Ryan's Creek Aerodrome	Oceania	NZ	New Zealand	Southland Region	Oban	-46.8997	168.100998
7448	PMR	Palmerston North Airport	Oceania	NZ	New Zealand	Manawatu-Wanganui Region	Palmerston North	-40.3205986	175.6170044
7449	PPQ	Paraparaumu Airport	Oceania	NZ	New Zealand	Wellington Region	Paraparaumu	-40.90470123	174.9889984
7450	ZQN	Queenstown International Airport	Oceania	NZ	New Zealand	Otago Region	Queenstown	-45.021099	168.738998
7451	RAG	Raglan Aerodrome	Oceania	NZ	New Zealand	Waikato Region	Raglan	-37.804699	174.860001
7452	OHA	RNZAF Base Ohakea	Oceania	NZ	New Zealand	Manawatu-Wanganui Region	RNZAF Base Ohakea	-40.20600128	175.3880005
7453	ROT	Rotorua Regional Airport	Oceania	NZ	New Zealand	Bay of Plenty Region	Rotorua	-38.10919952	176.3170013
7454	THH	Taharoa Aerodrome	Oceania	NZ	New Zealand	Waikato Region	Taharoa	-38.18109894	174.7079926
7455	KTF	Takaka Airport	Oceania	NZ	New Zealand	Tasman Region	Takaka	-40.81330109	172.7749939
7456	TUO	Taupo Airport	Oceania	NZ	New Zealand	Waikato Region	Taupo	-38.73970032	176.0839996
7457	TRG	Tauranga Airport	Oceania	NZ	New Zealand	Bay of Plenty Region	Tauranga	-37.6719017	176.1959991
7458	CHT	Chatham Islands / Tuuta Airport	Oceania	NZ	New Zealand	Wellington Region	Te One	-43.81189	-176.46514
7459	TMZ	Thames Aerodrome	Oceania	NZ	New Zealand	Waikato Region	Thames Aerodrome	-37.15670013	175.5500031
7460	TIU	Timaru Airport	Oceania	NZ	New Zealand	Canterbury Region	Timaru	-44.30279922	171.2250061
7461	TKZ	Tokoroa Airfield	Oceania	NZ	New Zealand	Waikato Region	Tokoroa	-38.23669815	175.8919983
7462	TWZ	Pukaki Airport	Oceania	NZ	New Zealand	Canterbury Region	Twitzel	-44.23500061	170.1179962
7463	WIK	Waiheke Reeve Airport	Oceania	NZ	New Zealand	Auckland Region	Waiheke Reeve	-36.80889893	175.0859985
7464	WIR	Wairoa Airport	Oceania	NZ	New Zealand	Hawke's Bay Region	Wairoa	-39.00690079	177.4069977
7465	WKA	Wanaka Airport	Oceania	NZ	New Zealand	Otago Region	Wanaka	-44.722954	169.248419
7466	WAG	Wanganui Airport	Oceania	NZ	New Zealand	Manawatu-Wanganui Region	Wanganui	-39.96220016	175.0249939
7467	WLG	Wellington International Airport	Oceania	NZ	New Zealand	Wellington Region	Wellington	-41.32720184	174.8049927
7468	WSZ	Westport Airport	Oceania	NZ	New Zealand	West Coast Region	Westport	-41.73809814	171.5809937
7469	WHK	Whakatane Airport	Oceania	NZ	New Zealand	Bay of Plenty Region	Whakatane	-37.92060089	176.9140015
7470	WRE	Whangarei Airport	Oceania	NZ	New Zealand	Northland Region	Whangarei	-35.7682991	174.3650055
7471	WTZ	Whitianga Airport	Oceania	NZ	New Zealand	Waikato Region	Whitianga	-36.83169937	175.6790009
7472	IUE	Niue International Airport	Oceania	NU	Niue	Alofi	Alofi	-19.07903099	-169.9255981
7473	NLK	Norfolk Island International Airport	Oceania	NF	Norfolk Island	Burnt Pine	Burnt Pine	-29.041887	167.939616
7474	SPN	Saipan International Airport	Oceania	MP	Northern Mariana Islands	I Fadang, Saipan	I Fadang, Saipan	15.119	145.729004
7475	ROP	Rota International Airport	Oceania	MP	Northern Mariana Islands	Rota Island	Rota Island	14.1743	145.242996
7476	TIQ	Tinian International Airport	Oceania	MP	Northern Mariana Islands	Tinian Island	Tinian Island	14.9992	145.619003
7477	ROR	Babelthuap Airport	Oceania	PW	Palau	Airai	Babelthuap Island	7.36731	134.544236
7478	AFR	Afore Airstrip	Oceania	PG	Papua New Guinea	Northern Province	Afore	-9.142222222	148.3908333
7479	AUP	Agaun Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Agaun	-9.930833	149.385667
7480	AIH	Aiambak Airport	Oceania	PG	Papua New Guinea	Western Province	Aiambak	-7.342777778	141.2675
7481	AIE	Aiome Airport	Oceania	PG	Papua New Guinea	Madang Province	Aiome	-5.145699978	144.7307003
7482	ATP	Aitape Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Aitape	-3.143611111	142.3468056
7483	TAJ	Tadji Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Aitape	-3.198191804	142.4309635
7484	AYU	Aiyura Airport	Oceania	PG	Papua New Guinea	Eastern Highlands Province	Aiyura Valley	-6.338055556	145.9041667
7485	AMF	Ama Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Ama	-4.101111111	141.67
7486	AMU	Amanab Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Amanab	-3.586	141.2143333
7487	AZB	Amazon Bay Airport	Oceania	PG	Papua New Guinea	Central Province	Amazon Bay	-10.29916667	149.3383333
7488	KRJ	Karawari Airstrip	Oceania	PG	Papua New Guinea	East Sepik Province	Amboin	-4.596666667	143.5225
7489	AUJ	Ambunti Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Ambunti	-4.215666667	142.8231667
7490	ADC	Andakombe Airport	Oceania	PG	Papua New Guinea	Eastern Highlands Province	Andekombe	-7.137222222	145.7447222
7491	AGG	Angoram Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Angoram	-4.055833333	144.0738889
7492	AKG	Anguganak Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Anguganak	-3.560504	142.217307
7493	AOB	Annanberg Airport	Oceania	PG	Papua New Guinea	Madang Province	Annanberg	-4.904166667	144.6358333
7494	APR	April River Airport	Oceania	PG	Papua New Guinea	East Sepik Province	April River	-4.676666667	142.5401389
7495	ARP	Aragip Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Aragip	-9.883333333	149.4833333
7496	RAW	Arawa Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Arawa	-6.220555556	155.5713889
7497	APP	Asapa Airport	Oceania	PG	Papua New Guinea	Northern Province	Asapa	-8.979166667	148.1036111
7498	AEK	Aseki Airport	Oceania	PG	Papua New Guinea	Morobe Province	Aseki	-7.350804856	146.1938667
7499	ASZ	Asirim Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Asirim	-6.009722222	150.3686111
7500	ABP	Atkamba Airport	Oceania	PG	Papua New Guinea	Western Province	Atkamba Mission	-6.06462	141.095173
7501	GRL	Garasa Airport	Oceania	PG	Papua New Guinea	Morobe Province	Au	-7.980713	147.213461
7502	AUI	Aua Island Airport	Oceania	PG	Papua New Guinea	Manus Province	Aua Island	-1.460555556	143.0647222
7503	AUV	Aumo Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Aumo	-5.731111111	148.4452778
7504	AWB	Awaba Airport	Oceania	PG	Papua New Guinea	Western Province	Awaba	-8.006110191	142.7483521
7505	MKN	Malekolon Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Babase Island	-4.023430556	153.6572778
7506	VMU	Baimuru Airport	Oceania	PG	Papua New Guinea	Gulf Province	Baimuru	-7.496860027	144.8199005
7507	BDZ	Baindoung Airport	Oceania	PG	Papua New Guinea	Morobe Province	Baindoung	-6.347222222	146.9422222
7508	HYF	Hayfields Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Bainyik	-3.69838	143.057902
7509	OPU	Balimo Airport	Oceania	PG	Papua New Guinea	Western Province	Balimo	-8.050000191	142.9329987
7510	BCP	Bambu Airport	Oceania	PG	Papua New Guinea	Madang Province	Bambu	-5.863611111	146.4925
7511	BMZ	Bamu Airport	Oceania	PG	Papua New Guinea	Western Province	Bamu	-7.8485	143.2433
7512	BPD	Bapi Airstrip	Oceania	PG	Papua New Guinea	Morobe Province	Bapi	-7.743611111	147.0205556
7513	BWJ	Bawan Airport	Oceania	PG	Papua New Guinea	Morobe Province	Bawan	-6.396944444	146.8816667
7514	BSP	Bensbach Airport	Oceania	PG	Papua New Guinea	Western Province	Bensbach	-8.858055556	141.2594444
7515	BWP	Bewani Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Bewani	-3.021666667	141.1652778
7516	BAA	Bialla Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Bialla, Matalilu, Ewase	-5.330560207	151.0079956
7517	BPK	Biangabip Airport	Oceania	PG	Papua New Guinea	Western Province	Biangabip	-5.526388889	141.7445833
7518	BRP	Biaru Airport	Oceania	PG	Papua New Guinea	Morobe Province	Biaru	-7.6693	146.7594
7519	XBN	Biniguni Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Biniguni	-9.6425	149.303889
7520	BOV	Boang Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Boang Island	-3.3834	153.2812
7521	BNM	Bodinumu Airport	Oceania	PG	Papua New Guinea	Central Province	Bodinumu	-9.107777778	147.6667222
7522	BMH	Bomai Airport	Oceania	PG	Papua New Guinea	Chimbu Province	Bomai	-6.373166667	144.637
7523	BOT	Bosset Airport	Oceania	PG	Papua New Guinea	Western Province	Bosset	-7.237257	141.1063222
7524	UBI	Buin Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Buin	-6.729166667	155.6833333
7525	BUA	Buka Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Buka Island	-5.422319889	154.6730042
7526	FIN	Finschhafen Airport	Oceania	PG	Papua New Guinea	Morobe Province	Buki	-6.621750109	147.85405
7527	BUL	Bulolo Airport	Oceania	PG	Papua New Guinea	Morobe Province	Bulolo	-7.216286671	146.6495419
7528	BNT	Bundi Airport	Oceania	PG	Papua New Guinea	Madang Province	Bundi	-5.742222222	145.2275
7529	BXZ	Bunsil Airport	Oceania	PG	Papua New Guinea	Morobe Province	Bunsil - Umboi Island	-5.7243	147.8667
7530	CGC	Cape Gloucester Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Cape Gloucester	-5.458965	148.432417
7531	CPI	Cape Orford Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Cape Orford	-5.448333333	152.0819444
7532	CPN	Cape Rodney Airport	Oceania	PG	Papua New Guinea	Central Province	Cape Rodney	-10.179823	148.3790302
7533	CVL	Cape Vogel Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Cape Vogel	-9.67	150.0197222
7534	DOI	Doini Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Castori Islets	-10.7009	150.7218
7535	CVB	Chungribu Airport	Oceania	PG	Papua New Guinea	Madang Province	Chungribu	-4.806620121	144.7149963
7536	DAO	Dabo Airport	Oceania	PG	Papua New Guinea	Northern Province	Dabo	-8.431944444	147.8430556
7537	DAU	Daru Airport	Oceania	PG	Papua New Guinea	Western Province	Daru	-9.086759567	143.2079926
7538	DAF	Daup Airport	Oceania	PG	Papua New Guinea	Madang Province	Daup	-4.7403	145.9515
7539	DBP	Debepare Airport	Oceania	PG	Papua New Guinea	Western Province	Debepare	-6.308611111	141.9055556
7540	MFZ	Meselia Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Demgulu	-6.1364	149.1183
7541	KEG	Keglsugl Airport	Oceania	PG	Papua New Guinea	Chimbu Province	Denglagu Mission	-5.832777778	145.0972222
7542	DER	Derim Airport	Oceania	PG	Papua New Guinea	Morobe Province	Derim	-6.144722222	147.1072222
7543	DNU	Dinangat Airport	Oceania	PG	Papua New Guinea	Morobe Province	Dinangat	-6.1546	146.6772
7544	DDM	Dodoima Airport	Oceania	PG	Papua New Guinea	Northern Province	Dodoima	-8.177361111	147.8094444
7545	DOO	Dorobisoro Airport	Oceania	PG	Papua New Guinea	Central Province	Dorobisoro	-9.461855	147.920907
7546	EFG	Efogi Airport	Oceania	PG	Papua New Guinea	Central Province	Efogi	-9.153805556	147.6598056
7547	EPT	Eliptamin Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Eliptamin	-5.0412	141.6779
7548	EMS	Embessa Airport	Oceania	PG	Papua New Guinea	Northern Province	Embessa	-9.447	148.7628
7549	EMI	Emirau Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Emirau Island	-1.653949991	149.9757667
7550	EMO	Emo River Airstrip	Oceania	PG	Papua New Guinea	Northern Province	Emo Mission	-9.1234	148.0415
7551	EGA	Engati Airstrip	Oceania	PG	Papua New Guinea	Morobe Province	Engati	-6.9179	146.1053
7552	ERE	Erave Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Erave	-6.606463154	143.9002132
7553	ERU	Erume Airport	Oceania	PG	Papua New Guinea	Central Province	Erume	-8.2538	146.9747
7554	ESA	Esa'ala Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Esa'ala	-9.874327023	150.9542084
7555	FNE	Fane Airport	Oceania	PG	Papua New Guinea	Central Province	Fane Mission	-8.549277778	147.0858333
7556	WTP	Woitape Airport	Oceania	PG	Papua New Guinea	Central Province	Fatima Mission	-8.545833333	147.2525
7557	FRQ	Feramin Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Feramin	-5.208	141.6988
7558	FAQ	Frieda River Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Frieda River	-4.610468	141.960138
7559	FUB	Fulleborn Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Fulleborn	-6.1518	150.6264
7560	FUM	Fuma Airport	Oceania	PG	Papua New Guinea	Western Province	Fuma	-6.3933	142.4408
7561	GAR	Garaina Airport	Oceania	PG	Papua New Guinea	Morobe Province	Garaina	-7.875625027	147.1412659
7562	WIU	Witu Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Garove Island	-4.689522	149.440112
7563	GMI	Gasmata Island Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Gasmata Island	-6.271110058	150.3309937
7564	GBC	Gasuke Airport	Oceania	PG	Papua New Guinea	Western Province	Gasuke	-6.1028	141.7393
7565	GEW	Gewoia Airport	Oceania	PG	Papua New Guinea	Northern Province	Gewoia	-9.2263	148.4949
7566	GOE	Gonaili Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Gonaili	-5.527716614	151.5733333
7567	GOC	Gora Airstrip	Oceania	PG	Papua New Guinea	Northern Province	Gora	-9.0021	148.2364
7568	GKA	Goroka Airport	Oceania	PG	Papua New Guinea	Eastern Highlands Province	Goronka	-6.081689835	145.3919983
7569	GVI	Green River Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Green River	-3.902242899	141.170517
7570	GUG	Guari Airport	Oceania	PG	Papua New Guinea	Central Province	Guari	-8.1286	146.8722
7571	GLP	Gulgubip Airport	Oceania	PG	Papua New Guinea	Western Province	Gulgubip	-5.2808	141.5411
7572	KRU	Kerau Airport	Oceania	PG	Papua New Guinea	Central Province	Gunim	-8.271612	147.071899
7573	GUE	Guriaso (Keraso) Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Guriaso	-3.583167	141.5895
7574	GUR	Gurney Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Gurney	-10.3114996	150.3339996
7575	GAP	Gusap Airport	Oceania	PG	Papua New Guinea	Morobe Province	Gusap	-6.053196	145.959047
7576	NKN	Nankina Airport	Oceania	PG	Papua New Guinea	Madang Province	Gwarawon	-5.837	146.4533
7577	HBD	Habi Airport	Oceania	PG	Papua New Guinea	Western Province	Habi	-6.32	142.4893
7578	HEO	Haelogo Airport	Oceania	PG	Papua New Guinea	Central Province	Haelogo	-9.13658	147.598434
7579	HIT	Haivaro Airport	Oceania	PG	Papua New Guinea	Gulf Province	Haivaro	-6.9406	143.059
7580	HAZ	Hatzfeldhaven Airport	Oceania	PG	Papua New Guinea	Madang Province	Hatzfeldhaven	-4.4033	145.2056
7581	HWA	Hawabango Airport	Oceania	PG	Papua New Guinea	Gulf Province	Hawabango	-7.392994	146.003487
7582	HNI	Heiweni Airport	Oceania	PG	Papua New Guinea	Morobe Province	Heiweni	-7.4223	146.4276
7583	KMF	Kamina Airport	Oceania	PG	Papua New Guinea	Gulf Province	Hoieti	-7.64925	145.9569444
7584	HNN	Honinabi Airport	Oceania	PG	Papua New Guinea	Western Province	Honinabi	-6.2457	142.1771
7585	IAL	Ialibu Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Ialibu	-6.2782	143.9944
7586	IMA	Iamalele Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Iamalele, Fergusson Island	-9.5107	150.5246
7587	IBI	Iboki Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Iboki	-5.5536	149.19
7588	IHU	Ihu Airport	Oceania	PG	Papua New Guinea	Gulf Province	Ihu	-7.89756012	145.3959961
7589	IMN	Imane Airport	Oceania	PG	Papua New Guinea	Morobe Province	Imane	-6.7524	146.1072
7590	IMD	Imonda Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Imonda	-3.328	141.1573
7591	IDN	Indagen Airport	Oceania	PG	Papua New Guinea	Morobe Province	Indagen	-6.22663	147.244
7592	IOK	Iokea Airport	Oceania	PG	Papua New Guinea	Gulf Province	Iokea	-8.401	146.277
7593	IOP	Ioma Airport	Oceania	PG	Papua New Guinea	Northern Province	Ioma	-8.3614	147.84
7594	ITK	Itokama Airport	Oceania	PG	Papua New Guinea	Northern Province	Itokama	-9.201527	148.264261
7595	JAQ	Jacquinot Bay Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Jacquinot Bay	-5.652500153	151.5070038
7596	JOP	Josephstaal Airport	Oceania	PG	Papua New Guinea	Madang Province	Josephstaal	-4.747083333	145.0070833
7597	KBM	Kabwum	Oceania	PG	Papua New Guinea	Morobe Province	Kabwum	-6.155472222	147.1914722
7598	KGW	Kagi Airport	Oceania	PG	Papua New Guinea	Central Province	Kagi	-9.135916667	147.6694444
7599	AGK	Kagua Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Kagua	-6.396388889	143.8536111
7600	KZF	Kaintiba Airport	Oceania	PG	Papua New Guinea	Gulf Province	Kaintiba	-7.50025	146.0338333
7601	KOR	Kakoro(Koroko) Airstrip	Oceania	PG	Papua New Guinea	Gulf Province	Kakoro	-7.834666667	146.5335
7602	KDQ	Kamberatoro Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Kamberatoro Mission	-3.600556	141.051667
7603	KAQ	Kamulai Airport	Oceania	PG	Papua New Guinea	Central Province	Kamulai Mission	-8.150694444	146.834
7604	KUY	Kamusi Airport	Oceania	PG	Papua New Guinea	Western Province	Kamusi	-7.420347	143.121811
7605	KEX	Kanabea Airport	Oceania	PG	Papua New Guinea	Gulf Province	Kanabea	-7.538888889	145.905
7606	KNE	Kanainj Airport	Oceania	PG	Papua New Guinea	Madang Province	Kanainj	-5.2903	144.7072
7607	KDP	Kandep Airport	Oceania	PG	Papua New Guinea	Enga Province	Kandep	-5.840611111	143.5072222
7608	KDR	Kandrian Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Kandrian	-6.19217	149.54783
7609	KPL	Kapal Airport	Oceania	PG	Papua New Guinea	Western Province	Kapal	-8.630184	142.823756
7610	KAK	Kar Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Kar	-6.2452	143.5516
7611	KRX	Kar Kar Airport	Oceania	PG	Papua New Guinea	Madang Province	Kar Kar Island	-4.557	145.9404
7612	KAF	Karato Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Karato	-6.2655	155.3052
7613	KMR	Karimui Airport	Oceania	PG	Papua New Guinea	Chimbu Province	Karimui	-6.4921	144.823
7614	KSB	Kasonombe Airport	Oceania	PG	Papua New Guinea	Morobe Province	Kasonombe	-6.3819	146.9859
7615	KVG	Kavieng Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Kavieng	-2.579400063	150.8079987
7616	RUU	Ruti Airport	Oceania	PG	Papua New Guinea	Western Highlands Province	Kawbenaberi	-5.334444444	144.2566667
7617	KWO	Kawito Airport	Oceania	PG	Papua New Guinea	Western Province	Kawito	-7.977006912	142.8235779
7618	KMA	Kerema Airport	Oceania	PG	Papua New Guinea	Gulf Province	Kerema	-7.963610172	145.7709961
7619	KII	Kibuli Airstrip	Oceania	PG	Papua New Guinea	Western Province	Kibuli	-9.006528	142.698056
7620	KIE	Aropa Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Kieta	-6.305417	155.728139
7621	KRI	Kikori Airport	Oceania	PG	Papua New Guinea	Gulf Province	Kikori	-7.424379826	144.2500763
7622	HKN	Hoskins Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Kimbe	-5.463846	150.407327
7623	KIQ	Kira Airport	Oceania	PG	Papua New Guinea	Northern Province	Kira	-8.065111111	147.3320278
7624	KVE	Kitava Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Kitava Island	-8.6285	151.327
7625	UNG	Kiunga Airport	Oceania	PG	Papua New Guinea	Western Province	Kiunga	-6.125710011	141.2819977
7626	KKD	Kokoda Airport	Oceania	PG	Papua New Guinea	Northern Province	Kokoda	-8.884678841	147.730957
7627	RAB	Tokua Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Kokopo	-4.34046	152.380005
7628	KQL	Kol Airport	Oceania	PG	Papua New Guinea	Jiwaka Province	Kol	-5.731166667	144.846
7629	KCJ	Komaio Airport	Oceania	PG	Papua New Guinea	Gulf Province	Komaio	-7.2714	143.5952
7630	HOC	Komako Airport	Oceania	PG	Papua New Guinea	Gulf Province	Komako	-7.3984	145.8827
7631	KOM	Komo-Manda Airport	Oceania	PG	Papua New Guinea	Hela Province	Komo	-6.0682	142.8598
7632	KPM	Kompiam Airport	Oceania	PG	Papua New Guinea	Enga Province	Kompiam	-5.381666667	143.9247222
7633	KMB	Koinambe Airport	Oceania	PG	Papua New Guinea	Jiwaka Province	Konambe	-5.4875	144.6069444
7634	KPF	Kondobol Airport	Oceania	PG	Papua New Guinea	Western Province	Kondobol	-8.5336	142.5049
7635	KGB	Konge Airport	Oceania	PG	Papua New Guinea	Morobe Province	Konge	-6.2239	147.2152
7636	KPA	Kopiago Airport	Oceania	PG	Papua New Guinea	Hela Province	Kopiago	-5.3883	142.4977
7637	KDE	Koroba Airport	Oceania	PG	Papua New Guinea	Hela Province	Koroba	-5.6952	142.7441
7638	KSP	Kosipe Airport	Oceania	PG	Papua New Guinea	Central Province	Kosipe Mission	-8.450716	147.209195
7639	CMU	Chimbu Airport	Oceania	PG	Papua New Guinea	Chimbu Province	Kundiawa	-6.024290085	144.970993
7640	KGM	Kungim Airport	Oceania	PG	Papua New Guinea	Western Province	Kungim	-5.671	141.03
7641	KUP	Kupiano Airport	Oceania	PG	Papua New Guinea	Central Province	Kupiano	-10.0736	148.218
7642	KUQ	Kuri Airport	Oceania	PG	Papua New Guinea	Gulf Province	Kuri	-7.135083	143.276111
7643	KUX	Kuyol Airport	Oceania	PG	Papua New Guinea	Western Province	Kuyol	-5.372361111	141.6238889
7644	LAB	Lab Lab Airport	Oceania	PG	Papua New Guinea	Morobe Province	Lab Lab Mission	-5.7204	148.0566
7645	LAE	Nadzab Airport	Oceania	PG	Papua New Guinea	Morobe Province	Lae	-6.569803	146.725977
7646	LMY	Lake Murray Airport	Oceania	PG	Papua New Guinea	Western Province	Lake Murray	-7.00992012	141.4940033
7647	LNM	Langimar Airport	Oceania	PG	Papua New Guinea	Morobe Province	Langimar	-7.223138889	146.2270833
7648	LTF	Leitre Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Leitre	-2.8337	141.6257
7649	LNC	Lengbati Airport	Oceania	PG	Papua New Guinea	Morobe Province	Lengbati	-6.384611111	147.3686389
7650	LPN	Leron Plains Airport	Oceania	PG	Papua New Guinea	Morobe Province	Leron Plains	-6.3917	146.3434
7651	LNG	Lese Airport	Oceania	PG	Papua New Guinea	Gulf Province	Lese	-8.2799	146.2765
7652	LGN	Linga Linga Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Linga Linga	-5.531944444	149.7341667
7653	LNV	Londolovit Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Londolovit	-3.043610096	152.6289978
7654	LSJ	Long Island Airport	Oceania	PG	Papua New Guinea	Madang Province	Long Island	-5.3604	147.0177
7655	LSA	Losuia Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Losuia	-8.505820274	151.0809937
7656	LWI	Lowai Airport	Oceania	PG	Papua New Guinea	Morobe Province	Lowai	-6.3344	146.6458
7657	LMI	Lumi Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Lumi	-3.476839511	142.0412922
7658	MAG	Madang Airport	Oceania	PG	Papua New Guinea	Madang Province	Madang	-5.207079887	145.7890015
7659	OPB	Open Bay Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Maitanakunai	-4.794727	151.696195
7660	MPG	Makini Airport	Oceania	PG	Papua New Guinea	Morobe Province	Makini	-6.532222222	147.6511667
7661	MMV	Mal Airport	Oceania	PG	Papua New Guinea	Manus Province	Mal Island	-1.39139	144.17131
7662	MLQ	Malalaua Airport	Oceania	PG	Papua New Guinea	Gulf Province	Malalaua	-8.071388889	146.1554722
7663	MQO	Malam Airport	Oceania	PG	Papua New Guinea	Western Province	Malam	-8.709166667	142.6497222
7664	MAP	Mamai Airport	Oceania	PG	Papua New Guinea	Central Province	Mamai	-10.29083333	149.5191667
7665	MRM	Manari Airport	Oceania	PG	Papua New Guinea	Central Province	Manari	-9.1908	147.6219
7666	MGP	Manga Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Manga Mission	-4.147	153.0186
7667	MFO	Manguna Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Manguna	-5.577778	151.792333
7668	UUU	Manumu Airport	Oceania	PG	Papua New Guinea	Central Province	Manumu	-9.0746	147.5735
7669	MAS	Momote Airport	Oceania	PG	Papua New Guinea	Manus Province	Manus Island	-2.06189	147.423996
7670	MPF	Mapoda Airport	Oceania	PG	Papua New Guinea	Western Province	Mapoda	-7.979	143.1694
7671	MWI	Maramuni Airport	Oceania	PG	Papua New Guinea	Enga Province	Maramuni	-5.13	143.4829
7672	MWG	Marawaka Airport	Oceania	PG	Papua New Guinea	Eastern Highlands Province	Marawaka	-6.9736	145.8849
7673	MBV	Masa Airport	Oceania	PG	Papua New Guinea	Morobe Province	Masa	-6.345	147.591
7674	MRH	May River Airstrip	Oceania	PG	Papua New Guinea	East Sepik Province	May River	-4.3615	141.785
7675	MDU	Mendi Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Mendi	-6.14774	143.656998
7676	MYX	Menyamya Airport	Oceania	PG	Papua New Guinea	Morobe Province	Menyamya	-7.211666667	146.0193611
7677	MXK	Mindik Airport	Oceania	PG	Papua New Guinea	Morobe Province	Mindik	-6.471666667	147.4411389
7678	MIS	Misima Island Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Misima Island	-10.6892004	152.8379974
7679	MPX	Miyanmin Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Miyanmin	-4.903055556	141.6208333
7680	MJJ	Moki Airport	Oceania	PG	Papua New Guinea	Madang Province	Moki	-5.7181	145.2404
7681	MHY	Morehead Airport	Oceania	PG	Papua New Guinea	Western Province	Morehead	-8.714111111	141.6444444
7682	MXH	Moro Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Moro	-6.363329887	143.2380066
7683	OBM	Morobe Airport	Oceania	PG	Papua New Guinea	Morobe Province	Morobe	-7.74	147.59
7684	GUV	Mougulu Airport	Oceania	PG	Papua New Guinea	Western Province	Mougulu	-6.280859	142.420775
7685	UAE	Mount Aue Airport	Oceania	PG	Papua New Guinea	Jiwaka Province	Mount Aue	-6.234166667	144.6647222
7686	HGU	Mount Hagen Kagamuga Airport	Oceania	PG	Papua New Guinea	Western Highlands Province	Mount Hagen	-5.826789856	144.2960052
7687	LNF	Munbil Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Munbil	-4.855941	141.220165
7688	MDM	Munduku Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Munduku	-4.6204	143.4516
7689	MWU	Mussau Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Mussau Island	-1.45	149.7
7690	NDN	Nadunumu Airport	Oceania	PG	Papua New Guinea	Central Province	Nadunumu	-9.143555556	147.68425
7691	NMN	Nomane Airport	Oceania	PG	Papua New Guinea	Chimbu Province	Namane	-6.32183	145.070667
7692	ATN	Namatanai Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Namatanai	-3.6695	152.438
7693	NBA	Nambaiyufa Airport	Oceania	PG	Papua New Guinea	Chimbu Province	Nambaiyufa	-6.2412	145.2424
7694	NDI	Namudi Airport	Oceania	PG	Papua New Guinea	Northern Province	Namudi	-9.47375	148.3294167
7695	NOO	Naoro Airport	Oceania	PG	Papua New Guinea	Central Province	Naoro Vilage	-9.254455	147.621352
7696	GBF	Negarbo(Negabo) Airport	Oceania	PG	Papua New Guinea	Chimbu Province	Negarbo	-6.567778	144.703058
7697	PPX	Param Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Nepesi	-9.99	149.477
7698	NPG	Nipa Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Nipa	-6.1454	143.4531
7699	IIS	Nissan Island Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Nissan Island	-4.499720097	154.2259979
7700	NOM	Nomad River Airport	Oceania	PG	Papua New Guinea	Western Province	Nomad River	-6.294	142.2341667
7701	NWT	Nowata Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Nowata	-9.984166667	149.7291667
7702	NUG	Nuguria Airstrip	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Nuguria Island	-3.4075	154.7383
7703	UKU	Nuku Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Nuku	-3.676651	142.484334
7704	OBX	Obo Airport	Oceania	PG	Papua New Guinea	Western Province	Obo	-7.590622421	141.3242626
7705	OGE	Ogeranang Airport	Oceania	PG	Papua New Guinea	Morobe Province	Ogeranang	-6.46675	147.3641667
7706	OKV	Okao Airport	Oceania	PG	Papua New Guinea	Western Province	Okao	-5.556666667	141.0327778
7707	OKP	Oksapmin Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Oksapmin	-5.2261	142.2259
7708	OLQ	Olsobip Airport	Oceania	PG	Papua New Guinea	Western Province	Olsobip	-5.389722222	141.5152778
7709	OSE	Omora Airport	Oceania	PG	Papua New Guinea	Morobe Province	Omora	-7.827777778	147.0806389
7710	ONB	Ononge Airport	Oceania	PG	Papua New Guinea	Central Province	Onange Mission	-8.674361111	147.2624167
7711	RAX	Oram Airport	Oceania	PG	Papua New Guinea	Central Province	Oram	-9.632916667	148.0480556
7712	OSG	Ossima Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Ossima	-2.915555556	141.2973056
7713	PLE	Paiela Airport	Oceania	PG	Papua New Guinea	Enga Province	Paiela	-5.3725	142.9761111
7714	PGN	Pangia Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Pangia	-6.386	144.1084
7715	PGB	Pangoa Airport	Oceania	PG	Papua New Guinea	Western Province	Pangoa	-7.0226	141.5605
7716	PMP	Pimaga Airport	Oceania	PG	Papua New Guinea	Southern Highlands Province	Pimaga	-6.499166667	143.5102778
7717	PDI	Pindiu Airport	Oceania	PG	Papua New Guinea	Morobe Province	Pindiu	-6.445138889	147.5158333
7718	PNP	Girua Airport	Oceania	PG	Papua New Guinea	Northern Province	Popondetta	-8.80453968	148.3090057
7719	POM	Port Moresby Jacksons International Airport	Oceania	PG	Papua New Guinea	National Capital District (Port Moresby)	Port Moresby	-9.443380356	147.2200012
7720	PUA	Puas Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Puas Mission	-2.395	150.2361
7721	PMN	Pumani Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Pumani	-9.7469	149.4766
7722	RBP	Raba Raba Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Rabaraba	-9.971111111	149.8322222
7723	RAA	Rakanda Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Rakanda	-4.2096	152.4385
7724	RMN	Rumginae Airport	Oceania	PG	Papua New Guinea	Western Province	Rumginae	-5.897222222	141.2716667
7725	SBV	Sabah Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Sabah	-5.5765	155.0489
7726	SFU	Safia Airport	Oceania	PG	Papua New Guinea	Northern Province	Safia	-9.593055556	148.6361111
7727	SDI	Saidor Airport	Oceania	PG	Papua New Guinea	Madang Province	Saidor	-5.627138889	146.4627778
7728	SAM	Salamo Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Salamo	-9.6701	150.7903
7729	SQT	China Strait Airstrip	Oceania	PG	Papua New Guinea	Milne Bay Province	Samarai Island	-10.56277778	150.6906944
7730	SMH	Sapmanga Airport	Oceania	PG	Papua New Guinea	Morobe Province	Sapmanga	-6.075277778	146.8111111
7731	TDS	Sasereme Airport	Oceania	PG	Papua New Guinea	Western Province	Sasereme	-7.6217	142.868
7732	SWG	Satwag Airport	Oceania	PG	Papua New Guinea	Morobe Province	Satwag	-6.139555556	147.2791667
7733	SXW	Sauren Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Sauren	-5.9701	148.8543
7734	SXH	Sehulea Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Sehulea	-9.964527778	151.1618611
7735	SBC	Selbang Airport	Oceania	PG	Papua New Guinea	Western Province	Selbang	-5.315	141.752
7736	SGK	Sengapi Airstrip	Oceania	PG	Papua New Guinea	Madang Province	Sengapi	-5.125833333	144.3236111
7737	SPV	Sepik Plains Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Sepik Plains	-3.8821	143.6734
7738	SXA	Sialum Airport	Oceania	PG	Papua New Guinea	Morobe Province	Sialum	-6.0908	147.5955
7739	SSS	Siassi Airport	Oceania	PG	Papua New Guinea	Morobe Province	Siassi	-5.5965	147.8106
7740	SIL	Sila Airport	Oceania	PG	Papua New Guinea	Northern Province	Sila Mission	-9.073555556	148.38925
7741	SWR	Silur Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Silur Mission	-4.529888889	153.0544444
7742	SMJ	Sim Airport	Oceania	PG	Papua New Guinea	Morobe Province	Sim	-7.75	146.9273
7743	SIM	Simbai Airport	Oceania	PG	Papua New Guinea	Madang Province	Simbai	-5.278611111	144.5447222
7744	NIS	Simberi Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Simberi Island	-2.662222222	151.9977778
7745	SIZ	Sissano Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Sissano	-2.999444444	142.0445
7746	SWE	Siwea Airport	Oceania	PG	Papua New Guinea	Morobe Province	Siwea	-6.284181	147.582371
7747	SPH	Sopu Airport	Oceania	PG	Papua New Guinea	Central Province	Sopu	-8.3038	147.1659
7748	SMP	Stockholm Landing Strip	Oceania	PG	Papua New Guinea	East New Britain Province	Stockholm	-4.35	151.55
7749	SBE	Suabi Airport	Oceania	PG	Papua New Guinea	Western Province	Suabi	-6.104444444	142.2783333
7750	TGL	Tagula Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Sudest Island	-11.33111111	153.2029167
7751	SKC	Suki Airport	Oceania	PG	Papua New Guinea	Western Province	Suki	-8.0466	141.7222
7752	ULE	Sule Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Sule	-4.974720001	151.2969971
7753	TBG	Tabubil Airport	Oceania	PG	Papua New Guinea	Western Province	Tabubil	-5.27861	141.225998
7754	TLW	Talasea Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Talasea	-5.2726	150.0089
7755	TPI	Tapini Airport	Oceania	PG	Papua New Guinea	Central Province	Tapini	-8.356666667	146.9891667
7756	TBQ	Tarabo Airport	Oceania	PG	Papua New Guinea	Eastern Highlands Province	Tarabo	-6.466666667	145.5322222
7757	TRJ	Tarakbits Airport	Oceania	PG	Papua New Guinea	Western Province	Tarakbits	-5.614	141.0421
7758	TIZ	Tari Airport	Oceania	PG	Papua New Guinea	Hela Province	Tari	-5.84499979	142.947998
7759	MPU	Mapua(Mabua) Airport	Oceania	PG	Papua New Guinea	New Ireland Province	Tatau Island	-2.811388889	151.9911111
7760	TWY	Tawa Airport	Oceania	PG	Papua New Guinea	Morobe Province	Tawa	-7.4463	146.1067
7761	TKB	Tekadu Airport	Oceania	PG	Papua New Guinea	Morobe Province	Tekadu	-7.6808	146.5503
7762	TKW	Tekin Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Tekin	-5.243666667	142.1651944
7763	TFM	Telefomin Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Telefomin	-5.12608	141.641922
7764	TEP	Tep Tep Airport	Oceania	PG	Papua New Guinea	Madang Province	Teptep	-5.9553	146.5595
7765	TEO	Terapo Airport	Oceania	PG	Papua New Guinea	Gulf Province	Terapo Mission	-8.169722222	146.1944444
7766	TDB	Tetebedi Airport	Oceania	PG	Papua New Guinea	Northern Province	Tetebedi	-9.1586	148.0686
7767	TFB	Tifalmin Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Tifalmin	-5.1173	141.419
7768	TBE	Timbunke Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Timbunke	-4.196633	143.519222
7769	TCK	Tinboli Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Tinboli	-4.0949	143.3838
7770	TLO	Tol Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Tol	-4.980830193	152.0099945
7771	TON	Tonu Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Tonu	-6.6552	155.4326
7772	TCJ	Torembi Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Torembi	-4.0165	143.1329
7773	TOK	Torokina Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Torokina	-6.2015	155.063
7774	TSW	Tsewi Airport	Oceania	PG	Papua New Guinea	Morobe Province	Tsewi	-7.0695	146.1272
7775	TSI	Tsile Tsile Airport	Oceania	PG	Papua New Guinea	Morobe Province	Tsile Tsile	-6.8498	146.3554
7776	TFI	Tufi Airport	Oceania	PG	Papua New Guinea	Northern Province	Tufi	-9.075954437	149.3198395
7777	TLP	Tumolbil Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Tumolbil	-4.7748	141.0133
7778	UMC	Umba Airport	Oceania	PG	Papua New Guinea	Morobe Province	Umba	-7.0214	145.966
7779	BAJ	Bali Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Unea Island	-4.883333333	149.1333333
7780	UPR	Upiara Airport	Oceania	PG	Papua New Guinea	Western Province	Upiara	-8.5411	142.6503
7781	URU	Uroubi Airport	Oceania	PG	Papua New Guinea	Northern Province	Uroubi	-9.5162	148.5591
7782	UVO	Uvol Airport	Oceania	PG	Papua New Guinea	East New Britain Province	Uvol	-6.0178	150.9557
7783	VAI	Vanimo Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Vanimo	-2.6926	141.3028
7784	VIV	Vivigani Airfield	Oceania	PG	Papua New Guinea	Milne Bay Province	Vivigani	-9.303333333	150.3188889
7785	WAO	Wabo Airport	Oceania	PG	Papua New Guinea	Gulf Province	Wabo	-6.989444444	145.0751111
7786	WKN	Wakunai Airport	Oceania	PG	Papua New Guinea	Autonomous Region of Bougainville	Wakunai	-5.8603	155.2223
7787	AGL	Wanigela Airport	Oceania	PG	Papua New Guinea	Northern Province	Wanigela	-9.3375	149.1555556
7788	WTT	Wantoat Airport	Oceania	PG	Papua New Guinea	Morobe Province	Wantoat	-6.1325	146.4677778
7789	WNU	Wanuma Airport	Oceania	PG	Papua New Guinea	Madang Province	Wanuma	-4.8961	145.3213
7790	WBM	Wapenamanda Airport	Oceania	PG	Papua New Guinea	Enga Province	Wapenamanda	-5.6433	143.895004
7791	WBC	Wapolu Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Wapolu	-9.3376	150.5093
7792	WSU	Wasu Airport	Oceania	PG	Papua New Guinea	Morobe Province	Wasu	-5.961709449	147.1982253
7793	WSA	Wasua Airport	Oceania	PG	Papua New Guinea	Western Province	Wasua	-8.2836	142.8697
7794	WUM	Wasum Airport	Oceania	PG	Papua New Guinea	West New Britain Province	Wasum	-6.0491	149.337
7795	WUG	Wau Airport	Oceania	PG	Papua New Guinea	Morobe Province	Wau	-7.345556	146.718611
7796	WAJ	Wawoi Falls Airport	Oceania	PG	Papua New Guinea	Western Province	Wavoi Falls	-6.9523	142.6557
7797	WEP	Weam Airport	Oceania	PG	Papua New Guinea	Western Province	Weam	-8.6184	141.1381
7798	WED	Wedau Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Wedau	-10.0954	150.0826
7799	WWK	Wewak International Airport	Oceania	PG	Papua New Guinea	East Sepik Province	Wewak	-3.583830118	143.6690063
7800	WPM	Wipim Airport	Oceania	PG	Papua New Guinea	Western Province	Wipim	-8.788220406	142.8820038
7801	WOA	Wonenara Airport	Oceania	PG	Papua New Guinea	Eastern Highlands Province	Wonenara	-6.796861111	145.8919444
7802	GAZ	Guasopa Airport	Oceania	PG	Papua New Guinea	Milne Bay Province	Woodlark (Muyua) Island	-9.225918	152.944352
7803	WUV	Wuvulu Island Airport	Oceania	PG	Papua New Guinea	Manus Province	Wuvulu Island	-1.736111111	142.8366667
7804	KYX	Yalumet Airport	Oceania	PG	Papua New Guinea	Morobe Province	Yalumet	-6.09	147.0117
7805	KPE	Yapsiei Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Yapsiei	-4.628055556	141.0941667
7806	KSX	Yasuru Airport	Oceania	PG	Papua New Guinea	Morobe Province	Yasuru	-6.6015	146.1813
7807	PGE	Yegepa Airport	Oceania	PG	Papua New Guinea	Morobe Province	Yegepa	-7.134444444	146.1563889
7808	XYR	Edwaki Airport	Oceania	PG	Papua New Guinea	Sandaun Province	Yellow River Mission	-3.883986	141.792234
7809	YEQ	Yenkis(Yankisa) Airport	Oceania	PG	Papua New Guinea	Enga Province	Yenkis(Yankisa)	-5.109722222	143.9176667
7810	YVD	Yeva Airport	Oceania	PG	Papua New Guinea	Morobe Province	Yeva	-7.548	146.188
7811	KGH	Yongai Airport	Oceania	PG	Papua New Guinea	Central Province	Yongai	-8.5289	147.4603
7812	RKU	Kairuku Airport	Oceania	PG	Papua New Guinea	Central Province	Yule Island	-8.817000054	146.5243833
7813	ZEN	Zenag Airport	Oceania	PG	Papua New Guinea	Morobe Province	Zenag	-6.952222222	146.61625
7814	APW	Faleolo International Airport	Oceania	WS	Samoa	A'ana District	Apia	-13.82999992	-172.0079956
7815	AAU	Asau Airport	Oceania	WS	Samoa	Vaisigano District	Asau	-13.505132	-172.627888
7816	MXS	Maota Airport	Oceania	WS	Samoa	Palauli District	Maota	-13.74230003	-172.2579956
7817	BNY	Bellona/Anua Airport	Oceania	SB	Solomon Islands	Rennell and Bellona Province	Anua	-11.30222222	159.7983333
7818	RNA	Ulawa Airport	Oceania	SB	Solomon Islands	Makira-Ulawa Province	Arona	-9.860543583	161.9795465
7819	ATD	Uru Harbour Airport	Oceania	SB	Solomon Islands	Malaita Province	Atoifi	-8.87333	161.011002
7820	AKS	Gwaunaru'u Airport	Oceania	SB	Solomon Islands	Malaita Province	Auki	-8.70257	160.682007
7821	AVU	Avu Avu Airport	Oceania	SB	Solomon Islands	Guadalcanal Province	Avu Avu	-9.868333333	160.4105556
7822	BAS	Ballalae Airport	Oceania	SB	Solomon Islands	Western Province	Ballalae	-6.990745	155.886656
7823	VEV	Barakoma Airport	Oceania	SB	Solomon Islands	Western Province	Barakoma	-7.912779808	156.7059937
7824	BPF	Batuna Aerodrome	Oceania	SB	Solomon Islands	Western Province	Batuna Mission Station	-8.562027778	158.1193056
7825	AFT	Afutara Aerodrome	Oceania	SB	Solomon Islands	Malaita Province	Bila	-9.191388889	160.9486111
7826	CHY	Choiseul Bay Airport	Oceania	SB	Solomon Islands	Choiseul Province	Choiseul Bay	-6.711944	156.396111
7827	FRE	Fera/Maringe Airport	Oceania	SB	Solomon Islands	Isabel Province	Fera Island	-8.1075	159.576996
7828	GTA	Gatokae Aerodrome	Oceania	SB	Solomon Islands	Western Province	Gatokae	-8.738358	158.202836
7829	GZO	Nusatupe Airport	Oceania	SB	Solomon Islands	Western Province	Gizo	-8.097780228	156.8639984
7830	HIR	Honiara International Airport	Oceania	SB	Solomon Islands	Guadalcanal Province	Honiara	-9.428	160.054993
7831	KGE	Kaghau Airport	Oceania	SB	Solomon Islands	Choiseul Province	Kagau Island	-7.3305	157.585
7832	IRA	Ngorangora Airport	Oceania	SB	Solomon Islands	Makira-Ulawa Province	Kirakira	-10.44970036	161.897995
7833	KUE	Kukudu Airport	Oceania	SB	Solomon Islands	Western Province	Kolombangara Island	-8.0262	156.94783
7834	KWS	Kwailabesi Airport	Oceania	SB	Solomon Islands	Malaita Province	Kwailabesi	-8.360508	160.775127
7835	GEF	Geva Airport	Oceania	SB	Solomon Islands	Western Province	Liangia	-7.575829983	156.5970001
7836	RUS	Marau Airport	Oceania	SB	Solomon Islands	Guadalcanal Province	Marau	-9.86166954	160.8249969
7837	MBU	Babanakira Airport	Oceania	SB	Solomon Islands	Guadalcanal Province	Mbambanakira	-9.74750042	159.8390045
7838	MUA	Munda Airport	Oceania	SB	Solomon Islands	Western Province	Munda	-8.32797	157.263
7839	PRS	Parasi Airport	Oceania	SB	Solomon Islands	Malaita Province	Parasi	-9.641670227	161.4250031
7840	RBV	Ramata Airport	Oceania	SB	Solomon Islands	Western Province	Ramata	-8.168060303	157.6430054
7841	RNL	Rennell/Tingoa Airport	Oceania	SB	Solomon Islands	Rennell and Bellona Province	Rennell Island	-11.53390026	160.0630035
7842	RIN	Ringi Cove Airport	Oceania	SB	Solomon Islands	Western Province	Ringi Cove	-8.126390457	157.1430054
7843	NNB	Santa Ana Airport	Oceania	SB	Solomon Islands	Makira-Ulawa Province	Santa Ana Island	-10.847994	162.454108
7844	SCZ	Santa Cruz/Graciosa Bay/Luova Airport	Oceania	SB	Solomon Islands	Temotu Province	Santa Cruz/Graciosa Bay/Luova	-10.72029972	165.7949982
7845	EGM	Sege Airport	Oceania	SB	Solomon Islands	Western Province	Sege	-8.578889847	157.8760071
7846	NAZ	Nana Airport	Oceania	SB	Solomon Islands	Makira-Ulawa Province	Star Harbor	-10.6758	162.2049
7847	MNY	Mono Airport	Oceania	SB	Solomon Islands	Western Province	Stirling Island	-7.416940212	155.5650024
7848	VAO	Suavanao Airport	Oceania	SB	Solomon Islands	Isabel Province	Suavanao	-7.585559845	158.7310028
7849	VIU	Viru Harbour Airstrip	Oceania	SB	Solomon Islands	Western Province	Viru	-8.5085	157.69
7850	XYA	Yandina Airport	Oceania	SB	Solomon Islands	Central Province	Yandina	-9.092816	159.21841
7851	NFO	Mata'aho Airport	Oceania	TO	Tonga	Niuas	Angaha, Niuafo'ou Island	-15.57079983	-175.6329956
7852	EUA	Kaufana Airport	Oceania	TO	Tonga	Eua	Eua Island	-21.37829971	-174.9579926
7853	HPA	Lifuka Island Airport	Oceania	TO	Tonga	Ha'apai	Lifuka	-19.77700043	-174.3410034
7854	NTT	Kuini Lavenia Airport	Oceania	TO	Tonga	Niuas	Niuatoputapu	-15.977297	-173.791089
7855	TBU	Fua'amotu International Airport	Oceania	TO	Tonga	Tongatapu	Nuku'alofa	-21.24119949	-175.1499939
7856	VAV	Vava'u International Airport	Oceania	TO	Tonga	Vava'u	Vava'u Island	-18.58530045	-173.9620056
7857	FUN	Funafuti International Airport	Oceania	TV	Tuvalu	Funafuti	Funafuti	-8.525	179.195999
7858	HNM	Hana Airport	Oceania	US	United States	Hawaii	Hana	20.795601	-156.014008
7859	HPV	Princeville Airport	Oceania	US	United States	Hawaii	Hanalei	22.209313	-159.44515
7860	PAK	Port Allen Airport	Oceania	US	United States	Hawaii	Hanapepe	21.8969	-159.602997
7861	UPP	Upolu Airport	Oceania	US	United States	Hawaii	Hawi	20.265301	-155.860001
7862	ITO	Hilo International Airport	Oceania	US	United States	Hawaii	Hilo	19.721399	-155.048004
7863	HNL	Daniel K Inouye International Airport	Oceania	US	United States	Hawaii	Honolulu	21.32062	-157.924228
7864	HIK	Hickam Air Force Base	Oceania	US	United States	Hawaii	Honolulu	21.335278	-157.948333
7865	OGG	Kahului Airport	Oceania	US	United States	Hawaii	Kahului	20.898543	-156.431212
7866	KOA	Ellison Onizuka Kona International Airport at Keahole	Oceania	US	United States	Hawaii	Kailua-Kona	19.738783	-156.045603
7867	LUP	Kalaupapa Airport	Oceania	US	United States	Hawaii	Kalaupapa	21.211	-156.973999
7868	NGF	Kaneohe Bay MCAS (Marion E. Carl Field) Airport	Oceania	US	United States	Hawaii	Kaneohe	21.4505	-157.768005
7869	JRF	Kalaeloa Airport	Oceania	US	United States	Hawaii	Kapolei	21.3074	-158.070009
7870	MKK	Molokai Airport	Oceania	US	United States	Hawaii	Kaunakakai	21.152901	-157.095993
7871	BKH	Barking Sands Airport	Oceania	US	United States	Hawaii	Kekaha	22.0228	-159.785004
7872	JHM	Kapalua Airport	Oceania	US	United States	Hawaii	Lahaina	20.9629	-156.673004
7873	LNY	Lanai Airport	Oceania	US	United States	Hawaii	Lanai City	20.785675	-156.951324
7874	LIH	Lihue Airport	Oceania	US	United States	Hawaii	Lihue	21.976	-159.339005
7875	HDH	Dillingham Airfield	Oceania	US	United States	Hawaii	Mokuleia	21.5795	-158.197006
7876	HHI	Wheeler Army Airfield	Oceania	US	United States	Hawaii	Wahiawa	21.481637	-158.037048
7877	BSF	Bradshaw Army Airfield	Oceania	US	United States	Hawaii	Waimea (Kamuela)	19.760099	-155.554001
7878	MUE	Waimea Kohala Airport	Oceania	US	United States	Hawaii	Waimea (Kamuela)	20.001301	-155.667999
7879	MDY	Henderson Field	Oceania	UM	United States Minor Outlying Islands	Midway Islands	Sand Island	28.20170021	-177.3809967
7880	AWK	Wake Island Airfield	Oceania	UM	United States Minor Outlying Islands	Wake Island	Wake Island	19.282437	166.636637
7881	MTV	Mota Lava Airport	Oceania	VU	Vanuatu	Torba	Ablow	-13.66600037	167.7120056
7882	ULB	Ul??i Airport	Oceania	VU	Vanuatu	Malampa	Ambrym Island	-16.3297	168.3011
7883	AUY	Aneityum Airport	Oceania	VU	Vanuatu	Tafea	Anatom Island	-20.24920082	169.7709961
7884	AWD	Aniwa Airport	Oceania	VU	Vanuatu	Tafea	Aniwa	-19.2346	169.6009
7885	CCV	Craig Cove Airport	Oceania	VU	Vanuatu	Malampa	Craig Cove	-16.264999	167.923996
7886	DLY	Dillon's Bay Airport	Oceania	VU	Vanuatu	Tafea	Dillon's Bay	-18.76939964	169.0010071
7887	EAE	Siwo Airport	Oceania	VU	Vanuatu	Shefa	Emae Island	-17.09029961	168.3430023
7888	VLS	Valesdir Airport	Oceania	VU	Vanuatu	Shefa	Epi Island	-16.79610062	168.177002
7889	FTA	Futuna Airport	Oceania	VU	Vanuatu	Tafea	Futuna Island	-19.51639938	170.2319946
7890	ZGU	Gaua Island Airport	Oceania	VU	Vanuatu	Torba	Gaua Island	-14.21809959	167.5870056
7891	IPA	Ipota Airport	Oceania	VU	Vanuatu	Tafea	Ipota	-18.856389	169.283333
7892	LPM	Lamap Airport	Oceania	VU	Vanuatu	Malampa	Lamap	-16.4611228	167.829253
7893	LNB	Lamen Bay Airport	Oceania	VU	Vanuatu	Shefa	Lamen Bay	-16.58419991	168.1589966
7894	TOH	Torres Airstrip	Oceania	VU	Vanuatu	Torba	Loh/Linua	-13.32800007	166.6380005
7895	LOD	Longana Airport	Oceania	VU	Vanuatu	Penama	Longana	-15.30669975	167.9669952
7896	LNE	Lonorore Airport	Oceania	VU	Vanuatu	Penama	Lonorore	-15.86559963	168.1719971
7897	SON	Santo Pekoa International Airport	Oceania	VU	Vanuatu	Sanma	Luganville	-15.50500011	167.2200012
7898	MWF	Maewo-Naone Airport	Oceania	VU	Vanuatu	Penama	Maewo Island	-15	168.0829926
7899	SWJ	Southwest Bay Airport	Oceania	VU	Vanuatu	Malampa	Malekula Island	-16.4864	167.4472
7900	NUS	Norsup Airport	Oceania	VU	Vanuatu	Malampa	Norsup	-16.0797	167.401001
7901	OLJ	North West Santo Airport	Oceania	VU	Vanuatu	Sanma	Olpoi	-14.88169956	166.5579987
7902	PBJ	Tavie Airport	Oceania	VU	Vanuatu	Malampa	Paama Island	-16.43899918	168.2570038
7903	SSR	Sara Airport	Oceania	VU	Vanuatu	Penama	Pentecost Island	-15.4708004	168.1519928
7904	VLI	Bauerfield International Airport	Oceania	VU	Vanuatu	Shefa	Port Vila	-17.699301	168.320007
7905	RCL	Redcliffe Airport	Oceania	VU	Vanuatu	Penama	Redcliffe	-15.47200012	167.8350067
7906	SLH	Sola Airport	Oceania	VU	Vanuatu	Torba	Sola	-13.85169983	167.5370026
7907	TAH	Tanna Airport	Oceania	VU	Vanuatu	Tafea	Tanna	-19.45509911	169.223999
7908	TGH	Tongoa Airport	Oceania	VU	Vanuatu	Shefa	Tongoa Island	-16.89109993	168.5509949
7909	WLH	Walaha Airport	Oceania	VU	Vanuatu	Penama	Walaha	-15.4119997	167.6909943
7910	FUT	Pointe Vele Airport	Oceania	WF	Wallis and Futuna	Futuna Island	Futuna Island	-14.31140041	-178.0659943
7911	WLS	Hihifo Airport	Oceania	WF	Wallis and Futuna	Wallis Island	Wallis Island	-13.23830032	-176.1990051
7912	ARR	D. Casimiro Szlapelis Airport	South America	AR	Argentina	Chubut Province	Alto Rio Senguerr	-45.013599	-70.812202
7913	BHI	Comandante Espora Airport	South America	AR	Argentina	Buenos Aires Province	Bahia Blanca	-38.725	-62.1693
7914	QRF	Bragado Airport	South America	AR	Argentina	Buenos Aires Province	Bragado	-35.145811	-60.480294
7915	AEP	Jorge Newbery Airpark	South America	AR	Argentina	Capital federal	Buenos Aires	-34.5592	-58.4156
7916	EZE	Ministro Pistarini International Airport	South America	AR	Argentina	Buenos Aires Province	Buenos Aires (Ezeiza)	-34.8222	-58.5358
7917	CVI	Caleta Olivia Airport	South America	AR	Argentina	Santa Cruz Province	Caleta Olivia	-46.37428	-67.59409
7918	CPG	Carmen de Patagones Airport	South America	AR	Argentina	Buenos Aires Province	Carmen de Patagones	-40.7781	-62.9803
7919	CTC	Catamarca Airport	South America	AR	Argentina	Catamarca Province	Catamarca	-28.59560013	-65.75170136
7920	CRR	Ceres Airport	South America	AR	Argentina	Santa Fe Province	Ceres	-29.872292	-61.927925
7921	CPC	Aviador C. Campos Airport	South America	AR	Argentina	Neuqu??n Province	Chapelco/San Martin de los Andes	-40.075401	-71.137299
7922	CNT	Charata Airport	South America	AR	Argentina	Chaco Province	Charata	-27.2164	-61.2103
7923	HOS	Chos Malal Airport	South America	AR	Argentina	Neuqu??n Province	Chos Malal	-37.44469833	-70.22250366
7924	JSM	Jose De San Martin Airport	South America	AR	Argentina	Chubut Province	Chubut	-44.04859924	-70.45890045
7925	CLX	Clorinda Airport	South America	AR	Argentina	Formosa Province	Clorinda	-25.3036	-57.7344
7926	CRD	General E. Mosconi Airport	South America	AR	Argentina	Chubut Province	Comodoro Rivadavia	-45.7853	-67.4655
7927	COC	Comodoro Pierrestegui Airport	South America	AR	Argentina	Entre R??os Province	Concordia	-31.2969	-57.9966
7928	COR	Ingeniero Ambrosio Taravella Airport	South America	AR	Argentina	C??rdoba Province	Cordoba	-31.323601	-64.208
7929	CSZ	Brigadier D.H.E. Ruiz Airport	South America	AR	Argentina	Buenos Aires Province	Coronel Suarez	-37.446098	-61.889301
7930	CNQ	Corrientes Airport	South America	AR	Argentina	Corrientes Province	Corrientes	-27.4455	-58.7619
7931	UZU	Curuzu Cuatia Airport	South America	AR	Argentina	Corrientes Province	Curuzu Cuatia	-29.7706	-57.9789
7932	CUT	Cutral-Co Airport	South America	AR	Argentina	Neuqu??n Province	Cutral-Co	-38.93970108	-69.26460266
7933	EHL	El Bolson Airport	South America	AR	Argentina	R??o Negro Province	El Bolson	-41.94319916	-71.53230286
7934	FTE	El Calafate - Commander Armando Tola International Airport	South America	AR	Argentina	Santa Cruz Province	El Calafate	-50.2803	-72.053101
7935	ELO	El Dorado Airport	South America	AR	Argentina	Misiones Province	El Dorado	-26.39749908	-54.5746994
7936	EMX	El Maiten Airport	South America	AR	Argentina	Chubut Province	El Maiten	-42.02920151	-71.17250061
7937	EPA	El Palomar Airport	South America	AR	Argentina	Buenos Aires Province	El Palomar	-34.6099	-58.6126
7938	EQS	Brigadier Antonio Parodi Airport	South America	AR	Argentina	Chubut Province	Esquel	-42.90800095	-71.13950348
7939	FMA	Formosa Airport	South America	AR	Argentina	Formosa Province	Formosa	-26.2127	-58.2281
7940	GPO	General Pico Airport	South America	AR	Argentina	La Pampa Province	General Pico	-35.69620132	-63.75830078
7941	GNR	Dr. Arturo H. Illia Airport	South America	AR	Argentina	R??o Negro Province	General Roca	-39.0007019	-67.62049866
7942	VGS	General Villegas Airport	South America	AR	Argentina	Buenos Aires Province	General Villegas	-34.995728	-62.999725
7943	GGS	Gobernador Gregores Airport	South America	AR	Argentina	Santa Cruz Province	Gobernador Gregores	-48.7831	-70.150002
7944	OYA	Goya Airport	South America	AR	Argentina	Corrientes Province	Goya	-29.1058	-59.2189
7945	GHU	Gualeguaychu Airport	South America	AR	Argentina	Entre R??os Province	Gualeguaychu	-33.0103	-58.6131
7946	IGB	Ingeniero Jacobacci - Captain H R Bord??n Airport	South America	AR	Argentina	R??o Negro Province	Ingeniero Jacobacci	-41.3209	-69.574898
7947	LCM	La Cumbre Airport	South America	AR	Argentina	C??rdoba Province	La Cumbre	-31.00580025	-64.5318985
7948	LPG	La Plata Airport	South America	AR	Argentina	Buenos Aires Province	La Plata	-34.9722	-57.8947
7949	IRJ	Capitan V A Almonacid Airport	South America	AR	Argentina	La Rioja Province	La Rioja	-29.38159943	-66.79579926
7950	CVH	Caviahue Airport	South America	AR	Argentina	Neuqu??n Province	Lafontaine	-37.851398	-71.009201
7951	LHS	Las Heras Airport	South America	AR	Argentina	Santa Cruz Province	Las Heras	-46.53829956	-68.96530151
7952	LLS	Alferez Armando Rodriguez Airport	South America	AR	Argentina	Formosa Province	Las Lomitas	-24.72139931	-60.54880142
7953	LCP	Loncopue Airport	South America	AR	Argentina	Neuqu??n Province	Loncopue	-38.081902	-70.643898
7954	LMD	Los Menucos Airport	South America	AR	Argentina	R??o Negro Province	Los Menucos	-40.817699	-68.074699
7955	LGS	Comodoro D.R. Salom??n Airport	South America	AR	Argentina	Mendoza Province	Malargue	-35.49359894	-69.57430267
7956	MQD	Maquinchao Airport	South America	AR	Argentina	R??o Negro Province	Maquinchao	-41.24309921	-68.70780182
7957	MDQ	??stor Piazzola International Airport	South America	AR	Argentina	Buenos Aires Province	Mar del Plata	-37.9342	-57.5733
7958	MDZ	El Plumerillo Airport	South America	AR	Argentina	Mendoza Province	Mendoza	-32.83169937	-68.79290009
7959	MDX	Mercedes Airport	South America	AR	Argentina	Corrientes Province	Mercedes	-29.22139931	-58.08779907
7960	RLO	Valle Del Conlara International Airport	South America	AR	Argentina	San Luis Province	Merlo	-32.38470078	-65.18650055
7961	MJR	Miramar Airport	South America	AR	Argentina	Buenos Aires Province	Miramar	-38.2271	-57.8697
7962	MCS	Monte Caseros Airport	South America	AR	Argentina	Corrientes Province	Monte Caseros	-30.2719	-57.6402
7963	NEC	Necochea Airport	South America	AR	Argentina	Buenos Aires Province	Necochea	-38.490746	-58.816337
7964	NQN	Presidente Peron Airport	South America	AR	Argentina	Neuqu??n Province	Neuquen	-38.949001	-68.155701
7965	OVR	Olavarria Airport	South America	AR	Argentina	Buenos Aires Province	Olavarria	-36.889999	-60.216599
7966	ORA	Or??n Airport	South America	AR	Argentina	Salta Province	Or??n	-23.15279961	-64.32920074
7967	PRA	General Urquiza Airport	South America	AR	Argentina	Entre R??os Province	Parana	-31.7948	-60.4804
7968	AOL	Paso De Los Libres Airport	South America	AR	Argentina	Corrientes Province	Paso de los Libres	-29.6894	-57.1521
7969	PEH	Comodoro Pedro Zanni Airport	South America	AR	Argentina	Buenos Aires Province	Pehuaj??	-35.8446	-61.8576
7970	PMQ	Perito Moreno Airport	South America	AR	Argentina	Santa Cruz Province	Perito Moreno	-46.537899	-70.978699
7971	PSS	Libertador Gral D Jose De San Martin Airport	South America	AR	Argentina	Misiones Province	Posadas	-27.3858	-55.9707
7972	PRQ	Termal Airport	South America	AR	Argentina	Chaco Province	Presidencia Roque S??enz Pe??a	-26.753611	-60.492222
7973	PUD	Puerto Deseado Airport	South America	AR	Argentina	Santa Cruz Province	Puerto Deseado	-47.7353	-65.9041
7974	IGR	Cataratas Del Iguaz?? International Airport	South America	AR	Argentina	Misiones Province	Puerto Iguazu	-25.737301	-54.4734
7975	PMY	El Tehuelche Airport	South America	AR	Argentina	Chubut Province	Puerto Madryn	-42.7592	-65.1027
7976	RZA	Santa Cruz Airport	South America	AR	Argentina	Santa Cruz Province	Puerto Santa Cruz	-50.0165	-68.5792
7977	RAF	Rafaela Airport	South America	AR	Argentina	Santa Fe Province	Rafaela	-31.2825	-61.5017
7978	REL	Almirante Marco Andres Zar Airport	South America	AR	Argentina	Chubut Province	Rawson	-43.2105	-65.2703
7979	RCQ	Reconquista Airport	South America	AR	Argentina	Santa Fe Province	Reconquista	-29.2103	-59.68
7980	RES	Resistencia International Airport	South America	AR	Argentina	Chaco Province	Resistencia	-27.45	-59.0561
7981	RDS	Rincon De Los Sauces Airport	South America	AR	Argentina	Neuqu??n Province	Rincon de los Sauces	-37.3905983	-68.90419769
7982	RCU	Area De Material Airport	South America	AR	Argentina	C??rdoba Province	Rio Cuarto	-33.08509827	-64.26129913
8102	BYO	Bonito Airport	South America	BR	Brazil	Mato Grosso do Sul	Bonito	-21.2473	-56.452399
7983	RGL	Piloto Civil N. Fern??ndez Airport	South America	AR	Argentina	Santa Cruz Province	Rio Gallegos	-51.6089	-69.3126
7984	RGA	Hermes Quijada International Airport	South America	AR	Argentina	Tierra del Fuego Province	Rio Grande	-53.7777	-67.7494
7985	ROY	Rio Mayo Airport	South America	AR	Argentina	Chubut Province	Rio Mayo	-45.70389938	-70.24559784
7986	RYO	28 de Noviembre Airport	South America	AR	Argentina	Santa Cruz Province	Rio Turbio	-51.605	-72.2203
7987	ROS	Rosario Islas Malvinas International Airport	South America	AR	Argentina	Santa Fe Province	Rosario	-32.9036	-60.785
7988	SLA	Martin Miguel De Guemes International Airport	South America	AR	Argentina	Salta Province	Salta	-24.8560009	-65.48619843
7989	OES	Antoine de Saint Exup??ry Airport	South America	AR	Argentina	R??o Negro Province	San Antonio Oeste	-40.7512	-65.0343
7990	BRC	San Carlos De Bariloche Airport	South America	AR	Argentina	R??o Negro Province	San Carlos de Bariloche	-41.151199	-71.157501
7991	UAQ	Domingo Faustino Sarmiento Airport	South America	AR	Argentina	San Juan Province	San Juan	-31.571501	-68.418198
7992	ULA	Capitan D Daniel Vazquez Airport	South America	AR	Argentina	Santa Cruz Province	San Julian	-49.306816	-67.802596
7993	LUQ	Brigadier Mayor D Cesar Raul Ojeda Airport	South America	AR	Argentina	San Luis Province	San Luis	-33.27320099	-66.35639954
7994	TUC	Teniente Benjamin Matienzo Airport	South America	AR	Argentina	Tucum??n Province	San Miguel de Tucum??n	-26.8409	-65.104897
7995	AFA	Suboficial Ay Santiago Germano Airport	South America	AR	Argentina	Mendoza Province	San Rafael	-34.588299	-68.4039
7996	JUJ	Gobernador Horacio Guzman International Airport	South America	AR	Argentina	Jujuy Province	San Salvador de Jujuy	-24.392799	-65.097801
7997	SFN	Sauce Viejo Airport	South America	AR	Argentina	Santa Fe Province	Santa Fe	-31.7117	-60.8117
7998	RSA	Santa Rosa Airport	South America	AR	Argentina	La Pampa Province	Santa Rosa	-36.588299	-64.275703
7999	SST	Santa Teresita Airport	South America	AR	Argentina	Buenos Aires Province	Santa Teresita	-36.5423	-56.7218
8000	SDE	Vicecomodoro Angel D. La Paz Aragon??s Airport	South America	AR	Argentina	Santiago del Estero Province	Santiago del Estero	-27.76555634	-64.30999756
8001	OLN	Colonia Sarmiento Airport	South America	AR	Argentina	Chubut Province	Sarmiento	-45.582371	-68.999841
8002	SGV	Sierra Grande Airport	South America	AR	Argentina	R??o Negro Province	Sierra Grande	-41.59170151	-65.33940125
8003	NCJ	Sunchales Aeroclub Airport	South America	AR	Argentina	Santa Fe Province	Sunchales	-30.9575	-61.5283
8004	TDL	H??roes De Malvinas Airport	South America	AR	Argentina	Buenos Aires Province	Tandil	-37.234634	-59.228647
8005	TTG	General Enrique Mosconi Airport	South America	AR	Argentina	Salta Province	Tartagal	-22.6196003	-63.79370117
8006	RHD	Termas de R??o Hondo international Airport	South America	AR	Argentina	Santiago del Estero Province	Termas de R??o Hondo	-27.4966	-64.93595
8007	OYO	Tres Arroyos Airport	South America	AR	Argentina	Buenos Aires Province	Tres Arroyos	-38.3869	-60.3297
8008	USH	Malvinas Argentinas Airport	South America	AR	Argentina	Tierra del Fuego Province	Ushuaia	-54.8433	-68.2958
8009	VCF	Valcheta Airport	South America	AR	Argentina	R??o Negro Province	Valcheta	-40.70000076	-66.15000153
8010	VDM	Gobernador Castello Airport	South America	AR	Argentina	R??o Negro Province	Viedma / Carmen de Patagones	-40.8692	-63.0004
8011	VDR	Villa Dolores Airport	South America	AR	Argentina	C??rdoba Province	Villa Dolores	-31.94519997	-65.14630127
8012	VLG	Villa Gesell Airport	South America	AR	Argentina	Buenos Aires Province	Villa Gesell	-37.2354	-57.0292
8013	VME	Villa Reynolds Airport	South America	AR	Argentina	San Luis Province	Villa Mercedes	-33.72990036	-65.38739777
8014	APZ	Zapala Airport	South America	AR	Argentina	Neuqu??n Province	Zapala	-38.975498	-70.113602
8015	APB	Apolo Airport	South America	BO	Bolivia	La Paz Department	Apolo	-14.73560047	-68.41190338
8016	ASC	Ascenci??n De Guarayos Airport	South America	BO	Bolivia	Santa Cruz Department	Ascensi??n de Guarayos	-15.93029976	-63.15670013
8017	BVL	Baures Airport	South America	BO	Bolivia	El Beni Department	Baures	-13.58333302	-63.58333206
8018	BJO	Bermejo Airport	South America	BO	Bolivia	Tarija Department	Bermejo	-22.77330017	-64.31289673
8019	CAM	Camiri Airport	South America	BO	Bolivia	Santa Cruz Department	Camiri	-20.00639915	-63.52780151
8020	CCA	Chimore Airport	South America	BO	Bolivia	Cochabamba Department	Chimore	-16.976834	-65.145568
8021	CIJ	Capit??n An??bal Arab Airport	South America	BO	Bolivia	Pando Department	Cobija	-11.04039955	-68.78299713
8022	CBB	Jorge Wilsterman International Airport	South America	BO	Bolivia	Cochabamba Department	Cochabamba	-17.42110062	-66.17710114
8023	CEP	Concepci??n Airport	South America	BO	Bolivia	Santa Cruz Department	Concepci??n	-16.13829994	-62.02859879
8024	MHW	Monteagudo Airport	South America	BO	Bolivia	Chuquisaca Department	El Ba??ado	-19.82699966	-63.96099854
8025	GYA	Capit??n de Av. Emilio Beltr??n Airport	South America	BO	Bolivia	El Beni Department	Guayaramer??n	-10.82059956	-65.34559631
8026	BVK	Huacaraje Airport	South America	BO	Bolivia	El Beni Department	Itenes	-13.55000019	-63.7478981
8027	LPB	El Alto International Airport	South America	BO	Bolivia	La Paz Department	La Paz / El Alto	-16.51329994	-68.19229889
8028	MGD	Magdalena Airport	South America	BO	Bolivia	El Beni Department	Magdalena	-13.26074838	-64.06076431
8029	ORU	Juan Mendoza Airport	South America	BO	Bolivia	Oruro Department	Oruro	-17.96260071	-67.07620239
8030	POI	Capitan Nicolas Rojas Airport	South America	BO	Bolivia	Potos?? Department	Potos??	-19.543331	-65.723734
8031	PUR	Puerto Rico Airport	South America	BO	Bolivia	Pando Department	Puerto Rico/Manuripi	-11.107663	-67.551155
8032	PSZ	Capit??n Av. Salvador Ogaya G. airport	South America	BO	Bolivia	Santa Cruz Department	Puerto Su??rez	-18.975301	-57.820599
8033	UYU	Uyuni Joya Andina Airport	South America	BO	Bolivia	Potos?? Department	Quijarro	-20.441304	-66.857553
8034	REY	Reyes Airport	South America	BO	Bolivia	El Beni Department	Reyes	-14.3044	-67.353401
8035	RIB	Capit??n Av. Selin Zeitun Lopez Airport	South America	BO	Bolivia	El Beni Department	Riberalta	-11	-66
8036	RBO	Robor?? Airport	South America	BO	Bolivia	Santa Cruz Department	Robor??	-18.32920074	-59.76499939
8037	RBQ	Rurenabaque Airport	South America	BO	Bolivia	El Beni Department	Rurenabaque	-14.42790031	-67.49680328
8038	SRJ	Capit??n Av. German Quiroga G. Airport	South America	BO	Bolivia	El Beni Department	San Borja	-14.85919952	-66.73750305
8039	SNM	San Ignacio de Moxos Airport	South America	BO	Bolivia	El Beni Department	San Ignacio de Moxos	-14.9658	-65.6338
8040	SNG	Capit??n Av. Juan Cochamanidis S. Airport	South America	BO	Bolivia	Santa Cruz Department	San Ignacio de Velasco	-16.3836	-60.962799
8041	SJV	San Javier Airport	South America	BO	Bolivia	Santa Cruz Department	San Javier	-16.27079964	-62.47029877
8042	SJB	San Joaqu??n Airport	South America	BO	Bolivia	El Beni Department	San Joaqu??n	-13.0528	-64.661697
8043	SJS	San Jos?? De Chiquitos Airport	South America	BO	Bolivia	Santa Cruz Department	San Jos?? de Chiquitos	-17.8307991	-60.74309921
8044	MQK	San Mat??as Airport	South America	BO	Bolivia	Santa Cruz Department	San Mat??as	-16.33919907	-58.40190125
8045	SRD	San Ram??n Airport	South America	BO	Bolivia	El Beni Department	San Ram??n / Mamor??	-13.2639	-64.603897
8046	SBL	Santa Ana Del Yacuma Airport	South America	BO	Bolivia	El Beni Department	Santa Ana del Yacuma	-13.76220036	-65.43520355
8047	SRZ	El Trompillo Airport	South America	BO	Bolivia	Santa Cruz Department	Santa Cruz	-17.81159973	-63.17150116
8048	VVI	Viru Viru International Airport	South America	BO	Bolivia	Santa Cruz Department	Santa Cruz	-17.6448	-63.135399
8049	SRB	Santa Rosa De Yacuma Airport	South America	BO	Bolivia	El Beni Department	Santa Rosa	-14.06620026	-66.78679657
8050	TJA	Capitan Oriel Lea Plaza Airport	South America	BO	Bolivia	Tarija Department	Tarija	-21.5557003	-64.70130157
8051	TDD	Teniente Av. Jorge Henrich Arauz Airport	South America	BO	Bolivia	El Beni Department	Trinidad	-14.81869984	-64.91799927
8052	VAH	Capit??n Av. Vidal Villagomez Toledo Airport	South America	BO	Bolivia	Santa Cruz Department	Vallegrande	-18.48250008	-64.09940338
8053	VLM	Teniente Coronel Rafael Pab??n Airport	South America	BO	Bolivia	Tarija Department	Villamontes	-21.25519943	-63.4056015
8054	BYC	Yacuiba Airport	South America	BO	Bolivia	Tarija Department	Yacu??ba	-21.96089935	-63.65169907
8055	SRE	Alcantar?? Airport	South America	BO	Bolivia	Chuquisaca Department	Yamparaez	-19.246835	-65.149611
8056	GGB	Olhos D`??gua Airport	South America	BR	Brazil	Mato Grosso	??gua Boa	-14.019444	-52.152222
8057	ALQ	Alegrete Novo Airport	South America	BR	Brazil	Rio Grande do Sul	Alegrete	-29.81270027	-55.89339828
8058	ALT	Alenquer Municipal Airport	South America	BR	Brazil	Par??	Alenquer	-1.917	-54.7231
8059	GGF	Almeirim Airport	South America	BR	Brazil	Par??	Almeirim	-1.479524	-52.578214
8060	MEU	Monte Dourado - Serra do Are??o Airport	South America	BR	Brazil	Par??	Almeirim	-0.889839	-52.6022
8061	AMJ	Cirilo Queir??z Airport	South America	BR	Brazil	Minas Gerais	Almenara	-16.18389	-40.66722
8062	AFL	Piloto Osvaldo Marques Dias Airport	South America	BR	Brazil	Mato Grosso	Alta Floresta	-9.866389	-56.106298
8063	ATM	Altamira Interstate Airport	South America	BR	Brazil	Par??	Altamira	-3.253144	-52.253938
8064	APY	Alto Parna??ba Airport	South America	BR	Brazil	Maranh??o	Alto Parna??ba	-9.083610535	-45.95055771
8065	APS	An??polis Airport	South America	BR	Brazil	Goi??s	An??polis	-16.36230087	-48.92710114
8066	APU	Captain Jo??o Busse Airport	South America	BR	Brazil	Paran??	Apucarana	-23.609099	-51.384301
8067	IUP	Apu?? Airport	South America	BR	Brazil	Amazonas	Apu??	-7.172773	-59.8396
8068	AJU	Aracaju - Santa Maria International Airport	South America	BR	Brazil	Sergipe	Aracaju	-10.984	-37.070301
8069	ARX	Aracati Drag??o do Mar Regional Airport	South America	BR	Brazil	Cear??	Aracati	-4.568896	-37.805135
8070	ARU	Ara??atuba Airport	South America	BR	Brazil	S??o Paulo	Ara??atuba	-21.141479	-50.424575
8071	ARS	Aragar??as Airport	South America	BR	Brazil	Goi??s	Aragar??as	-15.8994	-52.2411
8072	AUX	Aragua??na Airport	South America	BR	Brazil	Tocatins	Aragua??na	-7.22787	-48.240501
8073	APQ	Arapiraca Airport	South America	BR	Brazil	Alagoas	Arapiraca	-9.775360107	-36.62919998
8074	APX	Arapongas Airport	South America	BR	Brazil	Paran??	Arapongas	-23.3529	-51.491699
8075	AAG	Avelino Vieira Airport	South America	BR	Brazil	Paran??	Arapoti	-24.103901	-49.789101
8076	AQA	Araraquara Airport	South America	BR	Brazil	S??o Paulo	Araraquara	-21.812	-48.132999
8077	AAX	Romeu Zema Airport	South America	BR	Brazil	Minas Gerais	Arax??	-19.5632	-46.9604
8078	AIR	Aripuan?? Airport	South America	BR	Brazil	Mato Grosso	Aripuan??	-10.188278	-59.457273
8079	AQM	Ariquemes Airport	South America	BR	Brazil	Rond??nia	Ariquemes	-9.880436	-63.047115
8080	AAI	Arraias Airport	South America	BR	Brazil	Tocatins	Arraias	-13.025154	-46.884107
8081	AIF	Marcelo Pires Halzhausen Airport	South America	BR	Brazil	S??o Paulo	Assis	-22.64	-50.453056
8082	BGX	Comandante Gustavo Kraemer Airport	South America	BR	Brazil	Rio Grande do Sul	Bag??	-31.390499	-54.112202
8083	BSS	Balsas Airport	South America	BR	Brazil	Maranh??o	Balsas	-7.526030064	-46.05329895
8084	BAZ	Barcelos Airport	South America	BR	Brazil	Amazonas	Barcelos	-0.981292	-62.919601
8085	BQQ	Barra Airport	South America	BR	Brazil	Bahia	Barra	-11.08080006	-43.14749908
8086	BDC	Barra do Corda Airport	South America	BR	Brazil	Maranh??o	Barra Do Corda	-5.5025	-45.215833
8087	BPG	Barra do Gar??as Airport	South America	BR	Brazil	Mato Grosso	Barra do Gar??as	-15.861417	-52.389008
8088	BRA	Barreiras Airport	South America	BR	Brazil	Bahia	Barreiras	-12.07890034	-45.00899887
8089	BRB	Barreirinhas National Airport	South America	BR	Brazil	Maranh??o	Barreirinhas	-2.756628	-42.805666
8090	BAT	Chafei Amsei Airport	South America	BR	Brazil	S??o Paulo	Barretos	-20.58449936	-48.59410095
8091	BAU	Bauru Airport	South America	BR	Brazil	S??o Paulo	Bauru	-22.344999	-49.053799
8092	JTC	Bauru/Arealva???Moussa Nakhal Tobias State Airport	South America	BR	Brazil	S??o Paulo	Bauru	-22.160755	-49.070325
8093	BEL	Val de Cans/J??lio Cezar Ribeiro International Airport	South America	BR	Brazil	Par??	Bel??m	-1.379279	-48.476207
8094	BVM	Belmonte Airport	South America	BR	Brazil	Bahia	Belmonte	-15.8717	-38.871899
8095	PLU	Pampulha - Carlos Drummond de Andrade Airport	South America	BR	Brazil	Minas Gerais	Belo Horizonte	-19.8512	-43.9506
8096	CNF	Tancredo Neves International Airport	South America	BR	Brazil	Minas Gerais	Belo Horizonte	-19.63571	-43.966928
8097	BGV	Aeroclube de Bento Gon??alves Airport	South America	BR	Brazil	Rio Grande do Sul	Bento Gon??alves	-29.147424	-51.540791
8098	BNU	Blumenau Airport	South America	BR	Brazil	Santa Catarina	Blumenau	-26.83060074	-49.09030151
8099	BVB	Atlas Brasil Cantanhede Airport	South America	BR	Brazil	Roraima	Boa Vista	2.845855	-60.690944
8100	BCR	Novo Campo Airport	South America	BR	Brazil	Amazonas	Boca do Acre	-8.83456	-67.312401
8101	LAZ	Bom Jesus da Lapa Airport	South America	BR	Brazil	Bahia	Bom Jesus da Lapa	-13.2621	-43.4081
8103	RBB	Borba Airport	South America	BR	Brazil	Amazonas	Borba	-4.40634	-59.602402
8104	QCJ	Botucatu - Tancredo de Almeida Neves Airport	South America	BR	Brazil	S??o Paulo	Botucatu	-22.939501	-48.467999
8105	BJP	Estadual Arthur Siqueira Airport	South America	BR	Brazil	S??o Paulo	Bragan??a Paulista	-22.978822	-46.537131
8106	BSB	Presidente Juscelino Kubitschek International Airport	South America	BR	Brazil	Distrito Federal	Bras??lia	-15.869167	-47.920834
8107	BVS	Breves Airport	South America	BR	Brazil	Par??	Breves	-1.636530042	-50.4435997
8108	BMS	S??crates Mariani Bittencourt Airport	South America	BR	Brazil	Bahia	Brumado	-14.2554	-41.817501
8109	CFB	Cabo Frio Airport	South America	BR	Brazil	Rio de Janeiro	Cabo Frio	-22.921485	-42.071874
8110	BZC	Umberto Modiano Airport	South America	BR	Brazil	Rio de Janeiro	Cabo Frio	-22.770881	-41.96308
8111	CFC	Ca??ador Airport	South America	BR	Brazil	Santa Catarina	Ca??ador	-26.787423	-50.939942
8112	CCX	C??ceres Airport	South America	BR	Brazil	Mato Grosso	C??ceres	-16.04360008	-57.62990189
8113	QDB	Cachoeira do Sul Airport	South America	BR	Brazil	Rio Grande do Sul	Cachoeira Do Sul	-30.00189972	-52.94079971
8114	CDI	Cachoeiro do Itapemirim - Raimundo de Andrade Airport	South America	BR	Brazil	Esp??rito Santo	Cachoeiro do Itapemirim	-20.834299	-41.1856
8115	OAL	Cacoal Airport	South America	BR	Brazil	Rond??nia	Cacoal	-11.496	-61.4508
8116	MXQ	Morro de S??o Paulo Airport	South America	BR	Brazil	Bahia	Cairu	-13.428781	-38.913689
8117	CLV	Nelson Ribeiro Guimar??es Airport	South America	BR	Brazil	Goi??s	Caldas Novas	-17.725096	-48.606324
8118	CMT	New Camet?? Airport	South America	BR	Brazil	Par??	Camet??	-2.2468	-49.56
8119	CMC	Camocim - Pinto Martins Airport	South America	BR	Brazil	Cear??	Camocim	-2.895596	-40.859299
8120	CPV	Presidente Jo??o Suassuna Airport	South America	BR	Brazil	Para??ba	Campina Grande	-7.269662	-35.896057
8121	VCP	Viracopos International Airport	South America	BR	Brazil	S??o Paulo	Campinas	-23.007404	-47.134502
8122	CGR	Campo Grande Airport	South America	BR	Brazil	Mato Grosso do Sul	Campo Grande	-20.469998	-54.673988
8123	CBW	Campo Mour??o Airport	South America	BR	Brazil	Paran??	Campo Mour??o	-24.00919914	-52.35680008
8124	CAW	Bartolomeu Lisandro Airport	South America	BR	Brazil	Rio de Janeiro	Campos Dos Goytacazes	-21.698299	-41.301701
8125	CQA	Canarana Airport	South America	BR	Brazil	Mato Grosso	Canarana	-13.57444382	-52.2705574
8126	CNV	S??crates Rezende Airport	South America	BR	Brazil	Bahia	Canavieiras	-15.66699982	-38.95470047
8127	QCN	Canela Airport	South America	BR	Brazil	Rio Grande do Sul	Canela	-29.3701992	-50.83200073
8128	CAF	Carauari Airport	South America	BR	Brazil	Amazonas	Carauari	-4.871520042	-66.89749908
8129	CRQ	Caravelas Airport	South America	BR	Brazil	Bahia	Caravelas	-17.6523	-39.253101
8130	CLN	Brig. Lysias Augusto Rodrigues Airport	South America	BR	Brazil	Maranh??o	Carolina	-7.32044	-47.458698
8131	CAU	Caruaru Airport	South America	BR	Brazil	Pernambuco	Caruaru	-8.28239	-36.0135
8132	CTP	Carutapera Airport	South America	BR	Brazil	Maranh??o	Carutapera	-1.225365	-46.019057
8133	CAC	Coronel Adalberto Mendes da Silva Airport	South America	BR	Brazil	Paran??	Cascavel	-25.000323	-53.501208
8134	CSS	Cassil??ndia Airport	South America	BR	Brazil	Mato Grosso do Sul	Cassil??ndia	-19.146861	-51.676941
8135	QAC	Castro Airport	South America	BR	Brazil	Paran??	Castro	-24.80750084	-49.96030045
8136	TLZ	Catal??o Airport	South America	BR	Brazil	Goi??s	Catal??o	-18.21680069	-47.89970016
8137	CXJ	Hugo Cantergiani Regional Airport	South America	BR	Brazil	Rio Grande do Sul	Caxias Do Sul	-29.197183	-51.187647
8138	XAP	Serafin Enoss Bertaso Airport	South America	BR	Brazil	Santa Catarina	Chapec??	-27.134199	-52.656601
8139	CIZ	Coari Airport	South America	BR	Brazil	Amazonas	Coari	-4.134059906	-63.13259888
8140	RPU	Urucu Airport	South America	BR	Brazil	Amazonas	Coari	-4.88422	-65.3554
8141	QCH	Colatina Airport	South America	BR	Brazil	Esp??rito Santo	Colatina	-19.48699951	-40.57939911
8142	CDJ	Concei????o do Araguaia Airport	South America	BR	Brazil	Par??	Concei????o do Araguaia	-8.34835	-49.301498
8143	CCI	Conc??rdia Airport	South America	BR	Brazil	Santa Catarina	Conc??rdia	-27.18059921	-52.05270004
8144	CFO	Confresa Airport	South America	BR	Brazil	Mato Grosso	Confresa	-10.633296	-51.565836
8145	CKO	Corn??lio Proc??pio Airport	South America	BR	Brazil	Paran??	Corn??lio Proc??pio	-23.15250015	-50.60250092
8146	EEA	Planalto Serrano Regional Airport	South America	BR	Brazil	Santa Catarina	Correia Pinto	-27.634128	-50.358253
8147	CMG	Corumb?? International Airport	South America	BR	Brazil	Mato Grosso do Sul	Corumb??	-19.01193	-57.672772
8148	CQS	Costa Marques Airport	South America	BR	Brazil	Rond??nia	Costa Marques	-12.42109966	-64.25160217
8149	OTT	Andre Maggi Airport	South America	BR	Brazil	Mato Grosso	Cotrigua??u	-9.898611	-58.581944
8150	JCS	Crate??s Airport	South America	BR	Brazil	Cear??	Crate??s	-5.21135	-40.704201
8151	CCM	Diom??cio Freitas Airport	South America	BR	Brazil	Santa Catarina	Crici??ma	-28.725743	-49.424475
8152	IDO	Santa Izabel do Morro Airport	South America	BR	Brazil	Tocatins	Cristal??ndia	-11.57229996	-50.66619873
8153	JJD	Jericoacoara - Comandante Ariston Pessoa Regional Airport	South America	BR	Brazil	Cear??	Cruz	-2.906425	-40.357338
8154	CZB	Carlos Ruhl Airport	South America	BR	Brazil	Rio Grande do Sul	Cruz Alta	-28.657934	-53.610095
8155	CZS	Cruzeiro do Sul Airport	South America	BR	Brazil	Acre	Cruzeiro Do Sul	-7.59991	-72.769501
8156	CGB	Marechal Rondon Airport	South America	BR	Brazil	Mato Grosso	Cuiab??	-15.6529	-56.116699
8157	CWB	Afonso Pena Airport	South America	BR	Brazil	Paran??	Curitiba	-25.5285	-49.1758
8158	BFH	Bacacheri Airport	South America	BR	Brazil	Paran??	Curitiba	-25.4051	-49.231998
8159	QCR	Curitibanos Airport	South America	BR	Brazil	Santa Catarina	Curitibanos	-27.28249931	-50.6114006
8160	QCP	Currais Novos Airport	South America	BR	Brazil	Rio Grande do Norte	Currais Novos	-6.280832767	-36.54027939
8161	CPU	Cururupu Airport	South America	BR	Brazil	Maranh??o	Cururupu	-1.820006	-44.864065
8162	DTI	Diamantina Airport	South America	BR	Brazil	Minas Gerais	Diamantina	-18.23200035	-43.65039825
8163	DMT	Diamantino Airport	South America	BR	Brazil	Mato Grosso	Diamantino	-14.37689972	-56.40039825
8164	DNO	Dian??polis Airport	South America	BR	Brazil	Tocatins	Dian??polis	-11.59539986	-46.84669876
8165	DIQ	Brigadeiro Cabral Airport	South America	BR	Brazil	Minas Gerais	Divin??polis	-20.1807003	-44.8708992
8166	DOU	Dourados Airport	South America	BR	Brazil	Mato Grosso do Sul	Dourados	-22.2019	-54.926601
8167	QDC	Dracena Airport	South America	BR	Brazil	S??o Paulo	Dracena	-21.46050072	-51.60689926
8168	ERN	Eirunep?? Airport	South America	BR	Brazil	Amazonas	Eirunep??	-6.639530182	-69.87979889
8169	ERM	Erechim Airport	South America	BR	Brazil	Rio Grande do Sul	Erechim	-27.66189957	-52.2682991
8170	ESI	Espinosa Airport	South America	BR	Brazil	Minas Gerais	Espinosa	-14.93369444	-42.81
8171	FEJ	Novo Aer??dromo de Feij??	South America	BR	Brazil	Acre	Feij??	-8.141213	-70.340821
8172	FEC	Jo??o Durval Carneiro Airport	South America	BR	Brazil	Bahia	Feira De Santana	-12.2003	-38.906799
8173	FEN	Fernando de Noronha Airport	South America	BR	Brazil	Pernambuco	Fernando de Noronha	-3.854471	-32.423302
8174	FLB	Cangapara Airport	South America	BR	Brazil	Piau??	Floriano	-6.846389771	-43.07730103
8175	FLN	Herc??lio Luz International Airport	South America	BR	Brazil	Santa Catarina	Florian??polis	-27.670279	-48.552502
8176	FBA	Fonte Boa Airport	South America	BR	Brazil	Amazonas	Fonte Boa	-2.53260994	-66.08319855
8177	FOR	Pinto Martins International Airport	South America	BR	Brazil	Cear??	Fortaleza	-3.77628	-38.5326
8178	IGU	Cataratas International Airport	South America	BR	Brazil	Paran??	Foz do Igua??u	-25.594167	-54.489444
8179	FRC	Tenente Lund Pressoto Airport	South America	BR	Brazil	S??o Paulo	Franca	-20.592199	-47.3829
8180	FBE	Francisco Beltr??o Airport	South America	BR	Brazil	Paran??	Francisco Beltr??o	-26.05920029	-53.06349945
8181	QGP	Garanhuns Airport	South America	BR	Brazil	Pernambuco	Garanhuns	-8.834280014	-36.47159958
8182	GYN	Santa Genoveva Airport	South America	BR	Brazil	Goi??s	Goi??nia	-16.632	-49.220699
8183	GVR	Coronel Altino Machado de Oliveira Airport	South America	BR	Brazil	Minas Gerais	Governador Valadares	-18.895882	-41.982869
8184	GCV	Gravatai Airport	South America	BR	Brazil	Rio Grande do Sul	Gravatai	-29.9494	-50.98505
8185	GDP	Guadalupe Airport	South America	BR	Brazil	Piau??	Guadalupe	-6.782219887	-43.5821991
8186	QGA	Gua??ra Airport	South America	BR	Brazil	Paran??	Gua??ra	-24.08110046	-54.19169998
8187	GJM	Guajar??-Mirim Airport	South America	BR	Brazil	Rond??nia	Guajar??-Mirim	-10.78641	-65.28486
8188	GNM	Guanambi Airport	South America	BR	Brazil	Bahia	Guanambi	-14.20820045	-42.74610138
8189	GUZ	Guarapari Airport	South America	BR	Brazil	Esp??rito Santo	Guarapari	-20.6465	-40.491901
8190	GPB	Tancredo Thomas de Faria Airport	South America	BR	Brazil	Paran??	Guarapuava	-25.388327	-51.52349
8191	GUJ	Guaratinguet?? Airport	South America	BR	Brazil	S??o Paulo	Guaratinguet??	-22.791599	-45.2048
8192	SSZ	Santos Nero Moura Air Base / Guaruj?? Airport	South America	BR	Brazil	S??o Paulo	Guaruj??	-23.928192	-46.300195
8193	GMS	Ant??nio Guerreiro Airport	South America	BR	Brazil	Maranh??o	Guimar??es	-2.109444	-44.651114
8194	GRP	Gurupi Airport	South America	BR	Brazil	Tocatins	Gurupi	-11.73960018	-49.13219833
8195	HRZ	Walter B??ndchen Airport	South America	BR	Brazil	Rio Grande do Sul	Horizontina	-27.63829994	-54.33909988
8196	HUW	Humait?? Airport	South America	BR	Brazil	Amazonas	Humait??	-7.532120228	-63.07210159
8197	QIG	Iguatu Airport	South America	BR	Brazil	Cear??	Iguatu	-6.34664011	-39.29380035
8198	IJU	Jo??o Batista Bos Filho Airport	South America	BR	Brazil	Rio Grande do Sul	Iju??	-28.368711	-53.846568
8199	IOS	Bahia - Jorge Amado Airport	South America	BR	Brazil	Bahia	Ilh??us	-14.815929	-39.033458
8200	IMP	Prefeito Renato Moreira Airport	South America	BR	Brazil	Maranh??o	Imperatriz	-5.53129	-47.459999
8201	IPN	Vale do A??o Regional Airport	South America	BR	Brazil	Minas Gerais	Ipatinga	-19.470699	-42.487598
8202	IPU	Ipia?? Airport	South America	BR	Brazil	Bahia	Ipia??	-14.1338892	-39.73389053
8203	IRE	Irec?? Airport	South America	BR	Brazil	Bahia	Irec??	-11.33990002	-41.84700012
8204	ITN	Tertuliano Guedes de Pinho Airport	South America	BR	Brazil	Bahia	Itabuna	-14.8105	-39.290401
8205	ITA	Itacoatiara Airport	South America	BR	Brazil	Amazonas	Itacoatiara	-3.126539	-58.481668
8206	ITB	Itaituba Airport	South America	BR	Brazil	Par??	Itaituba	-4.242131	-56.000651
8207	JTN	Itanha??m Airport	South America	BR	Brazil	S??o Paulo	Itanha??m	-24.159729	-46.790604
8208	ITP	Itaperuna Airport	South America	BR	Brazil	Rio de Janeiro	Itaperuna	-21.21929932	-41.87590027
8209	QIT	Itapetinga Airport	South America	BR	Brazil	Bahia	Itapetinga	-15.24450016	-40.27719879
8210	ITQ	Itaqui Airport	South America	BR	Brazil	Rio Grande do Sul	Itaqui	-29.17309952	-56.5367012
8211	ITE	Ituber?? Airport	South America	BR	Brazil	Bahia	Ituber??	-13.731571	-39.140377
8212	ITR	Francisco Vilela do Amaral Airport	South America	BR	Brazil	Goi??s	Itumbiara	-18.4447	-49.213402
8213	JCR	Jacareacanga Airport	South America	BR	Brazil	Par??	Jacareacanga	-6.23316	-57.776901
8214	JCM	Jacobina Airport	South America	BR	Brazil	Bahia	Jacobina	-11.16320038	-40.55310059
8215	JJG	Humberto Ghizzo Bortoluzzi Regional Airport	South America	BR	Brazil	Santa Catarina	Jaguaruna	-28.6753	-49.0596
8216	JLS	Jales Airport	South America	BR	Brazil	S??o Paulo	Jales	-20.29299927	-50.54639816
8217	JNA	Janu??ria Airport	South America	BR	Brazil	Minas Gerais	Janu??ria	-15.47379971	-44.38550186
8218	JTI	Jata?? Airport	South America	BR	Brazil	Goi??s	Jata??	-17.82990074	-51.77299881
8219	JEQ	Jequi?? Airport	South America	BR	Brazil	Bahia	Jequi??	-13.87769985	-40.07160187
8220	JPR	Ji-Paran?? Airport	South America	BR	Brazil	Rond??nia	Ji-Paran??	-10.870743	-61.846675
8221	JCB	Santa Terezinha Airport	South America	BR	Brazil	Santa Catarina	Joa??aba	-27.17140007	-51.55329895
8222	JPA	Presidente Castro Pinto International Airport	South America	BR	Brazil	Para??ba	Jo??o Pessoa	-7.148691	-34.950554
8223	JOI	Lauro Carneiro de Loyola Airport	South America	BR	Brazil	Santa Catarina	Joinville	-26.224501	-48.797401
8224	JUA	In??cio Lu??s do Nascimento Airport	South America	BR	Brazil	Mato Grosso	Juara	-11.2966	-57.5495
8225	JDO	Orlando Bezerra de Menezes Airport	South America	BR	Brazil	Cear??	Juazeiro do Norte	-7.21932	-39.269096
8226	JIA	Ju??na Airport	South America	BR	Brazil	Mato Grosso	Ju??na	-11.419444	-58.701668
8227	JDF	Francisco de Assis Airport	South America	BR	Brazil	Minas Gerais	Juiz de Fora	-21.791482	-43.386072
8228	IZA	Presidente Itamar Franco Airport	South America	BR	Brazil	Minas Gerais	Juiz de Fora	-21.513056	-43.173058
8229	QDV	Comte. Rolim Adolfo Amaro???Jundia?? State Airport	South America	BR	Brazil	S??o Paulo	Jundia??	-23.180861	-46.943921
8230	JRN	Juruena Airport	South America	BR	Brazil	Mato Grosso	Juruena	-10.30583286	-58.48944473
8231	LBR	L??brea Airport	South America	BR	Brazil	Amazonas	L??brea	-7.278969765	-64.76950073
8232	LAJ	Lages Airport	South America	BR	Brazil	Santa Catarina	Lages	-27.782101	-50.281502
8233	LEC	Coronel Hor??cio de Mattos Airport	South America	BR	Brazil	Bahia	Len????is	-12.4823	-41.277
8234	QGC	Len????is Paulista Airport	South America	BR	Brazil	S??o Paulo	Len????is Paulista	-22.57839966	-48.77460098
8235	LEP	Leopoldina Airport	South America	BR	Brazil	Minas Gerais	Leopoldina	-21.466101	-42.727001
8236	QGB	Limeira Airport	South America	BR	Brazil	S??o Paulo	Limeira	-22.603889	-47.411944
8237	LIP	Lins Airport	South America	BR	Brazil	S??o Paulo	Lins	-21.66399956	-49.73049927
8238	LDB	Governador Jos?? Richa Airport	South America	BR	Brazil	Paran??	Londrina	-23.333599	-51.1301
8239	LOI	Helmuth Baungarten Airport	South America	BR	Brazil	Santa Catarina	Lontras	-27.15999985	-49.54249954
8240	LVR	Municipal Bom Futuro Airport	South America	BR	Brazil	Mato Grosso	Lucas do Rio Verde	-13.037861	-55.95025
8241	MEA	Maca?? Benedito Lacerda Airport	South America	BR	Brazil	Rio de Janeiro	Maca??	-22.343	-41.765999
8242	MCP	Macap?? - Alberto Alcolumbre International Airport	South America	BR	Brazil	Amap??	Macap??	0.050664	-51.072201
8243	MCZ	Zumbi dos Palmares Airport	South America	BR	Brazil	Alagoas	Macei??	-9.51081	-35.791698
8244	MAO	Eduardo Gomes International Airport	South America	BR	Brazil	Amazonas	Manaus	-3.03861	-60.049702
8245	PLL	Ponta Pelada Airport	South America	BR	Brazil	Amazonas	Manaus	-3.14604	-59.986301
8246	MNX	Manicor?? Airport	South America	BR	Brazil	Amazonas	Manicor??	-5.81138	-61.278301
8247	MAB	Jo??o Correa da Rocha Airport	South America	BR	Brazil	Par??	Marab??	-5.36859	-49.138
8248	MII	Frank Miloye Milenkowichi???Mar??lia State Airport	South America	BR	Brazil	S??o Paulo	Mar??lia	-22.196899	-49.926485
8249	MGF	Regional de Maring?? - S??lvio Name J??nior Airport	South America	BR	Brazil	Paran??	Maring??	-23.47606	-52.016187
8250	MBK	Regional Orlando Villas Boas Airport	South America	BR	Brazil	Mato Grosso	Matup??	-10.1702776	-54.95277786
8251	MBZ	Mau??s Airport	South America	BR	Brazil	Amazonas	Mau??s	-3.37217	-57.7248
8252	MQH	Mina??u Airport	South America	BR	Brazil	Goi??s	Mina??u	-13.5491	-48.195301
8253	QOA	Mococa Airport	South America	BR	Brazil	S??o Paulo	Mococa	-21.4878006	-47.03440094
8254	MTE	Monte Alegre Airport	South America	BR	Brazil	Par??	Monte Alegre	-1.9958	-54.0742
8255	QGF	Montenegro Airport	South America	BR	Brazil	Rio Grande do Sul	Montenegro	-29.71940041	-51.48939896
8256	MOC	M??rio Ribeiro Airport	South America	BR	Brazil	Minas Gerais	Montes Claros	-16.706919	-43.818901
8257	MVF	Dix-Sept Rosado Airport	South America	BR	Brazil	Rio Grande do Norte	Mossor??	-5.20192	-37.3643
8258	MVS	Mucuri Airport	South America	BR	Brazil	Bahia	Mucuri	-18.0489006	-39.86420059
8259	NNU	Nanuque Airport	South America	BR	Brazil	Minas Gerais	Nanuque	-17.82329941	-40.32989883
8260	NAT	S??o Gon??alo do Amarante - Governador Alu??zio Alves International Airport	South America	BR	Brazil	Rio Grande do Norte	Natal	-5.769804	-35.366578
8261	NVT	Ministro Victor Konder International Airport	South America	BR	Brazil	Santa Catarina	Navegantes	-26.879431	-48.650979
8262	NQL	Niquel??ndia Airport	South America	BR	Brazil	Goi??s	Niquel??ndia	-14.43490028	-48.49150085
8263	NVM	Brigadeiro Eduardo Gomes Airport	South America	BR	Brazil	Mato Grosso	Nova Mutum	-13.821021	-56.038591
8264	NOK	Xavantina Airport	South America	BR	Brazil	Mato Grosso	Nova Xavantina	-14.69830036	-52.34640121
8265	NVP	Novo Aripuan?? Airport	South America	BR	Brazil	Amazonas	Novo Aripuan??	-5.118030071	-60.36489868
8266	QHV	Novo Hamburgo Airport	South America	BR	Brazil	Rio Grande do Sul	Novo Hamburgo	-29.69610023	-51.08169937
8267	NPR	Novo Progresso Airport	South America	BR	Brazil	Par??	Novo Progresso	-7.125833	-55.400833
8268	OBI	??bidos Municipal Airport	South America	BR	Brazil	Par??	??bidos	-1.867981	-55.514596
8269	OYK	Oiapoque Airport	South America	BR	Brazil	Amap??	Oiapoque	3.85412	-51.797056
8270	ORX	Oriximin?? Airport	South America	BR	Brazil	Par??	Oriximin??	-1.714079976	-55.83620071
8271	TMT	Trombetas Airport	South America	BR	Brazil	Par??	Oriximin??	-1.489599943	-56.39680099
8272	OIA	Ouril??ndia do Norte Airport	South America	BR	Brazil	Par??	Ouril??ndia do Norte	-6.763100147	-51.04990005
8273	OUS	Ourinhos Airport	South America	BR	Brazil	S??o Paulo	Ourinhos	-22.96649933	-49.91329956
8274	PMW	Brigadeiro Lysias Rodrigues Airport	South America	BR	Brazil	Tocatins	Palmas	-10.2915	-48.356998
8275	JPE	Nagib Demachki Airport	South America	BR	Brazil	Par??	Paragominas	-3.019798	-47.316474
8276	PNG	Paranagu?? Airport	South America	BR	Brazil	Paran??	Paranagu??	-25.5401001	-48.53120041
8277	PBB	Parana??ba Airport	South America	BR	Brazil	Mato Grosso do Sul	Parana??ba	-19.65119934	-51.19940186
8278	PVI	Paranava?? Airport	South America	BR	Brazil	Paran??	Paranava??	-23.08989906	-52.48849869
8279	JPY	Paraty Airport	South America	BR	Brazil	Rio de Janeiro	Paraty	-23.224044	-44.7234
8280	CKS	Caraj??s Airport	South America	BR	Brazil	Par??	Parauapebas	-6.117841	-50.003372
8281	PIN	Parintins Airport	South America	BR	Brazil	Amazonas	Parintins	-2.673019886	-56.77719879
8282	PHB	Parna??ba - Prefeito Doutor Jo??o Silva Filho International Airport	South America	BR	Brazil	Piau??	Parna??ba	-2.89375	-41.731998
8283	PFB	Lauro Kurtz Airport	South America	BR	Brazil	Rio Grande do Sul	Passo Fundo	-28.243976	-52.32777
8284	PSW	Municipal Jos?? Figueiredo Airport	South America	BR	Brazil	Minas Gerais	Passos	-20.73220062	-46.66180038
8285	PTO	Juvenal Loureiro Cardoso Airport	South America	BR	Brazil	Paran??	Pato Branco	-26.217184	-52.694463
8286	JPO	Aeroporto Brigadeiro Firmino Ayres	South America	BR	Brazil	Para??ba	Patos	-7.03899	-37.251598
8287	POJ	Patos de Minas Airport	South America	BR	Brazil	Minas Gerais	Patos De Minas	-18.67280006	-46.49119949
8288	PAV	Paulo Afonso Airport	South America	BR	Brazil	Bahia	Paulo Afonso	-9.40087986	-38.25059891
8289	PET	Jo??o Sim??es Lopes Neto International Airport	South America	BR	Brazil	Rio Grande do Sul	Pelotas	-31.717253	-52.327952
8290	PNZ	Senador Nilo Coelho Airport	South America	BR	Brazil	Pernambuco	Petrolina	-9.362422	-40.569098
8291	PCS	Picos Airport	South America	BR	Brazil	Piau??	Picos	-7.062059879	-41.52370071
8292	PBQ	Pimenta Bueno Airport	South America	BR	Brazil	Rond??nia	Pimenta Bueno	-11.6416	-61.1791
8293	PHI	Pinheiro Airport	South America	BR	Brazil	Maranh??o	Pinheiro	-2.477426	-45.105003
8294	QHB	Piracicaba Airport	South America	BR	Brazil	S??o Paulo	Piracicaba	-22.71150017	-47.61819839
8295	PIV	Pirapora Airport	South America	BR	Brazil	Minas Gerais	Pirapora	-17.31690025	-44.86029816
8296	QPS	Campo Fontenelle	South America	BR	Brazil	S??o Paulo	Pirassununga	-21.984692	-47.341207
8297	POO	Po??os de Caldas - Embaixador Walther Moreira Salles Airport	South America	BR	Brazil	Minas Gerais	Po??os De Caldas	-21.842529	-46.569768
8298	PGZ	Ponta Grossa Airport - Comandante Antonio Amilton Beraldo	South America	BR	Brazil	Paran??	Ponta Grossa	-25.184476	-50.143822
8299	PMG	Ponta Por?? Airport	South America	BR	Brazil	Mato Grosso do Sul	Ponta Por??	-22.549601	-55.702599
8300	LCB	Pontes e Lacerda Airport	South America	BR	Brazil	Mato Grosso	Pontes e Lacerda	-15.1934	-59.3848
8301	POA	Salgado Filho International Airport	South America	BR	Brazil	Rio Grande do Sul	Porto Alegre	-29.994712	-51.166592
8302	PBX	Fazenda Piraguassu Airport	South America	BR	Brazil	Mato Grosso	Porto Alegre Do Norte	-10.86111069	-51.68500137
8303	PTQ	Porto de Moz Airport	South America	BR	Brazil	Par??	Porto De Moz	-1.741449952	-52.23609924
8304	PNB	Porto Nacional Airport	South America	BR	Brazil	Tocatins	Porto Nacional	-10.719402	-48.3997
8305	BPS	Porto Seguro Airport	South America	BR	Brazil	Bahia	Porto Seguro	-16.438426	-39.080584
8306	PVH	Governador Jorge Teixeira de Oliveira Airport	South America	BR	Brazil	Rond??nia	Porto Velho	-8.707854	-63.90242
8307	PPY	Pouso Alegre Airport	South America	BR	Brazil	Minas Gerais	Pouso Alegre	-22.2892	-45.919102
8308	PDF	Prado Airport	South America	BR	Brazil	Bahia	Prado	-17.296976	-39.271131
8309	PDR	Presidente Jos?? Sarney Airport	South America	BR	Brazil	Maranh??o	Presidente Dutra	-5.3098	-44.481
8310	PPB	Presidente Prudente Airport	South America	BR	Brazil	S??o Paulo	Presidente Prudente	-22.1751	-51.424599
8311	REC	Recife/Guararapes - Gilberto Freyre International Airport	South America	BR	Brazil	Pernambuco	Recife	-8.125984	-34.923316
8312	RDC	Reden????o Airport	South America	BR	Brazil	Par??	Reden????o	-8.033289909	-49.97990036
8313	REZ	Resende Airport	South America	BR	Brazil	Rio de Janeiro	Resende	-22.4785	-44.480301
8314	RAO	Leite Lopes Airport	South America	BR	Brazil	S??o Paulo	Ribeir??o Preto	-21.134314	-47.774053
8315	RBR	Rio Branco-Pl??cido de Castro International Airport	South America	BR	Brazil	Acre	Rio Branco	-9.869031	-67.893984
8316	RRJ	Jacarepagu?? - Roberto Marinho Airport	South America	BR	Brazil	Rio de Janeiro	Rio De Janeiro	-22.986773	-43.372194
8317	GIG	Rio Gale??o ??? Tom Jobim International Airport	South America	BR	Brazil	Rio de Janeiro	Rio De Janeiro	-22.809999	-43.250557
8318	SNZ	Santa Cruz Air Force Base	South America	BR	Brazil	Rio de Janeiro	Rio de Janeiro	-22.9324	-43.719101
8319	SDU	Santos Dumont Airport	South America	BR	Brazil	Rio de Janeiro	Rio de Janeiro	-22.9105	-43.163101
8320	RIG	Rio Grande Regional Airport	South America	BR	Brazil	Rio Grande do Sul	Rio Grande	-32.083065	-52.167184
8321	RVD	General Leite de Castro Airport	South America	BR	Brazil	Goi??s	Rio Verde	-17.83472252	-50.95611191
8322	ROO	Maestro Marinho Franco Airport	South America	BR	Brazil	Mato Grosso	Rondon??polis	-16.586	-54.7248
8323	SSA	Deputado Luiz Eduardo Magalh??es International Airport	South America	BR	Brazil	Bahia	Salvador	-12.9086113	-38.32249832
8324	CSU	Santa Cruz do Sul Airport	South America	BR	Brazil	Rio Grande do Sul	Santa Cruz Do Sul	-29.6840992	-52.41220093
8325	IRZ	Tapuruquara Airport	South America	BR	Brazil	Amazonas	Santa Isabel Do Rio Negro	-0.3786	-64.9923
8326	RIA	Santa Maria Airport	South America	BR	Brazil	Rio Grande do Sul	Santa Maria	-29.711399	-53.688202
8327	SRA	Santa Rosa Airport	South America	BR	Brazil	Rio Grande do Sul	Santa Rosa	-27.9067	-54.520401
8328	STZ	Santa Terezinha Airport	South America	BR	Brazil	Mato Grosso	Santa Terezinha	-10.46472168	-50.51861191
8329	CTQ	Santa Vit??ria do Palmar Airport	South America	BR	Brazil	Rio Grande do Sul	Santa Vit??ria Do Palmar	-33.50222397	-53.3441658
8330	CMP	Santana do Araguaia Airport	South America	BR	Brazil	Par??	Santana Do Araguaia	-9.319970131	-50.32849884
8331	STM	Santar??m - Maestro Wilson Fonseca International Airport	South America	BR	Brazil	Par??	Santar??m	-2.422423	-54.79306
8332	GEL	Santo ??ngelo Airport	South America	BR	Brazil	Rio Grande do Sul	Santo ??ngelo	-28.282503	-54.169623
8333	IPG	Ipiranga Airport	South America	BR	Brazil	Amazonas	Santo Ant??nio Do I????	-2.939069986	-69.69400024
8334	JSB	Walfrido Salmito de Almeida Airport	South America	BR	Brazil	Cear??	S??o Benedito	-4.0428	-40.8938
8335	JBS	S??o Borja Airport	South America	BR	Brazil	Rio Grande do Sul	S??o Borja	-28.6549	-56.034599
8336	QSC	M??rio Pereira Lopes???S??o Carlos Airport	South America	BR	Brazil	S??o Paulo	S??o Carlos	-21.875401	-47.903703
8337	SXO	S??o F??lix do Araguaia Airport	South America	BR	Brazil	Mato Grosso	S??o F??lix Do Araguaia	-11.63239956	-50.6896019
8338	SXX	S??o F??lix do Xingu Airport	South America	BR	Brazil	Par??	S??o F??lix do Xingu	-6.6413	-51.9523
8339	SJL	S??o Gabriel da Cachoeira Airport	South America	BR	Brazil	Amazonas	S??o Gabriel Da Cachoeira	-0.14835	-66.9855
8340	JDR	Prefeito Oct??vio de Almeida Neves Airport	South America	BR	Brazil	Minas Gerais	S??o Jo??o Del Rei	-21.08499908	-44.22472382
8341	SJP	Prof. Eribelto Manoel Reino State Airport	South America	BR	Brazil	S??o Paulo	S??o Jos?? Do Rio Preto	-20.8166008	-49.40650177
8342	SJK	Professor Urbano Ernesto Stumpf Airport	South America	BR	Brazil	S??o Paulo	S??o Jos?? Dos Campos	-23.2292	-45.8615
8343	SSO	S??o Louren??o Airport	South America	BR	Brazil	Minas Gerais	S??o Louren??o	-22.09090042	-45.04449844
8344	SQY	S??o Louren??o do Sul Airport	South America	BR	Brazil	Rio Grande do Sul	S??o Louren??o Do Sul	-31.38330078	-52.03279877
8345	SLZ	Marechal Cunha Machado International Airport	South America	BR	Brazil	Maranh??o	S??o Lu??s	-2.58536	-44.2341
8346	SBJ	S??o Mateus - Ernesto Bonomo Airport	South America	BR	Brazil	Esp??rito Santo	S??o Mateus	-18.7213	-39.833698
8347	SQM	S??o Miguel do Araguaia Airport	South America	BR	Brazil	Goi??s	S??o Miguel Do Araguaia	-13.33129978	-50.19760132
8348	SQX	S??o Miguel do Oeste Airport	South America	BR	Brazil	Santa Catarina	S??o Miguel Do Oeste	-26.78160095	-53.50350189
8349	RTE	Campo de Marte Airport	South America	BR	Brazil	S??o Paulo	S??o Paulo	-23.5091	-46.637798
8350	CGH	Congonhas Airport	South America	BR	Brazil	S??o Paulo	S??o Paulo	-23.627657	-46.654601
8351	GRU	Guarulhos - Governador Andr?? Franco Montoro International Airport	South America	BR	Brazil	S??o Paulo	S??o Paulo	-23.431944	-46.467778
8352	OLC	Senadora Eunice Micheles Airport	South America	BR	Brazil	Amazonas	S??o Paulo De Oliven??a	-3.467929508	-68.92041206
8353	JHF	S??o Paulo Catarina Executive Airport	South America	BR	Brazil	S??o Paulo	S??o Roque	-23.426886	-47.165658
8354	AZL	Fazenda Tucunar?? Airport	South America	BR	Brazil	Mato Grosso	Sapezal	-13.465528	-58.866935
8355	ZMD	Sena Madureira Airport	South America	BR	Brazil	Acre	Sena Madureira	-9.116	-68.6108
8356	OPS	Presidente Jo??o Batista Figueiredo Airport	South America	BR	Brazil	Mato Grosso	Sinop	-11.885001	-55.586109
8357	SOD	Sorocaba Airport	South America	BR	Brazil	S??o Paulo	Sorocaba	-23.478001	-47.490002
8358	SMT	Adolino Bedin Regional Airport	South America	BR	Brazil	Mato Grosso	Sorriso	-12.479177	-55.672341
8359	SFK	Soure Airport	South America	BR	Brazil	Par??	Soure	-0.697844	-48.519759
8360	TBT	Tabatinga Airport	South America	BR	Brazil	Amazonas	Tabatinga	-4.255670071	-69.93579865
8361	QHN	Taguatinga Airport	South America	BR	Brazil	Tocatins	Taguatinga	-12.43388939	-46.40055466
8362	TGQ	Tangar?? da Serra Airport	South America	BR	Brazil	Mato Grosso	Tangar?? Da Serra	-14.662	-57.443501
8363	TRQ	Tarauac?? Airport	South America	BR	Brazil	Acre	Tarauac??	-8.155534	-70.782985
8364	JTA	Pedro Teixeira Castelo Airport	South America	BR	Brazil	Cear??	Tau??	-5.9334	-40.2975
8365	TFF	Tef?? Airport	South America	BR	Brazil	Amazonas	Tef??	-3.382940054	-64.72409821
8366	TXF	9 de Maio - Teixeira de Freitas Airport	South America	BR	Brazil	Bahia	Teixeira De Freitas	-17.52449989	-39.66849899
8367	TEC	Tel??maco Borba Airport	South America	BR	Brazil	Paran??	Tel??maco Borba	-24.317801	-50.6516
8368	TFL	Juscelino Kubitscheck Airport	South America	BR	Brazil	Minas Gerais	Te??filo Otoni	-17.89229965	-41.5135994
8369	THE	Senador Petr??nio Portela Airport	South America	BR	Brazil	Piau??	Teresina	-5.059939861	-42.82350159
8370	TOW	Toledo - Luiz Dalcanale Filho Municipal Airport	South America	BR	Brazil	Paran??	Toledo	-24.6863	-53.697498
8371	TSQ	Torres Airport	South America	BR	Brazil	Rio Grande do Sul	Torres	-29.4149	-49.810001
8372	QID	M??lio Viana Airport	South America	BR	Brazil	Minas Gerais	Tr??s Cora????es	-21.79059982	-45.26919937
8373	TJL	Pl??nio Alarcom Airport	South America	BR	Brazil	Mato Grosso do Sul	Tr??s Lagoas	-20.75419998	-51.68420029
8374	TUR	Tucuru?? Airport	South America	BR	Brazil	Par??	Tucuru??	-3.786010027	-49.72029877
8375	UBT	Ubatuba Gast??o Madeira State Airport	South America	BR	Brazil	S??o Paulo	Ubatuba	-23.440628	-45.074057
8376	UBA	M??rio de Almeida Franco Airport	South America	BR	Brazil	Minas Gerais	Uberaba	-19.76472282	-47.96611023
8377	UDI	Ten. Cel. Aviador C??sar Bombonato Airport	South America	BR	Brazil	Minas Gerais	Uberl??ndia	-18.883612	-48.225277
8378	UMU	Umuarama Airport	South America	BR	Brazil	Paran??	Umuarama	-23.79870033	-53.31380081
8379	UNA	Hotel Transam??rica Airport	South America	BR	Brazil	Bahia	Una	-15.35519981	-38.99900055
8380	URG	Rubem Berta Airport	South America	BR	Brazil	Rio Grande do Sul	Uruguaiana	-29.78219986	-57.03820038
8381	VAL	Valen??a Airport	South America	BR	Brazil	Bahia	Valen??a	-13.2965	-38.992401
8382	VAG	Major Brigadeiro Trompowsky Airport	South America	BR	Brazil	Minas Gerais	Varginha	-21.59009933	-45.47330093
8383	VIA	Videira Airport	South America	BR	Brazil	Santa Catarina	Videira	-26.99970055	-51.14189911
8384	MTG	Vila Bela da Sant??ssima Trindade Airport	South America	BR	Brazil	Mato Grosso	Vila Bela Da Sant??ssima Trindade	-14.9942	-59.9458
8385	VLP	Vila Rica Airport	South America	BR	Brazil	Mato Grosso	Vila Rica	-9.97944355	-51.14222336
8386	BVH	Brigadeiro Camar??o Airport	South America	BR	Brazil	Rond??nia	Vilhena	-12.69439983	-60.09830093
8387	VIX	Eurico de Aguiar Salles Airport	South America	BR	Brazil	Esp??rito Santo	Vit??ria	-20.258057	-40.286388
8388	VDC	Glauber de Andrade Rocha Airport	South America	BR	Brazil	Bahia	Vit??ria da Conquista	-14.907885	-40.914804
8389	VOT	Votuporanga Airport	South America	BR	Brazil	S??o Paulo	Votuporanga	-20.46319962	-50.00450134
8390	AXE	Xanxer?? Airport	South America	BR	Brazil	Santa Catarina	Xanxer??	-26.87555695	-52.3730545
8391	XIG	Xinguara Municipal Airport	South America	BR	Brazil	Par??	Xinguara	-7.0906	-49.9765
8392	WAP	Alto Palena Airport	South America	CL	Chile	Los Lagos Region	Alto Palena	-43.61190033	-71.80609894
8393	ZUD	Pupelde Airport	South America	CL	Chile	Los Lagos Region	Ancud	-41.904251	-73.796571
8394	ANF	Andr??s Sabella G??lvez International Airport	South America	CL	Chile	Antofagasta Region	Antofagasta	-23.444501	-70.445099
8395	ARI	Chacalluta Airport	South America	CL	Chile	Arica and Parinacota Region	Arica	-18.348499	-70.338699
8396	DPB	Pampa Guanaco Airport	South America	CL	Chile	Magallanes Region	Bahia Inutil	-54.049977	-68.809193
8397	BBA	Balmaceda Airport	South America	CL	Chile	Ays??n Region	Balmaceda	-45.91609955	-71.6894989
8398	CJC	El Loa Airport	South America	CL	Chile	Antofagasta Region	Calama	-22.49819946	-68.9036026
8399	WCA	Gamboa Airport	South America	CL	Chile	Los Lagos Region	Castro	-42.49029922	-73.77279663
8400	SMB	Franco Bianco Airport	South America	CL	Chile	Magallanes Region	Cerro Sombrero	-52.73669815	-69.33360291
8401	WCH	Chait??n Airport	South America	CL	Chile	Los Lagos Region	Chaiten	-42.93280029	-72.69909668
8402	CNR	Cha??aral Airport	South America	CL	Chile	Atacama Region	Cha??aral	-26.33250046	-70.6072998
8403	CCH	Chile Chico Airport	South America	CL	Chile	Ays??n Region	Chile Chico	-46.5831	-71.686323
8404	YAI	Gral. Bernardo O??Higgins Airport	South America	CL	Chile	B??o-B??o Region	Chillan	-36.58250046	-72.03140259
8405	LGR	Cochrane Airport	South America	CL	Chile	Ays??n Region	Cochrane	-47.243591	-72.58815
8406	CCP	Carriel Sur Airport	South America	CL	Chile	B??o-B??o Region	Concepcion	-36.772701	-73.063103
8407	CPO	Desierto de Atacama Airport	South America	CL	Chile	Atacama Region	Copiapo	-27.26119995	-70.77919769
8408	COW	Tambillos Airport	South America	CL	Chile	Coquimbo Region	Coquimbo	-30.198889	-71.246944
8409	GXQ	Teniente Vidal Airport	South America	CL	Chile	Ays??n Region	Coyhaique	-45.5942	-72.106102
8410	MHC	Mocopulli Airport	South America	CL	Chile	Los Lagos Region	Dalcahue	-42.340388	-73.715693
8411	ESR	Ricardo Garc??a Posada Airport	South America	CL	Chile	Atacama Region	El Salvador	-26.31110001	-69.76519775
8412	FRT	El Avellano Airport	South America	CL	Chile	Los Lagos Region	Frutillar	-41.11700058	-73.05000305
8413	FFU	Futaleuf?? Airport	South America	CL	Chile	Los Lagos Region	Futaleufu	-43.18920135	-71.85109711
8414	IQQ	Diego Aracena Airport	South America	CL	Chile	Tarapac?? Region	Iquique	-20.53520012	-70.1812973
8415	IPC	Mataveri Airport	South America	CL	Chile	Valpara??so Region	Isla De Pascua	-27.16480064	-109.4219971
8416	LSC	La Florida Airport	South America	CL	Chile	Coquimbo Region	La Serena-Coquimbo	-29.916201	-71.199501
8417	ZLR	Municipal de Linares Airport	South America	CL	Chile	Maule Region	Linares	-35.86169815	-71.54859924
8418	LOB	San Rafael Airport	South America	CL	Chile	Valpara??so Region	Los Andes	-32.81420135	-70.646698
8419	LSQ	Mar??a Dolores Airport	South America	CL	Chile	B??o-B??o Region	Los Angeles	-37.40169907	-72.42539978
8420	ZOS	Ca??al Bajo Carlos - Hott Siebert Airport	South America	CL	Chile	Los Lagos Region	Osorno	-40.611198	-73.060997
8421	OVL	El Tuqui Airport	South America	CL	Chile	Coquimbo Region	Ovalle	-30.55920029	-71.17559814
8422	CPP	Coposa Airport	South America	CL	Chile	Tarapac?? Region	Pica	-20.7505	-68.683502
8423	WPR	Captain Fuentes Martinez Airport	South America	CL	Chile	Magallanes Region	Porvenir	-53.2537	-70.319199
8424	ZPC	Puc??n Airport	South America	CL	Chile	Araucan??a Region	Pucon	-39.2928009	-71.91590118
8425	WPA	Cabo 1?? Juan Rom??n Airport	South America	CL	Chile	Ays??n Region	Puerto Aysen	-45.39920044	-72.67030334
8426	PMC	El Tepual Airport	South America	CL	Chile	Los Lagos Region	Puerto Montt	-41.43889999	-73.09400177
8427	PNT	Lieutenant Julio Gallardo Airport	South America	CL	Chile	Magallanes Region	Puerto Natales	-51.67067	-72.529078
8428	PUX	El Mirador Airport	South America	CL	Chile	Los Lagos Region	Puerto Varas	-41.34939957	-72.94670105
8429	WPU	Guardiamarina Za??artu Airport	South America	CL	Chile	Magallanes Region	Puerto Williams	-54.931099	-67.626297
8430	PUQ	President Carlos Iba??ez del Campo International Airport	South America	CL	Chile	Magallanes Region	Punta Arenas	-53.002602	-70.854599
8431	SSD	V??ctor Laf??n Airport	South America	CL	Chile	Valpara??so Region	San Felipe	-32.7458	-70.705002
8432	SCL	Comodoro Arturo Merino Ben??tez International Airport	South America	CL	Chile	Santiago Metropolitan Region	Santiago	-33.39300156	-70.78579712
8433	TLX	Panguilemo Airport	South America	CL	Chile	Maule Region	Talca	-35.37779999	-71.60169983
8434	TTC	Las Breas Airport	South America	CL	Chile	Antofagasta Region	Taltal	-25.56430054	-70.37590027
8435	ZCO	La Araucan??a Airport	South America	CL	Chile	Araucan??a Region	Temuco	-38.9259	-72.6515
8436	PZS	Maquehue Airport	South America	CL	Chile	Araucan??a Region	Temuco	-38.76679993	-72.63710022
8437	TOQ	Barriles Airport	South America	CL	Chile	Antofagasta Region	Tocopilla	-22.14109993	-70.06289673
8438	ZAL	Pichoy Airport	South America	CL	Chile	Los R??os Region	Valdivia	-39.65000153	-73.08609772
8439	VLR	Vallenar Airport	South America	CL	Chile	Atacama Region	Vallenar	-28.59639931	-70.7559967
8440	ZIC	Victoria Airport	South America	CL	Chile	Araucan??a Region	Victoria	-38.24560165	-72.34860229
8441	VAP	Rodelillo Airport	South America	CL	Chile	Valpara??so Region	Vi??a Del Mar	-33.06809998	-71.55750275
8442	KNA	Vi??a del mar Airport	South America	CL	Chile	Valpara??so Region	Vi??a Del Mar	-32.9496	-71.4786
8443	ACD	Alcides Fern??ndez Airport	South America	CO	Colombia	Choc?? Department	Acand??	8.497847	-77.274106
8444	GGL	Gilgal Airport	South America	CO	Colombia	Choc?? Department	Acand??	8.190674	-77.078576
8445	ARF	Acaricuara Airport	South America	CO	Colombia	Vaup??s Department	Acaricuara	0.533333	-70.133333
8446	AFI	Amalfi Airport	South America	CO	Colombia	Antioqu??a Department	Amalfi	6.91667	-75.0667
8447	API	Gomez Nino Apiay Air Base	South America	CO	Colombia	Meta Department	Apiay	4.07607	-73.5627
8448	ACR	Araracuara Airport	South America	CO	Colombia	Caquet?? Department	Araracuara	-0.600854	-72.398011
8449	AUC	Santiago Perez Airport	South America	CO	Colombia	Arauca Department	Arauca	7.06888	-70.7369
8450	ARQ	El Troncal Airport	South America	CO	Colombia	Arauca Department	Arauquita	7.02106	-71.388901
8451	ARO	Arboletes Airport	South America	CO	Colombia	Antioqu??a Department	Arboletes	8.855118	-76.422676
8452	NAR	Puerto Nare Airport	South America	CO	Colombia	Antioqu??a Department	Armenia	6.21002	-74.5906
8453	AXM	El Eden Airport	South America	CO	Colombia	Quindio Department	Armenia	4.45278	-75.7664
8454	UNC	Unguia Airport	South America	CO	Colombia	Choc?? Department	Arquia	8.033333	-77.083333
8455	AYC	Ayacucho Airport	South America	CO	Colombia	C??sar Department	Ayacucho	8.6	-73.616667
8456	AYA	Ayapel Airport	South America	CO	Colombia	C??rdoba Department	Ayapel	8.3	-75.15
8457	BHF	Bahia Cupica Airport	South America	CO	Colombia	Choc?? Department	Bah??a Cupica	6.55	-77.3263
8458	BSC	Jos?? Celestino Mutis Airport	South America	CO	Colombia	Choc?? Department	Bah??a Solano	6.20292	-77.3947
8459	BAC	Barranca De Upia Airport	South America	CO	Colombia	Meta Department	Barranca De Upia	4.583333	-72.966667
8460	EJA	Yarigu??es Airport	South America	CO	Colombia	Santander Department	Barrancabermeja	7.02433	-73.8068
8461	NBB	Barranco Minas Airport	South America	CO	Colombia	Guain??a Department	Barranco Minas	3.490691	-69.808151
8462	BAQ	Ernesto Cortissoz International Airport	South America	CO	Colombia	Atl??ntico Department	Barranquilla	10.8896	-74.7808
8463	BOG	El Dorado International Airport	South America	CO	Colombia	Cundinamarca Department	Bogota	4.70159	-74.1469
8464	BGA	Palonegro Airport	South America	CO	Colombia	Santander Department	Bucaramanga	7.1265	-73.1848
8465	BUN	Gerardo Tobar L??pez Airport	South America	CO	Colombia	Valle del Cauca Department	Buenaventura	3.81963	-76.9898
8466	CLO	Alfonso Bonilla Aragon International Airport	South America	CO	Colombia	Valle del Cauca Department	Cali	3.54322	-76.3816
8467	HRR	Herrera Airport	South America	CO	Colombia	Tolima Department	Campi??a	3.216667	-75.85
8468	CPB	Capurgan?? Airport	South America	CO	Colombia	Choc?? Department	Capurgan??	8.632169	-77.350262
8469	CQT	Caquetania Airport	South America	CO	Colombia	Meta Department	Caquetania	2.033333	-74.216667
8470	APO	Antonio Roldan Betancourt Airport	South America	CO	Colombia	Antioqu??a Department	Carepa	7.81196	-76.7164
8471	CTG	Rafael Nu??ez International Airport	South America	CO	Colombia	Bol??var Department	Cartagena	10.4424	-75.513
8472	CRC	Santa Ana Airport	South America	CO	Colombia	Valle del Cauca Department	Cartago	4.75818	-75.9557
8473	CUO	Carur?? Airport	South America	CO	Colombia	Vaup??s Department	Carur??	1.0136	-71.2961
8474	CSR	Casuarito Airport	South America	CO	Colombia	Vichada Department	Casuarito	5.833333	-68.133333
8475	CAQ	Juan H White Airport	South America	CO	Colombia	Antioqu??a Department	Caucasia	7.96847	-75.1985
8476	CPL	Chaparral Airport	South America	CO	Colombia	Tolima Department	Chaparral	3.717	-75.467
8477	IGO	Chigorod?? Jaime Ortiz Betancourt Airport	South America	CO	Colombia	Antioqu??a Department	Chigorod??	7.67867	-76.683554
8478	CIM	Cimitarra Airport	South America	CO	Colombia	Santander Department	Cimitarra	6.367	-73.967
8479	COG	Mandinga Airport	South America	CO	Colombia	Choc?? Department	Condoto	5.08333	-76.7
8480	CZU	Las Brujas Airport	South America	CO	Colombia	Sucre Department	Corozal	9.33274	-75.2856
8481	LPE	La Primavera Airport	South America	CO	Colombia	Valle del Cauca Department	Costa Rica	3.733333	-76.216667
8482	CVE	Cove??as Airport	South America	CO	Colombia	Sucre Department	Cove??as	9.40092	-75.6913
8483	RAV	Cravo Norte Airport	South America	CO	Colombia	Arauca Department	Cravo Norte	6.31684	-70.2107
8484	CUC	Camilo Daza International Airport	South America	CO	Colombia	Norte de Santander Department	C??cuta	7.92757	-72.5115
8485	CUI	Currillo Airport	South America	CO	Colombia	Casanare Department	Currillo	4.666667	-72
8486	EBG	El Bagre Airport	South America	CO	Colombia	Antioqu??a Department	El Bagre	7.59647	-74.8089
8487	ELB	Las Flores Airport	South America	CO	Colombia	Magdalena Department	El Banco	9.04554	-73.9749
8488	ECR	El Charco Airport	South America	CO	Colombia	Nari??o Department	El Charco	2.449444444	-78.09416667
8489	ECO	El Encanto Airport	South America	CO	Colombia	Amazonas Department	El Encanto	-1.753333333	-73.20472222
8490	EYP	El Yopal Airport	South America	CO	Colombia	Casanare Department	El Yopal	5.31911	-72.384
8491	FLA	Gustavo Artunduaga Paredes Airport	South America	CO	Colombia	Caquet?? Department	Florencia	1.58919	-75.5644
8492	FDA	Fundaci??n Airport	South America	CO	Colombia	Magdalena Department	Fundaci??n	10.5333	-74.2
8493	GIR	Santiago Vila Airport	South America	CO	Colombia	Cundinamarca Department	Girardot	4.27624	-74.7967
8494	GCA	Guacamayas Airport	South America	CO	Colombia	Huila Department	Guacamayas	2.283333	-74.95
8495	GPI	Juan Casiano Airport	South America	CO	Colombia	Cauca Department	Guapi	2.57013	-77.8986
8496	DZI	Codazzi Airport	South America	CO	Colombia	C??sar Department	Hacienda Borrero	9.6	-73.45
8497	HTZ	Hato Corozal Airport	South America	CO	Colombia	Casanare Department	Hato Corozal	6.15	-71.75
8498	IBE	Perales Airport	South America	CO	Colombia	Tolima Department	Ibagu??	4.42161	-75.1333
8499	IPI	San Luis Airport	South America	CO	Colombia	Nari??o Department	Ipiales	0.861925	-77.6718
8500	ISD	Santa B??rbara Airport	South America	CO	Colombia	Nari??o Department	Iscuand??	2.445825	-77.981753
8501	JUO	Jurado Airport	South America	CO	Colombia	Antioqu??a Department	Jurado	6.516667	-76.6
8502	LCR	La Chorrera Airport	South America	CO	Colombia	Amazonas Department	La Chorrera	-0.733333	-73.01667
8503	PAL	German Olano Air Base	South America	CO	Colombia	Cundinamarca Department	La Dorada	5.48361	-74.6574
8504	LGT	La Gaviota Airport	South America	CO	Colombia	Vichada Department	La Gaviota	4.549722	-70.925
8505	LMC	El Refugio/La Macarena Airport	South America	CO	Colombia	Meta Department	La Macarena	2.1736	-73.7862
8506	MCJ	Jorge Isaac Airport	South America	CO	Colombia	La Guajira Department	La Mina-Maicao	11.2325	-72.4901
8507	LPD	La Pedrera Airport	South America	CO	Colombia	Amazonas Department	La Pedrera	-1.32861	-69.5797
8508	LET	Alfredo V??squez Cobo International Airport	South America	CO	Colombia	Amazonas Department	Leticia	-4.19355	-69.9432
8509	NAD	Macanal Airport	South America	CO	Colombia	Guain??a Department	Macanal	2.80898	-67.62189
8510	MGN	Baracoa Airport	South America	CO	Colombia	Bol??var Department	Magangu??	9.28474	-74.8461
8511	MZL	La Nubia Airport	South America	CO	Colombia	Caldas Department	Manizales	5.0296	-75.4647
8512	MQU	Mariquita Airport	South America	CO	Colombia	Tolima Department	Mariquita	5.21256	-74.8836
8513	EOH	Enrique Olaya Herrera Airport	South America	CO	Colombia	Antioqu??a Department	Medell??n	6.220549	-75.590582
8514	MDE	Jose Maria C??rdova International Airport	South America	CO	Colombia	Antioqu??a Department	Medell??n	6.16454	-75.4231
8515	MND	Medina Airport	South America	CO	Colombia	Cundinamarca Department	Medina	4.483687	-73.344739
8516	MFS	Miraflores Airport	South America	CO	Colombia	Guaviare Department	Miraflores	1.35	-71.9444
8517	MVP	Fabio Alberto Leon Bentley Airport	South America	CO	Colombia	Vaup??s Department	Mit??	1.25366	-70.2339
8518	MFB	Monfort Airport	South America	CO	Colombia	Vaup??s Department	Monfort	0.633333	-69.75
8519	MTB	Montelibano Airport	South America	CO	Colombia	C??rdoba Department	Montel??bano	7.97174	-75.4325
8520	MTR	Los Garzones Airport	South America	CO	Colombia	C??rdoba Department	Monter??a	8.82374	-75.8258
8521	MOY	Monterrey Airport	South America	CO	Colombia	Casanare Department	Monterrey	4.906926	-72.894809
8522	MHF	Morichal Airport	South America	CO	Colombia	Vaup??s Department	Morichal	1.75	-69.916667
8523	MQR	Mosquera Airport	South America	CO	Colombia	Nari??o Department	Mosquera	2.64955	-78.3361
8524	NCI	Necocli Airport	South America	CO	Colombia	Antioqu??a Department	Necocli	8.454429	-76.779326
8525	NVA	Benito Salas Airport	South America	CO	Colombia	Huila Department	Neiva	2.95015	-75.294
8526	NQU	Reyes Murillo Airport	South America	CO	Colombia	Choc?? Department	Nuqu??	5.6964	-77.2806
8527	OCV	Aguas Claras Airport	South America	CO	Colombia	Norte de Santander Department	Oca??a	8.31506	-73.3583
8528	ORC	Orocue Airport	South America	CO	Colombia	Casanare Department	Orocue	4.79222	-71.3564
8529	EUO	Paratebueno Airport	South America	CO	Colombia	Casanare Department	Paratebueno	4.383333	-73.2
8530	PSO	Antonio Narino Airport	South America	CO	Colombia	Nari??o Department	Pasto	1.39625	-77.2915
8531	PZA	Paz De Ariporo Airport	South America	CO	Colombia	Casanare Department	Paz De Ariporo	5.87615	-71.8866
8532	PEI	Mateca??a International Airport	South America	CO	Colombia	Risaralda Department	Pereira	4.81267	-75.7395
8533	SQB	Santa Ana Airport	South America	CO	Colombia	Tolima Department	Piedras	4.408333	-75.021667
8534	PTX	Pitalito Airport	South America	CO	Colombia	Huila Department	Pitalito	1.85777	-76.0857
8535	PLT	Plato Airport	South America	CO	Colombia	Magdalena Department	Plato	9.8	-74.7833
8536	PPN	Guillermo Le??n Valencia Airport	South America	CO	Colombia	Cauca Department	Popay??n	2.4544	-76.6093
8537	PRE	Pore Airport	South America	CO	Colombia	Casanare Department	Pore	5.733333	-71.983333
8538	PVA	El Embrujo Airport	South America	CO	Colombia	San Andr??s, Providencia y Santa Catalina Department	Providencia	13.357461	-81.357977
8539	PUU	Tres De Mayo Airport	South America	CO	Colombia	Putumayo Department	Puerto As??s	0.505228	-76.5008
8540	PBE	Puerto Berrio Airport	South America	CO	Colombia	Antioqu??a Department	Puerto Berrio	6.46034	-74.4105
8541	PYA	Vel??squez Airport	South America	CO	Colombia	Boyac?? Department	Puerto Boyac??	5.93904	-74.457
8542	PCR	German Olano Airport	South America	CO	Colombia	Vichada Department	Puerto Carre??o	6.18472	-67.4932
8543	PDA	Obando Cesar Gaviria Trujillo Airport	South America	CO	Colombia	Guain??a Department	Puerto In??rida	3.85353	-67.9062
8544	LQM	Caucaya Airport	South America	CO	Colombia	Putumayo Department	Puerto Legu??zamo	-0.182278	-74.7708
8545	CCO	Carimagua Airport	South America	CO	Colombia	Meta Department	Puerto L??pez	4.56417	-71.3364
8546	PCC	Puerto Rico Airport	South America	CO	Colombia	Caquet?? Department	Puerto Rico	1.916667	-75.166667
8547	UIB	El Cara??o Airport	South America	CO	Colombia	Choc?? Department	Quibd??	5.69076	-76.6412
8548	RCH	Almirante Padilla Airport	South America	CO	Colombia	La Guajira Department	Riohacha	11.5262	-72.926
8549	ELJ	El Recreo Airport	South America	CO	Colombia	Meta Department	Ruperto Polania	2	-74.133333
8550	SNT	Las Cruces Airport	South America	CO	Colombia	Santander Department	Sabana De Torres	7.38322	-73.505402
8551	ADZ	Gustavo Rojas Pinilla International Airport	South America	CO	Colombia	San Andr??s, Providencia y Santa Catalina Department	San Andr??s	12.5836	-81.7112
8552	SJE	Jorge E. Gonzalez Torres Airport	South America	CO	Colombia	Guaviare Department	San Jos?? Del Guaviare	2.57969	-72.6394
8553	SJR	San Juan De Uraba Airport	South America	CO	Colombia	Antioqu??a Department	San Juan De Uraba	8.766667	-76.533333
8554	SJH	San Juan Del C??sar Airport	South America	CO	Colombia	C??sar Department	San Juan Del C??sar	10.766667	-73.016667
8555	SQE	San Luis De Palenque Airport	South America	CO	Colombia	Casanare Department	San Luis De Palenque	5.400181	-71.7001
8556	SRS	San Marcos Airport	South America	CO	Colombia	Sucre Department	San Marcos	8.69	-75.156
8557	NPU	San Pedro Airport	South America	CO	Colombia	Antioqu??a Department	San Pedro de Urab??	8.289325	-76.375006
8558	SVI	Eduardo Falla Solano Airport	South America	CO	Colombia	Caquet?? Department	San Vicente Del Cagu??n	2.15217	-74.7663
8559	AYG	Yaguara Airport	South America	CO	Colombia	Caquet?? Department	San Vicente Del Cagu??n	1.54417	-73.9333
8560	SMR	Sim??n Bol??var International Airport	South America	CO	Colombia	Magdalena Department	Santa Marta	11.1196	-74.2306
8561	SSL	Santa Rosalia Airport	South America	CO	Colombia	Vichada Department	Santa Rosalia	5.1309	-70.8682
8562	SRO	Santana Ramos Airport	South America	CO	Colombia	Huila Department	Santana Ramos	2.216667	-75.25
8563	TLU	Golfo de Morrosquillo Airport	South America	CO	Colombia	Sucre Department	Santiago de Tol??	9.50945	-75.5854
8564	RVE	Los Colonizadores Airport	South America	CO	Colombia	Arauca Department	Saravena	6.951868	-71.857179
8565	SOX	Alberto Lleras Camargo Airport	South America	CO	Colombia	Boyac?? Department	Sogamoso	5.67732	-72.9703
8566	SQF	Solano Airport	South America	CO	Colombia	Caquet?? Department	Solano	0.702022	-75.2505
8567	SOH	Solita Airport	South America	CO	Colombia	Meta Department	Solita	3.016667	-71.75
8568	TME	Gustavo Vargas Airport	South America	CO	Colombia	Arauca Department	Tame	6.45108	-71.7603
8569	TCD	Tarapac?? Airport	South America	CO	Colombia	Amazonas Department	Tarapac??	-2.894722	-69.747222
8570	TAU	Tauramena Airport	South America	CO	Colombia	Casanare Department	Tauramena	5.01281	-72.7424
8571	TIB	Tib?? Airport	South America	CO	Colombia	Norte de Santander Department	Tib??	8.63152	-72.7304
8572	TQS	Tres Esquinas Air Base	South America	CO	Colombia	Caquet?? Department	Tres Esquinas	0.7459	-75.234
8573	TDA	Trinidad Airport	South America	CO	Colombia	Casanare Department	Trinidad	5.43278	-71.6625
8574	ULQ	Heriberto G??l Mart??nez Airport	South America	CO	Colombia	Valle del Cauca Department	Tulu??	4.08836	-76.2351
8575	TCO	La Florida Airport	South America	CO	Colombia	Nari??o Department	Tumaco	1.81442	-78.7492
8576	URI	Uribe Airport	South America	CO	Colombia	Meta Department	Uribe	3.216667	-74.4
8577	URR	Urrao Airport	South America	CO	Colombia	Antioqu??a Department	Urrao	6.32883	-76.1425
8578	VUP	Alfonso L??pez Pumarejo Airport	South America	CO	Colombia	C??sar Department	Valledupar	10.435	-73.2495
8579	VGZ	Villa Garz??n Airport	South America	CO	Colombia	Putumayo Department	Villa Garz??n	0.978767	-76.6056
8580	VVC	Vanguardia Airport	South America	CO	Colombia	Meta Department	Villavicencio	4.16787	-73.6138
8581	AYI	Yari Airport	South America	CO	Colombia	Caquet?? Department	Yari	-0.383333	-72.266667
8582	AZT	Zapatoca Airport	South America	CO	Colombia	Santander Department	Zapatoca	6.816667	-73.283333
8583	ATF	Chacho??n Airport	South America	EC	Ecuador	Tungurahua Province	Ambato	-1.21207	-78.5746
8584	BHA	Los Perales Airport	South America	EC	Ecuador	Manabi Province	Bah??a de Caraquez	-0.6081110239	-80.40270233
8585	OCC	Francisco De Orellana Airport	South America	EC	Ecuador	Orellana Province	Coca	-0.4628860056	-76.98680115
8586	CUE	Mariscal Lamar Airport	South America	EC	Ecuador	Azuay Province	Cuenca	-2.88947	-78.984398
8587	GYE	Jos?? Joaqu??n de Olmedo International Airport	South America	EC	Ecuador	Guayas Province	Guayaquil	-2.15742	-79.883598
8588	GPS	Seymour Galapagos Ecological Airport	South America	EC	Ecuador	Galapagos Province	Isla Baltra	-0.453758	-90.2659
8589	JIP	Jipijapa Airport	South America	EC	Ecuador	Manabi Province	Jipijapa	-1	-80.66666412
8590	LOH	Camilo Ponce Enriquez Airport	South America	EC	Ecuador	Loja Province	La Toma (Catamayo)	-3.99589	-79.371902
8591	LGQ	Nueva Loja Airport	South America	EC	Ecuador	Sucumbios Province	Lago Agrio	0.09305600077	-76.86750031
8592	LTX	Cotopaxi International Airport	South America	EC	Ecuador	Cotopaxi Province	Latacunga	-0.906833	-78.615799
8593	MRR	Jose Maria Velasco Ibarra Airport	South America	EC	Ecuador	Loja Province	Macar??	-4.378230095	-79.94100189
8594	XMS	Coronel E Carvajal Airport	South America	EC	Ecuador	Morona-Santiago Province	Macas	-2.299170017	-78.1207962
8595	MEC	Eloy Alfaro International Airport	South America	EC	Ecuador	Manabi Province	Manta	-0.9460780025	-80.67880249
8596	PVO	Reales Tamarindos Airport	South America	EC	Ecuador	Manabi Province	Portoviejo	-1.041650057	-80.47219849
8597	SCY	San Crist??bal Airport	South America	EC	Ecuador	Galapagos Province	Puerto Baquerizo Moreno	-0.910206	-89.617401
8598	PYO	Putumayo Airport	South America	EC	Ecuador	Sucumbios Province	Puerto Putumayo	0.115949	-75.85022
8599	IBB	General Villamil Airport	South America	EC	Ecuador	Galapagos Province	Puerto Villamil	-0.942628	-90.953003
8600	UIO	Mariscal Sucre International Airport	South America	EC	Ecuador	Pichincha Province	Quito	-0.1291666667	-78.3575
8601	SNC	General Ulpiano Paez Airport	South America	EC	Ecuador	Guayas Province	Salinas	-2.20499	-80.988899
8602	ETR	Santa Rosa - Artillery Colonel Victor Larrea International Airport	South America	EC	Ecuador	El Oro Province	Santa Rosa	-3.441986	-79.996957
8603	MZD	M??ndez Airport	South America	EC	Ecuador	Morona-Santiago Province	Santiago de M??ndez	-2.733330011	-78.3167038
8604	PTZ	Rio Amazonas Airport	South America	EC	Ecuador	Pastaza Province	Shell Mera	-1.505239964	-78.06269836
8605	SUQ	Sucua Airport	South America	EC	Ecuador	Morona-Santiago Province	Sucua	-2.48300004	-78.16699982
8606	ESM	General Rivadeneira Airport	South America	EC	Ecuador	Esmeraldas Province	Tachina	0.9785190225	-79.62660217
8607	TSC	Taisha Airport	South America	EC	Ecuador	Morona-Santiago Province	Taisha	-2.381669998	-77.50279999
8608	TPC	Tarapoa Airport	South America	EC	Ecuador	Sucumbios Province	Tarapoa	-0.1229560003	-76.33779907
8609	TNW	Jumandy Airport	South America	EC	Ecuador	Napo Province	Tena	-1.059722	-77.583333
8610	TPN	Tiputini Airport	South America	EC	Ecuador	Orellana Province	Tiputini	-0.7761110067	-75.52639771
8611	TUA	Teniente Coronel Luis a Mantilla Airport	South America	EC	Ecuador	Carchi Province	Tulc??n	0.8095059991	-77.70809937
8612	MPN	Mount Pleasant Airport	South America	FK	Falkland Islands	Mount Pleasant	Mount Pleasant	-51.82279968	-58.44720078
8613	PSY	Port Stanley Airport	South America	FK	Falkland Islands	Stanley	Stanley	-51.68569946	-57.77759933
8614	OYC	Camopi Airport	South America	GF	French Guiana	Cayenne	Camopi	3.172847	-52.336142
8615	GSI	Grand-Santi Airport	South America	GF	French Guiana	Saint-Laurent-du-Maroni	Grand-Santi	4.285833	-54.373056
8616	MPY	Maripasoula Airport	South America	GF	French Guiana	Saint-Laurent-du-Maroni	Maripasoula	3.655907	-54.039431
8617	CAY	Cayenne ??? F??lix Ebou?? Airport	South America	GF	French Guiana	Cayenne	Matoury	4.819964	-52.361326
8618	REI	R??gina Airport	South America	GF	French Guiana	Cayenne	R??gina	4.31339	-52.132745
8619	OYP	Saint-Georges-de-l'Oyapock Airport	South America	GF	French Guiana	Cayenne	Saint-Georges-de-l'Oyapock Airport	3.8976	-51.8041
8620	LDX	Saint-Laurent-du-Maroni Airport	South America	GF	French Guiana	Saint-Laurent-du-Maroni	Saint-Laurent-du-Maroni	5.48306	-54.034401
8621	XAU	Sa??l Airport	South America	GF	French Guiana	Saint-Laurent-du-Maroni	Sa??l	3.61361	-53.204201
8622	AHL	Aishalton Airport	South America	GY	Guyana	Upper Takutu-Upper Essequibo	Aishalton	2.473206	-59.321596
8623	NAI	Annai Airport	South America	GY	Guyana	Upper Takutu-Upper Essequibo	Annai	3.959439993	-59.12419891
8624	BMJ	Baramita Airport	South America	GY	Guyana	Barima-Waini	Baramita	7.370120049	-60.48799896
8625	GFO	Bartica A Airport	South America	GY	Guyana	Cuyuni-Mazaruni	Bartica	6.358864	-58.655207
8626	GEO	Cheddi Jagan International Airport	South America	GY	Guyana	Demerara-Mahaica	Georgetown	6.49855	-58.254101
8627	IMB	Imbaimadai Airport	South America	GY	Guyana	Cuyuni-Mazaruni	Imbaimadai	5.708109856	-60.2942009
8628	KAI	Kaieteur International Airport	South America	GY	Guyana	Potaro-Siparuni	Kaieteur Falls	5.172754765	-59.49148178
8629	KAR	Kamarang Airport	South America	GY	Guyana	Cuyuni-Mazaruni	Kamarang	5.865340233	-60.61420059
8630	KRM	Karanambo Airport	South America	GY	Guyana	Upper Takutu-Upper Essequibo	Karanambo	3.751940012	-59.30970001
8631	KRG	Karasabai Airport	South America	GY	Guyana	Upper Takutu-Upper Essequibo	Karasabai	4.033329964	-59.53329849
8632	KTO	Kato Airport	South America	GY	Guyana	Potaro-Siparuni	Kato	4.649159908	-59.8321991
8633	KKG	Konawaruk Airport	South America	GY	Guyana	Potaro-Siparuni	Konawaruk	5.2684	-58.995
8634	BCG	Bemichi Airport	South America	GY	Guyana	Barima-Waini	Kumaka	7.640212	-58.961786
8635	LTM	Lethem Airport	South America	GY	Guyana	Upper Takutu-Upper Essequibo	Lethem	3.37276	-59.789398
8636	LUB	Lumid Pau Airport	South America	GY	Guyana	Upper Takutu-Upper Essequibo	Lumid Pau	2.393929958	-59.44100189
8637	USI	Mabaruma Airport	South America	GY	Guyana	Barima-Waini	Mabaruma	8.20017	-59.777965
8638	MHA	Mahdia Airport	South America	GY	Guyana	Potaro-Siparuni	Mahdia	5.277490139	-59.15110016
8639	VEG	Maikwak Airport	South America	GY	Guyana	Potaro-Siparuni	Maikwak	4.898172	-59.817027
8640	MWJ	Matthews Ridge Airport	South America	GY	Guyana	Barima-Waini	Matthews Ridge	7.487736	-60.185237
8641	MYM	Monkey Mountain Airport	South America	GY	Guyana	Potaro-Siparuni	Monkey Mountain	4.483329773	-59.68330002
8642	QSX	New Amsterdam Airport	South America	GY	Guyana	East Berbice-Corentyne	New Amsterdam	6.244324	-57.474172
8643	OGL	Eugene F. Correira International Airport	South America	GY	Guyana	Demerara-Mahaica	Ogle	6.80628	-58.1059
8644	ORJ	Orinduik Airport	South America	GY	Guyana	Potaro-Siparuni	Orinduik	4.72527	-60.035
8645	PMT	Paramakatoi Airport	South America	GY	Guyana	Potaro-Siparuni	Paramakatoi	4.6975	-59.7125
8646	PRR	Paruima Airport	South America	GY	Guyana	Cuyuni-Mazaruni	Paruima	5.81724	-61.055489
8647	SDC	Sand Creek Airport	South America	GY	Guyana	Upper Takutu-Upper Essequibo	Sand Creek	2.9913	-59.51
8648	SKM	Skeldon Airport	South America	GY	Guyana	East Berbice-Corentyne	Skeldon	5.8599	-57.14894
8649	ASU	Silvio Pettirossi International Airport	South America	PY	Paraguay	Central Department	Asunci??n	-25.23999977	-57.52000046
8650	AYO	Juan De Ayolas Airport	South America	PY	Paraguay	Misiones Department	Ayolas	-27.370554	-56.854064
8651	BFA	Bah??a Negra Airport	South America	PY	Paraguay	Alto Paraguay Department	Bah??a Negra	-20.22459984	-58.17919922
8652	AGT	Guarani International Airport	South America	PY	Paraguay	Alto Paran?? Department	Ciudad del Este	-25.454516	-54.842682
8653	CIO	Teniente Col Carmelo Peralta Airport	South America	PY	Paraguay	Concepci??n Department	Concepci??n	-23.442363	-57.427253
8654	ENO	Teniente Amin Ayub Gonzalez Airport	South America	PY	Paraguay	Itap??a Department	Encarnaci??n	-27.227366	-55.837495
8655	FLM	Filadelfia Airport	South America	PY	Paraguay	Boquer??n Department	Filadelfia	-22.360477	-60.053604
8656	OLK	Fuerte Olimpo Airport	South America	PY	Paraguay	Alto Paraguay Department	Fuerte Olimpo	-21.0452	-57.8825
8657	ESG	Dr. Luis Maria Arga??a International Airport	South America	PY	Paraguay	Boquer??n Department	Mariscal Estigarribia	-22.04999924	-60.61999893
8658	PJC	Dr Augusto Roberto Fuster International Airport	South America	PY	Paraguay	Amambay Department	Pedro Juan Caballero	-22.63999939	-55.83000183
8659	PIL	Carlos Miguel Gimenez Airport	South America	PY	Paraguay	??eembuc?? Department	Pilar	-26.881224	-58.318026
8660	PCJ	Puerto La Victoria Airport	South America	PY	Paraguay	Concepci??n Department	Puerto La Victoria	-22.295041	-57.866333
8661	PBT	Puerto Leda Airport	South America	PY	Paraguay	Alto Paraguay Department	Puerto Leda	-20.90460014	-57.92710114
8662	VMI	Dr Juan Plate Airport	South America	PY	Paraguay	Concepci??n Department	Puerto Vallemi	-22.159109	-57.942581
8663	ANS	Andahuaylas Airport	South America	PE	Peru	Apur??mac Region	Andahuaylas	-13.70639992	-73.35040283
8664	AOP	Alferez FAP Alfredo Vladimir Sara Bauer Airport	South America	PE	Peru	Loreto Region	Andoas	-2.796129942	-76.46659851
8665	ATA	Comandante FAP German Arias Graziani Airport	South America	PE	Peru	Ancash Region	Anta	-9.347439766	-77.5983963
8666	AQP	Rodr??guez Ball??n International Airport	South America	PE	Peru	Arequipa Region	Arequipa	-16.34110069	-71.58309937
8667	AYX	Teniente General Gerardo P??rez Pinedo Airport	South America	PE	Peru	Ucayali Region	Atalaya	-10.7291	-73.766502
8668	AYP	Coronel FAP Alfredo Mendivil Duarte Airport	South America	PE	Peru	Ayacucho Region	Ayacucho	-13.15480042	-74.20439911
8669	BLP	Huallaga Airport	South America	PE	Peru	San Mart??n Region	Bellavista	-7.060560226	-76.5821991
8670	CJA	Mayor General FAP Armando Revoredo Iglesias Airport	South America	PE	Peru	Cajamarca Region	Cajamarca	-7.139180183	-78.48940277
8671	CHH	Chachapoyas Airport	South America	PE	Peru	Amazonas Region	Chachapoyas	-6.201809883	-77.85610199
8672	CIX	Capitan FAP Jose A Quinones Gonzales International Airport	South America	PE	Peru	Lambayeque Region	Chiclayo	-6.787479877	-79.82810211
8673	CHM	FAP Lieutenant Jaime Andres de Montreuil Morales Airport	South America	PE	Peru	Ancash Region	Chimbote	-9.14961	-78.523804
8674	TDP	Trompeteros Airport	South America	PE	Peru	Loreto Region	Corrientes	-3.806010008	-75.03929901
8675	CUZ	Alejandro Velasco Astete International Airport	South America	PE	Peru	Cuzco Region	Cusco	-13.53569984	-71.938797
8676	ALD	Alerta Airport	South America	PE	Peru	Madre de Dios Region	Fortaleza	-11.68299961	-69.33300018
8677	HUU	Alferez Fap David Figueroa Fernandini Airport	South America	PE	Peru	Hu??nuco Region	Hu??nuco	-9.878809929	-76.20480347
8678	IBP	Iberia Airport	South America	PE	Peru	Madre de Dios Region	Iberia	-11.41160011	-69.48870087
8679	ILQ	Ilo Airport	South America	PE	Peru	Moquegua Region	Ilo	-17.69499969	-71.34400177
8680	IQT	Coronel FAP Francisco Secada Vignetta International Airport	South America	PE	Peru	Loreto Region	Iquitos	-3.784739971	-73.30879974
8681	JAE	Shumba Airport	South America	PE	Peru	Cajamarca Region	Ja??n	-5.59248	-78.774002
8682	JAU	Francisco Carle Airport	South America	PE	Peru	Jun??n Region	Jauja	-11.78310013	-75.4733963
8683	JJI	Juanjui Airport	South America	PE	Peru	San Mart??n Region	Juanju??	-7.169099808	-76.72859955
8684	JUL	Inca Manco Capac International Airport	South America	PE	Peru	Puno Region	Juliaca	-15.46710014	-70.15820313
8685	VVN	Las Malvinas/Echarate Airport	South America	PE	Peru	Cuzco Region	Las Malvinas	-11.854861	-72.939332
8686	LIM	Jorge Ch??vez International Airport	South America	PE	Peru	Lima Region	Lima	-12.0219	-77.114305
8687	MZA	Mayor PNP Nancy Flores Paucar Airport	South America	PE	Peru	Jun??n Region	Mazamari	-11.3254	-74.535598
8688	MBP	Moyobamba Airport	South America	PE	Peru	San Mart??n Region	Moyobamba	-6.01888895	-76.98832703
8689	NZC	Maria Reiche Neuman Airport	South America	PE	Peru	Ica Region	Nazca	-14.854	-74.961502
8690	PIO	Capit??n FAP Ren??n El??as Olivera International Airport	South America	PE	Peru	Ica Region	Pisco	-13.7449	-76.220299
8691	PIU	Capit??n FAP Guillermo Concha Iberico International Airport	South America	PE	Peru	Piura Region	Piura	-5.205749989	-80.61640167
8692	SQU	Saposoa Airport	South America	PE	Peru	San Mart??n Region	Plaza Saposoa	-6.960030079	-76.7684021
8693	PCL	Cap FAP David Abenzur Rengifo International Airport	South America	PE	Peru	Ucayali Region	Pucallpa	-8.377940178	-74.57430267
8694	PEM	Padre Aldamiz International Airport	South America	PE	Peru	Madre de Dios Region	Puerto Maldonado	-12.61359978	-69.22859955
8695	UMI	Quincemil Air Base	South America	PE	Peru	Cuzco Region	Quince Mil	-13.231357	-70.75145
8696	RIJ	Juan Simons Vela Airport	South America	PE	Peru	San Mart??n Region	Rioja	-6.067860126	-77.16000366
8697	RIM	San Nicolas Airport	South America	PE	Peru	Amazonas Region	Rodriguez de Mendoza	-6.392310143	-77.50119781
8698	APE	San Juan Aposento Airport	South America	PE	Peru	Ica Region	San Juan Aposento	-15.35389996	-75.167099
8699	SJA	San Juan de Marcona Airport	South America	PE	Peru	Ica Region	San Juan de Marcona	-15.357508	-75.135005
8700	SMG	Santa Maria Airport	South America	PE	Peru	Lima Region	Santa Mar??a	-11.98333359	-77
8701	SYC	Shiringayoc Airport	South America	PE	Peru	Madre de Dios Region	Shiringayoc	-11.898	-69.0625
8702	TCQ	Coronel FAP Carlos Ciriani Santa Rosa International Airport	South America	PE	Peru	Tacna Region	Tacna	-18.05330086	-70.27580261
8703	TYL	Captain Victor Montes Arias International Airport	South America	PE	Peru	Piura Region	Talara	-4.57664	-81.254097
8704	TPP	Cadete FAP Guillermo Del Castillo Paredes Airport	South America	PE	Peru	San Mart??n Region	Tarapoto	-6.508739948	-76.37319946
8705	TGI	Tingo Maria Airport	South America	PE	Peru	Hu??nuco Region	Tingo Maria	-9.133000374	-75.94999695
8706	TRU	Capitan FAP Carlos Martinez De Pinillos International Airport	South America	PE	Peru	La Libertad Region	Trujillo	-8.081410408	-79.1088028
8707	TBP	Captain Pedro Canga Rodriguez International Airport	South America	PE	Peru	Tumbes Region	Tumbes	-3.552074	-80.381086
8708	UCZ	Uchiza Airport	South America	PE	Peru	Hu??nuco Region	Uchiza	-8.467000008	-76.34999847
8709	YMS	Moises Benzaquen Rengifo Airport	South America	PE	Peru	Loreto Region	Yurimaguas	-5.893770218	-76.11820221
8710	ABN	Albina Airport	South America	SR	Suriname	Marowijne	Albina	5.51272	-54.050098
8711	LDO	Ladouanie Airport	South America	SR	Suriname	Sipaliwini	Aurora	4.376108283	-55.40705681
8712	AAJ	Cayana Airstrip	South America	SR	Suriname	Sipaliwini	Awaradam	3.898681	-55.577907
8713	BTO	Botopasi Airport	South America	SR	Suriname	Sipaliwini	Botopasi	4.217511094	-55.44705391
8714	DOE	Djumu-Djomoe Airport	South America	SR	Suriname	Sipaliwini	Djumu-Djomoe	4.005712611	-55.48164368
8715	DRJ	Drietabbetje Airport	South America	SR	Suriname	Sipaliwini	Drietabbetje	4.111359	-54.672766
8716	KCB	Tepoe Airstrip	South America	SR	Suriname	Sipaliwini	Kasikasima	3.150000095	-55.71699905
8717	MOJ	Moengo Airstrip	South America	SR	Suriname	Marowijne	Moengo	5.6076	-54.4003
8718	ICK	Nieuw Nickerie - Major Henk Fernandes Airport	South America	SR	Suriname	Nickerie	Nieuw Nickerie	5.955435	-57.040617
8719	OEM	Vincent Fayks Airport	South America	SR	Suriname	Sipaliwini	Paloemeu	3.346051	-55.443707
8720	ORG	Zorg en Hoop Airport	South America	SR	Suriname	Paramaribo	Paramaribo	5.811131	-55.1913
8721	SMZ	Stoelmanseiland Airport	South America	SR	Suriname	Sipaliwini	Stoelmanseiland	4.349999905	-54.41666794
8722	TOT	Totness Airport	South America	SR	Suriname	Coronie	Totness	5.86583	-56.327499
8723	AGI	Wageningen Airstrip	South America	SR	Suriname	Nickerie	Wageningen	5.841252	-56.673247
8724	WSO	Washabo Airport	South America	SR	Suriname	Sipaliwini	Washabo	5.215277	-57.185302
8725	PBM	Johan Adolf Pengel International Airport	South America	SR	Suriname	Para	Zandery	5.45283	-55.187801
8726	ATI	Artigas International Airport	South America	UY	Uruguay	Artigas Department	Artigas	-30.40069962	-56.50790024
8727	BUV	Bella Union Airport	South America	UY	Uruguay	Artigas Department	Bella Union	-30.33333397	-57.08333206
8728	CYR	Laguna de Los Patos International Airport	South America	UY	Uruguay	Colonia Department	Colonia del Sacramento	-34.45640182	-57.77059937
8729	DZO	Santa Bernardina International Airport	South America	UY	Uruguay	Durazno Department	Durazno	-33.35889816	-56.49919891
8730	MLZ	Cerro Largo International Airport	South America	UY	Uruguay	Cerro Largo Department	Melo	-32.33789825	-54.21670151
8731	MVD	Carrasco International /General C L Berisso Airport	South America	UY	Uruguay	Canelones Department	Montevideo	-34.838402	-56.0308
8732	PDU	Tydeo Larre Borges Airport	South America	UY	Uruguay	Paysandu Department	Paysandu	-32.36330032	-58.06190109
8733	PDP	Capitan Corbeta CA Curbelo International Airport	South America	UY	Uruguay	Maldonado Department	Punta del Este	-34.85509872	-55.09429932
8734	RVY	Presidente General Don Oscar D. Gestido International Airport	South America	UY	Uruguay	Rivera Department	Rivera	-30.97459984	-55.4762001
8735	STY	Nueva Hesperides International Airport	South America	UY	Uruguay	Salto Department	Salto	-31.43849945	-57.98529816
8736	TAW	Tacuarembo Airport	South America	UY	Uruguay	Tacuarembo Department	Tacuarembo	-31.749001	-55.925801
8737	TYT	Treinta y Tres Airport	South America	UY	Uruguay	Treinta y Tres Department	Treinta y Tres	-33.195714	-54.347246
8738	VCH	Vichadero Airport	South America	UY	Uruguay	Rivera Department	Vichadero	-31.7670002	-54.61700058
8739	AGV	Oswaldo Guevara Mujica Airport	South America	VE	Venezuela	Portuguesa State	Acarigua	9.553375	-69.237869
8740	CBL	Aeropuerto "General Tomas de Heres". Ciudad Bolivar	South America	VE	Venezuela	Bol??var State	Aeropuerto "General Tomas de Heres". Ciudad Bolivar	8.122160912	-63.53695679
8741	AAO	Anaco Airport	South America	VE	Venezuela	Anzo??tegui State	Anaco	9.430225	-64.470726
8742	BLA	General Jos?? Antonio Anzoategui International Airport	South America	VE	Venezuela	Anzo??tegui State	Barcelona	10.111111	-64.692222
8743	BNS	Barinas Airport	South America	VE	Venezuela	Barinas State	Barinas	8.615	-70.21416667
8744	BRM	Barquisimeto International Airport	South America	VE	Venezuela	Lara State	Barquisimeto	10.04274654	-69.35861969
8745	EOR	El Dorado Airport	South America	VE	Venezuela	Bol??var State	Bolivar	6.71573	-61.638786
8746	CBS	Oro Negro Airport	South America	VE	Venezuela	Zulia State	Cabimas	10.33069992	-71.32250214
8747	CXA	Caicara del Orinoco Airport	South America	VE	Venezuela	Bol??var State	Caicara del Orinoco	7.625510216	-66.16280365
8748	CAJ	Canaima Airport	South America	VE	Venezuela	Bol??var State	Canaima	6.231988907	-62.85443115
8749	CCS	Sim??n Bol??var International Airport	South America	VE	Venezuela	La Guaira State	Caracas	10.601194	-66.991222
8750	VCR	Carora Airport	South America	VE	Venezuela	Lara State	Carora	10.17560291	-70.06521606
8751	CUP	General Francisco Berm??dez Airport	South America	VE	Venezuela	Sucre State	Car??pano	10.66001415	-63.2616806
8752	CUV	Casigua El Cubo Airport	South America	VE	Venezuela	Zulia State	Casigua El Cubo	8.75813961	-72.53630066
8753	SFX	Macagua Airport	South America	VE	Venezuela	Bol??var State	Ciudad Guayana	8.2788	-62.6652
8754	CZE	Jos?? Leonardo Chirinos Airport	South America	VE	Venezuela	Falc??n State	Coro	11.4149437	-69.68090057
8755	CUM	Cuman?? (Antonio Jos?? de Sucre) Airport	South America	VE	Venezuela	Sucre State	Cuman?? (Antonio Jos?? de Sucre)	10.45033264	-64.13047028
8756	SOM	San Tom?? Airport	South America	VE	Venezuela	Anzo??tegui State	El Tigre	8.945146561	-64.1510849
8757	VIG	Juan Pablo P??rez Alfonso Airport	South America	VE	Venezuela	M??rida State	El Vig??a	8.624139	-71.672668
8758	EOZ	Elorza Airport	South America	VE	Venezuela	Apure State	Elorza	7.083333015	-69.53333282
8759	PBL	General Bartolome Salom International Airport	South America	VE	Venezuela	Carabobo State	General Bartolome Salom International	10.48050022	-68.07299805
8760	LRV	Los Roques Airport	South America	VE	Venezuela	Federal Dependencies	Gran Roque Island	11.946177	-66.669836
8761	GUQ	Guanare Airport	South America	VE	Venezuela	Portuguesa State	Guanare	9.02694416	-69.75514984
8762	CLZ	Calabozo Airport	South America	VE	Venezuela	Gu??rico State	Guarico	8.924655914	-67.41709137
8763	GDO	Guasdalito Airport	South America	VE	Venezuela	Apure State	Guasdalito	7.233333111	-70.80000305
8764	LPJ	Armando Schwarck Airport	South America	VE	Venezuela	Bol??var State	Guayabal	6.578050137	-66.81690216
8765	GUI	Guiria Airport	South America	VE	Venezuela	Sucre State	Guiria	10.57407761	-62.31266785
8766	HGE	Higuerote Airport	South America	VE	Venezuela	Miranda State	Higuerote	10.462474	-66.092779
8767	ICA	Icabar?? Airport	South America	VE	Venezuela	Bol??var State	Icabar??	4.336319923	-61.73960114
8768	SFD	San Fernando De Apure Airport	South America	VE	Venezuela	Apure State	Inglaterra	7.883319855	-67.44400024
8769	ICC	Andr??s Miguel Salazar Marcano Airport	South America	VE	Venezuela	Nueva Esparta State	Isla de Coche	10.794432	-63.98159
8770	PMV	Del Caribe Santiago Mari??o International Airport	South America	VE	Venezuela	Nueva Esparta State	Isla Margarita	10.91260338	-63.96659851
8771	KTV	Kamarata Airport	South America	VE	Venezuela	Bol??var State	Kamarata	5.7171	-62.33727
8772	KAV	Kavanayen Airport	South America	VE	Venezuela	Bol??var State	Kavanayen	5.632999897	-61.78300095
8773	LFR	La Fria Airport	South America	VE	Venezuela	T??chira State	La Fria	8.239167213	-72.27102661
8774	LAG	La Guaira Airport	South America	VE	Venezuela	La Guaira State	La Guaira	10.53332996	-67.03333282
8775	LGY	Lagunillas Airport	South America	VE	Venezuela	Zulia State	Lagunillas	10.1239996	-71.23799896
8776	MAR	La Chinita International Airport	South America	VE	Venezuela	Zulia State	Maracaibo	10.55820847	-71.7278595
8777	MYC	Escuela Mariscal Sucre Airport	South America	VE	Venezuela	Aragua State	Maracay	10.24997807	-67.64942169
8778	MUN	Matur??n Airport	South America	VE	Venezuela	Monagas State	Matur??n	9.749023	-63.153348
8779	MRD	Alberto Carnevalli Airport	South America	VE	Venezuela	M??rida State	M??rida	8.582078	-71.161041
8780	PTM	Palmarito Airport	South America	VE	Venezuela	Apure State	Palmarito	7.566669941	-70.1832962
8781	LSP	Josefa Camejo International Airport	South America	VE	Venezuela	Falc??n State	Paraguan??	11.78077507	-70.15149689
8782	PPH	Perai-Tepuy Airport	South America	VE	Venezuela	Bol??var State	Parai-tepu??	4.570275	-61.520262
8783	SCI	Paramillo Airport	South America	VE	Venezuela	T??chira State	Paramillo	7.801320076	-72.20290375
8784	PDZ	Pedernales Airport	South America	VE	Venezuela	Delta Amacuro State	Pedernales	9.979240417	-62.22859955
8785	PYH	Cacique Aramare Airport	South America	VE	Venezuela	Amazonas State	Puerto Ayacucho	5.619989872	-67.60610199
8786	PZO	General Manuel Carlos Piar International Airport	South America	VE	Venezuela	Bol??var State	Puerto Ordaz-Ciudad Guayana	8.28853035	-62.76039886
8787	PPZ	Puerto Paez Airport	South America	VE	Venezuela	Apure State	Puerto Paez	6.220095	-67.447508
8788	SVZ	San Antonio Del Tachira Airport	South America	VE	Venezuela	T??chira State	San Antonio Del Tachira	7.840829849	-72.43969727
8789	SNF	Sub Teniente Nestor Arias Airport	South America	VE	Venezuela	Yaracuy State	San Felipe	10.2787	-68.755203
8790	SVV	San Salvador de Paul Airport	South America	VE	Venezuela	Bol??var State	San Salvador de Paul	7	-62
8791	SBB	Santa B??rbara de Barinas Airport	South America	VE	Venezuela	Barinas State	Santa B??rbara	7.803514004	-71.16571808
8792	STB	Santa B??rbara del Zulia Airport	South America	VE	Venezuela	Zulia State	Santa B??rbara del Zulia	8.974550247	-71.94325256
8793	SNV	Santa Elena de Uairen Airport	South America	VE	Venezuela	Bol??var State	Santa Elena de Uairen	4.554999828	-61.15000153
8794	STD	Mayor Buenaventura Vivas International Airport	South America	VE	Venezuela	T??chira State	Santo Domingo	7.56538	-72.035103
8795	TUV	Tucupita Airport	South America	VE	Venezuela	Delta Amacuro State	Tucupita	9.088994026	-62.09417343
8796	TMO	Tumeremo Airport	South America	VE	Venezuela	Bol??var State	Tumeremo	7.24938	-61.52893
8797	URM	Uriman Airport	South America	VE	Venezuela	Bol??var State	Uriman	5.333333015	-62.76666641
8798	VLN	Arturo Michelena International Airport	South America	VE	Venezuela	Carabobo State	Valencia	10.14973259	-67.92839813
8799	VLV	Dr. Antonio Nicol??s Brice??o Airport	South America	VE	Venezuela	Trujillo State	Valera	9.340477943	-70.58406067
8800	VDP	Valle de La Pascua Airport	South America	VE	Venezuela	Gu??rico State	Valle de La Pascua	9.222027779	-65.99358368
8801	WOK	Wonken Airport	South America	VE	Venezuela	Bol??var State	Wonken	5.25	-61.73333359
8802	ZRZ	Zaraza Airport	South America	VE	Venezuela	Gu??rico State	Zaraza	9.350306	-65.280655
\.


--
-- Data for Name: destinations; Type: TABLE DATA; Schema: public; Owner: jason
--

COPY public.destinations (id, itinerary_id, airport_id) FROM stdin;
1	1	5746
2	1	1476
3	1	2017
4	1	2846
5	1	2983
6	1	3593
7	1	3786
8	1	5948
9	2	4540
10	2	814
11	2	1670
12	2	2619
13	2	3138
14	2	3872
15	2	7309
16	2	7865
17	3	6957
18	3	963
19	3	2223
20	3	3183
21	3	3683
22	3	6376
23	3	7440
24	3	8430
25	4	5696
26	4	2703
27	4	3329
28	4	3405
29	4	3437
30	4	3771
31	4	8033
32	4	8415
33	5	1196
34	5	331
35	5	1574
36	5	1944
37	5	3255
38	5	4543
39	5	8319
40	5	8675
41	6	6199
42	6	1480
43	6	2595
44	6	3197
45	6	3624
46	6	4234
47	6	5942
48	6	8317
\.


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: jason
--

COPY public.experiences (id, destination_id, description) FROM stdin;
1	1	Have seafood at Providence.
2	1	Enjoy kaiseki at Hayato.
3	3	Enjoy fun and creative dishes at Gion Sasaki.
4	3	Partake in seasonal cuisine at Maeda.
5	2	Indulge in the roast Peking duck at Lung King Heen.
6	2	Eat Cantonese specialties at T'ang Court.
7	4	Taste gastronomic masterpieces at noma.
8	4	Sample organic dishes at Geranium.
9	6	Enjoy Basque cuisine at Arzak.
10	6	Indulge in the tasting menu at Martin Berasategui.
11	5	Take in a sumptuous experience at Guy Savoy.
12	5	Sample produce of the terroir at Arp??ge.
13	7	Enjoy the signature dishes at Alain Ducasse.
14	7	Eat at Restaurant Gordon Ramsay without being yelled at.
15	8	Savor the tasting menus at Per Se.
16	8	Indulge in modern food and drink at Eleven Madison Park.
17	9	Relax on the beach.
18	10	Relax on the beach.
19	11	Relax on the beach.
20	12	Relax on the beach.
21	13	Relax on the beach.
22	14	Relax on the beach.
23	15	Relax on the beach.
24	16	Relax on the beach.
25	17	Hike the Great Ocean Road.
26	24	Hike the W Circuit in Torres Del Paine.
27	20	Hike Landmannalaugar.
28	21	Hike the Tour de Mont Blanc.
29	18	Hike Kilimanjaro Machame.
30	19	Hike the Annapurna Circuit.
31	23	Hike the Milford Track.
32	22	Hike the Narrows in Zion NP.
33	25	Look for aliens???? at Area 51.
34	26	Contemplate what lies behind the Door to Hell (Darvaza Crater).
35	32	Wonder why the statues on Easter Island???? were created.
36	27	Experience the midnight sun???? in Longyearbyen, Norway.
37	30	Loch out for Nessie???? at Loch Ness.
38	31	Marvel at the reflective salt flats of Salar de Uyuni.
39	28	Visit Dracula at Bran Castle???? in Transylvania.
40	29	Walk among the giant bones at Whale Bone Alley????, Siberia.
41	33	Marvel at the Great Wall of China.
42	36	Marvel at the ruins of Petra.
43	37	Marvel at the Colosseum.
44	38	Marvel at the temples of Chichen Itza.
45	40	Hike the Inca Trail into Machu Picchu.
46	35	Marvel at the Taj Mahal.
47	39	Marvel at the Christ the Redeemer statue.
48	34	Marvel at the Great Pyramid of Giza.
49	41	Express your creativity and craziness at Burning Man!????
50	48	Dance in Rio, at Carnival!????????
51	45	Join the food fight at La Tomatina!????
52	47	Who dat? Mardi Gras!????
53	43	Get soaked at Songkran!????
54	42	Take in the dazzling colors of Holi!????
55	46	Jam out at the Montreal Intl Jazz Festival!????
56	44	Attend the St. Patrick's Day Parade in Dublin!??????
\.


--
-- Data for Name: itineraries; Type: TABLE DATA; Schema: public; Owner: jason
--

COPY public.itineraries (id, code, name, editable) FROM stdin;
1	oS3UW8wL	Michelin Star Dining	f
2	05f2eYj8	Sunsets by the Ocean	f
3	6p4KUXCf	Legendary Hikes	f
4	Qkz3ZyQS	Weird Places	f
5	rJiJiWJg	New 7 Wonders	f
6	YYKn64V1	Festivals!	f
\.


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jason
--

SELECT pg_catalog.setval('public.airports_id_seq', 8802, true);


--
-- Name: destinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jason
--

SELECT pg_catalog.setval('public.destinations_id_seq', 48, true);


--
-- Name: experiences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jason
--

SELECT pg_catalog.setval('public.experiences_id_seq', 56, true);


--
-- Name: itineraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jason
--

SELECT pg_catalog.setval('public.itineraries_id_seq', 6, true);


--
-- Name: airports airports_iata_code_key; Type: CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_iata_code_key UNIQUE (iata_code);


--
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: destinations destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (id);


--
-- Name: experiences experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);


--
-- Name: itineraries itineraries_code_key; Type: CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.itineraries
    ADD CONSTRAINT itineraries_code_key UNIQUE (code);


--
-- Name: itineraries itineraries_pkey; Type: CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.itineraries
    ADD CONSTRAINT itineraries_pkey PRIMARY KEY (id);


--
-- Name: destinations destinations_airport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_airport_id_fkey FOREIGN KEY (airport_id) REFERENCES public.airports(id) ON DELETE CASCADE;


--
-- Name: destinations destinations_itinerary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.destinations
    ADD CONSTRAINT destinations_itinerary_id_fkey FOREIGN KEY (itinerary_id) REFERENCES public.itineraries(id) ON DELETE CASCADE;


--
-- Name: experiences experiences_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jason
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.destinations(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

