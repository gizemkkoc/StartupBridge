PGDMP      ;            
    |            StartupBridge    17.0    17.0 m    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    StartupBridge    DATABASE     q   CREATE DATABASE "StartupBridge" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "StartupBridge";
                     postgres    false            �            1259    16559    admin_actions    TABLE       CREATE TABLE public.admin_actions (
    action_id integer NOT NULL,
    admin_id integer,
    action_type character varying(50),
    target_id integer,
    action_description text,
    action_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT admin_actions_action_type_check CHECK (((action_type)::text = ANY ((ARRAY['Kullanıcı Yönetimi'::character varying, 'Proje Yönetimi'::character varying, 'İçerik Yönetimi'::character varying, 'Bildirim'::character varying])::text[])))
);
 !   DROP TABLE public.admin_actions;
       public         heap r       postgres    false            �            1259    16558    admin_actions_action_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_actions_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.admin_actions_action_id_seq;
       public               postgres    false    242            �           0    0    admin_actions_action_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.admin_actions_action_id_seq OWNED BY public.admin_actions.action_id;
          public               postgres    false    241            �            1259    16507    blog    TABLE     �  CREATE TABLE public.blog (
    blog_id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    category character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    author_id integer,
    CONSTRAINT blog_category_check CHECK (((category)::text = ANY ((ARRAY['Sektörel Haberler'::character varying, 'Rehberler ve Kılavuzlar'::character varying, 'Başarı Hikayeleri'::character varying])::text[])))
);
    DROP TABLE public.blog;
       public         heap r       postgres    false            �            1259    16506    blog_blog_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_blog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.blog_blog_id_seq;
       public               postgres    false    236            �           0    0    blog_blog_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.blog_blog_id_seq OWNED BY public.blog.blog_id;
          public               postgres    false    235            �            1259    16523    comments    TABLE     �   CREATE TABLE public.comments (
    comment_id integer NOT NULL,
    blog_id integer,
    user_id integer,
    comment_text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.comments;
       public         heap r       postgres    false            �            1259    16522    comments_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.comments_comment_id_seq;
       public               postgres    false    238            �           0    0    comments_comment_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.comments_comment_id_seq OWNED BY public.comments.comment_id;
          public               postgres    false    237            �            1259    16481    communication_preferences    TABLE     �   CREATE TABLE public.communication_preferences (
    preference_id integer NOT NULL,
    investor_id integer,
    meeting_preference character varying(50),
    contact_channels text
);
 -   DROP TABLE public.communication_preferences;
       public         heap r       postgres    false            �            1259    16480 +   communication_preferences_preference_id_seq    SEQUENCE     �   CREATE SEQUENCE public.communication_preferences_preference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.communication_preferences_preference_id_seq;
       public               postgres    false    232            �           0    0 +   communication_preferences_preference_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.communication_preferences_preference_id_seq OWNED BY public.communication_preferences.preference_id;
          public               postgres    false    231            �            1259    16414 	   education    TABLE     �   CREATE TABLE public.education (
    education_id integer NOT NULL,
    entrepreneur_id integer,
    school_name character varying(100),
    degree character varying(50),
    graduation_year integer
);
    DROP TABLE public.education;
       public         heap r       postgres    false            �            1259    16413    education_education_id_seq    SEQUENCE     �   CREATE SEQUENCE public.education_education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.education_education_id_seq;
       public               postgres    false    222            �           0    0    education_education_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.education_education_id_seq OWNED BY public.education.education_id;
          public               postgres    false    221            �            1259    16390    entrepreneurs    TABLE     }  CREATE TABLE public.entrepreneurs (
    entrepreneur_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    profile_picture text,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    bio text,
    phone_number character varying(15),
    phone_visibility boolean DEFAULT true
);
 !   DROP TABLE public.entrepreneurs;
       public         heap r       postgres    false            �            1259    16389 !   entrepreneurs_entrepreneur_id_seq    SEQUENCE     �   CREATE SEQUENCE public.entrepreneurs_entrepreneur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.entrepreneurs_entrepreneur_id_seq;
       public               postgres    false    218            �           0    0 !   entrepreneurs_entrepreneur_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.entrepreneurs_entrepreneur_id_seq OWNED BY public.entrepreneurs.entrepreneur_id;
          public               postgres    false    217            �            1259    16426 
   experience    TABLE     �   CREATE TABLE public.experience (
    experience_id integer NOT NULL,
    entrepreneur_id integer,
    company_name character varying(100),
    "position" character varying(50),
    description text,
    duration_years integer
);
    DROP TABLE public.experience;
       public         heap r       postgres    false            �            1259    16425    experience_experience_id_seq    SEQUENCE     �   CREATE SEQUENCE public.experience_experience_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.experience_experience_id_seq;
       public               postgres    false    224            �           0    0    experience_experience_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.experience_experience_id_seq OWNED BY public.experience.experience_id;
          public               postgres    false    223            �            1259    16440 	   expertise    TABLE     �   CREATE TABLE public.expertise (
    expertise_id integer NOT NULL,
    entrepreneur_id integer,
    skill_name character varying(100)
);
    DROP TABLE public.expertise;
       public         heap r       postgres    false            �            1259    16439    expertise_expertise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expertise_expertise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.expertise_expertise_id_seq;
       public               postgres    false    226            �           0    0    expertise_expertise_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.expertise_expertise_id_seq OWNED BY public.expertise.expertise_id;
          public               postgres    false    225            �            1259    16495    interests_and_values    TABLE     �   CREATE TABLE public.interests_and_values (
    interest_id integer NOT NULL,
    investor_id integer,
    social_impact boolean,
    interest_area character varying(100)
);
 (   DROP TABLE public.interests_and_values;
       public         heap r       postgres    false            �            1259    16494 $   interests_and_values_interest_id_seq    SEQUENCE     �   CREATE SEQUENCE public.interests_and_values_interest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.interests_and_values_interest_id_seq;
       public               postgres    false    234            �           0    0 $   interests_and_values_interest_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.interests_and_values_interest_id_seq OWNED BY public.interests_and_values.interest_id;
          public               postgres    false    233            �            1259    16467    investment_portfolio    TABLE     �   CREATE TABLE public.investment_portfolio (
    portfolio_id integer NOT NULL,
    investor_id integer,
    invested_company_name character varying(100),
    investment_date date,
    description text
);
 (   DROP TABLE public.investment_portfolio;
       public         heap r       postgres    false            �            1259    16466 %   investment_portfolio_portfolio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.investment_portfolio_portfolio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.investment_portfolio_portfolio_id_seq;
       public               postgres    false    230            �           0    0 %   investment_portfolio_portfolio_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.investment_portfolio_portfolio_id_seq OWNED BY public.investment_portfolio.portfolio_id;
          public               postgres    false    229            �            1259    16402 	   investors    TABLE     �  CREATE TABLE public.investors (
    investor_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    profile_picture text,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    bio text,
    phone_number character varying(15),
    phone_visibility boolean DEFAULT true,
    location character varying(100)
);
    DROP TABLE public.investors;
       public         heap r       postgres    false            �            1259    16401    investors_investor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.investors_investor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.investors_investor_id_seq;
       public               postgres    false    220            �           0    0    investors_investor_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.investors_investor_id_seq OWNED BY public.investors.investor_id;
          public               postgres    false    219            �            1259    16452    projects    TABLE     �  CREATE TABLE public.projects (
    project_id integer NOT NULL,
    entrepreneur_id integer,
    project_name character varying(100) NOT NULL,
    short_description text,
    target_sector character varying(50),
    stage character varying(50),
    budget_needed numeric(15,2),
    revenue_model character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.projects;
       public         heap r       postgres    false            �            1259    16451    projects_project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.projects_project_id_seq;
       public               postgres    false    228            �           0    0    projects_project_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.projects_project_id_seq OWNED BY public.projects.project_id;
          public               postgres    false    227            �            1259    16543    user_settings    TABLE     �   CREATE TABLE public.user_settings (
    setting_id integer NOT NULL,
    user_id integer,
    notification_preferences jsonb,
    profile_visibility boolean DEFAULT true,
    favorite_projects boolean DEFAULT false
);
 !   DROP TABLE public.user_settings;
       public         heap r       postgres    false            �            1259    16542    user_settings_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_settings_setting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.user_settings_setting_id_seq;
       public               postgres    false    240            �           0    0    user_settings_setting_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.user_settings_setting_id_seq OWNED BY public.user_settings.setting_id;
          public               postgres    false    239            �           2604    16562    admin_actions action_id    DEFAULT     �   ALTER TABLE ONLY public.admin_actions ALTER COLUMN action_id SET DEFAULT nextval('public.admin_actions_action_id_seq'::regclass);
 F   ALTER TABLE public.admin_actions ALTER COLUMN action_id DROP DEFAULT;
       public               postgres    false    241    242    242            �           2604    16510    blog blog_id    DEFAULT     l   ALTER TABLE ONLY public.blog ALTER COLUMN blog_id SET DEFAULT nextval('public.blog_blog_id_seq'::regclass);
 ;   ALTER TABLE public.blog ALTER COLUMN blog_id DROP DEFAULT;
       public               postgres    false    236    235    236            �           2604    16526    comments comment_id    DEFAULT     z   ALTER TABLE ONLY public.comments ALTER COLUMN comment_id SET DEFAULT nextval('public.comments_comment_id_seq'::regclass);
 B   ALTER TABLE public.comments ALTER COLUMN comment_id DROP DEFAULT;
       public               postgres    false    238    237    238            �           2604    16484 '   communication_preferences preference_id    DEFAULT     �   ALTER TABLE ONLY public.communication_preferences ALTER COLUMN preference_id SET DEFAULT nextval('public.communication_preferences_preference_id_seq'::regclass);
 V   ALTER TABLE public.communication_preferences ALTER COLUMN preference_id DROP DEFAULT;
       public               postgres    false    232    231    232            �           2604    16417    education education_id    DEFAULT     �   ALTER TABLE ONLY public.education ALTER COLUMN education_id SET DEFAULT nextval('public.education_education_id_seq'::regclass);
 E   ALTER TABLE public.education ALTER COLUMN education_id DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    16393    entrepreneurs entrepreneur_id    DEFAULT     �   ALTER TABLE ONLY public.entrepreneurs ALTER COLUMN entrepreneur_id SET DEFAULT nextval('public.entrepreneurs_entrepreneur_id_seq'::regclass);
 L   ALTER TABLE public.entrepreneurs ALTER COLUMN entrepreneur_id DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    16429    experience experience_id    DEFAULT     �   ALTER TABLE ONLY public.experience ALTER COLUMN experience_id SET DEFAULT nextval('public.experience_experience_id_seq'::regclass);
 G   ALTER TABLE public.experience ALTER COLUMN experience_id DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    16443    expertise expertise_id    DEFAULT     �   ALTER TABLE ONLY public.expertise ALTER COLUMN expertise_id SET DEFAULT nextval('public.expertise_expertise_id_seq'::regclass);
 E   ALTER TABLE public.expertise ALTER COLUMN expertise_id DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    16498     interests_and_values interest_id    DEFAULT     �   ALTER TABLE ONLY public.interests_and_values ALTER COLUMN interest_id SET DEFAULT nextval('public.interests_and_values_interest_id_seq'::regclass);
 O   ALTER TABLE public.interests_and_values ALTER COLUMN interest_id DROP DEFAULT;
       public               postgres    false    234    233    234            �           2604    16470 !   investment_portfolio portfolio_id    DEFAULT     �   ALTER TABLE ONLY public.investment_portfolio ALTER COLUMN portfolio_id SET DEFAULT nextval('public.investment_portfolio_portfolio_id_seq'::regclass);
 P   ALTER TABLE public.investment_portfolio ALTER COLUMN portfolio_id DROP DEFAULT;
       public               postgres    false    230    229    230            �           2604    16405    investors investor_id    DEFAULT     ~   ALTER TABLE ONLY public.investors ALTER COLUMN investor_id SET DEFAULT nextval('public.investors_investor_id_seq'::regclass);
 D   ALTER TABLE public.investors ALTER COLUMN investor_id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    16455    projects project_id    DEFAULT     z   ALTER TABLE ONLY public.projects ALTER COLUMN project_id SET DEFAULT nextval('public.projects_project_id_seq'::regclass);
 B   ALTER TABLE public.projects ALTER COLUMN project_id DROP DEFAULT;
       public               postgres    false    227    228    228            �           2604    16546    user_settings setting_id    DEFAULT     �   ALTER TABLE ONLY public.user_settings ALTER COLUMN setting_id SET DEFAULT nextval('public.user_settings_setting_id_seq'::regclass);
 G   ALTER TABLE public.user_settings ALTER COLUMN setting_id DROP DEFAULT;
       public               postgres    false    239    240    240            �          0    16559    admin_actions 
   TABLE DATA           z   COPY public.admin_actions (action_id, admin_id, action_type, target_id, action_description, action_timestamp) FROM stdin;
    public               postgres    false    242   ݑ       �          0    16507    blog 
   TABLE DATA           X   COPY public.blog (blog_id, title, content, category, created_at, author_id) FROM stdin;
    public               postgres    false    236   ��       �          0    16523    comments 
   TABLE DATA           Z   COPY public.comments (comment_id, blog_id, user_id, comment_text, created_at) FROM stdin;
    public               postgres    false    238   �       �          0    16481    communication_preferences 
   TABLE DATA           u   COPY public.communication_preferences (preference_id, investor_id, meeting_preference, contact_channels) FROM stdin;
    public               postgres    false    232   4�       �          0    16414 	   education 
   TABLE DATA           h   COPY public.education (education_id, entrepreneur_id, school_name, degree, graduation_year) FROM stdin;
    public               postgres    false    222   Q�       �          0    16390    entrepreneurs 
   TABLE DATA           �   COPY public.entrepreneurs (entrepreneur_id, first_name, last_name, profile_picture, email, password, bio, phone_number, phone_visibility) FROM stdin;
    public               postgres    false    218   n�       �          0    16426 
   experience 
   TABLE DATA           {   COPY public.experience (experience_id, entrepreneur_id, company_name, "position", description, duration_years) FROM stdin;
    public               postgres    false    224   ��       �          0    16440 	   expertise 
   TABLE DATA           N   COPY public.expertise (expertise_id, entrepreneur_id, skill_name) FROM stdin;
    public               postgres    false    226   ��       �          0    16495    interests_and_values 
   TABLE DATA           f   COPY public.interests_and_values (interest_id, investor_id, social_impact, interest_area) FROM stdin;
    public               postgres    false    234   Œ       �          0    16467    investment_portfolio 
   TABLE DATA           ~   COPY public.investment_portfolio (portfolio_id, investor_id, invested_company_name, investment_date, description) FROM stdin;
    public               postgres    false    230   �       �          0    16402 	   investors 
   TABLE DATA           �   COPY public.investors (investor_id, first_name, last_name, profile_picture, email, password, bio, phone_number, phone_visibility, location) FROM stdin;
    public               postgres    false    220   ��       �          0    16452    projects 
   TABLE DATA           �   COPY public.projects (project_id, entrepreneur_id, project_name, short_description, target_sector, stage, budget_needed, revenue_model, created_at) FROM stdin;
    public               postgres    false    228   �       �          0    16543    user_settings 
   TABLE DATA           }   COPY public.user_settings (setting_id, user_id, notification_preferences, profile_visibility, favorite_projects) FROM stdin;
    public               postgres    false    240   9�       �           0    0    admin_actions_action_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.admin_actions_action_id_seq', 1, false);
          public               postgres    false    241            �           0    0    blog_blog_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.blog_blog_id_seq', 1, false);
          public               postgres    false    235            �           0    0    comments_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.comments_comment_id_seq', 1, false);
          public               postgres    false    237            �           0    0 +   communication_preferences_preference_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.communication_preferences_preference_id_seq', 1, false);
          public               postgres    false    231            �           0    0    education_education_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.education_education_id_seq', 1, false);
          public               postgres    false    221            �           0    0 !   entrepreneurs_entrepreneur_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.entrepreneurs_entrepreneur_id_seq', 1, true);
          public               postgres    false    217            �           0    0    experience_experience_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.experience_experience_id_seq', 1, false);
          public               postgres    false    223            �           0    0    expertise_expertise_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.expertise_expertise_id_seq', 1, false);
          public               postgres    false    225            �           0    0 $   interests_and_values_interest_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.interests_and_values_interest_id_seq', 1, false);
          public               postgres    false    233            �           0    0 %   investment_portfolio_portfolio_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.investment_portfolio_portfolio_id_seq', 1, false);
          public               postgres    false    229            �           0    0    investors_investor_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.investors_investor_id_seq', 1, false);
          public               postgres    false    219            �           0    0    projects_project_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.projects_project_id_seq', 1, false);
          public               postgres    false    227            �           0    0    user_settings_setting_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.user_settings_setting_id_seq', 1, false);
          public               postgres    false    239            �           2606    16568     admin_actions admin_actions_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.admin_actions
    ADD CONSTRAINT admin_actions_pkey PRIMARY KEY (action_id);
 J   ALTER TABLE ONLY public.admin_actions DROP CONSTRAINT admin_actions_pkey;
       public                 postgres    false    242            �           2606    16516    blog blog_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_pkey PRIMARY KEY (blog_id);
 8   ALTER TABLE ONLY public.blog DROP CONSTRAINT blog_pkey;
       public                 postgres    false    236            �           2606    16531    comments comments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public                 postgres    false    238            �           2606    16488 8   communication_preferences communication_preferences_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.communication_preferences
    ADD CONSTRAINT communication_preferences_pkey PRIMARY KEY (preference_id);
 b   ALTER TABLE ONLY public.communication_preferences DROP CONSTRAINT communication_preferences_pkey;
       public                 postgres    false    232            �           2606    16419    education education_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (education_id);
 B   ALTER TABLE ONLY public.education DROP CONSTRAINT education_pkey;
       public                 postgres    false    222            �           2606    16400 %   entrepreneurs entrepreneurs_email_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.entrepreneurs
    ADD CONSTRAINT entrepreneurs_email_key UNIQUE (email);
 O   ALTER TABLE ONLY public.entrepreneurs DROP CONSTRAINT entrepreneurs_email_key;
       public                 postgres    false    218            �           2606    16398     entrepreneurs entrepreneurs_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.entrepreneurs
    ADD CONSTRAINT entrepreneurs_pkey PRIMARY KEY (entrepreneur_id);
 J   ALTER TABLE ONLY public.entrepreneurs DROP CONSTRAINT entrepreneurs_pkey;
       public                 postgres    false    218            �           2606    16433    experience experience_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.experience
    ADD CONSTRAINT experience_pkey PRIMARY KEY (experience_id);
 D   ALTER TABLE ONLY public.experience DROP CONSTRAINT experience_pkey;
       public                 postgres    false    224            �           2606    16445    expertise expertise_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.expertise
    ADD CONSTRAINT expertise_pkey PRIMARY KEY (expertise_id);
 B   ALTER TABLE ONLY public.expertise DROP CONSTRAINT expertise_pkey;
       public                 postgres    false    226            �           2606    16500 .   interests_and_values interests_and_values_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.interests_and_values
    ADD CONSTRAINT interests_and_values_pkey PRIMARY KEY (interest_id);
 X   ALTER TABLE ONLY public.interests_and_values DROP CONSTRAINT interests_and_values_pkey;
       public                 postgres    false    234            �           2606    16474 .   investment_portfolio investment_portfolio_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.investment_portfolio
    ADD CONSTRAINT investment_portfolio_pkey PRIMARY KEY (portfolio_id);
 X   ALTER TABLE ONLY public.investment_portfolio DROP CONSTRAINT investment_portfolio_pkey;
       public                 postgres    false    230            �           2606    16412    investors investors_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.investors
    ADD CONSTRAINT investors_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.investors DROP CONSTRAINT investors_email_key;
       public                 postgres    false    220            �           2606    16410    investors investors_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.investors
    ADD CONSTRAINT investors_pkey PRIMARY KEY (investor_id);
 B   ALTER TABLE ONLY public.investors DROP CONSTRAINT investors_pkey;
       public                 postgres    false    220            �           2606    16460    projects projects_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public                 postgres    false    228            �           2606    16552     user_settings user_settings_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (setting_id);
 J   ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_pkey;
       public                 postgres    false    240            �           2606    16569 )   admin_actions admin_actions_admin_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin_actions
    ADD CONSTRAINT admin_actions_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.entrepreneurs(entrepreneur_id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.admin_actions DROP CONSTRAINT admin_actions_admin_id_fkey;
       public               postgres    false    3536    242    218            �           2606    16517    blog blog_author_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog
    ADD CONSTRAINT blog_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.entrepreneurs(entrepreneur_id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.blog DROP CONSTRAINT blog_author_id_fkey;
       public               postgres    false    3536    218    236            �           2606    16532    comments comments_blog_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_blog_id_fkey FOREIGN KEY (blog_id) REFERENCES public.blog(blog_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_blog_id_fkey;
       public               postgres    false    238    236    3556            �           2606    16537    comments comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.entrepreneurs(entrepreneur_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public               postgres    false    3536    238    218            �           2606    16489 D   communication_preferences communication_preferences_investor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.communication_preferences
    ADD CONSTRAINT communication_preferences_investor_id_fkey FOREIGN KEY (investor_id) REFERENCES public.investors(investor_id) ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.communication_preferences DROP CONSTRAINT communication_preferences_investor_id_fkey;
       public               postgres    false    232    220    3540            �           2606    16420 (   education education_entrepreneur_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_entrepreneur_id_fkey FOREIGN KEY (entrepreneur_id) REFERENCES public.entrepreneurs(entrepreneur_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.education DROP CONSTRAINT education_entrepreneur_id_fkey;
       public               postgres    false    218    222    3536            �           2606    16434 *   experience experience_entrepreneur_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.experience
    ADD CONSTRAINT experience_entrepreneur_id_fkey FOREIGN KEY (entrepreneur_id) REFERENCES public.entrepreneurs(entrepreneur_id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.experience DROP CONSTRAINT experience_entrepreneur_id_fkey;
       public               postgres    false    3536    218    224            �           2606    16446 (   expertise expertise_entrepreneur_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.expertise
    ADD CONSTRAINT expertise_entrepreneur_id_fkey FOREIGN KEY (entrepreneur_id) REFERENCES public.entrepreneurs(entrepreneur_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.expertise DROP CONSTRAINT expertise_entrepreneur_id_fkey;
       public               postgres    false    218    226    3536            �           2606    16501 :   interests_and_values interests_and_values_investor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.interests_and_values
    ADD CONSTRAINT interests_and_values_investor_id_fkey FOREIGN KEY (investor_id) REFERENCES public.investors(investor_id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.interests_and_values DROP CONSTRAINT interests_and_values_investor_id_fkey;
       public               postgres    false    3540    220    234            �           2606    16475 :   investment_portfolio investment_portfolio_investor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.investment_portfolio
    ADD CONSTRAINT investment_portfolio_investor_id_fkey FOREIGN KEY (investor_id) REFERENCES public.investors(investor_id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.investment_portfolio DROP CONSTRAINT investment_portfolio_investor_id_fkey;
       public               postgres    false    230    3540    220            �           2606    16461 &   projects projects_entrepreneur_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_entrepreneur_id_fkey FOREIGN KEY (entrepreneur_id) REFERENCES public.entrepreneurs(entrepreneur_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_entrepreneur_id_fkey;
       public               postgres    false    3536    218    228            �           2606    16553 (   user_settings user_settings_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.entrepreneurs(entrepreneur_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_user_id_fkey;
       public               postgres    false    218    240    3536            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     