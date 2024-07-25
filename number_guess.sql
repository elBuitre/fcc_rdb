--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (29, 39, 674);
INSERT INTO public.games VALUES (30, 39, 79);
INSERT INTO public.games VALUES (31, 40, 2);
INSERT INTO public.games VALUES (32, 40, 169);
INSERT INTO public.games VALUES (33, 39, 541);
INSERT INTO public.games VALUES (34, 39, 349);
INSERT INTO public.games VALUES (35, 39, 566);
INSERT INTO public.games VALUES (36, 41, 382);
INSERT INTO public.games VALUES (37, 41, 599);
INSERT INTO public.games VALUES (38, 42, 319);
INSERT INTO public.games VALUES (39, 42, 132);
INSERT INTO public.games VALUES (40, 41, 527);
INSERT INTO public.games VALUES (41, 41, 950);
INSERT INTO public.games VALUES (42, 41, 704);
INSERT INTO public.games VALUES (43, 43, 315);
INSERT INTO public.games VALUES (44, 43, 369);
INSERT INTO public.games VALUES (45, 44, 703);
INSERT INTO public.games VALUES (46, 44, 347);
INSERT INTO public.games VALUES (47, 43, 390);
INSERT INTO public.games VALUES (48, 43, 169);
INSERT INTO public.games VALUES (49, 43, 712);
INSERT INTO public.games VALUES (50, 45, 399);
INSERT INTO public.games VALUES (51, 45, 514);
INSERT INTO public.games VALUES (52, 46, 710);
INSERT INTO public.games VALUES (53, 46, 333);
INSERT INTO public.games VALUES (54, 45, 833);
INSERT INTO public.games VALUES (55, 45, 332);
INSERT INTO public.games VALUES (56, 45, 563);
INSERT INTO public.games VALUES (57, 47, 120);
INSERT INTO public.games VALUES (58, 47, 842);
INSERT INTO public.games VALUES (59, 48, 122);
INSERT INTO public.games VALUES (60, 48, 517);
INSERT INTO public.games VALUES (61, 47, 179);
INSERT INTO public.games VALUES (62, 47, 879);
INSERT INTO public.games VALUES (63, 47, 748);
INSERT INTO public.games VALUES (64, 49, 106);
INSERT INTO public.games VALUES (65, 49, 219);
INSERT INTO public.games VALUES (66, 50, 562);
INSERT INTO public.games VALUES (67, 50, 43);
INSERT INTO public.games VALUES (68, 49, 840);
INSERT INTO public.games VALUES (69, 49, 601);
INSERT INTO public.games VALUES (70, 49, 385);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (39, 'user_1721913005245');
INSERT INTO public.users VALUES (40, 'user_1721913005244');
INSERT INTO public.users VALUES (41, 'user_1721913012020');
INSERT INTO public.users VALUES (42, 'user_1721913012019');
INSERT INTO public.users VALUES (43, 'user_1721913032627');
INSERT INTO public.users VALUES (44, 'user_1721913032626');
INSERT INTO public.users VALUES (45, 'user_1721913106819');
INSERT INTO public.users VALUES (46, 'user_1721913106818');
INSERT INTO public.users VALUES (47, 'user_1721913139279');
INSERT INTO public.users VALUES (48, 'user_1721913139278');
INSERT INTO public.users VALUES (49, 'user_1721913176789');
INSERT INTO public.users VALUES (50, 'user_1721913176788');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 70, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 50, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

