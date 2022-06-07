Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3BBC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Jun 2022 07:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237463AbiFGHIc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Jun 2022 03:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbiFGHIb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Jun 2022 03:08:31 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C031D1CB09
        for <kernel-janitors@vger.kernel.org>; Tue,  7 Jun 2022 00:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsK2mcGcaFRWZZP2VROgdOupzlveNK0LBjwcgZI7gk2TexBn+6GnNbGrWzwDAVhvpiKKQyM2O1oOk7pkgb0bh3NfwAL7PgPKkfABJ/oDbRhz/T+sdnzvNVxIDVt38MjP11gaVya+MCQuArTyVkEKBP2wxRe2UJtL/myeJlHcNfL2RPQs2M0AYxiwOSctr8EmhF8TsSyIzAQlD02tfkUxdQp7oBy6ECb+ea/AZsKC7daY3Zi59IyCaw0H3K37UAGYGF26CSuHvIuUNSJRYYBihdT16Rk0yNtCcaoyGC1fczoIWLuYGH6IsAhyHx/seOnMN66l4HCaFttTk5DL1fHxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iiw9KIkiVeeiJ9XIAxRNMR48vHbFWPQfrhIVLZBaAE8=;
 b=YpPbY6UNxWDJF+yTvgRKg2RoUxNiG5Z2P945Ny2t64AgOpjZLMrcavIWnKtfw1To4B4uuN7RDEUsiwbA+Lno6Ca1SMUEU/4tRB83Gy/xEZRF7u7LdsWn5KlRtJa2yIh25FEmclxawsiW18bjKBOUiMpl7OsgH23brB2G1rAk34VuFQQSvFKmTAEqsHzayvk1GQkSQrYFrvxF9dn0qj1kV1yKpxqoX53b9Suw6d1vPDeqDd65zWOYk06MvIPl6Mx4B+oA2iSFZoSUKzg4pIzhg+exe3AuvCRFAkrlEOgJT8G7sZaSQ4jkWA4vOLn6l5odoJG7BGPVmvONDo66a78g2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iiw9KIkiVeeiJ9XIAxRNMR48vHbFWPQfrhIVLZBaAE8=;
 b=lmNZwn7/hTMdOKtnSoZHeBxSRk4QlDhH54teqtoNOYfz2xnyJz3P3mbGRW7omV69amScQpxwPDoFteTFmgZW5gaHMtS2/EQygErpDhyc0Il7cZMUpbemdGHsYOOVyw+LHfLqI2LIddVafAkj+NwrpP2fSQiFsxs3HEtQl5gMrSJwAna63vscIWSlTWCz7ShxInER7HAVhfZDHg+ay+1QR6rAQBq03TkVQb8traZXMwwWQq5z8mDsHZD/JUoiK9O/Ed/3ygmV6ZL3OZ/GN/SqKQ7OtE/Z5aqdQ7W13FVE5Ly9dGbWEIr2TCoKd4NID4lNMgoSWk7uY/tFsmzxm1I/Wg==
Received: from DM8PR12MB5400.namprd12.prod.outlook.com (2603:10b6:8:3b::12) by
 BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12; Tue, 7 Jun 2022 07:08:27 +0000
Received: from DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::a196:bbcc:de9d:50a5]) by DM8PR12MB5400.namprd12.prod.outlook.com
 ([fe80::a196:bbcc:de9d:50a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:08:27 +0000
From:   Eli Cohen <elic@nvidia.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
CC:     Jason Wang <jasowang@redhat.com>,
        Si-Wei Liu <si-wei.liu@oracle.com>,
        Parav Pandit <parav@nvidia.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 2/2] vdpa/mlx5: clean up indenting in handle_ctrl_vlan()
Thread-Topic: [PATCH 2/2] vdpa/mlx5: clean up indenting in handle_ctrl_vlan()
Thread-Index: AQHYejreKdl5MmTHXEqfMX446ZClKq1DhiDw
Date:   Tue, 7 Jun 2022 07:08:27 +0000
Message-ID: <DM8PR12MB5400F7A0D41E7300022BA35BABA59@DM8PR12MB5400.namprd12.prod.outlook.com>
References: <Yp709f1g9NcMBCHg@kili> <Yp71IYMP+QfuCJ8t@kili>
In-Reply-To: <Yp71IYMP+QfuCJ8t@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ffd887e-a8a5-47e4-2b51-08da48548558
x-ms-traffictypediagnostic: BY5PR12MB4194:EE_
x-microsoft-antispam-prvs: <BY5PR12MB4194F77A3C8C96D30BE0AEA7ABA59@BY5PR12MB4194.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BtcJujGeSH//o1pYfBav8cXO7a2720qQOkbiZ7RMpcQOjuF+7/zoVO13oSRJp2hMzFFxqsblhDcI3m5pROdasuGAc77kB31iijhidn7Z/iyOh8LfC1Ou7COeO6rq/wbwszLXPHWHiBXLaLINxFnKg5dElQl0K7RDNMOiWQwj2Lh6nrqybL+f27mif+mhQbacW7nojeaSY9vr1O5//f2HFL0NwNzkqkCC7b8xhBZBXdAXmvJ/B/9a6eX6iYpxX39M61oHeNb0in3+8+mkMMtW1LCtke6CCAeYDwiAX7sn60Mg9HOFIkilWzC+bDKYzWgfSztDB8HmuO+jcOff2lOqMaqssU4QkvpDj2DjycsB0qXnr0kQwK99VYthmBDzKrcEt8B3XJ7RhD1GRs8RD3GCkwklcrDgswlxgK7InDKEEEWtGEUFlb6DYea6keqXoiu6RN4MG+DfJVaxdHC4fbeHM6Mr8kC4FX4atpyqIX3wziN3X92xhafLAwXzfZhcJLm8OcGVR6ic7XYgV9coTtVhS5v64ftAq9pCWHToejhw2rwveO0yxo+Zl0oiSd4JYRq7MKzAM/N3wPn8gGN5BktBLXAFTuCidGbCUvKjyCMDaZ7kmUQHQ59YuPpI5pDlnxUsVYlNwhZ12ATlCo5vK2/jjHMR/yD3oGS8DZrNQHGSYQM4hf7y4UaDG2pYTTaIbPFune89Q5SbHjJ3LwSsGEC/bQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5400.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(186003)(316002)(5660300002)(4326008)(76116006)(66946007)(8676002)(2906002)(66446008)(64756008)(66556008)(66476007)(110136005)(38070700005)(508600001)(122000001)(54906003)(26005)(38100700002)(52536014)(55016003)(83380400001)(9686003)(6506007)(33656002)(53546011)(71200400001)(8936002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iJPBdprhySA4OzMSieG4jgmJMPaKqqVQWyrPBCQDdNCXWDMm50C+BLWk79I2?=
 =?us-ascii?Q?79PU4Q3ulNw/8DnjpFllh3nVFoawm7j2X88aC1Qov8mT4Dq1zNiD8Dcw9U27?=
 =?us-ascii?Q?1UZSviI7Bv3JM17MrwoWF2xcKLXj+inW3CbQ2zr2aVpEKloqTK+dW6HlGylM?=
 =?us-ascii?Q?u/1vLSdmuKp2esXCwtp/qXuQMWAdncmb2sBCkvqYOX340BCfIkPMWhBIfaNd?=
 =?us-ascii?Q?2MdeLGFxMSXw0V8mdMWExSq3mUJ9wpsC8TJmnj030+x8zOztuwm0kvnv1jtK?=
 =?us-ascii?Q?lHYNSXXqb2fcEAt0OxZobkfR/dGtWlNxq/X2JZnCxAe2jF0DzjVYtQ7pJhtM?=
 =?us-ascii?Q?5O2mWJnyljnUG8BnKzbpCSJRbE96o7OL4cvX1QT6ScF5mGBgLMaL/lxUKGgO?=
 =?us-ascii?Q?iFaaRKKs1+rkNCltHLg3GmIqqhYctzh01vvPoNDmtLACsReOB8GU03TX00+n?=
 =?us-ascii?Q?7xrUBuR2tyvSczs5N8xrHEErzUXyGS7aeuPSRC6f59ivxLGIXmaiPiC4j6Jj?=
 =?us-ascii?Q?Q3JblbHzLOAfj5xArE1n6RQL21havrKLrHnWqvYLJVdH+LZW59+u1GJC/mkA?=
 =?us-ascii?Q?pg7CMAKlB/8Njrg7sVzyGPRMBHXzGucK9uPT1BQxWwtJZLRRyd8G3etJXbxw?=
 =?us-ascii?Q?Z5V50+Buxl32WQ3XKbJEkvaoKWIEQkfmMrCkBgF5JKT6445tFVsKVYJXlJOK?=
 =?us-ascii?Q?96aSvkxs/dgbNQVF6KasN0hWyMT/qJyPyOWm4nChGqmcrw3DWoeIBtR2uD4/?=
 =?us-ascii?Q?MG0ZOH4scfsggXRGJ2nT6SvRKaZltk3NdCXo63lL1jJeE43iFGZeDzGVnLIb?=
 =?us-ascii?Q?Us5klHBfvo3OW69AqGeU880sSgy3U8Ihl3tPuhCoRYV5UoUk0dBXNNEV98yc?=
 =?us-ascii?Q?0eVLOqQXoskTHMaWQhw2zr3macxz0dS+pU0eT/Lxa3nx2LHruD6K5YSflCkr?=
 =?us-ascii?Q?Bh+lfUF1XQ9nlS8K+cfvkxYF/NifdjYHbE6oLYL0LE1nktf8OzGbtnffhRas?=
 =?us-ascii?Q?C25tnCHyN3HJUpYtlwEZmDcStmsfTUdlOOFYircwSYdOb8BBj+qokOybXu/O?=
 =?us-ascii?Q?8pkmI7g/1Hgziwc6pG2ijzHKawl/bnuh89ZBkxSqNnnEiOSnvnDPBM2GsW8b?=
 =?us-ascii?Q?SJh/BVdK01jzlWg6ea0J5BkY2hR5ZlFCI2ZI7exHQVg6yZgtKBs8BHVwaceU?=
 =?us-ascii?Q?FqzCvPMV1jlpXx3+5VW0YFnNYUVTC68vM0MVqDa9K6BklB21Bu23XRb5tkLL?=
 =?us-ascii?Q?ZiUdTA2coo7I+K90M7ZQiriSdo7H543z6tN2nw1UWy19tJ3jgFVB5xCmjco0?=
 =?us-ascii?Q?/A7pSbrQqW27rPFkSo5X46+gUY5TCWZH9PulIFWXXdyfQ7q/4vp4oes67cLf?=
 =?us-ascii?Q?WFPYtMKRAZeFWy2HAApbBOjPhSuVBuTtV+ImY7WGsM51aIlLKfEVGxDKSa9Y?=
 =?us-ascii?Q?T7WjS6Gd3itdSHKqXJHHZntoE04HRSa6kZZQqLibkrCufeDNvzZaCtsHhpOP?=
 =?us-ascii?Q?AvGktiGGO3cYttWpMqbP7wrfGJbz8YLzj1Vn6Y3TELV2r/RWLl0326PqLQv0?=
 =?us-ascii?Q?YQGDD710BwjNVI/tkZIq+hcQ/Oighw4M6h35ZjqSqSlNd5e0jUp+U0hhbgts?=
 =?us-ascii?Q?u3Ma94o93x2Z30J+z+ibQFSVdeH4lvFTMnXj/5TCdYdh8XZ3SE5JuhTsjfDV?=
 =?us-ascii?Q?DwCtdtZ7Fd+bgABf9hEiVSxa1nfPnAbIIWh/R/VLjELda7Qq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5400.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffd887e-a8a5-47e4-2b51-08da48548558
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2022 07:08:27.7322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCq9/4SdI+iCC5nFUWcNWBlcV15K3V5CG0EKOPci9ek4XGGZkjvPPLZibN49ToKu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Tuesday, June 7, 2022 9:50 AM
> To: Michael S. Tsirkin <mst@redhat.com>; Eli Cohen <elic@nvidia.com>
> Cc: Jason Wang <jasowang@redhat.com>; Si-Wei Liu <si-wei.liu@oracle.com>;=
 Parav Pandit <parav@nvidia.com>;
> virtualization@lists.linux-foundation.org; kernel-janitors@vger.kernel.or=
g
> Subject: [PATCH 2/2] vdpa/mlx5: clean up indenting in handle_ctrl_vlan()
>=20
> These lines were supposed to be indented.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Acked-by: Eli Cohen <elic@nvidia.com>

>  drivers/vdpa/mlx5/net/mlx5_vnet.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/ml=
x5_vnet.c
> index c964f4161d7f..83607b7488f1 100644
> --- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
> +++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
> @@ -1817,10 +1817,10 @@ static virtio_net_ctrl_ack handle_ctrl_vlan(struc=
t mlx5_vdpa_dev *mvdev, u8 cmd)
>  		status =3D VIRTIO_NET_OK;
>  		break;
>  	default:
> -	break;
> -}
> +		break;
> +	}
>=20
> -return status;
> +	return status;
>  }
>=20
>  static void mlx5_cvq_kick_handler(struct work_struct *work)
> --
> 2.35.1

