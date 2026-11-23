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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(60,4),
    distance_from_earth numeric(60,4)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_table_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_table_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: god; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.god (
    god_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,6),
    number_of_enemies integer NOT NULL
);


ALTER TABLE public.god OWNER TO freecodecamp;

--
-- Name: god_god_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.god_god_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.god_god_id_seq OWNER TO freecodecamp;

--
-- Name: god_god_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.god_god_id_seq OWNED BY public.god.god_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(10,6),
    distance_from_earth numeric(20,5),
    planet_id integer,
    god_id integer
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
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(10,6),
    distance_from_earth numeric(20,5),
    is_spherical boolean,
    has_ring_system boolean NOT NULL,
    number_of_rings integer,
    star_id integer,
    god_id integer
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
    name character varying(60) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years numeric(30,4),
    distance_from_earth numeric(30,4),
    galaxy_id integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_table_id_seq'::regclass);


--
-- Name: god god_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.god ALTER COLUMN god_id SET DEFAULT nextval('public.god_god_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy containing the solar system.', true, 13600000000.0000, 0.0000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral galaxy to the Milky Way, expected to collide with it someday.', true, 10000000000.0000, 2537000.0000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest galaxy in the Local Group, a spiral galaxy.', true, 10000000000.0000, 2950000.0000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Satellite dwarf galaxy of the Milky Way, visible from the southern hemisphere.', true, 13000000000.0000, 163000.0000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Spiral galaxy with a bright nucleus and prominent dust lane.', false, 13000000000.0000, 29300000.0000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Classic spiral galaxy interacting with its smaller companion.', true, 13000000000.0000, 23000000.0000);


--
-- Data for Name: god; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.god VALUES (1, 'Zeus', 'King of the Greek gods and ruler of the sky; Jupiter is named after his Roman equivalent.', 0.000001, 3);
INSERT INTO public.god VALUES (2, 'Poseidon', 'Greek god of the sea; Neptune is named after his Roman equivalent.', 0.000001, 4);
INSERT INTO public.god VALUES (3, 'Hades', 'Greek god of the underworld; Pluto is named after his Roman equivalent.', 0.000001, 2);
INSERT INTO public.god VALUES (4, 'Ares', 'Greek god of war; Mars is named after his Roman equivalent.', 0.000001, 5);
INSERT INTO public.god VALUES (5, 'Aphrodite', 'Greek goddess of love and beauty; Venus is named after her Roman equivalent.', 0.000001, 2);
INSERT INTO public.god VALUES (6, 'Hermes', 'Greek messenger god; Mercury is named after his Roman equivalent.', 0.000001, 3);
INSERT INTO public.god VALUES (7, 'Kronos', 'Titan and father of Zeus; Saturn is named after his Roman equivalent.', 0.000002, 6);
INSERT INTO public.god VALUES (8, 'Uranus', 'Primordial Greek god of the sky; the planet Uranus is named directly after him.', 0.000003, 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite, responsible for ocean tides.', false, 4500.000000, 0.00038, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Small irregular moon slowly spiraling inward toward Mars.', false, 4600.000000, 78.30000, 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Tiny outer moon of Mars with a smooth, dusty surface.', false, 4600.000000, 78.30000, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 'Most volcanically active body in the solar system.', false, 4600.000000, 628.70000, 5, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with a subsurface ocean, a prime candidate for life.', true, 4600.000000, 628.70000, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system, bigger than Mercury.', false, 4600.000000, 628.70000, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon of Jupiter, geologically quiet.', false, 4600.000000, 628.70000, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn''s largest moon, with a thick atmosphere and methane lakes.', false, 4600.000000, 1275.00000, 6, NULL);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy Saturnian moon that ejects water plumes from its south pole.', true, 4600.000000, 1275.00000, 6, NULL);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Small Saturnian moon dominated by the giant Herschel crater.', false, 4600.000000, 1275.00000, 6, NULL);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Second largest moon of Saturn, heavily cratered and icy.', false, 4600.000000, 1275.00000, 6, NULL);
INSERT INTO public.moon VALUES (12, 'Iapetus', 'Two-toned Saturnian moon with a mysterious equatorial ridge.', false, 4600.000000, 1275.00000, 6, NULL);
INSERT INTO public.moon VALUES (13, 'Dione', 'Icy Saturnian moon with bright wispy terrain on its trailing side.', false, 4600.000000, 1275.00000, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Tethys', 'Medium-sized Saturnian moon scarred by the huge Odysseus crater.', false, 4600.000000, 1275.00000, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Small Uranian moon with a patchwork of extreme cliffs and canyons.', false, 4600.000000, 2724.00000, 7, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', 'Largest moon of Uranus, covered in fault valleys.', false, 4600.000000, 2724.00000, 7, NULL);
INSERT INTO public.moon VALUES (17, 'Oberon', 'Outermost large moon of Uranus, dark and heavily cratered.', false, 4600.000000, 2724.00000, 7, NULL);
INSERT INTO public.moon VALUES (18, 'Triton', 'Neptune''s largest moon, orbiting backwards and likely a captured dwarf planet.', false, 4600.000000, 4351.00000, 8, NULL);
INSERT INTO public.moon VALUES (19, 'Charon', 'Pluto''s largest moon, so big the pair effectively orbit a common point.', false, 4600.000000, 5750.00000, 9, NULL);
INSERT INTO public.moon VALUES (20, 'Hyperion', 'Chaotically tumbling sponge-like moon of Saturn.', false, 4600.000000, 1275.00000, 6, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the solar system, closest to the sun.', false, 4600.000000, 91.70000, true, false, 0, 1, 6);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hot planet with a dense carbon dioxide atmosphere.', false, 4600.000000, 41.40000, true, false, 0, 1, 5);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet, the only known planet with life.', true, 4600.000000, 0.00000, true, false, 0, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet, named after the Roman god of war.', false, 4600.000000, 78.30000, true, false, 0, 1, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in the solar system, a gas giant.', false, 4600.000000, 628.70000, true, true, 95, 1, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its extensive ring system.', false, 4600.000000, 1275.00000, true, true, 146, 1, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant that rotates on its side.', false, 4600.000000, 2724.00000, true, true, 28, 1, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Farthest planet from the sun, with the strongest winds.', false, 4600.000000, 4351.00000, true, true, 16, 1, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Former ninth planet, now classified as a dwarf planet.', false, 4600.000000, 5750.00000, true, true, 5, 1, 3);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Largest object in the asteroid belt between Mars and Jupiter.', false, 4600.000000, 414.00000, true, false, 0, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Eris', 'Icy dwarf planet in the scattered disc, slightly heavier than Pluto.', false, 4600.000000, 10150.00000, true, false, 0, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Elongated dwarf planet that spins very fast.', false, 4600.000000, 6450.00000, true, true, 2, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The yellow dwarf star at the center of our solar system.', false, 4600.0000, 0.0000, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky, a binary star system.', false, 242.0000, 8.6000, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Closest star system to Earth after the Sun, a triple star system.', false, 6000.0000, 4.3700, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant star in the constellation Orion, nearing the end of its life.', false, 9000.0000, 642.5000, 1);
INSERT INTO public.star VALUES (5, 'S Andromedae', 'A famous supernova observed in the Andromeda Galaxy in 1885.', false, 20000.0000, 2537000.0000, 2);
INSERT INTO public.star VALUES (6, 'Sanduleak -69 202', 'The star that exploded as Supernova 1987A in the Large Magellanic Cloud.', false, 20000.0000, 163000.0000, 4);


--
-- Name: galaxy_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_table_id_seq', 6, true);


--
-- Name: god_god_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.god_god_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: god god_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.god
    ADD CONSTRAINT god_name_key UNIQUE (name);


--
-- Name: god god_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.god
    ADD CONSTRAINT god_pkey PRIMARY KEY (god_id);


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
-- Name: moon moon_god_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_god_id_fkey FOREIGN KEY (god_id) REFERENCES public.god(god_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_god_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_god_id_fkey FOREIGN KEY (god_id) REFERENCES public.god(god_id);


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

