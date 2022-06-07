Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB3CC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Jun 2022 08:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238093AbiFGISR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237997AbiFGISQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 04:18:16 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50093.outbound.protection.outlook.com [40.107.5.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69CA825291
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 01:18:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDYtsi+CxmVNcLzeHprPT7wPofE5MSOlw4Q+EN65U1pj2cG9Cocy+fZJRDQfFNSIxDFp+cW39qYbdvXgTK7Wn3zfAbm0FJVPmnQybzMagqz7x6LVghhv2mLT0RqHvWR1aJKBh5pvXMGrFFB9kJwV6Ds0xGhIPTjmYgdSZHhZx4PkceSycYVCKJIkqcVFhr8wsAHu4NdkgTRjAHr0BnZRFda0Tk4bna+kd94O0JJ2kjOP2SrP0BQQrY1apG4eDDVSiXshwIsTDjkJ0nDU9TdJEK/UkhawBO9jOI4aElxufpHghqcN7KUoCZY3tiDPSx0P3BQXAH76jz3tmyzYPiuKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqXJI3yni7gtm2StseXyu3AhImIky2iHqDYJrr6FGM8=;
 b=jU14GlpqzEMiM95PcJ+ZoxTSeAyv6ddrOT1uYiCV3ObibdGmuIGGXk71V7aXxPkkq6/0DfTPzjKZLHPvVOnBY8N86Hw4DURHvAsIA3oN8FggmKdVoVnz8hFUs4ylhzo0E/f6gPMAPX+OSDSbDsz4qvrk8lu0GCvbjcug3otGzoigWBUPKllKoqrcG4UB0gzwn1wiZTw11vmTqkNW/fMC3fmFdfkJlvNxvBXsGQyla0JkulrA+fPVvGwnz+VuN/NVE4iFjdQR/K5HLhdlZW/1NwjLtCDCGpnhqvRB552YNMGkfy8YVwlFZpBSzDXzQy2gT56oYOJZVhlNIhfNqK4kQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netatmo.com; dmarc=pass action=none header.from=netatmo.com;
 dkim=pass header.d=netatmo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netatmo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqXJI3yni7gtm2StseXyu3AhImIky2iHqDYJrr6FGM8=;
 b=C5LkCywa+q61lr1VLEegR+qPoL4scDIxsKC+K5aE6lF9QpQhyNnX72DL0xuu1CCCqgJvYT/kt/yIkOtBMzoHozAnyKgLaFs3iovA+KskdOsEe8RA6mYGk6TXY/VbnZFhpFhGb/iu/0hiUmcthkM7xeQIdAO0sT3syWK8+vLYdMY=
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 by AM6PR03MB4854.eurprd03.prod.outlook.com (2603:10a6:20b:82::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 08:18:12 +0000
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::197:874b:24ea:e4d5]) by AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::197:874b:24ea:e4d5%6]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 08:18:12 +0000
From:   =?iso-8859-1?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
To:     Markus Elfring <Markus.Elfring@web.de>
CC:     Julia Lawall <julia.lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        "cocci@inria.fr" <cocci@inria.fr>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [cocci] [PATCH] coccinelle: ifaddr: Find address test in more
 complex conditions
Thread-Topic: [cocci] [PATCH] coccinelle: ifaddr: Find address test in more
 complex conditions
Thread-Index: AQHYdDtaSsV9bHjawkKxSgGKgkpPXq0/Tw8AgARV2Qw=
Date:   Tue, 7 Jun 2022 08:18:12 +0000
Message-ID: <AS8PR03MB76033D6DE8170CF1A168FF6893A59@AS8PR03MB7603.eurprd03.prod.outlook.com>
References: <AS8PR03MB7603A9FB9FA6A62438B09A3793DD9@AS8PR03MB7603.eurprd03.prod.outlook.com>
 <2490b8cf-4d9e-1357-6563-097264bcb01a@web.de>
In-Reply-To: <2490b8cf-4d9e-1357-6563-097264bcb01a@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netatmo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9e2dd95-34ff-4911-cf9b-08da485e439c
x-ms-traffictypediagnostic: AM6PR03MB4854:EE_
x-microsoft-antispam-prvs: <AM6PR03MB485407999BC461F61526206593A59@AM6PR03MB4854.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gYX65EwFkgBSEEtxXS+d9K60q7vewFtNETqz9xhQQSKb8+JgpKotd7txcSxqgyBmS5ZiXJSKYVHsqIGBljcbYkq6xWSRNk0VuVkBhY0uYtENa64A6SLDdtrdtLlVLlm+WCB82Z8nwmqaUqRCr3GDaOUuqzwotXtjYO4zAyKaKDW9G+npWZqxB53rVEkor4CYEpOaes2Q9sBwzB8cCxHfntTCTjvcffkqgi8WYpunlS4jXF8Sf/LWsfRK7YqCqC8ZZkvFEWgiw+E/YmkKDuGDdH+EhmtxoA8QsdnmIIpCEnzpfQxcZIF+uofqw7iQSTEyady8d9Z30/xOA6q/O2bsBFPoC5hRnFFNUBHg/m9cUzBsiMtKf9DGICk/fVf30TaKMwFpj3GX4g6k1MnWYXN4FhHUd7TQFhJr+ShGRxwx8HvyLi5p/i54NRm5mxYC+1rXhpNUgGe0V+vL9S0zScgA3rparKOw4zvCv3oc8Zz/vahSlEIW67oKjhJd8UkAbJAIQiPiuiKfVfyep0f7XEegs0bO0vOqGIf1aCfz9qLsCMbVmNSHLGoLQKABI+Wt0r9zE8M5pwlgx1kQmEU6aV4GCXjyp7CTRMzM01X+3I2wBGgpz7jqB5915403szAG6Yh294PY8/ctk/NBuBrGmjUOHdhZ6BX8cqfAEAOjcfP1rKhNbyRTXx4dpm/wjzK9fnU7zJLWn+QErHA/trHKAUoRtw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(122000001)(86362001)(8936002)(5660300002)(38100700002)(508600001)(6916009)(186003)(54906003)(316002)(4326008)(71200400001)(52536014)(26005)(9686003)(4744005)(7696005)(38070700005)(6506007)(55236004)(8676002)(33656002)(91956017)(66446008)(66556008)(66946007)(76116006)(64756008)(66476007)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7cK4LYmSbrr6Osv/a5cKs3ck4kS55GOrLwXCHW3e8rB7keiF0PxkFv5www?=
 =?iso-8859-1?Q?ljJJhxSAN3gDo/O7d2LTTdjYXj6m3oHcJ2Wn94jHyeugT7U+qka0qQL3Rb?=
 =?iso-8859-1?Q?zyNOXOjMF+un4jVxFnE5VIvzjhcVkCDYzQnSu6XRU2Yk0cDoqfeD6GbxAf?=
 =?iso-8859-1?Q?+joF7UHFFlg9s0j9F5ZFwURbTcW93NovMOq74Jk63ag/mfj2WuzG0ZK8hN?=
 =?iso-8859-1?Q?SrRSQpCaEYWLib9SHWaoDHELga5g2hXuWpY6ELh3dygpbRNj65ImG3cMur?=
 =?iso-8859-1?Q?QP/Fk8Myquqx5vV3/iEVy+yfgdEawO0V21VVk5fa2mJ2/0v8oagN12dE4u?=
 =?iso-8859-1?Q?zn4ho6CcggxkFRxS/rFl2QICs1sCmLTta3l9Nogrj8UXT1RRqZuelSSXXN?=
 =?iso-8859-1?Q?SGl/BTyVJvG2Oaz8/WviIoKrJFR/qRvDvLJuuX6kdHyBFYi6yhr5eAslom?=
 =?iso-8859-1?Q?jRGw5dfXbXxcjH3aAs5DETDIuaZDnIIAyqTIhu0QmEUmXAut5OVi0hkc1B?=
 =?iso-8859-1?Q?jHtNTNPNesywmkRGv5WickiEu7WGYjkJF9S72dYkQOlrkrbTEL7ubQODEt?=
 =?iso-8859-1?Q?ijbvh+P+BrLCsozBWBHe1VQMQc2whP16BkxJzLL36N0roVfmw5+b10sGpE?=
 =?iso-8859-1?Q?5KlVT1OcIDce6h3U0I1iqUycfsJ20hggwH731720drlnZwBtmO5+u7Azcl?=
 =?iso-8859-1?Q?BM/jMkwqYAKKcX2VURxTvGGFEudM4IAq16aVo/Vz6K35iggucKU99LBX/3?=
 =?iso-8859-1?Q?rcugTE3NioIDY7O/6vlRDIq0wsBeTBBY60C9cY3xbx66q3zIjRD2EmMzrv?=
 =?iso-8859-1?Q?iJn5iVNtIKzzgt1tVUqko77WHIjcjxqTNNv0wzdD+xlID/r3cB99cq5cpe?=
 =?iso-8859-1?Q?u1Pzw27ayOY27cOlOrSAGqfOWd9kg43f57lJUWIuVWDdzMeVyfyzbJeOSE?=
 =?iso-8859-1?Q?kGPkpi3dWmbgdVNurs1we+3AQ0wrvBG14lXnxlOCcVsNdNtCP99HhKEmLy?=
 =?iso-8859-1?Q?2ydU4HLmctqX2fKUxaZO39T+e7DeaKp6+BEh+HVIyxqJc2c0csdyZ/svbA?=
 =?iso-8859-1?Q?eodxGxowCId/PnTZJDoNH5dDiYMiEcBURvSnPQoN0YAbE8E/Gf6Gj4xrTw?=
 =?iso-8859-1?Q?R9NORyNgkanW2hhIBypOuGgDofs8/M/XlA5umQYZC/ewcehs+0t7zka5be?=
 =?iso-8859-1?Q?TAqNAYzQuCnAKe1z9NqOfw1i/kobRskgWUNbnzyfQFPHPhmsL2naQ3dbEr?=
 =?iso-8859-1?Q?5mI+7uaJscJwhkSk7Qr0/w7C31uiNLgYk85CTSBs+/T6Ri2K4gEAVBBUcE?=
 =?iso-8859-1?Q?tYpQO1IfjI2OP8X/2CITiQtl5+iu+N2yLSUgf4+z53Erh9XPaN5Ut1PC1F?=
 =?iso-8859-1?Q?89DMWaKpRniBaN+Uz08M8iZ/5h1twkmW7EpskvARuwBJ+eyPLjkm3jrvdQ?=
 =?iso-8859-1?Q?BqPjKOWOpFnCE+bJgrAeOo9A/1dDB/RGgIgxvqYbezLc2T2H7bL4wSN06+?=
 =?iso-8859-1?Q?p+sxOXNduZ2eqNNTGyqeZ2lX40rtLst/cXooVdkBB1Obobb+ehqiCs2U6S?=
 =?iso-8859-1?Q?Hd72En1JJB28YvJwi8npBFFfKKIS/wD3JQn0bFg2scEZO5b66WnpFdDPPg?=
 =?iso-8859-1?Q?lTkG9WgF3lW7XEmoF2rrLYm1DOfq8jIp22yOQ1/7C3gXm+WB5qWc9w5GmD?=
 =?iso-8859-1?Q?8F2rzNF9pW/yzheCaWfkUOosMVibMxsxxvwVw8yR0UnnjR/9Y/32Xd03Y1?=
 =?iso-8859-1?Q?QRKLGiEF3fpf96ay1DaJ6s7Yk3/9uWqOTUpNDhz7VPBDPoKC9hkqrenwGF?=
 =?iso-8859-1?Q?KElX8ge6lxzCmfAgHECT1kGFEm1QJLQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: netatmo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e2dd95-34ff-4911-cf9b-08da485e439c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 08:18:12.4353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4528446a-2666-441f-95cd-cc2cbd9f2c49
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdFqO5JTROi01I40qOkg8kIwEzGQHvzfzb8rA4G+UydZ0WqKOXrgcyCtd/BZSF5BO4z207/FpUPnTMQIAjfsYAuBLZeVnpVfm3NWEBvkT4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4854
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> You would like to extend a check for an if statement.=0A=
> I suggest to specify the corresponding SmPL disjunction like the followin=
g.=0A=
>=0A=
> @r@=0A=
> expression x;=0A=
> statement S1,S2;=0A=
> position p;=0A=
> @@=0A=
>=0A=
> *if@p ( \(&x \| &x || ... \| &x && ... \) )=0A=
>  S1 else S2=0A=
>=0A=
>=0A=
> How do you think about to use such a SmPL code variant instead?=0A=
=0A=
Thank you for your suggestion, it looks like a better solution.=0A=
I'll send a v2 with this suggestion (without the &x case).=0A=
=0A=
J=E9r=E9my=
