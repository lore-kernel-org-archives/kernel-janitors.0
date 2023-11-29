Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dPnOc8LV"
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2047.outbound.protection.outlook.com [40.107.100.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FCAD5E
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Nov 2023 06:46:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3IG337SePRi619+gCv9M2u1xtajBddQi2AEKNyH/xX7CGwM+oaWmZOl6WkBqBbmQ67ca1JE8RHI+8WbOqklKt36m/G/yozSho4O/9qNY9sT4DA/If5U4r9/Y7Egu7tpUehSWZ15YbhvRw/mjUeP46xmJsnMYZUFsbbk7JfbOk3f9cmr9S08p3j71H669LbOgrpW2VkT4ZqEV6WuAw1PpnrRcAtqCmOA7GL7YrzFGyeIWLI0BBFurpPL6QFB0/4ATRyn6zndQL4obWT2rrHy7ez60EgFEAVkvd4vweboMNZgDgCTptM+TbtGri8z578GvyjEEkvxopdlHQ3bcdqRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1lwgcuYPn57oKp9QcQMCA8viqtcyvaPL8iETjyjbv8=;
 b=XN73Gx8W9bmGeLGt7u6AgjZkWlKSORj4X8ul+NXfS5gXZVy8r+86R5bU7Z5/8L+Md3JZT8BOF/kpGsTCYp6rA2DKeJUY3By2fWQNVJyN8M2rREwOa6lU4hBJ0lr9vCEa0t2PyjtTTkwjbloaA0RkUAsBekGGTcstMb+avZi2DlbMoN1OwRoVP3H1upbxPbbkY4PdPPKbQ+1usFqrRUXBk8j/YZMhIR5GR6W7nhPvoz8ffCYFJ5nHm6V1Ve2Pr0zM6nMUk072UfRk6hgN1GS4Y66zTmjOgaiH+6XYwLQqmnu4yIM/q0UvIrW5vbrjr1k/xPx/Qs423yih2DLdYxCkHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1lwgcuYPn57oKp9QcQMCA8viqtcyvaPL8iETjyjbv8=;
 b=dPnOc8LVqq6sJh9HX4wGswBkmE1BXEGtCl9FsnIzmuQcoOnNbgDxzrQkBUpk8qeQVigZK367DlCTiw5ZfZDQcVfipvP1Jf3iOIzOntgSbtsRBqTog37IsCn+I65M31l79O8vBJYJZd6xcz9xvpAGZKU61oAB0tUCWKM3pJOZu9U=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 14:46:42 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::5c47:dae1:11f6:5188]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::5c47:dae1:11f6:5188%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 14:46:42 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [bug report] net: axienet: Introduce dmaengine support
Thread-Topic: [bug report] net: axienet: Introduce dmaengine support
Thread-Index: AQHaITFbntaUEpyTXkmBodwgH/rlrrCRYsww
Date: Wed, 29 Nov 2023 14:46:42 +0000
Message-ID:
 <MN0PR12MB5953A04714F39F1E0AAA071DB783A@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <b8b0ba96-9412-413c-b121-58d217d8d7c5@moroto.mountain>
In-Reply-To: <b8b0ba96-9412-413c-b121-58d217d8d7c5@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|DS0PR12MB7748:EE_
x-ms-office365-filtering-correlation-id: a9858310-3929-4bfa-7ae0-08dbf0ea0064
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 f2ATX+gtz1cA64UMHK45j5c4M8+Poluty9K9otodK25fFWFaNdpcIX4iqRf+CZUA025dZD7oI3J+vvX8CuLoqJv+H68LYr098Rb9wjtgjvkE9CrdJX4bvtRTz0Wjeq8TjSG7pmWOxqgC0/ZK5ebhsm+NRsMaV6TMi7JciwzOmkEo9RcgNJGFt3soL3O4hrnPXZ+OW4/cPgbionihlNTwO3jHA7P8zYyEQyorlWh/NsKm4gmu7r/U6YPkQ47OIqqEv1ieRaIhjoG90d11Hrq9otf4U5LA1/hdczrebiG+fcyxtLSnj6InyEL7DIxIJTzkSDYNkIEkRFFM61NhXHDodaM3fxFZlpt38lBa52j9NJ3VShdQ/0iiREzEIia8rx6pmft/TgLGVxAAp32aszPYtqvi34FWZvsYTSGIGRu5TTm30yiA3mWfxwmTwx6iFwnxCFGH3hdcYkNqRkRs51btyThcw1ZgT0Yse1ByQI6sUzeIt0Xu5cn2iTAqR9qSGY/gFcbKmd2DaTXm1QLYdoWYMi+vo8BrHyOM5nPaEf1W6pGtAQ8lu2nZkrPFKVaMDohgkZclyn1XktEvc/FROB5VXcJXPZYTICTIDJPwibUj1t3FLkLyoDmXIBgYEXGGrdpRMcbv25yizQ1kdVhbj3U1apLVADLQTRaOcT2AboAuQn8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(9686003)(6506007)(26005)(478600001)(7696005)(53546011)(71200400001)(83380400001)(2906002)(5660300002)(76116006)(6916009)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(4326008)(8676002)(8936002)(52536014)(316002)(38100700002)(122000001)(38070700009)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?s7WKRiBdftRiHBbeaGC0gE4gAILK8LO+lFN218n2/5GRHilhpOdWPUq8IuYT?=
 =?us-ascii?Q?vtdPmog5EOhl7E3EN/jSMM1nfKavnPRP8Z572dxW9EBNrnw7eMy5Fx3w1Lr5?=
 =?us-ascii?Q?Inwnw2T/SXneXTlV0rDBTzN3Fq79rl7cjXLNnpjhq975mMDGxPGWvvo9FXyd?=
 =?us-ascii?Q?R1qU98XTjhHa0QLNFahD0jLt4AB0iHADlkrjNkS7QgdGgcWUPTrQrA93iNt6?=
 =?us-ascii?Q?9b5Jx/OZu1AD+E11Hyerf3Jlq4szwqIysJTrryDYT6ekWUih4sW+E3mctX/X?=
 =?us-ascii?Q?rOs3dMzppU0WdRsgq5gfIre3BHU28zCH6u3g6HX3W6ymSGRQ19AqMmwFa5Q5?=
 =?us-ascii?Q?LZteTkKMbWryU0myDt0dNbL8Ee5hKmdDGZ14QStdOs1Z9NpeWY96ypcPZO0k?=
 =?us-ascii?Q?x6PTBF2zFHmWbcuPae9ZtDMWlvU82T7jZ+CD0UiKGVxh+FWNjLkh7/tltTRp?=
 =?us-ascii?Q?cL9kcjTeHczWzZKh1LpL0ltaxKo8c6e6Ci3GPBdstorPYNow7WtGVxXCe4E9?=
 =?us-ascii?Q?cEa7SB1N2XVRBawx5e/e4DEa6anQh5+djRsLl5pcimxCc+wXrCKzVoE2W3ju?=
 =?us-ascii?Q?dTd/hizIhNZLcLBkZR6LL1+wDX/s942/LdFdjVBmrAXmtRmvKzCz1wF+pn7L?=
 =?us-ascii?Q?/GsX1SZ2gBt5Ta/r4JdRCjaSQURMHWlh7wHJL8EOUkHgSmECxXxQzYeSp5wd?=
 =?us-ascii?Q?r87lMaqyukC8wDKQIx8EHpAER1r8I7ebjFhu0qZtRlXr65mkvL6Qk687oc/X?=
 =?us-ascii?Q?GNUstCSQGs+gHLZ6lOMPfOHRGsT8OPYTaTss/FBUeRRxGjd9gyTMSKwf2qNq?=
 =?us-ascii?Q?YiCI7mQF+Ze3mhbx0+QQR5wyDU/3T08Js4/gKCUi5PB9MnY6pdRB0RWJc8i3?=
 =?us-ascii?Q?AdUSy4prKOEeQcV0TRUV1WRGcwjOcW9v1TzWLH+bi5qBQexnkndVxKjAqJSF?=
 =?us-ascii?Q?Zgdlf0SZxUe/Hz9Oz7xrOomXoIP4nUhmxoZMqewp95NtWzSV5v710r5riT4Z?=
 =?us-ascii?Q?CwBaHBcAApw+BV41zhNCHA4yw3+X4rSVHU6TXggine3mnj31HQRVePqoBggK?=
 =?us-ascii?Q?gNtjwnFM60G/SlMYIxaODvqr8yrzxM8TXfm0e4mUQY5+Q3qD9ePWV/ZMGXZ7?=
 =?us-ascii?Q?/5VmTuTW0WNvsatAZ5yXDRiSNevL2T4fn0E+B10DsVaOTJ6DcwnIx7zTTNbc?=
 =?us-ascii?Q?AXorpHBu3fF8JXljjr/IMHqg/XNtU/BXjlf3zazoOFMrcjDb/piFk9zuu1UL?=
 =?us-ascii?Q?xMLvPFKUcbrXjKxleynt/leIDNxjew/Opwhhq+igCmVPciyQrGd1MoFZdexc?=
 =?us-ascii?Q?S/NMA8mTnooxIwI95LA3WcMH59/h4SrwbJLmcJr1Dh2eC/rWGrWfHnsVnpAp?=
 =?us-ascii?Q?Xa3DgfJYhPqAvZthfFK/K8dKfvNHnBaNUxyBOcFEawmZgYrvx7fJ0b7Z2iva?=
 =?us-ascii?Q?kX3lIOlUurwuJ838C1csKZvskHEeYhXtrMYJKxaTPLf6duRCqBKoLVB2bjY5?=
 =?us-ascii?Q?1QaC/H6Ma+jh3rQsWSdx7hoLAf9yKkke6ZlOtXCcMYDO7RTy83uBEhY7+ifS?=
 =?us-ascii?Q?1bTO5UucuEcYNXa04Ww=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9858310-3929-4bfa-7ae0-08dbf0ea0064
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 14:46:42.2200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xyuo18se7c+SA3Aid218QvokHG3i/2H29Kbc1Q3XmX5W6VcZg/2ZmFAA5mQ2IFy9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Monday, November 27, 2023 6:28 PM
> To: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] net: axienet: Introduce dmaengine support
>=20
> Hello Radhey Shyam Pandey,
>=20
> The patch 6a91b846af85: "net: axienet: Introduce dmaengine support"
> from Nov 16, 2023 (linux-next), leads to the following Smatch static chec=
ker
> warning:
>=20
> 	drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1060
> axienet_dma_rx_cb()
> 	error: 'app_metadata' dereferencing possible ERR_PTR()
>=20
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>     1045 static void axienet_dma_rx_cb(void *data, const struct
> dmaengine_result *result)
>     1046 {
>     1047         struct skbuf_dma_descriptor *skbuf_dma;
>     1048         size_t meta_len, meta_max_len, rx_len;
>     1049         struct axienet_local *lp =3D data;
>     1050         struct sk_buff *skb;
>     1051         u32 *app_metadata;
>     1052
>     1053         skbuf_dma =3D axienet_get_rx_desc(lp, lp->rx_ring_tail++=
);
>     1054         skb =3D skbuf_dma->skb;
>     1055         app_metadata =3D
> dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
>     1056                                                        &meta_max=
_len);
>=20
> dmaengine_desc_get_metadata_ptr() can return error pointers

I will send out a patch to fix and add error handling for=20
dmaengine_desc_get_metadata_ptr().

>=20
>     1057         dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp-
> >max_frm_size,
>     1058                          DMA_FROM_DEVICE);
>     1059         /* TODO: Derive app word index programmatically */
> --> 1060         rx_len =3D (app_metadata[LEN_APP] & 0xFFFF);
>                            ^^^^^^^^^^^^
>=20
>     1061         skb_put(skb, rx_len);
>     1062         skb->protocol =3D eth_type_trans(skb, lp->ndev);
>     1063         skb->ip_summed =3D CHECKSUM_NONE;
>     1064
>     1065         __netif_rx(skb);
>     1066         u64_stats_update_begin(&lp->rx_stat_sync);
>     1067         u64_stats_add(&lp->rx_packets, 1);
>     1068         u64_stats_add(&lp->rx_bytes, rx_len);
>     1069         u64_stats_update_end(&lp->rx_stat_sync);
>     1070         axienet_rx_submit_desc(lp->ndev);
>     1071         dma_async_issue_pending(lp->rx_chan);
>     1072 }
>=20
> regards,
> dan carpenter
