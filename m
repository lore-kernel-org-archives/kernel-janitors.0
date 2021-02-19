Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160DBC433DB
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Feb 2021 10:43:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF93D64EB7
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Feb 2021 10:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhBSKnN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Feb 2021 05:43:13 -0500
Received: from mail-eopbgr50077.outbound.protection.outlook.com ([40.107.5.77]:13870
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229720AbhBSKnK (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Feb 2021 05:43:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJ6Yknj5Es8hruR7v9kOUlarIUMc90bxawawqVIOBWWdUmnV3cbLxOI/nyIAAEH4nuDNWzSWAjRgxdy+L7o67ordV6RMf8dluxYbReqec5D1TUJONkaBLtYWZQeANMffdIZwR7tnh9NjGeC0uu5c2zF5T5babNqsj5u2QF1G1q6AdqekJ8l+wXf0BZwJCYD0+HL1Ys7Ux7GIRKonb3T+aME+fuUSY5qJh0bs7Dv8Z3MuyW+Y+egwrbkOTIIm1+45/WaxzzNTppR2NXbJEcGHDzhKE6rH0H011t26RNFK1cuYCRot+oF+8F7BfFVVaITjLhz29x1nBXAbwxAl5U3Ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX2Df0b1i4Ahue11904aRbJsDVhJKJa356FpKPCXDtc=;
 b=XVEUlzpwA0+XJGcPpYExKNBqQ1++8MqEInD8aYS2bMlz/9hv7dIjyqZmhgGSrITFaUp7LxeHj1T2WaWZ0kZwotT/V8QNEzRWoFhImV6kPHBo9sx9YVLTA09N7+9hkLE8EHJgxJX0lXqs3xTuzBw5qIql4zhvNPhD6g/ykZy5uq8LDc6p0+n+G7Eh5xJtRl6f+Hv8JDcKGkY/5tn8Z0wPuWu+v7ijlpigCOtKRiZ8eJA1T+dDXl3/dSwdJpiI3aQ1y05ds0InxKdG0miYwrvYTs3LGxXJ3m6L3Xn0f/9TCF/555ryFBOeyM7M84RYXf2VxRgge25A+okK3t2vKmmveA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DX2Df0b1i4Ahue11904aRbJsDVhJKJa356FpKPCXDtc=;
 b=JM26Ml5irtxoA476YWMRbhi+t7vAn5Cb14774hZ45GtRSbHFt5TGcBkY5OUkIRx5jF7kVl0L4DY3F8vHST7OY45r1QrguNglzSEOA//pHU4E5g7iffjqV329xVAPwtg4zFxp5rYLvM2BDe+Mha175HR6/L3MkWv4gOWbRH5PD6w=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR0402MB2864.eurprd04.prod.outlook.com (2603:10a6:800:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Fri, 19 Feb
 2021 10:42:22 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3df3:2eba:51bb:58d7]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3df3:2eba:51bb:58d7%7]) with mapi id 15.20.3868.028; Fri, 19 Feb 2021
 10:42:21 +0000
From:   Vladimir Oltean <vladimir.oltean@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] net: dsa: tag_ocelot_8021q: add support for PTP
 timestamping
Thread-Topic: [bug report] net: dsa: tag_ocelot_8021q: add support for PTP
 timestamping
Thread-Index: AQHXBqU0ZysDep2RvkOeqE5ZYBUblapfSoEA
Date:   Fri, 19 Feb 2021 10:42:21 +0000
Message-ID: <20210219104220.6opb4lmldcd2f6ug@skbuf>
References: <YC+Kwu7aO+yWAilC@mwanda>
In-Reply-To: <YC+Kwu7aO+yWAilC@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [188.25.217.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c1579c6-f9d8-4d88-8765-08d8d4c309b6
x-ms-traffictypediagnostic: VI1PR0402MB2864:
x-microsoft-antispam-prvs: <VI1PR0402MB28643658106176AF7360A262E0849@VI1PR0402MB2864.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y/gsoM3JHsIYHJe12qLjvSCDppkqXRTrcPTTzTuLaQnsnX4aB9dDpO1uZFfcqTNJrCaHMeFEyvv83RasYWqp2v5i3pm4IwQCcpm+EhGmZGTB1Rv1cGQz1awsC93qJR2OIek8P9/Z2zPegADxrCV6CUoNAqpXGU1qCZxmJFY4zCm+1e/n8SzoSLSnhadbqWBE97U4kd+TLRenK+ehVF/4WCK+GxY9Aq4qbYqqPrD1pzwl0rIgKp0VuzBFdZREqnIpISwAqLaCevVEzHmwGZvcx+CVEszR2zHp3wA3OBGnTKBs+VADjXvJfn+/uzssyKKHIme6TRIjQqyvQDgKfStW0bObkDoItkw/HeYMHjLsf9IoLqBtI/DsiE8Z2UG72FuKbxB4QU526+12StzqNreMY82mQwyHOHFOEkjCzSf8VsZLG+mnnlBG7LzSY78M8G3AbpLYfmjpCMeMMxqfqJHsWVa3rz69ER8Oh+MOdI//3pBBS4/dmNLyeW79aqktp0sqq2gY1Vdelgwi035vh4gJ4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(136003)(39860400002)(346002)(366004)(2906002)(26005)(86362001)(8936002)(6506007)(478600001)(186003)(33716001)(5660300002)(71200400001)(316002)(44832011)(91956017)(4326008)(6916009)(558084003)(1076003)(66946007)(8676002)(6486002)(66446008)(66476007)(64756008)(9686003)(6512007)(66556008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?08PSVWjE7XbCiN1lrsFvvbeG61oxYPYCCxIR0rmqqRiyf98QUODN4o7iOsDk?=
 =?us-ascii?Q?U+SefohJwyraruElQB8JeaxTUxTnL973k8AInljldVwu3sWgrdJBrQo/+aVG?=
 =?us-ascii?Q?BJm1czVWNBDHQgHuztNJi7NJQH7hSI47WrX9f9FBGwk9grcWJiC7wkppIPQH?=
 =?us-ascii?Q?+4cG+zOzdWwOut2KmxVosWPD+3H6rit6sK28LUq7/DB9WkBfANG7qA1vIKT3?=
 =?us-ascii?Q?jRTmR/2rL+9TwKB6bK3HniDRuIGyQTzMwnDMzDruECMTorIK1Db9m2jRaoTn?=
 =?us-ascii?Q?yuhUcsdleSzlaFI/BNznnFicewQIc4OqEU3Zr45GBWj7s32OE7vXcCGWiS9u?=
 =?us-ascii?Q?EMK47juTAQZAMwABV/yOGaDExhUppkic/dsUqVRO+cEFxfZYyRXTabz3tjL1?=
 =?us-ascii?Q?ctbTfd44AHzGaeKzY/O+UadYTcdzshgZw027rPgNDXmc04APmMZmWW3yEGWZ?=
 =?us-ascii?Q?7ZPY1tXjXK9+z5WAFC/w7rau2ggVlLG1ANDGBx8g+DyYmACwM5pdPjLuusGW?=
 =?us-ascii?Q?ButMx2MYj4TpChkBM2kAaU8ThBiP1DshpikfW5rwbG/uxsDWbxzr3cbraQN9?=
 =?us-ascii?Q?daTe6Z2RNRhhlxA3G3UNWR/AjW6Wr0NQt14cgeZyCXO0k1RoD7xb4Wu+IaVN?=
 =?us-ascii?Q?YY8DRfAlCynpqDIhdOCG+XoznUOie+WpW5ey/aC6+XgtUZYC3quJtecgc+Wf?=
 =?us-ascii?Q?RSg+r4D0mVmtgl0bzpT1ujqclGD6TBZ9nJJRtsYVmhVwIobOWIqgQULyTj26?=
 =?us-ascii?Q?k8m2yi4oXid0O06x6BP5X4ijv5NhSBgEhEfGrwDIV2ItzH4xQq6JJKONk5t7?=
 =?us-ascii?Q?V4zeCBFpacWl+IpRL5zg62k1D5RMkRJ3TX2S1+AlEAtYCAG3JmHaWDAGh4Kg?=
 =?us-ascii?Q?6cp3ScWKKl+jqoToTWnLKUm9G2QD5RpzY5RQP02iLCCAHiwmFNymCk2qW18T?=
 =?us-ascii?Q?aDGVR2jgU834Dz3uWfHOX5Xj+EwNu8a5WWbidIvphTOOWsLMKqrSd0kqvpiY?=
 =?us-ascii?Q?rcswrus1N+jzBlOvub9Q7MYKABt+VrQEjI/+fdndDqp6RDe2pt2XqnOmMHgH?=
 =?us-ascii?Q?IlgRwE9/3NdvSU+1xNp2z7V1Xe/ZvAq6CTyAp9cebgpPJIWXhtxQ9NwtxsVX?=
 =?us-ascii?Q?XOxyCAQuIvYyoGdn1kX0yPdwSZGUfLeLTl3QqbE/DmqS9/MtuIJ0JlRjFbTW?=
 =?us-ascii?Q?tkdDrGcOVRDdCWTjk1DGK06110tMUeoJNYomSCQ6xcLsQX+9UJp/ktTde4JE?=
 =?us-ascii?Q?ZrrIcyUPhqG9HVLB8Jx/le3RneyLE7H85xsaVlENNezejGMdMt5FQwzhXOL/?=
 =?us-ascii?Q?FhFPL8gD8QFkSX7uCj0PJVSC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9665BF93CFEB5740920C4A8502EF754E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1579c6-f9d8-4d88-8765-08d8d4c309b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2021 10:42:21.9103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+X2kK0p+ShoO9bV7fWy9vRIur0V8kHmHkBAJxIIEjfRK3wKkh4gEC1xcGyC7dUIZg0T/rAWgJjmHSfSZ5TOJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2864
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Feb 19, 2021 at 12:54:10PM +0300, Dan Carpenter wrote:
> What about if we don't ever enter this loop?

This is a real bug, thanks for reporting. It would be good if you could
initialize err with zero.=
