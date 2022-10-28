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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: usuarios; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usuarios (
    name character varying(23) NOT NULL,
    best_game integer,
    num_games integer
);


ALTER TABLE public.usuarios OWNER TO freecodecamp;

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usuarios VALUES ('Santi', 10, 1);
INSERT INTO public.usuarios VALUES ('user_1666955399068', 889, 2);
INSERT INTO public.usuarios VALUES ('user_1666955399069', 160, 5);
INSERT INTO public.usuarios VALUES ('user_1666955574288', 278, 2);
INSERT INTO public.usuarios VALUES ('user_1666955574289', 18, 5);
INSERT INTO public.usuarios VALUES ('user_1666955604170', 279, 2);
INSERT INTO public.usuarios VALUES ('user_1666955604171', 39, 5);
INSERT INTO public.usuarios VALUES ('user_1666955661305', 688, 2);
INSERT INTO public.usuarios VALUES ('user_1666955661306', 189, 5);
INSERT INTO public.usuarios VALUES ('user_1666955809817', 55, 2);
INSERT INTO public.usuarios VALUES ('user_1666955809818', 99, 5);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (name);


--
-- PostgreSQL database dump complete
--

