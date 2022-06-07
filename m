Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEE2CCA47C
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Jun 2022 09:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239143AbiFGJPp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Jun 2022 05:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239092AbiFGJPm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 05:15:42 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130093.outbound.protection.outlook.com [40.107.13.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15099344A
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 02:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQJhMLfeJE2IWCidKYtH/+KovRgk/NH8R/xKxs2VzRXFlFlwyfxkOQ6oe4Iiev0lZgVGCXfdbffgiCEPK96nGKzm1gvIhyBMSVXwrmibSxc1SjvKONy9Y8kSkBOMQnVVWnFCz75wRS5mcdr8LLybYlYRa8fZMPkk9FHXO87S67L0fMaw910K+KcCejceNEweQnLPzMbOlgMFXNNIbWPtZ3yRoyZKrtf01LBvgcytnbOGxfKFs1/xdEYjde8sqt+z2Hk0vYbpuYRJvwNRCucb2lVf3PV8dlF10kxNlClzGsQn/XEcx/uiH1wSnGWhr5hTQKKLk/8pbdhHKPSjpySzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dItGQ+h9yQ++1HDINsJSpXm4WKQs9notJnf+PenvKxM=;
 b=hOgw8dLJCvzMcFd71iOWNVnBTlT+SsQNlZLsSZQg0dH6NOwBGZbs/ilR9YBWXYkJoxReiguSzpeMN00At14DKjxx2+rFrPtEm2d3bvetad6EdopMqB2uNIKot1y/DAcBkSCYhSTOkthaF9ipbm4Hxp9c8Yj9pRAez0qhcR8qaATBqYXPeBS6DC/4WBW7lfpkisZvmOPmkBkCPnoQ68jYmH7xGkBN+mSDk3ls5Yt7Xw+ju9/3vh5f7n1747egHrebIujTl0vPWkkudrZFjFlja17rnMsDVBZKVElNJSwHY/Kd//eZaWThpbAmMUCA8OrSZSUyYbN2YnYA6wkheLjinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netatmo.com; dmarc=pass action=none header.from=netatmo.com;
 dkim=pass header.d=netatmo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netatmo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dItGQ+h9yQ++1HDINsJSpXm4WKQs9notJnf+PenvKxM=;
 b=hk9gU6yNAdWJjnOcMKLoWNohs1PhxjKgYXd332AVDiusrNLwlpVYzlaTtvO8Owd2fpatP/02gsv5vRmmi4wTSFNuOJ5aYpC41UPpX6sLoGO39Qp2ZwxBu6fISYZWLbPEVJGwXWEpJZs9/fxf4Y6O9YxfB21jTqE3qEjLJ3nXehc=
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 by AM0PR03MB3857.eurprd03.prod.outlook.com (2603:10a6:208:6e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 09:15:37 +0000
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::197:874b:24ea:e4d5]) by AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::197:874b:24ea:e4d5%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 09:15:37 +0000
From:   =?iso-8859-1?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>
CC:     "cocci@inria.fr" <cocci@inria.fr>,
        Markus Elfring <Markus.Elfring@web.de>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: [PATCH v2] coccinelle: ifaddr: Find address test in more complex
 conditions
Thread-Topic: [PATCH v2] coccinelle: ifaddr: Find address test in more complex
 conditions
Thread-Index: AQHYek7fHLsMc4LTfk+02uWH++YB5g==
Date:   Tue, 7 Jun 2022 09:15:37 +0000
Message-ID: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netatmo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8cca62d-0eee-485e-1646-08da486648e7
x-ms-traffictypediagnostic: AM0PR03MB3857:EE_
x-microsoft-antispam-prvs: <AM0PR03MB385769D5BF5DC510D584926C93A59@AM0PR03MB3857.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UE3ffWPWklT6ykNeyXc6wGES7k2p7u3rLDAG0Kjtr4krljo02gMU/MiqZfRnon6GgJyEST74Qh4RDVOKyIjo4+0s8ry1DycZmzHhmBPZkRzhg4gnr5MX2kmfoPhcLR5sprnU0vg63GOzXaBcSEmz+JI5KLo/LAlMN3XALDmoUZnyl/h/YgDn8LGiBVsb5fFCchyt0YiHk3vmIM9z72ROrhmcJ7S1On5nZW8iSZ/sZPZHy5BZQ9bMbnGmCgtRWRX/nV2VyKacQSDPxddyKUCCAa6Nq90TKE3FGxbrRcDETAUpWKZ56IG/2WdOjcj0UNK+cG85ewMJtDmhjvQvuXnRW0unkRX+5CGVeX2byzAob4uCLP9I5T9n4SK5I8ha/+acIVDMCvGbfvvo2asN5qJlYpD3C/2q9vUDBrFgCEGB/2jIWotrI/+l0arzdQf3OgHN5U4eLILu+BYDbeQdJk/YEqP7x/uAkWV+p5qou8R1SQYMeN2/Srzm5k1+X6uQyv39Tq34u1B5XfpAq7lJ7vVid6llHv266+W9WoO1Xwmf0ipMY5xzUhD6ACiEKg2tcOjpuZbS6JActqu+MZ55qdMI5xvFHGLsujtgU5n4xDhxZ5sLB9lY1ihhqbWdWlUojP9PW/JiBHl75RjRaLs/ILQi4YpjSwYTlcOHP2xZOKxoH77ireUn4APmON6DrB9pBx4xLYJiATlBzo/GjA1cDzj0aw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(66446008)(66476007)(54906003)(8936002)(76116006)(2906002)(110136005)(91956017)(71200400001)(66574015)(316002)(64756008)(5660300002)(38070700005)(26005)(122000001)(9686003)(55016003)(8676002)(66946007)(4326008)(7696005)(52536014)(6506007)(83380400001)(66556008)(55236004)(33656002)(508600001)(4744005)(186003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oUAAJj7p6P6zEQxqsDM71rdhrRybYk2pIwxfJO9lEHLE7wSM9jFieVEXZP?=
 =?iso-8859-1?Q?PFe/8wday1d14CbFEmDo56/s4WKD3JKwfvxsaYb2moWsDC7EfAVxIJzJJP?=
 =?iso-8859-1?Q?36Gtn3hqqmSFkyEtaAnuWCUdUdk3r2cIU3wbdSwePGxnZ9FtsZEThoqRzQ?=
 =?iso-8859-1?Q?UeHH1rBgJ67HAYshfHY4TzTle4+sH5w2t7pJg0KfC5vWbGr07QfU9fk66s?=
 =?iso-8859-1?Q?O+W5j9lW2H9Y2eK90KnhQ00kdvU7seg6u9Nv+kM0099jgERU5fvddRNstH?=
 =?iso-8859-1?Q?4S0YIKD1Zfe8l5D4dI8HZq4h9cEuVvwZQtUGkf06ER9/BLXxTB2emn6VDI?=
 =?iso-8859-1?Q?LsYQumCbAG9Ft7CVEBiY9s+j7NGX0/RA9ByJyMf28v0IeyKWhonrUURVVq?=
 =?iso-8859-1?Q?erGalM6BmqNVTDx17JN5eYluk52t5g3jx5LoXCeTo7Szw1M2rLwAht+0Kb?=
 =?iso-8859-1?Q?C3pwqJezH8W3QygxSiFooWJfOS9r/qkP3Sd6Mudtnhl1rblH+scwbZzQn5?=
 =?iso-8859-1?Q?ux/jayOm1MZMgQZqcBIdUHq/ARTPu1cDH7nj9K3KPb4XVOD81jzBNmonkv?=
 =?iso-8859-1?Q?RWJS7Bd7W4cPfoW0vlwTxomKON5SVdpcR99/Kd2jwMq0J6OFNw9q60OEfN?=
 =?iso-8859-1?Q?P3nUsgIBydRKltcN2tc7ocUEQYW8r/ZTYdbW89GlmeV4vrIKeCF40rCfdP?=
 =?iso-8859-1?Q?oZZLZpLS3cKuriJ8UAL8af1L/KGmpjNaUo8lJTyA51rAdef5RjUTY0PJzj?=
 =?iso-8859-1?Q?THGk4wXGMrO1I9P8FvohzzYoNmTpNVYa6ocbTtDHjECmfu7952Wwbzj6dK?=
 =?iso-8859-1?Q?0/eNQUEPJfN25oeyY+4jFRyB3jGnqc8spMPkqte1YNUye4eaLcy3m78ojB?=
 =?iso-8859-1?Q?byROSEnPvybq2ZIu8N2sEXddQhY4n7hRlAg3PK9HB3TJybMsAhtjlDjBID?=
 =?iso-8859-1?Q?E2ZdqNMwJj4dwz0IpQIOI7qBT6zCAInQJdWkCL6mo/TAsa9gqXIOlHbYcU?=
 =?iso-8859-1?Q?+Vwvb5PZu73OYLHhUemF8voToyTXi1z+2ouhLfRX7WAZn7HpI6QxNzzUmV?=
 =?iso-8859-1?Q?Kb2XtIRlF1Xxgcu5Rh8T4t9b35zDyNESErJ+I+zwkJ8OdRHgZ7JLa39QvF?=
 =?iso-8859-1?Q?Z8nAAlFcXSSlkpYeUZgERND5JlogCs8R0a5L+7NdrAisruSqifLd2D5T6F?=
 =?iso-8859-1?Q?urBHlX0GpRpupagLvbfZMukNuHMWMvu7jPiTPTp3OHiHgyfVbD/U+stlra?=
 =?iso-8859-1?Q?1Btrh4wcQNM3zQlpyP9UodJSD9d0uVTShhtvajQKX1PBY3Hiw1dqem02D9?=
 =?iso-8859-1?Q?lKuNVtqRMcL4jc9HfjaGs6nTYIiKJxSVrSt95vKx8dEipKkS+AOdlLi0M/?=
 =?iso-8859-1?Q?assvhz+pDUgLLTbIP4AR+UF5CZvSHsJujNbPfX7pMZ7mzZn2iv0p7aGTcY?=
 =?iso-8859-1?Q?ILMgBPalQPKAc5fbtvwNpoi+ildli51bq8vlHx6HKAmwFCbb+tolzjs55i?=
 =?iso-8859-1?Q?J28c1KVhUGdef3sMzur7imTe2Tbfr8xo3PY96f/LwF4omCcA4dNyQ2bGa9?=
 =?iso-8859-1?Q?UJN6gRkfm9HM1+vpjvDPSvS52DCrfLG5gVO0s53OL7k/sN8036fBmxG+oX?=
 =?iso-8859-1?Q?5RRWaSJ6oZq2cG2/1D2Kly82WHr2Nk4mfNizTK84Z3mZNDncERRNXqFb3V?=
 =?iso-8859-1?Q?sl9BvlcKbet4YXmcYzdnA32c3qQBAgNSRvzE+BuNw87sQhznrVamO4Bdny?=
 =?iso-8859-1?Q?xrx49SYCrGomyuB1zOy+mDIOU8yR/XF4lZ5VkgSsvPDKEjGXylb9opVaqE?=
 =?iso-8859-1?Q?AxUGbBZFlnzUl04w8IlbPhhdbDhkgKQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: netatmo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8cca62d-0eee-485e-1646-08da486648e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 09:15:37.3002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4528446a-2666-441f-95cd-cc2cbd9f2c49
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JAdsqc0jWLFAiwYS9+Pix7kbmH0Y0eEuniAtctq3spuJWVTdf/fT/yOXMaaLkqvN7WlPY4LBWNwBIV3MRfN4fXyAYmTyPddM1PPELh4rLPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3857
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The test of an expression's address does not necessarily represent the=0A=
whole condition, it may only be a part of it.=0A=
This change aims at detecting an address test in more complex conditions.=
=0A=
=0A=
Signed-off-by: J=E9r=E9my Lefaure <jeremy.lefaure@netatmo.com>=0A=
---=0A=
v1 -> v2: Moved disjunction on the condition itself instead of being on the=
 if statements=0A=
=0A=
 scripts/coccinelle/misc/ifaddr.cocci | 2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/misc=
/ifaddr.cocci=0A=
index fc92e8fcbfcb..14dbf3131a3f 100644=0A=
--- a/scripts/coccinelle/misc/ifaddr.cocci=0A=
+++ b/scripts/coccinelle/misc/ifaddr.cocci=0A=
@@ -18,7 +18,7 @@ statement S1,S2;=0A=
 position p;=0A=
 @@=0A=
 =0A=
-*if@p (&x)=0A=
+*if@p ( \(&x || ... \| &x && ... \) )=0A=
  S1 else S2=0A=
 =0A=
 @script:python depends on org@=0A=
-- =0A=
2.25.1=0A=
