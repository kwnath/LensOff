--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: kwnath
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO kwnath;

--
-- Name: attachinary_files; Type: TABLE; Schema: public; Owner: kwnath
--

CREATE TABLE attachinary_files (
    id integer NOT NULL,
    attachinariable_type character varying,
    attachinariable_id integer,
    scope character varying,
    public_id character varying,
    version character varying,
    width integer,
    height integer,
    format character varying,
    resource_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE attachinary_files OWNER TO kwnath;

--
-- Name: attachinary_files_id_seq; Type: SEQUENCE; Schema: public; Owner: kwnath
--

CREATE SEQUENCE attachinary_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE attachinary_files_id_seq OWNER TO kwnath;

--
-- Name: attachinary_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kwnath
--

ALTER SEQUENCE attachinary_files_id_seq OWNED BY attachinary_files.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: kwnath
--

CREATE TABLE bookings (
    id integer NOT NULL,
    user_id integer,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    lense_id integer
);


ALTER TABLE bookings OWNER TO kwnath;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: kwnath
--

CREATE SEQUENCE bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bookings_id_seq OWNER TO kwnath;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kwnath
--

ALTER SEQUENCE bookings_id_seq OWNED BY bookings.id;


--
-- Name: lenses; Type: TABLE; Schema: public; Owner: kwnath
--

CREATE TABLE lenses (
    id integer NOT NULL,
    name character varying,
    description text,
    price integer,
    condition character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    brandname character varying,
    aperture_min integer,
    aperture_max integer,
    focal_length_min integer,
    focal_length_max integer,
    image_stabilization character varying,
    mount_type character varying,
    camera_type character varying,
    user_id integer,
    address character varying,
    latitude double precision,
    longitude double precision
);


ALTER TABLE lenses OWNER TO kwnath;

--
-- Name: lenses_id_seq; Type: SEQUENCE; Schema: public; Owner: kwnath
--

CREATE SEQUENCE lenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lenses_id_seq OWNER TO kwnath;

--
-- Name: lenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kwnath
--

ALTER SEQUENCE lenses_id_seq OWNED BY lenses.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: kwnath
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO kwnath;

--
-- Name: taggings; Type: TABLE; Schema: public; Owner: kwnath
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_type character varying,
    taggable_id integer,
    tagger_type character varying,
    tagger_id integer,
    context character varying(128),
    created_at timestamp without time zone
);


ALTER TABLE taggings OWNER TO kwnath;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: kwnath
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggings_id_seq OWNER TO kwnath;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kwnath
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: kwnath
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying,
    taggings_count integer DEFAULT 0
);


ALTER TABLE tags OWNER TO kwnath;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: kwnath
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO kwnath;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kwnath
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: kwnath
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    uid character varying,
    facebook_picture_url character varying,
    first_name character varying,
    last_name character varying,
    token character varying,
    token_expiry timestamp without time zone
);


ALTER TABLE users OWNER TO kwnath;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kwnath
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO kwnath;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kwnath
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: attachinary_files id; Type: DEFAULT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY attachinary_files ALTER COLUMN id SET DEFAULT nextval('attachinary_files_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY bookings ALTER COLUMN id SET DEFAULT nextval('bookings_id_seq'::regclass);


--
-- Name: lenses id; Type: DEFAULT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY lenses ALTER COLUMN id SET DEFAULT nextval('lenses_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: kwnath
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-06-20 06:48:19.360918	2017-06-20 06:48:19.360918
\.


--
-- Data for Name: attachinary_files; Type: TABLE DATA; Schema: public; Owner: kwnath
--

COPY attachinary_files (id, attachinariable_type, attachinariable_id, scope, public_id, version, width, height, format, resource_type, created_at, updated_at) FROM stdin;
1	Lense	4	photos	crni8nvewo6vrpb1dgvn	1497947303	\N	\N	png	image	2017-06-20 08:29:31.986342	2017-06-20 08:29:31.986342
2	Lense	4	photos	r00ijm5iwxnnybjqnnwk	1497947313	\N	\N	png	image	2017-06-20 08:29:33.044667	2017-06-20 08:29:33.044667
3	Lense	4	photos	qbzy1bygurqnsgq1gika	1497947318	\N	\N	png	image	2017-06-20 08:29:34.171657	2017-06-20 08:29:34.171657
4	Lense	5	photos	g2pdrjzr6tmwfsgai8l2	1498131449	675	450	jpg	image	2017-06-22 11:37:34.625359	2017-06-22 11:37:34.625359
5	Lense	6	photos	b5liianeemolzij3bci6	1498131497	675	450	jpg	image	2017-06-22 11:38:22.321471	2017-06-22 11:38:22.321471
6	Lense	7	photos	jq1ffykxgjexf2c1ateb	1498139356	675	450	jpg	image	2017-06-22 13:49:25.287673	2017-06-22 13:49:25.287673
\.


--
-- Name: attachinary_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kwnath
--

SELECT pg_catalog.setval('attachinary_files_id_seq', 6, true);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: kwnath
--

COPY bookings (id, user_id, start_date, end_date, created_at, updated_at, lense_id) FROM stdin;
1	2	2017-06-21 09:36:00	2017-06-21 09:36:00	2017-06-21 09:36:26.542579	2017-06-21 09:36:26.542579	3
2	2	2017-06-22 03:01:00	2017-06-22 03:01:00	2017-06-22 03:01:22.544622	2017-06-22 03:01:22.544622	4
3	3	\N	\N	2017-06-22 08:52:07.200411	2017-06-22 08:52:07.200411	4
4	3	2017-06-06 00:00:00	2017-06-06 00:00:00	2017-06-22 08:52:56.929398	2017-06-22 08:52:56.929398	4
\.


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kwnath
--

SELECT pg_catalog.setval('bookings_id_seq', 4, true);


--
-- Data for Name: lenses; Type: TABLE DATA; Schema: public; Owner: kwnath
--

COPY lenses (id, name, description, price, condition, created_at, updated_at, brandname, aperture_min, aperture_max, focal_length_min, focal_length_max, image_stabilization, mount_type, camera_type, user_id, address, latitude, longitude) FROM stdin;
1	The Line of Beauty	Paulist Press	863	good	2017-06-20 06:48:19.951736	2017-06-20 06:48:19.951736	Time of our Darkness	3	3	6	8	f	Andrews McMeel Publishing	Leafwood Publishers	\N	\N	\N	\N
2	What's Become of Waring	Lion Hudson	792	new	2017-06-20 06:48:19.960251	2017-06-20 06:48:19.960251	Jesting Pilate	1	2	4	4	t	Gaspereau Press	Paulist Press	\N	\N	\N	\N
3	Of Mice and Men	Blackstaff Press	944	used	2017-06-20 06:51:12.927921	2017-06-20 06:51:12.927921	Beneath the Bleeding	1	1	5	8	f	Imperial War Museum	Bantam Spectra	\N	\N	\N	\N
4	new	some description	6	Medium	2017-06-20 08:29:31.980498	2017-06-22 02:13:58.150669	canon	11	12	1	5	Yes	xr	canon	2	\N	\N	\N
5	Canon lense		123	Poor	2017-06-22 11:37:34.617283	2017-06-22 11:37:34.617283	Bower	2	3	4	6	No	Canon EOS	DSLR	3	123 yanping road	31.2287950000000016	121.440910000000002
6	Canon lense new		123	Poor	2017-06-22 11:38:22.314216	2017-06-22 11:38:22.314216	Canon	2	4	2	6	Yes	Fujifilm X Mount	DSLR	3	123 yanping road	31.2287950000000016	121.440910000000002
7	ANother lense		123	Very Good	2017-06-22 13:49:25.27244	2017-06-22 13:49:25.27244	Canon	1	2	3	5	Yes	Canon EOS	DSLR	3	678 anyuan road	31.2352220000000003	121.434546999999995
8	new		3	Medium	2017-06-23 03:59:39.373662	2017-06-23 03:59:39.373662	Canon	3	5	3	6	No	Fujifilm X Mount	SLR	3	123 yanping road	31.2287950000000016	121.440910000000002
\.


--
-- Name: lenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kwnath
--

SELECT pg_catalog.setval('lenses_id_seq', 8, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: kwnath
--

COPY schema_migrations (version) FROM stdin;
20170620053051
20170619102818
20170619102819
20170619102820
20170619102821
20170619102822
20170619102823
20170619104919
20170619112028
20170619112745
20170620001529
20170620014644
20170620041330
20170620073802
20170621070132
20170622034243
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: kwnath
--

COPY taggings (id, tag_id, taggable_type, taggable_id, tagger_type, tagger_id, context, created_at) FROM stdin;
\.


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kwnath
--

SELECT pg_catalog.setval('taggings_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: kwnath
--

COPY tags (id, name, taggings_count) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kwnath
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kwnath
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, provider, uid, facebook_picture_url, first_name, last_name, token, token_expiry) FROM stdin;
1	kwnath@gmail.com	$2a$11$oad1OvVRYBdkjbBDY4qaYOQVA3XfvD2cwpz627rHYqC7CSkQQtqsq	\N	\N	\N	1	2017-06-20 14:06:40.317472	2017-06-20 14:06:40.317472	127.0.0.1	127.0.0.1	2017-06-20 14:06:40.30077	2017-06-20 14:06:40.319144	\N	\N	\N	\N	\N	\N	\N
2	kwnathx@gmail.com	$2a$11$MaK4lxeBT2rGHgxjugnAJemXl8Pm3HQ0.bkOBG0KEu.POp0SFHl3.	\N	\N	\N	22	2017-06-22 07:37:53.503349	2017-06-22 07:36:25.505411	127.0.0.1	127.0.0.1	2017-06-20 14:15:38.720754	2017-06-22 07:37:53.504644	\N	\N	\N	\N	\N	\N	\N
3	123@gmail.com	$2a$11$2esjtY6l6FocVDOXc3B56eoqlkUWLY5a2QDfUiZm5XIVsTqQGRmwK	\N	\N	\N	1	2017-06-22 08:28:30.305316	2017-06-22 08:28:30.305316	127.0.0.1	127.0.0.1	2017-06-22 08:28:30.285962	2017-06-22 08:28:30.306704	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kwnath
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachinary_files attachinary_files_pkey; Type: CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY attachinary_files
    ADD CONSTRAINT attachinary_files_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: lenses lenses_pkey; Type: CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY lenses
    ADD CONSTRAINT lenses_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: by_scoped_parent; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX by_scoped_parent ON attachinary_files USING btree (attachinariable_type, attachinariable_id, scope);


--
-- Name: index_bookings_on_lense_id; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_bookings_on_lense_id ON bookings USING btree (lense_id);


--
-- Name: index_bookings_on_user_id; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_bookings_on_user_id ON bookings USING btree (user_id);


--
-- Name: index_lenses_on_user_id; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_lenses_on_user_id ON lenses USING btree (user_id);


--
-- Name: index_taggings_on_context; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_taggings_on_context ON taggings USING btree (context);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_taggings_on_taggable_id ON taggings USING btree (taggable_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_taggings_on_taggable_type ON taggings USING btree (taggable_type);


--
-- Name: index_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_taggings_on_tagger_id ON taggings USING btree (tagger_id);


--
-- Name: index_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX index_taggings_on_tagger_id_and_tagger_type ON taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE UNIQUE INDEX index_tags_on_name ON tags USING btree (name);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE UNIQUE INDEX taggings_idx ON taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: taggings_idy; Type: INDEX; Schema: public; Owner: kwnath
--

CREATE INDEX taggings_idy ON taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: bookings fk_rails_71d9fde87b; Type: FK CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT fk_rails_71d9fde87b FOREIGN KEY (lense_id) REFERENCES lenses(id);


--
-- Name: lenses fk_rails_eb9aed12af; Type: FK CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY lenses
    ADD CONSTRAINT fk_rails_eb9aed12af FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: bookings fk_rails_ef0571f117; Type: FK CONSTRAINT; Schema: public; Owner: kwnath
--

ALTER TABLE ONLY bookings
    ADD CONSTRAINT fk_rails_ef0571f117 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

