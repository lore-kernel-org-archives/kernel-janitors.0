Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021097.outbound.protection.outlook.com [40.107.57.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26B36194A;
	Mon, 21 Sep 2026 06:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970767; cv=fail; b=E1dgI0M89A+qCxKKTeMgt1j77DqbWKc4IoBBUD0mLB3GtlbNOsM0rilIhE2JG7SVDTR1jFZA5tZaVBC4M3qS9d/bRzgIUVLP5z/QHHLZnk3MM2pHs9YXmalLrlUZQZrjQouFOOpdp1Ey92PXn+fI/hHy7INZW5z03j1X2eGkryM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970767; c=relaxed/simple;
	bh=18wHBjI07bMLWqIW/jFhsQMYu/nF9egsRPwsV6z5r7A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Y8UR8AC1HtETgNn+7FXwtdAidP68AwdfJU7HieoCG0a+2YxI2Z0OxMrxSmSqyziyi2nZaeL3WyG+sAdklen8ui/h8Q8nYpQRHW/pwAF76URmWZEjsUk6XbrwM1yxuzRJXSr5gy0Rg2Tj49AnqLdu47kxU7Qzag0Q7U2hOnkoH6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=I+8beFH7; arc=fail smtp.client-ip=40.107.57.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="I+8beFH7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWFD/95xgfwQPVB+q3bOMKn441y6+E9aJiGE9R4SWE2UVaZJAsau7vC7Wr0iWEKlComh4TmlT4fytf3lInnkmIbDLevZtLns9MHFlsEnIwcUmUADry18/WoWhpotPiXIszIVvQX70a2f8iKadx+r4r4WCQpnAZzTK9a1Rk+7fzeu3MX8TOj6H8GehoLD2OAhfImgf0VIMO9dN7zoTdqtPcPkJ4bf/MRdnvgcOrZstCldhq7cNnW8sAtgHsDMkCcs495doPwqzPgl5U7T6FYONzin6S1b4npI3l7pKQUchIMrIuShon3n6a1rUisJApZc3AJcVWhEn64X0odNRYpVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psZZ64Hw0m83uY7PVvl8okIUOi9NjLLYGrdB/CXSfFY=;
 b=s7utdzGYxOk38iRoyxi82mRjmzmHkZTB4R3NN8Aqsx6TW2nFuqxtpntE8kaWGrsiHF4EUzV2qOvruPbVeHVOgQPeADq/fx03j7Y53Q555S+WhSBnWNANWFn+cPu86fYOCvKPxKRJHK1SPNR6IVgUDQPbu/4KkhK6d6o5C5s7hU0l/ttVMcHA0nnITf7voe0ZmuGoSL137/CD445JB0ov8y/UqjkH35f15rPkjGhd0vQ72baVGJjjPhPguNoQcir4tEat1WQeBwVpbXVmqOEmxras26fjjLFYhY86fDolBJGFbYjyoChyM8o7GHv5tbMxUqZLWXkOsDWftea3NNvIQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psZZ64Hw0m83uY7PVvl8okIUOi9NjLLYGrdB/CXSfFY=;
 b=I+8beFH7lKZvuWOCtHoMYdpz2xSd1xi+S2kGY2AZAy89mwXKVWD4B/q2GVZbC9EZb0e49242IwEsQQ+kH+KqhAp/PEnsxs01aW0d3yqElbggrTeYUZ47y7BczgKOfkXTs5+22lz6JqFS3VxkVSUoha+FLDHJr8rpc+qoyUUTn3uPOtcvsDV1x+Aw2yRkev2ijg9B5GL022Wp/RVaiBIePxh60NTFtd/ApBK/Yk7Ln+CHG4i3qODvmNMEYyZ71aRboJGH9YfBRJakTrP3mshf/y+Tdf8ECKl7Tf6CEJ9UEQShkWhgBerG2tgM2fKQPIRqd9NxnKzdfvfl+nZ3kT/HkQ==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MA5P287MB4520.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:194::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:06:00 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:06:00 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Colin Ian King <colin.i.king@gmail.com>, Tarang Raval
	<tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] media: i2c: os02g10: Fix spelling mistake "foramt"
 -> "format"
Thread-Topic: [PATCH][next] media: i2c: os02g10: Fix spelling mistake "foramt"
 -> "format"
Thread-Index: AQHdSCTru+U7AFWtVUK/sRlWDaCpVLbYjU7k
Date: Mon, 21 Sep 2026 06:06:00 +0000
Message-ID:
 <MA0P287MB2178160DF47BE6F2545A497788842@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260919105000.1875554-1-colin.i.king@gmail.com>
In-Reply-To: <20260919105000.1875554-1-colin.i.king@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|MA5P287MB4520:EE_
x-ms-office365-filtering-correlation-id: c1c9b8b2-8200-4a55-0b51-08df17a668e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 uHN48Erc0Xu4zO0LstM5ih82emSepS628ogvQA7kM5Wwkp0nBioRmWbkPcQ/PX064RGCgMZPoo2TbVvlGwoZCd3+w37CMeYYk8XgnBvRD6Bbmv5wmniMsWmqNAcwFZAdC+5O4GWDIhyMGD5m0KRtJjSG3UDG05NqazkxZXkxzraKL/N3liSMnUg9qhNxu9SMLajI6wL498SlmQFAy1wxjM3tq0pLKjk6/Hx2QzmWbjy1br2qZPFojH/OCVYlfNGZcwtSiWYd00tP7B0EHlK+Oe5RXNNwGV8QWDzphax7LgmKNF3327daDbg94LSCbMqT5ipOtqzGwCTE0D8C8Ee09waW1y52lBqGRGFkYxcpzkpg8w7rgGI9zSWvfj4cfOeZV8CNAzmcqMHvRaKAWrapfbod8+hXavhW+xLD7aIhYD9svVN/iTL8B1KtyRwwha+NDyEno39kjD3WhrRCF5KMUgjovbslBtST8LwCSSSYlt1YmkcRDvKnvypblI2evjGcg8g/1+lNNLHV6ouo6hfT2K4PgDLT/NWcYIbDfeHs0pE2EuqtWyRU64Tfdp5vSceKiY8VEgVTQs3drO4UfcwI4ri0oji5dBjIfMEwtKqcCu+n1i0V0F9mEKy3KCaUO11CgKdM/Z5aGoCIxF5TTlYh3enF00lP/WjgAiR6F/KkNURpYRg7TYFYkE4XnOtbYercxPrq3Xv9lO4bno0/K5rAUyqicFQL9sK18CrR6IuJ8tg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jbJJlEIMtY6ujecyx2xoUJqO5Zvs3e9vS4hCisdJKP8J4MfRtzPV4iMb3Q?=
 =?iso-8859-1?Q?RfNsufF9XcrQ2ToJK4Op9MMikLAQpUsQiJun0kK3S0uncdT3qGGTlVFGNy?=
 =?iso-8859-1?Q?efbNkkeyiLaMsQ039Grr5Z/9mZz+JiRAd5skHdFg0aZ1alK/06B4m3z7B9?=
 =?iso-8859-1?Q?yeCiYiiVT2q79gsicdYfyKciHy/E9ARwGb+q4XpOEza28o+dbxtJQ1hpV8?=
 =?iso-8859-1?Q?zmfSC/B7U0afla56+u2rrKIMq7d1YVpAzIe2EW//9uqPKO5CDsj+U3opOx?=
 =?iso-8859-1?Q?m2kJfDIn3SPMJJ8lUeHpuVyLBHrI82EetuD9fNQqiVndozssjfbcUJTEzA?=
 =?iso-8859-1?Q?dD/5/WSMZMxKbhLoObO4KPdDQ0twCyhZ/7+1HKJYGc/ek4fPKQ+LKzzrXr?=
 =?iso-8859-1?Q?2wJYQA4zhJ7r1P1rd38fpgpDx4f7g5fqlYsowQULNsuqn9vRlHAMN1Nrgg?=
 =?iso-8859-1?Q?sj6H3r2QJIj2BIMDG1w3RsbnKMvo/foJ29raWQq0pkdBc5blhv0Or/ityl?=
 =?iso-8859-1?Q?HoPeDPoveNUwMieJXVeyhVWXA557bkb74uCwSZRsqr8k1QCtIRAolepCdH?=
 =?iso-8859-1?Q?kxyYrSKI/zFHQlwDwitojwauHR+dBTBOMfv9FMRWNNYDnZzk0XfeTBHiMT?=
 =?iso-8859-1?Q?NXtX/gZnNOi748hAx4oAM9tK0fQUaHfKge1+i+RLUJCbWrGyXBJu+a3joX?=
 =?iso-8859-1?Q?DNT2Exsc10Rr+kxZT+MWOVQX5aDr8oca7A6UAdRdOBFhOvascPOZEqjsQz?=
 =?iso-8859-1?Q?GLSudBtGzO99E++jVV1eslYHQFkV49JvUUBvE1R3wgOkhkfeJ6YAO2bmlT?=
 =?iso-8859-1?Q?u3vQZKfdpgJwkcme/jvpBqBIqqvmBLWFa6zySbzQBFc6N/OpN8HgNHjWmL?=
 =?iso-8859-1?Q?cw9mQ6hsw9jxb94XZiI1dpN15jgWO+mMkD/+LmeUOi5B8EOLkj7oNZGC7g?=
 =?iso-8859-1?Q?uc2zncb0h8dk167mAvxC8BeT3YQlqWIg+1gmyfefYblb4bFq4XEI8ZhDc1?=
 =?iso-8859-1?Q?+JcXqOrWu4s4JjpGebE7rsTT9rD1ZWqlhrpuyUIVSsDoIrDE3w2WEQQRlG?=
 =?iso-8859-1?Q?032QfehsOVqAZOGfCOWOdVonsgSjUiumfp762Gfr7p+6TXzh6wflPFVczL?=
 =?iso-8859-1?Q?K+njWE0uh3HNwsvs02YUMyYd82YU8bIG50TU8dSoLKHdjPSPnUXdZj7Qpx?=
 =?iso-8859-1?Q?dMUpCYpKvkVG5mKCf9gnK968jjk0UGKJOO+c4VBWxR9OdmvTrMpFwo/0WY?=
 =?iso-8859-1?Q?uiB8ghxrAayCJZPK2L9koKYUBI5cJlcm1tguMMx3ORhjtdVfISO7jiLWXY?=
 =?iso-8859-1?Q?tNZjlHe/US2JKcJcbzxowbvNlcT8+O7ldqpp10/FjV31eiPWwiMKWyNdWM?=
 =?iso-8859-1?Q?hCIZda+abA1Nu1bXq/SfivOg9SPaqHbki3/fMB8aq59NRY3K7S8BCG8Cmt?=
 =?iso-8859-1?Q?SkZvXYI9NNwkpKtZ4bEERNeAdAVQtgxhT1WVNZSZUPNLYrQJwWNTk9hjuY?=
 =?iso-8859-1?Q?xbctlX18Zf2TAgXk6eRghXp7dSpUBcdddiiFwRbOgbX3+/NlsY0nEeEDro?=
 =?iso-8859-1?Q?Zl5NOxnyaFK6RwLTE8O9toOelNdd7vEyglawbUFSPmL5m1Zi9KkJ1RyUDR?=
 =?iso-8859-1?Q?HIRWfgOvjcKIOqZToUeyxz5EO5CHEh2H3HQlkdozOHkJkmTcJGes/9TT8b?=
 =?iso-8859-1?Q?tS1c4u8ROeWFMqfDsSFE/rlUAGoQtJa/M66VSlQCgO0noE0vns163mAT4Y?=
 =?iso-8859-1?Q?Nbf6IDxJKD+N26Pf52N4bFHEmPx1NQT6DTfcpqC77rQO0sgJ7+pdLf14MF?=
 =?iso-8859-1?Q?0RLX6uyilm5DwxgPfbtQDem9FAi6X/o=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c9b8b2-8200-4a55-0b51-08df17a668e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 06:06:00.0942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fTmc1C3ef04e7Q6mk5SZsArpuirJtN8+7D1lbfaIL85QYIkhVQI1GSH24IyvmC/chso6FnSISjz6Azfq9tqTwhiD8dihsiIMKsSRNVDzAJEOiyVx9D4W1l8hRUvuzJn0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4520

Hi Colin,=0A=
=0A=
>There is a spelling mistake in a dev_err message. Fix it.=0A=
>=0A=
>Signed-off-by: Colin Ian King <colin.i.king@gmail.com>=0A=
>---=0A=
> drivers/media/i2c/os02g10.c | 2 +-=0A=
> 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
>=0A=
>diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c=0A=
>index 141b7cb11fc5..7d3cbf3d6650 100644=0A=
>--- a/drivers/media/i2c/os02g10.c=0A=
>+++ b/drivers/media/i2c/os02g10.c=0A=
>@@ -488,7 +488,7 @@ static int os02g10_enable_streams(struct v4l2_subdev *=
sd,=0A=
>=0A=
> 	ret =3D os02g10_set_framefmt(os02g10, state);=0A=
> 	if (ret) {=0A=
>-		dev_err(os02g10->dev, "failed to set frame foramt\n");=0A=
>+		dev_err(os02g10->dev, "failed to set frame format\n");=0A=
> 		goto err_rpm_put;=0A=
> 	}=0A=
>=0A=
>--=0A=
>2.55.0=0A=
=0A=
Thanks for catching this.=0A=
=0A=
Reviewed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>=0A=
=0A=
Best Regards,=0A=
Elgin=
