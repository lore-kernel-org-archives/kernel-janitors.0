Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD99CCA47B
	for <kernel-janitors@archiver.kernel.org>; Mon, 13 Jun 2022 19:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346238AbiFMTBb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 13 Jun 2022 15:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345279AbiFMTAw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Jun 2022 15:00:52 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-eopbgr150135.outbound.protection.outlook.com [40.107.15.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ECA2E083
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jun 2022 09:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhpbFJqAPQL9A/lTMYuSHXk5TWPEgc44ck8HYLe38MPlrmVOJI+v1qwLtXqVKm20JiPmrM9ZTjDfXoA6/wFfQJVE0fca+sx6W6v6PlqJ5/fnGRgryELmrTMTPvLWsbhyVq8HdIzlEfhBm3Ao36OquKHD2wAgAPFxFIUIdmVfi3G133z91q5D6whKPcF2junq96kOCfaP3QtVEYKKMl6lRzlflDdPuqv9S1t+RvlNqGBcVAjGXAZzYmVzSnNU1x5YpWjWmiVyJ5fZbSDLOH68b4P77JbyCvAoYAtm+51xSbJt8ck57a75OQ94bbX5Rmg0cML3zvGJV6s5rgm5/1Vusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfy0QYvhoMrP8bjy0n6chaum6Z9q5DMBv7clHK8CdIE=;
 b=cMIFfVdz8usTUSo5a0f/LC0ELy/l9o85pULLv+OVUP2xVguki/A9yZkiVgnLO+ANLwszUOLbDs2/781U5tHVW+vB6IMOae4vCctqFVcsy4RL7yIK7On4FAepHeJfkp32OluOsJQdfvyoqYqhi+LHhOEX7GbdUzJsU15BRJEdSVFoTjLYHcLon3ixq+LWC6V0g1F6a4meZd7y14kbkQ9Juu5R3M0ep4FUioP00dTeH1fjF84J1lInOaDKs6n1637mYb+5M6Z0YMO1GNBYDuIqlnrGWC/y8c4cFi1QmrZqbDXAAs2lRz7SI6ymj0myxoUuez5817iL+y/TWkJIJhqGgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netatmo.com; dmarc=pass action=none header.from=netatmo.com;
 dkim=pass header.d=netatmo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netatmo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfy0QYvhoMrP8bjy0n6chaum6Z9q5DMBv7clHK8CdIE=;
 b=GQdo/q7jOProfJzspF59Je1I7c7lqs0W00PsSoTqD9p+gZrXpVlOHdIRigrNWhxgymB61A6itqRyAc9N6NJlQOfUwjsnX5N/OouqHPoML1/C7r7VS9f3hI0bubK1WGNVEo+UlkxYW2SSCDs/HhyQ5hRFWep00cCItagtHutsps0=
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 by DB7PR03MB4811.eurprd03.prod.outlook.com (2603:10a6:10:30::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.19; Mon, 13 Jun
 2022 16:25:03 +0000
Received: from AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::8175:20e5:60ec:b87d]) by AS8PR03MB7603.eurprd03.prod.outlook.com
 ([fe80::8175:20e5:60ec:b87d%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 16:25:03 +0000
From:   =?Windows-1252?Q?J=E9r=E9my_LEFAURE?= <jeremy.lefaure@netatmo.com>
To:     Markus Elfring <Markus.Elfring@web.de>,
        Julia Lawall <julia.lawall@inria.fr>,
        "cocci@inria.fr" <cocci@inria.fr>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: [PATCH v3] coccinelle: Extend address test from ifaddr to every
 test expression
Thread-Topic: [PATCH v3] coccinelle: Extend address test from ifaddr to every
 test expression
Thread-Index: AQHYfLsCmi/5kwNDAkqS6gBbhAOymK1I5+MAgASimqE=
Date:   Mon, 13 Jun 2022 16:25:03 +0000
Message-ID: <AS8PR03MB76031920B2F9E7A0A7A6A97893AB9@AS8PR03MB7603.eurprd03.prod.outlook.com>
References: <AS8PR03MB76033CF2848D03651D6E189093A69@AS8PR03MB7603.eurprd03.prod.outlook.com>
 <a8c3479c-c8f1-da57-23fe-657c2f13872b@web.de>
In-Reply-To: <a8c3479c-c8f1-da57-23fe-657c2f13872b@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netatmo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ac5bfe3-49e3-4200-356d-08da4d594522
x-ms-traffictypediagnostic: DB7PR03MB4811:EE_
x-microsoft-antispam-prvs: <DB7PR03MB481121C0DC5ECA53F12A611C93AB9@DB7PR03MB4811.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /3mABX4G3TKEV8v9F6L1r/FYbHAA7sqJVe73tQkUgNd8qTnxrKgVwKFX0XAgz/cXSqd1DqR4kG0fpGRA8xQ7E3FxOsm0OzR8It4DrvO+p0ox7/pagmvCP16J+/G/N6nOowzoCss2mWNhR3Lhrd+lFJfdQ22urzXneUDg9giB7ZMsZVNCDyOjHr52ntlbKH9tmjnQk5eCMyWlTa9gCrBBIESezmHxKRa4szcmXuD2QI+oNKVLai6CaOumGogm/h1BeugQS9sRWxw4X4Vyt9/z4YlxzQA4RsL/Gv1Xo+LmISIaAnSKN9HD+lfiaTwO50KmeWhMX9J7BvjDZkrv4qQy3C2DSFUauYd7+C236ytoAfmwsYDw27Cm8DmC3YOr/Ynx5l1f1kzUj2a7WVU/2bugEf+RtQiJef/TTCyS4bfEIElv5OwUnWQaK1KRwcn5WvMQjZlsI5LynmMI68eMAgs62ffTqDuglX0XovrEn+TTZw8Cwi9G7zIR3Ij8gjVrKWIk7dsjHCpSASKGI7erOXyn3ak1OJliwJhNx/WA5Exiatphj62YQWo6oVCUVSqKrshZK0VhRVKONestXebce0D0yvheHLXuEZUJWeNsnwRWL18ZKWtLpPFvdY5QCkgxilHeWSW/t9EK7RpKWv/Ped0CH0TLo07XH5bhA9Vixb1Urg/4xc/1xo7eYDh87vDMY2F0FBdo8CfBKab/KRC1wmUHJQ3UYnXqaLgdkrLzk+pdTlymNQh1XTsQwpUj6h1vtJvgZAekgojlt0K8Yt0aOVx5SyOyPT6Vp21lZlAvfCTzho4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7603.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(136003)(366004)(39850400004)(55236004)(7696005)(83380400001)(52536014)(26005)(9686003)(8936002)(6506007)(186003)(41300700001)(76116006)(508600001)(66446008)(64756008)(66556008)(66476007)(55016003)(86362001)(71200400001)(122000001)(66946007)(2906002)(54906003)(316002)(38100700002)(966005)(8676002)(110136005)(4326008)(33656002)(5660300002)(91956017)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?RGOv64eIwciqbLcButBrwdlqmT5ygkOGKPO+X3G5W4by8NrkJX6Kl3/p?=
 =?Windows-1252?Q?N7L/61Bwnkgw88LPpeaHuKV1/MUUN2pCVswjkUYfnlGmkoXk5LrN1Xv4?=
 =?Windows-1252?Q?x5JLVDeLRQt4/q/KydJW4Rx4PAp7CV61FX4Kcd8jyuinhrZo6GumtOXN?=
 =?Windows-1252?Q?P4I32t6uMY+ANvVxfRYoSYYvegANOVB2dxzhWc8rR0Uk6SQHfVgOu5Qc?=
 =?Windows-1252?Q?UQ7VpI4w7i/xPfXQaBhC7KcYE3wMvwO/kxar2jMhYdSB2JAZc/C55/+s?=
 =?Windows-1252?Q?KLzmpWcVRlo1tSpTYHwTwiIWa3JuCqZX/PvrNQUQFzv/I/4p8EQoFp1O?=
 =?Windows-1252?Q?z03w7Qb9ywI+x2pnA6j+MIIyPH7apn9Rwz+pSywknWGWsRyfsNjlDTvF?=
 =?Windows-1252?Q?3z9A3pnUI1xXrf+t0jfmneFXNrHGreNQygtzQY+ooZQZJQnbTOuGdc7x?=
 =?Windows-1252?Q?GP3KK3n2FTIm+h2YqxbokkupUwnEFlt5j5VEBU+igp7h/vEdAyU98aTg?=
 =?Windows-1252?Q?ibtqp0bWyqu5o8w6iqew+IreVF+8wW9lYT+bmagSo9N6sT776x4CLQNs?=
 =?Windows-1252?Q?UHOh8Cm6tG6AHO83+eV00z4Bt+C4cL/byMnzVgyF56+i2c6TGxpmBZ+W?=
 =?Windows-1252?Q?ct+IehqF3FgZotBkdIguwnSoEDb1tO9xXx8nl4fhOqTOkJmx557wOBxy?=
 =?Windows-1252?Q?QeBWe7S3dtkGmheRBk7Po/4qXuUI1xxJgyZlfIksiW0z+f2Uqv8pY5vq?=
 =?Windows-1252?Q?TxNEAYra7eO8NjBWeNowlx3ma3e1Tu8wqsWwYk9oeNo5MgbrJ/gkwarr?=
 =?Windows-1252?Q?TSa7RzRitAocSevSm/fzEhAq32guiw/1dM+fYFWAUBx7YX+x1S3mtX3g?=
 =?Windows-1252?Q?dO5iEX5HFiT/MCxYM9VXLqj24N0T27LBoSQt8JU5QxcxarNlJUYu4jaJ?=
 =?Windows-1252?Q?Q1S8KJ+wi0K5oZMhbElRxNR/5g+OuI3H6YYKS5eLidbjZwg+qgYNwBNJ?=
 =?Windows-1252?Q?25hrgfDSMJvJpNlsSSHwiGhCCvZhcmtTIBh2hxC6DlwBh6482Yr1Ps/i?=
 =?Windows-1252?Q?K84usQOLgMJHNNqutIcSRLwL05oYxi6FkriKWppMCPUSDWSXLwf0m52I?=
 =?Windows-1252?Q?rcPK2HRI7AzakEli1EcJm6ozjgd+iS/CUqJftqwEqyJ/ZGI0QHDIZ2cz?=
 =?Windows-1252?Q?YFdTKdlg7xy1g15WZnX91pYTFPEKceJU1DY0T37OmUFph+6P1Jb+SkxP?=
 =?Windows-1252?Q?MER4YgHer78YsiVNad39UdNUx16591Z0kVECTxMEExe3GEEDYkKUFMVe?=
 =?Windows-1252?Q?5Ri2ff5PKQubcKFCs2RdYh0DJM2ObRvBBD39r1GFOxloJnlCBuJaBvtL?=
 =?Windows-1252?Q?ajhTtYMFpE6gpmcY9pt9vPruu9h3Fh1cNRoCQXcQDj0AlX7A4A4WxfG4?=
 =?Windows-1252?Q?2NgDDPYnncDdtpAXOWBrTlEHY/QkAyWESzz3CZf0ChmMzyVrt6EBlQ/z?=
 =?Windows-1252?Q?Xj5yhNzaiT8xJDgK5NILehyFIPgsG/civVEXLXdP/J0bjnZdRkw41IC7?=
 =?Windows-1252?Q?8f8j+wvjceHjh6bOb83IByuPq+XWER/lv0i5Xu+3wk1s+GKFySlUzXXt?=
 =?Windows-1252?Q?QbNpo6REt+aMbt2fBic7suJlMS0ozBBBz5sAibreQ6o0wAG+q2d5LUJg?=
 =?Windows-1252?Q?/f7QTYvkOgaq2BbJS5Ut6bzHZ8Jw97YVbLz6uobShxmtCvYArmI21xDU?=
 =?Windows-1252?Q?BH2Orpzak0JhZAA9e5gbf/R85kfWHp+z9SJMcafuiQ07sXiYa9fMBbd7?=
 =?Windows-1252?Q?sP9dytgUx46ZdEnR/RAkFUunCHKI1OChngi9gLiE/unvotUdP5jpJnDy?=
 =?Windows-1252?Q?c5dRtcNRkHY3oQ+JqPzcuPnguRwkwkoEORg=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: netatmo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7603.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac5bfe3-49e3-4200-356d-08da4d594522
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 16:25:03.3488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4528446a-2666-441f-95cd-cc2cbd9f2c49
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tz8Jc9MxPEXCzJcMsPDqjPT5lCwzJYBH2do4vLC3f+vUpeUwCqRyPCqDdrxobe/s7gqA5tXbSlMBFaULEQWlREOUZ+R+kApd58rkq9flolU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4811
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> A)=0A=
> I would like to point out once more that no questionable places were mark=
ed=0A=
> by the software =93Coccinelle 1.1.1=94 (OCaml 4.14.0) in the following so=
urce code.=0A=
> https://lore.kernel.org/cocci/da86bc36-36af-7bd7-6bee-861e160ba6a4@web.de=
/=0A=
> https://sympa.inria.fr/sympa/arc/cocci/2022-06/msg00017.html=0A=
>=0A=
>=0A=
> void check(void)=0A=
> {=0A=
> int s =3D 1;=0A=
> bool t =3D (&s);=0A=
> }=0A=
>=0A=
>=0A=
> Thus I propose to add another case distinction by the means of=0A=
> a SmPL disjunction.=0A=
>=0A=
>=0A=
> *\( &x || ... \| &x \)=0A=
>=0A=
=0A=
Unfortunately this creates false positives as it matches address-of=0A=
operator outside of test expressions such as in this code:=0A=
=0A=
void foo(int *a);=0A=
=0A=
void call_foo(int a)=0A=
{=0A=
  foo(&a);=0A=
}=0A=
=0A=
=0A=
> B)=0A=
> I imagine that generated diff output should be wrapped by a source block=
=0A=
> for the operation mode =93org=94.=0A=
> https://orgmode.org/quickstart.html#blocks=0A=
=0A=
This patch does not change the "org" mode output, it only changes the=0A=
matching part. Anyway, I am not sure that coccilib supports blocks, I=0A=
did not find any reference to block in the code [1]. Do you have an=0A=
example were it is used?=0A=
=0A=
[1]: https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/master/python/coc=
cilib/org.py=0A=
=0A=
=0A=
Thank you,=0A=
J=E9r=E9my=
