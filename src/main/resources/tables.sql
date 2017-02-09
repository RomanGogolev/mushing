CREATE TABLE public.users
(
  id SERIAL PRIMARY KEY,
  email VARCHAR(64) NOT NULL,
  pass VARCHAR(256) NOT NULL,
  roles VARCHAR(32) DEFAULT 'ROLE_USER',
  fio VARCHARv64) NOT NULL,
  username VARCHAR(32) NOT NULL
);

INSERT INTO public.users(
            id, email, fio, pass, roles, username)
    VALUES (1, 'admin@admin.com', 'Гоголев Роман Александрович', '$2a$10$ZNyscEB1FczQFdzJZO/1YuPbMbpWnKv1W0gMe8q6CjimSjrltmsCi', 'ROLE_USER', 'admin');

CREATE UNIQUE INDEX users_email_uindex ON public.users (email);
CREATE UNIQUE INDEX users_username_uindex ON public.users (username);

CREATE TABLE public.members
(
    id SERIAL PRIMARY KEY NOT NULL,
    fio VARCHAR(64) NOT NULL,
    dateBirth DATE NOT NULL,
    sex VARCHAR(8) NOT NULL,
    phonenumber VARCHAR(16) NOT NULL,
    email VARCHAR(32) NOT NULL,
    dateEnter DATE NOT NULL,
    img VARCHAR(128) NOT NULL
);

CREATE TABLE public.dogs
(
    id SERIAL PRIMARY KEY NOT NULL,
    fullname VARCHAR(32) NOT NULL,
    ownername VARCHAR(32) NOT NULL,
    dateBirth DATE NOT NULL,
    markNumber VARCHAR(32),
    numberPedigree VARCHAR(32),
    numberChip VARCHAR(32),
    fcigroup VARCHAR(32)
);

CREATE TABLE public.ranks
(
    id SERIAL PRIMARY KEY NOT NULL,
    rank VARCHAR(32) NOT NULL
);

CREATE TABLE public.events
(
    id SERIAL PRIMARY KEY,
    headerEvent VARCHAR(32) NOT NULL,
    dateStart DATE NOT NULL,
    idrank INT NOT NULL,
    place VARCHAR(32),
    organizers VARCHAR(128),
    season VARCHAR(8),
    CONSTRAINT events_ranks_id_fk FOREIGN KEY (idrank) REFERENCES ranks (id)
);

CREATE TABLE public.breeds
(
    id SERIAL NOT NULL,
    breed VARCHAR(32)
);

CREATE TABLE public.federations
(
    id SERIAL NOT NULL,
    federation VARCHAR(32)
);

CREATE TABLE public.classes
(
    id SERIAL NOT NULL,
    classrace VARCHAR(32) NOT NULL,
    season VARCHAR(8) NOT NULL
);

CREATE TABLE public.membersevent
(
    id SERIAL NOT NULL PRIMARY KEY,
    idevent INT NOT NULL,
    fio VARCHAR(64) NOT NULL,
    city VARCHAR(32) NOT NULL,
    club VARCHAR(64),
    dateBirth DATE,
    numberphone VARCHAR(32) NOT NULL,
    email VARCHAR(32),
    descr VARCHAR(256),
    idclassrace INT NOT NULL,
    CONSTRAINT membersevent_events_id_fk FOREIGN KEY (idevent) REFERENCES events (id),
    CONSTRAINT membersevent_ranks_id_fk FOREIGN KEY (idclassrace) REFERENCES ranks (id)
);

CREATE TABLE public.dogsevent
(
    id SERIAL NOT NULL,
    idmember INT NOT NULL,
    idevent INT NOT NULL,
    idbreed INT NOT NULL,
    nameonpedigree VARCHAR(32),
    sex VARCHAR(8) NOT NULL,
    dateBirth DATE,
    markNumber VARCHAR(32),
    numberChip VARCHAR(32),
    idfederation INT,
    numberPedigree VARCHAR(16),
    fioOwner VARCHAR(64),
    numberBookKv VARCHAR(32),
    inQualification BOOLEAN NOT NULL
);

CREATE TABLE public.distance
(
    id SERIAL PRIMARY KEY NOT NULL,
    stadion VARCHAR(16) NOT NULL,
    upperdot VARCHAR(8),
    lowerdot VARCHAR(8),
    lengthRound VARCHAR(8),
    countRound VARCHAR(8),
    idevent INT,
    weather VARCHAR(8),
    tsnow VARCHAR(8),
    tair VARCHAR(8),
    view VARCHAR(16)
);

CREATE TABLE public.judges
(
    id SERIAL NOT NULL,
    idevent INT,
    judgefrom VARCHAR(16),
    typeid INT,
    fio VARCHAR(64)
);

CREATE TABLE public.judgetype
(
    id SERIAL NOT NULL,
    type VARCHAR(32) NOT NULL
);

CREATE TABLE public.results
(
    id SERIAL NOT NULL,
    idmember INT,
    starttime TIME,
    endtime TIME,
    positionmember INT,
    idevent INT
);
ALTER TABLE public.results ADD raznost TIME NULL;


