--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    diameter_in_km numeric(8,3)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    diameter_in_ly integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    description text NOT NULL,
    diameter_in_km numeric(8,3),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.planet_planet_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    orbital_period_days integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer DEFAULT nextval('public.star_star_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    description text NOT NULL,
    star_type character varying(50),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 4500.000, 946.000);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 4500.000, 525.000);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 4500.000, 512.000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600.000, 'Our home galaxy containing the Solar System', true, 105700);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000.000, 'Nearest spiral galaxy to the Milky Way', false, 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000.000, 'Spiral galaxy in the Local Group', false, 60000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 12000.000, 'Grand-design spiral galaxy in Canes Venatici', false, 76000);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 12000.000, 'Spiral galaxy in Ursa Major', false, 90000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13000.000, 'Galaxy in Virgo constellation, known for its halo', false, 49000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500.000, 'Earth''s natural satellite', 3475.000, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500.000, 'One of Mars'' two moons', 22.500, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500.000, 'One of Mars'' two moons', 12.400, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4500.000, 'Largest moon in the Solar System', 5268.000, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4500.000, 'Jupiter''s heavily cratered moon', 4820.000, 5);
INSERT INTO public.moon VALUES (6, 'Io', 4500.000, 'Volcanically active moon of Jupiter', 3643.000, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 4500.000, 'Icy moon of Jupiter with subsurface ocean', 3122.000, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4500.000, 'Saturn''s largest moon with atmosphere', 5151.000, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 4500.000, 'Second largest moon of Saturn', 1528.000, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 4500.000, 'Mid-sized icy moon of Saturn', 1060.000, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 4500.000, 'Saturn moon with geysers', 504.000, 6);
INSERT INTO public.moon VALUES (12, 'Titania', 4500.000, 'Largest moon of Uranus', 1578.000, 7);
INSERT INTO public.moon VALUES (13, 'Oberon', 4500.000, 'Second largest moon of Uranus', 1523.000, 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 4500.000, 'Uranian moon with varied terrain', 470.000, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 4500.000, 'Retrograde moon of Neptune', 2707.000, 8);
INSERT INTO public.moon VALUES (16, 'Proteus', 4500.000, 'Large irregular moon of Neptune', 420.000, 8);
INSERT INTO public.moon VALUES (17, 'Charon', 4500.000, 'Pluto''s large companion moon', 1212.000, 9);
INSERT INTO public.moon VALUES (18, 'Hydra', 4500.000, 'Second largest small moon of Pluto', 51.000, 9);
INSERT INTO public.moon VALUES (19, 'Nix', 4500.000, 'Small moon of Pluto', 49.000, 9);
INSERT INTO public.moon VALUES (20, 'Kerberos', 4500.000, 'Tiny moon of Pluto', 19.000, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500.000, 'Smallest planet, closest to the Sun', false, 88, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500.000, 'Second planet from the Sun, thick atmosphere', false, 225, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500.000, 'Third planet from the Sun, home to life', true, 365, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500.000, 'Fourth planet, known as the Red Planet', false, 687, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500.000, 'Largest planet, gas giant', false, 4333, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500.000, 'Gas giant with prominent rings', false, 10759, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500.000, 'Ice giant, rotates on its side', false, 30687, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500.000, 'Ice giant, farthest classical planet', false, 60190, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4500.000, 'Dwarf planet, formerly ninth planet', false, 90560, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 4500.000, 'Dwarf planet in the asteroid belt', false, 1680, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 4500.000, 'Distant dwarf planet in the scattered disk', false, 203600, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 4500.000, 'Dwarf planet with fast rotation and elongated shape', false, 103800, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.000, 'G-type main-sequence star at the center of the Solar System', 'G-type', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500.000, 'Closest star to the Sun', 'M-type', 1);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', 230.000, 'Bright star in Andromeda Galaxy', 'B-type', 2);
INSERT INTO public.star VALUES (4, 'Triangulum Star 1', 5000.000, 'Example star in Triangulum Galaxy', 'F-type', 3);
INSERT INTO public.star VALUES (5, 'Whirlpool Star 1', 7000.000, 'Star in Whirlpool Galaxy', 'G-type', 4);
INSERT INTO public.star VALUES (6, 'Sombrero Star 1', 9000.000, 'Star in Sombrero Galaxy', 'K-type', 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

camper@codespaces-17a37e:/workspace/project$ man git
camper@codespaces-17a37e:/workspace/project$ git push
fatal: No configured push destination.
Either specify the URL from the command-line or configure a remote repository using

    git remote add <name> <url>

and then push using the remote name

    git push <name>

camper@codespaces-17a37e:/workspace/project$ cat universe.sql 
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    diameter_in_km numeric(8,3)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass) NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    diameter_in_ly integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer DEFAULT nextval('public.moon_moon_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    description text NOT NULL,
    diameter_in_km numeric(8,3),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer DEFAULT nextval('public.planet_planet_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    orbital_period_days integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer DEFAULT nextval('public.star_star_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(8,3) NOT NULL,
    description text NOT NULL,
    star_type character varying(50),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 4500.000, 946.000);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 4500.000, 525.000);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 4500.000, 512.000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600.000, 'Our home galaxy containing the Solar System', true, 105700);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000.000, 'Nearest spiral galaxy to the Milky Way', false, 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000.000, 'Spiral galaxy in the Local Group', false, 60000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 12000.000, 'Grand-design spiral galaxy in Canes Venatici', false, 76000);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 12000.000, 'Spiral galaxy in Ursa Major', false, 90000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 13000.000, 'Galaxy in Virgo constellation, known for its halo', false, 49000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500.000, 'Earth''s natural satellite', 3475.000, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500.000, 'One of Mars'' two moons', 22.500, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500.000, 'One of Mars'' two moons', 12.400, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4500.000, 'Largest moon in the Solar System', 5268.000, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4500.000, 'Jupiter''s heavily cratered moon', 4820.000, 5);
INSERT INTO public.moon VALUES (6, 'Io', 4500.000, 'Volcanically active moon of Jupiter', 3643.000, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 4500.000, 'Icy moon of Jupiter with subsurface ocean', 3122.000, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 4500.000, 'Saturn''s largest moon with atmosphere', 5151.000, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 4500.000, 'Second largest moon of Saturn', 1528.000, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 4500.000, 'Mid-sized icy moon of Saturn', 1060.000, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 4500.000, 'Saturn moon with geysers', 504.000, 6);
INSERT INTO public.moon VALUES (12, 'Titania', 4500.000, 'Largest moon of Uranus', 1578.000, 7);
INSERT INTO public.moon VALUES (13, 'Oberon', 4500.000, 'Second largest moon of Uranus', 1523.000, 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 4500.000, 'Uranian moon with varied terrain', 470.000, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 4500.000, 'Retrograde moon of Neptune', 2707.000, 8);
INSERT INTO public.moon VALUES (16, 'Proteus', 4500.000, 'Large irregular moon of Neptune', 420.000, 8);
INSERT INTO public.moon VALUES (17, 'Charon', 4500.000, 'Pluto''s large companion moon', 1212.000, 9);
INSERT INTO public.moon VALUES (18, 'Hydra', 4500.000, 'Second largest small moon of Pluto', 51.000, 9);
INSERT INTO public.moon VALUES (19, 'Nix', 4500.000, 'Small moon of Pluto', 49.000, 9);
INSERT INTO public.moon VALUES (20, 'Kerberos', 4500.000, 'Tiny moon of Pluto', 19.000, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500.000, 'Smallest planet, closest to the Sun', false, 88, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 4500.000, 'Second planet from the Sun, thick atmosphere', false, 225, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 4500.000, 'Third planet from the Sun, home to life', true, 365, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 4500.000, 'Fourth planet, known as the Red Planet', false, 687, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4500.000, 'Largest planet, gas giant', false, 4333, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4500.000, 'Gas giant with prominent rings', false, 10759, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500.000, 'Ice giant, rotates on its side', false, 30687, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4500.000, 'Ice giant, farthest classical planet', false, 60190, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4500.000, 'Dwarf planet, formerly ninth planet', false, 90560, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 4500.000, 'Dwarf planet in the asteroid belt', false, 1680, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 4500.000, 'Distant dwarf planet in the scattered disk', false, 203600, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 4500.000, 'Dwarf planet with fast rotation and elongated shape', false, 103800, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.000, 'G-type main-sequence star at the center of the Solar System', 'G-type', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500.000, 'Closest star to the Sun', 'M-type', 1);
INSERT INTO public.star VALUES (3, 'Alpha Andromedae', 230.000, 'Bright star in Andromeda Galaxy', 'B-type', 2);
INSERT INTO public.star VALUES (4, 'Triangulum Star 1', 5000.000, 'Example star in Triangulum Galaxy', 'F-type', 3);
INSERT INTO public.star VALUES (5, 'Whirlpool Star 1', 7000.000, 'Star in Whirlpool Galaxy', 'G-type', 4);
INSERT INTO public.star VALUES (6, 'Sombrero Star 1', 9000.000, 'Star in Sombrero Galaxy', 'K-type', 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
