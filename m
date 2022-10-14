Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B35C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Oct 2022 10:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiJNKfb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Oct 2022 06:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiJNKf3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Oct 2022 06:35:29 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60072.outbound.protection.outlook.com [40.107.6.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01B24CA1E
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 03:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=occHzDQlglBcrNaHhcTvoY3YHET0hEpoZXFCbMgPdPTn3YSnkN+4fPnt7LWF/MOgA6qNSL+7yIhE0jxwPkapd7Ypugv3OdYEbk0qhHZMMLnDOTkBrndpObLjYqJL7+zr55m0mmoD1keX8wBCmHg548rjB3xKsB7kA9LIWtxug89qlut1PG0YLW4mRXzEnqssxRunGJkHkKQCtP0wfLPxxBV0SqPDe408tKl96+wEWyTOl10aWMJjr+kakR/pj//sbrDWFPbzkxmigYUzDf4fOzp0EuHgakXQFBuCXM6MfZ5BOL2xlD/Hjr4SfHKuKl5V5tsb6MiozyDgaktAIaJPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L+dP7q26IN6GfkW6bq25PB4i6RtHGL7dmgJ9jbr8Hs=;
 b=NaysCnFARyh7gc6d+Fhp7c0/pU8pz+OLSRDzwwZIFqckehBtAfmFtrSTOR5FL9a9x4WPGv6etNweb/CqWe4PMyvN5izMM4BX9SIsVkhdBPEn2Ju/G5wuWecLkmvAAMNHuZBdroNDD4nyjj4f3vXkxVwPvPksZn9HEqlCGGEtPb21wbuJOFfs46WFzhOyIA/YOnuBl/2B2mat62e4YvTqKN7yV24TmBk6aAhrUuZsyqVSM3r6MqOASbm5EKj/CFqZszp2jr3whKNSTGfOcLs17BKuulL8Xd3NtFQvbgtfoaS7+w++7mmS44jwhBZDShIq0HmYnRYoucPu+nnRHrr1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6L+dP7q26IN6GfkW6bq25PB4i6RtHGL7dmgJ9jbr8Hs=;
 b=X6E7e4EnVQnv9W/kwxILbnKdg24Feupdb1Go/sNhUt7ule5nHMlQM7G9pLKJSBG7OOXN5htW86jOHjYhhv1sX1bpfJQ0Mk1Zs0HCU0XYdMRxlw0B/A906HMNJYYgxqg3EoX7APKSxxyJcN/50Kex5/OcvmjDkGiFP1gg4o8244g=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VE1PR04MB7294.eurprd04.prod.outlook.com (2603:10a6:800:1a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 14 Oct
 2022 10:35:24 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::a67a:849c:aeff:cad1]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::a67a:849c:aeff:cad1%7]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 10:35:24 +0000
From:   Vladimir Oltean <vladimir.oltean@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] net: dsa: allow masters to join a LAG
Thread-Topic: [bug report] net: dsa: allow masters to join a LAG
Thread-Index: AQHY37EbhlvBmtu7o0eoddkb5SJ17q4NsfMA
Date:   Fri, 14 Oct 2022 10:35:24 +0000
Message-ID: <20221014103524.xlcu4szxug2xlb62@skbuf>
References: <Y0kusYUT1zskwnXI@kili>
In-Reply-To: <Y0kusYUT1zskwnXI@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5136:EE_|VE1PR04MB7294:EE_
x-ms-office365-filtering-correlation-id: def2a8db-88ec-4d87-780f-08daadcfcd81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e+HzG/QCbxxZ8ON6XrmpSZ70+iuq+ayNt2WPvZKQ8L2hS0a3hA4EepEghLXBepr2eqrLNK/UZL/ZdcWj8FnPgteAwwr34GIB5x/Qapy4V/ToT7lqMgBceWVu2+EPovJ4ESmJhDjf8pQdFTekQL+px2pMDFGU4T8OX41wYebk6JrA6rNa4AdRFV3sMuqPJBFtZcJlK0ouRSv846CTPmIXOhktqSxF/UBjYhT60GHgusVVIhKP/tDCujt14oKd6E5/JrJdxv5PWj9C3aO8xIg1ybzmzPI8SiELEHlNMTFPIAz66zGmxiL85IsnpbQk+IR3Xel9kM7QdgQV/mEtKnRJ+hgNBpZ81VkSNs/iEMb4xZS22OXH6wykafeWaFaX4KbcJlox9YNbl7UN4/9gMOoki0GNUrvOGLszAR5ex1A6eSvAvAXrmVZcfyHEEdBbKaW6Zf8jZCDOP6hNzjCUSq6r8cmDTQsJB67HcejmETUoBdIDXc4OBxx+mM3LtvExNgtAtCd/wNpC1gKLzCr9kcWmo1Tp7fylyUaiHa+7gkde6wXwGn3ETZ6GX72h8YKXw9KeWEDxFTIiBbnKcTdkL4nUOWiQ5IJ/CBdEyyFru7FKIHM4QWvagtuoWZw5uBKvZHxH5I4VThYpt1TRZ7Q7+UOrN3hoyHp9uMe/s5fJvN8vuZpmdhC0hHHxJDrqdYYHqIldBgbZ4x0m+1H4JnI9bz4jU/5HXO6x8AfL5+FTlZEj2PN07FhxHGP+kmGAcxNj/Fe4lN0cJSlviBMugwqnodvubw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199015)(76116006)(316002)(478600001)(6916009)(71200400001)(6486002)(66556008)(66476007)(64756008)(66946007)(66446008)(4326008)(8676002)(9686003)(26005)(8936002)(186003)(41300700001)(33716001)(44832011)(5660300002)(6506007)(2906002)(1076003)(83380400001)(38070700005)(122000001)(38100700002)(6512007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QCV+F6O6ucm9tjBc9w4gS0Q3/C+F8l4VH7hy3jTDwpq05ZQp/koG6uU3KSIP?=
 =?us-ascii?Q?GArV76qGcVgMSnbc9Rp8f4gOXnz0z9ulUnlP3gZj4z+johnOdSv2EDAtvDSe?=
 =?us-ascii?Q?tgq6ZQkvH8kNkjuwuVF4Zq4hJyKmHKbwnhGGOk1rls10OGCShdxuXX9u6ea2?=
 =?us-ascii?Q?IHBOhhVAVrTp5wrCJrO6gIQbJCxwLjv2o9RJQWSWoE2teHl56iZS9L2Ub7dH?=
 =?us-ascii?Q?hF5Cyws77EKDJY/saYlPoQioDPqKgGWhM3g5y2AyqCcygSjq6aH43LbUcz9l?=
 =?us-ascii?Q?OwxcT1ifnEMGQHfRLtFg4cGrI9807j7hpgZkFQhNkYZ0n5Sh/YGYiUFaWAUs?=
 =?us-ascii?Q?1GybIKFgYGmEYN4IOQ0pbnW4Pyoqe5bd09axHiHsNMKrFXnQ0wrnGBWYgf1Z?=
 =?us-ascii?Q?mdr2Y77S04CG1zoRaSjC1h4vRYP6GvMax8cmNwoiXfChov+5CYWAJhKtejFS?=
 =?us-ascii?Q?iyADVD6f92+V8fHq9Wtfkto0Xn9A8N8JdXAhW363KqJ4nFhHuIL9dbR8esdz?=
 =?us-ascii?Q?W5A0rgW0s1BY1rhGe8rfeLNHMFmlWk9w8dT84oPIQIMcEmzdnRXgmh4o18Ul?=
 =?us-ascii?Q?pmp0ArWxlvX3czgANv2NKOMQQinj6n/PfBR07Y75HPfB9Xz/P4S/1pz31wS0?=
 =?us-ascii?Q?5454GSPnXXEb8/PPk3nWSRn3JP0ZSOn0Bz4FkzoBP64HTYGYIhyHEQVSGcwC?=
 =?us-ascii?Q?miuXe0JIxaeNWFEBKREKddFbcazxdJ65P5Y+cwb7DM6yo5OOERT5nacSVdnR?=
 =?us-ascii?Q?HUrkDGeS2qZfkNQjq4WuH8JvS0o2EuVd14wvKuS1UrJIgzah42KTCn/Ksu1t?=
 =?us-ascii?Q?hHC6DBL2vJheG5h9aa44zAqJOG78LIX33VmChH/lGsbztB6IXSLInSnXXVPg?=
 =?us-ascii?Q?KJu2s0rQ00hZ41q/ttWkK6x5Zaq1vEKWtlelE0Im/NPHPWc1cRMs9Kp3yMZ3?=
 =?us-ascii?Q?wIurFq6YQ2iKjc60QtCEFOJWySK3dyrqcFVq/uIHIbpUr0ZzR49+i6lQU94h?=
 =?us-ascii?Q?SyDoUrFBJ0iXyKBztnHHLSKTKgYuwjRbmtvB6stvifBqJSTkKXGCfUMOMm7o?=
 =?us-ascii?Q?E0pizo5Y8Aub7PLmuRTE4J4pnmDssQwOt0+RqrbauJ7cLE5/PPEmnsh9XZkJ?=
 =?us-ascii?Q?OpUQO8nrY6l6wTgMAUQZI0njY91LBVdn1JsSzjhokJ1tNn3Bt/zVpUKCqWES?=
 =?us-ascii?Q?xPvOmQDcZqUruhfZLYH6KdT9/9wFwDbG5hH+k0uNpik+B0ffTcBwD/iToryQ?=
 =?us-ascii?Q?0c1gUaADySLeOa9qWPcdv+HlsAr8p+09dQhNXg5RJp+aScmpXHM3Sj1eo2tP?=
 =?us-ascii?Q?xgUwqUn/DgjJZ4oh/VSK3AuYlaXDCxbrh8vmzo1CiNRBiWCqzmpwLFoKCaa8?=
 =?us-ascii?Q?pqmZbkfmeULL3/tDtDnbAau7DZDBy1wJTnbad647uRi7xn728jd9dis2xG3f?=
 =?us-ascii?Q?Y1kdgybEHysE7AF9vVSrBTYyYW5GEPsDSgAGhcWhktAOpwvP5pNhgPzkB6XM?=
 =?us-ascii?Q?MzsebihmO1s6DrxIe9G9Hdmz81p6fumZpsuigAKj6HgC7bsVB8Ni+fVYMd+Q?=
 =?us-ascii?Q?p2yyP5qhvhG1KwdSopM24xnI7HZO6Q6AVy5OvpeaGiYg5PQhCmRT2eQShwzH?=
 =?us-ascii?Q?bQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <362A2370D7568B4A8288FB38937E2059@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: def2a8db-88ec-4d87-780f-08daadcfcd81
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 10:35:24.3527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UbN2m73zYKi5qMyG2+NIrnwbTM9UrGH4YvKo+ib4dRVjC/OBcGUTh4cq3NAXHl2DAWJw0EX+wgkmws2w+fR0yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7294
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dan Carpenter,

On Fri, Oct 14, 2022 at 12:41:05PM +0300, Dan Carpenter wrote:
> Hello Vladimir Oltean,
>=20
> The patch acc43b7bf52a: "net: dsa: allow masters to join a LAG" from
> Sep 11, 2022, leads to the following Smatch static checker warning:
>=20
> 	net/dsa/slave.c:3165 dsa_slave_netdevice_event()
> 	error: uninitialized symbol 'err'.
>=20
> net/dsa/slave.c
>     3145         case NETDEV_CHANGELOWERSTATE: {
>     3146                 struct netdev_notifier_changelowerstate_info *in=
fo =3D ptr;
>     3147                 struct dsa_port *dp;
>     3148                 int err;
>     3149=20
>     3150                 if (dsa_slave_dev_check(dev)) {
>     3151                         dp =3D dsa_slave_to_port(dev);
>     3152=20
>     3153                         err =3D dsa_port_lag_change(dp, info->lo=
wer_state_info);
>     3154                 }
>     3155=20
>     3156                 /* Mirror LAG port events on DSA masters that ar=
e in
>     3157                  * a LAG towards their respective switch CPU por=
ts
>     3158                  */
>     3159                 if (netdev_uses_dsa(dev)) {
>     3160                         dp =3D dev->dsa_ptr;
>     3161=20
>     3162                         err =3D dsa_port_lag_change(dp, info->lo=
wer_state_info);
>     3163                 }
>=20
> Can both dsa_slave_dev_check() and netdev_uses_dsa() be false?

Thanks for the report. Yes, it can happen that the logic falls through
neither of those conditions. "err" needs to be initialized with 0 in
that case. Could you please prepare a patch?=
