--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.2 (Ubuntu 15.2-1.pgdg22.04+1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    created_at date NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer NOT NULL,
    "createdAt" date NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" date NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 4, '89e358bf-0c52-43e1-8943-6e7f63e5eb89', '2023-03-01');
INSERT INTO public.sessions VALUES (2, 3, '13e53c78-85da-4cc5-a019-e0285533653f', '2023-03-01');
INSERT INTO public.sessions VALUES (3, 3, '2ad1671c-d746-4e10-b65a-322316287677', '2023-03-01');
INSERT INTO public.sessions VALUES (4, 4, '568efa63-c226-43d6-ac84-0bc527bd4b68', '2023-03-02');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 3, 'https://www.netflix.com/br/title/70205012', '3scCrPW', 0, '2023-03-02');
INSERT INTO public.urls VALUES (4, 3, 'https://social.msdn.microsoft.com/Forums/sqlserver/pt-BR/77a8cf7e-f94f-41ce-aa6c-46542e7dea55/update-em-apenas-uma-coluna?forum=520', '32pau2w', 0, '2023-03-02');
INSERT INTO public.urls VALUES (6, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=oQ6&channel=fs&sxsrf=AJOqlzW5KsYbFn3r4OgZQYiVXtfTgM4rjg:1677758461946&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjcqpKpmb39AhUsIrkGHcQrD08Q_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=D59j4uMrfMDylM', 'HZLTDiv', 0, '2023-03-02');
INSERT INTO public.urls VALUES (8, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=tR6&channel=fs&sxsrf=AJOqlzXDJrGcXgjNvJHbPRaNvZbVCpv-rA:1677758528952&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiGgIzJmb39AhXlGrkGHau0DRYQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=Js400tQrugp9PM', 'WSlK0M3', 0, '2023-03-02');
INSERT INTO public.urls VALUES (9, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=m8Q&channel=fs&sxsrf=AJOqlzXqsS7GlhmJYwDd39WU71UZvGHrug:1677758621432&source=lnms&tbm=isch&sa=X&ved=2ahUKEwj-wJj1mb39AhVeG7kGHbfWAzYQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=Xew_EmCcGjIZUM', 'R2jp4-S', 0, '2023-03-02');
INSERT INTO public.urls VALUES (11, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=7DRTpRx1QibgwM', 'm5mq8Z1', 0, '2023-03-02');
INSERT INTO public.urls VALUES (12, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=D59j4uMrfMDylM&imgdii=HUqk4YSEyFf0eM', '5bIIMAc', 0, '2023-03-02');
INSERT INTO public.urls VALUES (13, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=rKwP1Kdsj2eKcM', 'OXe3CKE', 0, '2023-03-02');
INSERT INTO public.urls VALUES (15, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=b9332pkolmiWRM', 'aKHCNps', 0, '2023-03-02');
INSERT INTO public.urls VALUES (16, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=OwPotRrfo-BriM', 'Fij5wFs', 0, '2023-03-02');
INSERT INTO public.urls VALUES (17, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=GrbZb7tWrf_UcM', '4xNHWZa', 0, '2023-03-02');
INSERT INTO public.urls VALUES (18, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=lkXG069Cy0g1nM', '6ZCxpXs', 0, '2023-03-02');
INSERT INTO public.urls VALUES (21, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=YBU9b0kS-4Lu6M', 'UGHE_sD', 0, '2023-03-02');
INSERT INTO public.urls VALUES (23, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=EtBpQEu6CJw5tM', 'u637Gm_', 0, '2023-03-02');
INSERT INTO public.urls VALUES (24, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=nYTEQxF1u6PyEM', '8r_-PXO', 0, '2023-03-02');
INSERT INTO public.urls VALUES (25, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=B-0bqY4_XPTPjM', '3pRbFW6', 0, '2023-03-02');
INSERT INTO public.urls VALUES (27, 3, 'https://www.google.com/search?q=fluminense&client=ubuntu&hs=hAR&channel=fs&sxsrf=AJOqlzXNFLFgk7UHkSWbHVpMtbLpF_Ec1w:1677758740675&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjAyoaumr39AhWCB9QKHcbZA6oQ_AUoAnoECAEQBA&biw=1920&bih=933&dpr=1#imgrc=iQzcDy_OWL0jcM', 'cz-PZ20', 0, '2023-03-02');
INSERT INTO public.urls VALUES (5, 3, 'https://www.instagram.com/p/CPXEbdUhEzG/', 'U2SroDp', 3, '2023-03-02');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (3, 'Marcos Magalhães', 'marcos@gmail.com', '$2b$10$V9zbY6d4WjEUlh2S12Imz.Uy1gCHNBVT/Oh5FSNnkZiwO491rgGZG', '2023-02-28');
INSERT INTO public.users VALUES (4, 'juninho', 'juninho@gmail.com', '$2b$10$YZp2Gk3B4tmkvN9UuXaIzONwtW13CO11O8WlQw8cqzNrIM7/8Zewe', '2023-03-01');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: urls urls_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_url_key UNIQUE (url);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

