Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4662FC47082
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 12:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B9C36135A
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Jun 2021 12:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhFHMjE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Jun 2021 08:39:04 -0400
Received: from mail-eopbgr00045.outbound.protection.outlook.com ([40.107.0.45]:39158
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232299AbhFHMjD (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Jun 2021 08:39:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGjzHqXj0a3YX4BqqNcU7JnDet9EK145XAXNEmE3dEmABUO/fO90z2U6vj02Jl1GcChvNUeoy0xWXU7SL1dca+KE2lV1PqX6XbZvRGpzW5eWJRBQpggVED0/IqZbS/cZ2+xrw6Q/OJKC3p4aHHNLpSOvRC7ZqDVxWeX3IbqcOXB9JLrEABrbuIisPfdx6f3SwDwoS1cBuNLjU2FZB1qCmGcHCzXrvOl3jUNZGnB0hyxR53OxUyOwYdkL2BQklRzW7YaLsVVg+pWjxT5pULD0wW0c3QqxB8QjHkK/VQaHKZYmHssEHFQ8PME/2xGhPXV+NJjVpTpsD4aafYwMujZZsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+V3VLvbwwN8ffpEX5SJoDyvv+lDvk27XVES8Pvypu0=;
 b=Cp8I9MecCEoXpHTpgaq1WdWR/ByIbAMZzHxrzfWptjE4Orn3LQnBFNd1riRqhsutqxU7Fbb+A/nJpMg4Z54tltYHaktLodUZtjwOhmgkxmlKX46bDQ63JLZPGcMdx0TrHReVAGYkGTN5tszQZbuBTL89McGZYMytx7MwOXb2ACeM3sYPuww1xWII3w6e86IgEATP9qWN3Vwfg1xJzIIB4kodcocN4y9jFjBnRN1HYY+52PKbTql2daidF/YezztVjog4FRaxask8FBMeAYG02b4jOhkce3bHpVGdBbBK0y9rWV1PbvrF2/5gv21PWtC6IcZCrZ7Wcx9OwUEEgOMlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+V3VLvbwwN8ffpEX5SJoDyvv+lDvk27XVES8Pvypu0=;
 b=Ai1wuz296iUuwtxmjvpUwpvL3yJ5h5XBn9L2ZsRQB2OQwEs6HNcGxRTaetvG32VYaF4NKQQ4fYPs+KD3Uf09XxSU0s4pyW126cBHohep+uyCduQgAUMnRKlH6xKDa83jHt1ydGFHd3ElVkM01Hs5AmavnsEEU6LN0V9P6/Si5jc=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VE1PR04MB7408.eurprd04.prod.outlook.com (2603:10a6:800:1b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Tue, 8 Jun
 2021 12:37:09 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::b1a0:d654:a578:53ab]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::b1a0:d654:a578:53ab%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 12:37:09 +0000
From:   Vladimir Oltean <vladimir.oltean@nxp.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [bug report] net: pcs: xpcs: convert to phylink_pcs_ops
Thread-Topic: [bug report] net: pcs: xpcs: convert to phylink_pcs_ops
Thread-Index: AQHXXGEo3dmyRgEh10uuvG+r73x4MqsKDTsA
Date:   Tue, 8 Jun 2021 12:37:08 +0000
Message-ID: <20210608123708.eofu2dlgzop3d667@skbuf>
References: <YL9hTvz8QOo/+lu7@mwanda>
In-Reply-To: <YL9hTvz8QOo/+lu7@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [188.26.52.84]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82a8f373-a78d-463f-0d57-08d92a7a21d9
x-ms-traffictypediagnostic: VE1PR04MB7408:
x-microsoft-antispam-prvs: <VE1PR04MB74082DD1C31824D320AFBAF0E0379@VE1PR04MB7408.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xb74y83DWTx5S6TOpORktqV88VwthHt0mBKfJxt5ptvLIhuWNQJJHFiDH2Y16kpG2XfylKOCR1GTAZFxiyM4sNnglw7IoBHvYsw7Fs8q9iGS4BfaBxUKVOjzBNyBQr6c1eYvAFnAHCuxzTI31GiiB9hFfPb+vdmkUOiUthVzLouPagr1D+fgs4vrmUZ9BxQp4xUmfNpFx3kP1baRMgf3Ns2ZdALVg2pEHi0+VrNs/ygYuD2cT+kO3wLwgWjOAGD9xykURPtzk96W0fB9x+0vyhVStw10AVzzvyti3nZ1VqqxlBrVU/0tlokBrhq0c7PPCOCSBgm82E+rOrD3wP/WO9ERgrOO28YAohTVGqj9uYwE2sgHgQ1AwGDsQVys3idbq6n1bLXk3WtNkNRXG69fHODXmrMsVSj6Yd4YaAS1mwkJUWjSDZDl7qKgSWG2lSc6vKTi1zWuSgLoykBwVPHFxVnyBWiv02ztB38YoAJr+h0tfwCvt6KGgcQ5e00oAJykgM3X6w7VieM3Um5JJoqEJnt8MFG++S0qUWqBY+areoc1HfwEb7WrubKiW81RKZQ6AmoD/6SmH+o8IqohnGPnALKxse+uSlgSVBb6KgiEhlX3SG8ruEMYi9rzeia6TqxFN7pjfiTcO1XEhYeVVACvEPqn/HYcP0tu0Znv3DoXEA/KX7FIiHV0SSGkQBPk2cD/h5IHCH2PEAEXP8sb4jpsftze9S692ygRtnuUwvmhBOA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(122000001)(6916009)(66946007)(6486002)(498600001)(33716001)(6506007)(8676002)(966005)(38100700002)(86362001)(186003)(8936002)(2906002)(71200400001)(76116006)(91956017)(5660300002)(4326008)(83380400001)(66446008)(44832011)(66476007)(66556008)(64756008)(1076003)(26005)(6512007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xz0beTloRe4VnZfntf4Tb2y8bKkQH7FRnk+CB85u4VuKin5pwrI3eYx6CH5T?=
 =?us-ascii?Q?BLvkjz/cDsH9VXXfeSYjxvNGPZHY6MiVTdm40mOp92IZf4VkqHMT0NsrW8B0?=
 =?us-ascii?Q?6sGDt9WvlwNpa5ntoqrpEQ7NlVpKVWB4Zq9esKtAxQuUAZDzj/9oh/QTR6+t?=
 =?us-ascii?Q?ESJpBe1qg3C7o1waNbfwPGHkSryJkVATVucsqIT4H6ZUot+MssN9XynyWx0j?=
 =?us-ascii?Q?xr0jbuDTpkRXPzWs2BF6Lrqe50we42qnqQ830GD3IuVgoxzVUF8gb2dqAvBW?=
 =?us-ascii?Q?VFLXsu3kVPjaRa07fDirb/G+8zLtxNZhdikGWHAT+Zy21F3Q4oD6zBg9dmBO?=
 =?us-ascii?Q?QQawNiy6NPOJIOFHbfQDWpNxlnHspjrP8/OjEwnAa5EZda876d9GtkvQYexK?=
 =?us-ascii?Q?XkH/lpEHCRyh1H/dcOB3PNLxTC3KSzzpzI8zxZt58fv9TckkPD1G0C+jEurl?=
 =?us-ascii?Q?a8F+Jvcg3Nq7PK/G7v5Fmrr3KUA0jwtQVYqQw/SYmOPMAIRwgOdd/SnFQ2fV?=
 =?us-ascii?Q?xGMwH0uYgGPNvTLVYxvahrcka16ZtnoFlW3CZw+DLDJYkzBbsxPIcmgNf6bQ?=
 =?us-ascii?Q?thbrwPGem8i/YrARItatzhWGVJmC2TE/dW5uItUr98AkIMGQ1tEfBNgeQfBn?=
 =?us-ascii?Q?zXBkL0PclW0RwbyyDBlmeSMmwqpkWIL+ox5Yq0YuUScs8f5260y8/Y8GRHY8?=
 =?us-ascii?Q?jWHl/OvKJBMxXqP0j7e5TbKiQj/b9R1lQhvSiXiRePL9+xVeFMzYymBIKhVc?=
 =?us-ascii?Q?PCAk0X0iq4imVpherpw4oDExuZ26C7V3/ivytBrDBVnE5/rGu1c0fMfomDPg?=
 =?us-ascii?Q?3SiMgm1lKPKJ5m/1wqRQ0VqSZ3BbEGa21M3WyKgt8zjnBDLP54ft7dzxn8Pc?=
 =?us-ascii?Q?Mqn9U10LsVdR3snmbyiDSHExGfP3ZD2OZIrlrO1A0SOudGrMgn37p7Qvt+4f?=
 =?us-ascii?Q?slc5tflneRQlliNfol3I7DvoAgbZ81ls6WISO/Am/Wsb3rgflPT2PtUj+dNU?=
 =?us-ascii?Q?ag0nKnL7zqowaNRiUJNyoDscrXNShQ+4uIV6vKO5c1UaSJYZZBaqGnYJeUaQ?=
 =?us-ascii?Q?BOwml9Ihezj0GsXD1Ct3SfmFWARUcdkhOeQVMWSs5mu8OttSzy+3OFL+k7he?=
 =?us-ascii?Q?1s+h6FWiTfT6hSPgkSJ3sRX8Arjck0wH6E5Ysk2heaN1LYKT0ah2KH3ETOtd?=
 =?us-ascii?Q?xzyz0/eB0g8hE3K/GNcJBfa7Ztf3m6mUKSRlHUAWPSFH5wwQHSOXg8QKlAyz?=
 =?us-ascii?Q?htr7ziNHFKpdpMcO+4woBfnPin9XEGMomvHZ8OSYEtG21bbxJc+Xs9Qm13xc?=
 =?us-ascii?Q?Lp6ChhAl5yk9kdE6GIOqT3WU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C07B2197C604444A957118D85E341255@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a8f373-a78d-463f-0d57-08d92a7a21d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2021 12:37:09.0766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mBexKk1l59I7w8ydi2i20Zkx5DeVSiRFWEAEdlDYCbnc675zce9IddLH5staDkRS38Pg6sqQ7xPW922b4gpvZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7408
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dan Carpenter,

On Tue, Jun 08, 2021 at 03:23:42PM +0300, Dan Carpenter wrote:
> Hello Vladimir Oltean,
>=20
> The patch 11059740e616: "net: pcs: xpcs: convert to phylink_pcs_ops"
> from Jun 2, 2021, leads to the following static checker warning:
>=20
> 	drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1237 stmmac_phy_setup(=
)
> 	error: we previously assumed 'mdio_bus_data' could be null (see line 122=
5)
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>   1215  static int stmmac_phy_setup(struct stmmac_priv *priv)
>   1216  {
>   1217          struct stmmac_mdio_bus_data *mdio_bus_data =3D priv->plat=
->mdio_bus_data;
>                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^
>   1218          struct fwnode_handle *fwnode =3D of_fwnode_handle(priv->p=
lat->phylink_node);
>   1219          int mode =3D priv->plat->phy_interface;
>   1220          struct phylink *phylink;
>   1221 =20
>   1222          priv->phylink_config.dev =3D &priv->dev->dev;
>   1223          priv->phylink_config.type =3D PHYLINK_NETDEV;
>   1224          priv->phylink_config.pcs_poll =3D true;
>   1225          if (priv->plat->mdio_bus_data)
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^
> This old code assumes mdio_bus_data can be NULL.
>=20
>   1226                  priv->phylink_config.ovr_an_inband =3D
>   1227                          mdio_bus_data->xpcs_an_inband;
>   1228 =20
>   1229          if (!fwnode)
>   1230                  fwnode =3D dev_fwnode(priv->device);
>   1231 =20
>   1232          phylink =3D phylink_create(&priv->phylink_config, fwnode,
>   1233                                   mode, &stmmac_phylink_mac_ops);
>   1234          if (IS_ERR(phylink))
>   1235                  return PTR_ERR(phylink);
>   1236 =20
>   1237          if (mdio_bus_data->has_xpcs) {
>                     ^^^^^^^^^^^^^^^^^^^^^^^
> Unchecked dereference.
>=20
>   1238                  struct mdio_xpcs_args *xpcs =3D priv->hw->xpcs;
>   1239 =20
>   1240                  phylink_set_pcs(phylink, &xpcs->pcs);
>   1241          }
>   1242 =20
>   1243          priv->phylink =3D phylink;
>   1244          return 0;
>   1245  }
>=20
> regards,
> dan carpenter

This should be solved here:
https://lore.kernel.org/netdev/20210604112825.011148a3@canb.auug.org.au/=
