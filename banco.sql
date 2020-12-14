CREATE DATABASE EXPRESSOAPI;

USE EXPRESSOAPI;

CREATE TABLE Client(
    Id INTEGER NOT NULL,
    Email VARCHAR(300) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    acesstoken VARCHAR(100) NOT NULL,
    Document VARCHAR(20) NOT NULL,
    Name VARCHAR(200) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE Api(
    Id INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    PRIMARY KEY(Id) 
);

CREATE TABLE ClientApi(
    ClientId INTEGER NOT NULL,
    ApiId INTEGER NOT NULL,
    Username VARCHAR(300) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    PRIMARY KEY (ClientId, ApiId),
    CONSTRAINT FK_ClientApi_ClientId FOREIGN KEY (ClientId) REFERENCES Client(Id),
    CONSTRAINT FK_ClientApi_ApiId FOREIGN KEY (ApiId) REFERENCES Api(Id)
);

CREATE TABLE ClientConfiguration(
    ClientId INTEGER NOT NULL,
    SMTPHost VARCHAR(50) NOT NULL,
    SMTPUsername VARCHAR(300) NOT NULL,
    SMTPPassword VARCHAR(50) NOT NULL,
    SMTPPort INT NOT NULL,
    TrackingEmailTemplate VARCHAR(300),
    TrackingEmailEventTemplate VARCHAR(300),
    PRIMARY KEY (ClientId),
    CONSTRAINT FK_ClientConfiguration_ClientId FOREIGN KEY (ClientId) REFERENCES Client(Id)
);

CREATE TABLE Planx(
    Id INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    RequestQuantity INT,
    Price DECIMAL(10,2),
    PRIMARY KEY(Id)
);

CREATE TABLE ClientPlan(
    ClientId INTEGER NOT NULL,
    PlanId INTEGER NOT NULL,
    SMSCredits NUMERIC NOT NULL,
    PRIMARY KEY(ClientId, PlanId),
    CONSTRAINT FK_ClientPlan_ClientId FOREIGN KEY (ClientId) REFERENCES Client(Id),
    CONSTRAINT FK_ClientPlan_PlanId FOREIGN KEY (PlanId) REFERENCES Planx(Id)
);
DROP TABLE ClientPlan;

CREATE TABLE ClientApiRequest(
    Id INTEGER NOT NULL,
    ClientId INTEGER NOT NULL,
    PlanId INTEGER NOT NULL,
    DtRequest DATE NOT NULL,
    Url VARCHAR(300) NOT NULL,
    Body VARCHAR(300) NOT NULL,
    ResponseStatus INT NOT NULL,
    ResponseBody VARCHAR(300) NOT NULL,
    PostActions VARCHAR(300) NOT NULL,
    PRIMARY KEY (Id),
    CONSTRAINT FK_ClientApiRequest_ClientId FOREIGN KEY (ClientId) REFERENCES Client(Id),
    CONSTRAINT FK_ClientApiRequest_PlanId FOREIGN KEY (PlanId) REFERENCES Planx(Id)
);

CREATE TABLE ClientPlanHistoy(
    Id INTEGER NOT NULL,
    ClientId INTEGER NOT NULL,
    PlanId INTEGER NOT NULL,
    DtStar DATE,
    DtEnd DATE,
    PRIMARY KEY (Id),
    CONSTRAINT FK_ClientPlanHistoy_ClientId FOREIGN KEY (ClientId) REFERENCES Client(Id),
    CONSTRAINT FK_ClientPlanHistoy_PlanId FOREIGN KEY (PlanId) REFERENCES Planx(Id)
);

insert into Client values(1, "dequimdeveloper@gmail.com", "pass1234", "dequim", "dequim", "dequim", "16987654321");
insert into Client values(2, "sigg@gmail.com", "pass4321", "sigg", "sigg", "sigg", "16123456987");
insert into Client values(3, "gid@gmail.com", "5454pass", "gid", "gid", "gid", "16253614987");
insert into Client values(4, "blaublau@gmail.com", "420420", "blaublau", "blaublau", "blaublau", "16253614987");

insert into Api values (1, "JAMEF");
insert into Api values (2, "RTE");
insert into Api values (3, "GBC");
insert into Api values (4, "ABC");

insert into ClientPlan values (1,1,100);
insert into ClientPlan values (2,2,250);
insert into ClientPlan values (3,3,100);
insert into ClientPlan values (4,4,10);

insert into ClientApi (ClientId, ApiId, Username, Password) values (1, 1, 'Rodonaves', 'Rodo1234');
insert into ClientApi (ClientId, ApiId, Username, Password) values (1, 2, 'Jamef', 'Jamef1234');
insert into ClientApi (ClientId, ApiId, Username, Password) values (1, 3, 'Gte', 'Gte1234');

insert into Planx values (1, "Api 1", 200, 500.00);
insert into Planx values (2, "Api 2", 300, 500.00);
insert into Planx values (3, "GidGod", 500, 500.00);
insert into Planx values (4, "Blau", 50, 5.00);

insert into ClientPlan (ClientId, PlanId, SMSCredits) values (1, 1, 200);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (2, 2, 574);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (3, 3, 695);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (4, 4, 550);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (5, 5, 818);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (6, 6, 597);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (7, 7, 524);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (8, 8, 674);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (9, 9, 622);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (10, 10, 605);
insert into ClientPlan (ClientId, PlanId, SMSCredits) values (11, 11, 2);

insert into ClientApiRequest values(1,1,1,sysdate(),"/api/sms/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(2,1,1,sysdate(),"/api/sms/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(3,1,1,sysdate(),"/api/sms/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(4,1,1,sysdate(),"/api/sms/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(16,1,1,sysdate(),"/api/sms/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(17,1,1,"2020-12-05","/api/sms/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(18,1,1,"2020-12-06","/api/call/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(19,1,1,"2020-12-06","/api/call/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(20,1,2,"2020-12-06","/api/call/send","Teste2",200,"Aproved","Send");
insert into ClientApiRequest values(21,2,2,"2020-12-06","/api/call/send","Teste2",200,"Aproved","Send");
insert into ClientApiRequest values(22,2,2,"2020-12-06","/api/call/send","Teste2",200,"Aproved","Send");
insert into ClientApiRequest values(23,1,1,"2020-12-06","/api/call/send","Teste2",200,"Aproved","Send");
insert into ClientApiRequest values(24,1,1,"2020-12-06","/api/call/send","Teste2",200,"Aproved","Send");
insert into ClientApiRequest values(25,1,1,"2020-12-06","/api/call/send","Teste2",200,"Aproved","Send");
insert into ClientApiRequest values(26,1,1,"2020-12-06","/api/call/send","Teste2",200,"Aproved","Send");
insert into ClientApiRequest values(27,1,1,"2020-12-06","/api/call/send","Teste2",200,"Aproved","Send");
insert into ClientApiRequest values(28,1,1,"2020-12-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(29,1,1,"2020-12-07","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(30,1,1,"2020-12-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(31,1,1,"2020-12-07","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(35,1,1,"2020-12-07","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(36,1,1,"2020-11-07","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(32,11,11,"2020-12-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(33,11,11,"2020-12-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(34,11,11,"2020-12-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(37,1,1,"2020-11-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(38,1,1,"2020-11-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(39,1,1,"2020-11-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(40,1,1,"2020-11-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(41,1,1,"2020-11-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(42,1,1,"2020-11-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(43,1,1,"2020-11-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(44,1,1,"2020-10-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(45,1,1,"2020-10-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(46,1,1,"2020-9-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(47,1,1,"2020-9-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(48,1,1,"2020-9-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(49,1,1,"2020-8-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(50,1,1,"2020-7-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(51,1,1,"2020-7-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(52,1,1,"2020-6-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(53,1,1,"2020-6-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(54,1,1,"2020-5-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(55,1,1,"2020-4-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(56,1,1,"2020-4-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(57,1,1,"2020-3-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(58,1,1,"2020-3-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(59,1,1,"2020-3-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(60,1,1,"2020-2-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(61,1,1,"2020-2-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(62,1,1,"2020-1-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(63,1,1,"2020-1-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(64,1,1,"2020-1-07","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(65,1,1,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(66,1,1,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(67,1,1,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(68,1,1,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(69,1,1,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(70,1,1,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(71,1,1,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(72,1,1,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(73,1,1,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(74,1,1,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(75,2,2,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(76,2,2,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(77,2,2,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(78,2,2,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(79,2,2,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(80,2,2,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(81,2,2,"2020-11-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(82,2,2,"2020-10-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(83,2,2,"2020-09-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(84,2,2,"2020-08-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(85,2,2,"2020-06-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(86,2,2,"2020-05-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(87,3,3,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(88,3,3,"2020-12-10","/api/call/send","Teste3",300,"Negado","Send");
insert into ClientApiRequest values(89,3,3,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(90,3,3,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(91,3,3,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(92,3,3,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(93,3,3,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(94,3,3,"2020-12-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(95,3,3,"2020-11-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(96,3,3,"2020-11-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(99,3,3,"2020-11-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(100,3,3,"2020-11-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(101,3,3,"2020-10-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(102,3,3,"2020-10-10","/api/call/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(103,2,2,"2020-06-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(104,2,2,"2020-12-10","/api/sms/send","Teste3",200,"Aproved","Send");
insert into ClientApiRequest values(105,1,1,"2020-12-12","/api/sms/send","Teste3",200,"Aproved","Send");
