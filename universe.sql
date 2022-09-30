--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    size_in_light_years numeric,
    name character varying(30) NOT NULL,
    distance_from_earth_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: inhabitant; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.inhabitant (
    inhabitant_id integer NOT NULL,
    reproduction_type character varying(15),
    name character varying(15) NOT NULL,
    planet_id integer
);


ALTER TABLE public.inhabitant OWNER TO freecodecamp;

--
-- Name: inhabitant_inhabitant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.inhabitant_inhabitant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inhabitant_inhabitant_id_seq OWNER TO freecodecamp;

--
-- Name: inhabitant_inhabitant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.inhabitant_inhabitant_id_seq OWNED BY public.inhabitant.inhabitant_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    description text,
    age_in_millions_of_years integer,
    name character varying(20) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    description text,
    has_life boolean,
    is_habitable boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    name character varying(20) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    description text,
    age_in_millions_of_years numeric,
    name character varying(20) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: inhabitant inhabitant_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitant ALTER COLUMN inhabitant_id SET DEFAULT nextval('public.inhabitant_inhabitant_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'This is our galaxy', 1361000, 52850, 'Milky Way', 0);
INSERT INTO public.galaxy VALUES (2, 'This is the nearest large galaxy to the Milky Way', 110000, 10000000000, 'Andromeda', 2500000);
INSERT INTO public.galaxy VALUES (3, 'This is a massive unbarred spiral galaxy', 245000, 1100000, 'NGC 6753', 150000000);
INSERT INTO public.galaxy VALUES (4, 'This galaxy has a monster black hole in its heart', 165000, 1900000, 'Hercules A', 2000000000);
INSERT INTO public.galaxy VALUES (5, 'This is the 3rd nearest galaxy from the Milky Way', 100520, 7000, 'Large Magellanic Cloud', 7000);
INSERT INTO public.galaxy VALUES (6, 'This is the nearest galaxy to the Milky Way', 50520, 14000, 'Canis Major Overdensity', 25000);


--
-- Data for Name: inhabitant; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.inhabitant VALUES (1, 'viviparous', 'human', 1);
INSERT INTO public.inhabitant VALUES (2, 'oviviparous', 'shark', 1);
INSERT INTO public.inhabitant VALUES (3, 'oviparous', 'parrot', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'This moon is our moon', NULL, 'Moon');
INSERT INTO public.moon VALUES (2, 2, 'This moon is green', NULL, 'EDT-1578');
INSERT INTO public.moon VALUES (3, 2, 'This moon is red', NULL, 'EDT-2234');
INSERT INTO public.moon VALUES (4, 2, 'This moon is blue', NULL, 'EDT-1004');
INSERT INTO public.moon VALUES (5, 3, '1748953762', NULL, 'EDT-1578');
INSERT INTO public.moon VALUES (6, 3, '515410132', NULL, 'EDT-2234');
INSERT INTO public.moon VALUES (7, 3, '1004200753', NULL, 'EDT-1004');
INSERT INTO public.moon VALUES (8, 4, '1748953762', NULL, 'PMBOK-1578');
INSERT INTO public.moon VALUES (9, 4, '515410132', NULL, 'PMBOK-2234');
INSERT INTO public.moon VALUES (10, 4, '1004200753', NULL, 'PMBOK-1004');
INSERT INTO public.moon VALUES (11, 4, '918463846', NULL, 'PMBOK-2022');
INSERT INTO public.moon VALUES (12, 4, '1234567890', NULL, 'PMBOK-1180');
INSERT INTO public.moon VALUES (13, 4, '321456978', NULL, 'PMBOK-007');
INSERT INTO public.moon VALUES (14, 5, '10000200', NULL, 'RDI-100');
INSERT INTO public.moon VALUES (15, 5, '555870143', NULL, 'RDI-101');
INSERT INTO public.moon VALUES (16, 5, '200720083', NULL, 'RDI-102');
INSERT INTO public.moon VALUES (17, 6, NULL, NULL, 'PGPI-2222');
INSERT INTO public.moon VALUES (18, 6, NULL, NULL, 'PGPI-2223');
INSERT INTO public.moon VALUES (19, 6, NULL, NULL, 'PGPI-2224');
INSERT INTO public.moon VALUES (20, 6, NULL, NULL, 'PGPI-2225');
INSERT INTO public.moon VALUES (21, 7, NULL, NULL, 'ADDA-X');
INSERT INTO public.moon VALUES (22, 7, NULL, NULL, 'ADDA-Y');
INSERT INTO public.moon VALUES (23, 8, NULL, NULL, 'EGC-mvg');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'This is our planet', true, true, true, 4543000000, 'Earth');
INSERT INTO public.planet VALUES (2, 1, 'David Bowie still ther', false, false, false, 4543000000, 'Mars');
INSERT INTO public.planet VALUES (3, 1, 'This is the larges planet', false, false, false, 4543000000, 'Jupyter');
INSERT INTO public.planet VALUES (4, 1, 'This planet has rings around him', false, false, false, 5000000000, 'Saturn');
INSERT INTO public.planet VALUES (5, 1, 'This planet is mado of gas', false, false, false, 4543000000, 'Venus');
INSERT INTO public.planet VALUES (6, 1, 'The atmosphere of this planet is poisoning', false, false, false, 4543000000, 'Urano');
INSERT INTO public.planet VALUES (7, 2, 'This planet has been considered as habitable', false, true, true, 1478549623, 'Habitat 7');
INSERT INTO public.planet VALUES (8, 2, 'This planet has water on its surface', NULL, false, true, 1070546693, 'Habitat 71');
INSERT INTO public.planet VALUES (9, 2, 'This planet wasnt considered as a planet and now it is', NULL, false, NULL, 1070546693, 'ISSI2');
INSERT INTO public.planet VALUES (10, 3, 'This is a tiny planet', NULL, false, NULL, 10254697, 'AISS');
INSERT INTO public.planet VALUES (11, 4, 'This planet has no moons', NULL, false, NULL, 73581943, 'CBD');
INSERT INTO public.planet VALUES (12, 5, 'This planet is as big as jupyter', NULL, false, NULL, 227694001, 'ETSIIUS');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'This is the central star on the Solar System', 4600000000, 'Sun');
INSERT INTO public.star VALUES (2, 2, 'A planet that orbits around this star was considered as habitable', 7256000000, 'Erikssen');
INSERT INTO public.star VALUES (3, 3, 'This star dont even have an original name', 5200000000, 'Star 3');
INSERT INTO public.star VALUES (4, 4, 'Running out of imagination', 800000000, 'Star 4');
INSERT INTO public.star VALUES (5, 5, 'Running out of imagination', 5900000000, 'Star 5');
INSERT INTO public.star VALUES (6, 6, 'This star neither have an original name', 1200000000, 'Star 6');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: inhabitant_inhabitant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.inhabitant_inhabitant_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: inhabitant inhabitant_inhabitant_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitant
    ADD CONSTRAINT inhabitant_inhabitant_id_key UNIQUE (inhabitant_id);


--
-- Name: inhabitant inhabitant_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitant
    ADD CONSTRAINT inhabitant_pkey PRIMARY KEY (inhabitant_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: inhabitant inhabitant_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.inhabitant
    ADD CONSTRAINT inhabitant_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

