--
-- PostgreSQL database cluster dump
--

\restrict GWwgxaJf5WTfrbbQqUUP9x0o0Gqh3UhJMNQ9qnuGkjNutPXUqee2KK5eTFIkbz3

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:6qzj3nbk6tvEuh9LFalLew==$uLbrdjhxy60skdKgUB/w/bdZ2ixJLnZ7U8UkPt/Jb1Y=:vLXGaa5dtSVP5jw2+LcZIM/JspwgTYhaRnSoaPzypdU=';
CREATE ROLE sklad_user;
ALTER ROLE sklad_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:V1VmnZAeiMzZBo2/hz7DNw==$e1YRRZhXyIYrZrVh7CHLrBOVJlgsOYJb3NBjk0E6eF0=:wrLYQo0OHof9ukXtV+wnHwuHok4gkmMwNGPkxB3sE4s=';

--
-- User Configurations
--








\unrestrict GWwgxaJf5WTfrbbQqUUP9x0o0Gqh3UhJMNQ9qnuGkjNutPXUqee2KK5eTFIkbz3

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict 3HbLZXEFY9ftRbCZbvT2wTO2GfhC9yhLTHyLzrapLuu0Ise7Gi7rc40c1Hxki4A

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict 3HbLZXEFY9ftRbCZbvT2wTO2GfhC9yhLTHyLzrapLuu0Ise7Gi7rc40c1Hxki4A

--
-- Database "Tashksz-bot-db" dump
--

--
-- PostgreSQL database dump
--

\restrict HUc986t2surzVQyV5L0bL6fWRXvfNHjLVWKprQlQxfrU9juJn7ShMHvMjsWvmwD

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: Tashksz-bot-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Tashksz-bot-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE "Tashksz-bot-db" OWNER TO postgres;

\unrestrict HUc986t2surzVQyV5L0bL6fWRXvfNHjLVWKprQlQxfrU9juJn7ShMHvMjsWvmwD
\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='Tashksz-bot-db'"
\restrict HUc986t2surzVQyV5L0bL6fWRXvfNHjLVWKprQlQxfrU9juJn7ShMHvMjsWvmwD

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: admin_add_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_add_sessions (
    super_admin_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.admin_add_sessions OWNER TO postgres;

--
-- Name: admin_broadcast_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_broadcast_sessions (
    admin_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    message_text character varying(3500)
);


ALTER TABLE public.admin_broadcast_sessions OWNER TO postgres;

--
-- Name: admin_review_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_review_sessions (
    admin_id bigint NOT NULL,
    application_id bigint NOT NULL,
    notification_chat_id bigint NOT NULL,
    notification_message_id integer NOT NULL
);


ALTER TABLE public.admin_review_sessions OWNER TO postgres;

--
-- Name: bot_admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bot_admin (
    slot_id integer NOT NULL,
    chat_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    telegram_user_id bigint NOT NULL,
    telegram_username character varying(64)
);


ALTER TABLE public.bot_admin OWNER TO postgres;

--
-- Name: review_chat_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_chat_configuration (
    slot_id integer NOT NULL,
    chat_id bigint NOT NULL,
    chat_type character varying(20) NOT NULL,
    direct_messages_topic_id integer,
    message_thread_id integer,
    title character varying(255),
    updated_at timestamp(6) with time zone NOT NULL,
    updated_by bigint NOT NULL,
    username character varying(64)
);


ALTER TABLE public.review_chat_configuration OWNER TO postgres;

--
-- Name: service_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_applications (
    id bigint NOT NULL,
    attachment_file_id character varying(512),
    attachment_type character varying(20),
    category character varying(40),
    created_at timestamp(6) with time zone NOT NULL,
    description character varying(2000) NOT NULL,
    full_name character varying(120),
    organization_name character varying(150) NOT NULL,
    phone character varying(20),
    region character varying(40),
    rejection_reason character varying(1000),
    reviewed_at timestamp(6) with time zone,
    reviewed_by bigint,
    revision integer NOT NULL,
    status character varying(20) NOT NULL,
    submitted_at timestamp(6) with time zone NOT NULL,
    telegram_user_id bigint NOT NULL,
    telegram_username character varying(64),
    user_chat_id bigint NOT NULL,
    user_direct_messages_topic_id integer,
    user_message_thread_id integer,
    version bigint NOT NULL,
    CONSTRAINT service_applications_attachment_type_check CHECK (((attachment_type)::text = ANY ((ARRAY['PHOTO'::character varying, 'VIDEO'::character varying, 'VIDEO_NOTE'::character varying])::text[]))),
    CONSTRAINT service_applications_category_check CHECK (((category)::text = ANY ((ARRAY['TECHNICAL_TERMS'::character varying, 'EMERGENCY'::character varying, 'METER'::character varying, 'CONNECTION'::character varying, 'OTHER'::character varying])::text[]))),
    CONSTRAINT service_applications_region_check CHECK (((region IS NULL) OR ((region)::text = ANY ((ARRAY['BEKTEMIR_KSZ'::character varying, 'MIRZO_ULUGBEK_KSZ'::character varying, 'MIRZO_ULUGBEK_KSZ_2_CHINGILDI'::character varying, 'CHILONZOR_KSZ'::character varying, 'CHILONZOR_2_SOFTPLAST_KSZ'::character varying, 'SERGELI_KSZ'::character varying, 'UCHTEPA_KSZ'::character varying, 'YAKKASAROY_KSZ'::character varying, 'YUNUSOBOD_KSZ'::character varying, 'UCHTEPA_YOSHLAR_SZ'::character varying, 'YASHNOBOD_YOSHLAR_SZ'::character varying, 'BEKTEMIR_YOSHLAR_SZ'::character varying, 'YANGIHAYOT_YOSHLAR_SZ'::character varying, 'BEKTEMIR_DISTRICT'::character varying, 'CHILONZOR_DISTRICT'::character varying, 'YASHNOBOD_DISTRICT'::character varying, 'MIROBOD_DISTRICT'::character varying, 'MIRZO_ULUGBEK_DISTRICT'::character varying, 'OLMAZOR_DISTRICT'::character varying, 'SERGELI_DISTRICT'::character varying, 'SHAYXONTOHUR_DISTRICT'::character varying, 'UCHTEPA_DISTRICT'::character varying, 'YAKKASAROY_DISTRICT'::character varying, 'YANGIHAYOT_DISTRICT'::character varying, 'YUNUSOBOD_DISTRICT'::character varying, 'ANDIJAN'::character varying, 'BUKHARA'::character varying, 'JIZZAKH'::character varying, 'KASHKADARYA'::character varying, 'NAVOI'::character varying, 'NAMANGAN'::character varying, 'SAMARKAND'::character varying, 'SURKHANDARYA'::character varying, 'SYRDARYA'::character varying, 'TASHKENT'::character varying, 'FERGANA'::character varying, 'KHOREZM'::character varying])::text[])))),
    CONSTRAINT service_applications_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'ACCEPTED'::character varying, 'REJECTED'::character varying])::text[])))
);


ALTER TABLE public.service_applications OWNER TO postgres;

--
-- Name: service_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.service_applications ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.service_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_conversations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_conversations (
    chat_id bigint NOT NULL,
    active_chat_id bigint,
    attachment_file_id character varying(512),
    attachment_type character varying(20),
    category character varying(40),
    description character varying(2000),
    direct_messages_topic_id integer,
    editing_application_id bigint,
    full_name character varying(120),
    message_thread_id integer,
    organization_name character varying(150),
    phone character varying(20),
    private_chat_id bigint,
    region character varying(40),
    single_field_edit boolean NOT NULL,
    step character varying(40) NOT NULL,
    telegram_user_id bigint NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    CONSTRAINT user_conversations_attachment_type_check CHECK (((attachment_type)::text = ANY ((ARRAY['PHOTO'::character varying, 'VIDEO'::character varying, 'VIDEO_NOTE'::character varying])::text[]))),
    CONSTRAINT user_conversations_category_check CHECK (((category)::text = ANY ((ARRAY['TECHNICAL_TERMS'::character varying, 'EMERGENCY'::character varying, 'METER'::character varying, 'CONNECTION'::character varying, 'OTHER'::character varying])::text[]))),
    CONSTRAINT user_conversations_region_check CHECK (((region IS NULL) OR ((region)::text = ANY ((ARRAY['BEKTEMIR_KSZ'::character varying, 'MIRZO_ULUGBEK_KSZ'::character varying, 'MIRZO_ULUGBEK_KSZ_2_CHINGILDI'::character varying, 'CHILONZOR_KSZ'::character varying, 'CHILONZOR_2_SOFTPLAST_KSZ'::character varying, 'SERGELI_KSZ'::character varying, 'UCHTEPA_KSZ'::character varying, 'YAKKASAROY_KSZ'::character varying, 'YUNUSOBOD_KSZ'::character varying, 'UCHTEPA_YOSHLAR_SZ'::character varying, 'YASHNOBOD_YOSHLAR_SZ'::character varying, 'BEKTEMIR_YOSHLAR_SZ'::character varying, 'YANGIHAYOT_YOSHLAR_SZ'::character varying, 'BEKTEMIR_DISTRICT'::character varying, 'CHILONZOR_DISTRICT'::character varying, 'YASHNOBOD_DISTRICT'::character varying, 'MIROBOD_DISTRICT'::character varying, 'MIRZO_ULUGBEK_DISTRICT'::character varying, 'OLMAZOR_DISTRICT'::character varying, 'SERGELI_DISTRICT'::character varying, 'SHAYXONTOHUR_DISTRICT'::character varying, 'UCHTEPA_DISTRICT'::character varying, 'YAKKASAROY_DISTRICT'::character varying, 'YANGIHAYOT_DISTRICT'::character varying, 'YUNUSOBOD_DISTRICT'::character varying, 'ANDIJAN'::character varying, 'BUKHARA'::character varying, 'JIZZAKH'::character varying, 'KASHKADARYA'::character varying, 'NAVOI'::character varying, 'NAMANGAN'::character varying, 'SAMARKAND'::character varying, 'SURKHANDARYA'::character varying, 'SYRDARYA'::character varying, 'TASHKENT'::character varying, 'FERGANA'::character varying, 'KHOREZM'::character varying])::text[])))),
    CONSTRAINT user_conversations_step_check CHECK (((step)::text = ANY ((ARRAY['IDLE'::character varying, 'WAITING_FULL_NAME'::character varying, 'WAITING_PHONE'::character varying, 'WAITING_ORGANIZATION'::character varying, 'WAITING_REGION'::character varying, 'WAITING_CATEGORY'::character varying, 'WAITING_DESCRIPTION'::character varying, 'WAITING_APPLICATION_DETAILS'::character varying, 'CONFIRMING'::character varying])::text[])))
);


ALTER TABLE public.user_conversations OWNER TO postgres;

--
-- Data for Name: admin_add_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_add_sessions (super_admin_id, created_at) FROM stdin;
\.


--
-- Data for Name: admin_broadcast_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_broadcast_sessions (admin_id, created_at, message_text) FROM stdin;
\.


--
-- Data for Name: admin_review_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_review_sessions (admin_id, application_id, notification_chat_id, notification_message_id) FROM stdin;
\.


--
-- Data for Name: bot_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bot_admin (slot_id, chat_id, created_at, telegram_user_id, telegram_username) FROM stdin;
1	6804133156	2026-07-27 08:50:35.304509+00	6804133156	Xojiakbar_Andaqulov
2	383766985	2026-07-27 11:28:55.324978+00	383766985	\N
3	8169296686	2026-07-27 11:46:05.235724+00	8169296686	\N
4	576536659	2026-07-28 09:47:26.908268+00	576536659	\N
5	7360104724	2026-07-28 09:57:09.803468+00	7360104724	\N
6	948490212	2026-07-28 10:10:21.834135+00	948490212	\N
7	8189689043	2026-07-28 10:13:46.775056+00	8189689043	\N
8	1499724	2026-07-28 11:21:21.943587+00	1499724	\N
9	6188891044	2026-07-28 11:21:41.076068+00	6188891044	\N
10	699108667	2026-07-28 11:22:00.74878+00	699108667	\N
11	982685801	2026-07-28 11:22:08.587994+00	982685801	\N
12	6613566896	2026-07-28 11:22:18.339315+00	6613566896	\N
13	2673543	2026-08-06 11:02:58.908666+00	2673543	\N
14	150368018	2026-08-12 11:21:41.016188+00	150368018	\N
\.


--
-- Data for Name: review_chat_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_chat_configuration (slot_id, chat_id, chat_type, direct_messages_topic_id, message_thread_id, title, updated_at, updated_by, username) FROM stdin;
1	-5345720212	group	\N	\N	test	2026-07-27 09:20:06.407754+00	6804133156	\N
\.


--
-- Data for Name: service_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_applications (id, attachment_file_id, attachment_type, category, created_at, description, full_name, organization_name, phone, region, rejection_reason, reviewed_at, reviewed_by, revision, status, submitted_at, telegram_user_id, telegram_username, user_chat_id, user_direct_messages_topic_id, user_message_thread_id, version) FROM stdin;
1	\N	\N	\N	2026-07-29 06:22:12.529356+00	Прощу подключить электроэнергию 981274829.	\N	YaTT. ZEMLYANSKIY YURIY VLADIIMIROVICH.	\N	YAKKASAROY_KSZ	\N	2026-07-29 06:26:38.910335+00	8169296686	1	ACCEPTED	2026-07-29 06:22:12.529356+00	76392819	\N	76392819	\N	\N	1
2	\N	\N	\N	2026-07-29 10:13:44.534772+00	«ELEGANT CERAMICS» MCHJ 2026-yil 1-mayda tuzilgan  0061-MU/26-sonli shartnomaga muvofiq Elektroenergiya tarmoqlariga ulab berishda amaliy yordam berishingizni so`raydi. +998500283594	\N	Ko'rsatilmagan	\N	MIRZO_ULUGBEK_KSZ	\N	2026-07-29 10:13:54.99584+00	8169296686	1	ACCEPTED	2026-07-29 10:13:44.534772+00	6565309129	Eldor062593	6565309129	\N	\N	1
3	\N	\N	\N	2026-07-30 09:20:07.007285+00	Bizlarda 2 kundan beri suv yo'q ,to'lov hamda shchochik buyicha hammasi joyda.Shu masalani hal qilib berishingizni so'rayman.	\N	Tadbirkorlar milliy Akademiyasi MCHJ	996639904	YAKKASAROY_KSZ	\N	2026-07-30 09:21:19.805392+00	8169296686	1	ACCEPTED	2026-07-30 09:20:07.007285+00	1901885823	sadullaev_04	1901885823	\N	\N	1
4	\N	\N	\N	2026-07-30 10:58:54.874747+00	бизга сув счётчигимизга опломбирование килиб беринг	\N	OOO PLASTCAP	+998909630634	MIRZO_ULUGBEK_KSZ	\N	2026-07-30 10:59:00.477715+00	8169296686	1	ACCEPTED	2026-07-30 10:58:54.874747+00	109598239	\N	109598239	\N	\N	1
5	\N	\N	\N	2026-07-31 04:48:49.141281+00	OOO ORGANIC SERVICE 👤 Ф.И.О.: SULTANOV A.SH. 📞 Телефон: +998 ( 91 ) 1630201, +998933192083, +998903479779 🏢 Наименование организации: OOO ORGANIC SERVICE 📌 Категория: (переподключение в электросети, перенос шкафа) 📝 Описание: перенос шкафа и ремонт.	\N	📥 Новая заявка:	\N	MIRZO_ULUGBEK_KSZ	\N	2026-07-31 04:56:18.484003+00	8169296686	1	ACCEPTED	2026-07-31 04:48:49.141281+00	89289939	XurshidYuldashev	89289939	\N	\N	1
6	\N	\N	\N	2026-07-31 05:06:17.823402+00	Eski shochikimiz yaxshi ishlamayapti	\N	Odil tekstil korxonamizda eski shochikni yangisiga almashtrib berishingizni soʻrayman elektor energiyadan	+998981284843	YAKKASAROY_KSZ	\N	2026-07-31 05:06:20.737767+00	8169296686	1	ACCEPTED	2026-07-31 05:06:17.823402+00	5324043547	mjrakhmatov	5324043547	\N	\N	1
7	\N	\N	\N	2026-08-04 07:11:29.857645+00	Сергели СЗ худудида янги тадбиркор CAISER MCHJ корхонаси ишбошламокда. Бу ташкилотга сув ва канализация уланишда амалий ёрдам керак.	\N	Ko'rsatilmagan	\N	SERGELI_KSZ	\N	2026-08-04 07:11:45.742551+00	8169296686	1	ACCEPTED	2026-08-04 07:11:29.857645+00	982685801	\N	982685801	\N	\N	1
8	\N	\N	\N	2026-08-05 04:37:46.939582+00	Azizshoh Group MChJ yonidagi kolodisni tozalab berishda amaliy yordam berishingizni sorayman.	\N	Ko'rsatilmagan	\N	YAKKASAROY_KSZ	telefon nomer qoldiring	2026-08-05 04:46:28.690716+00	383766985	1	REJECTED	2026-08-05 04:37:46.939582+00	1186733236	\N	1186733236	\N	\N	1
9	\N	\N	\N	2026-08-05 06:50:31.703428+00	2 блок кирвуриш уртага  Газоблок тахланган, Машинамиз билан махсулот олиб кира олмаяммиз, илтимос Quilting textiles MCHJ	\N	Ассаламу алайкум	990810505	YAKKASAROY_KSZ	\N	2026-08-05 06:52:43.242418+00	8169296686	1	ACCEPTED	2026-08-05 06:50:31.703428+00	1945050454	Cardinar_Taminot	1945050454	\N	\N	1
10	AgACAgIAAxkBAAIE9WpzGfmM-EfA-RFyTrQ4TBSjGt6EAAICHWsbVOKYS8vlG8PIUEp4AQADAgADeQADPQQ	PHOTO	\N	2026-08-05 11:11:32.975743+00	7 blok Assalomu alaykum ish faoliyatimizni boshlay olomayommiz Biz E-ouksiondan 1804 kv bush turgan bino yutib olingan Lekin 2 oy bilishiga qaramasdan bizani ish faoliyatimiz boshlay olganimiz yuq Yaks quality degan korxonani aborodiniyasi va qoplari  haliyam olib chiqilgani yuq yozma yarivishda xat ham qilib berdim 10 kundan buyon tuliq tozalab ketilgani yuq Biz invistetsiya kiritishimiz kerak kotta stanoklar kirgizib ustanofka qilishimiz kerak Bu eski narsalar olib ketmasdan ustanofka qilsak kegin chiqazib bumeydi chiqarish uchun bizlar chiqarishimizga toʻgʻri keladi Chiqarishimiz bizga ustanofkasi 60  million shunga tushadi Shu sababli 2 oydan buyon stanok quyolmayomz Bizni harakatlarimiz orqaga ketobdi Iltimos amaliy yordam bereylar	\N	Doorline Pro MCHJ	505870008	YAKKASAROY_KSZ	\N	2026-08-05 11:45:29.553229+00	8169296686	3	ACCEPTED	2026-08-05 11:37:19.206284+00	8781843213	abubakrluxe1111	8781843213	\N	\N	5
11	\N	\N	\N	2026-08-06 05:00:51.503486+00	Usrename@samatov	\N	Azizshoh Group MChJ yonidagi kolodisni tozalab berishda amaliy yordam berishingizni sorayman.	+998977420854	YAKKASAROY_KSZ	\N	2026-08-06 05:01:16.534482+00	8169296686	1	ACCEPTED	2026-08-06 05:00:51.503486+00	1186733236	samatov2222	1186733236	\N	\N	1
12	\N	\N	\N	2026-08-06 07:36:56.074078+00	Ассаламу алайкум 2 блокдаги том кисмимизда ёнгин содир булган эди, ромлар ва ойналар синдириб цехимизни ичига мусор ташалган, шунга амалий ёрдам беришингизни сураймиз.	\N	Quilting textiles MCHJ	990810505	YAKKASAROY_KSZ	\N	2026-08-06 07:56:23.921332+00	6188891044	1	ACCEPTED	2026-08-06 07:36:56.074078+00	1945050454	Cardinar_Taminot	1945050454	\N	\N	1
13	\N	\N	\N	2026-08-09 05:43:29.156423+00	Ассаламу алайкум Бизни цехимизга подстанциядан электр токини ёкиб беришга амалий ёрдам беришингизни сураймиз.	\N	Quilting textiles MCHJ	990810505	YAKKASAROY_KSZ	\N	2026-08-09 05:43:54.603566+00	8169296686	1	ACCEPTED	2026-08-09 05:43:29.156423+00	1945050454	Cardinar_Taminot	1945050454	\N	\N	1
14	BAACAgIAAxkBAAIFzmp6mTDZdSN8SIyPT3-56T7Ujt3vAALMmAACuunYS5N0VPVOwyANPQQ	VIDEO	\N	2026-08-11 03:38:32.376061+00	Usrename@samatov	\N	Azizshoh Group MChJ yonidagi kolodisni tozalab berishda amaliy yordam berishingizni sorayman.	+998977420854	YAKKASAROY_KSZ	\N	2026-08-11 03:38:43.556772+00	8169296686	1	ACCEPTED	2026-08-11 03:38:32.376061+00	1186733236	samatov2222	1186733236	\N	\N	1
15	\N	\N	\N	2026-08-12 09:58:33.69469+00	Ассаламу алайкум 2 блокдаги ТОМ ёпиш ишлари охирига етмади, колган том ёпиш  ишлари  качон давом этишида амалий ёрдам беришингизни сураймиз.	\N	Quilting textiles MCHJ	990810505	YAKKASAROY_KSZ	\N	2026-08-12 09:59:08.80779+00	8169296686	1	ACCEPTED	2026-08-12 09:58:33.69469+00	1945050454	Cardinar_Taminot	1945050454	\N	\N	1
16	\N	\N	\N	2026-08-13 08:27:06.955702+00	янги сув счёчиги ўрнатилди электрон бу счёчикни пломбалаб кетишингизни сўраймиз	\N	ООО " Имунекс " корхонаси 8 - блок	97 900 99 81	YAKKASAROY_KSZ	\N	2026-08-13 08:28:33.249498+00	8169296686	1	ACCEPTED	2026-08-13 08:27:06.955702+00	257024763	J_Mavlyanov	257024763	\N	\N	1
17	BAACAgIAAxkBAAIGSWqCpCFSyeV-ZVCx3bgBJNk04Z03AAIsnwACMv0ZSGEg8SnhteKLPQQ	VIDEO	\N	2026-08-17 06:08:40.380425+00	Usrename@samatov	\N	Azizshoh Group MChJ yonidagi kolodisni tozalab berishda amaliy yordam berishingizni sorayman.	+998977420854	YAKKASAROY_KSZ	\N	2026-08-17 06:09:03.574835+00	8169296686	1	ACCEPTED	2026-08-17 06:08:40.380425+00	1186733236	samatov2222	1186733236	\N	\N	1
18	\N	\N	\N	2026-08-17 08:46:00.084034+00	Qazilgan joyi komib berila	\N	Ifor ash	900423030	YAKKASAROY_KSZ	кайси блок езиб беринг	2026-08-17 08:47:03.170011+00	8169296686	1	REJECTED	2026-08-17 08:46:00.084034+00	1619387222	AzizjonHv	1619387222	\N	\N	1
19	\N	\N	\N	2026-08-17 08:57:23.388652+00	10 blok Qazilgan joyni komib tekislab berila Moshinala otishi muommo bovoti	\N	Ifor ash	900423030	YAKKASAROY_KSZ	\N	2026-08-17 08:57:39.632791+00	8169296686	1	ACCEPTED	2026-08-17 08:57:23.388652+00	1619387222	AzizjonHv	1619387222	\N	\N	1
20	\N	\N	\N	2026-08-18 06:46:53.255465+00	DENIZ KIMYA PRODUCTION, 95 18080 84	\N	Ko'rsatilmagan	+998991808073	YAKKASAROY_KSZ	Murojaat sababi yozib bering	2026-08-18 06:49:42.146418+00	8169296686	1	REJECTED	2026-08-18 06:46:53.255465+00	7036294968	buxgalterdeniz	7036294968	\N	\N	1
21	BAACAgIAAxkBAAIHCmqEPI8TPwj8WToAAYYD1Io-Db7FHwAC9aYAAidIIEi61WxpiKvLWD0E	VIDEO	\N	2026-08-18 11:09:01.74115+00	👤 Ф.И.О.: Nugmanov Robert 📞 Телефон: +998 ( 90 ) 9809669 🏢 Наименование организации: FRAN STYLE 6 блок, ориентир памятник, 8 этажка. забилась канализация - 2 люка	\N	📥 Новая заявка: OOO FRAN STYLE	+998909809669	YAKKASAROY_KSZ	\N	2026-08-18 11:09:32.833084+00	8169296686	1	ACCEPTED	2026-08-18 11:09:01.74115+00	2698622	Robertnf	2698622	\N	\N	1
22	\N	\N	\N	2026-08-18 11:43:29.968002+00	BOSHQARISH DIREKSIYASI" DM рахбари И.Т. Усмановга МУРОЖААТ ХАТИ "IRON ART" МЧЖ Узбекистон Республикаси "E-auksion" электрон савдо найдончасида утказилган электрон онлайн-аукцион натижаларига кура, 24243298-сонли лот буйича голиб деб топилган. Мазкур аукцион "TOSHKENT SHAHAR SANAT ZONALARINI BOSHQARISH DIREKSIYASI" Мнинг 29.06.2026 йилдаги 260226481158-1-сонли аризаси асосида утказилган булиб, аукцион натижалари турисидаги DA-1349454-сонли баннома 23.07.2026 йилда расмийлаштирилган. Аукцион натижаларига асосан, Тошкент шахри, Мирзо Улугбек тумани, Ахмад Югнакий МФИ, Буюк Ипак Йули кучаси, 434-уй манзилида жойлашган, "TOSHKENT SHAHAR SANOAT ZONALARINI BOSHQARISH DIREKSIYASI® DM балансидаги 715 кв.м майдондаги бино ва иншоот кисми "IRON ART" МЧЖга 60 ой муддатта ижарага берилган. Мазкур объектдан фойдаланиш ва ишлаб чикариш фалиятини йулга куйиш максадида объектни зарур мухандислик-коммуникация тармокларига, жумладан электр энергияси хамда сув таминоти тармокларига улаш масаласида амалий ердам курсатишингизни сураймиз. Шу муносабат билан, объектни электр энергияси ва сув таминоти тармокларига улаш буйича тегишли масьул ташкилотлар билан келишиш, техник шартларни олиш ва зарур ташкилий масалаларни хал этишда амалий кумак беришингизни сураймиз. Илова: ﻿﻿﻿﻿E-auksion натижалари турисидаги DA-1349454-сонли баённома нусхаси. ﻿﻿﻿﻿Давлат кучмас мулкини ижарага бериш тугрисидаги 1104621/04-26-сонли шартнома нусхаси. "IRON ART" МЧЖ Рахбари _ «18» август 2026 йил Пир ARON ART	\N	"TOSHKENT SHAHAR SANOAT ZONALARINI	998900073000	MIRZO_ULUGBEK_KSZ	\N	2026-08-18 11:47:17.937629+00	8169296686	1	ACCEPTED	2026-08-18 11:43:29.968002+00	5095355976	Iron_artt	5095355976	\N	\N	1
\.


--
-- Data for Name: user_conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_conversations (chat_id, active_chat_id, attachment_file_id, attachment_type, category, description, direct_messages_topic_id, editing_application_id, full_name, message_thread_id, organization_name, phone, private_chat_id, region, single_field_edit, step, telegram_user_id, updated_at) FROM stdin;
89289939	89289939	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89289939	MIRZO_ULUGBEK_KSZ	f	IDLE	89289939	2026-07-31 04:51:05.43055+00
6188891044	6188891044	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6188891044	BEKTEMIR_KSZ	f	WAITING_APPLICATION_DETAILS	6188891044	2026-07-28 17:39:13.166811+00
76392819	76392819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	76392819	YAKKASAROY_KSZ	f	IDLE	76392819	2026-07-29 06:22:12.566717+00
610942821	610942821	\N	\N	\N	+998974446490, Сиздан ҳисоблагични муҳирлаб беришингизни сўраймиз	\N	\N	\N	\N	Ko'rsatilmagan	\N	610942821	MIRZO_ULUGBEK_KSZ	f	CONFIRMING	610942821	2026-07-31 05:09:23.097845+00
893021400	893021400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	893021400	\N	f	IDLE	893021400	2026-07-31 05:02:53.239481+00
5676981180	-1003739458404	\N	\N	\N	\N	\N	\N	\N	929	\N	\N	\N	\N	f	IDLE	5676981180	2026-07-28 04:36:09.049382+00
1087968824	-1003739458404	\N	\N	\N	\N	\N	\N	\N	937	\N	\N	\N	\N	f	IDLE	1087968824	2026-07-28 04:36:09.049382+00
1901885823	1901885823	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1901885823	YAKKASAROY_KSZ	f	IDLE	1901885823	2026-07-30 09:20:07.010547+00
293651237	293651237	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	293651237	\N	f	IDLE	293651237	2026-07-28 04:36:09.049382+00
537686007	537686007	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	537686007	MIRZO_ULUGBEK_KSZ	f	IDLE	537686007	2026-07-28 04:36:09.049382+00
1154039718	-5345720212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	IDLE	1154039718	2026-07-28 04:36:09.049382+00
7360104724	7360104724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7360104724	\N	f	IDLE	7360104724	2026-07-28 09:58:58.436665+00
232334523	232334523	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	232334523	\N	f	IDLE	232334523	2026-07-28 19:20:21.070506+00
8189689043	8189689043	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8189689043	UCHTEPA_KSZ	f	WAITING_APPLICATION_DETAILS	8189689043	2026-07-29 06:23:50.950545+00
77423118	77423118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	77423118	\N	f	IDLE	77423118	2026-07-29 03:43:23.625945+00
206440485	206440485	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	206440485	\N	f	IDLE	206440485	2026-07-29 03:46:09.260854+00
43843810	43843810	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	43843810	\N	f	IDLE	43843810	2026-07-29 03:53:30.609257+00
239601067	239601067	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	239601067	\N	f	IDLE	239601067	2026-07-30 10:36:50.791617+00
66661799	66661799	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	66661799	MIRZO_ULUGBEK_KSZ_2_CHINGILDI	f	WAITING_APPLICATION_DETAILS	66661799	2026-07-28 05:53:16.761867+00
1348743619	1348743619	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1348743619	\N	f	IDLE	1348743619	2026-08-06 02:42:46.152962+00
254349070	254349070	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	254349070	\N	f	IDLE	254349070	2026-07-28 05:57:23.173069+00
6613566896	6613566896	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6613566896	\N	f	IDLE	6613566896	2026-07-28 11:34:02.964483+00
7323396063	7323396063	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7323396063	\N	f	IDLE	7323396063	2026-07-28 05:58:29.835653+00
8781843213	8781843213	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8781843213	YAKKASAROY_KSZ	f	IDLE	8781843213	2026-08-05 11:37:19.206559+00
1481274	1481274	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1481274	\N	f	IDLE	1481274	2026-08-13 08:24:42.290542+00
8169296686	8169296686	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8169296686	YAKKASAROY_KSZ	f	IDLE	8169296686	2026-08-18 06:49:42.136418+00
352032934	352032934	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	352032934	\N	f	WAITING_REGION	352032934	2026-07-28 06:00:50.282172+00
109598239	109598239	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	109598239	MIRZO_ULUGBEK_KSZ	f	IDLE	109598239	2026-07-30 10:58:54.878587+00
118098835	118098835	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	118098835	\N	f	IDLE	118098835	2026-07-30 11:03:06.815443+00
318398497	318398497	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	318398497	\N	f	IDLE	318398497	2026-07-30 15:32:46.421453+00
5993857783	5993857783	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5993857783	\N	f	WAITING_REGION	5993857783	2026-07-28 11:44:15.614138+00
1499724	1499724	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1499724	\N	f	IDLE	1499724	2026-07-28 11:46:13.649882+00
8572214973	8572214973	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8572214973	YAKKASAROY_KSZ	f	WAITING_APPLICATION_DETAILS	8572214973	2026-07-28 06:13:44.649557+00
1056075883	1056075883	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1056075883	\N	f	IDLE	1056075883	2026-08-05 11:44:43.911852+00
157638291	157638291	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	157638291	\N	f	IDLE	157638291	2026-07-28 11:53:41.939815+00
576536659	576536659	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	576536659	\N	f	IDLE	576536659	2026-07-28 12:04:23.976687+00
7511667778	7511667778	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7511667778	\N	f	IDLE	7511667778	2026-07-29 04:49:57.351133+00
599375959	599375959	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	599375959	\N	f	IDLE	599375959	2026-07-28 08:11:09.226626+00
8099384098	8099384098	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8099384098	\N	f	IDLE	8099384098	2026-07-29 04:50:44.847945+00
948490212	948490212	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	948490212	\N	f	IDLE	948490212	2026-07-29 10:14:19.973746+00
6565309129	6565309129	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6565309129	MIRZO_ULUGBEK_KSZ	f	IDLE	6565309129	2026-07-29 10:14:27.198436+00
8044839400	8044839400	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	8044839400	YAKKASAROY_KSZ	f	WAITING_APPLICATION_DETAILS	8044839400	2026-07-28 08:47:32.104136+00
1091302185	1091302185	BAACAgIAAxkBAAIFoGp1yipIq0-_FuG3HBjUWWiG25_IAAJEnwACa2KwS753Dde7jfAePQQ	VIDEO	\N	Ariza video orqali yuborildi.	\N	\N	\N	\N	Ko'rsatilmagan	+998911664261	1091302185	YAKKASAROY_KSZ	t	WAITING_APPLICATION_DETAILS	1091302185	2026-08-07 12:08:07.816534+00
699108667	699108667	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	699108667	\N	f	IDLE	699108667	2026-07-28 10:34:55.955016+00
596067415	596067415	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	596067415	\N	f	IDLE	596067415	2026-07-30 00:06:58.725788+00
265775624	265775624	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	265775624	MIRZO_ULUGBEK_KSZ	f	WAITING_APPLICATION_DETAILS	265775624	2026-08-06 10:39:25.586933+00
114349169	114349169	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	114349169	\N	f	IDLE	114349169	2026-08-08 11:10:35.524743+00
2070808010	2070808010	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2070808010	YAKKASAROY_KSZ	f	WAITING_APPLICATION_DETAILS	2070808010	2026-08-01 17:21:08.252714+00
7934727841	7934727841	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	7934727841	MIRZO_ULUGBEK_KSZ	f	WAITING_APPLICATION_DETAILS	7934727841	2026-07-28 16:02:36.014685+00
187058426	187058426	\N	\N	\N	Bizga 1blok idial tar aga na kalodis tiqilgan suv toship ketvotti amaliy yordam sorimiz	\N	\N	\N	\N	Ko'rsatilmagan	974452535	187058426	YAKKASAROY_KSZ	f	CONFIRMING	187058426	2026-08-16 11:30:57.494615+00
583703468	583703468	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	583703468	\N	f	IDLE	583703468	2026-08-08 11:10:55.467119+00
5324043547	5324043547	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5324043547	YAKKASAROY_KSZ	f	IDLE	5324043547	2026-07-31 05:06:17.826276+00
2673543	2673543	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2673543	\N	f	IDLE	2673543	2026-08-06 09:32:47.702105+00
1619387222	1619387222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1619387222	YAKKASAROY_KSZ	f	IDLE	1619387222	2026-08-17 08:57:41.387876+00
1108888	1108888	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1108888	YAKKASAROY_KSZ	f	WAITING_APPLICATION_DETAILS	1108888	2026-08-12 07:18:37.469848+00
1186733236	1186733236	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1186733236	YAKKASAROY_KSZ	f	IDLE	1186733236	2026-08-17 06:08:40.385155+00
257024763	257024763	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	257024763	YAKKASAROY_KSZ	f	IDLE	257024763	2026-08-13 08:27:06.95993+00
982685801	982685801	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	982685801	SERGELI_KSZ	f	IDLE	982685801	2026-08-12 04:33:05.314318+00
933775535	933775535	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	933775535	YAKKASAROY_KSZ	f	WAITING_APPLICATION_DETAILS	933775535	2026-08-10 10:00:45.53437+00
6804133156	6804133156	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6804133156	BEKTEMIR_KSZ	f	IDLE	6804133156	2026-08-12 11:21:41.00164+00
150368018	150368018	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	150368018	\N	f	IDLE	150368018	2026-08-12 11:22:06.398222+00
1945050454	1945050454	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1945050454	YAKKASAROY_KSZ	f	IDLE	1945050454	2026-08-12 09:58:33.703212+00
5048903340	5048903340	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5048903340	YAKKASAROY_KSZ	f	WAITING_APPLICATION_DETAILS	5048903340	2026-08-14 07:02:14.598154+00
383766985	383766985	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	383766985	BEKTEMIR_KSZ	f	IDLE	383766985	2026-08-18 11:10:44.697027+00
7036294968	7036294968	\N	\N	\N	DENIZ KIMYA PRODUCTION, 95 18080 84	\N	20	\N	\N	Ko'rsatilmagan	+998991808073	7036294968	YAKKASAROY_KSZ	t	WAITING_APPLICATION_DETAILS	7036294968	2026-08-18 06:53:00.308658+00
2698622	2698622	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2698622	YAKKASAROY_KSZ	f	IDLE	2698622	2026-08-18 11:09:01.746451+00
5095355976	5095355976	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	5095355976	MIRZO_ULUGBEK_KSZ	f	IDLE	5095355976	2026-08-19 06:43:44.929238+00
\.


--
-- Name: service_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_applications_id_seq', 22, true);


--
-- Name: admin_add_sessions admin_add_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_add_sessions
    ADD CONSTRAINT admin_add_sessions_pkey PRIMARY KEY (super_admin_id);


--
-- Name: admin_broadcast_sessions admin_broadcast_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_broadcast_sessions
    ADD CONSTRAINT admin_broadcast_sessions_pkey PRIMARY KEY (admin_id);


--
-- Name: admin_review_sessions admin_review_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_review_sessions
    ADD CONSTRAINT admin_review_sessions_pkey PRIMARY KEY (admin_id);


--
-- Name: bot_admin bot_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bot_admin
    ADD CONSTRAINT bot_admin_pkey PRIMARY KEY (slot_id);


--
-- Name: review_chat_configuration review_chat_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_chat_configuration
    ADD CONSTRAINT review_chat_configuration_pkey PRIMARY KEY (slot_id);


--
-- Name: service_applications service_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_applications
    ADD CONSTRAINT service_applications_pkey PRIMARY KEY (id);


--
-- Name: bot_admin uk78ag9ewv2dqtk1owfn96gbdrh; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bot_admin
    ADD CONSTRAINT uk78ag9ewv2dqtk1owfn96gbdrh UNIQUE (telegram_user_id);


--
-- Name: user_conversations user_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_conversations
    ADD CONSTRAINT user_conversations_pkey PRIMARY KEY (chat_id);


--
-- Name: idx_application_status_submitted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_application_status_submitted ON public.service_applications USING btree (status, submitted_at);


--
-- Name: idx_application_user_created; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_application_user_created ON public.service_applications USING btree (telegram_user_id, created_at);


--
-- PostgreSQL database dump complete
--

\unrestrict HUc986t2surzVQyV5L0bL6fWRXvfNHjLVWKprQlQxfrU9juJn7ShMHvMjsWvmwD

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict NNUfFZK3Ke6sJN0rza1BEqfwEVWc9EtofdZQvrVBYUacGgRushPvsr42WW5VWuH

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

\unrestrict NNUfFZK3Ke6sJN0rza1BEqfwEVWc9EtofdZQvrVBYUacGgRushPvsr42WW5VWuH

--
-- Database "skalad_market_auth" dump
--

--
-- PostgreSQL database dump
--

\restrict x2ULhKl4N5o5AaAUTlcFlUvhwvafWSXfR3oDVKkwwxKdNJ1JXxp1upO2UNObJQI

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_auth; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_auth WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_auth OWNER TO sklad_user;

\unrestrict x2ULhKl4N5o5AaAUTlcFlUvhwvafWSXfR3oDVKkwwxKdNJ1JXxp1upO2UNObJQI
\connect skalad_market_auth
\restrict x2ULhKl4N5o5AaAUTlcFlUvhwvafWSXfR3oDVKkwwxKdNJ1JXxp1upO2UNObJQI

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: email_history; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.email_history (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    attempt_count integer,
    code character varying(255),
    email character varying(255),
    email_type character varying(255),
    CONSTRAINT email_history_email_type_check CHECK (((email_type)::text = ANY ((ARRAY['REGISTRATION'::character varying, 'RESET_PASSWORD'::character varying, 'CONFIRM_RESET_PASSWORD'::character varying])::text[])))
);


ALTER TABLE public.email_history OWNER TO sklad_user;

--
-- Name: email_history_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.email_history ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.email_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO sklad_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    failed_login_count integer,
    first_name character varying(255),
    keycloak_id character varying(255),
    last_login_at timestamp(6) without time zone,
    last_name character varying(255),
    locked_until timestamp(6) without time zone,
    password character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    status character varying(255),
    username character varying(255),
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['ADMIN'::character varying, 'SUPER_ADMIN'::character varying, 'BUYER'::character varying, 'SELLER'::character varying])::text[]))),
    CONSTRAINT users_status_check CHECK (((status)::text = ANY ((ARRAY['IN_REGISTRATION'::character varying, 'ACTIVE'::character varying, 'BLOCK'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO sklad_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: email_history; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.email_history (id, created_by, created_date, deleted, modified_by, modified_date, attempt_count, code, email, email_type) FROM stdin;
1	\N	2026-07-17 21:44:25.155291	f	\N	2026-07-17 21:44:25.155291	0	7729	ioa22052005@gmail.com	RESET_PASSWORD
2	\N	2026-07-17 21:44:25.194251	f	\N	2026-07-17 21:44:25.194251	0	7729	ioa22052005@gmail.com	RESET_PASSWORD
3	\N	2026-07-17 22:03:25.971725	f	\N	2026-07-17 22:03:25.971725	0	1435	hojiakbarandaqulov5@gmail.com	RESET_PASSWORD
4	\N	2026-07-17 22:03:25.985722	f	\N	2026-07-17 22:03:25.985722	0	1435	hojiakbarandaqulov5@gmail.com	RESET_PASSWORD
5	\N	2026-07-18 11:01:24.717007	f	\N	2026-07-18 11:01:24.717007	0	3995	dcdcecdvevehf@gmail.com	RESET_PASSWORD
6	\N	2026-07-18 11:01:24.736588	f	\N	2026-07-18 11:01:24.736588	0	3995	dcdcecdvevehf@gmail.com	RESET_PASSWORD
7	\N	2026-07-18 14:03:42.099054	f	\N	2026-07-18 14:03:42.099054	0	8948	andaqulovxojiakbar@gmail.com	RESET_PASSWORD
8	\N	2026-07-18 14:03:42.112329	f	\N	2026-07-18 14:03:42.112329	0	8948	andaqulovxojiakbar@gmail.com	RESET_PASSWORD
9	\N	2026-07-18 15:41:05.795377	f	\N	2026-07-18 15:41:05.795377	0	8632	codeuz91@gmail.com	RESET_PASSWORD
10	\N	2026-07-18 15:41:05.806947	f	\N	2026-07-18 15:41:05.806947	0	8632	codeuz91@gmail.com	RESET_PASSWORD
11	\N	2026-07-18 18:21:50.423036	f	\N	2026-07-18 18:21:50.423036	0	7550	m6mintm@gmail.com	RESET_PASSWORD
12	\N	2026-07-18 18:21:50.448107	f	\N	2026-07-18 18:21:50.448107	0	7550	m6mintm@gmail.com	RESET_PASSWORD
13	\N	2026-07-18 18:31:44.429222	f	\N	2026-07-18 18:31:44.429222	0	7398	genshinimpact19064@gmail.com	RESET_PASSWORD
14	\N	2026-07-18 18:31:44.437686	f	\N	2026-07-18 18:31:44.437686	0	7398	genshinimpact19064@gmail.com	RESET_PASSWORD
15	\N	2026-07-18 19:50:51.522219	f	\N	2026-07-18 19:50:51.522219	0	2962	erezepbaevzanpolat4@gmail.com	RESET_PASSWORD
16	\N	2026-07-18 19:50:51.533954	f	\N	2026-07-18 19:50:51.533954	0	2962	erezepbaevzanpolat4@gmail.com	RESET_PASSWORD
17	\N	2026-07-19 01:34:19.249748	f	\N	2026-07-19 01:34:19.249748	0	6027	johnsilver@gmail.com	RESET_PASSWORD
18	\N	2026-07-19 01:34:19.27787	f	\N	2026-07-19 01:34:19.27787	0	6027	johnsilver@gmail.com	RESET_PASSWORD
19	\N	2026-07-19 01:41:57.604373	f	\N	2026-07-19 01:41:57.604373	0	2961	admin@crm.com	RESET_PASSWORD
20	\N	2026-07-19 01:41:57.618286	f	\N	2026-07-19 01:41:57.618286	0	2961	admin@crm.com	RESET_PASSWORD
21	\N	2026-07-19 17:24:40.937575	f	\N	2026-07-19 17:24:40.937575	0	7940	gayipbaevrawshanbek@gmail.com	RESET_PASSWORD
22	\N	2026-07-19 17:24:40.953639	f	\N	2026-07-19 17:24:40.953639	0	7940	gayipbaevrawshanbek@gmail.com	RESET_PASSWORD
23	\N	2026-07-19 17:54:33.669492	f	\N	2026-07-19 17:54:33.669492	0	7425	john@mail.ru	RESET_PASSWORD
24	\N	2026-07-19 17:54:33.697373	f	\N	2026-07-19 17:54:33.697373	0	7425	john@mail.ru	RESET_PASSWORD
25	\N	2026-07-19 21:47:19.805461	f	\N	2026-07-19 21:47:19.805461	0	9018	debugtest_photo_991@example.com	RESET_PASSWORD
26	\N	2026-07-19 21:47:19.867995	f	\N	2026-07-19 21:47:19.867995	0	9018	debugtest_photo_991@example.com	RESET_PASSWORD
27	\N	2026-07-28 08:44:37.587352	f	\N	2026-07-28 08:44:37.587352	0	3094	shuxrat200068@gmail.com	RESET_PASSWORD
28	\N	2026-07-28 08:44:37.612777	f	\N	2026-07-28 08:44:37.612777	0	3094	shuxrat200068@gmail.com	RESET_PASSWORD
29	\N	2026-07-30 20:58:21.213619	f	\N	2026-07-30 20:58:21.213619	0	2617	andaqulovxojiakbar0@gmail.com	RESET_PASSWORD
30	\N	2026-07-30 20:58:21.240072	f	\N	2026-07-30 20:58:21.240072	0	2617	andaqulovxojiakbar0@gmail.com	RESET_PASSWORD
31	\N	2026-08-14 09:07:31.550613	f	\N	2026-08-14 09:07:31.550613	0	1847	jamaeu22@gmail.com	RESET_PASSWORD
32	\N	2026-08-14 09:07:31.576118	f	\N	2026-08-14 09:07:31.576118	0	1847	jamaeu22@gmail.com	RESET_PASSWORD
33	\N	2026-08-17 20:56:40.347215	f	\N	2026-08-17 20:56:40.347215	0	1442	xasanovumid1@gmail.com	RESET_PASSWORD
34	\N	2026-08-17 20:56:40.378687	f	\N	2026-08-17 20:56:40.378687	0	1442	xasanovumid1@gmail.com	RESET_PASSWORD
35	\N	2026-08-20 16:09:12.594156	f	\N	2026-08-20 16:09:12.594156	0	4569	genshinimpact19064@gmail.com	RESET_PASSWORD
36	\N	2026-08-20 16:09:24.145034	f	\N	2026-08-20 16:09:24.145034	0	9357	genshinimpact19064@gmail.com	RESET_PASSWORD
37	\N	2026-08-20 16:19:34.84611	f	\N	2026-08-20 16:19:34.84611	0	7856	samandarorazbaev838@gmail.com	RESET_PASSWORD
38	\N	2026-08-20 16:19:34.866427	f	\N	2026-08-20 16:19:34.866427	0	7856	samandarorazbaev838@gmail.com	RESET_PASSWORD
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	sklad_user	2026-07-17 21:37:02.708572	0	t
2	2	users-create	SQL	V2__users-create.sql	56525398	sklad_user	2026-07-17 21:37:02.84429	16	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.users (id, created_by, created_date, deleted, modified_by, modified_date, failed_login_count, first_name, keycloak_id, last_login_at, last_name, locked_until, password, role, status, username) FROM stdin;
4	\N	2026-07-18 11:01:24.182882	f	\N	2026-08-01 10:35:19.31025	0	John	7af1caa8-1e44-4e1a-8dc8-8f03b10ff50a	2026-08-01 10:35:18.885691	John	\N	$2a$10$50lewW2uh7yDPihFYdyKgeaj.x4NMq4V2dV.8F1UhS7a/rpJXc4K2	ADMIN	ACTIVE	dcdcecdvevehf@gmail.com
2	\N	2026-07-17 21:44:24.686014	f	\N	2026-07-17 21:44:44.173029	0	Ibodulloxon	d9dd4c99-9e80-4fe5-94e8-bf0f521b238d	2026-07-17 21:44:43.777959	Axmadxonov	\N	$2a$10$5Y4C0qfAkEndrlN1XYWaQe48tZc.mW.i2yR1C92MeIICx37gKIKI.	SELLER	ACTIVE	ioa22052005@gmail.com
6	\N	2026-07-18 15:41:05.412504	f	\N	2026-08-20 16:09:52.874945	0	Xojiakbar	eaa2f99a-3912-42fe-b106-9f3daad92b31	2026-08-20 16:09:52.429531	Andaqulov	\N	$2a$10$QVFX.RtyfBpiDxu0LyzTKO0VBrrAGEBOQA8XjiwfXtzfUtRuAUgiq	ADMIN	ACTIVE	codeuz91@gmail.com
5	\N	2026-07-18 14:03:41.721983	f	\N	2026-08-15 13:38:53.781997	0	Xojiakbar	538b7746-e07c-47b8-a97f-98e24cd11789	2026-08-15 13:38:53.259832	Andaqulov	\N	$2a$10$SUGiv/4dBLJADMuD0bDsIuzOXv9SXVYf2s8vBgwqE9P5SO7hTG9ee	SELLER	ACTIVE	andaqulovxojiakbar@gmail.com
17	\N	2026-08-14 09:07:31.004675	f	\N	2026-08-14 09:08:04.357178	0	jamshid	481bcf6e-f191-4f19-aac1-a3130923727f	2026-08-14 09:08:03.957137	erkinov	\N	$2a$10$pqAP9HiZmiS.ZLQqtelije1gV9r/EemSDY7PBdHRFcbUztSISEHuu	BUYER	ACTIVE	jamaeu22@gmail.com
12	\N	2026-07-19 17:24:40.562439	f	\N	2026-08-20 16:10:02.147831	0	Roxa	b8e33ee1-1d7f-4d01-b462-f9ec0c7cfdeb	2026-08-20 16:10:01.721935	Roxa	\N	$2a$10$wQoRQWK8iw2NedmTGJ/YRO9DpyXYlhSB7Pa/uYRgeIjOSXaItOgG2	SELLER	ACTIVE	gayipbaevrawshanbek@gmail.com
3	\N	2026-07-17 22:03:25.619189	f	\N	2026-08-13 10:12:05.182269	0	Xojiakbar	497e7033-bce5-4f5b-9cbd-7abeafb87a22	2026-08-13 10:12:04.816699	Andaqulov	\N	$2a$10$n8yO04ZA/FHlnFP69sAVIezxKX2eeM6kvoHrnK70dGRGLS9EpBIT6	SELLER	ACTIVE	hojiakbarandaqulov5@gmail.com
19	\N	2026-08-20 16:19:34.493737	f	\N	2026-08-20 16:20:12.022494	0	samandar	7088defa-5709-47ce-a1d7-5d4cd0267ad5	2026-08-20 16:20:11.630629	Urazbaev	\N	$2a$10$hWfyhFdX9GLpw8Eci11RLujDs7FwKz3uWZYED.Y5HFuEhe8oCZ9L6	BUYER	ACTIVE	samandarorazbaev838@gmail.com
15	\N	2026-07-28 08:44:36.9955	f	\N	2026-08-17 15:28:16.179781	0	Шухрат	35fb513b-4db1-451d-9938-f701ecae3f0e	2026-08-17 15:28:15.779078	Усманходжаев	\N	$2a$10$ajJ3NyEiLamHNS86Oc0MaeivzYT6qtHIgjaC.TTq0.b3p4dQb80DG	SELLER	ACTIVE	shuxrat200068@gmail.com
14	\N	2026-07-19 21:47:19.267202	f	\N	2026-07-19 21:47:19.267202	0	Test	ec5fd713-85d3-47e1-8ff4-03636cfa707e	\N	Debug	\N	$2a$10$ioyp78lauaW2OU0/bEWjeuzgqN9kYOqmX78yjQDoRXH6Ie24.0Dky	BUYER	IN_REGISTRATION	debugtest_photo_991@example.com
9	\N	2026-07-18 19:50:51.159583	f	\N	2026-07-19 01:09:54.594434	0	Жанполат	589a1f41-3528-42c1-a336-d79ea2c36a0d	2026-07-18 19:55:14.542355	Ережепбаев	\N	$2a$10$9U8aTE/3YBhtr4jR4Z8uEOXfnpNU1/Pu3i9NfqMAXZjd2K0S9hNHW	ADMIN	ACTIVE	erezepbaevzanpolat4@gmail.com
10	\N	2026-07-19 01:34:18.733954	f	\N	2026-07-19 01:34:18.733954	0	John	e28ab8ce-2d4e-4b25-8f4b-c8f7b3ec934b	\N	John	\N	$2a$10$s88ovOWSN2wW1F5Z38082ep08LCHdDRKEwGmpLMVoIY3iBY8Nt.mi	BUYER	IN_REGISTRATION	johnsilver@gmail.com
11	\N	2026-07-19 01:41:57.242864	f	\N	2026-07-19 01:41:57.242864	0	John	a1bb0d83-bc7a-4335-87d3-8d93bf67c5c1	\N	John	\N	$2a$10$gHsF5rBT7e.VIj0Aw/ODs.nQkllPGJG.XxqU/jJXrjJ03GyXolGAm	SELLER	IN_REGISTRATION	admin@crm.com
7	\N	2026-07-18 18:21:49.897328	f	\N	2026-08-18 14:23:29.92261	0	Mumin	56a3878b-988c-4e31-9a1b-4dc3a65211f2	2026-08-18 14:23:29.514255	Toxtaxodjayev	\N	$2a$10$Q5wvdk353kUf7lWaS5LLxOxDh.Ku7ZwWz/hgNDSUVcG5m6QfS6MdC	SELLER	ACTIVE	m6mintm@gmail.com
16	\N	2026-07-30 20:58:20.706153	f	\N	2026-08-10 11:37:00.629499	0	Xojiakbar	1ba5c667-a433-4477-9066-b9542c76a6fb	2026-08-10 11:37:00.212678	Andaqulov	\N	$2a$10$qkB/V0WrPbcCAu66niMbCuUiM6cDfeSY/J1/yZ31KTZAT8t24fdCS	BUYER	ACTIVE	andaqulovxojiakbar0@gmail.com
1	\N	2026-07-17 21:37:02.892011	f	\N	2026-08-14 13:41:56.014628	0	Xojiakbar	9ed8f29b-fecc-4d7c-a788-b6e4b80f8a53	2026-08-14 13:41:55.63579	Andaqulov	\N	$2a$10$RJGLMmQ6mok5OYXD2njGdOp.9rA2xDCtmrJ/xaQyewjmPPp12xDG6	SUPER_ADMIN	ACTIVE	xojiakbarandaqulov@gmail.com
13	\N	2026-07-19 17:54:33.112385	f	\N	2026-08-14 14:51:14.092166	0	John	bb12b678-f061-4ec0-b474-6d2563370637	\N	John	\N	$2a$10$6SFkIzl4TBtY8ujlBYvwDuZZP0dNYCd3q8uFYOUzloIlBZweFMCxm	BUYER	BLOCK	john@mail.ru
8	\N	2026-07-18 18:31:44.098123	f	\N	2026-08-20 15:58:00.417782	0	John	a88f1686-f48a-4528-9d24-1ede698cfca1	2026-08-20 15:58:00.015245	John	\N	$2a$10$YoSDV1OTJy2KbMxBxTVp0e8Mo0FYoXrkS72UL4oBheGuJfoozOXOG	BUYER	ACTIVE	genshinimpact19064@gmail.com
18	\N	2026-08-17 20:56:39.722852	f	\N	2026-08-17 20:56:39.722852	0	Umid	d18f05f5-81ea-430a-81ec-4ee9c4c9aad5	\N	Xasanov	\N	$2a$10$olxcKynsPK1Q3rM.6ioxRua1GtM4T66ijEWw1Mny91ADx4DY6R2Iy	SELLER	IN_REGISTRATION	xasanovumid1@gmail.com
\.


--
-- Name: email_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.email_history_id_seq', 38, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.users_id_seq', 19, true);


--
-- Name: email_history email_history_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.email_history
    ADD CONSTRAINT email_history_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: users uk366dgrd625s5659shyen79mmw; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk366dgrd625s5659shyen79mmw UNIQUE (keycloak_id);


--
-- Name: users ukr43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: sklad_user
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- PostgreSQL database dump complete
--

\unrestrict x2ULhKl4N5o5AaAUTlcFlUvhwvafWSXfR3oDVKkwwxKdNJ1JXxp1upO2UNObJQI

--
-- Database "skalad_market_category" dump
--

--
-- PostgreSQL database dump
--

\restrict 3OjfymJZlKCYykyWqbyyJf4Yv7xmOcaCDa2diG92cImojBDnl9OzwIGR8KlmiDA

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_category; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_category WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_category OWNER TO sklad_user;

\unrestrict 3OjfymJZlKCYykyWqbyyJf4Yv7xmOcaCDa2diG92cImojBDnl9OzwIGR8KlmiDA
\connect skalad_market_category
\restrict 3OjfymJZlKCYykyWqbyyJf4Yv7xmOcaCDa2diG92cImojBDnl9OzwIGR8KlmiDA

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: category; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.category (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    icon_id character varying(255),
    icon_url character varying(255),
    is_active boolean,
    name_en character varying(255) NOT NULL,
    name_ru character varying(255) NOT NULL,
    name_uz character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    sort_order integer,
    parent_id bigint
);


ALTER TABLE public.category OWNER TO sklad_user;

--
-- Name: category_attribute; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.category_attribute (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    code character varying(255) NOT NULL,
    data_type character varying(255) NOT NULL,
    is_filterable boolean,
    is_required boolean,
    label character varying(255) NOT NULL,
    options_json text,
    sort_order integer,
    category_id bigint NOT NULL,
    CONSTRAINT category_attribute_data_type_check CHECK (((data_type)::text = ANY ((ARRAY['TEXT'::character varying, 'NUMBER'::character varying, 'BOOLEAN'::character varying, 'SELECT'::character varying])::text[])))
);


ALTER TABLE public.category_attribute OWNER TO sklad_user;

--
-- Name: category_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.category_attribute ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.category (id, created_by, created_date, modified_by, modified_date, icon_id, icon_url, is_active, name_en, name_ru, name_uz, slug, sort_order, parent_id) FROM stdin;
18	\N	2026-07-25 17:08:14.19151	\N	2026-07-25 17:08:14.19151	8005ff87-8e62-47ca-88a3-c99698b4d215.jpeg	https://media.skladmarket.uz/skalad-market/8005ff87-8e62-47ca-88a3-c99698b4d215	t	Logistics, warehousing, and industrial services	Логистика, складские и промышленные услуги	Logistika, omborxona va sanoat xizmatlari	logistika	14	\N
4	\N	2026-07-18 15:13:49.366059	\N	2026-07-19 18:22:48.978533	7ff7fcd2-751c-4d0d-a58b-8537521f3376.jpg	https://media.skladmarket.uz/skalad-market/7ff7fcd2-751c-4d0d-a58b-8537521f3376	f	Pipes	Трубы	Quvurlar	pipes	2	1
3	\N	2026-07-18 15:11:31.126463	\N	2026-07-19 18:22:52.108989	38c1d645-c37d-4467-8842-3c192389b79e.jpg	https://media.skladmarket.uz/skalad-market/38c1d645-c37d-4467-8842-3c192389b79e	f	Rebar	Арматура	Armatura	rebar	1	1
2	\N	2026-07-18 13:36:00.796384	\N	2026-07-19 18:22:55.595174	2c12c738-bba9-4b4b-8be8-8c585d381723.jpg	https://media.skladmarket.uz/skalad-market/2c12c738-bba9-4b4b-8be8-8c585d381723	f	Construction Materials	Строительные материалы	Qurilish materiallari	construction-materials	1	\N
6	\N	2026-07-19 20:18:27.056603	\N	2026-07-19 20:18:27.056603	37cc877f-1712-454f-a094-92013c8fa282.jpg	https://media.skladmarket.uz/skalad-market/37cc877f-1712-454f-a094-92013c8fa282	t	Metalworking	Металлообработка	Metallga ishlov berish	metalworking	3	\N
7	\N	2026-07-19 20:28:46.798385	\N	2026-07-19 20:28:46.798385	26a5801e-1423-43ad-b14c-ce286a3abdad.png	https://media.skladmarket.uz/skalad-market/26a5801e-1423-43ad-b14c-ce286a3abdad	t	Building materials	Строительные материалы	Qurilish materiallari	building_materials	4	\N
8	\N	2026-07-19 20:31:34.505386	\N	2026-07-19 20:31:34.505386	0da3274d-effa-4a4a-b3ae-d8c51305b12f.png	https://media.skladmarket.uz/skalad-market/0da3274d-effa-4a4a-b3ae-d8c51305b12f	t	Chemical industry	химическая промышленность	Kimyo sanoati	chemical_industry	5	\N
9	\N	2026-07-19 20:34:29.601537	\N	2026-07-19 20:34:29.601537	6cb77e18-1e26-4de9-9e89-db9bf71ed847.png	https://media.skladmarket.uz/skalad-market/6cb77e18-1e26-4de9-9e89-db9bf71ed847	t	Plastics and polymers	Пластмассы и полимеры	Plastmassa va polimerlar	plastics_polymers	6	\N
10	\N	2026-07-19 20:38:12.351412	\N	2026-07-19 20:38:12.351412	442cd79d-758a-4357-a89d-891fc7abb1fe.png	https://media.skladmarket.uz/skalad-market/442cd79d-758a-4357-a89d-891fc7abb1fe	t	Electrical engineering	Электротехника	Elektrotexnika	electrical_engineering	7	\N
11	\N	2026-07-19 20:41:36.200953	\N	2026-07-19 20:41:36.200953	d081e0ec-1ec7-4540-afb3-07cbd578137c.png	https://media.skladmarket.uz/skalad-market/d081e0ec-1ec7-4540-afb3-07cbd578137c	t	Textiles and sewing	Текстиль и шитье	Tekstil va tikuvchilik	textiles_sewing	8	\N
12	\N	2026-07-19 20:44:19.087796	\N	2026-07-19 20:44:19.087796	c38d1d93-1140-4e91-87a0-952fbbca4b3b.png	https://media.skladmarket.uz/skalad-market/c38d1d93-1140-4e91-87a0-952fbbca4b3b	t	Furniture and wood	Мебель и древесина	Mebel va yog'och	furniture_wood	9	\N
13	\N	2026-07-19 20:46:47.910578	\N	2026-07-19 20:46:47.910578	07670e75-b018-4874-9e4a-005122474b8f.png	https://media.skladmarket.uz/skalad-market/07670e75-b018-4874-9e4a-005122474b8f	t	Food industry	пищевая промышленность	Oziq-ovqat sanoati	food_industry	10	\N
14	\N	2026-07-19 20:48:32.164977	\N	2026-07-19 20:48:32.164977	7bd6c96a-94da-4b7b-93bc-22d21f9c3ebb.png	https://media.skladmarket.uz/skalad-market/7bd6c96a-94da-4b7b-93bc-22d21f9c3ebb	t	Pharmaceuticals	Фармацевтические препараты	Farmatsevtika	pharmaceuticals	11	\N
15	\N	2026-07-21 08:56:35.185079	\N	2026-07-21 08:56:35.185079	28c33963-65d0-465e-8a74-640829cc047a.webp	https://media.skladmarket.uz/skalad-market/28c33963-65d0-465e-8a74-640829cc047a	t	Packaging	Упаковка	Qadoqlash	qadoqlash	12	\N
16	\N	2026-07-21 16:09:19.896037	\N	2026-07-21 16:09:19.896037	683e61fe-8c6d-48f1-af13-98c9bde8e3c8.jpg	https://media.skladmarket.uz/skalad-market/683e61fe-8c6d-48f1-af13-98c9bde8e3c8	f	Material	Материал	Material	material	0	\N
1	\N	2026-07-18 09:34:05.640263	\N	2026-07-25 13:39:43.816786	89f74008-52a1-459a-b569-5a5ca4283b42.jpg	https://media.skladmarket.uz/skalad-market/89f74008-52a1-459a-b569-5a5ca4283b42	f	Metal products	Металлические изделия	Metall mahsulotlari	metal-products	1	\N
5	\N	2026-07-19 18:30:11.611108	\N	2026-07-25 15:45:12.773539	dda0d904-452c-4b87-9b97-66a4835ed08a.jpeg	https://media.skladmarket.uz/skalad-market/dda0d904-452c-4b87-9b97-66a4835ed08a	t	Machinery & Equipment	Машиностроение и оборудование	Mashinasozlik va uskunalar	machinery-equipment	1	\N
17	\N	2026-07-25 17:01:20.031603	\N	2026-07-25 17:01:32.927226	6a30c47c-74e2-4f32-8797-c7436c450cad.jpeg	https://media.skladmarket.uz/skalad-market/6a30c47c-74e2-4f32-8797-c7436c450cad	t	IT, automation, and industrial software	IT, автоматизация и промышленное ПО	IT, avtomatlashtirish va sanoat dasturiy ta’minoti	it	13	\N
19	\N	2026-07-26 09:53:41.90108	\N	2026-07-26 09:54:23.922192	dfb94895-1d71-4742-9137-2c229d1f438e.png	https://media.skladmarket.uz/skalad-market/dfb94895-1d71-4742-9137-2c229d1f438e	f	color	краски	бўёқлар	краски для строительство	-1	7
23	\N	2026-08-02 23:27:25.659203	\N	2026-08-02 23:27:25.659203	d3b56617-3ef3-4810-96e7-f27b4041a84b.png	https://media.skladmarket.uz/skalad-market/d3b56617-3ef3-4810-96e7-f27b4041a84b	t	Machines	Станки	Stanoklar	machines	19	21
20	\N	2026-07-27 11:26:40.971156	\N	2026-08-01 21:00:23.869411	f1a02033-a427-41bc-aae7-499397d94960.webp	https://media.skladmarket.uz/skalad-market/f1a02033-a427-41bc-aae7-499397d94960	f	Production equipment	Производственное оборудование	Ishlab chiqarish uskunalari	production-equipment	15	\N
21	\N	2026-08-01 21:07:59.371171	\N	2026-08-01 21:07:59.371171	8a5786c8-c8f9-4c9e-bb03-7eaf3831ce8d.jpg	https://media.skladmarket.uz/skalad-market/8a5786c8-c8f9-4c9e-bb03-7eaf3831ce8d	t	Production equipment	Производственное оборудование	Ishlab chiqarish uskunalari	production--equipment	16	5
22	\N	2026-08-02 23:21:19.512142	\N	2026-08-02 23:25:26.887041	6408ed18-e11e-4d7b-b930-ebff02766fa7.png	https://media.skladmarket.uz/skalad-market/6408ed18-e11e-4d7b-b930-ebff02766fa7	f	Production equipment	Производственное оборудование	Ishlab chiqarish jihozlari	equipment	18	5
24	\N	2026-08-02 23:46:51.548009	\N	2026-08-02 23:46:51.548009	73be8a46-8b5c-45cf-b3f8-96e701f7d8a7.png	https://media.skladmarket.uz/skalad-market/73be8a46-8b5c-45cf-b3f8-96e701f7d8a7	t	Lines	Линии	Chiziqlar	lines	20	21
25	\N	2026-08-03 11:45:08.359227	\N	2026-08-03 11:45:08.359227	fadb0b0b-17c0-46ca-a76b-76c698ca458f.png	https://media.skladmarket.uz/skalad-market/fadb0b0b-17c0-46ca-a76b-76c698ca458f	t	Presses	Прессы	Presslar	presses	21	21
26	\N	2026-08-03 11:46:29.278785	\N	2026-08-03 11:46:29.278785	d592c12c-0781-4922-a4f4-41a5cdf34b96.png	https://media.skladmarket.uz/skalad-market/d592c12c-0781-4922-a4f4-41a5cdf34b96	t	Conveyors	Конвейеры	Konveyerlar	conveyors	22	21
27	\N	2026-08-03 11:47:49.944957	\N	2026-08-03 11:48:29.917944	9fa28a9c-074a-4e6f-8d32-fc534c1960cd.png	https://media.skladmarket.uz/skalad-market/9fa28a9c-074a-4e6f-8d32-fc534c1960cd	t	Components	Комплектующие	Komplektlovchi	components	23	5
28	\N	2026-08-03 11:50:22.533003	\N	2026-08-03 11:50:22.533003	d267fa5d-cd67-4bf1-a4ad-667816779ff6.png	https://media.skladmarket.uz/skalad-market/d267fa5d-cd67-4bf1-a4ad-667816779ff6	t	Bearings	Подшипники	Podshipniklar	bearings	24	27
29	\N	2026-08-03 11:52:22.119613	\N	2026-08-03 11:52:22.119613	0a8d0617-b64f-4129-b049-f556b6307389.png	https://media.skladmarket.uz/skalad-market/0a8d0617-b64f-4129-b049-f556b6307389	t	Belts	Ремни	Tasmalar	belts	25	27
30	\N	2026-08-03 11:53:31.081518	\N	2026-08-03 11:53:31.081518	8b633197-348c-4151-ad0a-78a12a761172.png	https://media.skladmarket.uz/skalad-market/8b633197-348c-4151-ad0a-78a12a761172	t	Reducers	Редукторы	Reduktorlar	reducers	26	27
31	\N	2026-08-03 12:20:39.743507	\N	2026-08-03 12:20:39.743507	9fa7e9b8-326c-43fd-b926-f81b0ced26da.png	https://media.skladmarket.uz/skalad-market/9fa7e9b8-326c-43fd-b926-f81b0ced26da	t	Engines	Двигатели	Dvigatellar	engines	27	27
32	\N	2026-08-03 12:22:20.497579	\N	2026-08-03 12:22:20.497579	c4db6a69-997e-49dc-afea-9bbfdb459f3f.png	https://media.skladmarket.uz/skalad-market/c4db6a69-997e-49dc-afea-9bbfdb459f3f	t	Services	Услуги	Xizmatlar	services	28	5
33	\N	2026-08-03 12:24:46.154697	\N	2026-08-03 12:24:46.154697	ddc99798-37e4-4c2c-b832-4522895fff45.png	https://media.skladmarket.uz/skalad-market/ddc99798-37e4-4c2c-b832-4522895fff45	t	Service	Сервис	Servis	service	29	32
34	\N	2026-08-03 12:25:52.01041	\N	2026-08-03 12:25:52.01041	bbc408ad-6652-4831-9bec-76ef1a6c0fc5.png	https://media.skladmarket.uz/skalad-market/bbc408ad-6652-4831-9bec-76ef1a6c0fc5	t	Repair	Ремонт	Ta’mirlash	repair	30	32
35	\N	2026-08-03 12:27:29.654381	\N	2026-08-03 12:27:29.654381	ea542169-d69e-4874-ba36-e37d9f002fab.png	https://media.skladmarket.uz/skalad-market/ea542169-d69e-4874-ba36-e37d9f002fab	t	Montage	Монтаж	Montaj	montage	31	32
36	\N	2026-08-03 12:29:21.079389	\N	2026-08-03 12:29:21.079389	7c4fb975-1eab-4f46-be15-04e3eb9ae799.png	https://media.skladmarket.uz/skalad-market/7c4fb975-1eab-4f46-be15-04e3eb9ae799	t	Metal rolling	Металлопрокат	Metall prokat	metal-rolling	32	6
37	\N	2026-08-03 12:32:37.089206	\N	2026-08-03 12:32:37.089206	c6665191-66d3-4c82-8749-6b353621b127.png	https://media.skladmarket.uz/skalad-market/c6665191-66d3-4c82-8749-6b353621b127	t	List	Лист	List	list	33	36
38	\N	2026-08-03 12:37:53.948199	\N	2026-08-03 12:37:53.948199	c125739a-97a2-4fe8-8774-47578b50d9a2.png	https://media.skladmarket.uz/skalad-market/c125739a-97a2-4fe8-8774-47578b50d9a2	t	Pipes	Трубы	Quvurlar	pipes-1	35	36
39	\N	2026-08-03 12:40:35.714644	\N	2026-08-03 12:40:35.714644	166d67ee-32a7-4040-8eb5-6c1425736087.png	https://media.skladmarket.uz/skalad-market/166d67ee-32a7-4040-8eb5-6c1425736087	t	Polymer raw materials	Полимерное сырьё	Polimer xomashyosi	polymer-raw-materials	36	9
40	\N	2026-08-03 13:18:39.787957	\N	2026-08-03 13:18:39.787957	85728da6-4dad-404b-8498-e7f9a1a93c72.png	https://media.skladmarket.uz/skalad-market/85728da6-4dad-404b-8498-e7f9a1a93c72	t	Armature	Арматура	Armatura	armature	37	36
41	\N	2026-08-03 13:20:10.043053	\N	2026-08-03 13:20:10.043053	11563255-1464-44f0-9a2c-f426c32bdf21.png	https://media.skladmarket.uz/skalad-market/11563255-1464-44f0-9a2c-f426c32bdf21	t	Shvellers	Швеллеры	Shvellerlar	shvellers	38	36
42	\N	2026-08-03 13:21:33.816507	\N	2026-08-03 13:21:33.816507	7152bfa4-8061-464c-a6b4-54596183006b.png	https://media.skladmarket.uz/skalad-market/7152bfa4-8061-464c-a6b4-54596183006b	t	Metal products	Металлические изделия	Metall buyumlar	metal-products-1	39	6
43	\N	2026-08-03 13:23:21.199953	\N	2026-08-03 13:23:21.199953	edbc04ac-d64c-4af6-96e2-96c08a318857.png	https://media.skladmarket.uz/skalad-market/edbc04ac-d64c-4af6-96e2-96c08a318857	t	Frames	Каркасы	Karkaslar	frames	40	42
44	\N	2026-08-03 13:25:25.314938	\N	2026-08-03 13:25:25.314938	cd520a5b-3fb1-462b-8db8-1c03bba40f12.png	https://media.skladmarket.uz/skalad-market/cd520a5b-3fb1-462b-8db8-1c03bba40f12	t	Fastener	Крепление	Mahkamlagich	fastener	41	42
45	\N	2026-08-03 13:28:52.091159	\N	2026-08-03 13:28:52.091159	7d386a15-d216-4275-9edc-ead24ff40063.png	https://media.skladmarket.uz/skalad-market/7d386a15-d216-4275-9edc-ead24ff40063	t	Details	Детали	Detallar	details	42	42
46	\N	2026-08-03 13:29:59.155336	\N	2026-08-03 13:29:59.155336	ac939ffb-b826-4dcc-8c95-b3001cc2f464.png	https://media.skladmarket.uz/skalad-market/ac939ffb-b826-4dcc-8c95-b3001cc2f464	t	Constructions	Конструкции	Konstruksiyalar	constructions	43	42
47	\N	2026-08-03 13:31:00.713392	\N	2026-08-03 13:31:00.713392	1ab1a0d8-a276-4387-aa7c-b0fa918def44.png	https://media.skladmarket.uz/skalad-market/1ab1a0d8-a276-4387-aa7c-b0fa918def44	t	Processing	Обработка	Ishlov berish	processing	44	6
48	\N	2026-08-03 13:33:59.602944	\N	2026-08-03 13:33:59.602944	19a1184b-8ef5-46de-8421-2e8b46fde507.png	https://media.skladmarket.uz/skalad-market/19a1184b-8ef5-46de-8421-2e8b46fde507	t	Laser cutting	Лазерная резка	Lazerli kesish	laser-cutting	45	47
49	\N	2026-08-03 13:35:21.312932	\N	2026-08-03 13:35:21.312932	812870bb-8e77-493c-b1f5-1035f2a67566.png	https://media.skladmarket.uz/skalad-market/812870bb-8e77-493c-b1f5-1035f2a67566	t	Welding	Сварка	Payvandlash	welding	46	47
50	\N	2026-08-03 13:38:06.857942	\N	2026-08-03 13:38:06.857942	973714f9-8b32-4a13-8dd6-9de267f699e2.png	https://media.skladmarket.uz/skalad-market/973714f9-8b32-4a13-8dd6-9de267f699e2	t	Bending	Гнутье	Bukish	bending	47	47
51	\N	2026-08-03 13:39:03.063824	\N	2026-08-03 13:39:03.063824	417d9547-63ff-493b-8b8d-e02749726833.png	https://media.skladmarket.uz/skalad-market/417d9547-63ff-493b-8b8d-e02749726833	t	Painting	Покраска	Bo‘yash	painting	48	47
52	\N	2026-08-03 13:40:17.961119	\N	2026-08-03 13:40:17.961119	256c080a-0995-4f20-9802-60d446f1e2e3.png	https://media.skladmarket.uz/skalad-market/256c080a-0995-4f20-9802-60d446f1e2e3	t	Basic materials	Базовые материалы	Asosiy materiallar	basic-materials	49	7
53	\N	2026-08-03 13:41:26.157332	\N	2026-08-03 13:41:26.157332	c9d5f393-cd0b-48b0-8d79-152700c3cade.png	https://media.skladmarket.uz/skalad-market/c9d5f393-cd0b-48b0-8d79-152700c3cade	t	Cement	Цемент	Sement	cement	50	52
54	\N	2026-08-03 13:42:35.839346	\N	2026-08-03 13:42:35.839346	ee392718-0e08-4173-97a4-dddc13507cef.png	https://media.skladmarket.uz/skalad-market/ee392718-0e08-4173-97a4-dddc13507cef	t	Concrete	Бетон	Beton	concrete	51	52
55	\N	2026-08-03 13:50:08.01724	\N	2026-08-03 13:50:08.01724	609889fa-789e-40f0-aa30-120eba50fce7.png	https://media.skladmarket.uz/skalad-market/609889fa-789e-40f0-aa30-120eba50fce7	t	Dry mixtures	Сухие смеси	Quruq aralashmalar	dry-mixtures	52	52
56	\N	2026-08-03 13:51:40.596925	\N	2026-08-03 13:51:40.596925	83635647-89de-40d6-b324-5ac179e74d6e.png	https://media.skladmarket.uz/skalad-market/83635647-89de-40d6-b324-5ac179e74d6e	t	Walling materials	Стеновые материалы	Devorbop materiallar	walling-materials	53	7
57	\N	2026-08-03 13:52:46.043935	\N	2026-08-03 13:52:46.043935	67e1fb30-a983-41c1-be45-08550ba5796c.png	https://media.skladmarket.uz/skalad-market/67e1fb30-a983-41c1-be45-08550ba5796c	t	Brick	Кирпич	G‘isht	brick	54	56
58	\N	2026-08-03 13:53:52.138361	\N	2026-08-03 13:53:52.138361	896b9bba-66de-48ef-8e51-2aec15a0b695.png	https://media.skladmarket.uz/skalad-market/896b9bba-66de-48ef-8e51-2aec15a0b695	t	Blocks	Блоки	Bloklar	blocks	55	56
59	\N	2026-08-03 13:54:45.384614	\N	2026-08-03 13:54:45.384614	817e000e-c97b-4c20-b1cb-2bdda0d3b48b.png	https://media.skladmarket.uz/skalad-market/817e000e-c97b-4c20-b1cb-2bdda0d3b48b	t	Panels	Панели	Panellar	panels	56	56
60	\N	2026-08-03 13:55:52.888204	\N	2026-08-03 13:55:52.888204	db967ee4-f764-4293-ba04-0746721e8858.png	https://media.skladmarket.uz/skalad-market/db967ee4-f764-4293-ba04-0746721e8858	t	Engineering and finishing materials	Инженерные и отделочные материалы	Muhandislik va bezak materiallari	engineering	57	7
61	\N	2026-08-03 13:56:54.787097	\N	2026-08-03 13:56:54.787097	ef45603d-939d-4f10-9801-e9206d034aa7.png	https://media.skladmarket.uz/skalad-market/ef45603d-939d-4f10-9801-e9206d034aa7	t	Isolation	Изоляция	Izolyatsiya	isolation	58	60
62	\N	2026-08-03 13:57:53.454306	\N	2026-08-03 13:57:53.454306	d9ad09bb-e875-4151-9cad-35ac625bc64a.png	https://media.skladmarket.uz/skalad-market/d9ad09bb-e875-4151-9cad-35ac625bc64a	t	Roof	Кровля	Tom	roof	59	60
63	\N	2026-08-03 13:59:31.364404	\N	2026-08-03 13:59:31.364404	054c81f4-1eed-492e-96bd-5deee1cc8cf4.png	https://media.skladmarket.uz/skalad-market/054c81f4-1eed-492e-96bd-5deee1cc8cf4	t	Plumbing	Сантехника	Santexnika	plumbing	60	60
64	\N	2026-08-03 14:01:29.428212	\N	2026-08-03 14:01:29.428212	f4b81c43-c446-49c0-961d-4d9d2de78441.png	https://media.skladmarket.uz/skalad-market/f4b81c43-c446-49c0-961d-4d9d2de78441	t	Decor	Декор	Bezak	decor	61	60
65	\N	2026-08-03 14:03:09.908191	\N	2026-08-03 14:03:09.908191	3ebaa75d-281f-4800-b631-f29fa57bf25c.png	https://media.skladmarket.uz/skalad-market/3ebaa75d-281f-4800-b631-f29fa57bf25c	t	Chemical raw materials	Химическое сырье	Kimyoviy xomashyo	chemical	62	8
66	\N	2026-08-03 14:05:08.014817	\N	2026-08-03 14:05:08.014817	b5b1548e-32bf-4df6-9cdf-6466fb89b122.png	https://media.skladmarket.uz/skalad-market/b5b1548e-32bf-4df6-9cdf-6466fb89b122	t	Resins	Смолы	Smolalar	resins	63	65
67	\N	2026-08-03 14:06:12.944443	\N	2026-08-03 14:06:12.944443	b83cd7fe-2ced-455d-b51a-84b9983ca28d.png	https://media.skladmarket.uz/skalad-market/b83cd7fe-2ced-455d-b51a-84b9983ca28d	t	Reagents	Реагенты	Reagentlar	reagents	64	65
68	\N	2026-08-03 14:22:14.218501	\N	2026-08-03 14:22:14.218501	8b4aa3cf-d322-4ec9-9854-752da8dd3f12.png	https://media.skladmarket.uz/skalad-market/8b4aa3cf-d322-4ec9-9854-752da8dd3f12	t	Additions	Дополнения	Qo‘shimchalar	additions	65	65
69	\N	2026-08-03 14:23:16.369727	\N	2026-08-03 14:23:16.369727	d12aaa84-3889-426b-8bb0-a4ba0384459b.png	https://media.skladmarket.uz/skalad-market/d12aaa84-3889-426b-8bb0-a4ba0384459b	t	Dyes	Красители	Bo‘yoqlar	dyes	66	65
70	\N	2026-08-03 14:24:14.972619	\N	2026-08-03 14:24:14.972619	8fcb05a9-f1ce-4714-b3be-88459b3d89e2.png	https://media.skladmarket.uz/skalad-market/8fcb05a9-f1ce-4714-b3be-88459b3d89e2	t	Chemical products	Химические продукты	Kimyoviy mahsulotlar	chemical-products	67	8
71	\N	2026-08-03 14:25:11.625466	\N	2026-08-03 14:25:11.625466	e14bb3f4-aad1-45b5-9171-90fc68a7d0ec.png	https://media.skladmarket.uz/skalad-market/e14bb3f4-aad1-45b5-9171-90fc68a7d0ec	t	Adhesives	Клеи	Yelimlar	adhesives	68	70
72	\N	2026-08-03 17:34:35.737394	\N	2026-08-03 17:34:35.737394	51ac5210-84fb-4a3c-830c-2892c58ecb21.png	https://media.skladmarket.uz/skalad-market/51ac5210-84fb-4a3c-830c-2892c58ecb21	t	Lakes	Лаки	Laklar	lakes	69	70
73	\N	2026-08-03 17:36:15.773294	\N	2026-08-03 17:36:15.773294	f07a1004-1d2f-4684-add5-6f3887026ad5.png	https://media.skladmarket.uz/skalad-market/f07a1004-1d2f-4684-add5-6f3887026ad5	t	Paints	Краски	Bo‘yoq	paints	70	70
74	\N	2026-08-03 17:37:25.573452	\N	2026-08-03 17:37:25.573452	179c5f33-bd64-4202-b3e0-5527e6b4a51f.png	https://media.skladmarket.uz/skalad-market/179c5f33-bd64-4202-b3e0-5527e6b4a51f	t	Solvents	Растворители	Erituvchilar	solvents	71	70
75	\N	2026-08-03 17:39:28.041683	\N	2026-08-03 17:39:28.041683	f3be74e0-9bbb-458d-958b-b46014ce2e40.png	https://media.skladmarket.uz/skalad-market/f3be74e0-9bbb-458d-958b-b46014ce2e40	t	Industrial chemistry	Промышленная химия	Sanoat kimyosi	industrial-chemistry	72	8
76	\N	2026-08-03 17:43:30.922512	\N	2026-08-03 17:43:30.922512	94dcb8d0-93e3-496f-8e38-5321463f82ce.png	https://media.skladmarket.uz/skalad-market/94dcb8d0-93e3-496f-8e38-5321463f82ce	t	Technical liquids	Технические жидкости	Texnik suyuqliklar	technical-liquids	73	75
77	\N	2026-08-03 17:44:47.929818	\N	2026-08-03 17:44:47.929818	41ae19a3-7066-4b0c-bfce-dc9cf938cb5d.png	https://media.skladmarket.uz/skalad-market/41ae19a3-7066-4b0c-bfce-dc9cf938cb5d	t	Cleaners	Очистители	Tozalagichlar	cleaners	74	75
78	\N	2026-08-03 17:47:01.389919	\N	2026-08-03 17:47:01.389919	44a59514-d6dc-4ed4-92ba-97b58cee7c8d.png	https://media.skladmarket.uz/skalad-market/44a59514-d6dc-4ed4-92ba-97b58cee7c8d	t	Special chemistry	Спецхимия	Maxsus kimyo	special-chemistry	75	75
79	\N	2026-08-03 18:06:05.330686	\N	2026-08-03 18:06:05.330686	5e94739b-58cd-461d-b067-1f82117b24f9.png	https://media.skladmarket.uz/skalad-market/5e94739b-58cd-461d-b067-1f82117b24f9	t	Polymers	Полимеры	Polimerlar	polymers	76	39
80	\N	2026-08-03 18:07:58.543658	\N	2026-08-03 18:07:58.543658	cfbb1d2f-045c-4f3a-8048-010909517369.png	https://media.skladmarket.uz/skalad-market/cfbb1d2f-045c-4f3a-8048-010909517369	t	Granules	Гранулы	Granulalar	granules	77	39
81	\N	2026-08-03 18:11:55.358025	\N	2026-08-03 18:11:55.358025	a12d0236-077c-4e22-ae72-2c8ee8d9657c.png	https://media.skladmarket.uz/skalad-market/a12d0236-077c-4e22-ae72-2c8ee8d9657c	t	Composites	Композиты	Kompozitlar	composites	78	39
82	\N	2026-08-03 18:13:44.759227	\N	2026-08-03 18:13:44.759227	8c35e43e-4f45-4fdf-bda1-a9b44567c8c1.png	https://media.skladmarket.uz/skalad-market/8c35e43e-4f45-4fdf-bda1-a9b44567c8c1	t	Products	Изделия	Mahsulotlar	goods	79	9
83	\N	2026-08-03 18:15:11.729629	\N	2026-08-03 18:15:11.729629	e819803f-bced-40e9-9814-e62eb59dfe57.png	https://media.skladmarket.uz/skalad-market/e819803f-bced-40e9-9814-e62eb59dfe57	t	Tubes	Трубы	Trubalar	tubes	80	82
84	\N	2026-08-03 18:16:54.986218	\N	2026-08-03 18:16:54.986218	51c213f2-2316-424a-9370-f087dbadbf59.png	https://media.skladmarket.uz/skalad-market/51c213f2-2316-424a-9370-f087dbadbf59	t	Film	Плёнка	Plyonka	film	81	82
85	\N	2026-08-03 18:18:01.90195	\N	2026-08-03 18:18:01.90195	30e05f58-c706-4a51-8622-b92f1628351a.png	https://media.skladmarket.uz/skalad-market/30e05f58-c706-4a51-8622-b92f1628351a	t	Containers	Контейнеры	Konteynerlar	containers	82	82
86	\N	2026-08-03 18:22:13.792792	\N	2026-08-03 18:22:13.792792	e8a68e8f-782a-4abc-b13a-077928078c22.png	https://media.skladmarket.uz/skalad-market/e8a68e8f-782a-4abc-b13a-077928078c22	t	Plastic parts	Пластиковые детали	Plastik detallar	plastic-parts	83	82
87	\N	2026-08-03 18:25:03.375815	\N	2026-08-03 18:25:03.375815	5da38f5f-df44-4e73-b549-8137bbf5229e.png	https://media.skladmarket.uz/skalad-market/5da38f5f-df44-4e73-b549-8137bbf5229e	t	Refinement	Переработка	Qayta ishlash	refinement	84	9
88	\N	2026-08-03 18:26:24.311971	\N	2026-08-03 18:26:24.311971	ca43dcfc-c876-4117-a5a5-a23ad6ba0f8f.png	https://media.skladmarket.uz/skalad-market/ca43dcfc-c876-4117-a5a5-a23ad6ba0f8f	t	Casting	Литьё	Quyish	casting	85	87
89	\N	2026-08-03 18:27:26.145937	\N	2026-08-03 18:27:26.145937	6b536792-c535-4c2b-86f7-b3361f235a58.png	https://media.skladmarket.uz/skalad-market/6b536792-c535-4c2b-86f7-b3361f235a58	t	Extrusion	Экструзия	Ekstruziya	extrusion	86	87
90	\N	2026-08-03 18:29:00.438118	\N	2026-08-03 18:29:00.438118	ade7ff4a-ae6d-4dfd-b177-f8a9e0be068c.png	https://media.skladmarket.uz/skalad-market/ade7ff4a-ae6d-4dfd-b177-f8a9e0be068c	t	Thermostamping	Термоштамповка	Termoqoliplash	thermostamping	87	87
92	\N	2026-08-03 18:31:56.263442	\N	2026-08-03 18:31:56.263442	5f254c9b-8bc0-49b4-99c5-aa2b00e38f9c.png	https://media.skladmarket.uz/skalad-market/5f254c9b-8bc0-49b4-99c5-aa2b00e38f9c	t	Cables	Кабели	Kabellar	cables	89	91
93	\N	2026-08-03 18:33:33.749452	\N	2026-08-03 18:33:33.749452	5cc80734-6cc5-4c10-82dc-321bdea77892.png	https://media.skladmarket.uz/skalad-market/5cc80734-6cc5-4c10-82dc-321bdea77892	t	Shield equipment	Щитовое оборудование	Qalqonli uskunalar	shield-equipment	90	91
94	\N	2026-08-03 18:34:49.357323	\N	2026-08-03 18:34:49.357323	263428aa-300f-4ce8-ba73-9664ad523840.png	https://media.skladmarket.uz/skalad-market/263428aa-300f-4ce8-ba73-9664ad523840	t	Illumination	Освещение	Yoritish	illumination	91	91
95	\N	2026-08-03 18:36:16.858234	\N	2026-08-03 18:36:16.858234	fc13c7c4-1a72-42de-be92-3c40051a63df.png	https://media.skladmarket.uz/skalad-market/fc13c7c4-1a72-42de-be92-3c40051a63df	t	Automation	Автоматизация	Avtomatlashtirish	automation	92	10
91	\N	2026-08-03 18:30:29.991755	\N	2026-08-03 18:37:47.768191	bddcee47-a834-44e9-b495-7dddced26b56.png	https://media.skladmarket.uz/skalad-market/bddcee47-a834-44e9-b495-7dddced26b56	t	Electrical engineering	Электротехника	Elektrotexnika	electrical-engineering	88	10
96	\N	2026-08-03 18:39:54.017988	\N	2026-08-03 18:39:54.017988	90014b7c-1aa0-4e8f-a537-5207fb020554.png	https://media.skladmarket.uz/skalad-market/90014b7c-1aa0-4e8f-a537-5207fb020554	t	Automation	Автоматика	Avtomatika	automation-1	93	95
97	\N	2026-08-03 18:41:21.883985	\N	2026-08-03 18:41:21.883985	b92c6669-63d1-4909-9f0f-fed6df99751e.png	https://media.skladmarket.uz/skalad-market/b92c6669-63d1-4909-9f0f-fed6df99751e	t	Sensors	Датчики	Datchiklar	sensors	94	95
98	\N	2026-08-03 18:51:44.442445	\N	2026-08-03 18:51:44.442445	29725559-5fd6-4461-aa74-79e1f2048dd9.png	https://media.skladmarket.uz/skalad-market/29725559-5fd6-4461-aa74-79e1f2048dd9	t	Control systems	Системы управления	Boshqaruv tizimlari	control-systems	95	95
99	\N	2026-08-03 18:55:04.617526	\N	2026-08-03 18:55:04.617526	34e755d9-a11f-424d-8330-83dc2fe89d7c.png	https://media.skladmarket.uz/skalad-market/34e755d9-a11f-424d-8330-83dc2fe89d7c	t	Equipment	Оборудование	Uskunalar	equipment-1	96	10
100	\N	2026-08-03 19:04:25.321496	\N	2026-08-03 19:04:25.321496	8ec9ea74-be97-4d2d-bec1-0b0c41ce6769.png	https://media.skladmarket.uz/skalad-market/8ec9ea74-be97-4d2d-bec1-0b0c41ce6769	t	Furniture	Мебель	Mebel	furniture	98	12
101	\N	2026-08-03 21:45:45.109663	\N	2026-08-03 21:45:45.109663	f1ecf2cc-5c07-44c2-9498-04b11409721e.jpg	https://media.skladmarket.uz/skalad-market/f1ecf2cc-5c07-44c2-9498-04b11409721e	t	Electric motors	Электродвигатели	Elektrodvigatellari	electric-motors	99	99
102	\N	2026-08-03 21:47:51.882137	\N	2026-08-03 21:47:51.882137	6687c46f-490c-4a30-98d9-8346a2248e75.jpg	https://media.skladmarket.uz/skalad-market/6687c46f-490c-4a30-98d9-8346a2248e75	t	Uninterruptible power supplies	Источники бесперебойного питания	Uzluksiz elektr ta'minoti manbalari	uninterruptible-power-supplies	100	99
103	\N	2026-08-03 21:50:39.098412	\N	2026-08-03 21:50:39.098412	f39aca92-2dc2-4b22-a92d-dde3006bebed.jpg	https://media.skladmarket.uz/skalad-market/f39aca92-2dc2-4b22-a92d-dde3006bebed	t	Raw materials	Сырьё	Xomashyo	raw-materials	101	11
104	\N	2026-08-03 21:52:22.868621	\N	2026-08-03 21:52:22.868621	b3649f7a-d68d-4ce3-8f87-691d97e5cc35.jpg	https://media.skladmarket.uz/skalad-market/b3649f7a-d68d-4ce3-8f87-691d97e5cc35	t	Fabrics	Ткани	Matolar	fabrics	102	103
105	\N	2026-08-03 21:53:59.500499	\N	2026-08-03 21:53:59.500499	e2dd1f4e-e0b6-4566-9895-299fbe7488fd.jpg	https://media.skladmarket.uz/skalad-market/e2dd1f4e-e0b6-4566-9895-299fbe7488fd	t	Threads	Нити	Ip	threads	103	103
106	\N	2026-08-03 22:51:52.844732	\N	2026-08-03 22:51:52.844732	86b7fcb6-83d0-402f-8e10-6c30df39b792.png	https://media.skladmarket.uz/skalad-market/86b7fcb6-83d0-402f-8e10-6c30df39b792	t	Yarn	Пряжа	Kalava ip	yarn	104	103
107	\N	2026-08-03 22:53:14.88691	\N	2026-08-03 22:53:14.88691	171daed0-71e1-419e-8cdb-9f218126dee9.png	https://media.skladmarket.uz/skalad-market/171daed0-71e1-419e-8cdb-9f218126dee9	t	Finished products	Готовая продукция	Tayyor mahsulot	finished-products	105	11
108	\N	2026-08-03 22:54:49.618215	\N	2026-08-03 22:54:49.618215	94705a10-d8da-4b64-9581-208f484678c0.png	https://media.skladmarket.uz/skalad-market/94705a10-d8da-4b64-9581-208f484678c0	t	Clothing	Одежда	Kiyimlar	clothing	106	107
109	\N	2026-08-03 22:56:16.253953	\N	2026-08-03 22:56:16.253953	3c6ec3dd-526f-42ad-a4b3-d3d22b20947d.png	https://media.skladmarket.uz/skalad-market/3c6ec3dd-526f-42ad-a4b3-d3d22b20947d	t	Special clothing	Спецодежда	Maxsus kiyim	special-clothing	107	107
110	\N	2026-08-03 22:58:04.130927	\N	2026-08-03 22:58:04.130927	29ede447-7e87-44fa-bb80-f1cdbaff0ac5.png	https://media.skladmarket.uz/skalad-market/29ede447-7e87-44fa-bb80-f1cdbaff0ac5	t	Home textiles	Домашний текстиль	Uy tekstili	home-textiles	108	107
111	\N	2026-08-03 22:59:30.143961	\N	2026-08-03 22:59:30.143961	59d61c89-9d08-4c95-95cb-8c1b5dc179e4.png	https://media.skladmarket.uz/skalad-market/59d61c89-9d08-4c95-95cb-8c1b5dc179e4	t	Service	Услуги	Xizmatlar	service-textile	110	11
112	\N	2026-08-03 23:01:16.380416	\N	2026-08-03 23:01:16.380416	2531f0c6-f53a-4206-8827-db912a7a4ca5.png	https://media.skladmarket.uz/skalad-market/2531f0c6-f53a-4206-8827-db912a7a4ca5	t	Furniture	Фурнитура	Furnitura	furnitura	111	111
113	\N	2026-08-03 23:02:54.714557	\N	2026-08-03 23:02:54.714557	ff97e22b-67a4-45e7-8d95-bbde5cf3da69.png	https://media.skladmarket.uz/skalad-market/ff97e22b-67a4-45e7-8d95-bbde5cf3da69	t	Sewing	Пошив	Tikuv	sewing	112	111
114	\N	2026-08-03 23:06:09.865787	\N	2026-08-03 23:06:09.865787	c43ab4ab-f95b-4f70-a5ac-3562f7d3036b.png	https://media.skladmarket.uz/skalad-market/c43ab4ab-f95b-4f70-a5ac-3562f7d3036b	t	Contract production	Контрактное производство	Shartnoma asosida ishlab chiqarish	contract-production	113	111
115	\N	2026-08-03 23:09:47.808513	\N	2026-08-03 23:18:16.174865	d9568b85-5eb4-49f1-9a79-0fe8ddf05a99.png	https://media.skladmarket.uz/skalad-market/d9568b85-5eb4-49f1-9a79-0fe8ddf05a99	t	for office	Для офисная	Ofis uchun	office	114	100
116	\N	2026-08-03 23:11:18.686052	\N	2026-08-03 23:19:34.60156	663aef31-4841-466f-ac04-62e7827477ed.png	https://media.skladmarket.uz/skalad-market/663aef31-4841-466f-ac04-62e7827477ed	t	For industry	Для промышленность	Sanoat uchun	industry	115	100
117	\N	2026-08-03 23:20:35.442301	\N	2026-08-03 23:20:35.442301	4456035d-001c-4eac-8ad6-801343ed9336.png	https://media.skladmarket.uz/skalad-market/4456035d-001c-4eac-8ad6-801343ed9336	t	For home	Для дома	Uy uchun	for-home	116	100
118	\N	2026-08-03 23:22:10.639191	\N	2026-08-03 23:22:10.639191	eebbbdb3-c90f-464f-8f50-c51348f35a99.png	https://media.skladmarket.uz/skalad-market/eebbbdb3-c90f-464f-8f50-c51348f35a99	t	Material	Материал	Material	material-mebel	117	12
119	\N	2026-08-03 23:24:40.678437	\N	2026-08-03 23:24:40.678437	a79ff32c-fa7b-438c-956a-0fd253a19d71.png	https://media.skladmarket.uz/skalad-market/a79ff32c-fa7b-438c-956a-0fd253a19d71	t	Chipboard	ДСП	DSP	chipboard	118	118
120	\N	2026-08-03 23:26:07.129362	\N	2026-08-03 23:26:07.129362	bebe096e-bca6-4b6b-8531-994cdeefa30c.png	https://media.skladmarket.uz/skalad-market/bebe096e-bca6-4b6b-8531-994cdeefa30c	t	MDF	МДФ	MDF	mdf	119	118
121	\N	2026-08-03 23:27:10.587729	\N	2026-08-03 23:27:10.587729	d896e382-7e95-4d56-bc5d-858e3e2b2130.png	https://media.skladmarket.uz/skalad-market/d896e382-7e95-4d56-bc5d-858e3e2b2130	t	Plywood	Фанера	Fanera	plywood	120	118
122	\N	2026-08-03 23:29:59.974376	\N	2026-08-03 23:29:59.974376	ca7a4601-3e82-4a84-9b97-97412a440461.png	https://media.skladmarket.uz/skalad-market/ca7a4601-3e82-4a84-9b97-97412a440461	t	Wood	Древесина	Yogʻoch	wood	121	118
123	\N	2026-08-03 23:31:43.770278	\N	2026-08-03 23:31:43.770278	c1371ad9-d70c-470b-bf79-d44577104aed.png	https://media.skladmarket.uz/skalad-market/c1371ad9-d70c-470b-bf79-d44577104aed	t	Products and accessories	Изделия и фурнитура	Mahsulotlar va jihozlar	products-and-accessories	122	12
124	\N	2026-08-04 10:42:04.378828	\N	2026-08-04 10:42:04.378828	b073cf5b-eeb8-4c38-b8db-3f8b45661474.png	https://media.skladmarket.uz/skalad-market/b073cf5b-eeb8-4c38-b8db-3f8b45661474	t	Doors	Двери	Eshiklar	doors	123	123
125	\N	2026-08-04 10:44:48.795425	\N	2026-08-04 10:44:48.795425	0776bfd4-2be2-46eb-9387-7f40babce611.png	https://media.skladmarket.uz/skalad-market/0776bfd4-2be2-46eb-9387-7f40babce611	t	Hardware	Фурнитура	Furnitura	hardware	124	123
126	\N	2026-08-04 10:46:37.954655	\N	2026-08-04 10:46:37.954655	4decac9a-3fe7-4efc-a009-14bafb1460cf.png	https://media.skladmarket.uz/skalad-market/4decac9a-3fe7-4efc-a009-14bafb1460cf	t	Wooden Products	Деревянные изделия	Yogʻoch buyumlar	wooden-products	125	123
127	\N	2026-08-04 12:05:30.697987	\N	2026-08-04 12:05:30.697987	3f23bc82-27c1-44e6-a199-cf8617ad8d93.png	https://media.skladmarket.uz/skalad-market/3f23bc82-27c1-44e6-a199-cf8617ad8d93	t	Products	Продукция	Mahsulotlar	products	126	13
128	\N	2026-08-04 12:06:57.867708	\N	2026-08-04 12:06:57.867708	c9ef6cbe-3029-4f24-af12-c8aabfcb5d02.png	https://media.skladmarket.uz/skalad-market/c9ef6cbe-3029-4f24-af12-c8aabfcb5d02	t	Ready-to-eat products	Готовые продукты	Tayyor mahsulotlar	ready-to-eat-products	127	127
129	\N	2026-08-04 12:08:34.394244	\N	2026-08-04 12:08:34.394244	f5a50bf6-bbeb-44d8-9f78-c6323b7290b0.png	https://media.skladmarket.uz/skalad-market/f5a50bf6-bbeb-44d8-9f78-c6323b7290b0	t	Semi-finished foods	Полуфабрикаты	Yarim tayyor mahsulotlar	semi-finished-foods	128	127
130	\N	2026-08-04 12:10:20.078224	\N	2026-08-04 12:10:20.078224	f0736d2c-bab4-4387-891b-c1867e7670cc.png	https://media.skladmarket.uz/skalad-market/f0736d2c-bab4-4387-891b-c1867e7670cc	t	Beverages	Напитки	Ichimliklar	beverages	129	127
131	\N	2026-08-04 12:11:41.652549	\N	2026-08-04 12:11:41.652549	e44583e7-96f3-41cc-b1b4-ed4a7500cb81.png	https://media.skladmarket.uz/skalad-market/e44583e7-96f3-41cc-b1b4-ed4a7500cb81	t	Categories	Категории	Turkumlar	categories	130	13
132	\N	2026-08-04 12:12:24.627141	\N	2026-08-04 12:12:24.627141	1f888633-3dd0-4299-88bd-c966cee943ef.png	https://media.skladmarket.uz/skalad-market/1f888633-3dd0-4299-88bd-c966cee943ef	t	Confectionery	Кондитерские	Qandolat	confectionery	131	131
133	\N	2026-08-04 12:14:34.887727	\N	2026-08-04 12:14:34.887727	9b8c43c9-f511-4c22-8e0e-3f3c3837ec99.png	https://media.skladmarket.uz/skalad-market/9b8c43c9-f511-4c22-8e0e-3f3c3837ec99	t	Dairy products	Молочные изделия	Sut mahsulotlari	dairy-products	132	131
134	\N	2026-08-04 12:15:39.888009	\N	2026-08-04 12:15:39.888009	02bbf1df-9e42-4eaa-9a7b-499c0d062fdb.png	https://media.skladmarket.uz/skalad-market/02bbf1df-9e42-4eaa-9a7b-499c0d062fdb	t	Meat products	Мясные изделия	Goʻsht mahsulotlari	meat-products	133	131
135	\N	2026-08-04 12:17:43.109266	\N	2026-08-04 12:17:43.109266	f8a4b8fd-c735-4512-b280-851452a88d63.png	https://media.skladmarket.uz/skalad-market/f8a4b8fd-c735-4512-b280-851452a88d63	t	Additionally	Дополнительно	Qo‘shimcha	additionally	134	13
136	\N	2026-08-04 12:19:22.419818	\N	2026-08-04 12:19:22.419818	c9d65480-2c08-47d1-a8b0-33b43c30ee4c.png	https://media.skladmarket.uz/skalad-market/c9d65480-2c08-47d1-a8b0-33b43c30ee4c	t	Food packaging	Упаковка для пищевых товаров	Oziq-ovqat qadoqlari	food-packaging	135	135
137	\N	2026-08-04 12:22:01.243223	\N	2026-08-04 12:22:01.243223	6e1f4154-2a2c-4256-bacf-a540273dcd3d.png	https://media.skladmarket.uz/skalad-market/6e1f4154-2a2c-4256-bacf-a540273dcd3d	t	Food processing equipment	Пищевое оборудование	Oziq-ovqat uskunalari	food-processing-equipment	136	135
138	\N	2026-08-04 12:35:54.460829	\N	2026-08-04 12:35:54.460829	7a3f0539-2b8b-471e-99ca-3b1257bdd662.png	https://media.skladmarket.uz/skalad-market/7a3f0539-2b8b-471e-99ca-3b1257bdd662	t	Medical furniture	Медицинская мебель	Tibbiyot mebellari	medical-furniture	137	14
139	\N	2026-08-04 12:36:46.646939	\N	2026-08-04 12:36:46.646939	049030e5-832c-4779-9367-54fc75383587.png	https://media.skladmarket.uz/skalad-market/049030e5-832c-4779-9367-54fc75383587	t	Consumables and laboratory equipment	Расходные материалы и лабораторное оборудование	Sarf materiallari va laboratoriya uskunalari	consumables-and-laboratory-equipment	138	14
140	\N	2026-08-04 12:38:21.027831	\N	2026-08-04 12:38:21.027831	7c6f81c0-c7be-4c4f-838d-a82ba95cd819.png	https://media.skladmarket.uz/skalad-market/7c6f81c0-c7be-4c4f-838d-a82ba95cd819	t	Sanitary and hygiene products	Санитарно-гигиеническая продукция	Sanitariya-gigiyena mahsulotlari	sanitary-and-hygiene-products	139	14
141	\N	2026-08-04 12:39:39.410087	\N	2026-08-04 12:39:39.410087	34c19cb5-0bf8-4f66-b9e0-ff9f97c366f3.png	https://media.skladmarket.uz/skalad-market/34c19cb5-0bf8-4f66-b9e0-ff9f97c366f3	t	Pharma packaging	Фармупаковка	Farm-qadoqlash	pharma-packaging	140	14
142	\N	2026-08-04 12:40:53.612648	\N	2026-08-04 12:40:53.612648	d8941b6b-a2a8-4c35-96c6-0a39af81cf15.png	https://media.skladmarket.uz/skalad-market/d8941b6b-a2a8-4c35-96c6-0a39af81cf15	t	Components	Компоненты	Komponentlar	component	141	14
143	\N	2026-08-04 12:44:52.630064	\N	2026-08-04 12:44:52.630064	befe490a-b9c0-4d3c-8a3b-90f53f512162.png	https://media.skladmarket.uz/skalad-market/befe490a-b9c0-4d3c-8a3b-90f53f512162	t	Cardboard packaging	Картонная упаковка	Karton qadoqlar	cardboard-packaging	142	15
144	\N	2026-08-04 12:45:49.758855	\N	2026-08-04 12:45:49.758855	a1d3bfcd-b36c-45fa-a8bb-8134208aae50.png	https://media.skladmarket.uz/skalad-market/a1d3bfcd-b36c-45fa-a8bb-8134208aae50	t	Plastic packaging	Пластиковая упаковка	Plastik qadoqlar	plastic-packaging	143	15
145	\N	2026-08-04 12:46:45.69934	\N	2026-08-04 12:46:45.69934	9252f435-0f01-4420-bacd-89aa5f098315.png	https://media.skladmarket.uz/skalad-market/9252f435-0f01-4420-bacd-89aa5f098315	t	Film	Плёнка	Plyonka	films	144	15
146	\N	2026-08-04 12:47:35.537012	\N	2026-08-04 12:47:35.537012	00bac6ec-1697-4920-b17c-437d6b4cddc1.png	https://media.skladmarket.uz/skalad-market/00bac6ec-1697-4920-b17c-437d6b4cddc1	t	Bags	Пакеты	Paketlar	bags	145	15
147	\N	2026-08-04 12:49:08.566958	\N	2026-08-04 12:49:08.566958	c92717d9-bea5-4aeb-957f-ea37753bae0c.png	https://media.skladmarket.uz/skalad-market/c92717d9-bea5-4aeb-957f-ea37753bae0c	t	Labels	Этикетки	Etiketkalar	labels	146	15
148	\N	2026-08-04 12:50:29.217844	\N	2026-08-04 12:50:29.217844	27a55487-fe71-4d37-8c3e-332b145bc946.png	https://media.skladmarket.uz/skalad-market/27a55487-fe71-4d37-8c3e-332b145bc946	t	Containers	Тара	Idishlar	container	147	15
149	\N	2026-08-04 12:51:19.505698	\N	2026-08-04 12:51:19.505698	ac158a5d-fb8a-4f69-93f0-389429f2e1b6.png	https://media.skladmarket.uz/skalad-market/ac158a5d-fb8a-4f69-93f0-389429f2e1b6	t	Pallets	Паллеты	Poddonlar	pallets	148	15
150	\N	2026-08-04 12:52:09.213332	\N	2026-08-04 12:52:09.213332	1cf5362a-891f-4cd0-a959-22247a64469c.png	https://media.skladmarket.uz/skalad-market/1cf5362a-891f-4cd0-a959-22247a64469c	t	Industrial packaging	Промышленная упаковка	Sanoat qadoqlari	industrial-packaging	150	15
151	\N	2026-08-04 14:31:12.978666	\N	2026-08-04 14:31:12.978666	7ca1654d-9091-48ec-bb69-72b6dd41a0f7.png	https://media.skladmarket.uz/skalad-market/7ca1654d-9091-48ec-bb69-72b6dd41a0f7	t	ERP, CRM, WMS systems	ERP, CRM, WMS	ERP, CRM, WMS tizimlari	erp-crm-wms-systems	151	17
152	\N	2026-08-04 14:32:07.654409	\N	2026-08-04 14:32:07.654409	c1c7fca0-1a22-47cd-a0f8-3bac5845e459.png	https://media.skladmarket.uz/skalad-market/c1c7fca0-1a22-47cd-a0f8-3bac5845e459	t	Warehouse automation	Автоматизация склада	Omborlarni avtomatlashtirish	warehouse-automation	152	17
153	\N	2026-08-04 14:33:05.421096	\N	2026-08-04 14:33:05.421096	546e9f93-75d4-434a-a319-063aa9415c25.png	https://media.skladmarket.uz/skalad-market/546e9f93-75d4-434a-a319-063aa9415c25	t	Industrial IoT	Промышленный IoT	Sanoat IoT	industrial-iot	153	17
154	\N	2026-08-04 14:34:09.487979	\N	2026-08-04 14:34:09.487979	b51b313d-3832-4192-8b1f-36ef387ad8a2.png	https://media.skladmarket.uz/skalad-market/b51b313d-3832-4192-8b1f-36ef387ad8a2	t	Video surveillance	Видеонаблюдение	Kuzatuv kameralari	video-surveillance	154	17
155	\N	2026-08-04 14:35:49.619297	\N	2026-08-04 14:35:49.619297	59e877e1-20d8-48ae-8ce0-733aac1acc30.png	https://media.skladmarket.uz/skalad-market/59e877e1-20d8-48ae-8ce0-733aac1acc30	t	Access Control	СКУД	SKUD	access-control	155	17
156	\N	2026-08-04 14:36:29.952847	\N	2026-08-04 14:36:29.952847	6673c64c-8044-40b1-8859-39bffc09fa90.png	https://media.skladmarket.uz/skalad-market/6673c64c-8044-40b1-8859-39bffc09fa90	t	AI assistants	AI-ассистенты	AI-yordamchilar	ai-assistants	156	17
157	\N	2026-08-04 14:37:54.32984	\N	2026-08-04 14:37:54.32984	0d26f58a-65a7-4d41-bed8-01f7c54fcdbb.png	https://media.skladmarket.uz/skalad-market/0d26f58a-65a7-4d41-bed8-01f7c54fcdbb	t	Warehousing services	Складские услуги	Omborxona xizmatlari	warehousing-services	157	18
158	\N	2026-08-04 14:38:57.99042	\N	2026-08-04 14:38:57.99042	9e7ad1dd-67db-499b-86d5-e2703cf5562a.png	https://media.skladmarket.uz/skalad-market/9e7ad1dd-67db-499b-86d5-e2703cf5562a	t	Delivery	Доставка	Yetkazib berish	delivery	158	18
159	\N	2026-08-04 14:39:58.54362	\N	2026-08-04 14:39:58.54362	0fe67048-3d27-4a28-be07-c16497f94558.png	https://media.skladmarket.uz/skalad-market/0fe67048-3d27-4a28-be07-c16497f94558	t	Customs clearance	Tаможенное оформление	Bojxona rasmiylashtiruvi	customs-clearance	159	18
160	\N	2026-08-04 14:41:01.442041	\N	2026-08-04 14:41:01.442041	af2914b6-1c94-4aec-b44a-5d09c18bbf6a.png	https://media.skladmarket.uz/skalad-market/af2914b6-1c94-4aec-b44a-5d09c18bbf6a	t	Loading and unloading operations	Погрузочно-разгрузочные работы	Ortish-tushirish ishlari	loading-and-unloading-operations	160	18
161	\N	2026-08-04 14:42:08.510092	\N	2026-08-04 14:42:08.510092	c102316c-0827-4289-bdeb-914744cb7220.png	https://media.skladmarket.uz/skalad-market/c102316c-0827-4289-bdeb-914744cb7220	t	Warehouse rental	Аренда складов	Omborxona ijarasi	warehouse-rental	161	18
162	\N	2026-08-04 14:42:48.725361	\N	2026-08-04 14:42:48.725361	168d1058-ae1d-40d6-90e5-b880036b07f3.png	https://media.skladmarket.uz/skalad-market/168d1058-ae1d-40d6-90e5-b880036b07f3	t	Industrial outsourcing	Промышленный аутсорсинг	Sanoat autsorsingi	industrial-outsourcing	162	18
163	\N	2026-08-04 14:43:40.535882	\N	2026-08-04 14:43:40.535882	8dbffb3e-4086-4540-81c8-25d47d5da382.png	https://media.skladmarket.uz/skalad-market/8dbffb3e-4086-4540-81c8-25d47d5da382	t	Maintenance & repair services	Cервисное обслуживание	Servis xizmati koʻrsatish	maintenance-repair-services	163	18
\.


--
-- Data for Name: category_attribute; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.category_attribute (id, created_by, created_date, modified_by, modified_date, code, data_type, is_filterable, is_required, label, options_json, sort_order, category_id) FROM stdin;
\.


--
-- Name: category_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.category_attribute_id_seq', 1, false);


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.category_id_seq', 163, true);


--
-- Name: category_attribute category_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.category_attribute
    ADD CONSTRAINT category_attribute_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: category_attribute uk8sgxn431gr0cghppgj2p1poey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.category_attribute
    ADD CONSTRAINT uk8sgxn431gr0cghppgj2p1poey UNIQUE (category_id, code);


--
-- Name: category ukhqknmjh5423vchi4xkyhxlhg2; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT ukhqknmjh5423vchi4xkyhxlhg2 UNIQUE (slug);


--
-- Name: category fk2y94svpmqttx80mshyny85wqr; Type: FK CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT fk2y94svpmqttx80mshyny85wqr FOREIGN KEY (parent_id) REFERENCES public.category(id);


--
-- Name: category_attribute fke0pcstwj0x32r32yy4e8impwv; Type: FK CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.category_attribute
    ADD CONSTRAINT fke0pcstwj0x32r32yy4e8impwv FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 3OjfymJZlKCYykyWqbyyJf4Yv7xmOcaCDa2diG92cImojBDnl9OzwIGR8KlmiDA

--
-- Database "skalad_market_chat" dump
--

--
-- PostgreSQL database dump
--

\restrict nRd9EwPaQEKKbNWtkcn3WqCvf1YTeJl8X2JzQO3nG1Dc2IiqCc4m6gieDMOQn3o

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_chat; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_chat WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_chat OWNER TO sklad_user;

\unrestrict nRd9EwPaQEKKbNWtkcn3WqCvf1YTeJl8X2JzQO3nG1Dc2IiqCc4m6gieDMOQn3o
\connect skalad_market_chat
\restrict nRd9EwPaQEKKbNWtkcn3WqCvf1YTeJl8X2JzQO3nG1Dc2IiqCc4m6gieDMOQn3o

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: sklad_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO sklad_user;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: sklad_user
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.chat_messages (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    attachment_key character varying(255),
    attachment_url character varying(255),
    body text,
    buyer_read_at timestamp(6) without time zone,
    delivered_at timestamp(6) without time zone,
    seller_read_at timestamp(6) without time zone,
    sender_id bigint,
    sender_type character varying(255),
    sent_at timestamp(6) without time zone,
    thread_id bigint NOT NULL,
    CONSTRAINT chat_messages_sender_type_check CHECK (((sender_type)::text = ANY ((ARRAY['BUYER'::character varying, 'SELLER'::character varying])::text[])))
);


ALTER TABLE public.chat_messages OWNER TO sklad_user;

--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.chat_messages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: chat_threads; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.chat_threads (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    buyer_hidden boolean,
    buyer_id bigint,
    last_message_at timestamp(6) without time zone,
    product_id bigint,
    seller_company_id bigint,
    seller_hidden boolean
);


ALTER TABLE public.chat_threads OWNER TO sklad_user;

--
-- Name: chat_threads_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.chat_threads ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.chat_threads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: support_message; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.support_message (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    admin_read_at timestamp(6) without time zone,
    attachment_key character varying(255),
    attachment_url character varying(255),
    body text,
    delivered_at timestamp(6) without time zone,
    requester_read_at timestamp(6) without time zone,
    sender_id bigint,
    sender_role character varying(255),
    sent_at timestamp(6) without time zone,
    thread_id bigint,
    CONSTRAINT support_message_sender_role_check CHECK (((sender_role)::text = ANY ((ARRAY['BUYER'::character varying, 'SELLER'::character varying, 'ADMIN'::character varying, 'SUPER_ADMIN'::character varying])::text[])))
);


ALTER TABLE public.support_message OWNER TO sklad_user;

--
-- Name: support_message_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.support_message ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.support_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: support_thread; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.support_thread (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    assigned_admin_id bigint,
    assigned_admin_role character varying(255),
    last_message_at timestamp(6) without time zone,
    requester_id bigint,
    requester_role character varying(255),
    status character varying(255) NOT NULL,
    subject character varying(300),
    CONSTRAINT support_thread_assigned_admin_role_check CHECK (((assigned_admin_role)::text = ANY ((ARRAY['ADMIN'::character varying, 'SUPER_ADMIN'::character varying])::text[]))),
    CONSTRAINT support_thread_requester_role_check CHECK (((requester_role)::text = ANY ((ARRAY['BUYER'::character varying, 'SELLER'::character varying])::text[]))),
    CONSTRAINT support_thread_status_check CHECK (((status)::text = ANY ((ARRAY['OPEN'::character varying, 'ASSIGNED'::character varying, 'CLOSED'::character varying])::text[])))
);


ALTER TABLE public.support_thread OWNER TO sklad_user;

--
-- Name: support_thread_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.support_thread ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.support_thread_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.chat_messages (id, created_by, created_date, deleted, modified_by, modified_date, attachment_key, attachment_url, body, buyer_read_at, delivered_at, seller_read_at, sender_id, sender_type, sent_at, thread_id) FROM stdin;
1	\N	2026-07-29 16:57:18.04428	f	\N	2026-07-29 16:57:33.020451	\N	\N	salom	\N	2026-07-29 16:57:18.008622	2026-07-29 16:57:33.01644	8	BUYER	2026-07-29 16:57:18.008622	1
2	\N	2026-07-29 16:57:41.053509	f	\N	2026-07-29 16:57:53.862593	\N	\N	salom	2026-07-29 16:57:53.861687	2026-07-29 16:57:41.052981	\N	12	SELLER	2026-07-29 16:57:41.052981	1
3	\N	2026-07-30 21:07:17.167655	f	\N	2026-07-30 21:07:39.739056	\N	\N	salom	\N	2026-07-30 21:07:17.165343	2026-07-30 21:07:39.736999	8	BUYER	2026-07-30 21:07:17.165343	1
4	\N	2026-07-30 21:08:47.283282	f	\N	2026-07-30 21:09:11.992504	\N	\N	salom	2026-07-30 21:09:11.99182	2026-07-30 21:08:47.282936	\N	12	SELLER	2026-07-30 21:08:47.282936	1
5	\N	2026-07-30 21:10:40.038739	f	\N	2026-07-30 21:11:25.084128	\N	\N	salom	\N	2026-07-30 21:10:40.038207	2026-07-30 21:11:25.083369	8	BUYER	2026-07-30 21:10:40.038207	1
6	\N	2026-07-30 21:12:11.245681	f	\N	2026-07-30 21:12:23.204989	\N	\N	salom	\N	2026-07-30 21:12:11.245368	2026-07-30 21:12:23.204224	8	BUYER	2026-07-30 21:12:11.245368	1
7	\N	2026-07-30 21:28:51.533692	f	\N	2026-07-30 21:29:05.420684	\N	\N	salom	\N	2026-07-30 21:28:51.509677	2026-07-30 21:29:05.418561	8	BUYER	2026-07-30 21:28:51.509677	1
8	\N	2026-07-31 21:52:38.554	f	\N	2026-07-31 21:52:39.411872	\N	\N	salom	\N	2026-07-31 21:52:38.528194	2026-07-31 21:52:39.408684	16	BUYER	2026-07-31 21:52:38.528194	5
9	\N	2026-07-31 21:53:15.178388	f	\N	2026-07-31 21:53:15.539762	\N	\N	Assalomu aleykum	2026-07-31 21:53:15.53863	2026-07-31 21:53:15.177552	\N	3	SELLER	2026-07-31 21:53:15.177552	5
10	\N	2026-07-31 22:16:20.008629	f	\N	2026-07-31 22:16:20.163851	\N	\N	Va aleykum assalom	\N	2026-07-31 22:16:20.008107	2026-07-31 22:16:20.162378	16	BUYER	2026-07-31 22:16:20.008107	5
12	\N	2026-07-31 22:17:08.724033	f	\N	2026-07-31 22:17:08.914644	\N	\N	yaxshimisiz	2026-07-31 22:17:08.914035	2026-07-31 22:17:08.723198	\N	3	SELLER	2026-07-31 22:17:08.723198	5
11	\N	2026-07-31 22:16:35.6852	f	\N	2026-08-01 09:46:32.625245	\N	\N	Assalomu aleykum	\N	2026-07-31 22:16:35.684578	2026-08-01 09:46:32.623274	3	BUYER	2026-07-31 22:16:35.684578	3
13	\N	2026-08-01 09:47:13.69653	f	\N	2026-08-01 12:08:07.356814	\N	\N	salom	2026-08-01 12:08:07.351255	2026-08-01 09:47:13.695932	\N	7	SELLER	2026-08-01 09:47:13.695932	3
14	\N	2026-08-03 11:17:34.360147	f	\N	2026-08-03 14:04:46.89353	\N	\N	Арматура 1000 шт в наличи есть ?	\N	2026-08-03 11:17:34.356278	2026-08-03 14:04:46.891489	7	BUYER	2026-08-03 11:17:34.356278	8
15	\N	2026-08-17 21:01:12.157019	f	\N	2026-08-17 21:01:12.157019	\N	\N	Hello	\N	2026-08-17 21:01:12.113482	\N	7	BUYER	2026-08-17 21:01:12.113482	8
16	\N	2026-08-17 21:01:16.262161	f	\N	2026-08-17 21:01:16.262161	\N	\N	Dhdjnd	\N	2026-08-17 21:01:16.261746	\N	7	BUYER	2026-08-17 21:01:16.261746	8
\.


--
-- Data for Name: chat_threads; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.chat_threads (id, created_by, created_date, deleted, modified_by, modified_date, buyer_hidden, buyer_id, last_message_at, product_id, seller_company_id, seller_hidden) FROM stdin;
2	\N	2026-07-30 17:51:31.465352	f	\N	2026-07-30 17:51:40.561395	t	8	\N	6	3	f
4	\N	2026-07-30 20:45:53.531805	f	\N	2026-07-30 20:45:53.531805	f	3	\N	\N	7	f
6	\N	2026-07-30 21:21:51.247566	f	\N	2026-07-30 21:21:58.285329	t	12	\N	8	3	f
1	\N	2026-07-29 15:18:59.199726	f	\N	2026-07-30 21:28:51.579367	f	8	2026-07-30 21:28:51.509677	\N	5	f
7	\N	2026-07-31 08:15:40.918664	f	\N	2026-07-31 08:15:40.918664	f	15	\N	3	3	f
5	\N	2026-07-30 21:01:27.143229	f	\N	2026-07-31 22:17:08.729729	f	16	2026-07-31 22:17:08.723198	\N	2	f
3	\N	2026-07-30 20:44:39.537608	f	\N	2026-08-01 09:47:13.701674	f	3	2026-08-01 09:47:13.695932	9	3	f
8	\N	2026-08-03 11:17:11.769315	f	\N	2026-08-17 21:01:16.26651	f	7	2026-08-17 21:01:16.261746	10	7	f
9	\N	2026-08-20 15:59:03.224149	f	\N	2026-08-20 15:59:10.630737	t	8	\N	3	3	f
\.


--
-- Data for Name: support_message; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.support_message (id, created_by, created_date, deleted, modified_by, modified_date, admin_read_at, attachment_key, attachment_url, body, delivered_at, requester_read_at, sender_id, sender_role, sent_at, thread_id) FROM stdin;
1	\N	2026-08-01 10:33:57.263857	f	\N	2026-08-01 13:48:05.539045	2026-08-01 13:48:05.533343	\N	\N	salom	2026-08-01 10:33:57.261152	\N	8	BUYER	2026-08-01 10:33:57.261152	1
2	\N	2026-08-01 10:47:58.789341	f	\N	2026-08-01 13:48:05.547839	2026-08-01 13:48:05.533343	\N	\N	salom	2026-08-01 10:47:58.788308	\N	8	BUYER	2026-08-01 10:47:58.788308	1
4	\N	2026-08-01 12:07:34.031513	f	\N	2026-08-01 16:46:41.748245	2026-08-01 16:46:41.747379	\N	\N	Assalomu aleykum	2026-08-01 12:07:34.029633	\N	16	BUYER	2026-08-01 12:07:34.029633	3
5	\N	2026-08-01 12:08:38.608838	f	\N	2026-08-01 16:46:41.748475	2026-08-01 16:46:41.747379	\N	\N	,	2026-08-01 12:08:38.608287	\N	16	BUYER	2026-08-01 12:08:38.608287	3
3	\N	2026-08-01 11:19:45.87776	f	\N	2026-08-01 16:46:46.13029	2026-08-01 16:46:46.128983	\N	\N	salom	2026-08-01 11:19:45.877239	\N	12	SELLER	2026-08-01 11:19:45.877239	2
6	\N	2026-08-01 16:46:09.125088	f	\N	2026-08-01 16:46:46.130735	2026-08-01 16:46:46.128983	\N	\N	salom	2026-08-01 16:46:09.119771	\N	12	SELLER	2026-08-01 16:46:09.119771	2
7	\N	2026-08-01 17:40:51.374115	f	\N	2026-08-01 17:40:51.374115	\N	\N	\N	keling nima yordam	2026-08-01 17:40:51.373562	\N	1	SUPER_ADMIN	2026-08-01 17:40:51.373562	1
8	\N	2026-08-01 18:25:34.902283	f	\N	2026-08-01 18:25:34.902283	\N	\N	\N	nima xizmat	2026-08-01 18:25:34.901553	\N	1	SUPER_ADMIN	2026-08-01 18:25:34.901553	3
9	\N	2026-08-17 21:02:36.402671	f	\N	2026-08-18 14:19:44.379983	2026-08-18 14:19:44.376574	\N	\N	Hello	2026-08-17 21:02:36.400695	\N	7	SELLER	2026-08-17 21:02:36.400695	5
10	\N	2026-08-18 14:18:36.119784	f	\N	2026-08-18 14:19:44.380389	2026-08-18 14:19:44.376574	\N	\N	hello	2026-08-18 14:18:36.118838	\N	7	SELLER	2026-08-18 14:18:36.118838	5
11	\N	2026-08-18 14:18:38.687714	f	\N	2026-08-18 14:19:44.380872	2026-08-18 14:19:44.376574	\N	\N	hello	2026-08-18 14:18:38.687274	\N	7	SELLER	2026-08-18 14:18:38.687274	5
12	\N	2026-08-18 14:18:41.596975	f	\N	2026-08-18 14:19:44.381223	2026-08-18 14:19:44.376574	\N	\N	hello	2026-08-18 14:18:41.596577	\N	7	SELLER	2026-08-18 14:18:41.596577	5
13	\N	2026-08-18 14:20:14.035854	f	\N	2026-08-18 14:20:14.154777	\N	\N	\N	sizga yordam kerakmi?	2026-08-18 14:20:14.035348	2026-08-18 14:20:14.153663	6	ADMIN	2026-08-18 14:20:14.035348	5
14	\N	2026-08-18 14:22:43.128249	f	\N	2026-08-18 14:22:43.250028	2026-08-18 14:22:43.248798	\N	\N	hello	2026-08-18 14:22:43.127765	\N	7	SELLER	2026-08-18 14:22:43.127765	5
15	\N	2026-08-18 14:23:14.071337	f	\N	2026-08-18 14:23:14.19132	\N	\N	\N	salo,	2026-08-18 14:23:14.070542	2026-08-18 14:23:14.190313	6	ADMIN	2026-08-18 14:23:14.070542	5
16	\N	2026-08-18 14:23:17.345366	f	\N	2026-08-18 14:23:17.457318	\N	\N	\N	salom	2026-08-18 14:23:17.345012	2026-08-18 14:23:17.456701	6	ADMIN	2026-08-18 14:23:17.345012	5
\.


--
-- Data for Name: support_thread; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.support_thread (id, created_by, created_date, deleted, modified_by, modified_date, assigned_admin_id, assigned_admin_role, last_message_at, requester_id, requester_role, status, subject) FROM stdin;
2	\N	2026-08-01 11:19:41.456274	f	\N	2026-08-01 16:47:39.03866	1	SUPER_ADMIN	2026-08-01 16:46:09.119771	12	SELLER	CLOSED	Texnik yordam
1	\N	2026-08-01 10:33:50.775986	f	\N	2026-08-01 17:40:51.380227	1	SUPER_ADMIN	2026-08-01 17:40:51.373562	8	BUYER	ASSIGNED	Texnik yordam
3	\N	2026-08-01 12:07:25.433486	f	\N	2026-08-01 18:25:34.905939	1	SUPER_ADMIN	2026-08-01 18:25:34.901553	16	BUYER	ASSIGNED	Texnik yordam
4	\N	2026-08-05 17:36:17.587522	f	\N	2026-08-14 14:40:30.790411	6	ADMIN	\N	12	SELLER	ASSIGNED	Texnik yordam
5	\N	2026-08-17 21:02:24.888215	f	\N	2026-08-18 14:23:17.347802	6	ADMIN	2026-08-18 14:23:17.345012	7	SELLER	ASSIGNED	Техническая поддержка
\.


--
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.chat_messages_id_seq', 16, true);


--
-- Name: chat_threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.chat_threads_id_seq', 9, true);


--
-- Name: support_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.support_message_id_seq', 16, true);


--
-- Name: support_thread_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.support_thread_id_seq', 5, true);


--
-- Name: 24721; Type: BLOB METADATA; Schema: -; Owner: sklad_user
--

SELECT pg_catalog.lo_create('24721');

ALTER LARGE OBJECT 24721 OWNER TO sklad_user;

--
-- Data for Name: 24721; Type: BLOBS; Schema: -; Owner: sklad_user
--

BEGIN;

SELECT pg_catalog.lo_open('24721', 131072);
SELECT pg_catalog.lowrite(0, '\x73616c6f6d');
SELECT pg_catalog.lo_close(0);

COMMIT;

--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: chat_threads chat_threads_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.chat_threads
    ADD CONSTRAINT chat_threads_pkey PRIMARY KEY (id);


--
-- Name: support_message support_message_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.support_message
    ADD CONSTRAINT support_message_pkey PRIMARY KEY (id);


--
-- Name: support_thread support_thread_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.support_thread
    ADD CONSTRAINT support_thread_pkey PRIMARY KEY (id);


--
-- Name: chat_threads uk77fe3ltb99gcrov68kx4bnu1e; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.chat_threads
    ADD CONSTRAINT uk77fe3ltb99gcrov68kx4bnu1e UNIQUE (buyer_id, seller_company_id, product_id);


--
-- Name: idx_support_message_thread_id; Type: INDEX; Schema: public; Owner: sklad_user
--

CREATE INDEX idx_support_message_thread_id ON public.support_message USING btree (thread_id, id);


--
-- Name: idx_support_thread_admin; Type: INDEX; Schema: public; Owner: sklad_user
--

CREATE INDEX idx_support_thread_admin ON public.support_thread USING btree (assigned_admin_id, status);


--
-- Name: idx_support_thread_last_message; Type: INDEX; Schema: public; Owner: sklad_user
--

CREATE INDEX idx_support_thread_last_message ON public.support_thread USING btree (last_message_at);


--
-- Name: idx_support_thread_requester; Type: INDEX; Schema: public; Owner: sklad_user
--

CREATE INDEX idx_support_thread_requester ON public.support_thread USING btree (requester_id, requester_role, status);


--
-- Name: chat_messages fkm6wwwxkgq8x9iwp58j8n2ujy9; Type: FK CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT fkm6wwwxkgq8x9iwp58j8n2ujy9 FOREIGN KEY (thread_id) REFERENCES public.chat_threads(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: sklad_user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict nRd9EwPaQEKKbNWtkcn3WqCvf1YTeJl8X2JzQO3nG1Dc2IiqCc4m6gieDMOQn3o

--
-- Database "skalad_market_company" dump
--

--
-- PostgreSQL database dump
--

\restrict qOWrpDAja9SzfTcYdTU6MzsWEyRTUJm4OSAxkkSycJA5z1l3Md4kbvVOLnVbObb

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_company; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_company WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_company OWNER TO sklad_user;

\unrestrict qOWrpDAja9SzfTcYdTU6MzsWEyRTUJm4OSAxkkSycJA5z1l3Md4kbvVOLnVbObb
\connect skalad_market_company
\restrict qOWrpDAja9SzfTcYdTU6MzsWEyRTUJm4OSAxkkSycJA5z1l3Md4kbvVOLnVbObb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: company; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.company (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    address character varying(255),
    company_created_date date,
    cover_url character varying(255),
    deleted_at timestamp(6) without time zone,
    description text,
    is_blocked boolean,
    lat character varying(255),
    lng character varying(255),
    logo_path character varying(255),
    name character varying(255) NOT NULL,
    owner_user_id bigint NOT NULL,
    phone_primary character varying(255),
    phone_secondary character varying(255),
    reject_reason character varying(255),
    short_description text,
    slug character varying(255),
    stir character varying(255),
    verification_status character varying(255),
    verified_at timestamp(6) without time zone,
    website character varying(255),
    type character varying(255) DEFAULT 'MCHJ'::character varying NOT NULL,
    CONSTRAINT company_verification_status_check CHECK (((verification_status)::text = ANY ((ARRAY['DRAFT'::character varying, 'PENDING_VERIFICATION'::character varying, 'VERIFIED'::character varying, 'REJECTED'::character varying])::text[])))
);


ALTER TABLE public.company OWNER TO sklad_user;

--
-- Name: company_branch; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.company_branch (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    address character varying(255),
    branch_name character varying(255),
    lat character varying(255),
    lng character varying(255),
    phone character varying(255),
    company_id bigint
);


ALTER TABLE public.company_branch OWNER TO sklad_user;

--
-- Name: company_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.company_branch ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.company_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: company_document; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.company_document (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    attach_id character varying(255),
    company_id bigint,
    document_type character varying(255),
    file_url character varying(255),
    status character varying(255)
);


ALTER TABLE public.company_document OWNER TO sklad_user;

--
-- Name: company_document_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.company_document ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.company_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: company_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.company ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: company_reviews; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.company_reviews (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    buyer_id bigint NOT NULL,
    comment text,
    rating integer NOT NULL,
    company_id bigint NOT NULL
);


ALTER TABLE public.company_reviews OWNER TO sklad_user;

--
-- Name: company_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.company_reviews ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.company_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: favorite; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.favorite (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    company_id bigint,
    user_id bigint
);


ALTER TABLE public.favorite OWNER TO sklad_user;

--
-- Name: favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.favorite ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO sklad_user;

--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.company (id, created_by, created_date, deleted, modified_by, modified_date, address, company_created_date, cover_url, deleted_at, description, is_blocked, lat, lng, logo_path, name, owner_user_id, phone_primary, phone_secondary, reject_reason, short_description, slug, stir, verification_status, verified_at, website, type) FROM stdin;
2	\N	2026-07-18 13:41:57.42849	f	\N	2026-07-26 08:10:38.125365	G`allaorol	2025-11-12	\N	\N		f	40.022165144414934	67.59276768759918	\N	Tayanch Build Supply	3	+998901234567	hojiakbarandaqulov5@gmail.com	\N	Tayanch Build Supply qurilish kompaniyalari, ustalar va xususiy xaridorlar uchun ishonchli ta’minot xizmatini taklif etadi. Assortimentimizda sement, g‘isht, armatura, quvur, list metall, quruq aralashmalar va asbob-uskunalar mavjud. Buyurtmalarni tezkor tayyorlash, sifat nazorati va Toshkent bo‘ylab yetkazib berishni ta’minlaymiz.	tayanch-build-supply	11223344	VERIFIED	2026-07-18 13:45:09.48158		MCHJ
3	\N	2026-07-18 18:24:23.02488	f	\N	2026-08-17 15:22:07.159954	Катта Чиланзар-2 МФЙ	2016-07-18	https://media.skladmarket.uz/skalad-market/29c2c45c-80fa-4fb2-80ff-c4be37d1ccbb	\N	SkladX — korxonaning ichki boshqaruvi, savdosi, mijozlar bilan ishlashi va kadrlar topish jarayonlarini yagona platformada birlashtiruvchi zamonaviy raqamli ekotizim.\n	f	41.28019708292792	69.22791659832002	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	7	+998908287415	m6mintm@gmail.com	\N	Metolurgiya va Qurilish materiallari 	ooo-metal-system	303456989	VERIFIED	2026-07-18 20:23:49.33833	www.skladx.uz	MCHJ
1	\N	2026-07-17 21:47:54.356709	f	\N	2026-07-17 21:49:17.486861	г. Ташкент, Яшнабадский район, ул.	2018-04-12	\N	\N	\N	f	41.296831	69.2976662	https://media.skladmarket.uz/skalad-market/6aea8452-2899-4ed2-9194-40f6872d263a	ООО "Premium Steel Logistics"	2	+998 71 200 45 45	\N	\N	Оптовые поставки черного и цветного металлопроката, арматуры и стальных труб напрямую от ведущих заводов-производителей.	premium-steel-logistics	308412956	VERIFIED	2026-07-17 21:49:17.486026	\N	MCHJ
6	\N	2026-07-29 11:04:50.954774	f	\N	2026-07-29 21:30:47.565192	Kapitalbank, 86a, Нукусская улица, Мирабад махалля, Мирабадский район, Ташкент, 100015, Узбекистан	2012-12-12	\N	\N	\N	f	41.28870664105433	69.27296161651613	https://media.skladmarket.uz/skalad-market/5b7fe7ef-ce7d-4fed-a09a-b55cda3ffee1	Steel Group	15	+998908287415	\N	\N	Оптовая продожа металопроката	steel-group	303909808	VERIFIED	2026-07-29 21:30:47.555603	\N	MCHJ
7	\N	2026-07-30 09:49:06.577153	f	\N	2026-07-30 12:14:41.271475	Jizzax	2024-09-24	\N	\N	\N	f	40.1331797	67.8234081	\N	Metal Invest Group	5	+998995092376	\N	\N	qurilish, ishlab chiqarish va infratuzilma loyihalari uchun ishonchli yechimlarni taqdim etuvchi po'lat, metall buyumlar va sanoat materiallarining yetakchi yetkazib beruvchisi hisoblanadi.	metal-invest-group	1122334455	VERIFIED	2026-07-30 12:14:41.270559	\N	MCHJ
4	\N	2026-07-18 23:08:14.858767	f	\N	2026-08-02 22:49:57.676865	Tashkent	2024-06-14	\N	\N	\N	t	41.31424074457123	69.27120208740236	\N	test company	4	+998901234567	\N	string	string	test-company	123456789	VERIFIED	2026-07-19 17:30:29.20694	\N	MCHJ
5	\N	2026-07-19 17:27:00.987595	f	\N	2026-08-03 16:59:34.181706	Ташкент	2021-12-19	https://media.skladmarket.uz/skalad-market/d8506a5c-4286-471f-af6d-56ae8426f801	\N		f	41.23857658460282	69.16442871093751	https://media.skladmarket.uz/skalad-market/b15efb88-2f4c-40e4-ab5e-33ab95756acb	Chem System	12	+998907654322		\N	Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ratione, rerum nam, voluptatum dolores ullam odio, labore consequatur porro sint culpa quidem repudiandae vel? Accusantium, asperiores ullam. Deserunt repudiandae sequi mollitia?	company	987651234	VERIFIED	2026-07-19 17:30:28.324242		MCHJ
\.


--
-- Data for Name: company_branch; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.company_branch (id, created_by, created_date, deleted, modified_by, modified_date, address, branch_name, lat, lng, phone, company_id) FROM stdin;
2	\N	2026-07-27 21:46:09.331238	t	\N	2026-07-27 21:47:00.352792	M37, Маданбай, Шалгамхуран, Эскиян, Джандарский район, Бухарская область, Узбекистан	Chem System 2	39.757879992021756	64.29199218750001		5
1	\N	2026-07-27 21:43:57.353981	f	\N	2026-07-27 21:47:10.571537	M37, Маданбай, Шалгамхуран, Эскиян, Джандарский район, Бухарская область, Узбекистан	Chem System 2	39.757879992021756	64.29199218750001		5
3	\N	2026-07-29 21:29:49.356526	f	\N	2026-07-29 21:29:49.356526	56, Shota Rustaveli ko'chasi, Yakkasaroy Tumani, Toshkent, 100000, Oʻzbekiston	Tayanch Build Supply 2	41.281184016202715	69.2485600209303	+998995092376	2
4	\N	2026-08-17 15:24:01.630299	f	\N	2026-08-17 15:24:01.630299	8/1, Olmazor daxasi, Алмазар массив, Чиланзарский район, Ташкент, 100000, Узбекистан	филиал 2 Метал Систем	41.31069493916054	69.24390792846681	+998908287415	3
\.


--
-- Data for Name: company_document; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.company_document (id, created_by, created_date, deleted, modified_by, modified_date, attach_id, company_id, document_type, file_url, status) FROM stdin;
\.


--
-- Data for Name: company_reviews; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.company_reviews (id, created_by, created_date, deleted, modified_by, modified_date, buyer_id, comment, rating, company_id) FROM stdin;
1	\N	2026-08-03 16:46:33.649235	f	\N	2026-08-03 16:46:33.649235	8	Zo'r	5	5
\.


--
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.favorite (id, created_by, created_date, deleted, modified_by, modified_date, company_id, user_id) FROM stdin;
2	\N	2026-07-18 11:42:55.268659	t	\N	2026-07-18 11:43:01.256273	1	4
3	\N	2026-07-18 13:38:17.861265	f	\N	2026-07-18 13:38:17.861265	1	3
1	\N	2026-07-17 21:49:24.294638	t	\N	2026-07-18 14:38:36.14356	1	1
4	\N	2026-07-20 12:19:32.234936	t	\N	2026-07-20 12:20:13.676627	5	12
5	\N	2026-07-26 18:15:56.15947	f	\N	2026-07-26 18:15:56.15947	5	5
6	\N	2026-07-26 18:15:57.667495	f	\N	2026-07-26 18:15:57.667495	4	5
7	\N	2026-07-26 19:12:56.558768	t	\N	2026-07-26 19:13:01.66987	5	12
8	\N	2026-08-03 16:58:23.32427	t	\N	2026-08-04 14:34:29.514878	5	12
9	\N	2026-08-04 14:34:40.574689	t	\N	2026-08-04 14:34:51.921359	6	12
10	\N	2026-08-12 15:17:09.368616	f	\N	2026-08-12 15:17:09.368616	7	8
11	\N	2026-08-15 14:20:19.110501	t	\N	2026-08-15 14:20:20.129413	6	12
12	\N	2026-08-20 15:57:26.231399	f	\N	2026-08-20 15:57:26.231399	2	12
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	sklad_user	2026-07-17 21:37:00.085502	0	t
2	2	update-table-company	SQL	V2__update-table-company.sql	432490699	sklad_user	2026-07-17 21:37:00.173435	9	t
3	3	create company reviews	SQL	V3__create_company_reviews.sql	-539930524	sklad_user	2026-07-30 09:38:48.063052	121	t
\.


--
-- Name: company_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.company_branch_id_seq', 4, true);


--
-- Name: company_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.company_document_id_seq', 1, false);


--
-- Name: company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.company_id_seq', 7, true);


--
-- Name: company_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.company_reviews_id_seq', 1, true);


--
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.favorite_id_seq', 12, true);


--
-- Name: company_branch company_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company_branch
    ADD CONSTRAINT company_branch_pkey PRIMARY KEY (id);


--
-- Name: company_document company_document_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company_document
    ADD CONSTRAINT company_document_pkey PRIMARY KEY (id);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- Name: company_reviews company_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company_reviews
    ADD CONSTRAINT company_reviews_pkey PRIMARY KEY (id);


--
-- Name: favorite favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: company uk8042i6t43w2imvm3fr0x67h0t; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT uk8042i6t43w2imvm3fr0x67h0t UNIQUE (slug);


--
-- Name: company ukq1iecm3isaxul99mqdi0n63mj; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT ukq1iecm3isaxul99mqdi0n63mj UNIQUE (stir);


--
-- Name: company_reviews uq_company_reviews_company_buyer; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company_reviews
    ADD CONSTRAINT uq_company_reviews_company_buyer UNIQUE (company_id, buyer_id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: sklad_user
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- Name: idx_company_reviews_company_active_created; Type: INDEX; Schema: public; Owner: sklad_user
--

CREATE INDEX idx_company_reviews_company_active_created ON public.company_reviews USING btree (company_id, deleted, created_date DESC);


--
-- Name: company_branch fkift6x1euaka0k19gl3q10mlc1; Type: FK CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company_branch
    ADD CONSTRAINT fkift6x1euaka0k19gl3q10mlc1 FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- Name: company_reviews fkku1t4trxde33uilntnoicyvlt; Type: FK CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.company_reviews
    ADD CONSTRAINT fkku1t4trxde33uilntnoicyvlt FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- PostgreSQL database dump complete
--

\unrestrict qOWrpDAja9SzfTcYdTU6MzsWEyRTUJm4OSAxkkSycJA5z1l3Md4kbvVOLnVbObb

--
-- Database "skalad_market_file" dump
--

--
-- PostgreSQL database dump
--

\restrict 1zdFPpW6f8FGXiKLOBAIEoWN5jCDejPiVhUFk2JT1JucDEClE7r4wVrc4VeA8Ob

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_file; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_file WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_file OWNER TO sklad_user;

\unrestrict 1zdFPpW6f8FGXiKLOBAIEoWN5jCDejPiVhUFk2JT1JucDEClE7r4wVrc4VeA8Ob
\connect skalad_market_file
\restrict 1zdFPpW6f8FGXiKLOBAIEoWN5jCDejPiVhUFk2JT1JucDEClE7r4wVrc4VeA8Ob

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: attach; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.attach (
    id character varying(255) NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    extension character varying(255),
    mime_type character varying(255),
    original_name character varying(255),
    path character varying(255),
    size bigint
);


ALTER TABLE public.attach OWNER TO sklad_user;

--
-- Data for Name: attach; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.attach (id, created_by, created_date, deleted, modified_by, modified_date, extension, mime_type, original_name, path, size) FROM stdin;
6aea8452-2899-4ed2-9194-40f6872d263a.png	\N	2026-07-17 21:49:03.096513	f	\N	\N	png	image/png	brand.png	skalad-market/6aea8452-2899-4ed2-9194-40f6872d263a	905893
37c8da79-7648-4d57-bb3e-735a2614cbb3.jpg	\N	2026-07-18 09:31:03.900597	f	\N	\N	jpg	image/jpeg	photo_2026-07-17_22-12-56.jpg	skalad-market/37c8da79-7648-4d57-bb3e-735a2614cbb3	73982
e510b879-63fa-4edd-b310-e1b1c574e666.jpg	\N	2026-07-18 09:31:18.991161	f	\N	\N	jpg	image/jpeg	photo_2026-07-17_22-12-56.jpg	skalad-market/e510b879-63fa-4edd-b310-e1b1c574e666	73982
563570e0-21d2-46cf-bfb2-fa6ec7f0878f.jpg	\N	2026-07-18 13:46:45.72357	f	\N	\N	jpg	image/jpeg	images (1).jpg	skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	19093
d580f806-e231-4842-b388-0c4163fb18b8.png	\N	2026-07-18 16:17:28.621134	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/d580f806-e231-4842-b388-0c4163fb18b8	476193
269384ea-9ed6-4781-a97b-e05f18f05433.jpg	\N	2026-07-18 17:03:03.995977	f	\N	\N	jpg	image/jpeg	b85975259cb662937ee12ad1ec087c96f727b77e.jpg	skalad-market/269384ea-9ed6-4781-a97b-e05f18f05433	62799
0db18b2b-3579-4b35-81a8-61ee72f6ebdc.JPG	\N	2026-07-18 18:42:00.713849	f	\N	\N	JPG	image/jpeg	IMG_0801.JPG	skalad-market/0db18b2b-3579-4b35-81a8-61ee72f6ebdc	71659
b0b8d002-4df3-4c91-bf9a-ac93656fdf64.jpg	\N	2026-07-18 20:19:14.631928	f	\N	\N	jpg	image/jpeg	images (3).jpg	skalad-market/b0b8d002-4df3-4c91-bf9a-ac93656fdf64	9451
eddd9ac8-54b0-4d98-a27d-edb0f7849ab2.jpg	\N	2026-07-19 00:47:18.031724	f	\N	\N	jpg	image/jpeg	istockphoto-646996026-612x612.jpg	skalad-market/eddd9ac8-54b0-4d98-a27d-edb0f7849ab2	50613
0eab16f9-162c-41fa-a099-b50121894f5b.jpg	\N	2026-07-19 00:47:55.899432	f	\N	\N	jpg	image/jpeg	istockphoto-646996026-612x612.jpg	skalad-market/0eab16f9-162c-41fa-a099-b50121894f5b	50613
68edcf1c-0fd3-4c6b-9a38-6a2c7cd1a0b0.jpg	\N	2026-07-19 00:53:09.26427	f	\N	\N	jpg	image/jpeg	istockphoto-646996026-612x612.jpg	skalad-market/68edcf1c-0fd3-4c6b-9a38-6a2c7cd1a0b0	50613
bc31a0ea-35e5-4220-8b3c-cf3a31a0a751.jpg	\N	2026-07-19 00:54:05.176097	f	\N	\N	jpg	image/jpeg	istockphoto-646996026-612x612.jpg	skalad-market/bc31a0ea-35e5-4220-8b3c-cf3a31a0a751	50613
be76c0e0-7dc2-4113-982e-7bf139d6253b.jpg	\N	2026-07-19 00:55:32.547339	f	\N	\N	jpg	image/jpeg	istockphoto-646996026-612x612.jpg	skalad-market/be76c0e0-7dc2-4113-982e-7bf139d6253b	50613
9804f3f5-5e99-4841-ab72-75900d32a2a5.jpg	\N	2026-07-19 00:58:01.777839	f	\N	\N	jpg	image/jpeg	istockphoto-646996026-612x612.jpg	skalad-market/9804f3f5-5e99-4841-ab72-75900d32a2a5	50613
ef3d973e-7a33-4b52-84f5-2df45232256d.jpg	\N	2026-07-19 00:59:27.662307	f	\N	\N	jpg	image/jpeg	istockphoto-646996026-612x612.jpg	skalad-market/ef3d973e-7a33-4b52-84f5-2df45232256d	50613
d463fec9-c8c0-4d27-a0b7-a16d2de8e3ef.jpg	\N	2026-07-19 01:06:11.007605	f	\N	\N	jpg	image/jpeg	istockphoto-646996026-612x612.jpg	skalad-market/d463fec9-c8c0-4d27-a0b7-a16d2de8e3ef	50613
89811024-e672-4e1b-bb60-aa2c0a685599.jpg	\N	2026-07-19 07:46:14.542702	f	\N	\N	jpg	image/jpeg	photo_2025-04-28_09-47-09.jpg	skalad-market/89811024-e672-4e1b-bb60-aa2c0a685599	73173
1c3f8e7d-d0b9-4757-a9b8-31ab72916c6c.png	\N	2026-07-19 12:37:44.989266	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/1c3f8e7d-d0b9-4757-a9b8-31ab72916c6c	476193
ef6f9109-f8fb-47be-8400-bc497672e524.png	\N	2026-07-19 12:46:35.081977	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/ef6f9109-f8fb-47be-8400-bc497672e524	476193
9afe1e33-39d4-4b8c-85b7-4436ba7fd566.png	\N	2026-07-19 12:47:38.412054	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/9afe1e33-39d4-4b8c-85b7-4436ba7fd566	476193
05b0e2d2-9fd1-4c6b-b87b-7bd19434df8e.jpg	\N	2026-07-19 15:34:00.426258	f	\N	\N	jpg	image/jpeg	photo_2024-10-09_21-35-51.jpg	skalad-market/05b0e2d2-9fd1-4c6b-b87b-7bd19434df8e	218987
c867ffd9-b689-4a1b-be4b-262ea5af2cb9.png	\N	2026-07-19 15:42:59.72215	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/c867ffd9-b689-4a1b-be4b-262ea5af2cb9	476193
b986cc50-fde7-415d-9a42-b0810b6c0919.jpg	\N	2026-07-19 17:53:27.584556	f	\N	\N	jpg	image/jpeg	photo_2025-04-28_09-47-09.jpg	skalad-market/b986cc50-fde7-415d-9a42-b0810b6c0919	73173
d0a5731d-8826-478a-8dd2-2c04ecbf1cf6.jpg	\N	2026-07-19 18:07:31.156406	f	\N	\N	jpg	image/jpeg	photo_2025-04-28_09-47-09.jpg	skalad-market/d0a5731d-8826-478a-8dd2-2c04ecbf1cf6	73173
cd87460a-43ab-4b03-a79b-960d6104452b.png	\N	2026-07-19 18:44:03.55208	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/cd87460a-43ab-4b03-a79b-960d6104452b	476193
ef42a642-7b36-400e-bc1f-6c6dd214583a.png	\N	2026-07-19 18:49:04.344689	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/ef42a642-7b36-400e-bc1f-6c6dd214583a	476193
df93f13a-8eda-4c06-b5ce-7cb87c689aec.png	\N	2026-07-19 18:55:54.881265	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/df93f13a-8eda-4c06-b5ce-7cb87c689aec	476193
d43d2c31-8951-4465-993d-ceb265c2f9e2.jpg	\N	2026-07-19 19:19:16.924134	f	\N	\N	jpg	image/jpeg	photo_2025-04-28_09-47-09.jpg	skalad-market/d43d2c31-8951-4465-993d-ceb265c2f9e2	73173
37cc877f-1712-454f-a094-92013c8fa282.jpg	\N	2026-07-19 20:18:26.936607	f	\N	\N	jpg	image/jpeg	2.jpg	skalad-market/37cc877f-1712-454f-a094-92013c8fa282	15726
26a5801e-1423-43ad-b14c-ce286a3abdad.png	\N	2026-07-19 20:28:46.782995	f	\N	\N	png	image/png	Screenshot 2026-07-19 202826.png	skalad-market/26a5801e-1423-43ad-b14c-ce286a3abdad	800216
0da3274d-effa-4a4a-b3ae-d8c51305b12f.png	\N	2026-07-19 20:31:34.494477	f	\N	\N	png	image/png	Screenshot 2026-07-19 203121.png	skalad-market/0da3274d-effa-4a4a-b3ae-d8c51305b12f	254094
6cb77e18-1e26-4de9-9e89-db9bf71ed847.png	\N	2026-07-19 20:34:29.591081	f	\N	\N	png	image/png	Screenshot 2026-07-19 203405.png	skalad-market/6cb77e18-1e26-4de9-9e89-db9bf71ed847	361942
442cd79d-758a-4357-a89d-891fc7abb1fe.png	\N	2026-07-19 20:38:12.343374	f	\N	\N	png	image/png	Screenshot 2026-07-19 203757.png	skalad-market/442cd79d-758a-4357-a89d-891fc7abb1fe	766138
d081e0ec-1ec7-4540-afb3-07cbd578137c.png	\N	2026-07-19 20:41:36.193191	f	\N	\N	png	image/png	Screenshot 2026-07-19 204126.png	skalad-market/d081e0ec-1ec7-4540-afb3-07cbd578137c	678148
c38d1d93-1140-4e91-87a0-952fbbca4b3b.png	\N	2026-07-19 20:44:19.079235	f	\N	\N	png	image/png	Screenshot 2026-07-19 204351.png	skalad-market/c38d1d93-1140-4e91-87a0-952fbbca4b3b	760597
07670e75-b018-4874-9e4a-005122474b8f.png	\N	2026-07-19 20:46:47.898373	f	\N	\N	png	image/png	Screenshot 2026-07-19 204637.png	skalad-market/07670e75-b018-4874-9e4a-005122474b8f	132011
7bd6c96a-94da-4b7b-93bc-22d21f9c3ebb.png	\N	2026-07-19 20:48:32.154516	f	\N	\N	png	image/png	Screenshot 2026-07-19 204817.png	skalad-market/7bd6c96a-94da-4b7b-93bc-22d21f9c3ebb	175213
4ad38c97-008d-412b-9883-ec714137c27c.jpg	\N	2026-07-19 21:12:37.955937	f	\N	\N	jpg	image/jpeg	photo_2024-10-09_21-35-51.jpg	skalad-market/4ad38c97-008d-412b-9883-ec714137c27c	218987
4c750a61-3a10-410a-8a81-3f721e621f4a.jpg	\N	2026-07-19 21:19:04.761767	f	\N	\N	jpg	image/jpeg	photo_2024-10-09_21-35-51.jpg	skalad-market/4c750a61-3a10-410a-8a81-3f721e621f4a	218987
ae55362c-8bd5-4815-9feb-b8c92df7c3c5.png	\N	2026-07-19 21:28:36.35639	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/ae55362c-8bd5-4815-9feb-b8c92df7c3c5	476193
3bc77598-8838-4f0c-a743-34bec49c5aa3.png	\N	2026-07-19 21:51:13.451841	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/3bc77598-8838-4f0c-a743-34bec49c5aa3	476193
622d4008-27cc-4b08-9659-61e1e6b66de5.png	\N	2026-07-19 21:56:33.329439	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/622d4008-27cc-4b08-9659-61e1e6b66de5	476193
8762d7a3-7a6d-4580-9f92-263bf63a689f.png	\N	2026-07-19 21:57:50.94484	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/8762d7a3-7a6d-4580-9f92-263bf63a689f	476193
e7a1ba83-8780-465f-8ecf-b33e32c9380d.jpg	\N	2026-07-19 22:00:22.485727	f	\N	\N	jpg	image/jpeg	photo_2025-04-28_09-47-09.jpg	skalad-market/e7a1ba83-8780-465f-8ecf-b33e32c9380d	73173
bc647381-9704-4e1d-aa77-c78244b280dd.png	\N	2026-07-19 22:04:32.056126	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/bc647381-9704-4e1d-aa77-c78244b280dd	476193
5840c3a3-a98b-4a50-8b67-dab065d347e5.png	\N	2026-07-19 22:14:24.108042	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/5840c3a3-a98b-4a50-8b67-dab065d347e5	476193
249fda0c-407b-44fd-a0af-424a2d533c0c.png	\N	2026-07-19 22:21:34.217182	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/249fda0c-407b-44fd-a0af-424a2d533c0c	476193
d5fe5199-5473-4a2c-8da6-14634c68e07d.png	\N	2026-07-19 22:30:38.278655	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/d5fe5199-5473-4a2c-8da6-14634c68e07d	476193
b0e71f35-4191-49f4-bcf4-68aec9f6279f.png	\N	2026-07-20 03:50:54.180241	f	\N	\N	png	image/png	ChatGPT Image 12 июня 2026 г., 09_48_12.png	skalad-market/b0e71f35-4191-49f4-bcf4-68aec9f6279f	897040
f7f486dc-b7af-4d71-b9b5-a172584a3cec.png	\N	2026-07-20 10:57:05.075468	f	\N	\N	png	image/png	223_original.png	skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	129521
96e0222d-1935-4a9c-b9d9-8ef4e3d8cf85.jpg	\N	2026-07-20 11:00:17.519298	f	\N	\N	jpg	image/jpeg	NS-35_2-_3_.jpg	skalad-market/96e0222d-1935-4a9c-b9d9-8ef4e3d8cf85	29593
ee555444-ef79-4001-a78f-4757734a6d8a.webp	\N	2026-07-20 11:01:50.788064	f	\N	\N	webp	image/webp	NS_35_A_Gla_5005.jpg.webp	skalad-market/ee555444-ef79-4001-a78f-4757734a6d8a	13184
484ec4c3-0e8b-460d-9d4e-60fd86b3e670.webp	\N	2026-07-20 11:04:32.636817	f	\N	\N	webp	image/webp	NS_35_A_Gla_6005.jpg.webp	skalad-market/484ec4c3-0e8b-460d-9d4e-60fd86b3e670	11050
3fe92cb6-e8ed-4fe2-96b5-d3f7f008a5fe.webp	\N	2026-07-20 11:06:20.095243	f	\N	\N	webp	image/webp	NS_35_A_Gla_2004.jpg.webp	skalad-market/3fe92cb6-e8ed-4fe2-96b5-d3f7f008a5fe	13746
2acf3560-5d89-42f4-a5fb-479f55ef96e5.webp	\N	2026-07-20 11:09:06.639752	f	\N	\N	webp	image/webp	lamonterra_A_Gla_8017.jpg.webp	skalad-market/2acf3560-5d89-42f4-a5fb-479f55ef96e5	14072
dda9a1dd-21b7-492e-bc3b-f7bff905107b.webp	\N	2026-07-20 11:11:44.223228	f	\N	\N	webp	image/webp	lamonterra_A_Gla_9003.jpg.webp	skalad-market/dda9a1dd-21b7-492e-bc3b-f7bff905107b	10624
c57abdd7-b07c-42d0-9f13-58b95611c4d1.jpg	\N	2026-07-20 11:28:36.066364	f	\N	\N	jpg	image/jpeg	04fc7a0beab7cd8fd9451413c82f59cf.jpg	skalad-market/c57abdd7-b07c-42d0-9f13-58b95611c4d1	43390
bbb3b3d5-8bf6-40a3-8d21-307125c581e9.png	\N	2026-07-20 12:48:32.666963	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/bbb3b3d5-8bf6-40a3-8d21-307125c581e9	476193
ca8df8f2-721d-4d0a-8cf3-b2e37b042f61.png	\N	2026-07-20 12:51:54.85941	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/ca8df8f2-721d-4d0a-8cf3-b2e37b042f61	476193
9431da65-bca1-4786-87d0-610d311a617d.jpg	\N	2026-07-20 14:10:21.730318	f	\N	\N	jpg	image/jpeg	istockphoto-2203186560-612x612.jpg	skalad-market/9431da65-bca1-4786-87d0-610d311a617d	17512
2479d3ba-f83c-4cbb-8bc1-11a434cf8111.jpeg	\N	2026-07-20 14:11:29.502877	f	\N	\N	jpeg	image/jpeg	photo_2026-07-15 16.55.41.jpeg	skalad-market/2479d3ba-f83c-4cbb-8bc1-11a434cf8111	10155
3213ca52-406a-4e02-8e34-0a97dd127ce2.png	\N	2026-07-20 16:01:50.315298	f	\N	\N	png	image/png	ChatGPT Image 30 дек. 2025 г., 14_48_12.png	skalad-market/3213ca52-406a-4e02-8e34-0a97dd127ce2	264501
28c33963-65d0-465e-8a74-640829cc047a.webp	\N	2026-07-21 08:56:35.122633	f	\N	\N	webp	image/webp	L_height.webp	skalad-market/28c33963-65d0-465e-8a74-640829cc047a	29290
3b7cf039-5ef1-48be-b30b-62a0c7a012b0.png	\N	2026-07-21 08:59:02.253309	f	\N	\N	png	image/png	ChatGPT Image 13 мая 2026 г., 09_32_24.png	skalad-market/3b7cf039-5ef1-48be-b30b-62a0c7a012b0	856347
f022ec3a-eed2-4630-bc94-776a5b9f2540.jpg	\N	2026-07-21 09:00:03.061251	f	\N	\N	jpg	image/jpeg	silhouette-skyline-panorama-of-city-of-tashkent-uzbekistan-vector-illustration-2JNAD2K.jpg	skalad-market/f022ec3a-eed2-4630-bc94-776a5b9f2540	72114
29c2c45c-80fa-4fb2-80ff-c4be37d1ccbb.jpg	\N	2026-07-21 09:01:28.97477	f	\N	\N	jpg	image/jpeg	360_F_737721415_vR9mFZVJMW7l1e9SenaXNkHN1Qzvow0L.jpg	skalad-market/29c2c45c-80fa-4fb2-80ff-c4be37d1ccbb	83293
ebc396d4-355e-4b4a-8aae-7fde52eb0c2a.jpg	\N	2026-07-21 09:04:40.578987	f	\N	\N	jpg	image/jpeg	68314447.jpg	skalad-market/ebc396d4-355e-4b4a-8aae-7fde52eb0c2a	99951
7c2c7c62-2024-4c8d-a2bc-456fe2d87946.png	\N	2026-07-21 09:06:57.424682	f	\N	\N	png	image/png	ChatGPT Image 21 июля 2026 г., 09_06_25.png	skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	741765
90be4d05-1d2f-4855-afb1-84cf7c13b141.jpeg	\N	2026-07-21 09:10:43.970441	f	\N	\N	jpeg	image/jpeg	photo_2026-07-15 16.55.41.jpeg	skalad-market/90be4d05-1d2f-4855-afb1-84cf7c13b141	10155
31643722-a1ae-4e9d-888f-be3a36f3c5a4.png	\N	2026-07-22 13:17:10.170691	f	\N	\N	png	image/png	78bb1f6793db04ba397b48e1f3bd3ad243349bda.png	skalad-market/31643722-a1ae-4e9d-888f-be3a36f3c5a4	476193
dda0d904-452c-4b87-9b97-66a4835ed08a.jpeg	\N	2026-07-25 15:45:12.665324	f	\N	\N	jpeg	image/jpeg	photo_2026-07-25 15.44.12 copy.jpeg	skalad-market/dda0d904-452c-4b87-9b97-66a4835ed08a	4350
6a30c47c-74e2-4f32-8797-c7436c450cad.jpeg	\N	2026-07-25 17:01:20.019663	f	\N	\N	jpeg	image/jpeg	photo_2026-07-25 16.46.19.jpeg	skalad-market/6a30c47c-74e2-4f32-8797-c7436c450cad	4434
8005ff87-8e62-47ca-88a3-c99698b4d215.jpeg	\N	2026-07-25 17:08:14.185097	f	\N	\N	jpeg	image/jpeg	photo_2026-07-25 16.46.19 copy.jpeg	skalad-market/8005ff87-8e62-47ca-88a3-c99698b4d215	4634
b15efb88-2f4c-40e4-ab5e-33ab95756acb.png	\N	2026-07-25 17:47:26.354149	f	\N	\N	png	image/png	Gemini_Generated_Image_pd78i0pd78i0pd78.png	skalad-market/b15efb88-2f4c-40e4-ab5e-33ab95756acb	332096
d8506a5c-4286-471f-af6d-56ae8426f801.png	\N	2026-07-25 17:49:07.696753	f	\N	\N	png	image/png	Gemini_Generated_Image_pd78i0pd78i0pd78-2.png	skalad-market/d8506a5c-4286-471f-af6d-56ae8426f801	773275
89b14081-f762-4e0f-9704-737eaa7f5d32.png	\N	2026-07-25 17:58:38.248206	f	\N	\N	png	image/png	Gemini_Generated_Image_zbtss2zbtss2zbts-2.png	skalad-market/89b14081-f762-4e0f-9704-737eaa7f5d32	427291
a5ac563c-ac7e-467e-99f1-ce63b7cb718d.png	\N	2026-07-25 18:10:44.129119	f	\N	\N	png	image/png	Gemini_Generated_Image_6aiba76aiba76aib-2.png	skalad-market/a5ac563c-ac7e-467e-99f1-ce63b7cb718d	611118
866627d8-d8ff-4a82-9a92-278842ee06b0.png	\N	2026-07-25 18:21:25.956515	f	\N	\N	png	image/png	Gemini_Generated_Image_cymqqcymqqcymqqc-2.png	skalad-market/866627d8-d8ff-4a82-9a92-278842ee06b0	568816
dfb94895-1d71-4742-9137-2c229d1f438e.png	\N	2026-07-26 09:53:41.797965	f	\N	\N	png	image/png	Снимок экрана 2026-03-29 в 20.57.46.png	skalad-market/dfb94895-1d71-4742-9137-2c229d1f438e	31748
f1a02033-a427-41bc-aae7-499397d94960.webp	\N	2026-07-27 11:26:40.871371	f	\N	\N	webp	image/webp	L_height.webp	skalad-market/f1a02033-a427-41bc-aae7-499397d94960	29290
5b7fe7ef-ce7d-4fed-a09a-b55cda3ffee1.png	\N	2026-07-29 11:06:03.163977	f	\N	\N	png	image/png	ChatGPT Image 13 мая 2026 г., 09_29_16.png	skalad-market/5b7fe7ef-ce7d-4fed-a09a-b55cda3ffee1	887827
8a5786c8-c8f9-4c9e-bb03-7eaf3831ce8d.jpg	\N	2026-08-01 21:07:59.274777	f	\N	\N	jpg	image/jpeg	istockphoto-1414159128-2048x2048.jpg	skalad-market/8a5786c8-c8f9-4c9e-bb03-7eaf3831ce8d	394611
1f086280-e34a-4a06-a51f-e754dc08b606.jpg	\N	2026-08-02 21:51:07.862934	f	\N	\N	jpg	image/jpeg	images (1).jpg	skalad-market/1f086280-e34a-4a06-a51f-e754dc08b606	19093
a3c020e3-d842-4177-a27d-dbf568c5178b.jpg	\N	2026-08-02 21:56:47.162309	f	\N	\N	jpg	image/jpeg	images (4).jpg	skalad-market/a3c020e3-d842-4177-a27d-dbf568c5178b	6612
69c6768b-4c69-430d-a016-edfc7b8d9f33.webp	\N	2026-08-02 22:01:42.160158	f	\N	\N	webp	image/webp	Steel-Plates-larger.jpg.webp	skalad-market/69c6768b-4c69-430d-a016-edfc7b8d9f33	18502
6408ed18-e11e-4d7b-b930-ebff02766fa7.png	\N	2026-08-02 23:21:19.505706	f	\N	\N	png	image/png	3676780.png	skalad-market/6408ed18-e11e-4d7b-b930-ebff02766fa7	10801
d3b56617-3ef3-4810-96e7-f27b4041a84b.png	\N	2026-08-02 23:27:25.648758	f	\N	\N	png	image/png	3676780.png	skalad-market/d3b56617-3ef3-4810-96e7-f27b4041a84b	10801
73be8a46-8b5c-45cf-b3f8-96e701f7d8a7.png	\N	2026-08-02 23:46:51.538856	f	\N	\N	png	image/png	3676780.png	skalad-market/73be8a46-8b5c-45cf-b3f8-96e701f7d8a7	10801
f68c10bb-00b6-4075-9715-9a3061dc769c.png	\N	2026-08-03 08:56:28.020118	f	\N	\N	png	image/png	ChatGPT Image 30 июня 2026 г., 14_27_43.png	skalad-market/f68c10bb-00b6-4075-9715-9a3061dc769c	765621
3ac37963-c35d-4fd0-9bae-9f9a03481ecc.png	\N	2026-08-03 08:58:41.983164	f	\N	\N	png	image/png	ChatGPT Image 30 июня 2026 г., 14_33_15.png	skalad-market/3ac37963-c35d-4fd0-9bae-9f9a03481ecc	765621
fadb0b0b-17c0-46ca-a76b-76c698ca458f.png	\N	2026-08-03 11:45:08.273132	f	\N	\N	png	image/png	3676780.png	skalad-market/fadb0b0b-17c0-46ca-a76b-76c698ca458f	10801
d592c12c-0781-4922-a4f4-41a5cdf34b96.png	\N	2026-08-03 11:46:29.271851	f	\N	\N	png	image/png	3676780.png	skalad-market/d592c12c-0781-4922-a4f4-41a5cdf34b96	10801
9fa28a9c-074a-4e6f-8d32-fc534c1960cd.png	\N	2026-08-03 11:47:49.933618	f	\N	\N	png	image/png	3676780.png	skalad-market/9fa28a9c-074a-4e6f-8d32-fc534c1960cd	10801
d267fa5d-cd67-4bf1-a4ad-667816779ff6.png	\N	2026-08-03 11:50:22.523964	f	\N	\N	png	image/png	3676780.png	skalad-market/d267fa5d-cd67-4bf1-a4ad-667816779ff6	10801
0a8d0617-b64f-4129-b049-f556b6307389.png	\N	2026-08-03 11:52:22.110226	f	\N	\N	png	image/png	3676780.png	skalad-market/0a8d0617-b64f-4129-b049-f556b6307389	10801
8b633197-348c-4151-ad0a-78a12a761172.png	\N	2026-08-03 11:53:31.074667	f	\N	\N	png	image/png	3676780.png	skalad-market/8b633197-348c-4151-ad0a-78a12a761172	10801
9fa7e9b8-326c-43fd-b926-f81b0ced26da.png	\N	2026-08-03 12:20:39.733713	f	\N	\N	png	image/png	3676780.png	skalad-market/9fa7e9b8-326c-43fd-b926-f81b0ced26da	10801
c4db6a69-997e-49dc-afea-9bbfdb459f3f.png	\N	2026-08-03 12:22:20.488941	f	\N	\N	png	image/png	3676780.png	skalad-market/c4db6a69-997e-49dc-afea-9bbfdb459f3f	10801
ddc99798-37e4-4c2c-b832-4522895fff45.png	\N	2026-08-03 12:24:46.145468	f	\N	\N	png	image/png	3676780.png	skalad-market/ddc99798-37e4-4c2c-b832-4522895fff45	10801
bbc408ad-6652-4831-9bec-76ef1a6c0fc5.png	\N	2026-08-03 12:25:52.001047	f	\N	\N	png	image/png	3676780.png	skalad-market/bbc408ad-6652-4831-9bec-76ef1a6c0fc5	10801
ea542169-d69e-4874-ba36-e37d9f002fab.png	\N	2026-08-03 12:27:29.645717	f	\N	\N	png	image/png	3676780.png	skalad-market/ea542169-d69e-4874-ba36-e37d9f002fab	10801
7c4fb975-1eab-4f46-be15-04e3eb9ae799.png	\N	2026-08-03 12:29:21.070493	f	\N	\N	png	image/png	3676780.png	skalad-market/7c4fb975-1eab-4f46-be15-04e3eb9ae799	10801
c6665191-66d3-4c82-8749-6b353621b127.png	\N	2026-08-03 12:32:37.07949	f	\N	\N	png	image/png	3676780.png	skalad-market/c6665191-66d3-4c82-8749-6b353621b127	10801
c125739a-97a2-4fe8-8774-47578b50d9a2.png	\N	2026-08-03 12:37:53.940627	f	\N	\N	png	image/png	3676780.png	skalad-market/c125739a-97a2-4fe8-8774-47578b50d9a2	10801
166d67ee-32a7-4040-8eb5-6c1425736087.png	\N	2026-08-03 12:40:35.707418	f	\N	\N	png	image/png	enzyme.png	skalad-market/166d67ee-32a7-4040-8eb5-6c1425736087	22671
85728da6-4dad-404b-8498-e7f9a1a93c72.png	\N	2026-08-03 13:18:39.774259	f	\N	\N	png	image/png	3676780.png	skalad-market/85728da6-4dad-404b-8498-e7f9a1a93c72	10801
11563255-1464-44f0-9a2c-f426c32bdf21.png	\N	2026-08-03 13:20:10.037376	f	\N	\N	png	image/png	3676780.png	skalad-market/11563255-1464-44f0-9a2c-f426c32bdf21	10801
7152bfa4-8061-464c-a6b4-54596183006b.png	\N	2026-08-03 13:21:33.808682	f	\N	\N	png	image/png	3676780.png	skalad-market/7152bfa4-8061-464c-a6b4-54596183006b	10801
edbc04ac-d64c-4af6-96e2-96c08a318857.png	\N	2026-08-03 13:23:21.192325	f	\N	\N	png	image/png	3676780.png	skalad-market/edbc04ac-d64c-4af6-96e2-96c08a318857	10801
cd520a5b-3fb1-462b-8db8-1c03bba40f12.png	\N	2026-08-03 13:25:25.304552	f	\N	\N	png	image/png	3676780.png	skalad-market/cd520a5b-3fb1-462b-8db8-1c03bba40f12	10801
7d386a15-d216-4275-9edc-ead24ff40063.png	\N	2026-08-03 13:28:52.084854	f	\N	\N	png	image/png	3676780.png	skalad-market/7d386a15-d216-4275-9edc-ead24ff40063	10801
ac939ffb-b826-4dcc-8c95-b3001cc2f464.png	\N	2026-08-03 13:29:59.147098	f	\N	\N	png	image/png	3676780.png	skalad-market/ac939ffb-b826-4dcc-8c95-b3001cc2f464	10801
1ab1a0d8-a276-4387-aa7c-b0fa918def44.png	\N	2026-08-03 13:31:00.707379	f	\N	\N	png	image/png	3676780.png	skalad-market/1ab1a0d8-a276-4387-aa7c-b0fa918def44	10801
19a1184b-8ef5-46de-8421-2e8b46fde507.png	\N	2026-08-03 13:33:59.595557	f	\N	\N	png	image/png	3676780.png	skalad-market/19a1184b-8ef5-46de-8421-2e8b46fde507	10801
812870bb-8e77-493c-b1f5-1035f2a67566.png	\N	2026-08-03 13:35:21.305178	f	\N	\N	png	image/png	3676780.png	skalad-market/812870bb-8e77-493c-b1f5-1035f2a67566	10801
973714f9-8b32-4a13-8dd6-9de267f699e2.png	\N	2026-08-03 13:38:06.85077	f	\N	\N	png	image/png	3676780.png	skalad-market/973714f9-8b32-4a13-8dd6-9de267f699e2	10801
417d9547-63ff-493b-8b8d-e02749726833.png	\N	2026-08-03 13:39:03.056119	f	\N	\N	png	image/png	3676780.png	skalad-market/417d9547-63ff-493b-8b8d-e02749726833	10801
256c080a-0995-4f20-9802-60d446f1e2e3.png	\N	2026-08-03 13:40:17.953213	f	\N	\N	png	image/png	3676780.png	skalad-market/256c080a-0995-4f20-9802-60d446f1e2e3	10801
c9d5f393-cd0b-48b0-8d79-152700c3cade.png	\N	2026-08-03 13:41:26.148847	f	\N	\N	png	image/png	3676780.png	skalad-market/c9d5f393-cd0b-48b0-8d79-152700c3cade	10801
ee392718-0e08-4173-97a4-dddc13507cef.png	\N	2026-08-03 13:42:35.827671	f	\N	\N	png	image/png	3676780.png	skalad-market/ee392718-0e08-4173-97a4-dddc13507cef	10801
609889fa-789e-40f0-aa30-120eba50fce7.png	\N	2026-08-03 13:50:08.009953	f	\N	\N	png	image/png	3676780.png	skalad-market/609889fa-789e-40f0-aa30-120eba50fce7	10801
83635647-89de-40d6-b324-5ac179e74d6e.png	\N	2026-08-03 13:51:40.589961	f	\N	\N	png	image/png	3676780.png	skalad-market/83635647-89de-40d6-b324-5ac179e74d6e	10801
67e1fb30-a983-41c1-be45-08550ba5796c.png	\N	2026-08-03 13:52:46.035508	f	\N	\N	png	image/png	3676780.png	skalad-market/67e1fb30-a983-41c1-be45-08550ba5796c	10801
896b9bba-66de-48ef-8e51-2aec15a0b695.png	\N	2026-08-03 13:53:52.131677	f	\N	\N	png	image/png	3676780.png	skalad-market/896b9bba-66de-48ef-8e51-2aec15a0b695	10801
817e000e-c97b-4c20-b1cb-2bdda0d3b48b.png	\N	2026-08-03 13:54:45.378259	f	\N	\N	png	image/png	3676780.png	skalad-market/817e000e-c97b-4c20-b1cb-2bdda0d3b48b	10801
db967ee4-f764-4293-ba04-0746721e8858.png	\N	2026-08-03 13:55:52.881468	f	\N	\N	png	image/png	3676780.png	skalad-market/db967ee4-f764-4293-ba04-0746721e8858	10801
ef45603d-939d-4f10-9801-e9206d034aa7.png	\N	2026-08-03 13:56:54.780568	f	\N	\N	png	image/png	3676780.png	skalad-market/ef45603d-939d-4f10-9801-e9206d034aa7	10801
d9ad09bb-e875-4151-9cad-35ac625bc64a.png	\N	2026-08-03 13:57:53.447195	f	\N	\N	png	image/png	3676780.png	skalad-market/d9ad09bb-e875-4151-9cad-35ac625bc64a	10801
054c81f4-1eed-492e-96bd-5deee1cc8cf4.png	\N	2026-08-03 13:59:31.356201	f	\N	\N	png	image/png	3676780.png	skalad-market/054c81f4-1eed-492e-96bd-5deee1cc8cf4	10801
f4b81c43-c446-49c0-961d-4d9d2de78441.png	\N	2026-08-03 14:01:29.422298	f	\N	\N	png	image/png	3676780.png	skalad-market/f4b81c43-c446-49c0-961d-4d9d2de78441	10801
3ebaa75d-281f-4800-b631-f29fa57bf25c.png	\N	2026-08-03 14:03:09.900637	f	\N	\N	png	image/png	3676780.png	skalad-market/3ebaa75d-281f-4800-b631-f29fa57bf25c	10801
b5b1548e-32bf-4df6-9cdf-6466fb89b122.png	\N	2026-08-03 14:05:08.010067	f	\N	\N	png	image/png	3676780.png	skalad-market/b5b1548e-32bf-4df6-9cdf-6466fb89b122	10801
b83cd7fe-2ced-455d-b51a-84b9983ca28d.png	\N	2026-08-03 14:06:12.937966	f	\N	\N	png	image/png	3676780.png	skalad-market/b83cd7fe-2ced-455d-b51a-84b9983ca28d	10801
8b4aa3cf-d322-4ec9-9854-752da8dd3f12.png	\N	2026-08-03 14:22:14.21167	f	\N	\N	png	image/png	3676780.png	skalad-market/8b4aa3cf-d322-4ec9-9854-752da8dd3f12	10801
d12aaa84-3889-426b-8bb0-a4ba0384459b.png	\N	2026-08-03 14:23:16.363512	f	\N	\N	png	image/png	3676780.png	skalad-market/d12aaa84-3889-426b-8bb0-a4ba0384459b	10801
8fcb05a9-f1ce-4714-b3be-88459b3d89e2.png	\N	2026-08-03 14:24:14.965689	f	\N	\N	png	image/png	3676780.png	skalad-market/8fcb05a9-f1ce-4714-b3be-88459b3d89e2	10801
e14bb3f4-aad1-45b5-9171-90fc68a7d0ec.png	\N	2026-08-03 14:25:11.619491	f	\N	\N	png	image/png	3676780.png	skalad-market/e14bb3f4-aad1-45b5-9171-90fc68a7d0ec	10801
51ac5210-84fb-4a3c-830c-2892c58ecb21.png	\N	2026-08-03 17:34:35.636623	f	\N	\N	png	image/png	3676780.png	skalad-market/51ac5210-84fb-4a3c-830c-2892c58ecb21	10801
f07a1004-1d2f-4684-add5-6f3887026ad5.png	\N	2026-08-03 17:36:15.764652	f	\N	\N	png	image/png	3676780.png	skalad-market/f07a1004-1d2f-4684-add5-6f3887026ad5	10801
179c5f33-bd64-4202-b3e0-5527e6b4a51f.png	\N	2026-08-03 17:37:25.563974	f	\N	\N	png	image/png	3676780.png	skalad-market/179c5f33-bd64-4202-b3e0-5527e6b4a51f	10801
f3be74e0-9bbb-458d-958b-b46014ce2e40.png	\N	2026-08-03 17:39:28.033033	f	\N	\N	png	image/png	3676780.png	skalad-market/f3be74e0-9bbb-458d-958b-b46014ce2e40	10801
94dcb8d0-93e3-496f-8e38-5321463f82ce.png	\N	2026-08-03 17:43:30.91471	f	\N	\N	png	image/png	3676780.png	skalad-market/94dcb8d0-93e3-496f-8e38-5321463f82ce	10801
41ae19a3-7066-4b0c-bfce-dc9cf938cb5d.png	\N	2026-08-03 17:44:47.922308	f	\N	\N	png	image/png	3676780.png	skalad-market/41ae19a3-7066-4b0c-bfce-dc9cf938cb5d	10801
44a59514-d6dc-4ed4-92ba-97b58cee7c8d.png	\N	2026-08-03 17:47:01.38232	f	\N	\N	png	image/png	3676780.png	skalad-market/44a59514-d6dc-4ed4-92ba-97b58cee7c8d	10801
5e94739b-58cd-461d-b067-1f82117b24f9.png	\N	2026-08-03 18:06:05.322604	f	\N	\N	png	image/png	3676780.png	skalad-market/5e94739b-58cd-461d-b067-1f82117b24f9	10801
cfbb1d2f-045c-4f3a-8048-010909517369.png	\N	2026-08-03 18:07:58.535656	f	\N	\N	png	image/png	3676780.png	skalad-market/cfbb1d2f-045c-4f3a-8048-010909517369	10801
a12d0236-077c-4e22-ae72-2c8ee8d9657c.png	\N	2026-08-03 18:11:55.349848	f	\N	\N	png	image/png	3676780.png	skalad-market/a12d0236-077c-4e22-ae72-2c8ee8d9657c	10801
8c35e43e-4f45-4fdf-bda1-a9b44567c8c1.png	\N	2026-08-03 18:13:44.751733	f	\N	\N	png	image/png	3676780.png	skalad-market/8c35e43e-4f45-4fdf-bda1-a9b44567c8c1	10801
e819803f-bced-40e9-9814-e62eb59dfe57.png	\N	2026-08-03 18:15:11.721405	f	\N	\N	png	image/png	3676780.png	skalad-market/e819803f-bced-40e9-9814-e62eb59dfe57	10801
51c213f2-2316-424a-9370-f087dbadbf59.png	\N	2026-08-03 18:16:54.977474	f	\N	\N	png	image/png	3676780.png	skalad-market/51c213f2-2316-424a-9370-f087dbadbf59	10801
30e05f58-c706-4a51-8622-b92f1628351a.png	\N	2026-08-03 18:18:01.895012	f	\N	\N	png	image/png	3676780.png	skalad-market/30e05f58-c706-4a51-8622-b92f1628351a	10801
e8a68e8f-782a-4abc-b13a-077928078c22.png	\N	2026-08-03 18:22:13.783963	f	\N	\N	png	image/png	3676780.png	skalad-market/e8a68e8f-782a-4abc-b13a-077928078c22	10801
5da38f5f-df44-4e73-b549-8137bbf5229e.png	\N	2026-08-03 18:25:03.360683	f	\N	\N	png	image/png	3676780.png	skalad-market/5da38f5f-df44-4e73-b549-8137bbf5229e	10801
ca43dcfc-c876-4117-a5a5-a23ad6ba0f8f.png	\N	2026-08-03 18:26:24.302379	f	\N	\N	png	image/png	3676780.png	skalad-market/ca43dcfc-c876-4117-a5a5-a23ad6ba0f8f	10801
6b536792-c535-4c2b-86f7-b3361f235a58.png	\N	2026-08-03 18:27:26.138507	f	\N	\N	png	image/png	3676780.png	skalad-market/6b536792-c535-4c2b-86f7-b3361f235a58	10801
ade7ff4a-ae6d-4dfd-b177-f8a9e0be068c.png	\N	2026-08-03 18:29:00.43184	f	\N	\N	png	image/png	3676780.png	skalad-market/ade7ff4a-ae6d-4dfd-b177-f8a9e0be068c	10801
bddcee47-a834-44e9-b495-7dddced26b56.png	\N	2026-08-03 18:30:29.984572	f	\N	\N	png	image/png	3676780.png	skalad-market/bddcee47-a834-44e9-b495-7dddced26b56	10801
5f254c9b-8bc0-49b4-99c5-aa2b00e38f9c.png	\N	2026-08-03 18:31:56.254386	f	\N	\N	png	image/png	3676780.png	skalad-market/5f254c9b-8bc0-49b4-99c5-aa2b00e38f9c	10801
5cc80734-6cc5-4c10-82dc-321bdea77892.png	\N	2026-08-03 18:33:33.741613	f	\N	\N	png	image/png	3676780.png	skalad-market/5cc80734-6cc5-4c10-82dc-321bdea77892	10801
263428aa-300f-4ce8-ba73-9664ad523840.png	\N	2026-08-03 18:34:49.348577	f	\N	\N	png	image/png	3676780.png	skalad-market/263428aa-300f-4ce8-ba73-9664ad523840	10801
fc13c7c4-1a72-42de-be92-3c40051a63df.png	\N	2026-08-03 18:36:16.848541	f	\N	\N	png	image/png	3676780.png	skalad-market/fc13c7c4-1a72-42de-be92-3c40051a63df	10801
90014b7c-1aa0-4e8f-a537-5207fb020554.png	\N	2026-08-03 18:39:54.010867	f	\N	\N	png	image/png	3676780.png	skalad-market/90014b7c-1aa0-4e8f-a537-5207fb020554	10801
b92c6669-63d1-4909-9f0f-fed6df99751e.png	\N	2026-08-03 18:41:21.876334	f	\N	\N	png	image/png	3676780.png	skalad-market/b92c6669-63d1-4909-9f0f-fed6df99751e	10801
29725559-5fd6-4461-aa74-79e1f2048dd9.png	\N	2026-08-03 18:51:44.431753	f	\N	\N	png	image/png	3676780.png	skalad-market/29725559-5fd6-4461-aa74-79e1f2048dd9	10801
34e755d9-a11f-424d-8330-83dc2fe89d7c.png	\N	2026-08-03 18:55:04.612082	f	\N	\N	png	image/png	3676780.png	skalad-market/34e755d9-a11f-424d-8330-83dc2fe89d7c	10801
8ec9ea74-be97-4d2d-bec1-0b0c41ce6769.png	\N	2026-08-03 19:04:25.315391	f	\N	\N	png	image/png	sofa.png	skalad-market/8ec9ea74-be97-4d2d-bec1-0b0c41ce6769	6052
f1ecf2cc-5c07-44c2-9498-04b11409721e.jpg	\N	2026-08-03 21:45:45.003265	f	\N	\N	jpg	image/jpeg	278.jpg	skalad-market/f1ecf2cc-5c07-44c2-9498-04b11409721e	14720
6687c46f-490c-4a30-98d9-8346a2248e75.jpg	\N	2026-08-03 21:47:51.873457	f	\N	\N	jpg	image/jpeg	278.jpg	skalad-market/6687c46f-490c-4a30-98d9-8346a2248e75	14720
f39aca92-2dc2-4b22-a92d-dde3006bebed.jpg	\N	2026-08-03 21:50:39.088671	f	\N	\N	jpg	image/jpeg	278.jpg	skalad-market/f39aca92-2dc2-4b22-a92d-dde3006bebed	14720
b3649f7a-d68d-4ce3-8f87-691d97e5cc35.jpg	\N	2026-08-03 21:52:22.859578	f	\N	\N	jpg	image/jpeg	278.jpg	skalad-market/b3649f7a-d68d-4ce3-8f87-691d97e5cc35	14720
e2dd1f4e-e0b6-4566-9895-299fbe7488fd.jpg	\N	2026-08-03 21:53:59.491555	f	\N	\N	jpg	image/jpeg	278.jpg	skalad-market/e2dd1f4e-e0b6-4566-9895-299fbe7488fd	14720
86b7fcb6-83d0-402f-8e10-6c30df39b792.png	\N	2026-08-03 22:51:52.834409	f	\N	\N	png	image/png	3676780.png	skalad-market/86b7fcb6-83d0-402f-8e10-6c30df39b792	10801
171daed0-71e1-419e-8cdb-9f218126dee9.png	\N	2026-08-03 22:53:14.880019	f	\N	\N	png	image/png	3676780.png	skalad-market/171daed0-71e1-419e-8cdb-9f218126dee9	10801
94705a10-d8da-4b64-9581-208f484678c0.png	\N	2026-08-03 22:54:49.611376	f	\N	\N	png	image/png	3676780.png	skalad-market/94705a10-d8da-4b64-9581-208f484678c0	10801
3c6ec3dd-526f-42ad-a4b3-d3d22b20947d.png	\N	2026-08-03 22:56:16.246729	f	\N	\N	png	image/png	3676780.png	skalad-market/3c6ec3dd-526f-42ad-a4b3-d3d22b20947d	10801
29ede447-7e87-44fa-bb80-f1cdbaff0ac5.png	\N	2026-08-03 22:58:04.124044	f	\N	\N	png	image/png	3676780.png	skalad-market/29ede447-7e87-44fa-bb80-f1cdbaff0ac5	10801
59d61c89-9d08-4c95-95cb-8c1b5dc179e4.png	\N	2026-08-03 22:59:30.136941	f	\N	\N	png	image/png	3676780.png	skalad-market/59d61c89-9d08-4c95-95cb-8c1b5dc179e4	10801
2531f0c6-f53a-4206-8827-db912a7a4ca5.png	\N	2026-08-03 23:01:16.372596	f	\N	\N	png	image/png	3676780.png	skalad-market/2531f0c6-f53a-4206-8827-db912a7a4ca5	10801
ff97e22b-67a4-45e7-8d95-bbde5cf3da69.png	\N	2026-08-03 23:02:54.707184	f	\N	\N	png	image/png	3676780.png	skalad-market/ff97e22b-67a4-45e7-8d95-bbde5cf3da69	10801
c43ab4ab-f95b-4f70-a5ac-3562f7d3036b.png	\N	2026-08-03 23:06:09.856722	f	\N	\N	png	image/png	3676780.png	skalad-market/c43ab4ab-f95b-4f70-a5ac-3562f7d3036b	10801
d9568b85-5eb4-49f1-9a79-0fe8ddf05a99.png	\N	2026-08-03 23:09:47.799809	f	\N	\N	png	image/png	3676780.png	skalad-market/d9568b85-5eb4-49f1-9a79-0fe8ddf05a99	10801
663aef31-4841-466f-ac04-62e7827477ed.png	\N	2026-08-03 23:11:18.67647	f	\N	\N	png	image/png	3676780.png	skalad-market/663aef31-4841-466f-ac04-62e7827477ed	10801
4456035d-001c-4eac-8ad6-801343ed9336.png	\N	2026-08-03 23:20:35.435931	f	\N	\N	png	image/png	3676780.png	skalad-market/4456035d-001c-4eac-8ad6-801343ed9336	10801
eebbbdb3-c90f-464f-8f50-c51348f35a99.png	\N	2026-08-03 23:22:10.623679	f	\N	\N	png	image/png	3676780.png	skalad-market/eebbbdb3-c90f-464f-8f50-c51348f35a99	10801
a79ff32c-fa7b-438c-956a-0fd253a19d71.png	\N	2026-08-03 23:24:40.671183	f	\N	\N	png	image/png	3676780.png	skalad-market/a79ff32c-fa7b-438c-956a-0fd253a19d71	10801
bebe096e-bca6-4b6b-8531-994cdeefa30c.png	\N	2026-08-03 23:26:07.123415	f	\N	\N	png	image/png	3676780.png	skalad-market/bebe096e-bca6-4b6b-8531-994cdeefa30c	10801
d896e382-7e95-4d56-bc5d-858e3e2b2130.png	\N	2026-08-03 23:27:10.582255	f	\N	\N	png	image/png	3676780.png	skalad-market/d896e382-7e95-4d56-bc5d-858e3e2b2130	10801
ca7a4601-3e82-4a84-9b97-97412a440461.png	\N	2026-08-03 23:29:59.966144	f	\N	\N	png	image/png	3676780.png	skalad-market/ca7a4601-3e82-4a84-9b97-97412a440461	10801
c1371ad9-d70c-470b-bf79-d44577104aed.png	\N	2026-08-03 23:31:43.762576	f	\N	\N	png	image/png	3676780.png	skalad-market/c1371ad9-d70c-470b-bf79-d44577104aed	10801
b073cf5b-eeb8-4c38-b8db-3f8b45661474.png	\N	2026-08-04 10:42:04.370129	f	\N	\N	png	image/png	3676780.png	skalad-market/b073cf5b-eeb8-4c38-b8db-3f8b45661474	10801
0776bfd4-2be2-46eb-9387-7f40babce611.png	\N	2026-08-04 10:44:48.782942	f	\N	\N	png	image/png	3676780.png	skalad-market/0776bfd4-2be2-46eb-9387-7f40babce611	10801
4decac9a-3fe7-4efc-a009-14bafb1460cf.png	\N	2026-08-04 10:46:37.947138	f	\N	\N	png	image/png	3676780.png	skalad-market/4decac9a-3fe7-4efc-a009-14bafb1460cf	10801
3f23bc82-27c1-44e6-a199-cf8617ad8d93.png	\N	2026-08-04 12:05:30.68713	f	\N	\N	png	image/png	3676780.png	skalad-market/3f23bc82-27c1-44e6-a199-cf8617ad8d93	10801
c9ef6cbe-3029-4f24-af12-c8aabfcb5d02.png	\N	2026-08-04 12:06:57.860523	f	\N	\N	png	image/png	3676780.png	skalad-market/c9ef6cbe-3029-4f24-af12-c8aabfcb5d02	10801
f5a50bf6-bbeb-44d8-9f78-c6323b7290b0.png	\N	2026-08-04 12:08:34.385209	f	\N	\N	png	image/png	3676780.png	skalad-market/f5a50bf6-bbeb-44d8-9f78-c6323b7290b0	10801
f0736d2c-bab4-4387-891b-c1867e7670cc.png	\N	2026-08-04 12:10:20.069075	f	\N	\N	png	image/png	3676780.png	skalad-market/f0736d2c-bab4-4387-891b-c1867e7670cc	10801
e44583e7-96f3-41cc-b1b4-ed4a7500cb81.png	\N	2026-08-04 12:11:41.6446	f	\N	\N	png	image/png	3676780.png	skalad-market/e44583e7-96f3-41cc-b1b4-ed4a7500cb81	10801
1f888633-3dd0-4299-88bd-c966cee943ef.png	\N	2026-08-04 12:12:24.619483	f	\N	\N	png	image/png	3676780.png	skalad-market/1f888633-3dd0-4299-88bd-c966cee943ef	10801
9b8c43c9-f511-4c22-8e0e-3f3c3837ec99.png	\N	2026-08-04 12:14:34.87977	f	\N	\N	png	image/png	3676780.png	skalad-market/9b8c43c9-f511-4c22-8e0e-3f3c3837ec99	10801
02bbf1df-9e42-4eaa-9a7b-499c0d062fdb.png	\N	2026-08-04 12:15:39.879322	f	\N	\N	png	image/png	3676780.png	skalad-market/02bbf1df-9e42-4eaa-9a7b-499c0d062fdb	10801
f8a4b8fd-c735-4512-b280-851452a88d63.png	\N	2026-08-04 12:17:43.103258	f	\N	\N	png	image/png	3676780.png	skalad-market/f8a4b8fd-c735-4512-b280-851452a88d63	10801
c9d65480-2c08-47d1-a8b0-33b43c30ee4c.png	\N	2026-08-04 12:19:22.412118	f	\N	\N	png	image/png	3676780.png	skalad-market/c9d65480-2c08-47d1-a8b0-33b43c30ee4c	10801
6e1f4154-2a2c-4256-bacf-a540273dcd3d.png	\N	2026-08-04 12:22:01.236054	f	\N	\N	png	image/png	3676780.png	skalad-market/6e1f4154-2a2c-4256-bacf-a540273dcd3d	10801
7a3f0539-2b8b-471e-99ca-3b1257bdd662.png	\N	2026-08-04 12:35:54.451958	f	\N	\N	png	image/png	3676780.png	skalad-market/7a3f0539-2b8b-471e-99ca-3b1257bdd662	10801
049030e5-832c-4779-9367-54fc75383587.png	\N	2026-08-04 12:36:46.63895	f	\N	\N	png	image/png	3676780.png	skalad-market/049030e5-832c-4779-9367-54fc75383587	10801
7c6f81c0-c7be-4c4f-838d-a82ba95cd819.png	\N	2026-08-04 12:38:21.019238	f	\N	\N	png	image/png	3676780.png	skalad-market/7c6f81c0-c7be-4c4f-838d-a82ba95cd819	10801
34c19cb5-0bf8-4f66-b9e0-ff9f97c366f3.png	\N	2026-08-04 12:39:39.403172	f	\N	\N	png	image/png	3676780.png	skalad-market/34c19cb5-0bf8-4f66-b9e0-ff9f97c366f3	10801
d8941b6b-a2a8-4c35-96c6-0a39af81cf15.png	\N	2026-08-04 12:40:53.60531	f	\N	\N	png	image/png	3676780.png	skalad-market/d8941b6b-a2a8-4c35-96c6-0a39af81cf15	10801
befe490a-b9c0-4d3c-8a3b-90f53f512162.png	\N	2026-08-04 12:44:52.623695	f	\N	\N	png	image/png	3676780.png	skalad-market/befe490a-b9c0-4d3c-8a3b-90f53f512162	10801
a1d3bfcd-b36c-45fa-a8bb-8134208aae50.png	\N	2026-08-04 12:45:49.751284	f	\N	\N	png	image/png	3676780.png	skalad-market/a1d3bfcd-b36c-45fa-a8bb-8134208aae50	10801
9252f435-0f01-4420-bacd-89aa5f098315.png	\N	2026-08-04 12:46:45.691868	f	\N	\N	png	image/png	3676780.png	skalad-market/9252f435-0f01-4420-bacd-89aa5f098315	10801
00bac6ec-1697-4920-b17c-437d6b4cddc1.png	\N	2026-08-04 12:47:35.528551	f	\N	\N	png	image/png	3676780.png	skalad-market/00bac6ec-1697-4920-b17c-437d6b4cddc1	10801
c92717d9-bea5-4aeb-957f-ea37753bae0c.png	\N	2026-08-04 12:49:08.559611	f	\N	\N	png	image/png	3676780.png	skalad-market/c92717d9-bea5-4aeb-957f-ea37753bae0c	10801
27a55487-fe71-4d37-8c3e-332b145bc946.png	\N	2026-08-04 12:50:29.212056	f	\N	\N	png	image/png	3676780.png	skalad-market/27a55487-fe71-4d37-8c3e-332b145bc946	10801
ac158a5d-fb8a-4f69-93f0-389429f2e1b6.png	\N	2026-08-04 12:51:19.498928	f	\N	\N	png	image/png	3676780.png	skalad-market/ac158a5d-fb8a-4f69-93f0-389429f2e1b6	10801
1cf5362a-891f-4cd0-a959-22247a64469c.png	\N	2026-08-04 12:52:09.207372	f	\N	\N	png	image/png	3676780.png	skalad-market/1cf5362a-891f-4cd0-a959-22247a64469c	10801
7ca1654d-9091-48ec-bb69-72b6dd41a0f7.png	\N	2026-08-04 14:31:12.972676	f	\N	\N	png	image/png	3676780.png	skalad-market/7ca1654d-9091-48ec-bb69-72b6dd41a0f7	10801
c1c7fca0-1a22-47cd-a0f8-3bac5845e459.png	\N	2026-08-04 14:32:07.647727	f	\N	\N	png	image/png	3676780.png	skalad-market/c1c7fca0-1a22-47cd-a0f8-3bac5845e459	10801
546e9f93-75d4-434a-a319-063aa9415c25.png	\N	2026-08-04 14:33:05.412445	f	\N	\N	png	image/png	3676780.png	skalad-market/546e9f93-75d4-434a-a319-063aa9415c25	10801
b51b313d-3832-4192-8b1f-36ef387ad8a2.png	\N	2026-08-04 14:34:09.480488	f	\N	\N	png	image/png	3676780.png	skalad-market/b51b313d-3832-4192-8b1f-36ef387ad8a2	10801
59e877e1-20d8-48ae-8ce0-733aac1acc30.png	\N	2026-08-04 14:35:49.610783	f	\N	\N	png	image/png	3676780.png	skalad-market/59e877e1-20d8-48ae-8ce0-733aac1acc30	10801
6673c64c-8044-40b1-8859-39bffc09fa90.png	\N	2026-08-04 14:36:29.945191	f	\N	\N	png	image/png	3676780.png	skalad-market/6673c64c-8044-40b1-8859-39bffc09fa90	10801
0d26f58a-65a7-4d41-bed8-01f7c54fcdbb.png	\N	2026-08-04 14:37:54.322789	f	\N	\N	png	image/png	3676780.png	skalad-market/0d26f58a-65a7-4d41-bed8-01f7c54fcdbb	10801
9e7ad1dd-67db-499b-86d5-e2703cf5562a.png	\N	2026-08-04 14:38:57.982811	f	\N	\N	png	image/png	3676780.png	skalad-market/9e7ad1dd-67db-499b-86d5-e2703cf5562a	10801
0fe67048-3d27-4a28-be07-c16497f94558.png	\N	2026-08-04 14:39:58.535699	f	\N	\N	png	image/png	3676780.png	skalad-market/0fe67048-3d27-4a28-be07-c16497f94558	10801
af2914b6-1c94-4aec-b44a-5d09c18bbf6a.png	\N	2026-08-04 14:41:01.435494	f	\N	\N	png	image/png	3676780.png	skalad-market/af2914b6-1c94-4aec-b44a-5d09c18bbf6a	10801
c102316c-0827-4289-bdeb-914744cb7220.png	\N	2026-08-04 14:42:08.502663	f	\N	\N	png	image/png	3676780.png	skalad-market/c102316c-0827-4289-bdeb-914744cb7220	10801
168d1058-ae1d-40d6-90e5-b880036b07f3.png	\N	2026-08-04 14:42:48.719107	f	\N	\N	png	image/png	3676780.png	skalad-market/168d1058-ae1d-40d6-90e5-b880036b07f3	10801
8dbffb3e-4086-4540-81c8-25d47d5da382.png	\N	2026-08-04 14:43:40.529547	f	\N	\N	png	image/png	3676780.png	skalad-market/8dbffb3e-4086-4540-81c8-25d47d5da382	10801
89d62aa3-094f-4e22-8ab8-a4783c6d812c.jpeg	\N	2026-08-17 15:50:12.921664	f	\N	\N	jpeg	image/jpeg	image.jpeg	skalad-market/89d62aa3-094f-4e22-8ab8-a4783c6d812c	88424
e005232e-a8ee-4149-b421-12c21b5edc28.jpg	\N	2026-08-17 17:02:00.399553	f	\N	\N	jpg	image/jpeg	METAL_SYSTEM_building_materials_small.jpg	skalad-market/e005232e-a8ee-4149-b421-12c21b5edc28	126811
81045759-b41a-4786-8d94-456d576d6562.jpeg	\N	2026-08-17 17:15:35.269202	f	\N	\N	jpeg	image/jpeg	photo_2026-08-17 17.14.03.jpeg	skalad-market/81045759-b41a-4786-8d94-456d576d6562	231615
1210652a-ef0a-4d2d-9f01-35d7d2356758.jpg	\N	2026-08-17 17:23:31.397807	f	\N	\N	jpg	image/jpeg	STEEL-GROUP_banner_small.jpg	skalad-market/1210652a-ef0a-4d2d-9f01-35d7d2356758	120141
96c8f22b-6a2a-41a3-86e8-0b49ebb83482.jpg	\N	2026-08-17 17:43:50.78525	f	\N	\N	jpg	image/jpeg	METAL-INVEST-GROUP_banner_small.jpg	skalad-market/96c8f22b-6a2a-41a3-86e8-0b49ebb83482	153733
\.


--
-- Name: attach attach_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.attach
    ADD CONSTRAINT attach_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 1zdFPpW6f8FGXiKLOBAIEoWN5jCDejPiVhUFk2JT1JucDEClE7r4wVrc4VeA8Ob

--
-- Database "skalad_market_lead" dump
--

--
-- PostgreSQL database dump
--

\restrict 1kMIW5t3fyafTtRcOcG9E14D9jLnIzSnAYzjDPvbGTyp9H8nQKdrWh2aES9LOzy

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_lead; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_lead WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_lead OWNER TO sklad_user;

\unrestrict 1kMIW5t3fyafTtRcOcG9E14D9jLnIzSnAYzjDPvbGTyp9H8nQKdrWh2aES9LOzy
\connect skalad_market_lead
\restrict 1kMIW5t3fyafTtRcOcG9E14D9jLnIzSnAYzjDPvbGTyp9H8nQKdrWh2aES9LOzy

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: cart_item; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.cart_item (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    buyer_id bigint,
    company_id bigint,
    company_logo_path_snapshot character varying(255),
    company_name_snapshot character varying(255),
    company_slug_snapshot character varying(255),
    currency_snapshot smallint,
    price_snapshot numeric(38,2),
    primary_image_snapshot character varying(255),
    product_id bigint,
    product_name_snapshot character varying(255),
    product_slug_snapshot character varying(255),
    quantity integer,
    seller_id bigint,
    CONSTRAINT cart_item_currency_snapshot_check CHECK (((currency_snapshot >= 0) AND (currency_snapshot <= 1)))
);


ALTER TABLE public.cart_item OWNER TO sklad_user;

--
-- Name: cart_item_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.cart_item ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cart_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lead; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.lead (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    buyer_id bigint,
    close_reason character varying(255),
    comment character varying(255),
    company_id bigint,
    contact_email character varying(255),
    contact_name character varying(255),
    contact_phone character varying(255),
    delivery_address character varying(255),
    needed_date date,
    seller_id bigint,
    source character varying(255),
    status character varying(255),
    CONSTRAINT lead_source_check CHECK (((source)::text = ANY ((ARRAY['PRODUCT'::character varying, 'CART'::character varying])::text[]))),
    CONSTRAINT lead_status_check CHECK (((status)::text = ANY ((ARRAY['NEW'::character varying, 'VIEWED'::character varying, 'CONTACTED'::character varying, 'CLOSED'::character varying, 'CANCELED'::character varying])::text[])))
);


ALTER TABLE public.lead OWNER TO sklad_user;

--
-- Name: lead_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.lead ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lead_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lead_item; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.lead_item (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    lead_id bigint,
    price_snapshot numeric(38,2),
    product_id bigint,
    product_name_snapshot character varying(255),
    quantity integer
);


ALTER TABLE public.lead_item OWNER TO sklad_user;

--
-- Name: lead_item_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.lead_item ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lead_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.cart_item (id, created_by, created_date, deleted, modified_by, modified_date, buyer_id, company_id, company_logo_path_snapshot, company_name_snapshot, company_slug_snapshot, currency_snapshot, price_snapshot, primary_image_snapshot, product_id, product_name_snapshot, product_slug_snapshot, quantity, seller_id) FROM stdin;
14	\N	2026-07-19 21:08:29.997797	t	\N	2026-07-19 21:09:15.248715	7	2	\N	Tayanch Build Supply	tayanch-build-supply	0	50000.00	https://media.skladmarket.uz/skalad-market/b0b8d002-4df3-4c91-bf9a-ac93656fdf64	2	Quvur	quvur	1	3
4	\N	2026-07-18 22:15:45.235106	t	\N	2026-07-18 22:22:08.55661	4	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	1	3
3	\N	2026-07-18 22:15:41.15592	t	\N	2026-07-18 22:22:09.250739	4	2	\N	Tayanch Build Supply	tayanch-build-supply	0	50000.00	https://media.skladmarket.uz/skalad-market/b0b8d002-4df3-4c91-bf9a-ac93656fdf64	2	Quvur	quvur	1	3
5	\N	2026-07-19 02:03:42.592482	t	\N	2026-07-19 02:04:49.839004	8	2	\N	Tayanch Build Supply	tayanch-build-supply	0	50000.00	https://media.skladmarket.uz/skalad-market/b0b8d002-4df3-4c91-bf9a-ac93656fdf64	2	Quvur	quvur	1	3
6	\N	2026-07-19 08:22:06.699866	t	\N	2026-07-19 08:23:09.091341	5	2	\N	Tayanch Build Supply	tayanch-build-supply	0	50000.00	https://media.skladmarket.uz/skalad-market/b0b8d002-4df3-4c91-bf9a-ac93656fdf64	2	Quvur	quvur	1	3
7	\N	2026-07-19 15:58:05.177687	t	\N	2026-07-19 15:58:30.153383	3	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	1	3
8	\N	2026-07-19 16:00:46.92152	t	\N	2026-07-19 16:01:04.06545	5	2	\N	Tayanch Build Supply	tayanch-build-supply	0	50000.00	https://media.skladmarket.uz/skalad-market/b0b8d002-4df3-4c91-bf9a-ac93656fdf64	2	Quvur	quvur	1	3
9	\N	2026-07-19 17:08:47.53844	t	\N	2026-07-19 17:09:20.635032	8	2	\N	Tayanch Build Supply	tayanch-build-supply	0	50000.00	https://media.skladmarket.uz/skalad-market/b0b8d002-4df3-4c91-bf9a-ac93656fdf64	2	Quvur	quvur	1	3
10	\N	2026-07-19 18:54:35.608881	t	\N	2026-07-19 18:56:29.094821	12	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	1	3
12	\N	2026-07-19 20:47:16.373517	t	\N	2026-07-19 20:47:30.565929	8	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	1	3
11	\N	2026-07-19 20:46:34.781138	t	\N	2026-07-19 20:49:33.561771	12	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	1	3
1	\N	2026-07-18 13:49:06.771106	t	\N	2026-07-18 20:16:46.237564	3	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	1	3
2	\N	2026-07-18 22:15:29.650654	t	\N	2026-07-18 22:15:37.769603	4	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	1	3
15	\N	2026-07-20 08:13:01.026006	t	\N	2026-07-20 08:13:08.661335	7	2	\N	Tayanch Build Supply	tayanch-build-supply	0	50000.00	https://media.skladmarket.uz/skalad-market/b0b8d002-4df3-4c91-bf9a-ac93656fdf64	2	Quvur	quvur	1	3
13	\N	2026-07-19 20:57:20.83626	t	\N	2026-07-19 20:57:36.89196	12	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	1	3
16	\N	2026-07-21 14:49:33.600238	t	\N	2026-07-22 08:56:49.361538	7	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	OOO METAL SYSTEM	ooo-metal-system	0	100000.00	https://media.skladmarket.uz/skalad-market/96e0222d-1935-4a9c-b9d9-8ef4e3d8cf85	4	Рельеф профиля НС-35 (А)	35	1	7
20	\N	2026-07-22 08:57:22.156469	t	\N	2026-07-22 08:58:01.135048	5	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	OOO METAL SYSTEM	ooo-metal-system	0	300000.00	https://media.skladmarket.uz/skalad-market/484ec4c3-0e8b-460d-9d4e-60fd86b3e670	6	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A	35x1000-a-1	1	7
19	\N	2026-07-22 08:57:21.896553	t	\N	2026-07-22 08:58:01.151785	5	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	OOO METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
18	\N	2026-07-22 08:57:21.144878	t	\N	2026-07-22 08:58:01.168357	5	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	OOO METAL SYSTEM	ooo-metal-system	0	200000.00	https://media.skladmarket.uz/skalad-market/ee555444-ef79-4001-a78f-4757734a6d8a	5	Металл Профиль НС-35x1000-A	35x1000-a	1	7
17	\N	2026-07-22 08:56:55.343675	t	\N	2026-07-22 08:57:03.587717	7	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	OOO METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
22	\N	2026-07-25 16:16:48.668217	t	\N	2026-07-25 16:17:12.715508	12	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	OOO METAL SYSTEM	ooo-metal-system	0	300000.00	https://media.skladmarket.uz/skalad-market/484ec4c3-0e8b-460d-9d4e-60fd86b3e670	6	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A	35x1000-a-1	16	7
23	\N	2026-07-26 16:41:30.435428	t	\N	2026-07-26 16:41:59.643171	3	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	300000.00	https://media.skladmarket.uz/skalad-market/484ec4c3-0e8b-460d-9d4e-60fd86b3e670	6	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A	35x1000-a-1	1	7
21	\N	2026-07-22 11:27:13.903713	t	\N	2026-07-30 08:15:59.645105	7	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	OOO METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	497	7
25	\N	2026-07-30 17:25:21.311851	t	\N	2026-07-30 17:25:26.888283	12	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	300000.00	https://media.skladmarket.uz/skalad-market/484ec4c3-0e8b-460d-9d4e-60fd86b3e670	6	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A	35x1000-a-1	1	7
24	\N	2026-07-29 23:53:06.861573	t	\N	2026-08-03 11:18:41.785435	7	2	\N	Tayanch Build Supply	tayanch-build-supply	0	3.00	https://media.skladmarket.uz/skalad-market/563570e0-21d2-46cf-bfb2-fa6ec7f0878f	1	Armatura	armatura	500	3
26	\N	2026-07-30 17:28:40.144143	t	\N	2026-07-30 17:31:14.771915	12	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	100000.00	https://media.skladmarket.uz/skalad-market/2acf3560-5d89-42f4-a5fb-479f55ef96e5	8	Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP	x-normanmp	1	7
34	\N	2026-08-09 12:43:33.543733	t	\N	2026-08-09 12:46:08.306247	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
27	\N	2026-08-03 11:16:56.090775	t	\N	2026-08-03 11:18:41.768627	7	7	\N	Metal Invest Group	metal-invest-group	0	9200.00	https://media.skladmarket.uz/skalad-market/1f086280-e34a-4a06-a51f-e754dc08b606	10	Armatura A500C Ø12 mm	armatura-a500c-12-mm	1000	5
28	\N	2026-08-03 14:10:39.46376	t	\N	2026-08-03 14:11:14.695105	16	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	100000.00	https://media.skladmarket.uz/skalad-market/96e0222d-1935-4a9c-b9d9-8ef4e3d8cf85	4	Рельеф профиля НС-35 (А)	35	1	7
29	\N	2026-08-08 17:25:17.493724	t	\N	2026-08-08 17:27:52.920429	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
30	\N	2026-08-08 17:27:33.078139	t	\N	2026-08-08 17:27:53.659836	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	200000.00	https://media.skladmarket.uz/skalad-market/ee555444-ef79-4001-a78f-4757734a6d8a	5	Металл Профиль НС-35x1000-A	35x1000-a	1	7
31	\N	2026-08-08 17:27:37.076941	t	\N	2026-08-08 17:27:54.153978	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	100000.00	https://media.skladmarket.uz/skalad-market/96e0222d-1935-4a9c-b9d9-8ef4e3d8cf85	4	Рельеф профиля НС-35 (А)	35	1	7
32	\N	2026-08-08 18:06:27.279586	t	\N	2026-08-08 18:06:51.820785	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
33	\N	2026-08-09 12:41:14.318502	t	\N	2026-08-09 12:41:21.824538	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
35	\N	2026-08-09 12:45:53.399123	t	\N	2026-08-09 12:46:09.212826	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	200000.00	https://media.skladmarket.uz/skalad-market/ee555444-ef79-4001-a78f-4757734a6d8a	5	Металл Профиль НС-35x1000-A	35x1000-a	2	7
43	\N	2026-08-14 15:30:44.384306	t	\N	2026-08-14 15:30:47.760577	12	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
36	\N	2026-08-10 15:03:38.234637	t	\N	2026-08-10 15:04:19.173997	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
42	\N	2026-08-12 21:47:43.769107	t	\N	2026-08-12 21:48:33.977871	5	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
38	\N	2026-08-11 18:12:49.600763	t	\N	2026-08-11 18:58:52.619217	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	36	7
37	\N	2026-08-10 17:28:40.713549	t	\N	2026-08-14 10:10:01.748375	12	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	200000.00	https://media.skladmarket.uz/skalad-market/ee555444-ef79-4001-a78f-4757734a6d8a	5	Металл Профиль НС-35x1000-A	35x1000-a	11	7
39	\N	2026-08-12 12:23:28.764942	t	\N	2026-08-12 12:23:37.389103	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	100000.00	https://media.skladmarket.uz/skalad-market/96e0222d-1935-4a9c-b9d9-8ef4e3d8cf85	4	Рельеф профиля НС-35 (А)	35	1	7
40	\N	2026-08-12 14:21:13.289024	f	\N	2026-08-12 14:21:13.289024	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
41	\N	2026-08-12 14:22:58.219694	f	\N	2026-08-14 10:46:12.088492	8	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	100000.00	https://media.skladmarket.uz/skalad-market/2acf3560-5d89-42f4-a5fb-479f55ef96e5	8	Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP	x-normanmp	2	7
44	\N	2026-08-20 15:53:45.023275	t	\N	2026-08-20 15:53:52.424422	12	3	https://media.skladmarket.uz/skalad-market/7c2c7c62-2024-4c8d-a2bc-456fe2d87946	METAL SYSTEM	ooo-metal-system	0	70000.00	https://media.skladmarket.uz/skalad-market/f7f486dc-b7af-4d71-b9b5-a172584a3cec	3	Стальной листь ПЭ-01-5005-0,45	01-5005-0-45	1	7
\.


--
-- Data for Name: lead; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.lead (id, created_by, created_date, deleted, modified_by, modified_date, buyer_id, close_reason, comment, company_id, contact_email, contact_name, contact_phone, delivery_address, needed_date, seller_id, source, status) FROM stdin;
1	\N	2026-07-18 20:16:46.167375	f	\N	2026-07-18 20:16:46.167375	3	\N	\N	2	hojiakbarandaqulov5@gmail.com	Xojiakbar Andaqulov	+998901234567	Toshkent sh	\N	3	CART	NEW
2	\N	2026-07-19 08:23:09.056242	f	\N	2026-07-19 08:23:09.056242	5	\N	\N	2	hojiakbarandaqulov5@gmail.com	Xojiakbar	+99895092376	Toshkent	\N	3	CART	NEW
4	\N	2026-07-19 16:01:04.049775	f	\N	2026-07-19 16:01:04.049775	5	\N	\N	2	hojiakbarandaqulov5@gmail.com	Xojiakbar	+998995092376	Toshkent	\N	3	CART	NEW
7	\N	2026-07-19 20:57:36.876474	f	\N	2026-07-19 21:55:57.4404	12	\N	\N	2	\N	John	+998901234567	\N	\N	3	CART	CANCELED
8	\N	2026-07-22 08:58:01.109349	f	\N	2026-07-22 10:42:21.304103	5	Sotuvchi tomonidan rad etildi	asdasdasdasdasd	3	andaqulovxojiakbar@gmail.com	aksndalksjnd	+998908287415	Yakkasaroy tumani Qushbegi 6	\N	7	CART	CANCELED
9	\N	2026-07-26 16:41:59.608965	f	\N	2026-07-26 16:41:59.608965	3	\N	\N	3	hojiakbarandaqulov5@gmail.com	Xojiakbar	+998995092376	Jizzax, Baxmal	\N	7	CART	NEW
3	\N	2026-07-19 15:58:30.120887	f	\N	2026-07-27 19:58:05.460516	3	\N	\N	2	hojiakbarandaqulov5@gmail.com	Xojiakbar	+998995092376	Toshkent	\N	3	CART	CONTACTED
5	\N	2026-07-19 17:09:20.617052	f	\N	2026-07-28 13:14:50.145068	8	\N	\N	2	\N	John	+998901234567	\N	\N	3	CART	CANCELED
6	\N	2026-07-19 20:47:30.533297	f	\N	2026-07-28 13:14:51.202378	8	\N	\N	2	\N	John	+998907654321	\N	\N	3	CART	CANCELED
11	\N	2026-08-03 11:18:41.764063	f	\N	2026-08-03 11:18:41.764063	7	\N	Здраствуйте \n\nдоставить можете по адресу МУ ттз старый 22	2	m6mintm@gmail.com	mumin	+998908287415	\N	\N	3	CART	NEW
12	\N	2026-08-03 14:11:14.68042	f	\N	2026-08-03 14:11:14.68042	16	\N	\N	3	hojiakbarandaqulov5@gmail.com	Xojiajbar	+998995092376	Jizzax	\N	7	CART	NEW
10	\N	2026-08-03 11:18:41.730141	f	\N	2026-08-03 22:02:43.907735	7	\N	Здраствуйте \n\nдоставить можете по адресу МУ ттз старый 22	7	m6mintm@gmail.com	mumin	+998908287415	\N	\N	5	CART	CONTACTED
13	\N	2026-08-12 21:48:33.94229	f	\N	2026-08-12 21:48:33.94229	5	\N	yaxshi maxsulot	3	hojiakbarandaqulov5@gmail.com	Xojiakbar Andaqulov	+998995092376	Jizzax Baxmal Abay 179-uy	\N	7	CART	NEW
\.


--
-- Data for Name: lead_item; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.lead_item (id, created_by, created_date, deleted, modified_by, modified_date, lead_id, price_snapshot, product_id, product_name_snapshot, quantity) FROM stdin;
1	\N	2026-07-18 20:16:46.222108	f	\N	2026-07-18 20:16:46.222108	1	3.00	1	Armatura	1
2	\N	2026-07-19 08:23:09.074368	f	\N	2026-07-19 08:23:09.074368	2	50000.00	2	Quvur	1
3	\N	2026-07-19 15:58:30.132979	f	\N	2026-07-19 15:58:30.132979	3	3.00	1	Armatura	1
4	\N	2026-07-19 16:01:04.055765	f	\N	2026-07-19 16:01:04.055765	4	50000.00	2	Quvur	1
5	\N	2026-07-19 17:09:20.623634	f	\N	2026-07-19 17:09:20.623634	5	50000.00	2	Quvur	1
6	\N	2026-07-19 20:47:30.545732	f	\N	2026-07-19 20:47:30.545732	6	3.00	1	Armatura	1
7	\N	2026-07-19 20:57:36.882501	f	\N	2026-07-19 20:57:36.882501	7	3.00	1	Armatura	1
8	\N	2026-07-22 08:58:01.120923	f	\N	2026-07-22 08:58:01.120923	8	300000.00	6	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A	1
9	\N	2026-07-22 08:58:01.131283	f	\N	2026-07-22 08:58:01.131283	8	70000.00	3	Стальной листь ПЭ-01-5005-0,45	1
10	\N	2026-07-22 08:58:01.144726	f	\N	2026-07-22 08:58:01.144726	8	200000.00	5	Металл Профиль НС-35x1000-A	1
11	\N	2026-07-26 16:41:59.625875	f	\N	2026-07-26 16:41:59.625875	9	300000.00	6	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A	1
12	\N	2026-08-03 11:18:41.747399	f	\N	2026-08-03 11:18:41.747399	10	9200.00	10	Armatura A500C Ø12 mm	1000
13	\N	2026-08-03 11:18:41.774841	f	\N	2026-08-03 11:18:41.774841	11	3.00	1	Armatura	500
14	\N	2026-08-03 14:11:14.687656	f	\N	2026-08-03 14:11:14.687656	12	100000.00	4	Рельеф профиля НС-35 (А)	1
15	\N	2026-08-12 21:48:33.959271	f	\N	2026-08-12 21:48:33.959271	13	70000.00	3	Стальной листь ПЭ-01-5005-0,45	1
\.


--
-- Name: cart_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.cart_item_id_seq', 44, true);


--
-- Name: lead_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.lead_id_seq', 13, true);


--
-- Name: lead_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.lead_item_id_seq', 15, true);


--
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (id);


--
-- Name: lead_item lead_item_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.lead_item
    ADD CONSTRAINT lead_item_pkey PRIMARY KEY (id);


--
-- Name: lead lead_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.lead
    ADD CONSTRAINT lead_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 1kMIW5t3fyafTtRcOcG9E14D9jLnIzSnAYzjDPvbGTyp9H8nQKdrWh2aES9LOzy

--
-- Database "skalad_market_notification" dump
--

--
-- PostgreSQL database dump
--

\restrict dlyZsR6Eooq12LZNlhKqfhEiXC7CvbxSbFnnH5FCSdKLGVkNYh6oJU1R6nUdpcI

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_notification; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_notification WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_notification OWNER TO sklad_user;

\unrestrict dlyZsR6Eooq12LZNlhKqfhEiXC7CvbxSbFnnH5FCSdKLGVkNYh6oJU1R6nUdpcI
\connect skalad_market_notification
\restrict dlyZsR6Eooq12LZNlhKqfhEiXC7CvbxSbFnnH5FCSdKLGVkNYh6oJU1R6nUdpcI

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: notification_preferences; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.notification_preferences (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    email_enabled boolean NOT NULL,
    in_app_enabled boolean NOT NULL,
    push_enabled boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.notification_preferences OWNER TO sklad_user;

--
-- Name: notification_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.notification_preferences ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notification_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    payload_json text NOT NULL,
    read_at timestamp(6) without time zone,
    sent_at timestamp(6) without time zone NOT NULL,
    type character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT notifications_type_check CHECK (((type)::text = ANY ((ARRAY['PRODUCT_CREATED'::character varying, 'COMPANY_CREATED'::character varying])::text[])))
);


ALTER TABLE public.notifications OWNER TO sklad_user;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.notifications ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: push_tokens; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.push_tokens (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    platform character varying(255) NOT NULL,
    token character varying(1024) NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT push_tokens_platform_check CHECK (((platform)::text = ANY ((ARRAY['ANDROID'::character varying, 'IOS'::character varying])::text[])))
);


ALTER TABLE public.push_tokens OWNER TO sklad_user;

--
-- Name: push_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.push_tokens ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.push_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: notification_preferences; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.notification_preferences (id, created_by, created_date, deleted, modified_by, modified_date, email_enabled, in_app_enabled, push_enabled, user_id) FROM stdin;
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.notifications (id, created_by, created_date, deleted, modified_by, modified_date, payload_json, read_at, sent_at, type, user_id) FROM stdin;
1	\N	2026-07-17 21:47:55.040709	f	\N	2026-07-17 21:48:41.110616	{"companyId":1,"createdDate":"2026-07-17T21:47:54.356708765","verificationStatus":"DRAFT","companyName":"ООО \\"Premium Steel Logistics\\"","ownerUserId":2,"companySlug":"premium-steel-logistics"}	2026-07-17 21:48:41.107204	2026-07-17 21:47:54.98864	COMPANY_CREATED	2
2	\N	2026-07-18 13:41:58.207063	f	\N	2026-07-18 13:44:01.730548	{"companyId":2,"createdDate":"2026-07-18T13:41:57.42848985","verificationStatus":"DRAFT","companyName":"Tayanch Build Supply","ownerUserId":3,"companySlug":"tayanch-build-supply"}	2026-07-18 13:44:01.723791	2026-07-18 13:41:58.168699	COMPANY_CREATED	3
3	\N	2026-07-18 13:46:44.712412	f	\N	2026-07-18 13:46:56.394447	{"createdAt":"2026-07-18T13:46:43.925846498","companyId":2,"productId":1,"price":3.0,"name":"Arma tura","moderationStatus":"PENDING","currency":"UZS","categoryId":2,"slug":"arma-tura"}	2026-07-18 13:46:56.393435	2026-07-18 13:46:44.711123	PRODUCT_CREATED	3
6	\N	2026-07-18 23:08:15.580595	f	\N	2026-07-18 23:08:53.204807	{"companyId":4,"createdDate":"2026-07-18T23:08:14.85876716","verificationStatus":"DRAFT","companyName":"test company","ownerUserId":4,"companySlug":"test-company"}	2026-07-18 23:08:53.200912	2026-07-18 23:08:15.538399	COMPANY_CREATED	4
5	\N	2026-07-18 20:19:14.281419	f	\N	2026-07-19 08:19:41.565805	{"createdAt":"2026-07-18T20:19:13.37684144","companyId":2,"productId":2,"price":50000.0,"name":"Quvur","moderationStatus":"PENDING","currency":"UZS","categoryId":4,"slug":"quvur"}	2026-07-19 08:19:41.563768	2026-07-18 20:19:14.279847	PRODUCT_CREATED	3
4	\N	2026-07-18 18:24:23.96321	f	\N	2026-07-19 16:52:56.004669	{"companyId":3,"createdDate":"2026-07-18T18:24:23.024880094","verificationStatus":"DRAFT","companyName":"OOO METAL SYSTEM","ownerUserId":7,"companySlug":"ooo-metal-system"}	2026-07-19 16:52:56.00336	2026-07-18 18:24:23.907721	COMPANY_CREATED	7
7	\N	2026-07-19 17:27:01.009666	f	\N	2026-07-19 17:27:25.101653	{"companyId":5,"createdDate":"2026-07-19T17:27:00.987594531","verificationStatus":"DRAFT","companyName":"company","ownerUserId":12,"companySlug":"company"}	2026-07-19 17:27:25.100627	2026-07-19 17:27:01.007197	COMPANY_CREATED	12
8	\N	2026-07-20 10:57:04.463739	f	\N	2026-07-20 12:20:10.369034	{"createdAt":"2026-07-20T10:57:03.303723763","companyId":3,"productId":3,"price":70000.0,"name":"Стальной листь","moderationStatus":"PENDING","currency":"UZS","categoryId":6,"slug":"product"}	2026-07-20 12:20:10.363933	2026-07-20 10:57:04.421599	PRODUCT_CREATED	7
9	\N	2026-07-20 11:00:17.165761	f	\N	2026-07-20 12:20:10.3728	{"createdAt":"2026-07-20T11:00:17.150454067","companyId":3,"productId":4,"price":100000.0,"name":"Рельеф профиля НС-35 (А)","moderationStatus":"PENDING","currency":"UZS","categoryId":6,"slug":"35"}	2026-07-20 12:20:10.363933	2026-07-20 11:00:17.164564	PRODUCT_CREATED	7
10	\N	2026-07-20 11:01:50.512575	f	\N	2026-07-20 12:20:10.373472	{"createdAt":"2026-07-20T11:01:50.502566009","companyId":3,"productId":5,"price":200000.0,"name":"МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A","moderationStatus":"PENDING","currency":"UZS","categoryId":6,"slug":"35x1000-a"}	2026-07-20 12:20:10.363933	2026-07-20 11:01:50.511267	PRODUCT_CREATED	7
11	\N	2026-07-20 11:04:32.353735	f	\N	2026-07-20 12:20:10.373738	{"createdAt":"2026-07-20T11:04:32.343657121","companyId":3,"productId":6,"price":300000.0,"name":"Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A","moderationStatus":"PENDING","currency":"UZS","categoryId":6,"slug":"35x1000-a-1"}	2026-07-20 12:20:10.363933	2026-07-20 11:04:32.352236	PRODUCT_CREATED	7
12	\N	2026-07-20 11:06:19.854032	f	\N	2026-07-20 12:20:10.373968	{"createdAt":"2026-07-20T11:06:19.834691971","companyId":3,"productId":7,"price":200000.0,"name":"Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A","moderationStatus":"PENDING","currency":"UZS","categoryId":6,"slug":"35x1000-a-2"}	2026-07-20 12:20:10.363933	2026-07-20 11:06:19.853169	PRODUCT_CREATED	7
13	\N	2026-07-20 11:09:06.373241	f	\N	2026-07-20 12:20:10.37413	{"createdAt":"2026-07-20T11:09:06.361388076","companyId":3,"productId":8,"price":100000.0,"name":"Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP","moderationStatus":"PENDING","currency":"UZS","categoryId":7,"slug":"x-normanmp"}	2026-07-20 12:20:10.363933	2026-07-20 11:09:06.372128	PRODUCT_CREATED	7
14	\N	2026-07-20 11:11:43.956917	f	\N	2026-07-20 12:20:10.374316	{"createdAt":"2026-07-20T11:11:43.944325376","companyId":3,"productId":9,"price":180000.0,"name":"Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP","moderationStatus":"PENDING","currency":"UZS","categoryId":7,"slug":"x-normanmp-1"}	2026-07-20 12:20:10.363933	2026-07-20 11:11:43.955144	PRODUCT_CREATED	7
15	\N	2026-07-29 11:04:51.965152	f	\N	2026-07-30 08:19:02.341014	{"companyId":6,"createdDate":"2026-07-29T11:04:50.954774134","verificationStatus":"DRAFT","companyName":"Steel Group","ownerUserId":15,"companySlug":"steel-group"}	2026-07-30 08:19:02.304349	2026-07-29 11:04:51.933713	COMPANY_CREATED	15
16	\N	2026-07-30 09:49:07.338705	f	\N	2026-07-30 09:49:21.836031	{"companyId":7,"createdDate":"2026-07-30T09:49:06.577152693","verificationStatus":"DRAFT","companyName":"Metal Invest Group","ownerUserId":5,"companySlug":"metal-invest-group"}	2026-07-30 09:49:21.831017	2026-07-30 09:49:07.279528	COMPANY_CREATED	5
17	\N	2026-08-02 21:51:07.191724	f	\N	2026-08-02 21:55:53.17084	{"createdAt":"2026-08-02T21:51:06.073000433","companyId":7,"productId":10,"price":9200.0,"name":"Armatura A500C Ø12 mm","moderationStatus":"PENDING","currency":"UZS","categoryId":7,"slug":"armatura-a500c-12-mm"}	2026-08-02 21:55:53.166374	2026-08-02 21:51:07.132854	PRODUCT_CREATED	5
18	\N	2026-08-02 21:56:46.692019	f	\N	2026-08-02 21:58:41.113311	{"createdAt":"2026-08-02T21:56:46.665738946","companyId":7,"productId":11,"price":9800.0,"name":"Polat list","moderationStatus":"PENDING","currency":"UZS","categoryId":6,"slug":"polat-list"}	2026-08-02 21:58:41.112419	2026-08-02 21:56:46.690676	PRODUCT_CREATED	5
19	\N	2026-08-02 22:01:41.341308	f	\N	2026-08-02 22:06:18.556758	{"createdAt":"2026-08-02T22:01:41.325105895","companyId":7,"productId":12,"price":9900.0,"name":"Po'lat list 4 mm","moderationStatus":"PENDING","currency":"UZS","categoryId":6,"slug":"po-lat-list-4-mm"}	2026-08-02 22:06:18.555844	2026-08-02 22:01:41.339917	PRODUCT_CREATED	5
\.


--
-- Data for Name: push_tokens; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.push_tokens (id, created_by, created_date, deleted, modified_by, modified_date, platform, token, user_id) FROM stdin;
\.


--
-- Name: notification_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.notification_preferences_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.notifications_id_seq', 19, true);


--
-- Name: push_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.push_tokens_id_seq', 1, false);


--
-- Name: notification_preferences notification_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.notification_preferences
    ADD CONSTRAINT notification_preferences_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: push_tokens push_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.push_tokens
    ADD CONSTRAINT push_tokens_pkey PRIMARY KEY (id);


--
-- Name: push_tokens uk6cucwghehyeofnk02ys336v5f; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.push_tokens
    ADD CONSTRAINT uk6cucwghehyeofnk02ys336v5f UNIQUE (token);


--
-- Name: notification_preferences ukn2jopkbm16qv3xelbvoyjkd0g; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.notification_preferences
    ADD CONSTRAINT ukn2jopkbm16qv3xelbvoyjkd0g UNIQUE (user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict dlyZsR6Eooq12LZNlhKqfhEiXC7CvbxSbFnnH5FCSdKLGVkNYh6oJU1R6nUdpcI

--
-- Database "skalad_market_product" dump
--

--
-- PostgreSQL database dump
--

\restrict CI4BnFXyqqyH8OdeZuOVD5NS0RpWazphpSW5sK5k2Oy6AB1IgeaOPdEAxeYd4Es

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_product; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_product WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_product OWNER TO sklad_user;

\unrestrict CI4BnFXyqqyH8OdeZuOVD5NS0RpWazphpSW5sK5k2Oy6AB1IgeaOPdEAxeYd4Es
\connect skalad_market_product
\restrict CI4BnFXyqqyH8OdeZuOVD5NS0RpWazphpSW5sK5k2Oy6AB1IgeaOPdEAxeYd4Es

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: banners; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.banners (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    created_by bigint,
    is_active boolean DEFAULT true,
    last_modified_by bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    attach_id character varying(255),
    click_count integer,
    ends_at timestamp(6) without time zone,
    image_key character varying(255),
    placement_code character varying(255),
    starts_at timestamp(6) without time zone,
    target_url character varying(255),
    CONSTRAINT banners_placement_code_check CHECK (((placement_code)::text = ANY ((ARRAY['HOME_TOP'::character varying, 'HOME_MIDDLE'::character varying, 'SIDEBAR'::character varying])::text[])))
);


ALTER TABLE public.banners OWNER TO sklad_user;

--
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.banners ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.banners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: favorite; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.favorite (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    created_by bigint,
    is_active boolean DEFAULT true,
    last_modified_by bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    product_id bigint,
    user_id bigint
);


ALTER TABLE public.favorite OWNER TO sklad_user;

--
-- Name: favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.favorite ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_image; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.product_image (
    id character varying(255) NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    last_modified_by bigint,
    modified_date timestamp(6) without time zone,
    file_size bigint,
    height integer,
    is_primary boolean,
    mime_type character varying(255),
    sort_order integer,
    storage_key character varying(255) NOT NULL,
    width integer,
    product_id bigint NOT NULL
);


ALTER TABLE public.product_image OWNER TO sklad_user;

--
-- Name: product_reviews; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.product_reviews (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    created_by bigint,
    is_active boolean DEFAULT true,
    last_modified_by bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    buyer_id bigint NOT NULL,
    comment text,
    rating integer NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.product_reviews OWNER TO sklad_user;

--
-- Name: product_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.product_reviews ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_views; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.product_views (
    id bigint NOT NULL,
    product_id bigint,
    session_id character varying(255),
    user_id bigint,
    viewed_at timestamp(6) without time zone
);


ALTER TABLE public.product_views OWNER TO sklad_user;

--
-- Name: product_views_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.product_views ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_views_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    created_by bigint,
    is_active boolean DEFAULT true,
    last_modified_by bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    attributes_jsonb jsonb,
    category_id bigint NOT NULL,
    company_id bigint NOT NULL,
    currency character varying(255) NOT NULL,
    deleted_at timestamp(6) without time zone,
    description text,
    district_id bigint,
    favorites_count_cache bigint,
    is_promoted boolean,
    min_product bigint,
    moderation_status character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255),
    price numeric(38,2),
    price_type character varying(255) NOT NULL,
    promoted_until timestamp(6) without time zone,
    region_id bigint NOT NULL,
    reject_reason character varying(255),
    sale_type character varying(255) NOT NULL,
    seller_id bigint NOT NULL,
    short_description character varying(255),
    slug character varying(255) NOT NULL,
    views_count_cache bigint,
    CONSTRAINT products_currency_check CHECK (((currency)::text = ANY ((ARRAY['UZS'::character varying, 'USD'::character varying])::text[]))),
    CONSTRAINT products_moderation_status_check CHECK (((moderation_status)::text = ANY ((ARRAY['PENDING'::character varying, 'APPROVED'::character varying, 'REJECTED'::character varying, 'ARCHIVED'::character varying])::text[]))),
    CONSTRAINT products_price_type_check CHECK (((price_type)::text = ANY ((ARRAY['FIXED'::character varying, 'FROM_PRICE'::character varying, 'NEGOTIABLE'::character varying])::text[]))),
    CONSTRAINT products_sale_type_check CHECK (((sale_type)::text = ANY ((ARRAY['WHOLESALE'::character varying, 'RETAIL'::character varying])::text[])))
);


ALTER TABLE public.products OWNER TO sklad_user;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: banners; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.banners (id, created_at, created_by, is_active, last_modified_by, updated_at, attach_id, click_count, ends_at, image_key, placement_code, starts_at, target_url) FROM stdin;
1	2026-07-18 16:17:26.877069	\N	t	\N	2026-07-18 16:17:28.753003	d580f806-e231-4842-b388-0c4163fb18b8.png	\N	2026-07-19 11:17:00	d580f806-e231-4842-b388-0c4163fb18b8	HOME_TOP	2026-07-18 11:17:00	https://sklad-market.netlify.app/company/premium-steel-logistics
2	2026-07-18 17:03:03.525971	\N	t	\N	2026-07-18 17:03:04.02919	269384ea-9ed6-4781-a97b-e05f18f05433.jpg	\N	2026-07-19 12:02:00	269384ea-9ed6-4781-a97b-e05f18f05433	HOME_TOP	2026-07-18 12:02:00	https://sklad-market.netlify.app/company/tayanch-build-supply
19	2026-08-03 08:56:27.398636	\N	t	\N	2026-08-03 08:56:28.045638	f68c10bb-00b6-4075-9715-9a3061dc769c.png	\N	2026-08-03 03:54:00	f68c10bb-00b6-4075-9715-9a3061dc769c	HOME_TOP	2026-08-03 03:54:00	https://sklad-market.netlify.app/company/steel-group
20	2026-08-03 08:58:41.583558	\N	t	\N	2026-08-03 08:58:42.006271	3ac37963-c35d-4fd0-9bae-9f9a03481ecc.png	\N	2026-08-03 03:09:00	3ac37963-c35d-4fd0-9bae-9f9a03481ecc	HOME_TOP	2026-08-03 03:56:00	https://sklad-market.netlify.app/company/steel-group
8	2026-07-22 13:17:08.699859	\N	t	\N	2026-07-22 13:17:10.258862	31643722-a1ae-4e9d-888f-be3a36f3c5a4.png	\N	2026-07-22 08:20:00	31643722-a1ae-4e9d-888f-be3a36f3c5a4	HOME_TOP	2026-07-22 08:16:00	https://sklad-market.netlify.app/company/ooo-metal-system
13	2026-07-25 17:58:37.297279	\N	t	\N	2026-07-25 17:58:38.27704	89b14081-f762-4e0f-9704-737eaa7f5d32.png	\N	2026-07-26 12:56:00	89b14081-f762-4e0f-9704-737eaa7f5d32	HOME_TOP	2026-07-25 12:56:00	https://sklad-market.netlify.app/company/company
14	2026-07-25 18:10:42.898492	\N	t	\N	2026-07-25 18:10:44.171351	a5ac563c-ac7e-467e-99f1-ce63b7cb718d.png	\N	2026-07-26 13:10:00	a5ac563c-ac7e-467e-99f1-ce63b7cb718d	HOME_TOP	2026-07-25 13:10:00	https://sklad-market.netlify.app/company/company
15	2026-07-25 18:21:25.087331	\N	t	\N	2026-07-25 18:21:25.978024	866627d8-d8ff-4a82-9a92-278842ee06b0.png	\N	2026-07-26 13:21:00	866627d8-d8ff-4a82-9a92-278842ee06b0	HOME_TOP	2026-07-25 13:21:00	https://sklad-market.netlify.app/company/company
21	2026-08-17 15:50:11.753663	\N	t	\N	2026-08-17 16:55:15.520187	89d62aa3-094f-4e22-8ab8-a4783c6d812c.jpeg	\N	2026-09-09 07:12:00	89d62aa3-094f-4e22-8ab8-a4783c6d812c	HOME_TOP	2026-08-17 10:49:00	https://sklad-market.netlify.app/company/ooo-metal-system
25	2026-08-17 17:01:59.986073	\N	t	\N	2026-08-17 17:02:00.421664	e005232e-a8ee-4149-b421-12c21b5edc28.jpg	\N	2026-09-17 07:12:00	e005232e-a8ee-4149-b421-12c21b5edc28	HOME_TOP	2026-08-17 11:56:00	https://sklad-market.netlify.app/company/tayanch-build-supply
26	2026-08-17 17:15:34.81447	\N	t	\N	2026-08-17 17:15:35.286934	81045759-b41a-4786-8d94-456d576d6562.jpeg	\N	2026-10-12 07:12:00	81045759-b41a-4786-8d94-456d576d6562	HOME_TOP	2026-08-17 12:15:00	https://sklad-market.netlify.app/company/company
28	2026-08-17 17:23:30.916689	\N	t	\N	2026-08-17 17:23:31.41211	1210652a-ef0a-4d2d-9f01-35d7d2356758.jpg	\N	2026-09-17 12:17:00	1210652a-ef0a-4d2d-9f01-35d7d2356758	HOME_TOP	2026-08-17 12:17:00	https://sklad-market.netlify.app/company/steel-group
30	2026-08-17 17:43:50.334782	\N	t	\N	2026-08-17 17:43:50.807445	96c8f22b-6a2a-41a3-86e8-0b49ebb83482.jpg	\N	2026-09-13 08:13:00	96c8f22b-6a2a-41a3-86e8-0b49ebb83482	HOME_TOP	2026-08-17 12:25:00	https://sklad-market.netlify.app/company/metal-invest-group
\.


--
-- Data for Name: favorite; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.favorite (id, created_at, created_by, is_active, last_modified_by, updated_at, product_id, user_id) FROM stdin;
1	2026-07-18 22:20:30.131842	\N	f	\N	2026-07-18 22:25:21.949129	2	4
3	2026-07-26 19:12:48.866128	\N	f	\N	2026-07-26 19:13:03.520262	8	12
4	2026-07-26 22:24:39.117482	\N	t	\N	2026-07-26 22:24:39.117482	8	3
5	2026-07-26 22:24:39.87083	\N	t	\N	2026-07-26 22:24:39.87083	7	3
8	2026-08-01 18:26:34.864948	\N	t	\N	2026-08-01 18:26:34.864948	8	16
9	2026-08-03 11:16:58.545359	\N	t	\N	2026-08-03 11:16:58.545359	10	7
7	2026-07-30 17:32:20.845353	\N	f	\N	2026-08-03 16:42:29.24403	4	12
6	2026-07-30 17:32:19.075143	\N	f	\N	2026-08-10 17:28:30.636536	5	12
10	2026-08-03 16:46:01.451188	\N	t	\N	2026-08-11 18:12:56.139793	4	8
11	2026-08-08 17:24:57.201536	\N	t	\N	2026-08-13 11:59:47.103085	3	8
2	2026-07-20 12:19:45.923948	\N	t	\N	2026-08-20 15:53:42.035636	3	12
\.


--
-- Data for Name: product_image; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.product_image (id, created_by, created_date, deleted, last_modified_by, modified_date, file_size, height, is_primary, mime_type, sort_order, storage_key, width, product_id) FROM stdin;
563570e0-21d2-46cf-bfb2-fa6ec7f0878f.jpg	\N	2026-07-18 13:46:45.772126	f	\N	2026-07-18 13:46:45.772126	19093	\N	t	image/jpeg	1	563570e0-21d2-46cf-bfb2-fa6ec7f0878f	\N	1
b0b8d002-4df3-4c91-bf9a-ac93656fdf64.jpg	\N	2026-07-18 20:19:14.662148	f	\N	2026-07-18 20:19:14.662148	9451	\N	t	image/jpeg	1	b0b8d002-4df3-4c91-bf9a-ac93656fdf64	\N	2
f7f486dc-b7af-4d71-b9b5-a172584a3cec.png	\N	2026-07-20 10:57:05.119947	f	\N	2026-07-20 10:57:05.119947	129521	\N	t	image/png	1	f7f486dc-b7af-4d71-b9b5-a172584a3cec	\N	3
96e0222d-1935-4a9c-b9d9-8ef4e3d8cf85.jpg	\N	2026-07-20 11:00:17.541116	f	\N	2026-07-20 11:00:17.541116	29593	\N	t	image/jpeg	1	96e0222d-1935-4a9c-b9d9-8ef4e3d8cf85	\N	4
ee555444-ef79-4001-a78f-4757734a6d8a.webp	\N	2026-07-20 11:01:50.815932	f	\N	2026-07-20 11:01:50.815932	13184	\N	t	image/webp	1	ee555444-ef79-4001-a78f-4757734a6d8a	\N	5
484ec4c3-0e8b-460d-9d4e-60fd86b3e670.webp	\N	2026-07-20 11:04:32.656678	f	\N	2026-07-20 11:04:32.656678	11050	\N	t	image/webp	1	484ec4c3-0e8b-460d-9d4e-60fd86b3e670	\N	6
3fe92cb6-e8ed-4fe2-96b5-d3f7f008a5fe.webp	\N	2026-07-20 11:06:20.113625	f	\N	2026-07-20 11:06:20.113625	13746	\N	t	image/webp	1	3fe92cb6-e8ed-4fe2-96b5-d3f7f008a5fe	\N	7
2acf3560-5d89-42f4-a5fb-479f55ef96e5.webp	\N	2026-07-20 11:09:06.665382	f	\N	2026-07-20 11:09:06.665382	14072	\N	t	image/webp	1	2acf3560-5d89-42f4-a5fb-479f55ef96e5	\N	8
dda9a1dd-21b7-492e-bc3b-f7bff905107b.webp	\N	2026-07-20 11:11:44.243248	f	\N	2026-07-20 11:11:44.243248	10624	\N	t	image/webp	1	dda9a1dd-21b7-492e-bc3b-f7bff905107b	\N	9
1f086280-e34a-4a06-a51f-e754dc08b606.jpg	\N	2026-08-02 21:51:07.914031	f	\N	2026-08-02 21:51:07.914031	19093	\N	t	image/jpeg	1	1f086280-e34a-4a06-a51f-e754dc08b606	\N	10
a3c020e3-d842-4177-a27d-dbf568c5178b.jpg	\N	2026-08-02 21:56:47.181143	f	\N	2026-08-02 21:56:47.181143	6612	\N	t	image/jpeg	1	a3c020e3-d842-4177-a27d-dbf568c5178b	\N	11
69c6768b-4c69-430d-a016-edfc7b8d9f33.webp	\N	2026-08-02 22:01:42.187805	f	\N	2026-08-02 22:01:42.187805	18502	\N	t	image/webp	1	69c6768b-4c69-430d-a016-edfc7b8d9f33	\N	12
\.


--
-- Data for Name: product_reviews; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.product_reviews (id, created_at, created_by, is_active, last_modified_by, updated_at, buyer_id, comment, rating, product_id) FROM stdin;
1	2026-07-30 19:26:26.276169	\N	t	\N	2026-07-30 19:26:26.276169	3	zor	5	6
2	2026-07-30 21:21:38.329224	\N	t	\N	2026-07-30 21:21:38.329224	12	Zo'r	5	8
3	2026-08-03 14:03:00.013974	\N	t	\N	2026-08-03 14:03:00.013974	16	zor	5	12
\.


--
-- Data for Name: product_views; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.product_views (id, product_id, session_id, user_id, viewed_at) FROM stdin;
1	1	\N	1	2026-07-18 13:48:13.634467
2	1	\N	6	2026-07-18 16:18:33.316952
3	1	\N	6	2026-07-18 16:19:29.480679
4	1	\N	6	2026-07-18 18:29:41.322391
5	1	\N	4	2026-07-18 18:30:17.231032
6	1	\N	8	2026-07-18 18:32:07.306531
7	1	\N	6	2026-07-18 18:38:08.603678
8	1	\N	3	2026-07-18 20:10:29.005725
9	1	\N	3	2026-07-18 20:15:49.656142
10	1	\N	5	2026-07-18 20:32:21.326729
11	2	\N	1	2026-07-18 23:41:27.738964
12	2	\N	5	2026-07-19 08:21:57.779211
13	1	\N	3	2026-07-19 15:57:57.239935
14	1	\N	8	2026-07-19 17:21:27.468314
15	7	\N	1	2026-07-20 11:43:31.404445
16	9	\N	1	2026-07-20 11:53:12.739352
17	4	\N	12	2026-07-20 12:48:56.78959
18	9	\N	6	2026-07-20 16:24:38.962317
19	9	\N	6	2026-07-20 16:24:55.643373
20	9	\N	1	2026-07-21 16:18:18.365977
21	4	\N	3	2026-07-22 07:28:51.664988
22	3	\N	6	2026-07-22 12:05:00.850536
23	6	\N	3	2026-07-22 12:05:28.585476
24	5	\N	12	2026-07-22 22:54:24.953509
25	6	\N	12	2026-07-22 23:40:20.928176
26	6	\N	12	2026-07-22 23:40:20.928156
27	5	\N	7	2026-07-23 11:19:44.653962
28	5	\N	12	2026-07-23 11:21:51.452173
29	5	\N	12	2026-07-23 11:40:41.067308
30	6	\N	7	2026-07-23 11:47:54.727023
31	5	\N	7	2026-07-24 10:45:25.836424
32	5	\N	12	2026-07-24 14:25:02.477874
33	6	\N	3	2026-07-24 20:40:27.408812
34	6	\N	12	2026-07-24 22:31:41.261695
35	6	\N	12	2026-07-24 22:38:27.954231
36	6	\N	3	2026-07-25 14:15:50.822809
37	9	\N	1	2026-07-25 16:11:58.864524
38	6	\N	3	2026-07-26 16:41:28.115709
39	6	\N	3	2026-07-26 16:42:28.48641
40	5	\N	7	2026-07-26 16:57:53.217947
41	8	\N	7	2026-07-26 16:58:31.068977
42	8	\N	5	2026-07-26 18:11:36.972152
43	6	\N	6	2026-07-26 18:14:58.520504
44	8	\N	12	2026-07-26 18:16:43.92001
45	5	\N	12	2026-07-26 18:23:08.1401
46	7	\N	3	2026-07-26 18:23:33.903168
47	7	\N	12	2026-07-26 18:31:09.945426
48	5	\N	12	2026-07-26 18:34:42.210145
49	5	\N	12	2026-07-26 19:05:15.805731
50	8	\N	12	2026-07-26 19:05:22.384836
51	8	\N	5	2026-07-27 21:01:36.878752
52	7	\N	5	2026-07-27 21:02:35.8101
53	7	\N	3	2026-07-28 12:18:29.237374
54	7	\N	3	2026-07-28 12:44:35.46272
55	7	\N	8	2026-07-29 16:58:21.664732
56	7	\N	8	2026-07-29 16:58:21.664709
57	8	\N	12	2026-07-29 16:59:06.236985
58	8	\N	12	2026-07-29 16:59:06.548704
59	8	\N	12	2026-07-30 17:23:58.708969
60	8	\N	12	2026-07-30 17:23:59.00467
61	8	\N	12	2026-07-30 17:25:00.233931
62	6	\N	12	2026-07-30 17:25:15.767935
63	8	\N	12	2026-07-30 17:25:32.587529
64	6	\N	12	2026-07-30 17:38:17.243617
65	6	\N	12	2026-07-30 17:45:51.80319
66	6	\N	12	2026-07-30 17:51:03.393603
67	6	\N	8	2026-07-30 17:51:28.728944
68	8	\N	3	2026-07-30 18:12:36.39255
69	8	\N	3	2026-07-30 18:18:33.207362
70	6	\N	3	2026-07-30 19:06:42.34437
71	9	\N	3	2026-07-30 20:44:37.112039
72	8	\N	16	2026-07-30 21:13:09.911871
73	8	\N	12	2026-07-30 21:21:17.482108
74	8	\N	12	2026-07-30 21:21:48.640389
75	8	\N	16	2026-07-30 21:24:27.019763
76	8	\N	16	2026-07-30 21:24:42.454181
77	5	\N	8	2026-07-30 21:28:18.024802
78	7	\N	8	2026-07-30 21:28:24.285829
79	4	\N	8	2026-07-30 21:28:29.688253
80	8	\N	8	2026-07-30 21:28:36.508535
81	5	\N	12	2026-07-30 21:45:08.779413
82	8	\N	12	2026-07-30 21:45:16.639577
83	8	\N	12	2026-07-30 21:45:24.670622
84	8	\N	12	2026-07-30 21:46:34.292325
85	8	\N	12	2026-07-30 21:53:33.250164
86	9	\N	12	2026-07-30 21:53:39.100272
87	3	\N	12	2026-07-30 21:53:47.656214
88	5	\N	12	2026-07-30 21:53:54.760949
89	6	\N	12	2026-07-30 21:54:02.167144
90	7	\N	12	2026-07-30 21:54:10.573558
91	9	\N	12	2026-07-30 21:54:14.731695
92	8	\N	7	2026-07-31 08:15:08.982588
93	3	\N	15	2026-07-31 08:15:35.24944
94	10	\N	\N	2026-08-03 09:27:36.227302
95	11	\N	\N	2026-08-03 09:32:10.847952
96	10	\N	\N	2026-08-03 10:18:58.404538
97	10	\N	7	2026-08-03 11:16:51.946333
98	10	\N	7	2026-08-03 11:17:39.64196
99	5	\N	\N	2026-08-03 11:38:30.613969
100	8	\N	16	2026-08-03 14:02:25.926947
101	12	\N	16	2026-08-03 14:02:43.811952
102	12	\N	5	2026-08-03 14:03:31.378111
103	12	\N	5	2026-08-03 14:04:04.94055
104	10	\N	5	2026-08-03 14:05:21.52674
105	12	\N	16	2026-08-03 14:08:19.288365
106	4	\N	16	2026-08-03 14:10:37.765374
107	4	\N	16	2026-08-03 14:13:10.020353
108	3	\N	12	2026-08-03 15:30:27.418122
109	4	\N	8	2026-08-03 16:46:49.582974
110	4	\N	6	2026-08-04 17:49:08.656953
111	10	\N	6	2026-08-04 18:56:45.094558
112	5	\N	12	2026-08-05 17:34:49.710831
113	3	\N	12	2026-08-05 17:42:37.766933
114	4	\N	12	2026-08-06 10:37:37.176251
115	5	\N	\N	2026-08-06 10:39:47.020215
116	3	\N	\N	2026-08-06 10:41:47.545625
117	5	\N	12	2026-08-06 10:44:03.952647
118	3	\N	3	2026-08-07 13:14:31.221751
119	5	\N	6	2026-08-08 15:10:15.175084
120	5	\N	6	2026-08-08 15:10:25.668741
121	4	\N	6	2026-08-08 15:10:45.993272
122	3	\N	\N	2026-08-10 11:30:02.512587
123	3	\N	\N	2026-08-10 11:58:16.584955
124	6	\N	\N	2026-08-10 14:47:56.693954
125	9	\N	16	2026-08-10 16:06:47.903039
126	3	\N	\N	2026-08-10 16:45:27.933587
127	3	\N	12	2026-08-10 16:48:15.688966
128	5	\N	12	2026-08-10 16:48:15.697751
129	7	\N	12	2026-08-10 16:48:15.70845
130	4	\N	12	2026-08-10 16:48:15.713248
131	6	\N	12	2026-08-10 16:48:15.952071
132	9	\N	12	2026-08-10 16:48:15.966754
133	11	\N	12	2026-08-10 16:48:15.981696
134	12	\N	12	2026-08-10 16:48:16.011063
135	8	\N	12	2026-08-10 16:48:16.01426
136	10	\N	12	2026-08-10 16:48:16.016963
137	6	\N	12	2026-08-10 16:48:24.183328
138	4	\N	12	2026-08-10 16:48:24.187035
148	7	\N	12	2026-08-10 17:01:05.407862
149	4	\N	12	2026-08-10 17:01:16.551943
156	11	\N	12	2026-08-10 17:01:16.865725
159	6	\N	12	2026-08-10 17:01:43.699396
139	7	\N	12	2026-08-10 16:48:24.192583
144	8	\N	12	2026-08-10 17:01:05.381996
151	7	\N	12	2026-08-10 17:01:16.566955
158	12	\N	12	2026-08-10 17:01:16.888721
162	5	\N	12	2026-08-10 17:01:43.715065
164	12	\N	12	2026-08-10 17:01:43.960463
167	11	\N	12	2026-08-10 17:01:44.022116
140	5	\N	12	2026-08-10 16:48:24.192582
143	4	\N	12	2026-08-10 17:01:05.376515
153	6	\N	12	2026-08-10 17:01:16.578374
157	10	\N	12	2026-08-10 17:01:16.887164
161	3	\N	12	2026-08-10 17:01:43.714512
166	8	\N	12	2026-08-10 17:01:44.006759
141	9	\N	12	2026-08-10 16:48:24.197872
142	8	\N	12	2026-08-10 16:48:24.21023
145	5	\N	12	2026-08-10 17:01:05.383651
146	9	\N	12	2026-08-10 17:01:05.398544
150	3	\N	12	2026-08-10 17:01:16.56179
152	5	\N	12	2026-08-10 17:01:16.57754
154	8	\N	12	2026-08-10 17:01:16.82661
163	7	\N	12	2026-08-10 17:01:43.726803
165	9	\N	12	2026-08-10 17:01:44.006787
168	10	\N	12	2026-08-10 17:01:44.033095
147	6	\N	12	2026-08-10 17:01:05.400665
155	9	\N	12	2026-08-10 17:01:16.858015
160	4	\N	12	2026-08-10 17:01:43.700591
169	5	\N	12	2026-08-10 17:02:56.546586
170	5	\N	12	2026-08-10 17:03:07.045592
171	3	\N	12	2026-08-10 17:03:57.844689
172	5	\N	8	2026-08-10 17:32:09.058078
173	4	\N	8	2026-08-11 18:12:59.397787
174	4	\N	8	2026-08-11 18:13:01.32524
175	4	\N	8	2026-08-12 11:09:58.186046
176	4	\N	8	2026-08-12 11:10:00.70767
177	3	\N	8	2026-08-12 13:11:59.74495
178	4	\N	8	2026-08-12 13:19:33.094558
179	4	\N	8	2026-08-12 13:20:11.643154
180	3	\N	8	2026-08-12 14:21:36.130138
181	4	\N	3	2026-08-13 11:02:49.208066
182	3	\N	8	2026-08-13 12:00:12.573632
183	3	\N	8	2026-08-13 12:02:12.136659
184	3	\N	8	2026-08-13 14:34:37.471855
185	3	\N	8	2026-08-13 14:36:46.875541
186	3	\N	8	2026-08-13 14:37:23.444583
187	5	\N	8	2026-08-13 14:49:34.653055
188	3	\N	8	2026-08-13 14:49:34.654235
189	4	\N	8	2026-08-13 14:49:34.660798
190	7	\N	8	2026-08-13 14:49:34.663751
191	6	\N	8	2026-08-13 14:49:34.740477
192	8	\N	8	2026-08-13 14:49:34.765724
193	9	\N	8	2026-08-13 14:49:34.769474
194	5	\N	8	2026-08-13 15:09:02.767591
195	7	\N	8	2026-08-13 15:09:02.773467
196	4	\N	8	2026-08-13 15:09:02.778124
197	3	\N	8	2026-08-13 15:09:02.78122
198	6	\N	8	2026-08-13 15:09:02.850237
199	9	\N	8	2026-08-13 15:09:02.880399
200	12	\N	8	2026-08-13 15:09:02.883506
201	11	\N	8	2026-08-13 15:09:02.887227
202	10	\N	8	2026-08-13 15:09:02.893301
203	8	\N	8	2026-08-13 15:09:02.955989
204	3	\N	8	2026-08-13 15:09:03.45979
205	4	\N	8	2026-08-13 15:09:03.462642
206	7	\N	8	2026-08-13 15:09:03.464408
207	5	\N	8	2026-08-13 15:09:03.466696
208	6	\N	8	2026-08-13 15:09:03.542961
209	8	\N	8	2026-08-13 15:09:03.571717
210	9	\N	8	2026-08-13 15:09:03.572071
211	3	\N	8	2026-08-13 15:18:13.950683
212	4	\N	8	2026-08-13 15:18:13.953089
213	5	\N	8	2026-08-13 15:18:13.954763
214	6	\N	8	2026-08-13 15:18:13.958105
215	7	\N	8	2026-08-13 15:18:14.14378
216	11	\N	8	2026-08-13 15:18:14.144957
217	12	\N	8	2026-08-13 15:18:14.144874
218	9	\N	8	2026-08-13 15:18:14.147797
219	10	\N	8	2026-08-13 15:18:14.14874
220	8	\N	8	2026-08-13 15:18:14.290358
221	4	\N	8	2026-08-13 15:24:23.448934
222	5	\N	8	2026-08-13 15:24:23.451335
223	6	\N	8	2026-08-13 15:24:23.456402
224	3	\N	8	2026-08-13 15:24:23.462433
225	7	\N	8	2026-08-13 15:24:23.600281
226	9	\N	8	2026-08-13 15:24:23.608445
227	10	\N	8	2026-08-13 15:24:23.62185
228	11	\N	8	2026-08-13 15:24:23.639925
229	12	\N	8	2026-08-13 15:24:23.654464
230	8	\N	8	2026-08-13 15:24:23.760177
231	5	\N	\N	2026-08-14 10:11:01.698032
232	6	\N	8	2026-08-14 11:21:09.677581
233	4	\N	8	2026-08-14 11:21:09.678166
234	5	\N	8	2026-08-14 11:21:09.678168
235	7	\N	8	2026-08-14 11:21:09.68324
236	9	\N	8	2026-08-14 11:21:09.684481
237	8	\N	8	2026-08-14 11:21:09.821663
238	10	\N	\N	2026-08-14 15:26:02.364862
239	3	\N	\N	2026-08-14 15:26:02.366766
240	7	\N	\N	2026-08-14 15:26:02.421511
241	4	\N	\N	2026-08-14 15:26:02.422018
242	6	\N	\N	2026-08-14 15:26:02.443315
243	12	\N	\N	2026-08-14 15:26:04.60206
244	9	\N	\N	2026-08-14 15:26:04.628649
245	8	\N	\N	2026-08-14 15:26:04.629299
246	11	\N	\N	2026-08-14 15:26:04.642999
247	5	\N	\N	2026-08-14 15:26:04.657253
248	7	\N	\N	2026-08-14 15:26:13.320432
249	4	\N	\N	2026-08-14 15:26:13.373052
250	10	\N	\N	2026-08-14 15:26:13.375934
251	6	\N	\N	2026-08-14 15:26:13.376296
252	3	\N	\N	2026-08-14 15:26:13.383003
253	9	\N	\N	2026-08-14 15:26:13.819185
254	12	\N	\N	2026-08-14 15:26:13.820253
255	11	\N	\N	2026-08-14 15:26:13.822556
256	8	\N	\N	2026-08-14 15:26:13.823235
257	5	\N	\N	2026-08-14 15:26:13.888034
258	12	\N	\N	2026-08-14 15:26:28.213807
259	10	\N	\N	2026-08-14 15:26:28.214006
260	11	\N	\N	2026-08-14 15:26:28.229054
261	7	\N	\N	2026-08-14 15:26:39.106664
262	10	\N	\N	2026-08-14 15:26:39.106664
263	4	\N	\N	2026-08-14 15:26:39.10695
264	6	\N	\N	2026-08-14 15:26:39.156166
265	3	\N	\N	2026-08-14 15:26:39.17298
266	12	\N	\N	2026-08-14 15:26:39.5181
267	11	\N	\N	2026-08-14 15:26:39.603174
268	8	\N	\N	2026-08-14 15:26:39.612025
269	5	\N	\N	2026-08-14 15:26:39.616987
270	9	\N	\N	2026-08-14 15:26:39.622278
271	12	\N	\N	2026-08-14 15:28:06.566605
272	10	\N	\N	2026-08-14 15:28:06.56845
273	11	\N	\N	2026-08-14 15:28:06.582396
274	6	\N	\N	2026-08-14 15:28:10.648412
275	4	\N	\N	2026-08-14 15:28:10.669286
276	3	\N	\N	2026-08-14 15:28:10.695133
277	7	\N	\N	2026-08-14 15:28:10.700519
278	5	\N	\N	2026-08-14 15:28:11.118663
279	8	\N	\N	2026-08-14 15:28:11.131419
280	10	\N	\N	2026-08-14 15:28:11.133596
281	12	\N	\N	2026-08-14 15:28:11.141616
282	11	\N	\N	2026-08-14 15:28:11.142471
283	9	\N	\N	2026-08-14 15:28:11.150527
284	5	\N	6	2026-08-17 16:35:53.305475
285	4	\N	6	2026-08-17 16:48:33.673415
286	3	\N	\N	2026-08-17 16:51:41.729188
287	3	\N	\N	2026-08-17 16:52:17.760028
288	4	\N	8	2026-08-17 17:04:50.908425
289	3	\N	8	2026-08-20 15:58:38.363596
290	4	\N	6	2026-08-20 16:04:06.887949
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.products (id, created_at, created_by, is_active, last_modified_by, updated_at, attributes_jsonb, category_id, company_id, currency, deleted_at, description, district_id, favorites_count_cache, is_promoted, min_product, moderation_status, name, phone, price, price_type, promoted_until, region_id, reject_reason, sale_type, seller_id, short_description, slug, views_count_cache) FROM stdin;
2	2026-07-18 20:19:13.376841	\N	f	\N	2026-07-30 18:34:44.459737	{}	4	2	UZS	2026-07-30 18:34:43.362449	Sifatli quvurlar	0	0	f	3	APPROVED	Quvur	+998901234567	50000.00	FIXED	\N	0	\N	WHOLESALE	3	\N	quvur	2
1	2026-07-18 13:46:43.925846	\N	f	\N	2026-07-30 18:34:46.533553	{}	2	2	UZS	2026-07-30 18:34:46.480201		0	0	f	0	APPROVED	Armatura	+998901234567	3.00	FIXED	\N	0	\N	WHOLESALE	3	\N	armatura	12
3	2026-07-20 10:57:03.303724	\N	t	\N	2026-08-20 15:58:38.371132	{}	6	3	UZS	\N	Лист стальной 2мм, 3мм, 4мм, 5мм, 6мм, 8мм, 10мм , оптом и в розницу.	0	0	f	500	APPROVED	Стальной листь ПЭ-01-5005-0,45	+998908287415	70000.00	FIXED	\N	0	\N	WHOLESALE	7	\N	01-5005-0-45	33
4	2026-07-20 11:00:17.150454	\N	t	\N	2026-08-20 16:04:06.89425	{}	6	3	UZS	\N	Рельеф профиля НС-35 (А) выполнен в виде симметричных трапециевидных гофр, усиленных рёбрами жёсткости. Такой профнастил достаточно прочный и адаптирован к большим нагрузкам. Гофры и рёбра также отвечают за эстетику кровли, придают ей привлекательный внешний вид.	0	0	f	100	APPROVED	Рельеф профиля НС-35 (А)	+998908287415	100000.00	FIXED	\N	0	\N	WHOLESALE	7	\N	35	34
5	2026-07-20 11:01:50.502566	\N	t	\N	2026-08-17 16:35:53.321318	{}	6	3	UZS	\N	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A (ПЭ-01-5005-0,45) — популярный материал в Ташкенте для обустройства кровли. Изначально он представляет собой лист оцинкованной стали с покрытием. Толщина металла с цинковым и полимерным покрытием составляет 0.45 мм.После проката на специальном оборудовании металл принимает волнообразный вид. Жёсткость такого листа гораздо выше плоского.	0	0	f	200	APPROVED	Металл Профиль НС-35x1000-A	+998908287415	200000.00	FIXED	\N	0	\N	WHOLESALE	7	\N	35x1000-a	39
6	2026-07-20 11:04:32.343657	\N	t	\N	2026-08-14 15:28:10.654636	{}	6	3	UZS	\N	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A (ПЭ-01-6005-0,45) широко применяется в Ташкенте для монтажа кровли. Представляет собой лист оцинкованной стали с покрытием. Общая толщина металла с оцинковкой и декоративно-защитным слоем — 0.45 мм.После проката на специальном оборудовании металл принимает волнообразный вид. Такая конфигурация придает профилю жёсткость.	0	0	f	300	APPROVED	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A	+998908287415	300000.00	FIXED	\N	0	\N	WHOLESALE	7	\N	35x1000-a-1	33
7	2026-07-20 11:06:19.834692	\N	t	\N	2026-08-14 15:28:10.706085	{}	6	3	UZS	\N	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A (ПЭ-01-2004-0,45) широко применяется в Ташкенте для оформления кровли. Изначально он представляет собой металлический оцинкованный лист с покрытием. Толщина стальной основы с оцинковкой и полимерным покрытием составляет 0.45 мм.После проката на специальном оборудовании сталь принимает волнообразный вид. Несущая способность такого листа на порядок выше плоского.	0	0	f	200	APPROVED	Профлист МЕТАЛЛ ПРОФИЛЬ НС-35x1000-A	+998908287415	200000.00	FIXED	\N	0	\N	WHOLESALE	7	\N	35x1000-a-2	24
10	2026-08-02 21:51:06.073	\N	t	\N	2026-08-14 15:28:11.138652	{}	7	7	UZS	\N	A500C markali armatura qurilish va temir-beton konstruksiyalar uchun mo'ljallangan. Mustahkamligi yuqori, payvandlashga mos, GOST va O'zDSt standartlariga javob beradi.	0	0	f	1000	APPROVED	Armatura A500C Ø12 mm	+998995092376	9200.00	FIXED	\N	0	\N	WHOLESALE	5	\N	armatura-a500c-12-mm	18
12	2026-08-02 22:01:41.325106	\N	t	\N	2026-08-14 15:28:11.146217	{}	6	7	UZS	\N	4 mm qalinlikdagi po'lat list sanoat va ishlab chiqarish ehtiyojlari uchun.	0	0	f	500	APPROVED	Po'lat list 4 mm	+998995092376	9900.00	FIXED	\N	0	\N	WHOLESALE	5	\N	po-lat-list-4-mm	16
11	2026-08-02 21:56:46.665739	\N	t	\N	2026-08-14 15:28:11.146607	{}	6	7	UZS	\N	Issiq prokat usulida ishlab chiqarilgan po'lat list. Qurilish, ishlab chiqarish va metall konstruksiyalar tayyorlashda ishlatiladi.	0	0	f	500	APPROVED	Issiq prokat po'lat list 2 mm	+998995092376	9800.00	FIXED	\N	0	\N	WHOLESALE	5	\N	issiq-prokat-po-lat-list-2-mm	13
9	2026-07-20 11:11:43.944325	\N	t	\N	2026-08-14 15:28:11.155337	{}	7	3	UZS	\N	Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP (ПЭ-01-9003-0.5) — долговечный, лёгкий, износостойкий материал для кровли. Он производится из оцинкованной стали. В качестве защитного барьера применено покрытие NormanMP®. Общая толщина оцинкованной стали и декоративно-защитного покрытия — 0.5 мм. Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP (ПЭ-01-9003-0.5) хорошо подходит как для малоэтажного строительства, так и для крупных объектов.	0	0	f	300	APPROVED	Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP	+998908287415	180000.00	FIXED	\N	0	\N	WHOLESALE	7	\N	x-normanmp-1	24
8	2026-07-20 11:09:06.361388	\N	t	\N	2026-08-14 15:28:11.137283	{}	7	3	UZS	\N	Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP (ПЭ-01-8017-0.5) — надёжный, износостойкий, маловесный кровельный материал. Он выполнен из стали заводской оцинковки. В качестве защиты использовано покрытие NormanMP®. Толщина оцинкованной стальной основы и декоративно-защитного покрытия — 0.5 мм. Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP (ПЭ-01-8017-0.5) отлично подходит как для малоэтажного строительства, так и для крупных объектов.	0	0	f	100	APPROVED	Металлочерепица МЕТАЛЛ ПРОФИЛЬ Ламонтерра X NormanMP	+998908287415	100000.00	FIXED	\N	0	\N	WHOLESALE	7	\N	x-normanmp	40
\.


--
-- Name: banners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.banners_id_seq', 30, true);


--
-- Name: favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.favorite_id_seq', 11, true);


--
-- Name: product_reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.product_reviews_id_seq', 3, true);


--
-- Name: product_views_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.product_views_id_seq', 290, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.products_id_seq', 12, true);


--
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- Name: favorite favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (id);


--
-- Name: product_image product_image_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT product_image_pkey PRIMARY KEY (id);


--
-- Name: product_reviews product_reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT product_reviews_pkey PRIMARY KEY (id);


--
-- Name: product_views product_views_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.product_views
    ADD CONSTRAINT product_views_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: favorite ukn6hjh97qa17neh73nf18n80dx; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.favorite
    ADD CONSTRAINT ukn6hjh97qa17neh73nf18n80dx UNIQUE (user_id, product_id);


--
-- Name: products ukostq1ec3toafnjok09y9l7dox; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT ukostq1ec3toafnjok09y9l7dox UNIQUE (slug);


--
-- Name: product_reviews uq_product_reviews_product_buyer; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT uq_product_reviews_product_buyer UNIQUE (product_id, buyer_id);


--
-- Name: product_image fk1n91c4vdhw8pa4frngs4qbbvs; Type: FK CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.product_image
    ADD CONSTRAINT fk1n91c4vdhw8pa4frngs4qbbvs FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: product_reviews fk35kxxqe2g9r4mww80w9e3tnw9; Type: FK CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.product_reviews
    ADD CONSTRAINT fk35kxxqe2g9r4mww80w9e3tnw9 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- PostgreSQL database dump complete
--

\unrestrict CI4BnFXyqqyH8OdeZuOVD5NS0RpWazphpSW5sK5k2Oy6AB1IgeaOPdEAxeYd4Es

--
-- Database "skalad_market_report" dump
--

--
-- PostgreSQL database dump
--

\restrict ksQEmhaOqfE6WCzsL5bMUF6ntB43yZ8LULddOmu6Il7P77OyZcWiGcSWiMi5bc1

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_report; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_report WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_report OWNER TO sklad_user;

\unrestrict ksQEmhaOqfE6WCzsL5bMUF6ntB43yZ8LULddOmu6Il7P77OyZcWiGcSWiMi5bc1
\connect skalad_market_report
\restrict ksQEmhaOqfE6WCzsL5bMUF6ntB43yZ8LULddOmu6Il7P77OyZcWiGcSWiMi5bc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: report; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.report (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    comment character varying(255),
    reason_code character varying(255),
    reporter_user_id bigint,
    resolution_note character varying(255),
    resolved_at timestamp(6) without time zone,
    resolved_by bigint,
    status character varying(255),
    target_id bigint,
    target_type character varying(255),
    CONSTRAINT report_reason_code_check CHECK (((reason_code)::text = ANY ((ARRAY['SAME'::character varying, 'FAKE'::character varying, 'OFFENSIVE'::character varying, 'DUPLICATE'::character varying, 'SCAM'::character varying])::text[]))),
    CONSTRAINT report_status_check CHECK (((status)::text = ANY ((ARRAY['NEW'::character varying, 'RESOLVED'::character varying, 'REJECTED'::character varying])::text[]))),
    CONSTRAINT report_target_type_check CHECK (((target_type)::text = ANY ((ARRAY['PRODUCT'::character varying, 'COMPANY'::character varying, 'CHAT'::character varying])::text[])))
);


ALTER TABLE public.report OWNER TO sklad_user;

--
-- Name: report_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.report ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.report (id, created_by, created_date, deleted, modified_by, modified_date, comment, reason_code, reporter_user_id, resolution_note, resolved_at, resolved_by, status, target_id, target_type) FROM stdin;
1	\N	2026-08-02 21:39:21.255248	f	\N	\N	bu soxta	FAKE	5	\N	\N	\N	NEW	7	COMPANY
2	\N	2026-08-17 15:25:40.629204	f	\N	\N	тест жалоба	DUPLICATE	7	Нарушение правил платформы не дублтруйте полк	2026-08-17 15:26:44.751448	6	RESOLVED	6	COMPANY
\.


--
-- Name: report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.report_id_seq', 2, true);


--
-- Name: report report_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict ksQEmhaOqfE6WCzsL5bMUF6ntB43yZ8LULddOmu6Il7P77OyZcWiGcSWiMi5bc1

--
-- Database "skalad_market_user" dump
--

--
-- PostgreSQL database dump
--

\restrict kLEiu22OpbKvc8o5m8G30MDEqs7AzuExEp4kSjO7LHUlsQkUKEDSyKEuK4ulBWp

-- Dumped from database version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: skalad_market_user; Type: DATABASE; Schema: -; Owner: sklad_user
--

CREATE DATABASE skalad_market_user WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE skalad_market_user OWNER TO sklad_user;

\unrestrict kLEiu22OpbKvc8o5m8G30MDEqs7AzuExEp4kSjO7LHUlsQkUKEDSyKEuK4ulBWp
\connect skalad_market_user
\restrict kLEiu22OpbKvc8o5m8G30MDEqs7AzuExEp4kSjO7LHUlsQkUKEDSyKEuK4ulBWp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO sklad_user;

--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: sklad_user
--

CREATE TABLE public.users_profile (
    id bigint NOT NULL,
    created_by bigint,
    created_date timestamp(6) without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_by bigint,
    modified_date timestamp(6) without time zone,
    extra_phone character varying(13),
    first_name character varying(255),
    keycloak_id character varying(255),
    last_name character varying(255),
    password character varying(255),
    photo_id character varying(255),
    "position" character varying(255),
    roles character varying(255),
    status character varying(255),
    telegram character varying(255),
    user_id bigint NOT NULL,
    username character varying(255),
    warning_count integer,
    CONSTRAINT users_profile_roles_check CHECK (((roles)::text = ANY ((ARRAY['ADMIN'::character varying, 'SUPER_ADMIN'::character varying, 'BUYER'::character varying, 'SELLER'::character varying])::text[]))),
    CONSTRAINT users_profile_status_check CHECK (((status)::text = ANY ((ARRAY['IN_REGISTRATION'::character varying, 'ACTIVE'::character varying, 'BLOCK'::character varying])::text[])))
);


ALTER TABLE public.users_profile OWNER TO sklad_user;

--
-- Name: users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: sklad_user
--

ALTER TABLE public.users_profile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	1	<< Flyway Baseline >>	BASELINE	<< Flyway Baseline >>	\N	sklad_user	2026-07-17 21:37:04.315073	0	t
2	2	users-create	SQL	V2__users-create.sql	204743800	sklad_user	2026-07-17 21:37:04.412987	36	t
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: sklad_user
--

COPY public.users_profile (id, created_by, created_date, deleted, modified_by, modified_date, extra_phone, first_name, keycloak_id, last_name, password, photo_id, "position", roles, status, telegram, user_id, username, warning_count) FROM stdin;
2	\N	2026-07-17 21:44:25.097824	f	\N	\N	\N	Ibodulloxon	d9dd4c99-9e80-4fe5-94e8-bf0f521b238d	Axmadxonov	$2a$10$5Y4C0qfAkEndrlN1XYWaQe48tZc.mW.i2yR1C92MeIICx37gKIKI.	\N	\N	SELLER	ACTIVE	\N	2	ioa22052005@gmail.com	\N
18	\N	2026-08-17 20:56:40.374507	f	\N	\N	\N	Umid	d18f05f5-81ea-430a-81ec-4ee9c4c9aad5	Xasanov	$2a$10$olxcKynsPK1Q3rM.6ioxRua1GtM4T66ijEWw1Mny91ADx4DY6R2Iy	\N	\N	SELLER	IN_REGISTRATION	\N	18	xasanovumid1@gmail.com	\N
9	\N	2026-07-18 19:50:51.532753	f	\N	\N	\N	Жанполат	589a1f41-3528-42c1-a336-d79ea2c36a0d	Ережепбаев	$2a$10$9U8aTE/3YBhtr4jR4Z8uEOXfnpNU1/Pu3i9NfqMAXZjd2K0S9hNHW	\N	\N	ADMIN	ACTIVE	\N	9	erezepbaevzanpolat4@gmail.com	\N
7	\N	2026-07-18 18:21:50.437189	f	\N	\N	+998908287415	Mumin	56a3878b-988c-4e31-9a1b-4dc3a65211f2	Toxtaxodjayev	$2a$10$Q5wvdk353kUf7lWaS5LLxOxDh.Ku7ZwWz/hgNDSUVcG5m6QfS6MdC	c57abdd7-b07c-42d0-9f13-58b95611c4d1.jpg	менеджер по продажам	SELLER	ACTIVE	@Emin_imamov	7	m6mintm@gmail.com	\N
10	\N	2026-07-19 01:34:19.287461	f	\N	\N	\N	John	e28ab8ce-2d4e-4b25-8f4b-c8f7b3ec934b	John	$2a$10$s88ovOWSN2wW1F5Z38082ep08LCHdDRKEwGmpLMVoIY3iBY8Nt.mi	\N	\N	BUYER	IN_REGISTRATION	\N	10	johnsilver@gmail.com	\N
19	\N	2026-08-20 16:19:34.860773	f	\N	\N	\N	samandar	7088defa-5709-47ce-a1d7-5d4cd0267ad5	Urazbaev	$2a$10$hWfyhFdX9GLpw8Eci11RLujDs7FwKz3uWZYED.Y5HFuEhe8oCZ9L6	\N	\N	BUYER	ACTIVE	\N	19	samandarorazbaev838@gmail.com	\N
11	\N	2026-07-19 01:41:57.611692	f	\N	\N	\N	John	a1bb0d83-bc7a-4335-87d3-8d93bf67c5c1	John	$2a$10$gHsF5rBT7e.VIj0Aw/ODs.nQkllPGJG.XxqU/jJXrjJ03GyXolGAm	\N	\N	SELLER	IN_REGISTRATION	\N	11	admin@crm.com	\N
1	\N	2026-07-17 21:37:04.502878	f	\N	\N	\N	Xojiakbar	9ed8f29b-fecc-4d7c-a788-b6e4b80f8a53	Andaqulov	$2a$10$RJGLMmQ6mok5OYXD2njGdOp.9rA2xDCtmrJ/xaQyewjmPPp12xDG6	02816817-1a82-46f6-80d2-3f156981e3b2.jpg	\N	SUPER_ADMIN	ACTIVE	\N	1	xojiakbarandaqulov@gmail.com	\N
6	\N	2026-07-18 15:41:05.806093	f	\N	\N	+998908287415	Главный	eaa2f99a-3912-42fe-b106-9f3daad92b31	Администратор	$2a$10$QVFX.RtyfBpiDxu0LyzTKO0VBrrAGEBOQA8XjiwfXtzfUtRuAUgiq	90be4d05-1d2f-4855-afb1-84cf7c13b141.jpeg	ПМ	ADMIN	ACTIVE	@Emin_imamov	6	codeuz91@gmail.com	\N
5	\N	2026-07-18 14:03:42.119512	f	\N	\N	\N	Xojiakbar	538b7746-e07c-47b8-a97f-98e24cd11789	Andaqulov	$2a$10$SUGiv/4dBLJADMuD0bDsIuzOXv9SXVYf2s8vBgwqE9P5SO7hTG9ee	4ad38c97-008d-412b-9883-ec714137c27c.jpg	\N	SELLER	ACTIVE	\N	5	andaqulovxojiakbar@gmail.com	\N
14	\N	2026-07-19 21:47:19.849188	f	\N	\N	\N	Test	ec5fd713-85d3-47e1-8ff4-03636cfa707e	Debug	$2a$10$ioyp78lauaW2OU0/bEWjeuzgqN9kYOqmX78yjQDoRXH6Ie24.0Dky	\N	\N	BUYER	IN_REGISTRATION	\N	14	debugtest_photo_991@example.com	\N
16	\N	2026-07-30 20:58:21.29513	f	\N	\N	\N	Xojiakbar	1ba5c667-a433-4477-9066-b9542c76a6fb	Andaqulov	$2a$10$qkB/V0WrPbcCAu66niMbCuUiM6cDfeSY/J1/yZ31KTZAT8t24fdCS	\N	\N	BUYER	ACTIVE	\N	16	andaqulovxojiakbar0@gmail.com	\N
3	\N	2026-07-17 22:03:25.986565	f	\N	\N	+998901234567	Xojiakbar	497e7033-bce5-4f5b-9cbd-7abeafb87a22	Andaqulov	$2a$10$n8yO04ZA/FHlnFP69sAVIezxKX2eeM6kvoHrnK70dGRGLS9EpBIT6	e7a1ba83-8780-465f-8ecf-b33e32c9380d.jpg	sotuv menejeri	SELLER	ACTIVE	@Xojiakbar_Andaqulov	3	hojiakbarandaqulov5@gmail.com	\N
17	\N	2026-08-14 09:07:32.091595	f	\N	\N	\N	jamshid	481bcf6e-f191-4f19-aac1-a3130923727f	erkinov	$2a$10$pqAP9HiZmiS.ZLQqtelije1gV9r/EemSDY7PBdHRFcbUztSISEHuu	\N	\N	BUYER	ACTIVE	\N	17	jamaeu22@gmail.com	\N
13	\N	2026-07-19 17:54:33.735813	f	\N	\N	\N	John	bb12b678-f061-4ec0-b474-6d2563370637	John	$2a$10$6SFkIzl4TBtY8ujlBYvwDuZZP0dNYCd3q8uFYOUzloIlBZweFMCxm	\N	\N	BUYER	BLOCK	\N	13	john@mail.ru	\N
12	\N	2026-07-19 17:24:40.95094	f	\N	\N	\N	Roxa	b8e33ee1-1d7f-4d01-b462-f9ec0c7cfdeb	Roxa	$2a$10$wQoRQWK8iw2NedmTGJ/YRO9DpyXYlhSB7Pa/uYRgeIjOSXaItOgG2	5840c3a3-a98b-4a50-8b67-dab065d347e5.png	\N	SELLER	ACTIVE	\N	12	gayipbaevrawshanbek@gmail.com	\N
4	\N	2026-07-18 11:01:24.95306	f	\N	\N	+998901234567	John	7af1caa8-1e44-4e1a-8dc8-8f03b10ff50a	Silver	$2a$10$50lewW2uh7yDPihFYdyKgeaj.x4NMq4V2dV.8F1UhS7a/rpJXc4K2	cd87460a-43ab-4b03-a79b-960d6104452b.png	Stuvchi	ADMIN	ACTIVE	@username	4	dcdcecdvevehf@gmail.com	\N
15	\N	2026-07-28 08:44:37.695563	f	\N	\N	\N	Шухрат	35fb513b-4db1-451d-9938-f701ecae3f0e	Усманходжаев	$2a$10$ajJ3NyEiLamHNS86Oc0MaeivzYT6qtHIgjaC.TTq0.b3p4dQb80DG	\N	\N	SELLER	ACTIVE	\N	15	shuxrat200068@gmail.com	1
8	\N	2026-07-18 18:31:44.439503	f	\N	\N	\N	John	a88f1686-f48a-4528-9d24-1ede698cfca1	John	$2a$10$YoSDV1OTJy2KbMxBxTVp0e8Mo0FYoXrkS72UL4oBheGuJfoozOXOG	d5fe5199-5473-4a2c-8da6-14634c68e07d.png	\N	BUYER	ACTIVE	\N	8	genshinimpact19064@gmail.com	\N
\.


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sklad_user
--

SELECT pg_catalog.setval('public.users_profile_id_seq', 19, true);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: users_profile uk1iojswjslloyw6cug5v25qlb8; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT uk1iojswjslloyw6cug5v25qlb8 UNIQUE (keycloak_id);


--
-- Name: users_profile ukmg2oevxbqtux5limir8b0vjx6; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT ukmg2oevxbqtux5limir8b0vjx6 UNIQUE (user_id);


--
-- Name: users_profile users_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: sklad_user
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: sklad_user
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- PostgreSQL database dump complete
--

\unrestrict kLEiu22OpbKvc8o5m8G30MDEqs7AzuExEp4kSjO7LHUlsQkUKEDSyKEuK4ulBWp

--
-- PostgreSQL database cluster dump complete
--

