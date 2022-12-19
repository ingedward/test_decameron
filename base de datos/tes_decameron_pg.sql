--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-12-19 14:16:11

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
-- TOC entry 228 (class 1259 OID 16472)
-- Name: acomodaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acomodaciones (
    id integer NOT NULL,
    acomodacion character varying(100)
);


ALTER TABLE public.acomodaciones OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16471)
-- Name: acomodacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acomodacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acomodacion_id_seq OWNER TO postgres;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 227
-- Name: acomodacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acomodacion_id_seq OWNED BY public.acomodaciones.id;


--
-- TOC entry 222 (class 1259 OID 16438)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudades (
    id integer NOT NULL,
    id_pais character varying(5),
    id_departmento integer,
    ciudad character varying(100)
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16437)
-- Name: ciudades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudades_id_seq OWNER TO postgres;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 221
-- Name: ciudades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudades_id_seq OWNED BY public.ciudades.id;


--
-- TOC entry 220 (class 1259 OID 16425)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    id integer NOT NULL,
    id_pais character varying(5),
    departamento character varying(100)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16424)
-- Name: departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamentos_id_seq OWNER TO postgres;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 219
-- Name: departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_id_seq OWNED BY public.departamentos.id;


--
-- TOC entry 230 (class 1259 OID 16479)
-- Name: habitaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitaciones (
    id integer NOT NULL,
    cantidad integer,
    hotel_id integer,
    tipo_habitacion_id integer,
    acomodacion_id integer
);


ALTER TABLE public.habitaciones OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16478)
-- Name: habitaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitaciones_id_seq OWNER TO postgres;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 229
-- Name: habitaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitaciones_id_seq OWNED BY public.habitaciones.id;


--
-- TOC entry 224 (class 1259 OID 16452)
-- Name: hoteles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hoteles (
    id integer NOT NULL,
    nombre_hotel character varying(100),
    nit character varying(50),
    direccion character varying(100),
    telefono character varying(50),
    contacto character varying(100),
    habitaciones integer,
    estado smallint,
    ciudad_id integer
);


ALTER TABLE public.hoteles OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16451)
-- Name: hoteles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hoteles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hoteles_id_seq OWNER TO postgres;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 223
-- Name: hoteles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hoteles_id_seq OWNED BY public.hoteles.id;


--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: paises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paises (
    id character varying(5) NOT NULL,
    pais character varying(50),
    moneda integer,
    lenguaje integer
);


ALTER TABLE public.paises OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16412)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion character varying(100)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16411)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 226 (class 1259 OID 16465)
-- Name: tipo_habitacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_habitacion (
    id integer NOT NULL,
    tipo_habitacion character varying(100)
);


ALTER TABLE public.tipo_habitacion OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16464)
-- Name: tipo_habitacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_habitacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_habitacion_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipo_habitacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_habitacion_id_seq OWNED BY public.tipo_habitacion.id;


--
-- TOC entry 216 (class 1259 OID 16405)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombres character varying(100),
    apellidos character varying(100),
    telefono character varying(50),
    email character varying(100),
    username character varying(20),
    password character varying(100),
    rol_id integer,
    estado smallint
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16404)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 3218 (class 2604 OID 16475)
-- Name: acomodaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodaciones ALTER COLUMN id SET DEFAULT nextval('public.acomodacion_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 16441)
-- Name: ciudades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades ALTER COLUMN id SET DEFAULT nextval('public.ciudades_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 16428)
-- Name: departamentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id SET DEFAULT nextval('public.departamentos_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 16482)
-- Name: habitaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones ALTER COLUMN id SET DEFAULT nextval('public.habitaciones_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 16455)
-- Name: hoteles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles ALTER COLUMN id SET DEFAULT nextval('public.hoteles_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 16415)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 16468)
-- Name: tipo_habitacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_habitacion ALTER COLUMN id SET DEFAULT nextval('public.tipo_habitacion_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 16408)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3402 (class 0 OID 16472)
-- Dependencies: 228
-- Data for Name: acomodaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acomodaciones (id, acomodacion) FROM stdin;
1	SENCILLA
2	DOBLE
3	TRIPLE
4	CUADRUPLE
\.


--
-- TOC entry 3396 (class 0 OID 16438)
-- Dependencies: 222
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudades (id, id_pais, id_departmento, ciudad) FROM stdin;
1	CO	1	Bogota, D.C.
2	CO	1	Soacha
3	CO	1	Fusagasuga
4	CO	1	Facatativa
5	CO	1	Chia
6	CO	1	Zipaquira
7	CO	1	Girardot
8	CO	1	Mosquera
9	CO	1	Madrid
10	CO	1	Funza
11	CO	1	Cajica
12	CO	1	Sibate
13	CO	1	Guaduas
14	CO	1	Villa de San Diego de Ubate
15	CO	1	Tocancipa
16	CO	1	La Mesa
17	CO	1	Tabio
18	CO	1	Sopo
19	CO	1	La Calera
20	CO	1	Choconta
21	CO	1	Pacho
22	CO	1	Cota
23	CO	1	Villeta
24	CO	1	Cogua
25	CO	1	El Colegio
26	CO	1	Silvania
27	CO	1	Villapinzon
28	CO	1	Nilo
29	CO	1	Tenjo
30	CO	1	Puerto Salgar
31	CO	1	El Rosal
32	CO	1	Suesca
33	CO	1	Tocaima
34	CO	1	Subachoque
35	CO	1	Caqueza
36	CO	1	Yacopi
37	CO	1	Caparrapi
38	CO	1	Sesquile
39	CO	1	Gachancipa
40	CO	1	Guasca
41	CO	1	La Vega
42	CO	1	Nemocon
43	CO	1	Anapoima
44	CO	1	Simijaca
45	CO	1	Susa
46	CO	1	San Antonio del Tequendama
47	CO	1	Viota
48	CO	1	Bojaca
49	CO	1	Pasca
50	CO	1	Arbelaez
51	CO	1	Fomeque
52	CO	1	Anolaima
53	CO	1	Gacheta
54	CO	1	Guacheta
55	CO	1	La Palma
56	CO	1	Sasaima
57	CO	1	San Bernardo
58	CO	1	Agua de Dios
59	CO	1	Lenguazaque
60	CO	1	Choachi
61	CO	1	San Francisco
62	CO	1	Medina
63	CO	1	Ricaurte
64	CO	1	Ubala
65	CO	1	Une
66	CO	1	Cachipay
67	CO	1	San Juan de Rio Seco
68	CO	1	Tena
69	CO	1	Granada
70	CO	1	Carmen de Carupa
71	CO	1	Tausa
72	CO	1	Junin
73	CO	1	Chipaque
74	CO	1	Nocaima
75	CO	1	Quipile
76	CO	1	Fosca
77	CO	1	Paratebueno
78	CO	1	Apulo
79	CO	1	Vergara
80	CO	1	Cucunuba
81	CO	1	Quetame
82	CO	1	Nimaima
83	CO	1	La Peña
84	CO	1	Guatavita
85	CO	1	Macheta
86	CO	1	Sutatausa
87	CO	1	Alban
88	CO	1	Fuquene
89	CO	1	Zipacon
90	CO	1	Ubaque
91	CO	1	Pandi
92	CO	1	Gachala
93	CO	1	San Cayetano
94	CO	1	utica
95	CO	1	Supata
96	CO	1	Guayabetal
97	CO	1	Tibacuy
98	CO	1	Manta
99	CO	1	Quebradanegra
100	CO	1	El Peñon
101	CO	1	Topaipi
102	CO	1	Gutierrez
103	CO	1	Cabrera
104	CO	1	Viani
105	CO	1	Venecia
106	CO	1	Paime
107	CO	1	Gama
108	CO	1	Chaguani
109	CO	1	Guayabal de Siquima
110	CO	1	Puli
111	CO	1	Tibirita
112	CO	1	Guataqui
113	CO	1	Jerusalen
114	CO	1	Bituima
115	CO	1	Beltran
116	CO	1	Nariño
117	CO	1	Villagomez
118	CO	2	Ibague
119	CO	2	Espinal
120	CO	2	Chaparral
121	CO	2	Libano
122	CO	2	Melgar
123	CO	2	Mariquita
124	CO	2	Ortega
125	CO	2	Guamo
126	CO	2	Planadas
127	CO	2	Purificacion
128	CO	2	Fresno
129	CO	2	Flandes
130	CO	2	Coyaima
131	CO	2	Rioblanco
132	CO	2	Honda
133	CO	2	Ataco
134	CO	2	Natagaima
135	CO	2	Rovira
136	CO	2	Venadillo
137	CO	2	Cajamarca
138	CO	2	Anzoategui
139	CO	2	San Luis
140	CO	2	Lerida
141	CO	2	Saldaña
142	CO	2	San Antonio
143	CO	2	Armero
144	CO	2	Icononzo
145	CO	2	Villahermosa
146	CO	2	Coello
147	CO	2	Cunday
148	CO	2	Falan
149	CO	2	Palocabildo
150	CO	2	Carmen de Apicala
151	CO	2	Alvarado
152	CO	2	Dolores
153	CO	2	Herveo
154	CO	2	Prado
155	CO	2	Casabianca
156	CO	2	Valle de San Juan
157	CO	2	Ambalema
158	CO	2	Roncesvalles
159	CO	2	Santa Isabel
160	CO	2	Piedras
161	CO	2	Villarrica
162	CO	2	Murillo
163	CO	2	Alpujarra
164	CO	2	Suarez
165	CO	3	Tunja
166	CO	3	Duitama
167	CO	3	Sogamoso
168	CO	3	Chiquinquira
169	CO	3	Puerto Boyaca
170	CO	3	Paipa
171	CO	3	Moniquira
172	CO	3	Samaca
173	CO	3	Villa de Leyva
174	CO	3	Garagoa
175	CO	3	Nobsa
176	CO	3	Ventaquemada
177	CO	3	Combita
178	CO	3	Tibasosa
179	CO	3	Aquitania
180	CO	3	Raquira
181	CO	3	Santa Rosa de Viterbo
182	CO	3	Saboya
183	CO	3	Pauna
184	CO	3	Otanche
185	CO	3	Umbita
186	CO	3	San Pablo de Borbur
187	CO	3	Tuta
188	CO	3	Toca
189	CO	3	Miraflores
190	CO	3	Ramiriqui
191	CO	3	Guateque
192	CO	3	Siachoque
193	CO	3	Chita
194	CO	3	Tibana
195	CO	3	Motavita
196	CO	3	Muzo
197	CO	3	Jenesano
198	CO	3	Santana
199	CO	3	Quipama
200	CO	3	Maripi
201	CO	3	Pesca
202	CO	3	Socota
203	CO	3	Sotaquira
204	CO	3	Socha
205	CO	3	Chivata
206	CO	3	Nuevo Colon
207	CO	3	Cubara
208	CO	3	Belen
209	CO	3	Güican
210	CO	3	Soata
211	CO	3	Boavita
212	CO	3	Tasco
213	CO	3	Sutamarchan
214	CO	3	Buenavista
215	CO	3	Firavitoba
216	CO	3	Turmeque
217	CO	3	Arcabuco
218	CO	3	Chiquiza
219	CO	3	Chitaraque
220	CO	3	Tota
221	CO	3	Soraca
222	CO	3	El Cocuy
223	CO	3	Mongui
224	CO	3	Labranzagrande
225	CO	3	San Jose de Pare
226	CO	3	Macanal
227	CO	3	Togüi
228	CO	3	Cucaita
229	CO	3	San Luis de Gaceno
230	CO	3	Guayata
231	CO	3	San Miguel de Sema
232	CO	3	Gameza
233	CO	3	Mongua
234	CO	3	Cienega
235	CO	3	Paz de Rio
236	CO	3	Floresta
237	CO	3	Zetaquira
238	CO	3	El Espino
239	CO	3	Boyaca
240	CO	3	Sutatenza
241	CO	3	Tenza
242	CO	3	Chiscas
243	CO	3	Sachica
244	CO	3	Campohermoso
245	CO	3	Topaga
246	CO	3	Jerico
247	CO	3	Santa Maria
248	CO	3	Cerinza
249	CO	3	Caldas
250	CO	3	Coper
251	CO	3	Chinavita
252	CO	3	Somondoco
253	CO	3	San Mateo
254	CO	3	Viracacha
255	CO	3	Tinjaca
256	CO	3	Sora
257	CO	3	Tipacoque
258	CO	3	Oicata
259	CO	3	Susacon
260	CO	3	Rondon
261	CO	3	Paez
262	CO	3	Covarachia
263	CO	3	Santa Sofia
264	CO	3	Briceño
265	CO	3	Paya
266	CO	3	Iza
267	CO	3	Gachantiva
268	CO	3	La Capilla
269	CO	3	Pachavita
270	CO	3	Corrales
271	CO	3	Sativanorte
272	CO	3	La Uvita
273	CO	3	Tunungua
274	CO	3	Berbeo
275	CO	3	Beteitiva
276	CO	3	San Eduardo
277	CO	3	Cuitiva
278	CO	3	Tutaza
279	CO	3	La Victoria
280	CO	3	Chivor
281	CO	3	Guacamayas
282	CO	3	Almeida
283	CO	3	Pajarito
284	CO	3	Panqueba
285	CO	3	Busbanza
286	CO	3	Pisba
287	CO	3	Sativasur
288	CO	4	Neiva
289	CO	4	Pitalito
290	CO	4	Garzon
291	CO	4	La Plata
292	CO	4	Acevedo
293	CO	4	Gigante
294	CO	4	Palermo
295	CO	4	Campoalegre
296	CO	4	San Agustin
297	CO	4	Aipe
298	CO	4	Isnos
299	CO	4	Algeciras
300	CO	4	Guadalupe
301	CO	4	Suaza
302	CO	4	Timana
303	CO	4	Rivera
304	CO	4	Tarqui
305	CO	4	La Argentina
306	CO	4	Oporapa
307	CO	4	Tello
308	CO	4	Pital
309	CO	4	Iquira
310	CO	4	Colombia
311	CO	4	Palestina
312	CO	4	Saladoblanco
313	CO	4	Santa Maria
314	CO	4	Baraya
315	CO	4	Yaguara
316	CO	4	Tesalia
317	CO	4	Agrado
318	CO	4	Teruel
319	CO	4	Villavieja
320	CO	4	Hobo
321	CO	4	Nataga
322	CO	4	Paicol
323	CO	4	Altamira
324	CO	4	Elias
325	CO	5	Leticia
326	CO	5	Puerto Nariño
327	CO	5	La Pedrera (CD)
328	CO	5	El Encanto (CD)
329	CO	5	Tarapaca (CD)
330	CO	5	La Chorrera (CD)
331	CO	5	Puerto Santander (CD)
332	CO	5	Puerto Alegria (CD)
333	CO	5	Miriti - Parana (CD)
334	CO	5	Puerto Arica (CD)
335	CO	5	La Victoria (CD)
336	CO	6	Barranquilla
337	CO	6	Soledad
338	CO	6	Malambo
339	CO	6	Sabanalarga
340	CO	6	Baranoa
341	CO	6	Galapa
342	CO	6	Sabanagrande
343	CO	6	Luruaco
344	CO	6	Repelon
345	CO	6	Puerto Colombia
346	CO	6	Palmar de Varela
347	CO	6	Santo Tomas
348	CO	6	Ponedera
349	CO	6	Juan de Acosta
350	CO	6	Manati
351	CO	6	Polonuevo
352	CO	6	Campo de La Cruz
353	CO	6	Candelaria
354	CO	6	Santa Lucia
355	CO	6	Tubara
356	CO	6	Usiacuri
357	CO	6	Suan
358	CO	6	Piojo
359	CO	7	Cartagena
360	CO	7	Magangue
361	CO	7	El Carmen de Bolivar
362	CO	7	Arjona
363	CO	7	Turbaco
364	CO	7	Maria La Baja
365	CO	7	Santa Rosa del Sur
366	CO	7	Mompos
367	CO	7	San Pablo
368	CO	7	San Juan Nepomuceno
369	CO	7	Mahates
370	CO	7	Pinillos
371	CO	7	Santa Rosa
372	CO	7	Achi
373	CO	7	Calamar
374	CO	7	Tiquisio
375	CO	7	Montecristo
376	CO	7	Morales
377	CO	7	Simiti
378	CO	7	San Jacinto
379	CO	7	Arenal
380	CO	7	Villanueva
381	CO	7	Rio Viejo (1)(3)
382	CO	7	Barranco de Loba
383	CO	7	San Martin de Loba
384	CO	7	San Estanislao
385	CO	7	Turbana
386	CO	7	Altos del Rosario
387	CO	7	San Jacinto del Cauca
388	CO	7	San Fernando
389	CO	7	Santa Catalina
390	CO	7	Clemencia
391	CO	7	Hatillo de Loba
392	CO	7	Cordoba
393	CO	7	Zambrano
394	CO	7	Regidor
395	CO	7	Talaigua Nuevo
396	CO	7	Cicuco
397	CO	7	Arroyohondo
398	CO	7	El Peñon
399	CO	7	Margarita
400	CO	7	Cantagallo
401	CO	7	Soplaviento
402	CO	7	El Guamo
403	CO	7	San Cristobal
404	CO	7	Norosi (1)
405	CO	8	Monteria
406	CO	8	Lorica
407	CO	8	Tierralta
408	CO	8	Cerete
409	CO	8	Sahagun
410	CO	8	Montelibano(1)(3)
411	CO	8	Cienaga de Oro
412	CO	8	Planeta Rica
413	CO	8	Ayapel
414	CO	8	Puerto Libertador
415	CO	8	Chinu
416	CO	8	San Andres Sotavento (1) (3)
417	CO	8	Valencia
418	CO	8	San Pelayo
419	CO	8	Pueblo Nuevo
420	CO	8	Tuchin (1)
421	CO	8	San Bernardo del Viento
422	CO	8	San Antero
423	CO	8	Puerto Escondido
424	CO	8	Moñitos
425	CO	8	San Carlos
426	CO	8	Los Cordobas
427	CO	8	Canalete
428	CO	8	Buenavista
429	CO	8	La Apartada
430	CO	8	Chima
431	CO	8	Cotorra
432	CO	8	Momil
433	CO	8	Purisima
434	CO	8	San Jose de Ure(1)
435	CO	9	Santa Marta
436	CO	9	Cienaga
437	CO	9	Plato
438	CO	9	Zona Bananera
439	CO	9	Fundacion
440	CO	9	El Banco
441	CO	9	Aracataca
442	CO	9	Puebloviejo
443	CO	9	Sitionuevo
444	CO	9	Pivijay
445	CO	9	Ariguani
446	CO	9	Guamal
447	CO	9	Santa Ana
448	CO	9	El Reten
449	CO	9	Nueva Granada
450	CO	9	Sabanas de San Angel
451	CO	9	San Sebastian de Buenavista
452	CO	9	Pijiño del Carmen
453	CO	9	El Piñon
454	CO	9	Chivolo
455	CO	9	Santa Barbara de Pinto
456	CO	9	Algarrobo
457	CO	9	Tenerife
458	CO	9	San Zenon
459	CO	9	Concordia
460	CO	9	Zapayan
461	CO	9	Pedraza
462	CO	9	Remolino
463	CO	9	Cerro San Antonio
464	CO	9	Salamina
465	CO	10	Riohacha
466	CO	10	Uribia
467	CO	10	Maicao
468	CO	10	Manaure
469	CO	10	San Juan del Cesar
470	CO	10	Dibulla
471	CO	10	Barrancas
472	CO	10	Fonseca
473	CO	10	Hatonuevo
474	CO	10	Villanueva
475	CO	10	Albania
476	CO	10	Urumita
477	CO	10	Distraccion
478	CO	10	El Molino
479	CO	10	La Jagua del Pilar
480	CO	11	Sincelejo
481	CO	11	Corozal
482	CO	11	San Marcos
483	CO	11	San Onofre
484	CO	11	Sampues
485	CO	11	Santiago de Tolu
486	CO	11	San Luis de Since
487	CO	11	Majagual
488	CO	11	San Benito Abad
489	CO	11	Sucre
490	CO	11	Galeras
491	CO	11	Ovejas
492	CO	11	Los Palmitos
493	CO	11	Tolu Viejo
494	CO	11	Guaranda
495	CO	11	San Pedro
496	CO	11	Morroa
497	CO	11	Palmito
498	CO	11	Coveñas
499	CO	11	Caimito
500	CO	11	San Juan de Betulia
501	CO	11	La Union
502	CO	11	El Roble
503	CO	11	Buenavista
504	CO	11	Coloso
505	CO	11	Chalan
506	CO	12	San Andres
507	CO	12	Providencia
508	CO	13	Cali
509	CO	13	Buenaventura
510	CO	13	Palmira
511	CO	13	Tulua
512	CO	13	Cartago
513	CO	13	Jamundi
514	CO	13	Yumbo
515	CO	13	Guadalajara de Buga
516	CO	13	Candelaria
517	CO	13	Florida
518	CO	13	El Cerrito
519	CO	13	Pradera
520	CO	13	Zarzal
521	CO	13	Sevilla
522	CO	13	La Union
523	CO	13	Dagua
524	CO	13	Guacari
525	CO	13	Roldanillo
526	CO	13	Caicedonia
527	CO	13	Alcala
528	CO	13	Ginebra
529	CO	13	Bugalagrande
530	CO	13	San Pedro
531	CO	13	Ansermanuevo
532	CO	13	Trujillo
533	CO	13	Andalucia
534	CO	13	Toro
535	CO	13	Yotoco
536	CO	13	Restrepo
537	CO	13	Calima
538	CO	13	Obando
539	CO	13	Riofrio
540	CO	13	La Victoria
541	CO	13	Bolivar
542	CO	13	La Cumbre
543	CO	13	Vijes
544	CO	13	El aguila
545	CO	13	El Cairo
546	CO	13	El Dovio
547	CO	13	Versalles
548	CO	13	Argelia
549	CO	13	Ulloa
550	CO	14	Pasto
551	CO	14	San Andres de Tumaco
552	CO	14	Ipiales
553	CO	14	Samaniego
554	CO	14	El Charco
555	CO	14	Barbacoas
556	CO	14	Cumbal
557	CO	14	Tuquerres
558	CO	14	Olaya Herrera
559	CO	14	Santacruz
560	CO	14	Buesaco
561	CO	14	Roberto Payan
562	CO	14	Magüi
563	CO	14	Sandona
564	CO	14	La Union
565	CO	14	Alban
566	CO	14	Taminango
567	CO	14	San Bernardo
568	CO	14	Los Andes
569	CO	14	Ricaurte
570	CO	14	San Lorenzo
571	CO	14	Pupiales
572	CO	14	Mosquera
573	CO	14	Policarpa
574	CO	14	La Cruz
575	CO	14	Cumbitara
576	CO	14	Francisco Pizarro
577	CO	14	San Pablo
578	CO	14	La Tola
579	CO	14	Guachucal
580	CO	14	Leiva
581	CO	14	Santa Barbara
582	CO	14	Chachagüi
583	CO	14	Cordoba
584	CO	14	Providencia
585	CO	14	El Tablon de Gomez
586	CO	14	Potosi
587	CO	14	Yacuanquer
588	CO	14	El Tambo
589	CO	14	Guaitarilla
590	CO	14	Colon
591	CO	14	El Rosario
592	CO	14	La Florida
593	CO	14	Linares
594	CO	14	Iles
595	CO	14	Tangua
596	CO	14	Ospina
597	CO	14	Consaca
598	CO	14	Cuaspud
599	CO	14	Puerres
600	CO	14	Belen
601	CO	14	San Pedro de Cartago
602	CO	14	Arboleda
603	CO	14	Contadero
604	CO	14	Mallama
605	CO	14	El Peñol
606	CO	14	Ancuya
607	CO	14	Funes
608	CO	14	Gualmatan
609	CO	14	Sapuyes
610	CO	14	Aldana
611	CO	14	Imues
612	CO	14	La Llanada
613	CO	14	Nariño
614	CO	15	Popayan
615	CO	15	Santander de Quilichao
616	CO	15	El Tambo
617	CO	15	La Vega
618	CO	15	Piendamo
619	CO	15	Puerto Tejada
620	CO	15	Bolivar
621	CO	15	Miranda
622	CO	15	Cajibio
623	CO	15	Patia
624	CO	15	Paez
625	CO	15	Timbio
626	CO	15	Buenos Aires
627	CO	15	Caldono
628	CO	15	Corinto
629	CO	15	Inza
630	CO	15	Silvia
631	CO	15	Toribio
632	CO	15	Guapi
633	CO	15	Argelia
634	CO	15	Morales
635	CO	15	Balboa
636	CO	15	Timbiqui
637	CO	15	Totoro
638	CO	15	Almaguer
639	CO	15	Lopez
640	CO	15	Guachene (1) 
641	CO	15	Jambalo
642	CO	15	Suarez
643	CO	15	Mercaderes
644	CO	15	Caloto(1)(3)
645	CO	15	Sotara
646	CO	15	Villa Rica
647	CO	15	Purace
648	CO	15	San Sebastian
649	CO	15	Rosas
650	CO	15	Santa Rosa
651	CO	15	La Sierra
652	CO	15	Sucre
653	CO	15	Padilla
654	CO	15	Piamonte
655	CO	15	Florencia
656	CO	16	Puerto Asis
657	CO	16	Orito
658	CO	16	Valle del Guamuez
659	CO	16	Mocoa
660	CO	16	San Miguel
661	CO	16	Puerto Guzman
662	CO	16	Villagarzon
663	CO	16	Leguizamo
664	CO	16	Puerto Caicedo
665	CO	16	Sibundoy
666	CO	16	Santiago
667	CO	16	San Francisco
668	CO	16	Colon
669	CO	17	Medellin
670	CO	17	Bello
671	CO	17	Itagui
672	CO	17	Envigado
673	CO	17	Apartado
674	CO	17	Turbo
675	CO	17	Rionegro
676	CO	17	Caucasia
677	CO	17	Chigorodo
678	CO	17	Caldas
679	CO	17	Copacabana
680	CO	17	Necocli
681	CO	17	La Estrella
682	CO	17	Carepa
683	CO	17	Girardota
684	CO	17	Marinilla
685	CO	17	La Ceja
686	CO	17	Sabaneta
687	CO	17	Barbosa
688	CO	17	Guarne
689	CO	17	El Bagre
690	CO	17	Puerto Berrio
691	CO	17	Yarumal
692	CO	17	El Carmen de Viboral
693	CO	17	Taraza
694	CO	17	Andes
695	CO	17	Urrao
696	CO	17	Arboletes
697	CO	17	Caceres
698	CO	17	Segovia
699	CO	17	Santa Rosa de Osos
700	CO	17	Sonson
701	CO	17	Remedios
702	CO	17	Zaragoza
703	CO	17	San Pedro de Uraba
704	CO	17	Amaga
705	CO	17	Nechi
706	CO	17	San Pedro
707	CO	17	San Juan de Uraba
708	CO	17	El Santuario
709	CO	17	Ciudad Bolivar
710	CO	17	Yolombo
711	CO	17	Santafe de Antioquia
712	CO	17	Valdivia
713	CO	17	Don Matias
714	CO	17	Mutata
715	CO	17	Amalfi
716	CO	17	Dabeiba
717	CO	17	Puerto Triunfo
718	CO	17	Santa Barbara
719	CO	17	Fredonia
720	CO	17	Yondo
721	CO	17	Concordia
722	CO	17	Retiro
723	CO	17	La Union
724	CO	17	Puerto Nare
725	CO	17	Ituango
726	CO	17	Abejorral
727	CO	17	Nariño
728	CO	17	Anori
729	CO	17	Betulia
730	CO	17	Salgar
731	CO	17	Cañasgordas
732	CO	17	San Carlos
733	CO	17	San Roque
734	CO	17	San Vicente
735	CO	17	Peñol
736	CO	17	Sopetran
737	CO	17	Frontino
738	CO	17	Cocorna
739	CO	17	Titiribi
740	CO	17	Tamesis
741	CO	17	Gomez Plata
742	CO	17	Jardin
743	CO	17	Venecia
744	CO	17	San Jeronimo
745	CO	17	San Rafael
746	CO	17	Ebejico
747	CO	17	Jerico
748	CO	17	Peque
749	CO	17	San Luis
750	CO	17	Angostura
751	CO	17	Entrerrios
752	CO	17	Granada
753	CO	17	Santo Domingo
754	CO	17	Angelopolis
755	CO	17	Liborina
756	CO	17	Campamento
757	CO	17	Yali
758	CO	17	Betania
759	CO	17	Cisneros
760	CO	17	Briceño
761	CO	17	Vegachi
762	CO	17	Caicedo
763	CO	17	Tarso
764	CO	17	Uramita
765	CO	17	Sabanalarga
766	CO	17	Argelia
767	CO	17	Anza
768	CO	17	Belmira
769	CO	17	Toledo
770	CO	17	Maceo
771	CO	17	Pueblorrico
772	CO	17	Buritica
773	CO	17	Guadalupe
774	CO	17	La Pintada
775	CO	17	Valparaiso
776	CO	17	San Andres de Cuerquia
777	CO	17	Vigia del Fuerte
778	CO	17	Montebello
779	CO	17	Heliconia
780	CO	17	Caramanta
781	CO	17	Murindo
782	CO	17	Guatape
783	CO	17	Hispania
784	CO	17	San Francisco
785	CO	17	Caracoli
786	CO	17	Giraldo
787	CO	17	Armenia
788	CO	17	San Jose de La Montaña
789	CO	17	Carolina
790	CO	17	Olaya
791	CO	17	Alejandria
792	CO	17	Concepcion
793	CO	17	Abriaqui
794	CO	18	Quibdo
795	CO	18	Alto Baudo
796	CO	18	Medio Atrato
797	CO	18	Riosucio(2)
798	CO	18	Istmina
799	CO	18	Tado
800	CO	18	Medio San Juan
801	CO	18	Bajo Baudo
802	CO	18	El Litoral del San Juan
803	CO	18	Condoto
804	CO	18	Unguia
805	CO	18	El Carmen de Atrato
806	CO	18	Medio Baudo
807	CO	18	Lloro
808	CO	18	Atrato
809	CO	18	Rio Iro
810	CO	18	Union Panamericana
811	CO	18	Certegui
812	CO	18	Bojaya
813	CO	18	Rio Quito
814	CO	18	Bahia Solano
815	CO	18	Acandi
816	CO	18	Nuqui
817	CO	18	El Canton del San Pablo
818	CO	18	Novita
819	CO	18	Bagado
820	CO	18	Carmen del Darien
821	CO	18	San Jose del Palmar
822	CO	18	Sipi
823	CO	18	Jurado
824	CO	19	Bucaramanga
825	CO	19	Floridablanca
826	CO	19	Giron
827	CO	19	Barrancabermeja
828	CO	19	Piedecuesta
829	CO	19	Cimitarra
830	CO	19	San Gil
831	CO	19	Lebrija
832	CO	19	San Vicente de Chucuri
833	CO	19	Puerto Wilches
834	CO	19	Socorro
835	CO	19	Barbosa
836	CO	19	Rionegro
837	CO	19	El Carmen de Chucuri
838	CO	19	Velez
839	CO	19	Malaga
840	CO	19	Sabana de Torres
841	CO	19	Landazuri
842	CO	19	Los Santos
843	CO	19	Oiba
844	CO	19	Curiti
845	CO	19	Bolivar
846	CO	19	Puente Nacional
847	CO	19	El Playon
848	CO	19	Mogotes
849	CO	19	Charala
850	CO	19	Suaita
851	CO	19	Zapatoca
852	CO	19	La Belleza
853	CO	19	Aratoca
854	CO	19	Puerto Parra
855	CO	19	Sucre
856	CO	19	San Andres
857	CO	19	Coromoro
858	CO	19	Simacota
859	CO	19	Tona
860	CO	19	Barichara
861	CO	19	Florian
862	CO	19	Guaca
863	CO	19	Pinchote
864	CO	19	Albania
865	CO	19	Cerrito
866	CO	19	Villanueva
867	CO	19	Capitanejo
868	CO	19	Gambita
869	CO	19	Chipata
870	CO	19	Matanza
871	CO	19	Betulia
872	CO	19	Concepcion
873	CO	19	El Peñon
874	CO	19	La Paz
875	CO	19	Molagavita
876	CO	19	Carcasi
877	CO	19	Onzaga
878	CO	19	Ocamonte
879	CO	19	Valle de San Jose
880	CO	19	Guadalupe
881	CO	19	Paramo
882	CO	19	Santa Helena del Opon
883	CO	19	San Jose de Miranda
884	CO	19	San Benito
885	CO	19	Güepsa
886	CO	19	Palmar
887	CO	19	Guavata
888	CO	19	Contratacion
889	CO	19	Surata
890	CO	19	Enciso
891	CO	19	Jesus Maria
892	CO	19	Chima
893	CO	19	Confines
894	CO	19	Cabrera
895	CO	19	Vetas
896	CO	19	Charta
897	CO	19	Encino
898	CO	19	Hato
899	CO	19	San Joaquin
900	CO	19	San Miguel
901	CO	19	Macaravita
902	CO	23	Filadelfia
903	CO	23	Marmato
904	CO	23	Risaralda
905	CO	23	Victoria
906	CO	23	San Jose
907	CO	23	Norcasia
908	CO	23	La Merced
909	CO	23	Marulanda
910	CO	24	Pereira
911	CO	24	Dosquebradas
912	CO	24	Santa Rosa de Cabal
913	CO	24	Quinchia
914	CO	24	La Virginia
915	CO	24	Belen de Umbria
916	CO	24	Marsella
917	CO	24	Apia
918	CO	24	Mistrato
919	CO	24	Santuario
920	CO	24	Guatica
921	CO	24	Pueblo Rico
922	CO	24	La Celia
923	CO	24	Balboa
924	CO	25	Armenia
925	CO	25	Calarca
926	CO	25	La Tebaida
927	CO	25	Montenegro
928	CO	25	Quimbaya
929	CO	25	Circasia
930	CO	25	Filandia
931	CO	25	Genova
932	CO	25	Salento
933	CO	25	Pijao
934	CO	25	Cordoba
935	CO	25	Buenavista
936	CO	26	Villavicencio
937	CO	26	Acacias
938	CO	26	Granada
939	CO	26	La Macarena
940	CO	26	Puerto Lopez
941	CO	26	Vistahermosa
942	CO	26	San Martin
943	CO	26	Puerto Concordia
944	CO	26	Mapiripan
945	CO	26	Puerto Gaitan
946	CO	26	Puerto Rico
947	CO	26	Cumaral
948	CO	26	Uribe
949	CO	26	Fuente de Oro
950	CO	26	Mesetas
951	CO	26	San Carlos de Guaroa
952	CO	26	Castilla la Nueva
953	CO	26	Restrepo
954	CO	26	Guamal
955	CO	26	Puerto Lleras
956	CO	26	Lejanias
957	CO	26	San Juan de Arama
958	CO	26	Cubarral
959	CO	26	El Castillo
960	CO	26	Barranca de Upia
961	CO	26	Cabuyaro
962	CO	26	El Dorado
963	CO	26	San Juanito
964	CO	26	El Calvario
965	CO	27	Florencia
966	CO	27	San Vicente del Caguan
967	CO	27	Cartagena del Chaira
968	CO	27	Puerto Rico
969	CO	27	Solano
970	CO	27	La Montañita
971	CO	27	El Doncello
972	CO	27	El Paujil
973	CO	27	San Jose del Fragua
974	CO	27	Curillo
975	CO	27	Milan
976	CO	27	Valparaiso
977	CO	27	Belen de Los Andaquies
978	CO	27	Solita
979	CO	27	Albania
980	CO	27	Morelia
981	CO	28	Yopal
982	CO	28	Aguazul
983	CO	28	Paz de Ariporo
984	CO	28	Tauramena
985	CO	28	Villanueva
986	CO	28	Trinidad
987	CO	28	Monterrey
988	CO	28	Hato Corozal
989	CO	28	Mani
990	CO	28	Nunchia
991	CO	28	Orocue
992	CO	28	San Luis de Palenque
993	CO	28	Pore
994	CO	28	Tamara
995	CO	28	Recetor
996	CO	28	Sabanalarga
997	CO	28	Chameza
998	CO	28	Sacama
999	CO	28	La Salina
1000	CO	29	San Jose del Guaviare
1001	CO	29	El Retorno
1002	CO	29	Miraflores
1003	CO	29	Calamar
1004	CO	30	Cumaribo
1005	CO	30	La Primavera
1006	CO	30	Puerto Carreño
1007	CO	30	Santa Rosalia
1008	CO	31	Mitu
1009	CO	31	Pacoa (CD)
1010	CO	31	Caruru
1011	CO	31	Yavarate (CD)
1012	CO	31	Taraira
1013	CO	31	Papunaua (CD)
1014	CO	32	Inirida
1015	CO	32	Puerto Colombia (CD)
1016	CO	32	Barranco Minas (CD)
1017	CO	32	Pana Pana (CD)
1018	CO	32	Cacahual (CD)
1019	CO	32	Mapiripana (CD)
1020	CO	32	San Felipe (CD)
1021	CO	32	Morichal (CD)
1022	CO	32	La Guadalupe (CD)
\.


--
-- TOC entry 3394 (class 0 OID 16425)
-- Dependencies: 220
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (id, id_pais, departamento) FROM stdin;
1	CO	Cundinamarca\\r\\n
2	CO	Tolima\\r\\n
3	CO	Boyaca\\r\\n
4	CO	Huila\\r\\n
5	CO	Amazonas\\r\\n
6	CO	Atlantico\\r\\n
7	CO	Bolivar\\r\\n
8	CO	Cordoba\\r\\n
9	CO	Magdalena\\r\\n
10	CO	La Guajira\\r\\n
11	CO	Sucre\\r\\n
12	CO	Archipielago de San Andres\\r\\n
13	CO	Valle del Cauca\\r\\n
14	CO	Nariño\\r\\n
15	CO	Cauca\\r\\n
16	CO	Putumayo\\r\\n
17	CO	Antioquia\\r\\n
18	CO	Choco\\r\\n
19	CO	Santander\\r\\n
20	CO	Norte de Santander\\r\\n
21	CO	Cesar\\r\\n
22	CO	Arauca\\r\\n
23	CO	Caldas\\r\\n
24	CO	Risaralda\\r\\n
25	CO	Quindio\\r\\n
26	CO	Meta\\r\\n
27	CO	Caqueta\\r\\n
28	CO	Casanare\\r\\n
29	CO	Guaviare\\r\\n
30	CO	Vichada\\r\\n
31	CO	Vaupes\\r\\n
32	CO	Guainia\\r\\n
\.


--
-- TOC entry 3404 (class 0 OID 16479)
-- Dependencies: 230
-- Data for Name: habitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habitaciones (id, cantidad, hotel_id, tipo_habitacion_id, acomodacion_id) FROM stdin;
5	20	4	1	1
\.


--
-- TOC entry 3398 (class 0 OID 16452)
-- Dependencies: 224
-- Data for Name: hoteles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hoteles (id, nombre_hotel, nit, direccion, telefono, contacto, habitaciones, estado, ciudad_id) FROM stdin;
4	Decameron Bogotá	900111111-1	Calle 100	300111111		50	1	1
\.


--
-- TOC entry 3388 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paises (id, pais, moneda, lenguaje) FROM stdin;
AD	Andorra	\N	\N
AE	United Arab Emirates	\N	\N
AF	Afghanistan	\N	\N
AG	Antigua and Barbuda	\N	\N
AI	Anguilla	\N	\N
AL	Albania	\N	\N
AM	Armenia	\N	\N
AO	Angola	\N	\N
AP	Asia/Pacific Region	\N	\N
AQ	Antarctica	\N	\N
AR	Argentina	\N	\N
AS	American Samoa	\N	\N
AT	Austria	\N	\N
AU	Australia	\N	\N
AW	Aruba	\N	\N
AX	Aland Islands	\N	\N
AZ	Azerbaijan	\N	\N
BA	Bosnia and Herzegovina	\N	\N
BB	Barbados	\N	\N
BD	Bangladesh	\N	\N
BE	Belgium	\N	\N
BF	Burkina Faso	\N	\N
BG	Bulgaria	\N	\N
BH	Bahrain	\N	\N
BI	Burundi	\N	\N
BJ	Benin	\N	\N
BL	Saint Barthelemy	\N	\N
BM	Bermuda	\N	\N
BN	Brunei Darussalam	\N	\N
BO	Bolivia	\N	\N
BQ	Bonair	\N	\N
BR	Brazil	\N	\N
BS	Bahamas	\N	\N
BT	Bhutan	\N	\N
BW	Botswana	\N	\N
BY	Belarus	\N	\N
BZ	Belize	\N	\N
CA	Canada	\N	\N
CC	Cocos (Keeling) Islands	\N	\N
CD	Cong	\N	\N
CF	Central African Republic	\N	\N
CG	Congo	\N	\N
CH	Switzerland	\N	\N
CI	Cote D	\N	\N
CK	Cook Islands	\N	\N
CL	Chile	\N	\N
CM	Cameroon	\N	\N
CN	China	\N	\N
CO	Colombia	\N	\N
CR	Costa Rica	\N	\N
CU	Cuba	\N	\N
CV	Cape Verde	\N	\N
CW	Curacao	\N	\N
CX	Christmas Island	\N	\N
CY	Cyprus	\N	\N
CZ	Czech Republic	\N	\N
DE	Germany	\N	\N
DJ	Djibouti	\N	\N
DK	Denmark	\N	\N
DM	Dominica	\N	\N
DO	Dominican Republic	\N	\N
DZ	Algeria	\N	\N
EC	Ecuador	\N	\N
EE	Estonia	\N	\N
EG	Egypt	\N	\N
EH	Western Sahara	\N	\N
ER	Eritrea	\N	\N
ES	Spain	\N	\N
ET	Ethiopia	\N	\N
EU	Europe	\N	\N
FI	Finland	\N	\N
FJ	Fiji	\N	\N
FK	Falkland Islands (Malvinas)	\N	\N
FM	Micronesi	\N	\N
FO	Faroe Islands	\N	\N
FR	France	\N	\N
GA	Gabon	\N	\N
GB	United Kingdom	\N	\N
GD	Grenada	\N	\N
GE	Georgia	\N	\N
GF	French Guiana	\N	\N
GG	Guernsey	\N	\N
GH	Ghana	\N	\N
GI	Gibraltar	\N	\N
GL	Greenland	\N	\N
GM	Gambia	\N	\N
GN	Guinea	\N	\N
GP	Guadeloupe	\N	\N
GQ	Equatorial Guinea	\N	\N
GR	Greece	\N	\N
GS	South Georgia and the South Sandwich Islands	\N	\N
GT	Guatemala	\N	\N
GU	Guam	\N	\N
GW	Guinea-Bissau	\N	\N
GY	Guyana	\N	\N
HK	Hong Kong	\N	\N
HN	Honduras	\N	\N
HR	Croatia	\N	\N
HT	Haiti	\N	\N
HU	Hungary	\N	\N
ID	Indonesia	\N	\N
IE	Ireland	\N	\N
IL	Israel	\N	\N
IM	Isle of Man	\N	\N
IN	India	\N	\N
IO	British Indian Ocean Territory	\N	\N
IQ	Iraq	\N	\N
IR	Ira	\N	\N
IS	Iceland	\N	\N
IT	Italy	\N	\N
JE	Jersey	\N	\N
JM	Jamaica	\N	\N
JO	Jordan	\N	\N
JP	Japan	\N	\N
KE	Kenya	\N	\N
KG	Kyrgyzstan	\N	\N
KH	Cambodia	\N	\N
KI	Kiribati	\N	\N
KM	Comoros	\N	\N
KN	Saint Kitts and Nevis	\N	\N
KP	Kore	\N	\N
KR	Kore	\N	\N
KW	Kuwait	\N	\N
KY	Cayman Islands	\N	\N
KZ	Kazakhstan	\N	\N
LA	Lao People Democratic Republic	\N	\N
LB	Lebanon	\N	\N
LC	Saint Lucia	\N	\N
LI	Liechtenstein	\N	\N
LK	Sri Lanka	\N	\N
LR	Liberia	\N	\N
LS	Lesotho	\N	\N
LT	Lithuania	\N	\N
LU	Luxembourg	\N	\N
LV	Latvia	\N	\N
LY	Libya	\N	\N
MA	Morocco	\N	\N
MC	Monaco	\N	\N
MD	Moldov	\N	\N
ME	Montenegro	\N	\N
MF	Saint Martin	\N	\N
MG	Madagascar	\N	\N
MH	Marshall Islands	\N	\N
MK	Macedonia	\N	\N
ML	Mali	\N	\N
MM	Myanmar	\N	\N
MN	Mongolia	\N	\N
MO	Macau	\N	\N
MP	Northern Mariana Islands	\N	\N
MQ	Martinique	\N	\N
MR	Mauritania	\N	\N
MS	Montserrat	\N	\N
MT	Malta	\N	\N
MU	Mauritius	\N	\N
MV	Maldives	\N	\N
MW	Malawi	\N	\N
MX	Mexico	\N	\N
MY	Malaysia	\N	\N
MZ	Mozambique	\N	\N
NA	Namibia	\N	\N
NC	New Caledonia	\N	\N
NE	Niger	\N	\N
NF	Norfolk Island	\N	\N
NG	Nigeria	\N	\N
NI	Nicaragua	\N	\N
NL	Netherlands	\N	\N
NO	Norway	\N	\N
NP	Nepal	\N	\N
NR	Nauru	\N	\N
NU	Niue	\N	\N
NZ	New Zealand	\N	\N
OM	Oman	\N	\N
PA	Panama	\N	\N
PE	Peru	\N	\N
PF	French Polynesia	\N	\N
PG	Papua New Guinea	\N	\N
PH	Philippines	\N	\N
PK	Pakistan	\N	\N
PL	Poland	\N	\N
PM	Saint Pierre and Miquelon	\N	\N
PN	Pitcairn Islands	\N	\N
PR	Puerto Rico	\N	\N
PS	Palestinian Territory	\N	\N
PT	Portugal	\N	\N
PW	Palau	\N	\N
PY	Paraguay	\N	\N
QA	Qatar	\N	\N
RE	Reunion	\N	\N
RO	Romania	\N	\N
RS	Serbia	\N	\N
RU	Russian Federation	\N	\N
RW	Rwanda	\N	\N
SA	Saudi Arabia	\N	\N
SB	Solomon Islands	\N	\N
SC	Seychelles	\N	\N
SD	Sudan	\N	\N
SE	Sweden	\N	\N
SG	Singapore	\N	\N
SH	Saint Helena	\N	\N
SI	Slovenia	\N	\N
SJ	Svalbard and Jan Mayen	\N	\N
SK	Slovakia	\N	\N
SL	Sierra Leone	\N	\N
SM	San Marino	\N	\N
SN	Senegal	\N	\N
SO	Somalia	\N	\N
SR	Suriname	\N	\N
SS	South Sudan	\N	\N
ST	Sao Tome and Principe	\N	\N
SV	El Salvador	\N	\N
SX	Sint Maarten (Dutch part)	\N	\N
SY	Syrian Arab Republic	\N	\N
SZ	Swaziland	\N	\N
TC	Turks and Caicos Islands	\N	\N
TD	Chad	\N	\N
TF	French Southern Territories	\N	\N
TG	Togo	\N	\N
TH	Thailand	\N	\N
TJ	Tajikistan	\N	\N
TK	Tokelau	\N	\N
TL	Timor-Leste	\N	\N
TM	Turkmenistan	\N	\N
TN	Tunisia	\N	\N
TO	Tonga	\N	\N
TR	Turkey	\N	\N
TT	Trinidad and Tobago	\N	\N
TV	Tuvalu	\N	\N
TW	Taiwan	\N	\N
TZ	Tanzani	\N	\N
UA	Ukraine	\N	\N
UG	Uganda	\N	\N
UM	United States Minor Outlying Islands	\N	\N
US	United States	\N	\N
UY	Uruguay	\N	\N
UZ	Uzbekistan	\N	\N
VA	Holy See (Vatican City State)	\N	\N
VC	Saint Vincent and the Grenadines	\N	\N
VE	Venezuela	\N	\N
VG	Virgin Island	\N	\N
VI	Virgin Island	\N	\N
VN	Vietnam	\N	\N
VU	Vanuatu	\N	\N
WF	Wallis and Futuna	\N	\N
WS	Samoa	\N	\N
YE	Yemen	\N	\N
YT	Mayotte	\N	\N
ZA	South Africa	\N	\N
ZM	Zambia	\N	\N
ZW	Zimbabwe	\N	\N
\.


--
-- TOC entry 3392 (class 0 OID 16412)
-- Dependencies: 218
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, nombre, descripcion) FROM stdin;
1	superadmin	\N
2	admin	\N
\.


--
-- TOC entry 3400 (class 0 OID 16465)
-- Dependencies: 226
-- Data for Name: tipo_habitacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_habitacion (id, tipo_habitacion) FROM stdin;
1	ESTANDAR
2	JUNIOR
3	SUITE
\.


--
-- TOC entry 3390 (class 0 OID 16405)
-- Dependencies: 216
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombres, apellidos, telefono, email, username, password, rol_id, estado) FROM stdin;
1	Edward	Rodriguez	3196530669	ing.erodriguez@outlook.com	admin	7110eda4d09e062aa5e4a390b0a572ac0d2c0220	2	1
\.


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 227
-- Name: acomodacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acomodacion_id_seq', 1, false);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 221
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudades_id_seq', 1, false);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 219
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_id_seq', 1, false);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 229
-- Name: habitaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitaciones_id_seq', 6, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 223
-- Name: hoteles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hoteles_id_seq', 4, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipo_habitacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_habitacion_id_seq', 1, true);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);


--
-- TOC entry 3239 (class 2606 OID 16477)
-- Name: acomodaciones acomodacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodaciones
    ADD CONSTRAINT acomodacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 16443)
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 16430)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 16484)
-- Name: habitaciones habitaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 16457)
-- Name: hoteles hoteles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 16403)
-- Name: paises paises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 16417)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 16470)
-- Name: tipo_habitacion tipo_habitacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_habitacion
    ADD CONSTRAINT tipo_habitacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16410)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 1259 OID 16436)
-- Name: fki_department_ibfk_1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_department_ibfk_1 ON public.departamentos USING btree (id_pais);


--
-- TOC entry 3233 (class 1259 OID 16463)
-- Name: fki_fk_hoteles_ciudad_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_hoteles_ciudad_idx ON public.hoteles USING btree (ciudad_id);


--
-- TOC entry 3222 (class 1259 OID 16423)
-- Name: fki_fk_rol_usuarios; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_rol_usuarios ON public.usuarios USING btree (rol_id);


--
-- TOC entry 3232 (class 1259 OID 16449)
-- Name: fki_ibfk_ciudades; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_ibfk_ciudades ON public.ciudades USING btree (id_pais);


--
-- TOC entry 3243 (class 2606 OID 16431)
-- Name: departamentos department_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT department_ibfk_1 FOREIGN KEY (id_pais) REFERENCES public.paises(id) NOT VALID;


--
-- TOC entry 3245 (class 2606 OID 16458)
-- Name: hoteles fk_hoteles_ciudad_idx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT fk_hoteles_ciudad_idx FOREIGN KEY (ciudad_id) REFERENCES public.ciudades(id) NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 16418)
-- Name: usuarios fk_rol_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_rol_usuarios FOREIGN KEY (rol_id) REFERENCES public.roles(id) NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 16444)
-- Name: ciudades ibfk_ciudades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ibfk_ciudades FOREIGN KEY (id_pais) REFERENCES public.paises(id) NOT VALID;


-- Completed on 2022-12-19 14:16:11

--
-- PostgreSQL database dump complete
--

