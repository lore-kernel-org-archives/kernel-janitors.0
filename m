Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47F7C432BE
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Aug 2021 19:50:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B5B8603E7
	for <kernel-janitors@archiver.kernel.org>; Sat, 14 Aug 2021 19:50:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhHNTv0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 14 Aug 2021 15:51:26 -0400
Received: from mail-eopbgr80093.outbound.protection.outlook.com ([40.107.8.93]:31475
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233041AbhHNTuv (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 14 Aug 2021 15:50:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaBSsCA97LrHOGyBnztmCIFdlakiOexhgr/XxOQPB/1sB9/zQ5szN5+fHzGz66m7STm2F87L9iZzaf+4ZZMz8RqD3U9hFXWTaDKMghmBdoppTYJI8SAhM4KDIolRuHPBpIsFejbhu/JlLc2lr2PtelVrrS/kFeBjWueFU0OjpkB8LYIbtiY8Clp0Tz7B8sl0b0QllKORs5mHGX3TrXuGD9M8RjxONTOSssu8Bxaw6nN+AX6gvYu93Nlpkn/o2PhUnjozeQV23fwGNXw3aF3cL+e0PUh11XSNWGC02vT8Dd37hnxGyjhTJENQaMTj3HdaVZNTflzKZg+Plu9WfI4sPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64UVJ6nL2cNzyTKNUqiCGM/zQ+zw/TkU7KrR7jm3pe8=;
 b=dOxngWnM9A3eREcYuW3eu9fgfglnvxz/LXwTWSlico4yHqPvj9PrsI93665qzUnYQiUCAkfH8uYClTal18rRYFbIv/w8aI8rSA+YW/BJl8PbpxfHq/fXlWkYye3RMs0P71ygN0z7aCg6eb9iTuhKlOcCkEHi2cpUUV2CBiSejY5HcYWZumxUGDfDdVOPR983ANTvwpy5/f6wVVkNC4wMAbsCfs2Ko7973LAalnd+q/wRlT4ztHfMeYO4nYY9SRkFtlSaDsMDBi/+sGDTUfGM/AVZCva/Zl8iHk45JT+LyTm9PhWjdgKdwxjqCYp1BX5HvSXFgsesrMMRcOt+cHPOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=habanalabs.onmicrosoft.com; s=selector2-habanalabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64UVJ6nL2cNzyTKNUqiCGM/zQ+zw/TkU7KrR7jm3pe8=;
 b=eOd9ke1G6rJrjHJrqX2UYBx1SEogi4rMvbBhRgnpNQL80eeiLtJ1VAjz2V7lYeSvJHae+7y2QD5uoXWy6z0D9qJE91dBi1MWOLKsfsgA4qssZa1xqxN3R4cwJQeFsdj+Fn9eKbyAE2nRaHzXzC62qNREh5YEEJEHAv2jSqZrS7U=
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by DB7PR02MB4887.eurprd02.prod.outlook.com (2603:10a6:10:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Sat, 14 Aug
 2021 19:50:20 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::a4cd:a527:7a1f:4642]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::a4cd:a527:7a1f:4642%9]) with mapi id 15.20.4415.022; Sat, 14 Aug 2021
 19:50:20 +0000
From:   Ofir Bitton <obitton@habana.ai>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Oded Gabbay <ogabbay@kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [bug report] habanalabs: replace GFP_ATOMIC with GFP_KERNEL
Thread-Topic: [bug report] habanalabs: replace GFP_ATOMIC with GFP_KERNEL
Thread-Index: AQHXkEAngiQuKqq+DkOow74x3h/VD6tzaDaA
Date:   Sat, 14 Aug 2021 19:50:20 +0000
Message-ID: <DB9PR02MB6619E5A86309BCD11E0984C9BCFB9@DB9PR02MB6619.eurprd02.prod.outlook.com>
References: <20210813123824.GA6307@kili>
In-Reply-To: <20210813123824.GA6307@kili>
Accept-Language: he-IL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dca937a4-3392-43f7-59ef-08d95f5cbf9c
x-ms-traffictypediagnostic: DB7PR02MB4887:
x-microsoft-antispam-prvs: <DB7PR02MB4887929AAFB1C8BC9D8F150CBCFB9@DB7PR02MB4887.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7wJfUlPP1rNqoyHn4XAWpP4kbLMpTYsPMmvndHuWNRfvz74wLDVRm2wwMv/WiSMt/rsXDwO1kPt8dkDIshuafK0gSQrwtLN9TpAZ0CywBL4qBaSAL0a3nLlpdwG6zzsgXzVYXjBySuZkCy75Uey5x9jqhZdlMhYUtDLDHr8MGoQVqs5D7ARRwVmBpnL/NjkRxpwpaUXDFzAbEYF1adzLf7sJvIe0rLjChS1eA7OCzFpk/Q0boS5Vhyrl77IwauY/YXgVljgX1jvXaB1FqpQo7wGEylhQMKo/KrM3+pVINUWxoQ54oQ+hZ2XGW3EUPlKYvO+D6tj3Sw6k8dpGiiqCPJkcISELrG1O3pCNgDj1YFd2LmIJ48aYlm800+3hmm8SnhssutCafKCrhmCFDw8/NX6gVoLF8MSj8aSzz2v3QdJ/JQHyhJXh1K6P57iwvZnAhXtuL7GIMaQJ+xE3K58moWODpR0euLWCxfHMbPL5CCE+v4uOsbkdNiWotVePL9f0mHSUDh1I0zP3Y9OZAZyFxyjOP869Vo7Hz9j3RWNjlI6JNovanztRDuCq6knF/Nfo4GNYBJo7bAOgTPKpkKQ4Wp26qrd5elcvjzy+gNgy2K+lhXzmjO4H6al/5szF0mhl35q9+mhGk6C1IEEnlNdSwNiPy/Dh1nCt0FmrDJxU/HcAAs4qpRqg5B8Yb4+IUQDZk23AvFoMNuaOfm9VGdsMtMIxozcCW+j79kRkyv5kxJwcSlq8AqmBxlagoF2Ar/FH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR02MB6619.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(6916009)(966005)(76116006)(2906002)(66556008)(66446008)(8936002)(8676002)(54906003)(64756008)(52536014)(316002)(66476007)(508600001)(186003)(38070700005)(6506007)(53546011)(83380400001)(26005)(86362001)(33656002)(9686003)(5660300002)(55016002)(38100700002)(71200400001)(7696005)(122000001)(4326008)(10090945008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?erB1L+PyzHy08+IJbiKN07HrvDNdQ3x82pg15Zqgg3vUKZH345TBt2eB/zid?=
 =?us-ascii?Q?qlhLK95CzLgoyapsQm1vNNnb4iriC9Ui/edSGgZIbwdQJtgxuAKUIreJ4el7?=
 =?us-ascii?Q?6AB5p7L3l+WfCfdgUPn5ozK9DLvm+sJXXuvPYhgHo0/hATzIYPoCeYvHOJxA?=
 =?us-ascii?Q?N6GlHk2C+9P+iubn4Mulv9q96dRmqjOGpc7OqeZeZWXBtnMw+QlJtplzggdi?=
 =?us-ascii?Q?LcDihmtOd+a98med/aMvuXofwL7nniVgSxpuqb86Y+8cx3qeThkNT2bSdIoN?=
 =?us-ascii?Q?aUOjJLR5CrVA2a6eOZiiR+KVq9fdJHZYO/Zqjj73GOWPanVJcTWXJd8J9BZh?=
 =?us-ascii?Q?p8zzPnDSO+AMEIBFbb8DOdpYaaJzBMTUQp9iWjHfN1fD2Qd47zmKLb7ZR3TN?=
 =?us-ascii?Q?wz7X6+zUtAX358ZaxlSJoTmea45SgAvyGs3GaDExEFt9RbvwU5wmfePdKKQa?=
 =?us-ascii?Q?H3Ri6xwA6WLUv1pcpfYoNn1driAVqSEagZN46HvNmt9lm88oX2AsGdDa5CFR?=
 =?us-ascii?Q?AfTVCALNpslxGYyv0ZaPateYrWgqSbzkFGGXyJUOh4+3bKW7GhEk1Tfbf/Nb?=
 =?us-ascii?Q?JU4E/sGbto9xhAXvpBvbleIHbVrHZygA0Nkn3qw/UnI5FLoV1wX3EG9ni7c9?=
 =?us-ascii?Q?y7MoPwxn5CrQVBavt1IdS2eONyEhcQOR7tjkS3joH56YMvZbaeViuHnnyzy5?=
 =?us-ascii?Q?LZ6KHSUHSWuSEET+TN+i2jVEqSraOmvcdhh4+PqHfDBHsGmln9LY3FVYmsNc?=
 =?us-ascii?Q?Ide/k7g6nQV1AiEldspI/0Yicm6O9HwTr+MbTCzCwwpbfDlcAipHI8Y+/Y/1?=
 =?us-ascii?Q?Y0lPe9xN4hnqFa21fYaZUCKo45F1XCgc356T5xNy5VaXjTgVxSeEmDjsvAPY?=
 =?us-ascii?Q?+SL0Pe2c9UI7PdkvACcCR+SRJ7T8a6r9QHpvsDKEI3s6EPCihlHKv0vQrO7+?=
 =?us-ascii?Q?bHOu2l+pXfqmtKoJ8HLyJfOobt1lepOoWEqQTmA9DDDJcx5EAEkbOgFpZNWO?=
 =?us-ascii?Q?PdodWqRWFq4cKovfp5gTBCXe4PI8pQG1YMdUVfq9/OB12kmowfiGz5zBQFQ1?=
 =?us-ascii?Q?NAXFB4d3sNXaiTYJVCMDFeVOgTzNSh8XNm6nuR6Go8XaWrxjO2wsH1GrBex9?=
 =?us-ascii?Q?13wt6GwsK5FvzII+x5Y3IABZQ9MjeD5I0m3vF+uqnntnFLvccfJP2n2BDhJJ?=
 =?us-ascii?Q?pz6M9b9i1NBUFMa4l6WaZFf6lDhfn7kkO3LUTkQj9aAAYUENz6yNGb87ziPO?=
 =?us-ascii?Q?5tmxNKpUHABK18l/RVI4rasSLwfMHMWxWv+pF0t0CJsBATL1noPevB+wFB8A?=
 =?us-ascii?Q?u3h1SZKMSY0lWP3v88Cloqx/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca937a4-3392-43f7-59ef-08d95f5cbf9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2021 19:50:20.5204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9+w1FHpL3OtesOYVttnxRWkmgD/eF3cICwkhqf3b1WSOk+BEuwGiAPzWaijVmIitvGc105rs1UIixncMcQqLpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4887
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Aug 13, 2021 at 3:38 PM Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>=20
> [???? ???? ???? ???????? ????? ?????? ?- dan.carpenter@oracle.com. ??? ??=
?? ???? ???? ?- http://aka.ms/LearnAboutSenderIdentification.]
>=20
> Hello Ofir Bitton,
>=20
> The patch d5eb8373b2ce: "habanalabs: replace GFP_ATOMIC with GFP_KERNEL" =
from Feb 14, 2021, leads to the following Smatch static checker warning:
>=20
>         drivers/misc/habanalabs/common/command_buffer.c:318 hl_cb_create(=
)
>         warn: sleeping in atomic context
>=20
> drivers/misc/habanalabs/common/command_buffer.c
>     311                 if (rc)
>     312                         goto release_cb;
>     313         }
>     314
>     315         spin_lock(&mgr->cb_lock);
>                           ^^^^^^^^^^^^^
>     316         rc =3D idr_alloc(&mgr->cb_handles, cb, 1, 0, GFP_ATOMIC);
>     317         if (rc < 0)
> --> 318                 rc =3D idr_alloc(&mgr->cb_handles, cb, 1, 0, GFP_=
KERNEL);
>                                                                    ^^^^^^=
^^^^ This falls back to GFP_KERNEL if GFP_ATOMIC fails.  I don't understand=
 that.  If it's at all a performance improvement to call idr_alloc() with A=
TOMIC first, then the correct thing to do is to fix idr_alloc() instead of =
working around it in the caller.
>=20
>     319         spin_unlock(&mgr->cb_lock);
>     320
>=20
> The other warning is also idr_alloc() but holding a different spin lock.
>=20
>         drivers/misc/habanalabs/common/memory.c:126 alloc_device_memory()
>         warn: sleeping in atomic context
>=20
>    124
>    125          spin_lock(&vm->idr_lock);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^
>    126          handle =3D idr_alloc(&vm->phys_pg_pack_handles, phys_pg_p=
ack, 1, 0,
>    127                                  GFP_KERNEL);
>                                         ^^^^^^^^^^
>    128          spin_unlock(&vm->idr_lock);
>    129
>    130          if (handle < 0) {
>    131                  dev_err(hdev->dev, "Failed to get handle for page=
\n");
>    132                  rc =3D -EFAULT;
>    133                  goto idr_err;
>    134          }
>
> regards,
> dan carpenter

Thanks for noticing I will handle it.
Ofir
