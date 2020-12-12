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

select *from client;
select *from planx;
select *from ClientPlan;
select *from ClientApiRequest;

insert into Client values(1, "dequimdeveloper@gmail.com", "pass1234", "dequim", "dequim", "dequim", "16987654321");

insert into Client values(2, "sigg@gmail.com", "pass4321", "sigg", "sigg", "sigg", "16123456987");

insert into Client values(3, "gid@gmail.com", "5454pass", "gid", "gid", "gid", "16253614987");

insert into Client values(4, "blaublau@gmail.com", "420420", "blaublau", "blaublau", "blaublau", "16253614987");

insert into ClientConfiguration values(1, "RTE", "rodonaves@rodonaves.com.br", "rodo1234", 8, "rodonaves@rodonaves.com.br", "rodonaves@rodonaves.com.br");

insert into ClientConfiguration values(2, "JAMEF", "jamef@jamef.com.br", "jamef1234", 8, "jamef@jamef.com.br", "jamef@jamef.com.br");

insert into ClientConfiguration values(3, "GBC", "gbc@gbc.com.br", "gbc234", 8, "gbc@gbc.com.br", "gbc@gbc.com.br");

insert into ClientConfiguration values(4, "ABC", "abc@abc.com.br", "abc1234", 8, "abc@abc.com.br", "abc@abc.com.br");

insert into Api values (1, "RTE");

insert into ClientApi values (1,1,"rodonaves@rodonaves.com.br","rodo1234");

SELECT * FROM ClientApi JOIN Api WHERE Id = ApiId
and ApiId="1";

insert into Planx values (1, "Api 1", 200, 500.00);
insert into Planx values (2, "Api 2", 300, 500.00);
insert into Planx values (3, "GidGod", 500, 500.00);
insert into Planx values (4, "Blau", 50, 5.00);

insert into ClientPlan values (1,1,100);
insert into ClientPlan values (2,2,250);
insert into ClientPlan values (3,3,100);
insert into ClientPlan values (4,4,10);

insert into ClientApiRequest values(1,1,1,sysdate(),"/api/sms/send","Teste",200,"Aproved","Send");
insert into ClientApiRequest values(2,1,1,sysdate(),"/api/sms/send","Teste",200,"Aproved","Send");

insert into Client (Id, Email, Password, acesstoken, Document, phone) values (1, 'ybowman0@samsung.com', 'mEONnjQ', 'LU62 256X K0DF IV3A 6OM5', '286-64-3446', '(684) 8420052');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (2, 'kvlasyev1@techcrunch.com', 'ZMUUsBgDY', 'DO53 XSNS 5804 6697 1997 5501 6523', '884-05-1860', '(670) 9591358');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (3, 'awason2@liveinternet.ru', '2nJHGH', 'NO95 1148 0898 445', '365-78-0982', '(309) 2207050');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (4, 'rlavrick3@cisco.com', 'BG4vSc', 'CY81 3475 1834 MBOO T2XS SZUG DZCO', '707-07-8715', '(584) 1324467');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (5, 'doddie4@theguardian.com', 'veuVKizaEL', 'NL42 YSEW 6351 7754 25', '217-03-5633', '(340) 6552022');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (6, 'ratwool5@technorati.com', '52xTyyv', 'FR69 2050 1504 83TH BX2W OBNG M55', '551-07-1272', '(924) 2218741');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (7, 'mritchman6@cpanel.net', 'ECDo98TrP3fw', 'SE37 0999 4132 1977 0206 8082', '737-98-5112', '(935) 7729114');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (8, 'rtwinterman7@blinklist.com', 'PcdBQV', 'FO72 1370 6351 0438 97', '800-72-5898', '(734) 9276456');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (9, 'nstrase8@nytimes.com', 'EOi6phXpvb', 'BR79 6816 9275 3337 5803 8662 906A S', '119-88-6818', '(286) 1711837');
insert into Client (Id, Email, Password, acesstoken, Document, phone) values (11, 'jhague9@technorati.com', 'kIUPXJnHK', 'AE33 0295 0154 8489 8354 280', '507-60-5241', '(259) 9508209');


insert into Api (Id) values (1);
insert into Api (Id) values (2);
insert into Api (Id) values (3);
insert into Api (Id) values (4);
insert into Api (Id) values (5);
insert into Api (Id) values (6);
insert into Api (Id) values (7);
insert into Api (Id) values (8);
insert into Api (Id) values (9);
insert into Api (Id) values (10);

insert into ClientApi (ClientId, ApiId, Username, Password) values (1, 1, 'Anson Di Biagio', 'Zo6NGQ');
insert into ClientApi (ClientId, ApiId, Username, Password) values (2, 2, 'Barth Reiner', 'r8Omuo4HBLbZ');
insert into ClientApi (ClientId, ApiId, Username, Password) values (3, 3, 'Eydie Carryer', 'UCgzvaE1z');
insert into ClientApi (ClientId, ApiId, Username, Password) values (4, 4, 'Cyndia Sumpton', '8KI3CLyXbAIb');
insert into ClientApi (ClientId, ApiId, Username, Password) values (5, 5, 'Rayner Orford', 'Cc1NiNlq9');
insert into ClientApi (ClientId, ApiId, Username, Password) values (6, 6, 'Thaddus Luckett', 'wwA8Beyofob');
insert into ClientApi (ClientId, ApiId, Username, Password) values (7, 7, 'Fancy Fullbrook', 'BmOnU3');
insert into ClientApi (ClientId, ApiId, Username, Password) values (8, 8, 'Granville Geal', 'mP0X70CRnGL');
insert into ClientApi (ClientId, ApiId, Username, Password) values (9, 9, 'Verena Cleaton', '5eDdZnt3bg');
insert into ClientApi (ClientId, ApiId, Username, Password) values (10, 10, 'Marthe Castanyer', 'O2M0u6D');

insert into Planx (Id, Name, RequestQuantity, Price) values (1, 'Domainer', 633, 87.49);
insert into Planx (Id, Name, RequestQuantity, Price) values (2, 'Sonsing', 457, 81.36);
insert into Planx (Id, Name, RequestQuantity, Price) values (3, 'Rank', 477, 93.38);
insert into Planx (Id, Name, RequestQuantity, Price) values (4, 'Flexidy', 22, 63.03);
insert into Planx (Id, Name, RequestQuantity, Price) values (5, 'Vagram', 326, 23.49);
insert into Planx (Id, Name, RequestQuantity, Price) values (6, 'Bigtax', 853, 19.61);
insert into Planx (Id, Name, RequestQuantity, Price) values (7, 'Bitwolf', 652, 53.73);
insert into Planx (Id, Name, RequestQuantity, Price) values (8, 'Stim', 255, 98.66);
insert into Planx (Id, Name, RequestQuantity, Price) values (9, 'Zontrax', 9, 80.75);
insert into Planx (Id, Name, RequestQuantity, Price) values (10, 'Zathin', 508, 3.54);
insert into Planx (Id, Name, RequestQuantity, Price) values (11, 'zeze', 2, 3.54);

insert into ClientPlan (ClientId, PlanId, SMSCredits) values (1, 1, 783);
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

insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (1, 1, 1, '2020-10-05', 'api/sms/send', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 301, 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (2, 2, 2, '2020-06-23', 'api/call/send', 'congue risus semper porta volutpat quam pede lobortis ligula sit amet', 545, 'eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan', 'quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (3, 3, 3, '2020-07-01', 'api/sms/send', 'nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at', 589, 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi', 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (4, 4, 4, '2020-01-12', 'api/call/send', 'purus aliquet at feugiat non pretium quis lectus suspendisse potenti', 350, 'lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue', 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (5, 5, 5, '2020-11-09', 'api/sms/send', 'congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque', 147, 'vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (6, 6, 6, '2020-11-26', 'api/call/send', 'nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt', 946, 'platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec', 'pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (7, 7, 7, '2020-09-02', 'api/sms/send', 'sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis', 530, 'at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros', 'mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (8, 8, 8, '2020-10-29', 'api/call/send', 'id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci', 20, 'in porttitor pede justo eu massa donec dapibus duis at velit eu est', 'lorem id ligula suspendisse ornare consequat lectus in est risus auctor');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (9, 9, 9, '2020-03-18', 'api/sms/send', 'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 439, 'dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at', 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (10, 10, 10, '2020-11-28', 'api/call/send', 'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet', 461, 'nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus', 'nulla dapibus dolor vel est donec odio justo sollicitudin ut');

insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (11, 1, 1, '2020-10-05', 'api/sms/send', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 200, 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (12, 1, 1, '2020-10-05', 'api/call/send', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 500, 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (13, 1, 1, '2020-10-05', 'api/sms/send', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 200, 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (14, 1, 1, '2020-10-05', 'api/call/send', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 500, 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae');
insert into ClientApiRequest (Id, ClientId, PlanId, DtRequest, Url, Body, ResponseStatus, ResponseBody, PostActions) values (15, 1, 1, '2020-10-05', 'api/sms/send', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 200, 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae');

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

  SELECT C.NAME AS "CLIENTE"
         , PLA.NAME AS "PLANO"
         , PLA.REQUESTQUANTITY AS "CONTRATADOS"
         , (PLA.PRICE / PLA.REQUESTQUANTITY) AS "PREÇO POR CHAMADA"
         , COUNT(CPR.ID) AS "UTILIZADOS"
         , (PLA.REQUESTQUANTITY - COUNT(CPR.ID)) AS "RESTANTES"
         , (COUNT(CPR.ID) - PLA.REQUESTQUANTITY)  AS "EXTRAS"
         , (COUNT(CPR.ID) * (PLA.PRICE / PLA.REQUESTQUANTITY)) AS "PREÇO TOTAL"
         , MONTH(DTREQUEST) AS "MÊS"
      FROM CLIENTPLAN AS CP
      JOIN CLIENT AS C
        ON C.ID = CP.CLIENTID
      JOIN PLANX AS PLA
        ON PLA.ID = 1
      JOIN CLIENTAPIREQUEST AS CPR
        ON CPR.CLIENTID = CP.CLIENTID
       AND CPR.PLANID = PLA.ID
     WHERE CPR.CLIENTID = 1
       AND CPR.URL LIKE '%/api/call/send%'
       AND CPR.RESPONSESTATUS = 200
       AND MONTH(CPR.DTREQUEST) = MONTH(sysdate())
  GROUP BY CPR.PLANID
  ;
  
  select * from planx;
   select * from ClientApiRequest;
  
  SELECT cp.ClientId as "CLIENTE"
  , cp.SMSCredits "CONTRATADOS"
  , count(apr.id) as "UTILIZADOS"
  ,  (cp.SMSCredits - count(apr.id)) as "RESTANTES"
  , MONTH(DtRequest) as "MÊS"
        FROM ClientPlan as cp
        JOIN ClientApiRequest as apr 
        on cp.ClientId = apr.ClientId
        WHERE apr.ClientId  = 2
        AND apr.URL LIKE '%/api/sms/send%'
        and Month(apr.DtRequest) = month(sysdate())
        group by apr.PlanId 
    ;
 
 
 SELECT C.NAME AS 'CLIENTE'
            , PLA.ID AS 'PLANOID'
            , PLA.NAME AS 'PLANONAME'
            , PLA.PRICE AS 'PRICE'
            , PLA.REQUESTQUANTITY AS 'REQUESTQUANTITY'
            , (PLA.PRICE / PLA.REQUESTQUANTITY) AS 'UTIQUANTITY'
            , COUNT(CPR.ID) AS 'UTILIZADOS'
            , CP.SMSCREDITS AS 'SMSCONTRATADOS'
            , CP.CLIENTID AS 'CLIENTID'
            , CPR.ID AS 'IDAPIREQUEST'
            , CPR.URL AS 'URL'
            , CPR.BODY AS 'BODY'
            , CPR.RESPONSESTATUS AS 'RESPONSESTATUS'
            , CPR.RESPONSEBODY AS 'RESPONSEBODY'
            , CPR.POSTACTIONS AS 'POSTACTIONS'
            , (PLA.REQUESTQUANTITY - COUNT(CPR.ID)) AS 'RESTANTES'
            , (COUNT(CPR.ID) - PLA.REQUESTQUANTITY) AS 'EXTRAS'
            , (COUNT(CPR.ID) * (PLA.PRICE / PLA.REQUESTQUANTITY)) AS 'PREÇO TOTAL'
            , MONTH(DTREQUEST) AS 'DTREQUEST'
        FROM CLIENTPLAN AS CP
        JOIN CLIENT AS C
        ON C.ID = CP.CLIENTID
        JOIN PLANX AS PLA
        ON PLA.ID = '1'
        JOIN CLIENTAPIREQUEST AS CPR
        ON CPR.CLIENTID = CP.CLIENTID
        AND CPR.PLANID = PLA.ID
        WHERE CPR.CLIENTID = '1'
        AND CPR.URL LIKE '%/api/call/send%'
        AND CPR.RESPONSESTATUS = 200
        AND MONTH(CPR.DTREQUEST) = MONTH(sysdate())
    GROUP BY CPR.PLANID;
    
SELECT apr.ClientId as "ID Client",
apr.URL as "URL" FROM ClientApiRequest as apr where apr.Id = '1' ;


SELECT apr.ClientId as 'ID Client',
        apr.URL as 'URL' FROM ClientApiRequest as apr where apr.Id = '1' ;
        
        
SELECT cpr.Id as 'IDREQUEST'
                , PLA.ID AS 'PLANOID'   
                , CP.CLIENTID AS 'CLIENTID'                
                , count(CPR.id) as 'UTILIZADOS'                
                , CPR.URL AS 'URL'             
                , MONTH(DtRequest) as 'DTREQUEST'
                    FROM ClientPlan as CP
                    JOIN ClientApiRequest as CPR 
                    on cp.ClientId = CPR.ClientId
                    JOIN PLANX AS PLA
                    ON PLA.ID = '1'
                    WHERE CPR.ClientId  = '1'
                    AND CPR.URL LIKE '%/api/sms/send%'
                    AND CPR.RESPONSESTATUS = 200
                    group by Month(CPR.DtRequest);
                    
                    
select * from vwCliente;
                    
CREATE view vwCliente as                    
SELECT cp.ClientId as 'CLIENTID'
                , PLA.ID AS 'PLANOID'
                , PLA.NAME AS 'PLANONAME'
                , PLA.PRICE AS 'PRICE'
                , PLA.REQUESTQUANTITY AS 'REQUESTQUANTITY'
                , CP.CLIENTID AS 'CLIENTID'
                , cp.SMSCredits AS 'SMSCONTRATADOS'
                , count(CPR.id) as 'UTILIZADOS'
                , CPR.ID AS 'IDAPIREQUEST'
                , CPR.URL AS 'URL'
                , CPR.BODY AS 'BODY'
                , CPR.RESPONSESTATUS AS 'RESPONSESTATUS'
                , CPR.RESPONSEBODY AS 'RESPONSEBODY'
                , CPR.POSTACTIONS AS 'POSTACTIONS'
                , (cp.SMSCredits - count(CPR.id)) as 'RESTANTES'
                , MONTH(DtRequest) as 'DTREQUEST'
                    FROM ClientPlan as CP
                    JOIN ClientApiRequest as CPR 
                    on cp.ClientId = CPR.ClientId
                    JOIN PLANX AS PLA
                    ON PLA.ID = 1
                    WHERE CPR.ClientId  = 1
                    AND CPR.URL LIKE '%/api/call/send%'
                    AND CPR.RESPONSESTATUS = 200
                    and Month(CPR.DtRequest) = month('2020-12-10')
                    group by CPR.PlanId;
                    
                    
                    
                    
                     SELECT C.NAME AS 'CLIENTE'
            , PLA.ID AS 'PLANOID'
            , PLA.NAME AS 'PLANONAME'
            , PLA.PRICE AS 'PRICE'
            , PLA.REQUESTQUANTITY AS 'REQUESTQUANTITY'
            , (PLA.PRICE / PLA.REQUESTQUANTITY) AS 'UTIQUANTITY'
            , COUNT(CPR.ID) AS 'UTILIZADOS'
            , CP.SMSCREDITS AS 'SMSCONTRATADOS'
            , CP.CLIENTID AS 'CLIENTID'
            , CPR.ID AS 'IDAPIREQUEST'
            , CPR.URL AS 'URL'
            , CPR.BODY AS 'BODY'
            , CPR.RESPONSESTATUS AS 'RESPONSESTATUS'
            , CPR.RESPONSEBODY AS 'RESPONSEBODY'
            , CPR.POSTACTIONS AS 'POSTACTIONS'
            , (PLA.REQUESTQUANTITY - COUNT(CPR.ID)) AS 'RESTANTES'
            , (COUNT(CPR.ID) - PLA.REQUESTQUANTITY) AS 'EXTRAS'
            , (COUNT(CPR.ID) * (PLA.PRICE / PLA.REQUESTQUANTITY)) AS 'PREÇO TOTAL'
            , MONTH(DTREQUEST) AS 'DTREQUEST'
        FROM CLIENTPLAN AS CP
        JOIN CLIENT AS C
        ON C.ID = CP.CLIENTID
        JOIN PLANX AS PLA
        ON PLA.ID = 2
        JOIN CLIENTAPIREQUEST AS CPR
        ON CPR.CLIENTID = CP.CLIENTID
        AND CPR.PLANID = PLA.ID
        WHERE CPR.CLIENTID = 2
        AND CPR.URL LIKE '%/api/call/send%'
        AND CPR.RESPONSESTATUS = 200
        AND MONTH(CPR.DTREQUEST) = 12
        AND YEAR(CPR.DTREQUEST) = 2020
    GROUP BY CPR.PLANID;
    
insert into Api values (1, "JAMEF");
insert into Api values (2, "RTE");
insert into Api values (3, "GBC");
insert into Api values (4, "ABC");

drop table Api;
drop table ClientApi;

insert into ClientApi (ClientId, ApiId, Username, Password) values (1, 1, 'Rodonaves', 'Rodo1234');
insert into ClientApi (ClientId, ApiId, Username, Password) values (1, 2, 'Jamef', 'Jamef1234');
insert into ClientApi (ClientId, ApiId, Username, Password) values (1, 3, 'Gte', 'Gte1234');

delete from ClientApi where ClientId = 1 and ApiId = 4;
SELECT CP.CLIENTID AS "IDCLIENT"
,CP.APIID AS "IDAPI"
,CP.USERNAME AS "USER"
,CP.PASSWORD AS "PASS"
,ap.name as "name"
FROM ClientApi as CP 
JOIN Api as AP
ON CP.ApiId = AP.Id
JOIN CLIENT AS C
ON CP.ClientId = C.ID
WHERE CP.CLIENTID = 1
group by CP.APIID;

insert into ClientApi values (1,1,"rodonaves@rodonaves.com.br","rodo1234");

insert into ClientApi values (1,1,"rodonaves@rodonaves.com.br","rodo1234");

insert into ClientApi values (1,1,"rodonaves@rodonaves.com.br","rodo1234");



insert into ClientApi values (1,1,"rodonaves@rodonaves.com.br","rodo1234");