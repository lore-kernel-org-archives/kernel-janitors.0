Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C22101C4
	for <kernel-janitors@vger.kernel.org>; Tue, 20 Aug 2024 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724173385; cv=fail; b=Nhu1ZrHzBNJ93a68Q++X7cXmITrhHFwc2g5vNxNKWr0D2pdo7VGi/yNp1hWmh0ZM/1i/lgyl53QrIRjORq1LT5PKEwBQ4Xx3fqs0ZJqwCdKv0oOuilvdNgfKJw2n1n95qg6j6DXntnSyKn+F55Q5ORuZV/IM3s5yF2DBFr/X+ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724173385; c=relaxed/simple;
	bh=LIqYPqiZzooN7kkDfkkySuzrWgUN9Giob5gElG7cO+s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g/0tqXDtr9rFe9uK0mQ7N5RRA5sZsENOmYcx8RvRgExSkMmyzVG7EexPMvWFJ6VSQUOGJDBAh24qPkFCykC6Zu0Gxh27rhfJZcalQStzgsXHg0AFo6DXdCXCfVJjvwlfj8XbtrHljRlIvukHul0h/ODIstqDj2OhAYWgIJ7oRfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b0cbWxSi; arc=fail smtp.client-ip=40.107.94.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b0cbWxSi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EO+O5lhT5Pp1rwDlzNjngFnbgcbpfrfG8mWbaI5uakquKmL36zeNLwpfjPvbEK3O1cz33T3UIpKvLv1oDkME84YyQHOiJ3LCLJqQPUM5FMm1sWsIYnrOvUlgclAxltEpePiFbBI76qsu/2ZqW308B8rZGaQfa4hVwKeCmE2aWsHoL3ZcEGAKxdeiX0pTKcCMEuwD6dXZPRVIK07PvUQiGNz8GjzfN1XjWzqMBMTu71eWMVPTbLooWscNSFF54rgb7uus8jpQdIgDNAhbAs7m4LYfqFTkuT7+9IUIdNRuW/ff2LxpySWILMBEKBV6+PRTyJFrNF1O+xwrsp2SRYAYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KaY12iDHP5ZSJJLvLksjnLGRLaZA+cmFlHtFwpIz9w=;
 b=Dhu+57dT+PTT+p52L81mL/FaMhk+2zdnfIF/j0pc86HY/xbwTy1TyBsXXm2bjwya4qrF6MWbZAINArNEEP2JhnDlmaj8wtzelP1FkD4qWpYsxWBb71Ja0DhDn3EEKwBp9TORFBsG28qHiY7JmXAjZeQAE9gUuvHSO7i+2uMViaUVrAIgDZRyh9ny8HOM0gclA5mVaixkIIyhHUhqnbhBstgvA1hy5RcqAEky7hpI5ztxuxOxPERZBElvrp1NQXQP+L0898M0dupfiNYdtMM0h3JnnUPYkgNARmRXIkVylCmRMsy9qr61jffnRo6kVPikHAGtCXj2c0CQZQomFsNjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KaY12iDHP5ZSJJLvLksjnLGRLaZA+cmFlHtFwpIz9w=;
 b=b0cbWxSiJiOSLMXrff33pKvWTDUAENZDJyV1xKCxpitmel79qQqXJZ+cjyFO+SKv7MPa74km+qM743G7v4MUiYpUhtL7W85EDfS41Av5o/IjkjbhukfxSwk758NCO5hGAUfX6vnMkOGuMQ5RV4846sqMlWN32B4tX23Zo8vjYe5ksGs4Qr4yP5OUo5GuH8Du3lg7vMOEARgse9qFQiSetLho7MTbLrOizPaYfdpm0FxLKQWO6qE1Ojs6o1xMWEUjV3nktUBRdn9EwvMGF3CHj4GdWKV5RX85UAyosqAFYSFE8qu1ZGoGHd/OxTEx6NdNmas2WURI8oZavNSh0OnPUQ==
Received: from CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14)
 by PH8PR12MB6700.namprd12.prod.outlook.com (2603:10b6:510:1cf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 17:03:00 +0000
Received: from CY5PR12MB6646.namprd12.prod.outlook.com
 ([fe80::8880:c187:3bc8:e17a]) by CY5PR12MB6646.namprd12.prod.outlook.com
 ([fe80::8880:c187:3bc8:e17a%5]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 17:02:59 +0000
From: David Thompson <davthompson@nvidia.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [bug report] mlxbf_gige: disable RX filters until RX path
 initialized
Thread-Topic: [bug report] mlxbf_gige: disable RX filters until RX path
 initialized
Thread-Index: AQHa8HIfMzuALaSzzUeuUyMsnKFNG7IwZIVw
Date: Tue, 20 Aug 2024 17:02:59 +0000
Message-ID:
 <CY5PR12MB6646444576F9368D3F1D0F31C78D2@CY5PR12MB6646.namprd12.prod.outlook.com>
References: <9f301498-d8d6-4ff8-8208-6b86b557f2e5@stanley.mountain>
In-Reply-To: <9f301498-d8d6-4ff8-8208-6b86b557f2e5@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6646:EE_|PH8PR12MB6700:EE_
x-ms-office365-filtering-correlation-id: 5cc6d831-b589-49e2-79b4-08dcc139f21b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tpJ1RgXoI5eOuuNU8F7lmNK+t8W+oNe+nO++hnpE9gUGQm7MaolMvoYxgt8D?=
 =?us-ascii?Q?Gbuk4LuNX+yeXD0HRLgXLtALTWz6YgI+7MMirIeQ0gwll4/UaklFinmnD5Zm?=
 =?us-ascii?Q?vD2hgE4DiHxdBoPDX/z5n6z+92mA3mw1lwSaeqZzCp0DmjRg1Tc0pG+izA6C?=
 =?us-ascii?Q?ocWYzJGV814CYuQ+16AMZUXEyRn0duw2D9+HLbODRh6G+8GICogJb/nhBzcT?=
 =?us-ascii?Q?ndKDVOfgWGoe7hf/qEDXfcoLsYgXK6AZgLbZSg0CjQNTpee3RC5svs5FPE15?=
 =?us-ascii?Q?eY0GLP+TvAS45Op9moQ4mjei/eHHm3yTzNHIdCuQ1o8hpAemYmRg0B08ZbK8?=
 =?us-ascii?Q?tRxO85mHqzSsVFZxZ3wTadR2vt7tJsmiqNB89kKGOi7/Cf4r9UIf6GWeiK63?=
 =?us-ascii?Q?WenYb0MSPLihDEAr3x5EY4lI5ukQq6KMdlbWQRoOzYPIxVonm+fB2oQ57ij2?=
 =?us-ascii?Q?s5oplrX4I9bwIfQQcExlJN/cOmOxxfcYQ8kFetbyaZ3AEf3Vb0ZktgBRRtjj?=
 =?us-ascii?Q?T6aSJaJKgi7ZJv13BeElIgkNh4nADrT1dZUzhFf+FUiHsCX/UIvLJXhMoeyh?=
 =?us-ascii?Q?BOczAx/bLxPRg4yqD+VeB4c2t2wvKBlLcO3J/mQCnGqYCUAeMphlfoytBG6f?=
 =?us-ascii?Q?0bXEmocil6/+QWU98MJhQOIdCivtw13lM1S9fmOa97gw6EhRD7lkx+YcV5QK?=
 =?us-ascii?Q?j/ScpEAVLP0R/CJycyxLCw7+uW6cXUWCl6+INmHa4DGuTl+Lyq8UON8ERHp/?=
 =?us-ascii?Q?jdn2o8saXyY0Iu9MRKkL4uV8Y+boHhsupv4an9IIYKRTyBdQ4g4NkE6l1V+f?=
 =?us-ascii?Q?w9PowpKnusWqdXcvq3EMOrPaQGiuX9vzTMjTdtFC/ZGuMQRH0zv2q59VnTYx?=
 =?us-ascii?Q?gGRBB+3W72pGy3hMR2W5N1065RWPQaIOBuDJaqwvagRKO4zTkhoAZQU/owkN?=
 =?us-ascii?Q?bybf8yD1WY0ROm8ToRZnCaEJ+GmzZWgJZbdnQbhR4oQyupwzj/axcu7TlEFO?=
 =?us-ascii?Q?tATnl2nfZqs1XTluiyuh+pijPsb5tEiOR1GzvVAfBwnE0TVBdJ69dyTaw0BM?=
 =?us-ascii?Q?O6fWnllVB5T99Qrz1El8MMi7Y0Qc7jer5mgsGWMxVtr17W3vNcTjQo2iaaMd?=
 =?us-ascii?Q?9BmryjRqho+loTIySmLBgw5Q50l6sEl8wg8rJRSjPlGQEqElC/c3Yu8+ftih?=
 =?us-ascii?Q?aMh52dINEHc7XHS3GEvo0RyWX36y2N0bDm0FOQCUgG/BLzDcuyFPMxhf8ODs?=
 =?us-ascii?Q?DhwzBpPEeqWlzsM8tLCDuct7/Pji67lgE65T2RkySD59lZdttG3jUGs5In21?=
 =?us-ascii?Q?1B9cEYju5V8nBann8nIyhV6Vokmb5yEOqhSarE4Poi6cThE2pDQy3k7fJCv6?=
 =?us-ascii?Q?rfDRsfG/KoBtKiWFnhWUlG43ALdebmcHXZC62u3ElBnnjV9L2Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6646.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?0q3t0tK/atK/YRs/xBAcC2wQyXBAptDv7AddrWInxQPDDmlzCSl9ACCkLf7E?=
 =?us-ascii?Q?tM4Gg4VlM6uZwReVrPpHl/pHW6BFISBACy2hk2zmKmAELB5Rj/dVzKGEFl+D?=
 =?us-ascii?Q?YcoaOrsjPuj4ZO4PGr1iMVHG9FlBU3Zc43XMaextvcTL9c8+7R8fo0BwP8Hv?=
 =?us-ascii?Q?vJ881js9B1/iaD6ePNaqoGcXAzqiSoZhTlAFrEC30Db6LGQeWSRW2AMBdPNW?=
 =?us-ascii?Q?s+FQjkx7kd6Rswy+Nvu4wr5b+9NbBCmKEwnGe+Qxm40NXJMOst1PSlZJutoQ?=
 =?us-ascii?Q?LPR4BcvWaUw2ixuH/Rt2BfX83Rq/XGVEyW3/uAc49OF9h0d11eA8XFSM6u9v?=
 =?us-ascii?Q?D0apEht64Emaw/ufsLXGx8hpiEqBBMzBPz9IrWjw+uSB+QQ3SWwe70O0NcKR?=
 =?us-ascii?Q?tROvP3BM6d0nL2dl2Xpn7XZHh7Q0Z0nYRF3BQmka2eb87vAJKQpjgnrl7ku4?=
 =?us-ascii?Q?aAlmJt5G2s+v+omf0CKYP3OWS8wl4v2YMz4/BXxd5iijCbEYXVVcLh6+boUQ?=
 =?us-ascii?Q?6+cQUYwRM5lWUtRouyhfzAGV2Z+DRMKHz2BqvBX8tf0iL7yjyUubS63Vf1SL?=
 =?us-ascii?Q?LjciDa6WGmywUZ8lurQw3LCL5lDQSbOHLeknlb9n4WzotWowf3P/ImgTXTRA?=
 =?us-ascii?Q?bwOKKfT+H21ZOg6PXqTQrJjqnu1fgM7Tu1FgR1PInBBM2B0ioY4mvDNVTk9T?=
 =?us-ascii?Q?N+vFuiGBYl+X9v/ANVSPQA2Q/of9LvZKT8C8LH+pRuRrAe8LTQfmuFj/xGlu?=
 =?us-ascii?Q?N3ZaAeAe9vYNedxqoM4rfJnl2BcLHNtYoh/5ke6yOk5iufxDVoU98gskvjC+?=
 =?us-ascii?Q?F7uz1M99xTHuqBQ0yawd6+LI9RzpK2TEpjfJJPWWACyPmbLznDmowN862LMV?=
 =?us-ascii?Q?bQGNpjG7vEtApuI4TJATvJ8RvfRiW1eH5e3XxfrKfGfDCVrMysBiNf2jdxvc?=
 =?us-ascii?Q?p3zct4v5wvG2XIG3vp/UNZGmQaviR8hVdCt9Dvi+ITXwxWx+ZwFHfGHuoyXQ?=
 =?us-ascii?Q?1oDg0m0KR6v+ohvE7vh1JZIpZfqf8fKJ1pyd+oWDfrjDYgAiOLix2XMv2XSN?=
 =?us-ascii?Q?C8B/aCaWlsocZkUz5CC2siy+gZeOyQufQj67F3e6b/D6tWEtuOz2aP0r7lGm?=
 =?us-ascii?Q?MXl983RgbPVstHijBcBIt6UnUq9hVuvcGKXlyAzfFqTHceFjClUG5HSj1w4w?=
 =?us-ascii?Q?jFIWkFVL4owULYNnKGyBgx5/T8mL0MXnU896lf22S88iYTEUtBkRL15alb21?=
 =?us-ascii?Q?mQbjDVwqQiL7+uaKt78tSFLDVd92FlPe70619Ink/09OSyJG0TlDoXJSpkEi?=
 =?us-ascii?Q?hNKXNAyUu9lx/+B1RDA/gAjOmn19aDcm9IGceY3Nr3wiWY5L2PBGryqIZFx9?=
 =?us-ascii?Q?369fXjNKejGrCAcg5vETA088TEesz2yGRbm/Jt2S7m7dzJvB8HlGiDol+mEs?=
 =?us-ascii?Q?+qLytCmk2m+NKtx4thEA+76si9gQaJ9FBziJGmFLKldw17Ai+M3h4C6ygQg8?=
 =?us-ascii?Q?3KwdnOoH8JFpLOBTlopajw4LnG523oca/6qY5iU9vJfYwWF8BPYv/6XuYvVh?=
 =?us-ascii?Q?/1udSHi/OPrXNw5PdCMKHtBle4qfGSw8sgVNKcwb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6646.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc6d831-b589-49e2-79b4-08dcc139f21b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 17:02:59.8739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+D4f9UGdLFjF5KDJt84dqdkenNiygiKEQPyGXR5YPEl31l9FHHTJ0Y3El0aCFxqwt8LmkOtVk/kQhZ094nMEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6700

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Saturday, August 17, 2024 2:53 AM
> To: David Thompson <davthompson@nvidia.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] mlxbf_gige: disable RX filters until RX path initia=
lized
>=20
> Hello David Thompson,
>=20
> Commit df934abb185c ("mlxbf_gige: disable RX filters until RX path
> initialized") from Aug 9, 2024 (linux-next), leads to the following Smatc=
h static
> checker warning:
>=20
> drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c:30
> mlxbf_gige_disable_multicast_rx() warn: was expecting a 64 bit value inst=
ead of
> '((((1))) << (1))'
> drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c:54
> mlxbf_gige_disable_mac_rx_filter() warn: was expecting a 64 bit value ins=
tead of
> '(((((1))) << (4)) << index)'
>=20
> drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c
>     24 void mlxbf_gige_disable_multicast_rx(struct mlxbf_gige *priv)
>     25 {
>     26         void __iomem *base =3D priv->base;
>     27         u64 data;
>     28
>     29         data =3D readq(base + MLXBF_GIGE_RX_MAC_FILTER_GENERAL);
> --> 30         data &=3D ~MLXBF_GIGE_RX_MAC_FILTER_EN_MULTICAST;
>=20
> I don't know what's stored in "data", but it's a type u64.  The type of
> MLXBF_GIGE_RX_MAC_FILTER_EN_MULTICAST is unsigned long.  This means
> that on a 32bit system, the &=3D will zero out the top 32 bits as well as=
 the
> MULICAST bit.
> Use BIT_ULL() to fix this bug?
>=20
>     31         writeq(data, base + MLXBF_GIGE_RX_MAC_FILTER_GENERAL);
>     32 }
>=20
> regards,
> dan carpenter

Thanks for the heads-up Dan.

I will review your proposed fix and verify with smatch locally.

- Dave
