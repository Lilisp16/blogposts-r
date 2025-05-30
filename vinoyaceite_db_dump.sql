--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: bases_biblicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bases_biblicas (
    id integer NOT NULL,
    subseccion character varying(100) NOT NULL,
    contenido text NOT NULL
);


ALTER TABLE public.bases_biblicas OWNER TO postgres;

--
-- Name: bases_biblicas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bases_biblicas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bases_biblicas_id_seq OWNER TO postgres;

--
-- Name: bases_biblicas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bases_biblicas_id_seq OWNED BY public.bases_biblicas.id;


--
-- Name: colaboradores_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaboradores_posts (
    id integer NOT NULL,
    author integer NOT NULL,
    titulo character varying(100) NOT NULL,
    descripcion text,
    enlace character varying(200),
    codigo text,
    pais character varying(50),
    red_social character varying(100),
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.colaboradores_posts OWNER TO postgres;

--
-- Name: colaboradores_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colaboradores_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colaboradores_posts_id_seq OWNER TO postgres;

--
-- Name: colaboradores_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaboradores_posts_id_seq OWNED BY public.colaboradores_posts.id;


--
-- Name: devocionales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devocionales (
    id integer NOT NULL,
    contenido text NOT NULL
);


ALTER TABLE public.devocionales OWNER TO postgres;

--
-- Name: devocionales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devocionales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devocionales_id_seq OWNER TO postgres;

--
-- Name: devocionales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devocionales_id_seq OWNED BY public.devocionales.id;


--
-- Name: info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.info (
    id integer NOT NULL,
    seccion character varying(100) NOT NULL,
    contenido text NOT NULL
);


ALTER TABLE public.info OWNER TO postgres;

--
-- Name: info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.info_id_seq OWNER TO postgres;

--
-- Name: info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.info_id_seq OWNED BY public.info.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    author integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    info text,
    content text,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: temas_estudio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temas_estudio (
    id integer NOT NULL,
    subseccion character varying(100) NOT NULL,
    contenido text NOT NULL
);


ALTER TABLE public.temas_estudio OWNER TO postgres;

--
-- Name: temas_estudio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temas_estudio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temas_estudio_id_seq OWNER TO postgres;

--
-- Name: temas_estudio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temas_estudio_id_seq OWNED BY public.temas_estudio.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    password text NOT NULL,
    photo character varying(200),
    is_admin boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: bases_biblicas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bases_biblicas ALTER COLUMN id SET DEFAULT nextval('public.bases_biblicas_id_seq'::regclass);


--
-- Name: colaboradores_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_posts ALTER COLUMN id SET DEFAULT nextval('public.colaboradores_posts_id_seq'::regclass);


--
-- Name: devocionales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devocionales ALTER COLUMN id SET DEFAULT nextval('public.devocionales_id_seq'::regclass);


--
-- Name: info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.info ALTER COLUMN id SET DEFAULT nextval('public.info_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: temas_estudio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_estudio ALTER COLUMN id SET DEFAULT nextval('public.temas_estudio_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
2d22691b0c21
\.


--
-- Data for Name: bases_biblicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bases_biblicas (id, subseccion, contenido) FROM stdin;
2	el_principio	<p>ALGUNAS DE LAS RAZÓN DE LA EXISTENCIA DE LA CREACIÓN&nbsp;</p><h4><strong>Para la gloria de Dios</strong></h4><ul><li><i>Salmos 19:1</i><br><i>"Los cielos cuentan la gloria de Dios, y el firmamento anuncia la obra de sus manos."</i></li><li><i>Isaías 43:7:</i><br><i>"A todos los llamados de mi nombre; para gloria mía los he creado, los formé y los hice."</i></li><li><i>Isaías 43:&nbsp;21&nbsp;A este pueblo lo he creado para mí, y este pueblo proclamará mis alabanzas.</i></li><li><i>Apocalipsis 4:11</i><br><i>"Señor, digno eres de recibir la gloria, la honra y el poder; porque tú&nbsp; creaste todas las cosas, y por tu voluntad existen y fueron creadas."</i></li></ul><h4><strong>Para demostrar el poder, sabiduría y bondad de Dios</strong></h4><p><a href="https://www.bible.com/es/bible/149/rom.1.20">Romanos 1:20 (RVR1960)</a></p><p>Porque las cosas invisibles de él, su eterno poder y deidad, se hacen claramente visibles desde la creación del mundo, siendo entendidas por medio de las cosas hechas, de modo que no tienen excusa.</p><p><a href="https://www.bible.com/es/bible/1782/rom.9.17">Romanos 9:17 (RVA2015)</a></p><p>Porque la Escritura dice al faraón: Para esto mismo te levanté, para mostrar en ti mi poder y para que mi nombre sea proclamado por toda la tierra .</p><p><a href="https://www.bible.com/es/bible/1782/1co.2.5">1 Corintios 2:5 (RVA2015)</a></p><p>para que su fe no esté fundada en la sabiduría de los hombres, sino en el poder de Dios.</p><p><a href="https://www.bible.com/es/bible/1782/1co.2.7">1 Corintios 2:7 (RVA2015)</a></p><p>Más bien, hablamos la sabiduría de Dios en misterio, la sabiduría oculta que Dios predestinó desde antes de los siglos para nuestra gloria.</p><p><a href="https://www.bible.com/es/bible/1782/eph.3.10">Efesios 3:10 (RVA2015)</a></p><p>Todo esto es para que ahora sea dada a conocer, por medio de la iglesia, la multiforme sabiduría de Dios a los principados y las autoridades en los lugares celestiales</p><p><strong>Tito 3:4-6&nbsp;</strong><a href="https://www.bible.com/es/bible/1782/eph.3.10">(RVA2015)</a> Pero cuando se manifestó la bondad de Dios nuestro Salvador y su amor por los hombres, él nos salvó, no por las obras de justicia que nosotros hubiéramos hecho, sino según su misericordia; por medio del lavamiento de la regeneración y de la renovación del Espíritu Santo que él derramó sobre nosotros abundantemente por medio de Jesucristo nuestro Salvador.&nbsp;</p><h4><strong>Relación y comunión del hombre con Dios</strong></h4><p>Tener un lugar donde poder vivir en paz y feliz; en comunión con Dios y su Santo Reino, disfrutando de todo cuanto tiene el hombre alrededor&nbsp;</p><p><a href="https://www.bible.com/es/bible/1782/gen.3.8">Génesis 3:8 (RVA2015)</a></p><p><i>Cuando oyeron la voz del SEÑOR Dios que se paseaba por el jardín en la brisa del día, el hombre y su mujer se escondieron de la presencia del SEÑOR Dios entre los árboles del jardín.</i></p><p><a href="https://www.bible.com/es/bible/1782/rev.21.3">Apocalipsis 21:3 (RVA2015)</a></p><p><i>Oí una gran voz que procedía del trono diciendo: “He aquí el tabernáculo de Dios está con los hombres, y él habitará con ellos; y ellos serán su pueblo, y Dios mismo estará con ellos como su Dios.</i></p><p><a href="https://www.bible.com/es/bible/1782/isa.65.24">Isaías 65:24 (RVA2015)</a></p><p><i>Y sucederá que antes que llamen, yo responderé; y mientras estén hablando, yo los escucharé.</i></p><p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Dios quiere morar con el hombre y ser su Dios;&nbsp;</strong></p><p><strong>Deuteronomio 6:5 </strong>"Amarás al Señor tu Dios con todo tu corazón, con toda tu alma y con todas tus fuerzas."</p><p><i>¿Por qué?:&nbsp; porque es el único Dios verdadero y padre de nuestro gran Dios y salvador Jesucristo y somos su creación</i></p><p><a href="https://www.bible.com/es/bible/1782/1ti.1.17">1 Timoteo 1:17 (RVA2015)</a></p><p>Por tanto, al Rey de los siglos, al inmortal, invisible y único Dios , sean la honra y la gloria por los siglos de los siglos. Amén.</p><p><a href="https://www.bible.com/es/bible/1782/psa.116.5">Salmos 116:5 (RVA2015)</a></p><p>Clemente y justo es el SEÑOR; sí, misericordioso es nuestro Dios.</p><p><a href="https://www.bible.com/es/bible/1782/jhn.17.3">Juan 17:3 (RVA2015)</a></p><p>Y esta es la vida eterna: que te conozcan a ti, el único Dios verdadero, y a Jesucristo a quien tú has enviado.</p><p><a href="https://www.bible.com/es/bible/1782/psa.7.11">Salmos 7:11 (RVA2015)</a></p><p>Dios es el que juzga al justo; es un Dios que emite sentencia cada día.</p><h4><strong>Para ser parte del plan de salvación y redención de un nuevo reino&nbsp;</strong></h4><p><a href="https://www.bible.com/es/bible/1782/eph.2.10">Efesios 2:10 (RVA2015)</a></p><p>Porque somos hechura de Dios, creados en Cristo Jesús para hacer las buenas obras que Dios preparó de antemano para que anduviésemos en ellas.</p><p><a href="https://www.bible.com/es/bible/1782/col.2.2">Colosenses 2:2 (RVA2015)</a></p><p>para que unidos en amor, sus corazones sean reanimados hasta lograr toda la riqueza de la plena certidumbre de entendimiento, para conocer el misterio de Dios ; es decir,&nbsp;<strong>Cristo mismo.</strong></p><p><strong>1.pedro 1:&nbsp;18</strong>&nbsp;Ustedes saben que fueron rescatados de una vida sin sentido, la cual heredaron de sus padres; y que ese rescate no se pagó con cosas corruptibles, como el oro y la plata, 19&nbsp;sino con la sangre preciosa de Cristo, sin mancha y sin contaminación, como la de un cordero, 20&nbsp;que ya había sido destinado desde antes de que Dios creara el mundo, pero que se manifestó en estos últimos tiempos por amor a ustedes. 21 &nbsp;Por él ustedes creen en Dios, que fue quien lo resucitó de los muertos y lo ha glorificado, para que ustedes tengan puesta su fe y su esperanza en Dios.</p><p><a href="https://www.bible.com/es/bible/1782/jhn.3.5">Juan 3:5 (RVA2015)</a></p><p>Respondió Jesús: —De cierto, de cierto te digo que, a menos que nazca de agua y del Espíritu, uno no puede entrar en el reino de Dios.</p><p>💫<i>Lo que debe conocer un creyente acerca de DIOS para recibir a Cristo y entender un poco acerca del reino de Dios, para morar con Dios y ser su pueblo</i></p><p>&nbsp;</p><h4>&lt;&lt;El PECADO NOS APARTA DE DIOS&gt;&gt;</h4><p>Como se ha dado el pecado: <strong>El primer plan cayo porque el primer hombre pecó</strong></p><p><a href="https://www.bible.com/es/bible/1782/pro.6.23">Proverbios 6:23 (RVA2015)</a></p><p>Porque el mandamiento es antorcha y la instrucción es luz. Y las reprensiones de la disciplina son camino de vida.</p><p><a href="https://www.bible.com/es/bible/1782/rom.7.8">Romanos 7:8 (RVA2015)</a></p><p>Pero el pecado, tomando ocasión en el mandamiento, produjo en mí toda codicia; porque sin la ley el pecado está muerto.</p><p>💫<i>En el principio todo estaba desordenado y vacío y Dios le dio vida al primer hombre ADÁN. Desde siempre ha existido la maldad y el pecado pero el hombre no había sido inculpado de pecado porque no había ley</i></p><p><strong>Romanos 5: 12</strong>&nbsp;Por tanto, como el pecado entró en el mundo por un solo hombre, y por medio del pecado entró la muerte, así la muerte pasó a todos los hombres, por cuanto todos pecaron. 13&nbsp;Antes de la ley ya había pecado en el mundo, aunque el pecado no se toma en cuenta cuando no hay ley. 14&nbsp;No obstante, la muerte reinó desde Adán hasta Moisés, aun para aquellos que no pecaron del mismo modo que Adán,&nbsp;el cual es figura de aquel que había de venir.</p><p>💫<i>Nuevamente vino oscuridad y aumentó la maldad y todo fue destruido por agua excepto Noe&nbsp;y los suyos del cual Dios tuvo misericordia. Ahora tenemos la oportunidad de volver a tener una nueva tierra y un nuevo cielo y tener vida en abundancia&nbsp;</i></p><p>&nbsp;</p><p><a href="https://www.bible.com/es/bible/146/hos.6.7">Oseas 6:7 (RVC)</a></p><p>»Pero ellos, como antes Adán, no respetaron mi pacto, sino que pecaron contra mí.</p><p><strong>1 corintios 15: 45</strong>&nbsp;Así también está escrito: «El primer hombre, Adán, se convirtió en un ser con vida»; y el postrer Adán, un espíritu que da vida.</p><p><strong>1 Pedro 1: 18</strong>&nbsp;Ustedes saben que fueron rescatados de una vida sin sentido, la cual heredaron de sus padres; y que ese rescate no se pagó con cosas corruptibles, como el oro y la plata, 19&nbsp;sino con la sangre preciosa de Cristo, sin mancha y sin contaminación, como la de un cordero, 20&nbsp;que ya había sido destinado desde antes de que Dios creara el mundo, pero que se manifestó en estos últimos tiempos por amor a ustedes.</p><p><strong>Jeremías 4: 22</strong>&nbsp;«Y es que mi pueblo es necio, y no me conoce; son gente que no piensa ni entiende; son sabios para hacer el mal, pero no saben hacer el bien.» 23&nbsp;Me fijé en la tierra, y la vi desordenada y vacía. Me fijé en los cielos, y no había en ellos luz. 24&nbsp;Me fijé en los montes, y los vi temblar, y todas las colinas se estremecían. 25&nbsp;Me fijé, y no había un solo ser humano, y todas las aves del cielo habían desaparecido.</p><p><a href="https://www.bible.com/es/bible/146/gen.5.5">Génesis 5:5 (RVC)</a></p><p>Y todos los días que Adán vivió fueron novecientos treinta años. Entonces murió.</p><p><a href="https://www.bible.com/es/bible/146/gen.6.3">Génesis 6:3 (RVC)</a></p><p>Y el Señor dijo: «No va a estar mi espíritu peleando siempre con el hombre, pues él no es más que carne.&nbsp;Vivirá hasta ciento veinte años.»</p><p>5&nbsp;El Señor vio que era mucha la maldad de los hombres en la tierra, y que todos los planes y pensamientos de su corazón eran siempre los de hacer solo el mal.</p>
3	Sermones	<h4><strong>TITULO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LINK</strong></h4><h4>VENCEDORES: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href="https://vencedores-en-cristo-xzic7l0.gamma.site/">https://vencedores-en-cristo-xzic7l0.gamma.site/</a></h4>
4	la_promesa	<p>LA VIDA ETERNA CIELO NUEVO Y TIERRA NUEVA</p><h4><a href="https://www.bible.com/es/bible/146/isa.65.22">Isaías 65:22 (RVC)</a></h4><p>No volverán a edificar casas para que otro las habite, ni plantarán nada para que otros se coman los frutos. La vida de mi pueblo será semejante a la vida de los árboles; mis elegidos disfrutarán del trabajo de sus manos.</p><h4><a href="https://www.bible.com/es/bible/1782/1jn.2.25">1 Juan 2:25 (RVA2015)</a></h4><p>Y esta es la promesa que él nos ha hecho: la vida eterna.</p><h4><a href="https://www.bible.com/es/bible/1782/rev.21.3">Apocalipsis 21:3 (RVA2015)</a></h4><p>Oí una gran voz que procedía del trono diciendo: “He aquí el tabernáculo de Dios está con los hombres, y él habitará con ellos; y ellos serán su pueblo, y Dios mismo estará con ellos como su Dios.</p><h3><strong>Una promesa llena de propósito</strong></h3><p>Para honrar a Dios y padre y a su unigénito hijo en espíritu y en verdad</p><p>El plan de Dios</p><ol><li>Conceder su gracia para la&nbsp; salvación por medio de la fe en Cristo Jesús</li><li>tener un reino y sacerdotes&nbsp;</li><li>que vivamos en santidad</li><li>morar con el hombre y ser su Dios&nbsp;</li></ol><p>&nbsp;</p><blockquote><p><strong>1 Tesalonicenses 4:4</strong> que cada uno de ustedes sepa tener su propio cuerpo en santidad y honor,&nbsp;</p><p><strong>1 Tesalonicenses 4:7</strong> Pues Dios no nos ha llamado a vivir en la inmundicia, sino a vivir en santidad. '</p><p><strong>Oseas 11:7</strong> Mi pueblo insiste en rebelarse contra mí; me llaman el Dios altísimo, pero ninguno de ellos me quiere enaltecer. '</p></blockquote>
5	el_evangelio	<p>La buena noticia, la buena nueva</p><h4><a href="https://www.bible.com/es/bible/176/jhn.3.16">Juan 3:16 (TLA)</a></h4><p>»Dios amó tanto a la gente de este mundo, que me entregó a mí, que soy su único Hijo, p<strong>ara que todo el que crea en mí no muera, sino que tenga vida eterna.</strong> 17&nbsp;Porque Dios no me envió a este mundo para condenar a la gente, sino para salvarla .</p><h4><a href="https://www.bible.com/es/bible/176/jhn.1.12">Juan 1:12 (TLA)</a></h4><p>Pero aquellos que la aceptaron y creyeron en ella, llegaron a ser hijos de Dios.&nbsp;13&nbsp;Son hijos de Dios por voluntad divina, no por voluntad humana.</p><blockquote><p><strong>1 Pedro 1:25</strong> pero la palabra del Señor permanece para siempre.» Y esa Palabra es la buena noticia que el Señor Jesucristo les ha enseñado.</p></blockquote><h4><a href="https://www.bible.com/es/bible/1782/eph.6.15">Efesios 6:15 (RVA 2015)</a></h4><p>y calzados sus pies con la preparación para proclamar el evangelio de paz.</p><blockquote><p><strong>Gálatas 1:7-8</strong> No es que haya otro evangelio, sino que hay algunos que los perturban y quieren pervertir el evangelio de Cristo. Pero aun si nosotros mismos o un ángel del cielo les anunciara un evangelio diferente del que les hemos anunciado, sea anatema.&nbsp;</p></blockquote><p>&nbsp;</p><h4><a href="https://www.bible.com/es/bible/176/mrk.16.15">Marcos 16:15 (TLA)</a></h4><p>Jesús les dijo: «Vayan por todos los países del mundo y anuncien las buenas noticias a todo el mundo.&nbsp;<a href="https://www.bible.com/es/bible/176/mrk.16.16">16</a> Los que crean en mí y se bauticen , serán salvos . Pero a los que no crean en mí, yo los voy a rechazar.&nbsp;<a href="https://www.bible.com/es/bible/176/mrk.16.17">17</a> Los que confíen en mí y usen mi nombre podrán hacer cosas maravillosas: Podrán expulsar demonios ; podrán hablar idiomas nuevos y extraños;&nbsp;<a href="https://www.bible.com/es/bible/176/mrk.16.18">18</a> podrán agarrar serpientes o beber algo venenoso, y nada les pasará. Además, pondrán las manos sobre los enfermos y los sanarán.»&nbsp;<a href="https://www.bible.com/es/bible/176/mrk.16.19">19&nbsp;</a>Cuando el Señor Jesús terminó de hablar con sus discípulos , Dios lo subió al cielo. Allí, Jesús se sentó en el lugar de honor, al lado derecho de Dios.</p><h4><a href="https://www.bible.com/es/bible/176/2co.4.3">2 Corintios 4:3 (TLA)</a></h4><p>Los únicos que no pueden entender la buena noticia que anunciamos son los que no se salvarán .&nbsp;<a href="https://www.bible.com/es/bible/176/2co.4.4">4&nbsp;</a>La buena noticia nos habla de la grandeza de Cristo , y Cristo a su vez nos muestra la grandeza de Dios. Ese mensaje brilla como la luz; pero los que no creen no pueden verla, porque Satanás no los deja.&nbsp;<a href="https://www.bible.com/es/bible/176/2co.4.5">5</a> Y nosotros no nos anunciamos a nosotros mismos. Al contrario, anunciamos que Jesucristo es nuestro Señor, y que nosotros somos servidores de ustedes porque somos seguidores de Jesucristo.&nbsp;<a href="https://www.bible.com/es/bible/176/2co.4.6">6&nbsp;</a>Cuando Dios creó el mundo, dijo: «Que brille la luz donde ahora hay oscuridad». Y cuando nos permitió entender la buena noticia, también iluminó nuestro entendimiento, para que por medio de Cristo conociéramos su grandeza.</p><h4><a href="https://www.bible.com/es/bible/176/rom.1.17">Romanos 1:17 (TLA)</a></h4><p>La buena noticia nos enseña que Dios acepta a los que creen en Jesús. Como dice la Biblia : «Aquellos a quienes Dios ha aceptado, y confían en él, vivirán para siempre.»</p><h4><a href="https://www.bible.com/es/bible/176/1co.15.3">1 Corintios 15:3-12 (TLA)</a> &nbsp;</h4><p>'Lo primero que les enseñé fue lo mismo que yo aprendí: que Cristo murió en lugar de nosotros, que éramos pecadores . Tal como lo enseña la Biblia , fue sepultado y, después de tres días, Dios lo resucitó . Primero se le apareció a Pedro, y después a los doce apóstoles . Luego se les apareció a más de quinientos de sus seguidores a la vez. Algunos de ellos todavía viven, y otros ya murieron. Más tarde se apareció a Santiago, y luego a todos los apóstoles. Por último, se me apareció a mí; a pesar de que lo conocí mucho tiempo después que los otros apóstoles. Por eso me considero el menos importante de los apóstoles, y ni siquiera merezco que la gente me llame así, pues le hice mucho daño a la iglesia de Dios. Sin embargo, Dios fue bueno conmigo, y por eso soy apóstol. No desprecié el poder especial que me dio, y trabajé más que los otros apóstoles; aunque en realidad todo lo hice gracias a ese poder especial de Dios. Pero ni yo ni los otros apóstoles importamos. Lo que sí importa es que todos nosotros hemos anunciado esa buena noticia, y que ustedes han creído en ella.&nbsp;</p><h3><a href="https://www.bible.com/es/bible/176/eph.2.19">Efesios 2:19 (TLA)</a></h3><p>Por eso, ante Dios ustedes ya no son extranjeros. Al contrario, ahora forman parte de su pueblo y tienen todos los derechos; ahora son de la familia de Dios.&nbsp;<a href="https://www.bible.com/es/bible/176/eph.2.20">20</a> Todos los miembros de la iglesia son como un edificio, el cual está construido sobre la enseñanza de los apóstoles y los profetas . En ese edificio Jesucristo es la piedra principal.</p><p>&nbsp;</p><h3><strong>Historia del pueblo elegido y su rechazo al espíritu Santo en el discurso de Esteban</strong></h3><h3><a href="https://www.bible.com/es/bible/176/act.7.2">Hechos 7:2 (TLA)</a></h3><p>2Y Esteban respondió:</p><p>—Amigos israelitas y líderes del país, escúchenme: Nuestro poderoso Dios se le apareció a nuestro antepasado Abraham en Mesopotamia, antes de que fuera a vivir en el pueblo de Harán,&nbsp;3y le dijo: “Deja a tu pueblo y a tus familiares, y vete al lugar que te voy a mostrar.”</p><p>4»Abraham salió del país de Caldea y se fue a vivir al pueblo de Harán. Tiempo después murió su padre, y Dios hizo que Abraham viniera a este lugar, donde ustedes viven ahora.&nbsp;5&nbsp;Aunque Abraham vivió aquí, Dios nunca le permitió ser dueño ni del pedazo de tierra que tenía bajo sus pies. Sin embargo, le prometió a Abraham que le daría este territorio a sus descendientes después de que él muriera.</p><p>»Cuando Dios le hizo esa promesa, Abraham no tenía hijos.&nbsp;6&nbsp;Dios le dijo: “Tus descendientes vivirán como extranjeros en otro país. Allí serán esclavos, y durante cuatrocientos años los tratarán muy mal.&nbsp;7&nbsp;Pero yo castigaré a los habitantes de ese país, y tus descendientes saldrán libres y me adorarán en este lugar.”</p><p>8»<strong>Con esta promesa, Dios hizo un pacto con Abraham</strong>. Le ordenó que, a partir de ese día, todos los hombres israelitas debían circuncidarse para indicar que Dios los aceptaba como parte de su pueblo. Por eso, cuando nació su hijo Isaac, Abraham esperó ocho días y lo circuncidó. De la misma manera, Isaac circuncidó a su hijo Jacob, y Jacob a sus doce hijos.</p><p>9»José fue uno de los doce hijos de Jacob. Como sus hermanos le tenían envidia, lo vendieron como esclavo a unos comerciantes, que lo llevaron a Egipto. Sin embargo, Dios amaba a José,&nbsp;10&nbsp;así que lo ayudó en todos sus problemas; le dio sabiduría y lo hizo una persona muy agradable. Por eso el rey de Egipto lo tomó en cuenta, y lo nombró gobernador de todo Egipto y jefe de su palacio.</p><p>11»Tiempo después, hubo pocas cosechas de trigo en toda la región de Egipto y de Canaán. Nuestros antepasados no tenían nada que comer, ni nada que comprar.&nbsp;12&nbsp;Pero Jacob se enteró de que en Egipto había bastante trigo, y envió a sus hijos para que compraran. Los hijos de Jacob fueron allá una primera vez.&nbsp;13&nbsp;Cuando fueron la segunda vez, José permitió que sus hermanos lo reconocieran. Así el rey de Egipto conoció más de cerca a la familia de José.</p><p>14»Al final, José ordenó que vinieran a Egipto su padre Jacob y todos sus familiares. Eran en total setenta y cinco personas,&nbsp;15&nbsp;que vivieron en Egipto hasta que murieron.&nbsp;16&nbsp;Todos ellos fueron enterrados en Siquem, en la misma tumba que Abraham había comprado a los hijos de Hamor.</p><p>17»Pasó el tiempo, y a Dios le pareció bien cumplir la promesa que le había hecho a Abraham. Mientras tanto, en Egipto, cada vez había más y más israelitas.</p><p>18»En Egipto comenzó a gobernar un nuevo rey, que no había oído hablar de José.&nbsp;19&nbsp;Este rey fue muy malo con los israelitas y los engañó. Además, los obligó a abandonar a los niños recién nacidos, para que murieran.</p><p>20<strong>»En ese tiempo nació Moisés.&nbsp;</strong>Era un niño muy hermoso, a quien sus padres cuidaron durante tres meses, sin que nadie se diera cuenta.&nbsp;21&nbsp;Luego tuvieron que abandonarlo, pero la hija del rey lo rescató y lo crió como si fuera su propio hijo.&nbsp;22&nbsp;Moisés recibió la mejor educación que se daba a los jóvenes egipcios, y llegó a ser un hombre muy importante por lo que decía y hacía.</p><p>23»Cuando Moisés tenía cuarenta años, decidió ir a visitar a los israelitas, porque eran de su propia nación.&nbsp;24&nbsp;De pronto, vio que un egipcio maltrataba a un israelita. Sin pensarlo mucho, defendió al israelita y mató al egipcio.</p><p>25»Moisés pensó que los israelitas entenderían que Dios los libraría de la esclavitud por medio de él. Pero ellos no pensaron lo mismo.&nbsp;26&nbsp;Al día siguiente, Moisés vio que dos israelitas se estaban peleando. Trató de calmarlos y les dijo: “Ustedes son de la misma nación. ¿Por qué se pelean?”</p><p>27»Pero el que estaba maltratando al otro se dio vuelta, empujó a Moisés y le respondió: “¡Y a ti qué te importa! ¿Quién te ha dicho que tú eres nuestro jefe o nuestro juez?&nbsp;28¿Acaso piensas matarme como al egipcio?”</p><p>29»Al oír eso, Moisés huyó de Egipto tan pronto como pudo, y se fue a vivir a Madián. En ese país vivió como extranjero, y allí nacieron dos de sus hijos.</p><p>30»Pasaron cuarenta años. Pero un día en que Moisés estaba en el desierto, cerca del monte Sinaí,&nbsp;<strong>un ángel se le apareció entre un arbusto que ardía en llamas.</strong>&nbsp;31&nbsp;Moisés tuvo mucho miedo, pero se acercó para ver mejor lo que pasaba. Entonces Dios, con voz muy fuerte le dijo:&nbsp;32“Yo soy el Dios de tus antepasados. Soy el Dios de Abraham, de Isaac y de Jacob.”</p><p>»Moisés empezó a temblar, y ya no se atrevió a mirar más.&nbsp;33&nbsp;Pero Dios le dijo: “Quítate las sandalias, porque estás en mi presencia.&nbsp;34&nbsp;Yo sé muy bien que mi pueblo Israel sufre mucho, porque los egipcios lo han esclavizado. También he escuchado sus gritos pidiéndome ayuda. Por eso he venido a librarlos del poder egipcio. Así que prepárate, pues voy a mandarte a Egipto.”</p><p>35»Los israelitas rechazaron a Moisés, y le dijeron: “¿Quién te ha dicho que tú eres nuestro jefe o nuestro juez?” Pero Dios mismo lo convirtió en jefe y libertador de su pueblo.&nbsp;<strong>Esto lo hizo por medio del ángel que se le apareció a Moisés en el arbusto.</strong></p><p>36»Con milagros y señales maravillosas, Moisés sacó de Egipto a su pueblo. Lo llevó a través del Mar de los Juncos, y durante cuarenta años lo guio por el desierto.&nbsp;37&nbsp;Y fue Moisés mismo quien les anunció a los israelitas:&nbsp;<strong>“Dios elegirá a uno de nuestro pueblo, para que sea un profeta como yo.”</strong></p><p>38»Moisés estuvo con nuestros antepasados en el desierto, y les comunicó todos los mensajes&nbsp;<strong>que el ángel de Dios le dio en el monte Sinaí.</strong> Esos mensajes son palabras que dan vida.</p><p>39»Pero los israelitas fueron rebeldes. No quisieron obedecer a Moisés y, en cambio, deseaban volver a Egipto.</p><p>40»Un día, los israelitas le dijeron a Aarón, el hermano de Moisés: “Moisés nos sacó de Egipto, pero ahora no sabemos qué le sucedió. Es mejor que nos hagas un dios, para que sea nuestro guía y protector.”</p><p>41»Hicieron entonces una estatua con forma de toro, y sacrificaron animales para adorarla. Luego hicieron una gran fiesta en honor de la estatua, y estaban muy orgullosos de lo que habían hecho.&nbsp;42&nbsp;Por eso Dios decidió olvidarse de ellos, pues se pusieron a adorar a las estrellas del cielo.</p><p>»En el libro del profeta Amós dice: “Pueblo de Israel, durante los cuarenta años que anduvieron por el desierto, ustedes nunca me presentaron ofrendas para adorarme.&nbsp;43&nbsp;En cambio, llevaron en sus hombros la tienda con el altar del dios Moloc y la imagen de la estrella del dios Refán. Ustedes se hicieron esos ídolos y los adoraron. Por eso, yo haré que a ustedes se los lleven lejos, más allá de Babilonia.”</p><p>44»Allí, en el desierto, nuestros antepasados tenían el santuario del pacto, que Moisés construyó según el modelo que Dios le había mostrado.&nbsp;45&nbsp;El santuario pasó de padres a hijos, hasta el tiempo en que Josué llegó a ser el nuevo jefe de Israel. Entonces los israelitas llevaron consigo el santuario para ocupar el territorio que Dios estaba quitándoles a otros pueblos.&nbsp;<strong>Y el santuario estuvo allí hasta el tiempo del rey David.</strong></p><p>46»Como Dios quería mucho a David, este le pidió permiso para construirle un templo donde el pueblo de Israel pudiera adorarlo.&nbsp;47&nbsp;Sin embargo, fue su hijo Salomón quien se lo construyó.</p><p>48»Pero como el Dios todopoderoso no vive en lugares hechos por seres humanos, dijo por medio de un profeta:</p><p>49“El cielo es mi trono;</p><p>sobre la tierra apoyo mis pies.</p><p>Nadie puede hacerme una casa</p><p>donde pueda descansar.</p><p>50Yo hice todo lo que existe.”»</p><p>51&nbsp;Antes de terminar su discurso, Esteban les dijo a los de la Junta Suprema:</p><p>—¡Ustedes son muy tercos! ¡No entienden el mensaje de Dios! Son igual que sus antepasados. Siempre han desobedecido al Espíritu Santo.&nbsp;52&nbsp;Ellos trataron mal a todos los profetas, y mataron a los que habían anunciado la venida de Jesús, el Mesías, al que ustedes traicionaron y mataron.&nbsp;53&nbsp;Por medio de los ángeles, todos ustedes recibieron la Ley de Dios, pero no la han obedecido.</p><p>&nbsp;</p>
1	el_fin	<h4><a href="https://www.bible.com/es/bible/176/luk.21.19">Lucas 21:19 (TLA)</a></h4><p>Si ustedes se mantienen firmes hasta el fin, se salvarán .</p><h4><a href="https://www.bible.com/es/bible/176/rev.22.13">Apocalipsis 22:13 (TLA)</a></h4><p>Yo soy el principio y el fin, el primero y el último.»</p><h4><a href="https://www.bible.com/es/bible/176/mat.28.20">Mateo 28:20 (TLA)</a></h4><p>Enséñenles a obedecer todo lo que yo les he enseñado. Yo estaré siempre con ustedes, hasta el fin del mundo.»</p><h4><a href="https://www.bible.com/es/bible/176/luk.21.9">Lucas 21:9 (TLA)</a></h4><p>Ustedes oirán que hay guerras y revoluciones en algunos países, pero no se asusten. Esas cosas pasarán, pero todavía no será el fin del mundo.</p>
\.


--
-- Data for Name: colaboradores_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colaboradores_posts (id, author, titulo, descripcion, enlace, codigo, pais, red_social, created) FROM stdin;
1	2	Carta a Tito	Pablo escribe a Tito deberes y recomendaciones para diversos temas de la fe. Comienza hablando de la institución de presbíteros, detallando las características que éstos hombres de Dios deben mostrar. Advierte contra los falsos doctores y detalla algunos deberes propios de los fieles. Pablo argumenta estas exigencias con un dogma de fe. Detalla deberes generales para todos los fieles y aconseja a Tito en temas particulares... Hoy leemos Apocalipsis 4-7; Tito 1-3; Proverbios 31:10-15.\r\nA partir de enero del 2023, Fray Sergio Serrano, OP leerá toda la Biblia en 365 episodios. Además compartirá reflexiones y comentarios para ir conociendo más la Palabra de Dios al caminar por la Historia de la Salvación.\r\n\r\n y el plan de lectura.\r\n\r\nUn poco más de , la Biblia que seguirá el podcast de La Biblia en un Año:\r\n\r\nCodificación de colores para fácil referencia: Usa el famoso Sistema de Aprendizaje de la Cronología de la Biblia de The Great Adventure (“The Bible Timeline” ®️) creado por Jeff Cavins,  experto en Sagradas Escrituras, y que es utilizado por cientos de miles de católicos para aprender a leer la Biblia.\r\nArtículos que te ayudan a comprender el panorama completo de la Historia de la Salvación.\r\nRecuadros con eventos clave que ayudan a identificar los puntos importantes en la Biblia.\r\nCuadros detallados que ofrecen la visión panorámica de los personajes y eventos clave, las alianzas importantes, mapas y el contexto histórico.\r\nMapas a todo color que ayudan a visualizar los lugares donde sucedieron las historias bíblicas.		<iframe style="border-radius:12px" src="https://open.spotify.com/embed/episode/4scisSJutySWuePez1myeE?utm_source=generator" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>	Mexico	https://www.instagram.com/accounts/login/	2025-01-13 21:25:24.128444
3	1	¡No lo arruines! 	No améis al mundo ni las cosas que están en el mundo		<iframe width="560" height="315" src="https://www.youtube.com/embed/2QxHBJiyrQ0?si=aTzyOUfC4y2aDC-K" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>	Colombia	https://www.facebook.com/iglesiafiladelfiajv/	2025-01-15 21:23:31.672335
5	1	El Discipulado Radical Verdadero y Transformador	Descubre el significado profundo del discipulado genuino y lo que implica un compromiso completo con Cristo. Aprende a vivir una fe auténtica que transforma vidas y sigue los pasos de Jesús con entrega total. ¡No te pierdas este mensaje que renovará tu caminar espiritual!	https://www.josueyrion.org/	<iframe width="560" height="315" src="https://www.youtube.com/embed/ApdT7F4VNpM?si=Ky4qGLALYP4zq1Jt" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>	United States	https://www.instagram.com/josueyrionoficial/?hl=es	2025-01-23 21:50:56.826852
\.


--
-- Data for Name: devocionales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devocionales (id, contenido) FROM stdin;
1	<h2><strong>Resultados de la justificación</strong></h2><p>1 Así, pues, justificados por la fe tenemos paz con Dios por medio de nuestro Señor Jesucristo,</p><p>2 por quien tenemos también, por la fe, acceso a esta gracia en la cual estamos firmes, y nos regocijamos en la esperanza de la gloria de Dios.</p><p>3 Y no solo esto, sino que también nos regocijamos en los sufrimientos, porque sabemos que los sufrimientos producen resistencia,</p><ol><li><i>4la resistencia produce un carácter aprobado, y el carácter aprobado produce esperanza.</i></li><li><i>5Y esta esperanza no nos defrauda, porque Dios ha derramado su amor en nuestro corazón por el Espíritu Santo que nos ha dado.</i></li><li><i>6Porque a su debido tiempo, cuando aún éramos débiles, Cristo murió por los pecadores.</i></li><li><i>7Es difícil que alguien muera por un justo, aunque tal vez haya quien se atreva a morir por una persona buena.</i></li></ol><p>8 Pero Dios muestra su amor por nosotros en que, cuando aún éramos pecadores, Cristo murió por nosotros.</p><p>9 Con mucha más razón, ahora que ya hemos sido justificados en su sangre, seremos salvados del castigo por medio de él.</p><p>10 Porque, si cuando éramos enemigos de Dios fuimos reconciliados con él mediante la muerte de su Hijo, mucho más ahora, que estamos reconciliados, seremos salvados por su vida.</p><p>11 Y no solo esto, sino que también nos regocijamos en Dios por nuestro Señor Jesucristo, por quien ahora hemos recibido la reconciliación.&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
\.


--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.info (id, seccion, contenido) FROM stdin;
2	politicas_y_privacidad	<h3>Plataforma de contenido Cristiano Vino y Aceite</h3><p><i>Última actualización: [20/12/2024]</i></p><h4>1. Información que recopilamos</h4><p>Recopilamos información personal como nombre, correo electrónico y otra información necesaria para proporcionarle los servicios en nuestra plataforma, como suscripciones a newsletters o acceso a contenido exclusivo.</p><h4>2. Uso de la información</h4><p>La información que recopilamos se utiliza para:</p><p>Personalizar su experiencia en la plataforma.<br>Enviar comunicaciones relevantes relacionadas con el contenido cristiano.<br>Mejorar nuestros servicios y ofrecerle contenido más adecuado a sus intereses.</p><h4><br>3. Protección de la información</h4><p>Implementamos medidas de seguridad para proteger su información personal, pero le advertimos que ninguna transmisión de datos por internet es completamente segura. Nos comprometemos a proteger su privacidad y a utilizar sus datos solo para los fines establecidos.</p><h4>4. Uso de terceros</h4><p>No compartimos ni vendemos su información personal a terceros, excepto cuando sea necesario para cumplir con las leyes o para prestar los servicios ofrecidos en nuestra plataforma (por ejemplo, servicios de procesamiento de pagos).</p><h4><br>5. Derechos del usuario</h4><p>Usted tiene derecho a acceder, corregir o eliminar su información personal. Si desea ejercer alguno de estos derechos, puede contactarnos a través de [correo de contacto].</p><blockquote><h4>Cambios en la política</h4><p>Nos reservamos el derecho de actualizar esta Política de Privacidad en cualquier momento. Cualquier cambio será comunicado a través de la plataforma.</p></blockquote>
1	terminos_y_condiciones	<h3>Plataforma de contenido Cristiano Vino y Aceite</h3><p><i>Última actualización: [05/12/2024]</i></p><h4>1. Aceptación de los términos</h4><p>Al acceder o utilizar la plataforma digital "Vino y Aceite", usted acepta cumplir con estos Términos y Condiciones, así como con todas las leyes y regulaciones aplicables. Si no está de acuerdo con alguno de estos términos, le pedimos que no utilice nuestra plataforma.</p><h4>2. Uso de la plataforma</h4><p>La plataforma "Vino y Aceite" es un sitio digital destinado a compartir la palabra de Dios a través de enseñanzas, devocionales, predicas, estudios bíblicos y otros contenidos relacionados con la fe cristiana. Acepta que solo utilizará la plataforma para fines cristianos y en conformidad con nuestra misión y creencias.</p><h4>3. Conducta de los usuarios</h4><p>El usuario se compromete a no publicar ni distribuir contenido inapropiado, ofensivo, blasfemo, vulgar, discriminatorio, o que no esté relacionado con la enseñanza cristiana. Los comentarios y publicaciones deben ser respetuosos, edificantes y enfocados en el mensaje de la palabra de Dios.</p><p>Queda estrictamente prohibido el uso de lenguaje vulgar, insultante o cualquier contenido que no sea de carácter cristiano. En caso de violación de este reglamento, el usuario podrá ser expulsado o bloqueado de la plataforma sin previo aviso.</p><h4>4. Propiedad intelectual</h4><p>Todo el contenido de la plataforma, incluidos los textos, imágenes, videos, devocionales, estudios bíblicos, predicas, y demás materiales relacionados, son propiedad de Vino y Aceite o sus respectivos autores. No está permitido reproducir, distribuir, modificar o usar estos materiales sin autorización expresa.</p><h4>5. Modificación de los términos</h4><p>Vino y Aceite se reserva el derecho de modificar estos Términos y Condiciones en cualquier momento. Cualquier cambio será comunicado a través de la plataforma y entrará en vigencia inmediatamente después de su publicación.</p><h4>6. Responsabilidad</h4><p>La plataforma "Vino y Aceite" no se hace responsable por daños derivados del uso inadecuado de sus servicios ni por el contenido generado por los usuarios.</p><blockquote><h4>Contacto</h4><p>Para cualquier duda sobre estos Términos y Condiciones, puede contactarnos a través de [operadorpersonal0@gmail.com].</p></blockquote>
3	cookies	<h3>Plataforma de contenido Cristiano Vino y Aceite</h3><p><i>Última actualización: [20/12/2024]</i></p><h4>1. ¿Qué son las cookies?</h4><p>Las cookies son pequeños archivos de texto que se almacenan en su dispositivo cuando visita nuestra plataforma. Se utilizan para mejorar la experiencia del usuario y para proporcionar información sobre el uso de la plataforma.</p><h4>2. ¿Por qué usamos cookies?</h4><p>Usamos cookies para:</p><p>Mejorar la funcionalidad de nuestra plataforma.<br>Realizar análisis de tráfico y mejorar el contenido que ofrecemos.<br>Personalizar la experiencia de navegación y recordar sus preferencias.<br>&nbsp;</p><h4>3. Tipos de cookies que usamos</h4><p>Cookies necesarias: Son esenciales para el funcionamiento básico de la plataforma.<br>Cookies de análisis: Nos permiten entender cómo los usuarios interactúan con la plataforma para mejorar nuestros servicios.<br>Cookies de funcionalidad: Ayudan a personalizar su experiencia, como recordar su idioma preferido.</p><h4><br>4. Cómo gestionar las cookies</h4><p>Usted puede gestionar las cookies a través de la configuración de su navegador. Sin embargo, si desactiva las cookies, algunas funciones de la plataforma podrían no estar disponibles o funcionar de manera incorrecta.</p><h4>5. Cambios en la política de cookies</h4><p>Nos reservamos el derecho de actualizar nuestra Política de Cookies en cualquier momento. Cualquier cambio será comunicado a través de la plataforma.</p><blockquote><p>Cookies</p><p>Al utilizar nuestra plataforma, usted acepta el uso de cookies. Las cookies nos permiten mejorar su experiencia en la plataforma y realizar análisis de tráfico web.</p></blockquote>
4	about	<h3>Plataforma de contenido Cristiano Vino y Aceite</h3><p>Vino y Aceite es una plataforma digital cristiana que se dedica a compartir la palabra de Dios a través de enseñanzas, devocionales, predicas, estudios bíblicos y otros contenidos cristianos. Nuestra misión es llevar el mensaje del Evangelio a cada rincón del mundo, proporcionando contenido edificante y accesible para todos aquellos que desean aprender más sobre la fe cristiana.</p><p>Somos un grupo de cristianos comprometidos en seguir los principios enseñados por Jesucristo. Creemos que Jesús es el Hijo de Dios, nuestro Salvador, y que a través de Él podemos alcanzar la salvación eterna. Creemos en el Espíritu Santo, quien fue enviado como consolador y guía, para ayudarnos a vivir conforme a la voluntad de Dios y declarar toda la verdad contenida en la palabra de Dios.</p><p>Nuestra plataforma busca ser un lugar de crecimiento espiritual, donde los creyentes puedan fortalecer su fe, aprender más sobre la Biblia y compartir experiencias con otros cristianos. Creemos que la palabra de Dios tiene poder y vida, como Jesús mismo lo dijo: "La palabra que yo os he hablado es espíritu y es vida" (Juan 6:63).</p><p>&nbsp;</p><h4>Misión:&nbsp;</h4><p>Compartir el mensaje de la salvación y el amor de Cristo, y fomentar el crecimiento espiritual a través de recursos bíblicos accesibles y relevantes.</p><h4>Visión:&nbsp;</h4><p>Ser una plataforma líder en el ámbito cristiano digital, ofreciendo contenido que edifique y transforme la vida de las personas a través de la palabra de Dios.</p><h4>Valores:</h4><p>Fe: Nuestra fe en Jesús como el único Salvador es el fundamento de todo lo que hacemos.<br>Compromiso: Nos comprometemos a vivir y enseñar los principios de la palabra de Dios.<br>Integridad: Actuamos con honestidad y transparencia en todo momento.<br>Amor: Tratamos a todos con el amor de Cristo, sin importar su trasfondo.</p><blockquote><h4><i>Gracias por ser parte de nuestra comunidad en Vino y Aceite. ¡Que Dios les bendiga abundantemente!</i><br>&nbsp;</h4></blockquote>
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, author, url, title, info, content, created) FROM stdin;
3	1	Bautismo-conocimiento-1	Bautismo Conocimiento Elemental	Los conocimientos básicos acerca del bautismo	<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#000000"><strong>Romanos 6:3-4</strong></span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#000000">: &quot;&iquest;O no sab&eacute;is que todos los que hemos sido</span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#000000"><strong> </strong></span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#0000ff"><strong>bautizados en Cristo Jes&uacute;s</strong></span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#000000"><strong>,</strong></span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#000000"> </span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#ff9900"><strong>hemos sido bautizados en su muerte</strong></span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#000000"><strong>? </strong></span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#000000">Porque somos sepultados juntamente con &eacute;l para muerte por el bautismo, a fin de que como Cristo resucit&oacute; de los muertos por la </span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#674ea7"><strong>gloria del Padre</strong></span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#000000">, as&iacute; tambi&eacute;n nosotros andemos en vida nueva.&quot;</span></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#0000ff"><span style="background-color:#fff2cc"><strong>Nota</strong></span></span></span></span><span style="font-size:11pt"><span style="font-family:Arial,sans-serif"><span style="color:#ff0000"><span style="background-color:#fff2cc">: nos bautizamos en Critos en su muerte cuando reconocemos a cristo como se&ntilde;or y salvador y creen y guardamos su palabra..&nbsp; y somos salvos por medio de la resurrecci&oacute;n de cristo</span></span></span></span></p>\r\n\r\n<p>&nbsp;</p>\r\n	2024-10-24 22:41:24.144937
15	2	Debajodelsol	Lo que pasa debajo del Sol	Todo lo que ocurre debajo del sol es vanidad	<p><strong>Nada tiene sentido</strong></p>\r\n\r\n<p>2<em>&laquo;Nada tiene sentido &mdash;dice el Maestro&mdash;, &iexcl;ning&uacute;n sentido en absoluto!&raquo;.</em></p>\r\n\r\n<p>3&iquest;Qu&eacute; obtiene la gente con trabajar tanto bajo el sol?&nbsp;4Las generaciones van y vienen, pero la tierra nunca cambia.&nbsp;5El sol sale y se pone, y se apresura a dar toda la vuelta para volver a salir.&nbsp;6El viento sopla hacia el sur y luego gira hacia el norte. Da vueltas y vueltas soplando en c&iacute;rculos.&nbsp;7Los r&iacute;os desembocan en el mar, pero el mar nunca se llena. Luego el agua vuelve a los r&iacute;os y sale nuevamente al mar.&nbsp;8Todo es tan tedioso, imposible de describir. No importa cu&aacute;nto veamos, nunca quedamos satisfechos. No importa cu&aacute;nto oigamos, nada nos tiene contentos.</p>\r\n\r\n<p>9 La historia no hace m&aacute;s que repetirse; ya todo se hizo antes. No hay nada realmente nuevo bajo el sol.&nbsp;10A veces la gente dice: &laquo;&iexcl;Esto es algo nuevo!&raquo;; pero la verdad es que no lo es, nada es completamente nuevo.&nbsp;11Ninguno de nosotros recuerda lo que sucedi&oacute; en el pasado, y las generaciones futuras tampoco recordar&aacute;n lo que hacemos ahora.</p>\r\n	2025-01-11 00:21:48.876352
\.


--
-- Data for Name: temas_estudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temas_estudio (id, subseccion, contenido) FROM stdin;
2	parabolas	<figure class="table"><table><tbody><tr><td><strong>BALANZA:</strong></td><td>&nbsp;</td><td>PALABRA,</td><td>&nbsp;</td><td>LA PALABRA ES NUESTRO ESTANDAR PARA SER PESADOS;</td><td>&nbsp;</td><td>SE PESA: &nbsp;ACCIONES Y CORAZONES</td></tr></tbody></table></figure><figure class="table"><table><tbody><tr><td><strong>ACEITE DE OLIVA:</strong></td><td>&nbsp;</td><td>ACEITE DE LA &nbsp;UNCION PARA SANTIFICAR,</td><td>&nbsp;</td><td>&nbsp; UNCION DEL ESPIRITU SANTO</td></tr></tbody></table></figure>
1	sermones	<figure class="table"><table><tbody><tr><td><h3><strong>TITULO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></h3></td><td><h3><strong>LINK SERMON</strong></h3></td></tr></tbody></table></figure><h4>Vencedores &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<a href="https://vencedores-en-cristo-xzic7l0.gamma.site/">https://vencedores-en-cristo-xzic7l0.gamma.site/</a></h4>
3	creemos	<p>Creemos en el Padre el Hijo y el Espíritu Santo</p><p>&nbsp;</p><p>Creemos que <i><strong>Jesucristo</strong></i> es el Hijo de Dios y creemos en el Padre y en el Espíritu Santo la gran promesa enviada a nosotros para declararnos toda verdad</p><p>&nbsp;</p>
4	antiguo_pacto	<h3>1. <strong>El Pacto con Noé (Génesis 9)</strong></h3><p>Después del diluvio, Dios hizo un pacto con Noé y sus descendientes, simbolizado por el <strong>arco iris</strong>. Este pacto establece que Dios no destruiría la tierra de nuevo con agua.</p><ul><li><strong>Génesis 9:12-17</strong> (RVA 2015):</li></ul><blockquote><p>“12 Y dijo Dios: “Esta será la señal del pacto que establezco entre yo y ustedes, y todo ser viviente que está con ustedes, por generaciones, para siempre: 13 Yo pongo mi arco en las nubes como señal del pacto que hago entre yo y la tierra. 14 Y sucederá que cuando yo haga aparecer nubes sobre la tierra, entonces el arco se dejará ver en las nubes. 15 Me acordaré de mi pacto que existe entre yo y ustedes, y todo ser viviente de toda clase, y las aguas no serán más un diluvio para destruir toda carne. 16 Cuando el arco aparezca en las nubes, yo lo veré para acordarme del pacto perpetuo entre Dios y todo ser viviente de toda clase que está sobre la tierra”. 17 Entonces Dios dijo a Noé: “Esta será la señal del pacto que establezco entre yo y toda carne que está sobre la tierra”.”</p></blockquote><h3>2. <strong>El Pacto con Abraham (Génesis 12, 15, 17)</strong></h3><p>Dios hace un pacto con Abraham, prometiéndole que sería el padre de una gran nación. Esta promesa se cumple con el establecimiento del pueblo de Israel.</p><p><strong>Génesis 12:2-3</strong> (RVA 2015):</p><blockquote><p>"2 Yo haré de ti una gran nación. Te bendeciré y engrandeceré tu nombre, y serás bendición. 3 Bendeciré a los que te bendigan, y a los que te maldigan maldeciré. Y en ti serán benditas todas las familias de la tierra”."</p></blockquote><p><strong>Génesis 17:7-8</strong> (RVA 2015):</p><blockquote><p>“7 &nbsp;establezco mi pacto como pacto perpetuo entre tú y yo, y tu descendencia después de ti por sus generaciones, para ser tu Dios y el de tu descendencia después de ti. 8 Yo te daré en posesión perpetua, a ti y a tu descendencia después de ti, la tierra en que resides, toda la tierra de Canaán. Y yo seré su Dios.”</p></blockquote><h3>3. <strong>El Pacto con Moisés (Éxodo 19-24)</strong></h3><p>El <strong>Pacto Mosaico</strong> es uno de los más importantes en la historia de Israel, donde Dios da la <strong>Ley</strong> (incluyendo los <strong>Diez Mandamientos</strong>) al pueblo de Israel en el monte Sinaí. Este pacto tiene un enfoque muy claro: la obediencia a los mandamientos de Dios trae bendición, mientras que la desobediencia conlleva maldición.</p><p><strong>Éxodo 19:5-6</strong> (RVA 2015):</p><blockquote><p>"5 Ahora pues, si de veras escuchan mi voz y guardan mi pacto, serán para mí un pueblo especial entre todos los pueblos. Porque mía es toda la tierra, 6 y ustedes me serán un reino de sacerdotes y una nación santa”. Estas son las palabras que dirás a los hijos de Israel."</p></blockquote><p><strong>Éxodo 24:7-8</strong> (RVA 2015):</p><blockquote><p>“7 Asimismo, tomó el libro del pacto y lo leyó a oídos del pueblo, el cual dijo: —Haremos todas las cosas que el SEÑOR ha dicho, y obedeceremos. 8 Entonces Moisés tomó la sangre y roció con ella al pueblo, diciendo: —He aquí la sangre del pacto que el SEÑOR ha hecho con ustedes referente a todas estas palabras.”</p></blockquote><h3>4. <strong>El Pacto de la Ley (Deuteronomio 28)</strong></h3><p>Dios expone claramente las <strong>bendiciones</strong> y <strong>maldiciones</strong> que acompañan el pacto dado a través de Moisés. La obediencia trae bendiciones, y la desobediencia trae maldiciones.</p><p><strong>Deuteronomio 28:1-2</strong> (RVA 2015):</p><blockquote><p>"1 Y sucederá que si escuchas diligentemente la voz del SEÑOR tu Dios, procurando poner por obra todos sus mandamientos que yo te mando hoy, también el SEÑOR tu Dios te enaltecerá sobre todas las naciones de la tierra. 2 Cuando obedezcas la voz del SEÑOR tu Dios, vendrán sobre ti todas estas bendiciones, y te alcanzarán:"</p></blockquote><p><strong>Deuteronomio 28:15</strong> (RVA 2015):</p><blockquote><p>"15 Pero si no escuchas la voz del SEÑOR tu Dios a fin de procurar poner por obra todos sus mandamientos y sus estatutos que yo te mando hoy, todas estas maldiciones vendrán sobre ti y te alcanzarán:"</p></blockquote><h3>5. <strong>El Pacto Davídico (2 Samuel 7:8-16)</strong></h3><p>Dios hace un pacto con el rey David, prometiéndole que su descendencia reinará sobre Israel para siempre. Este pacto se refiere al <strong>Mesías</strong> que vendría de la línea de David.</p><ul><li><strong>2 Samuel 7:16</strong> (RVA 2015):</li></ul><blockquote><p>"6 Tu casa y tu reino serán firmes para siempre delante de mí, y tu trono será estable para siempre."</p></blockquote>
5	nuevo_pacto	<h3>6. <strong>El Nuevo Pacto (Jeremías 31:31-34)</strong></h3><p>Aunque el Antiguo Pacto es central en el Antiguo Testamento, Dios promete un <strong>Nuevo Pacto</strong> que sería más completo y definitivo, escrito en los corazones de las personas y no en tablas de piedra.</p><ul><li><strong>Jeremías 31:31-34</strong> (RVA 2015):</li></ul><blockquote><p>"31 He aquí vienen días, dice el SEÑOR, en que haré un nuevo pacto con la casa de Israel y con la casa de Judá. 32 No será como el pacto que hice con sus padres el día que los tomé de la mano para sacarlos de la tierra de Egipto, mi pacto que ellos invalidaron, a pesar de ser yo su señor, dice el SEÑOR. 33 Porque este será el pacto que haré con la casa de Israel después de aquellos días, dice el SEÑOR: Pondré mi ley en su interior y la escribiré en su corazón. Yo seré su Dios, y ellos serán mi pueblo. 34 Ya nadie enseñará a su prójimo ni nadie a su hermano, diciendo: ‘Conoce al SEÑOR’. Pues todos ellos me conocerán, desde el más pequeño de ellos hasta el más grande, dice el SEÑOR. Porque yo perdonaré su iniquidad y no me acordaré más de su pecado”.</p></blockquote><h3>7. <strong>La Promesa de la Nueva Alianza en Cristo (Hebreos 8:6-13)</strong></h3><p>El autor de Hebreos explica cómo el <strong>Nuevo Pacto</strong> establecido en <strong>Cristo</strong> es superior al Antiguo Pacto, el cual era temporal y necesitaba sacrificios constantes. Cristo, como <strong>Sumo Sacerdote</strong>, es la culminación de ese pacto.</p><ul><li><strong>Hebreos 8:6-13</strong> (RVA 2015):</li></ul><blockquote><p>“8 Porque, reprendiéndoles, dice: <i>“He aquí vienen días”, dice el Señor, en que concluiré con la casa de Israel y con la casa de Judá un nuevo pacto; </i>9 <i>no como el pacto que hice con sus padres en el día en que los tomé de la mano para sacarlos de la tierra de Egipto. Porque ellos no permanecieron en mi pacto, y yo dejé de preocuparme por ellos”, dice el Señor. </i>10 <i>“Porque este es el pacto que haré con la casa de Israel después de aquellos días”, dice el Señor. “Pondré mis leyes en la mente de ellos y en su corazón las inscribiré. Y yo seré para ellos Dios, y para mí ellos serán pueblo. </i>11 <i>Nadie enseñará a su prójimo, ni nadie a su hermano, diciendo: ‘Conoce al Señor’; porque todos me conocerán, desde el menor de ellos hasta el mayor. </i>12 <i>Porque seré misericordioso en cuanto a sus injusticias y jamás me acordaré de sus pecados”</i> . 13 Al decir “nuevo”, ha declarado caduco al primero; y lo que se ha hecho viejo y anticuado está a punto de desaparecer.”</p></blockquote><h3><strong>El Nuevo Pacto Instituido por Jesús en la Última Cena</strong></h3><p>El <strong>Nuevo Pacto</strong> es establecido por Jesús durante la <strong>Última Cena</strong> con sus discípulos, donde Jesús les da el pan y el vino como símbolos de su cuerpo y sangre, representando el <strong>sacrificio redentor</strong> que Él iba a hacer por el perdón de los pecados y la reconciliación con Dios.</p><p><strong>Mateo 26:26-28</strong> (RVA 2015):</p><blockquote><p>"26 Mientras ellos comían, Jesús tomó pan y lo bendijo; lo partió y lo dio a sus discípulos, y dijo: —Tomen; coman. Esto es mi cuerpo. 27 Tomando la copa, y habiendo dado gracias, les dio diciendo: —Beban de ella todos; 28 porque esto es mi sangre del pacto, la cual es derramada para el perdón de pecados para muchos."</p></blockquote><p><strong>Marcos 14:22-24</strong> (RVA 2015):</p><blockquote><p>"22 Mientras ellos comían, Jesús tomó pan y lo bendijo; lo partió, les dio y dijo: —Tomen; esto es mi cuerpo. 23 Tomando la copa, y habiendo dado gracias, les dio y bebieron todos de ella. 24 Y él les dijo: —Esto es mi sangre del pacto, la cual es derramada a favor de muchos."</p></blockquote><p><strong>Lucas 22:19-20</strong> (RVA 2015):</p><blockquote><p>“19Entonces tomó pan y, habiendo dado gracias, lo partió y les dio diciendo: —Esto es mi cuerpo que por ustedes es dado. Hagan esto en memoria de mí. 20 Asimismo, después de haber cenado, tomó también la copa y dijo: —Esta copa es el nuevo pacto en mi sangre que por ustedes se derrama.”</p></blockquote><h3><strong>El Nuevo Pacto: ¿En qué Consiste?</strong></h3><p>El <strong>Nuevo Pacto</strong> que Jesús establece con su sacrificio implica varias cosas clave según las Escrituras:</p><p><strong>El perdón de los pecados</strong>: Jesús, a través de su sacrificio, paga el precio por el pecado, lo que establece una relación directa y accesible con Dios. No es necesario ofrecer sacrificios de animales como en el Antiguo Pacto, porque <strong>Cristo es el sacrificio perfecto</strong>.</p><ul><li><strong>Mateo 26:28</strong> (RVA 2015) nos dice: "porque esto es mi sangre del pacto, la cual es derramada para el perdón de pecados para muchos."</li></ul><p><strong>La reconciliación con Dios</strong>: A través de este pacto, los creyentes son reconciliados con Dios por medio de la fe en Jesucristo. La división causada por el pecado es eliminada.</p><ul><li><strong>Hebreos 9:15</strong> (RVA 2015) dice: "15 Por esta razón, también es mediador del nuevo pacto, para que los que han sido llamados reciban la promesa de la herencia eterna, ya que intervino muerte para redimirlos de las transgresiones bajo el primer pacto."</li></ul><p><strong>La transformación interna</strong>: El Nuevo Pacto incluye una <strong>transformación interna</strong> donde Dios pone su ley en los corazones de los creyentes. No es solo una cuestión externa de obedecer reglas, sino que Dios cambia el interior del ser humano para que desee hacer su voluntad.</p><ul><li><strong>Jeremías 31:33</strong> (RVA 2015), profetizando sobre el Nuevo Pacto:</li></ul><blockquote><p>"33 Porque este será el pacto que haré con la casa de Israel después de aquellos días, dice el SEÑOR: Pondré mi ley en su interior y la escribiré en su corazón. Yo seré su Dios, y ellos serán mi pueblo. "</p></blockquote><p><strong>Acceso directo a Dios</strong>: El sacrificio de Jesús permite a los creyentes acercarse directamente a Dios, sin la necesidad de mediadores como los sacerdotes del Antiguo Pacto.</p><ul><li><strong>Hebreos 10:19-22</strong> (RVA 2015):</li></ul><blockquote><p>"19 Así que, hermanos, teniendo plena confianza para entrar al lugar santísimo por la sangre de Jesús, 20 por el camino nuevo y vivo que él nos abrió a través del velo (es decir, su cuerpo), 21 y teniendo un gran sacerdote sobre la casa de Dios, 22 acerquémonos con corazón sincero, en plena certidumbre de fe, purificados los corazones de mala conciencia, y lavados los cuerpos con agua pura. "</p></blockquote><p><strong>El don del Espíritu Santo</strong>: Como parte del Nuevo Pacto, los creyentes reciben el Espíritu Santo, quien les guía, enseña y da poder para vivir según la voluntad de Dios.</p><ul><li><strong>Juan 14:17</strong> (RVA 2015):</li></ul><blockquote><p>"17 Este es el Espíritu de verdad, a quien el mundo no puede recibir porque no lo ve ni lo conoce. Ustedes lo conocen, porque permanece con ustedes y está en ustedes. "</p></blockquote><p><strong>La promesa de vida eterna</strong>: A través del Nuevo Pacto, los creyentes reciben la promesa de vida eterna con Dios, que es asegurada por la resurrección de Jesús.</p><ul><li><strong>Juan 6:54</strong> (RVA 2015):</li></ul><blockquote><p>"54 El que come mi carne y bebe mi sangre tiene vida eterna, y yo lo resucitaré en el día final."</p></blockquote>
6	elemento	<h3><strong>Parábolas de Cosa o Elemento</strong></h3><p>Estas parábolas utilizan un objeto, un elemento de la naturaleza o algo cotidiano como principal símbolo o elemento de la enseñanza. Estos elementos son usados para ilustrar principios divinos o humanos. Pueden tratar de algo tan común como una semilla, una lámpara o una perla.</p><p><strong>Ejemplos:</strong></p><p><strong>La parábola del grano de mostaza (Mateo 13:31-32):</strong> Jesús compara el reino de los cielos con una semilla de mostaza, que es pequeña pero crece hasta convertirse en un árbol grande, mostrando cómo algo pequeño y aparentemente insignificante puede crecer y tener un gran impacto.</p><blockquote><p>"31 La siguiente es otra ilustración que usó Jesús: «El reino del cielo es como una semilla de mostaza sembrada en un campo. 32Es la más pequeña de todas las semillas, pero se convierte en la planta más grande del huerto; crece hasta llegar a ser un árbol y vienen los pájaros y hacen nidos en las ramas»." (Mateo 13:31-32)</p></blockquote><p><strong>La parábola de la perla de gran valor (Mateo 13:45-46):</strong> En esta parábola, Jesús habla sobre un comerciante que encuentra una perla preciosa y vende todo lo que tiene para comprarla, ilustrando el valor incomparable del reino de los cielos.</p><blockquote><p>"45 »Además el reino del cielo es como un comerciante en busca de perlas de primera calidad. 46 Cuando descubrió una perla de gran valor, vendió todas sus posesiones y la compró." (Mateo 13:45-46)</p></blockquote>
7	lugar	<h3><strong>Parábolas de Lugar</strong></h3><p>Las parábolas de lugar se enfocan en la ubicación o el entorno, utilizando escenarios específicos para ilustrar un mensaje. Estos lugares pueden ser reales o simbólicos, y tienen un significado especial en el contexto de la enseñanza.</p><p><strong>Ejemplos:</strong></p><p><strong>La parábola del sembrador (Mateo 13:3-9):</strong> Jesús utiliza diferentes tipos de suelos o terrenos (el camino, las piedras, los espinos, la buena tierra) para ilustrar cómo las personas reciben el mensaje del reino de Dios. El lugar (o el terreno) simboliza las condiciones del corazón humano.</p><blockquote><p>"3Contó muchas historias en forma de parábola como la siguiente: «¡Escuchen! Un agricultor salió a sembrar. 4A medida que esparcía las semillas por el campo, algunas cayeron sobre el camino y los pájaros vinieron y se las comieron. 5Otras cayeron en tierra poco profunda con roca debajo de ella. Las semillas germinaron con rapidez porque la tierra era poco profunda; 6pero pronto las plantas se marchitaron bajo el calor del sol y, como no tenían raíces profundas, murieron. 7Otras semillas cayeron entre espinos, los cuales crecieron y ahogaron los brotes; 8pero otras semillas cayeron en tierra fértil, ¡y produjeron una cosecha que fue treinta, sesenta y hasta cien veces más numerosa de lo que se había sembrado! 9El que tenga oídos para oír, que escuche y entienda»." (Mateo 13:3-9)</p></blockquote><h3><strong>Sodoma y Gomorra como símbolos de inmoralidad (Mateo 10:14-15)</strong></h3><blockquote><p>"14 Si cualquier casa o ciudad se niega a darles la bienvenida o a escuchar su mensaje, sacúdanse el polvo de los pies al salir. 15 Les digo la verdad, el día del juicio les irá mejor a las ciudades perversas de Sodoma y Gomorra que a esa ciudad.." (Mateo 10:14-15)</p></blockquote><p><br><strong>Sodoma y Gomorra</strong> son conocidas por su <strong>gran perversión</strong> y <strong>pecado</strong>. En este pasaje, <strong>Sodoma y Gomorra</strong> son utilizadas para ilustrar el <strong>juicio divino</strong> que caerá sobre las ciudades que rechacen el mensaje de Cristo. El nombre de estas ciudades históricas es tomado como símbolo de <strong>destrucción y juicio</strong> debido a la <strong>inmoralidad</strong> y la <strong>rebelión contra Dios</strong>.</p><h3>Apocalipsis 11:8</h3><blockquote><p>"Y sus cuerpos quedarán tendidos en la calle principal de Jerusalén, la ciudad que simbólicamente se llama «Sodoma» y «Egipto», la ciudad en la cual su Señor fue crucificado." (Apocalipsis 11:8)</p></blockquote><p><strong>La ciudad mencionada en este pasaje no es una ciudad física</strong>, sino una ciudad que representa el <strong>rechazo al mensaje de Dios</strong>. Aquí, el nombre de la ciudad es utilizado de manera simbólica para mostrar cómo la sociedad ha <strong>rechazado a los mensajeros de Dios</strong> (los dos testigos) y ha optado por <strong>vivir en pecado</strong>.</p><p><strong>Sodoma</strong> y <strong>Egipto</strong> son usadas como símbolos de <strong>inmoralidad</strong> y <strong>opresión espiritual</strong>:</p><ul><li><strong>Sodoma</strong> es un símbolo de la <strong>corruptela moral</strong> y el <strong>pecado desenfrenado</strong> (como se describe en la historia de la destrucción de Sodoma en el Antiguo Testamento debido a su perversión y maldad).</li><li><strong>Egipto</strong>, por otro lado, es <strong>símbolo de opresión</strong>, especialmente <strong>la opresión del pueblo de Dios</strong> (como el Egipto que esclavizó a los israelitas antes de su liberación en el éxodo).</li></ul><p>La referencia a <strong>"donde también nuestro Señor fue crucificado"</strong> es una <strong>referencia simbólica</strong> a Jerusalén, que fue la ciudad donde <strong>Jesucristo fue crucificado</strong>. Al combinar <strong>Jerusalén</strong> con las ciudades de <strong>Sodoma</strong> y <strong>Egipto</strong>, el libro de Apocalipsis está diciendo que Jerusalén, en este contexto, se ha convertido en una ciudad espiritual <strong>similar a Sodoma y Egipto</strong>, ya que ha <strong>rechazado el mensaje de Dios</strong> y ha <strong>perseguido a los profetas</strong> (los dos testigos), lo que la convierte en un <strong>lugar de corrupción espiritual</strong>.</p>
8	persona	<h3>Parábola de Persona</h3><p>En estas parábolas, una persona o figura humana es utilizada como <strong>símbolo</strong> o <strong>representación</strong> de algo más grande, como puede ser un <strong>pueblo</strong> o una <strong>nación</strong>, o incluso un <strong>concepto espiritual</strong> como <strong>el pecado</strong>, <strong>la justicia</strong>, <strong>el arrepentimiento</strong>, etc. Este tipo de parábola usa la figura de una persona <strong>para ilustrar características o actitudes</strong> que no se limitan a esa persona específica, sino que representan algo más universal o profundo.</p><h3><strong>La parábola de los talentos (Mateo 25:14-30)</strong></h3><p><strong>Resumen</strong>: Un hombre que se va de viaje reparte talentos (dinero) entre tres siervos. Dos de ellos invierten el dinero y lo multiplican, pero el tercero lo esconde. El dueño regresa y premia a los siervos fieles, pero castiga al que no hizo nada con el talento recibido.</p><p><strong>Versículo clave</strong>:</p><blockquote><p>"28 »Entonces ordenó: “Quítenle el dinero a este siervo y dénselo al que tiene las diez bolsas de plata. 29 A los que usan bien lo que se les da, se les dará aún más y tendrán en abundancia; pero a los que no hacen nada se les quitará aun lo poco que tienen. 30 Ahora bien, arrojen a este siervo inútil a la oscuridad de afuera, donde habrá llanto y rechinar de dientes”." (Mateo 25:28-30)</p></blockquote><p><strong>Personajes clave</strong>:</p><ul><li><strong>Los siervos</strong> representan a <strong>los creyentes</strong> o <strong>seguidores de Cristo</strong> que tienen una responsabilidad con los dones y recursos que se les han confiado.</li><li><strong>El dueño</strong> de los talentos es un símbolo de <strong>Dios</strong>.</li></ul><p><strong>Lección espiritual</strong>: La parábola no está hablando de siervos literales, sino que los <strong>siervos</strong> representan a las <strong>personas</strong> que reciben de Dios talentos, dones y responsabilidades, y deben ser <strong>responsables</strong> en su uso para el <strong>Reino de Dios</strong>. Los <strong>talentos</strong> simbolizan los <strong>dones espirituales</strong>, y los siervos representan la manera en que las personas responden a esos dones.</p><h3><strong>La parábola de la novia y el novio (Mateo 25:1-13)</strong></h3><p><strong>Resumen</strong>: Diez vírgenes esperan al novio para la boda. Cinco de ellas están preparadas con aceite en sus lámparas, y cinco no lo están. Cuando llega el novio, las que no estaban preparadas se quedan fuera de la fiesta.</p><p><strong>Versículo clave</strong>:</p><blockquote><p>"13 »¡Así que ustedes también deben estar alerta! Porque no saben el día ni la hora de mi regreso." (Mateo 25:13)</p></blockquote><p><strong>Personajes clave</strong>:</p><ul><li><strong>Las diez vírgenes</strong> representan a <strong>todos los creyentes</strong>, que esperan la <strong>segunda venida de Cristo</strong>.</li><li><strong>El novio</strong> es un <strong>símbolo de Jesucristo</strong>, quien regresa para <strong>tomar a su Iglesia</strong>.</li></ul><p><strong>Lección espiritual</strong>: Las <strong>vírgenes</strong> no son solo mujeres literales, sino que representan a todos los <strong>creyentes</strong> que deben estar <strong>preparados</strong> para la <strong>venida de Cristo</strong>. Las que no se prepararon correctamente simbolizan a aquellos que no están <strong>listos espiritualmente</strong> para el regreso de Cristo.</p>
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, photo, is_admin) FROM stdin;
2	Juan Alvarez	profesoralilis@gmail.com	scrypt:32768:8:1$7wpTcjt7ZnKZIuzJ$86a49cb3204bc83b2211da23f6ac31af8b10ffbfaf28d54e0ea0c7a0346ca554905f77444e016f4bc5654b309783f6e8e0e6f7e5984905ac19b5877f6f46739d	media/kelly-sikkema-YnRNdB-XTME-unsplash.jpg	\N
1	Admin	operadorpersonal0@gmail.com	scrypt:32768:8:1$kn5erIzJWF0QmWbL$29ad5c4b9f8ed4eba12f7ed493b2afbf2f4bab84882fc9b929f075f397a042d07ec730cbcc5102495be5c2610c55eb1ef7a20fb936b47909d8c4aeb491c2767d	media/white.jpg	t
\.


--
-- Name: bases_biblicas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bases_biblicas_id_seq', 5, true);


--
-- Name: colaboradores_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colaboradores_posts_id_seq', 5, true);


--
-- Name: devocionales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devocionales_id_seq', 1, true);


--
-- Name: info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.info_id_seq', 4, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 15, true);


--
-- Name: temas_estudio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temas_estudio_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: bases_biblicas bases_biblicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bases_biblicas
    ADD CONSTRAINT bases_biblicas_pkey PRIMARY KEY (id);


--
-- Name: bases_biblicas bases_biblicas_subseccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bases_biblicas
    ADD CONSTRAINT bases_biblicas_subseccion_key UNIQUE (subseccion);


--
-- Name: colaboradores_posts colaboradores_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_posts
    ADD CONSTRAINT colaboradores_posts_pkey PRIMARY KEY (id);


--
-- Name: devocionales devocionales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devocionales
    ADD CONSTRAINT devocionales_pkey PRIMARY KEY (id);


--
-- Name: info info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_pkey PRIMARY KEY (id);


--
-- Name: info info_seccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_seccion_key UNIQUE (seccion);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_url_key UNIQUE (url);


--
-- Name: temas_estudio temas_estudio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_estudio
    ADD CONSTRAINT temas_estudio_pkey PRIMARY KEY (id);


--
-- Name: temas_estudio temas_estudio_subseccion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temas_estudio
    ADD CONSTRAINT temas_estudio_subseccion_key UNIQUE (subseccion);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: colaboradores_posts colaboradores_posts_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaboradores_posts
    ADD CONSTRAINT colaboradores_posts_author_fkey FOREIGN KEY (author) REFERENCES public.users(id);


--
-- Name: posts posts_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_fkey FOREIGN KEY (author) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

