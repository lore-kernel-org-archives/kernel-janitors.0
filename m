Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188A2CCA47B
	for <kernel-janitors@archiver.kernel.org>; Fri, 10 Jun 2022 11:18:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347505AbiFJLSr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 10 Jun 2022 07:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349262AbiFJLSc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 10 Jun 2022 07:18:32 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2110.outbound.protection.outlook.com [40.107.22.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34307A463
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Jun 2022 04:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klS78yRuO1KV+ORK2Ve0l3Xdk/8S7qLnug6Zs/PR4LtSKnjPbkTqjqwuh+GEyKZ/cBj5PaVlBv9IanQf//40AVHhi26veJjbyVF9vTozackmAyNWS8pyVTxICs6WtGawdJTRdH+875i4O+DA4lHQiMaje8XfLCiyyWcvMTL3O5DlfOQKG3VAssnbX8o0x5bCNnPrWa80fn+JwzzYeZoPWwaDOefooW6xKiKPetgGmJkEFtA778Z8XUJNHSmDxHCdsBQ162q0e1qGlx3Kei7kn6kB5qVCIAZVbIES5VV7sTR/jmEXrcGIJsjp13QWAem2HcaWyADRn7EaXgLn0uLfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4Zeq8/Dss8EG/55Ksao4CO0zVRUd4uLszKWwnFXYqc=;
 b=DUXF7l7wgE3GJQDPz0Xo1NgLQK/cdBWGnI7MFp/YhsSsPAfLSW7WCRuSr3zDPjgVtO79Je7Awl5ycJahLgP172MpUAEdphSt4z4nbQKdZhi1T+yYHhtOHvl5vkMLrOtkxZ06WBg0YEkr4PY5hHm+7WXvle+1ZwdRz1knmTC8Wl46rzw4145dOgJgOhhvuNq+KdhZvQzsbAFzuB+89tLJ/4Emcoawqo7of61XZ/HKGX4ZOoN0BUWT+GENJzKJflpFc3a4FCqdwwIUfwxKBDwDhmzWp+gyVFIqloWE3txA3fdG4QvfnIgM6Wdju4FVZn+p8ZUvoTqpZsycCSmIZP1k8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netatmo.com; dmarc=pass action=none header.from=netatmo.com;
 dkim=pass header.d=netatmo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netatmo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4Zeq8/Dss8EG/55Ksao4CO0zVRUd4uLszKWwnFXYqc=;
 b=oBP/nLdJ0+mlGsrXvtE+wZWFbFYJoyLlcGFnfbnW2Ld/bWOzBO4m/SW5ujmL6X6GNW3EsY+T2dFlDMoIg/fcM4ttm4moUfDOOLA+Cjv3GwkCO/2zjVId6oPfBP1wFa2FRBz4JjmL0F87eqW0/N/aFUa/b6ok0+2p4QxNaDfMqho=
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 by DB6PR0301MB2437.eurprd03.prod.outlook.com (2603:10a6:4:59::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 11:18:28 +0000
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::8175:20e5:60ec:b87d]) by AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::8175:20e5:60ec:b87d%7]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 11:18:27 +0000
From:   =?iso-8859-1?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
To:     Julia Lawall <julia.lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Markus Elfring <Markus.Elfring@web.de>
CC:     "cocci@inria.fr" <cocci@inria.fr>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: [PATCH v3] coccinelle: Extend address test from ifaddr to every test
 expression
Thread-Topic: [PATCH v3] coccinelle: Extend address test from ifaddr to every
 test expression
Thread-Index: AQHYfLsCmi/5kwNDAkqS6gBbhAOymA==
Date:   Fri, 10 Jun 2022 11:18:27 +0000
Message-ID: <AS8PR03MB76033CF2848D03651D6E189093A69@AS8PR03MB7603.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netatmo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8af47acf-ff8a-41cb-7ed6-08da4ad2f154
x-ms-traffictypediagnostic: DB6PR0301MB2437:EE_
x-microsoft-antispam-prvs: <DB6PR0301MB2437665673E745BC196FC92E93A69@DB6PR0301MB2437.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7SXmzd4CP7DVpSM2A99KNrW8e1Q1h4tDM+HjoojGVyUYWeVawDmPVtatS0yNeznmIX2TGWtbIP1jd84p/KaY9ORTYWkodjeXKZ7kKrxzKdSzaikc+sGwNwXXWeJ10wNyLsj4aLhMnNzlkfc8wxtjq80nG/iZyxSpkKPVgiDcYN+tWje8D/I2Y9GdR2exCTtF1ji5Gi8Xhb/q3s7NgfImlqEgmr3LgZmC2l/LasY5reaQgrdLUQX1zJYob3zidtHAoe0sCVK0+FE3KEPhCiMvs/G1IOSftdD/o7dgGHI/y6+fXm+14plCORzGjHjYwYRDAJ0mr7VPU0jOH57dqNiNDwVm3BT1efJwDHmQDr4g4N/dCHk185+GGR/EMcqc7hWXYJ8dEnz9HAUGn/x3S5II4bIFDCstkcEmJZU2NCyzvrEDGNLaG+tgftNfZnxb6JHi3AnhbnUDhMP8QOqcZBk4KmkEJUG0CXxlTXJk7M4CftVcFeYbJMnJHn+LxUjxLWLmm7g2IZZDqgTo42FfbQMtz5rp3ssH82A1juE5ncp5/0TjPJ4VHnwpklNsksiI08NCry3P9mh6rbX8DaneUXeKiWim34d3IVkfEyRIYSjr5o3L92v+N2+A6xc1s/0eORLrfVmS7OCjAf5eYBPzD4kbOZbt6Dlaw2aDoNYz4XK1gxTLXYvn2sSfr4hGEiWb69qrRxpQw19meiihvWiMVK90KA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(39850400004)(346002)(366004)(396003)(136003)(66946007)(9686003)(66556008)(66446008)(8676002)(91956017)(64756008)(2906002)(122000001)(4326008)(38070700005)(66476007)(41300700001)(26005)(54906003)(110136005)(38100700002)(7696005)(6506007)(55236004)(55016003)(71200400001)(508600001)(8936002)(83380400001)(52536014)(186003)(33656002)(76116006)(5660300002)(316002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NKFVfyiE1Iw4dJYiLHkbS97mXIA/8p20G5EZFuBGx8p8atFJKK9+mCbTdE?=
 =?iso-8859-1?Q?x9LzHyUK0Z6XHiG4rqU7SFFCBpjX1XjLnVOFb1+6MerrupvRAPnflYgKfr?=
 =?iso-8859-1?Q?JF5qH4D/IwsB52T4vrj4T7XJIwGOjq1omyVPcfgH+h5YfqWBD4/KplD9GY?=
 =?iso-8859-1?Q?bMHs9ihlY800VEK5LVqtqBNnbpy520VFVqoZSyDAHm2tzfriG+EA5Om5Kv?=
 =?iso-8859-1?Q?LWMxz9nT1xTk8ty54psKX/z1YZB7r2LqKw0juL4cYMfpaY13rBVHi+QZB5?=
 =?iso-8859-1?Q?E1L5gw7KffaIivPikrmAr7hcIrZ4Fnd0rjt4IDArOUBqKk6rfxMAX17z2O?=
 =?iso-8859-1?Q?rOeiGNaEDCjtephpphu76/AN3w7YtZ5NJqzC3mb/xytuAgV99TdPaBHgCx?=
 =?iso-8859-1?Q?sEl6VHnZpz6z3njXjyZESRgpK2uFEYzHe5lBNEVBnEqkuBTRjBzVkuHSIp?=
 =?iso-8859-1?Q?YKb7EfvQLih0PlBF9J2YspYjZFfA17ug17e2jEHIKPYIx6wY8eOIiEILrr?=
 =?iso-8859-1?Q?Z9hkdl8hdYTvv+9f3n4O/HEDKnpyKySkdMFM9GJIk1Dq9jXxQo8RmSpqbe?=
 =?iso-8859-1?Q?7sGS934d1uVUorKQG5aGSriUZiLlul2L9vHwb35u7THZ7atHTif9+ERSrJ?=
 =?iso-8859-1?Q?w2RUSDh9SE9xN0lAGhuCt6T4NjPebFjnYOKcOg4cOJFhuNiOSxTzHWn50B?=
 =?iso-8859-1?Q?Rd24R/cr42YlsB4RTIkmMpX+BGFbKcEi3nG4xXGWI240izyvAsprAxBJWk?=
 =?iso-8859-1?Q?eA3SXAvt3YgorELThku4Go6wzjWare49NDjcfAGxUZKCUIskK7n2R0G+rB?=
 =?iso-8859-1?Q?z5624SzuaDP028qIa9CCtsIw8ydfbwQ2AfCTSZ0CSLFYGtWQorcKemdVdO?=
 =?iso-8859-1?Q?kONx/LUWmmhiyY5omjlUMP5d7v7nr6uNOusKai8Mta6gw5ZcYzV/UwrwWs?=
 =?iso-8859-1?Q?WwrjjoK4FBSL2O82JXInDekpAttsrjB1HWC04+1NnCTppqPDXy/+EN3SRb?=
 =?iso-8859-1?Q?Q6WfePCb1bWpUpYnRrSeIGBuysJOqD1nNy479YFc4o1avqyQUu6fTHfJxN?=
 =?iso-8859-1?Q?s4dJGEX32FyttXMHDx/SpllCnGxACuSVc9Y0DC5U1jQQj2f4d5ZUTIS4Dl?=
 =?iso-8859-1?Q?eAw1vrcP2KekmtfCu5LhepdpJjc71pyqkF+9o3hkpgvl1NMHgtfnxloKmF?=
 =?iso-8859-1?Q?aYNw64QXSf+Yz2q8Uo/IIdsdtK1mJgACon6N+KhfOHRzjFQC6Gdvp6ZE3n?=
 =?iso-8859-1?Q?BGd+w+OFKtXAltVCnZJKVzF675xMFCi1oaWM31lrvpbgdI686dn1BSF76M?=
 =?iso-8859-1?Q?sWjigMLgebA0pAyCsLkdeeeFehmygBGLruNv3OgHLyZjlNrl6x/p2LtkuT?=
 =?iso-8859-1?Q?7KQaBLBOY9f9f88jtb7bqxE3i3hz0IY8b1mROANM5Qy1jtz7G7XGIldTCa?=
 =?iso-8859-1?Q?VBp8DgczKtH/HAZ0IlYMeqfRTnKiKbT/CONasELVBbYShi4Arg1NWEZQ+I?=
 =?iso-8859-1?Q?r3IKzAki6prk+8nSu3SoSNnfY2YdWtYPBTsTtSb3TT7LHNnXZtcZdMWR2d?=
 =?iso-8859-1?Q?NcPoNNBSCmWXkqr+lbK3UcEUzGPRiFbTs6ucF6BLpUffylhIzjeFtO1N9Q?=
 =?iso-8859-1?Q?HA5twX6r1cm/zH2Tkx7REP0gJrsnRonxM89R4zSVYEe0H6JMgut6wSIrVF?=
 =?iso-8859-1?Q?OFU3Z9ePWKUTw1ye+tIpzIgRlj0syAtrNicRYC0aoWYQatSDukDcUXMN+B?=
 =?iso-8859-1?Q?7bFA0DVHD4ViRzqihZbGVV6jv4TGemDa18ZHyVIbmvPqeSdh5RuCGAOUV4?=
 =?iso-8859-1?Q?tJ8XxBSJYVBto3J/Mmq+yZzod5bOyVQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: netatmo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af47acf-ff8a-41cb-7ed6-08da4ad2f154
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2022 11:18:27.8311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4528446a-2666-441f-95cd-cc2cbd9f2c49
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uXhjoYOH7FGXrSSDq9+xTbNG5sjnfmAXyAwDFUOHNTVjgO+ACdEku0LpxaNc8gkC1Qz5+qpDFdZANCJ7+Zn0+BfET6+OcUURQ77hd/Gcfs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2437
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The test of an expression's address does not necessarily represent the=0A=
whole condition, it may only be a part of it. Also, an expression's=0A=
address is likely to be non-zero in every test expression, not only in=0A=
if statements.=0A=
=0A=
This change aims at detecting an address test in more complex conditions=0A=
for every test expression.=0A=
=0A=
Signed-off-by: J=E9r=E9my Lefaure <jeremy.lefaure@netatmo.com>=0A=
---=0A=
v2 -> v3: Apply Julia's suggestion to have a more generic solution + adapt =
commit message and file=0A=
          name to this new solution.=0A=
v1 -> v2: Moved disjunction on the condition itself instead of being on the=
=0A=
          if statements.=0A=
=0A=
 scripts/coccinelle/misc/{ifaddr.cocci =3D> test_addr.cocci} | 4 +---=0A=
 1 file changed, 1 insertion(+), 3 deletions(-)=0A=
 rename scripts/coccinelle/misc/{ifaddr.cocci =3D> test_addr.cocci} (94%)=
=0A=
=0A=
diff --git a/scripts/coccinelle/misc/ifaddr.cocci b/scripts/coccinelle/misc=
/test_addr.cocci=0A=
similarity index 94%=0A=
rename from scripts/coccinelle/misc/ifaddr.cocci=0A=
rename to scripts/coccinelle/misc/test_addr.cocci=0A=
index fc92e8fcbfcb..2d0ec86d1701 100644=0A=
--- a/scripts/coccinelle/misc/ifaddr.cocci=0A=
+++ b/scripts/coccinelle/misc/test_addr.cocci=0A=
@@ -14,12 +14,10 @@ virtual context=0A=
 =0A=
 @r@=0A=
 expression x;=0A=
-statement S1,S2;=0A=
 position p;=0A=
 @@=0A=
 =0A=
-*if@p (&x)=0A=
- S1 else S2=0A=
+*&x@p || ...=0A=
 =0A=
 @script:python depends on org@=0A=
 p << r.p;=0A=
-- =0A=
2.25.1=0A=
