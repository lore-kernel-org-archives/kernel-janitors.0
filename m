Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D98C43334
	for <kernel-janitors@archiver.kernel.org>; Tue, 21 Jun 2022 16:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353778AbiFUQKd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 21 Jun 2022 12:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353772AbiFUQK3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 21 Jun 2022 12:10:29 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2116.outbound.protection.outlook.com [40.107.20.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6E4BE15
        for <kernel-janitors@vger.kernel.org>; Tue, 21 Jun 2022 09:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2xET1WFkvLbuyi295DBSZT586sHVdEXzlfxCjv8FhNURiXl4Br/AJSmCyo4FX8KlP54b8sVGrUE6bLPEPe3d4oB2NVfQtARNWujajNPFFFDsM2B0IQscG+ZYW2bTsknA7wLZm1icgDi4NtM52wpuGAC7MSDFS1PoVcYTkt0A453vB2jsLNgWqtcX7pWLo4bwVxJvszijkevMa78q92MQ2UFYPD45FMsAAX1SZ02n0NLlBq/auMJqkxymyZAQh4BkewsSZBhp9afEZcWXu26V7yz2CfMRsNVuE1qHajJ8Sp5lbhl9Od1xNINh0KAjTSOuacvveqkCmjDzKmj/a9Gmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7MCgaHdN16Q6hHgWrp7vZcmxRDBSa07tbUOSSmXP5M=;
 b=Yl9plQBLCZC4HRT2GaaGqB5aKNXS5DP5FQ0VzZzk4n10GkVbO7PrlviqD1+XVR+vFRSNdPRHmOtqiQlMBIzgwHKN+7UYbCC/FvDL0jBAA8kuIS0gRXF5K1EG3a7dLBMtR4pgRpS4gTNW991YnBtSLxWug4gA90n9rMgdo7jDyjIlqgzpaS/kQG3L1nfiiLb3vr31nPVVgh10vUts0ChVFjaU+7n+OlgIgkoZNgMkPrxDP82o+t8axIWkJ/yzL9tpoClAbWSo0FWGp9/9Oi5FLuPICNyszLE9C/6TyEjSgkXGQi08ATYodOLT05Up5Zs6zR1iNM/l+1VaOxMxEnhQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netatmo.com; dmarc=pass action=none header.from=netatmo.com;
 dkim=pass header.d=netatmo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netatmo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7MCgaHdN16Q6hHgWrp7vZcmxRDBSa07tbUOSSmXP5M=;
 b=GovrXu+6z+DnZ9yH4TWdgUcV6fBLE/wdxwYbX7Go1GXUJhyMNGklLosT3yDrWArAszZOZtjA65v6g5icHJAokz2gJe/8yrCECZKfTqxauGzn51seOsmm00AirJKKM5VLs48JQROVilepvgl2Z9FdSpUHVYWQpa3n9c0pdKnmQV4=
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 by AM0PR0302MB3187.eurprd03.prod.outlook.com (2603:10a6:208:7::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 21 Jun
 2022 16:10:24 +0000
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::8175:20e5:60ec:b87d]) by AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::8175:20e5:60ec:b87d%9]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 16:10:24 +0000
From:   =?Windows-1252?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
To:     Markus Elfring <Markus.Elfring@web.de>,
        "cocci@inria.fr" <cocci@inria.fr>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
CC:     Julia Lawall <julia.lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [cocci] [PATCH v3] coccinelle: Extend address test from ifaddr to
 every test expression
Thread-Topic: [cocci] [PATCH v3] coccinelle: Extend address test from ifaddr
 to every test expression
Thread-Index: AQHYfLsCmi/5kwNDAkqS6gBbhAOymK1RnEyAgAh8uag=
Date:   Tue, 21 Jun 2022 16:10:24 +0000
Message-ID: <AS8PR03MB7603675681B64E5F14C1995593B39@AS8PR03MB7603.eurprd03.prod.outlook.com>
References: <AS8PR03MB76033CF2848D03651D6E189093A69@AS8PR03MB7603.eurprd03.prod.outlook.com>
 <6aef3ee4-d934-daff-7145-73ac563d2fb4@web.de>
In-Reply-To: <6aef3ee4-d934-daff-7145-73ac563d2fb4@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netatmo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46de47dd-248c-499b-51ef-08da53a08cad
x-ms-traffictypediagnostic: AM0PR0302MB3187:EE_
x-microsoft-antispam-prvs: <AM0PR0302MB318722AFE9D8DDC9450DFB4C93B39@AM0PR0302MB3187.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 22ZpHalkA5Wqn7HlPbbXqaGTSw35kp+viPkKP4LnjmfcYXGt8egUfc1ISUk5Z6jYRTJnUNHAz9xdZ/u3yiosG3WATMDhML/v7Cb55TqbJuVRCFB+4dM7jYlebhpQ/8XVoT3eJJnDZhD5idmYXlQPFNQ5TIx3BsSGBBD3VK/1azTegT1LF8bQgZ+XOxfM4QxgSb2E0IucB/pHSMfdkGwsiavkp7OHO7Qyq/m4bXQ58p75kZS6rib2s5RKcue16QuhUMT01qIM1z0pCuqnHoAUNiHkdnsEHWKhjvC30+UY7kdu1vECYMJhh/fL8ngGtXG25V+5x6n+CUY5+OmYF0X0Novc2mT1lT/ya+HPdIdZu7uucU0jcAvrLZIJ9nwZdK9OWgPTKNws/6oi050me6OFI8S41AuO1w1ZOwCwocyIfE6qUjUVmakPwQzWmfeAGhOy/akbH1/Ouuou8MuVc70jJvTF9ZLcAMrROMXOVGhsOn+A2ZScQiLG/wOxpxo2IfNG6ZvQMuyCTK77jPvXIpa5Vgzq8/QLWzdynsjxpXexPTTLeka12C75n7GvbU6lPWTGYImwwfRn/qUw2bS/2zb1WshDJEugnZtjnWADnoPQUdlfOrKOAotCAVTf3nCErppw7DcLeLNHfV4+1rbnf4WlzLOtWl1xrehPoLuHg0ZlUPlCOhJ/qAOIbpKjCc3KvGlKme0kBYwGgp/OsCo4osfOlA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(136003)(376002)(39850400004)(38100700002)(6506007)(55236004)(5660300002)(52536014)(110136005)(33656002)(55016003)(478600001)(7696005)(41300700001)(4744005)(26005)(8936002)(2906002)(66446008)(4326008)(54906003)(83380400001)(316002)(66946007)(64756008)(38070700005)(76116006)(71200400001)(66476007)(91956017)(186003)(86362001)(122000001)(8676002)(66556008)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?KfHEkp7Fd4Hk5wCqGH11EFrf44v2id3t16gDgZ310COgOYxJk6XVcroo?=
 =?Windows-1252?Q?7kP0I8Nux5rzWvomEoaV7OGlXih+UaFv5grkOXD4ZdN7s0kC0dQhqQ2V?=
 =?Windows-1252?Q?YkX/bhrPbIODVzrRy7wwGlscWTo8HehUZCfGgM8SnLTtV+c2/rw/36z0?=
 =?Windows-1252?Q?Cc8u4OUODIMkFd5bqw7moI7KbfpiuxNhSegWkTYx87/s2y8JvMOqlGlt?=
 =?Windows-1252?Q?O8XOgA6nL3Fwcc5su4yi48jDOPxVUTuWAMNLnLUv5EABGYC78bFWF392?=
 =?Windows-1252?Q?C8yeUQkPAQFHJGRe93SfA6NcKfZcoAqkWY29cUJiCQTh+tT+OqEZ8Y6B?=
 =?Windows-1252?Q?BP/Dc6/VuQHRda4drRpjEmlKfIAPLUIwSvUrwb/ehHZ1MfO3S95am7Yf?=
 =?Windows-1252?Q?1iou8FmKoG+5IcRocZU30OwYpNDhc0pkDtW8ZmRk7Go8Lf8nbv8lODXE?=
 =?Windows-1252?Q?0Cnx63UBc/xikBf6FccPjMfT2qCOubJo6N4SNOLJgiQat+i2L84MiqiN?=
 =?Windows-1252?Q?piiCx132+F2fefqTcMdgdW5QozS3XFgA8TN0Ya7Twd13EYJt5ZkixDyp?=
 =?Windows-1252?Q?/1WU2iW9F6wx3wm5FvvLpj5Tn9pRrSq9W4dGd2Zyg/4DqNAlVs3F8wN5?=
 =?Windows-1252?Q?VtzhC8628sTdL2ZBhCxApkC1gNRG+CiYDkPLkaXsKVVUiOu+8eqROhd3?=
 =?Windows-1252?Q?aeaihzg4aclyq/wbfN/3Rn/PMJsKpvwWkdsciXwEtkMgWBGq53DQoWjT?=
 =?Windows-1252?Q?g0pujSAm4WdKRR/fpqMID9dgG7cUf5t9pWxl5wvrxqAj70iueAr8hvTk?=
 =?Windows-1252?Q?MDr0EqDjemL8Az4dXO2VL2UTAHpL9D6EzSsCLrdub7YdjussK4Ifpira?=
 =?Windows-1252?Q?xLud0czI9IOORJASTL9EOmGcZXrvv3GUi/EFmOT2WZbM8x6g+BHVtGe6?=
 =?Windows-1252?Q?gGA01ISZQUGJvhcrvucKek8qYYQX6URP6ERVWQrd/slF8JUsYpf5qppV?=
 =?Windows-1252?Q?GPYcbtVH2a56lgmzhxhV8gqbh1b7/N/GAFWrBGayF3d9ah906d5HCVtT?=
 =?Windows-1252?Q?A1cYABi5+4KqgqcAIcdMv6LXbXwiS/2lK2AC1l6tn9Ywv8wjJFjGeRs/?=
 =?Windows-1252?Q?4UKuiK1AVjY78/bPUYWPgfTarmPQi7yUksMyp71sDuadiu7IFnMxk2a1?=
 =?Windows-1252?Q?iLOr5m1JCbqIltR0l3M975ci046ipo+WkKlps3LKTdLxXrO5YNMbWnuZ?=
 =?Windows-1252?Q?a/SfKHdYN9fvZDcM0/xdK0P2KSy4xHTA2OOkw21COjz4dctBUxWRL2gW?=
 =?Windows-1252?Q?z3SaLtBhOqiwYljgAnojR978XPfDjEMDno4cCODHwPDbvnuiwHBw0+DR?=
 =?Windows-1252?Q?ICxzFFtRg5iloX+J5FxmL2Z07Cy4u3gTbb+FxQeuAsaksBxgW1AwYcvr?=
 =?Windows-1252?Q?c5Qb4JbzBW7nxLnuR5pGRLD/+rZIp0OA3kKxjs60uMyuC6o03u6ggs6N?=
 =?Windows-1252?Q?Nv1P0DBXwej5Smel5U+h66aShML6l42t+KCP/VsgG4mWDj79oNDJdQ+5?=
 =?Windows-1252?Q?2+AZ37UcInmYiEEqJh2FelH0IEI5ERnDNkPCBI5SUY0PHkGgUUQufNVy?=
 =?Windows-1252?Q?humKYfTbgNewdi4pge5lvnBgFGdBLhQb3rXAqtdwxnquXKT0lmjevrBp?=
 =?Windows-1252?Q?7pM3NzIBtrvM4p3ojXNLk7PWom+lzqj+g5aWQjBBJmt/rJGO+JH9TeHo?=
 =?Windows-1252?Q?cRKqTHxX6Z3gHQOEZBVSiR83cCacHHEAFQjgV+VOR+Gfy6MCZlM3fNjq?=
 =?Windows-1252?Q?cFuD2S4BdQ5NoBeI8qbp6ZeQEnaxSe3hiqSlPOtu81/yychr+7YABkxN?=
 =?Windows-1252?Q?CDc/jwcv7myJCVcPBnlzWPSTZioOV39ZLVA=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: netatmo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46de47dd-248c-499b-51ef-08da53a08cad
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 16:10:24.6388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4528446a-2666-441f-95cd-cc2cbd9f2c49
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5jeAHGZvVz2AXyqroIvlYakwuudX8A+z0mIgPsa0rP0qtuV4TIYxf8xZkvjgKm/SHy6s2HoHi7xfGUCc3H4mwJWMAJdJ3jE/pOId+CK5BoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3187
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> It can be determined that the proposed approach for the detection of=0A=
> questionable source code places is incomplete (also because of the curren=
t=0A=
> development status for the Coccinelle software).=0A=
> Thus I suggest to reconsider the usage of the word =93every=94 for the pa=
tch message=0A=
> once more.=0A=
=0A=
I'm not against changing the patch's subject. Would you find it better=0A=
if it was "coccinelle: Extend address test from ifaddr to test=0A=
expressions"?=0A=
=0A=
And what about you Julia?=0A=
=0A=
> Will further adjustments become helpful for desired source code analyses=
=0A=
> and corresponding transformations?=0A=
=0A=
Do you mean adjustments in this semantic patch or in the coccinelle softwar=
e?=0A=
=0A=
=0A=
Thanks,=0A=
J=E9r=E9my=
