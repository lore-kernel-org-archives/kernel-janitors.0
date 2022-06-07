Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876ECC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Jun 2022 07:09:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237502AbiFGHJS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237495AbiFGHJQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 03:09:16 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E09123BC7
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 00:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kML3M/wqXytojhIKTXKjARAr76yQ1M8daY8tlpi8dUGzgRpjCAZseX13AFDyYQz8zftJpV3/PRhZ9IunHTejK6XDpDVOtswjS6/+bIbGIr3zyphyn/Cdr2iz70SCnOh6zHW3RpJuwHI1NEDkrQ95D7LI45+VYT+0Pi5WCbcqW0UtCH66VOKhEEckI1nIJFMPv3KbuG+Mnoq7N5wXVzVv1lTbIBvpPdYJ8pYKZbQPWlw4iS5YssqMT4LbuOHiHuS8uEzjWnOIzSpsFBbnD9bfZb/XQPQXbAFduLoamGShpjj3bh9NxSM7v37kYwvvxvAx8LJBIp1WAGFJZ0ZiBamuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9IzAU25p3j9ICn41xSeShCOEX9V0ywCvx4W9bAtIKg=;
 b=d84Mov3PSNgsbxKNd2REj5PmduurqvIQr4EFrnGBdDjLVnAuS5P5fY3mKPesAYb9noxLE4tvJAsc2kgtHjpVsgSxz19es3sGGLu0b/wPS5ddg8jSUVkowLroednp3+steB3BEh0oiSa4tTbiRffS2XWpxUCWCyViOp6Xk1MZPJAxFUltmnhupG8iM9aKqP+dePu4boGKiCo81OaMzUKkbORdXEOVGust0sYCTPpiEA+rhVrFXjBMw78WcvHtXcqWJ3URHmVav/Uf0EfyXeoD9SvRWJr7QZXA6yLuCA/0YuH0npW1hE41uZW5De1mtdDE3MmeRoJceeglOHN6lSQsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9IzAU25p3j9ICn41xSeShCOEX9V0ywCvx4W9bAtIKg=;
 b=LE7m/hjxh6mY4hAYgan9YgVUQk3V5Pz0JtO++3I8VUk5ywRpqzXPN4NtV6nfIbepxVTbFB80F7FULCLFXtoSKH7xznCOJgbblnFtJdhzJdY0M2JCloKjQZHnfvWcrWjXWLUX+6TJsIs0fwhqNkonQFxrY4qu6a+Gbo0W+Cy+dnxR5FNDvYWjsO+vkPLCgW0fBKUFr2e/Un6HvxsKiernUyLBmBtg+7xxxyqn/Lsw7s+DtXUaT26b6yOSphyZhP3VfF29aLGdpvJEy3xi0bkQJEaO1/DRYiwxuts9zX0KY205KvyrQ46i/GSz1hTsQLW+Rr6xzHBGymYBYWm5AnMiTw==
Received: from DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) by
 BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Tue, 7 Jun 2022 07:09:13 +0000
Received: from DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::a196:bbcc:de9d:50a5]) by DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::a196:bbcc:de9d:50a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:09:13 +0000
From:   Eli Cohen <elic@nvidia.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
CC:     Jason Wang <jasowang@redhat.com>,
        Si-Wei Liu <si-wei.liu@oracle.com>,
        Parav Pandit <parav@nvidia.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 1/2] vdpa/mlx5: fix error code for deleting vlan
Thread-Topic: [PATCH 1/2] vdpa/mlx5: fix error code for deleting vlan
Thread-Index: AQHYejrFc0GxmRCZU0aq/vdu79naZa1Dhmjg
Date:   Tue, 7 Jun 2022 07:09:13 +0000
Message-ID: <DM8PR12MB54009B56E5F215197EC1B071ABA59@DM8PR12MB5400.namprd12.prod.outlook.com>
References: <Yp709f1g9NcMBCHg@kili>
In-Reply-To: <Yp709f1g9NcMBCHg@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52d4f3a8-6204-42f0-6cd8-08da4854a0b1
x-ms-traffictypediagnostic: BY5PR12MB4194:EE_
x-microsoft-antispam-prvs: <BY5PR12MB41945EBA6722CD57FDAECE49ABA59@BY5PR12MB4194.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7gbYb2TzYnloDzrCgJPkmSK+cZOxJLPGLIjeSWrD/r7QOTdrMB8h7CewsTbz4roEbGAvRJnU4Z3iT6BEM1VaWYw+L1CnjP0SIAckgI7+t7L/rB0jnEsp+kUO8KMK0LqhagEixeMBztkfwskvmhRMbJu0wXq1wwxTuertlCfKWly7OK41nfipqrKxKpnqIYQbHe4t3Tep5T9pLfLXc8CHNqQPoUGa2B01sxDhtbPiRylImTc+wPWW8Y/dH+E/JpMUtT98sxJe65vOuXg++BuC7BoX22s+O89FEUP0A5UyeXQ4zQ6vda14maDM1rlsODKJTUKgXDbcc10v6VSUBemoMmZY2hBBB8h4DnEg803IufGqOwdO1lHHbNmyCKxmHp/n/w/xS6RA3zbjgZkrn5FqGliPXDiUqljXLgcEsxoiptTV+0KFo3jWST+qTU+0lYHa0z/1lN5PKrsQtT8oCOLzRg77qoEG+8NFxDMwXwzRibl9QXZhP35pecoRSfcjYhp4jJPNVQ8BXFnQzPDHAZzRjJpVfPZ1W+JEv03S2mk3LEboVhoR3y/KGOH7TnTkSqdoF/EB9U8vWm4FkxmrRFhFZcCH8P7xPaRUJyzFW9bmUt4eAKM5VqXfnm9P4V32bC5qZJ0q6VLwg3bw2U4ebAhFMCtfhukKt238OVDGTHKv3GMBoTVxADppddqei24EscgNppiBqSdRzh6PT14z0pT8qA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5400.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(186003)(316002)(5660300002)(4326008)(76116006)(66946007)(8676002)(2906002)(66446008)(64756008)(66556008)(66476007)(110136005)(38070700005)(508600001)(122000001)(54906003)(26005)(38100700002)(52536014)(55016003)(83380400001)(9686003)(6506007)(33656002)(53546011)(71200400001)(8936002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lzj3Eh3nxnr22n+znanAz3DjHe32rP7jV5R+2Mv8459DrJ5P7ptGiekviu42?=
 =?us-ascii?Q?qBDVwtTTmNRJQP+BxVCqpkKfGmK6Z1csazcNIQHrd7Ns2PMXjhIziQ121Dq1?=
 =?us-ascii?Q?XetDjTpPL258wlszJjr9KrRL9xlm5Lty+s0q4+gc89GHo8BxjzohYROhePiv?=
 =?us-ascii?Q?45RSEicLJrZDSgtZRcCUn2HTbrhqkw/pO6Ny8+xwFfghDS+1KojLu7CDpb6M?=
 =?us-ascii?Q?lT8k4u0W+3vz3xa0ICLhXcetKEkOJ/JSF80fQTjGv4t13498ib5fj3+lqglq?=
 =?us-ascii?Q?4FgfzDnOb0N+7ZBXqLVse9Rw/at2eqrQ1KnqMkz99KBCq5E+mJMM+E8kbAP6?=
 =?us-ascii?Q?CJ0YUohRuR9tPSWU+Ch+rQB8lWvzlI8L9ce54OITPXfdZdQyzaUlaSN8ytn6?=
 =?us-ascii?Q?crBKX3IIyI5YBHT6cQ12/sy9p7hhGpu9jqKXg9cfSiCAixZmp65XdmCmFqSh?=
 =?us-ascii?Q?+sAts3vel0xzzlyVEUlJufpsDLjrPSSkQ68fkIRTYhNH98nH+mpyTxdWRi6m?=
 =?us-ascii?Q?1Gkgm2f5Lo+y0KSYkYtDnIzBsbz7ANHXrr/kVM4lUuL0+Ls9dMEVoT502gjA?=
 =?us-ascii?Q?t6eQGHdjslDgP194eAOLhTZh5+WuBgGorTozT+b1M+UIGZ7g3XkuK5BRo0vA?=
 =?us-ascii?Q?w6fSVwFbfzp6OxvukfsuBHfyJAt7Z7YHBHMLqqqbMvtQDrCQe6kQnCVdcFTQ?=
 =?us-ascii?Q?//uV1K6rElQRx3R7o5zH41XriafFAZQ8/j1jnvOE1RL46d2+Ojq6sE8c7uCh?=
 =?us-ascii?Q?NcJmCmwrUTYhLaSLFYULdKek1sb0cWpTB9yw60is3QBw+o3tcumiUvZmn36d?=
 =?us-ascii?Q?5v3Y7y9YBTKqu0+YFDW6tXVM2jOonwJ4Ljm6E9fGGHULS6YnAgXRbdhrBgJQ?=
 =?us-ascii?Q?bGx+m9Zu3hNffx+q+CrWNGYzPV/YrYfhNK+gkEgLBZDNXqZxhKVLKye7wWzH?=
 =?us-ascii?Q?mVVWHORX1OkcV9RwtMSiTabi2FCWs/4VKSF7VQoEuQ3axGUM2DuFqINmjvL1?=
 =?us-ascii?Q?zahjcEiicuHBvnpDr2XPlfOf6v1GgcJBQGP8I+uP4ugo0UuOqaKYYwUNef0H?=
 =?us-ascii?Q?qIjBcRKkI/CWZSnsnzCEqpQ/okTXjBcMTY6ztoZf13QaHBa+CdBOGRF/i785?=
 =?us-ascii?Q?q1nGUw8LLR/JjSnOCAkh4zImp0i9d2pRsDZwhFmwksrtTXfZdDfhHY4EgzF2?=
 =?us-ascii?Q?+1sUpLTlyODtU04iBDPr1LGZf5cLMiI27IlGkdGm2cpi3HFzkgl7d4md0OO5?=
 =?us-ascii?Q?FHskGxPsk9jYOZU5jOvWEMSYT9wl5F/kSmvLw6c7shXvO4uGmvF2KDu9jzdH?=
 =?us-ascii?Q?ByHez4Z56nr/4I4uolZmKQ07A2UOhu5/vDRSMsQD8YMeSGTMX64qM0j0LDce?=
 =?us-ascii?Q?6rIyfyYf84CqUs6oQjz8C0k5hMTHT25TiDnj95tAjqd64Gh7g0SPE7gTk/0q?=
 =?us-ascii?Q?NF5WjOenNBxEz7RFVMpPViVaz8j1j15NMR4BVip8k7MxrrVivg7A5dhNzXx8?=
 =?us-ascii?Q?aqHu3r3SK0dW7Tq6kcrYbs9lqBAQgJ8+gm+gWwBqeysduDcaNdRCs08p+DRp?=
 =?us-ascii?Q?AiN/Oy9wXRbkvB3hTGB0I4pJt0pHl/7xU8lwR4W+24rsJNdU0GUewD0YGgS6?=
 =?us-ascii?Q?GiMBUxCmZU9gkojTpIxj2x1JQBPuYZg74HATlvHFk8CTqoG/Vl2FgeW+evzJ?=
 =?us-ascii?Q?i5pK++Sj8eV8cA5+J2O32ZuzdJIw7t4Kt3ZGvo95HR5yqtyF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5400.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d4f3a8-6204-42f0-6cd8-08da4854a0b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 07:09:13.6312
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/FUrhaUdK6r4qSXNH8slewRyIJHi1KDvSDkPqBcbDMwRswT0Kt9XPLGay25j5m/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Tuesday, June 7, 2022 9:49 AM
> To: Michael S. Tsirkin <mst@redhat.com>; Eli Cohen <elic@nvidia.com>
> Cc: Jason Wang <jasowang@redhat.com>; Si-Wei Liu <si-wei.liu@oracle.com>;=
 Parav Pandit <parav@nvidia.com>;
> virtualization@lists.linux-foundation.org; kernel-janitors@vger.kernel.or=
g
> Subject: [PATCH 1/2] vdpa/mlx5: fix error code for deleting vlan
>=20
> Return success if we were able to delete a vlan.  The current code
> always returns failure.
>=20
> Fixes: baf2ad3f6a98 ("vdpa/mlx5: Add RX MAC VLAN filter support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From review.  (Not tested).

Acked-by: Eli Cohen <elic@nvidia.com>

>=20
>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/ml=
x5_vnet.c
> index b7a955479156..c964f4161d7f 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -1814,6 +1814,7 @@ static virtio_net_ctrl_ack handle_ctrl_vlan(struct =
mlx5_vdpa_dev *mvdev, u8 cmd)
>=20
>  		id =3D mlx5vdpa16_to_cpu(mvdev, vlan);
>  		mac_vlan_del(ndev, ndev->config.mac, id, true);
> +		status =3D VIRTIO_NET_OK;
>  		break;
>  	default:
>  	break;
> --
> 2.35.1

