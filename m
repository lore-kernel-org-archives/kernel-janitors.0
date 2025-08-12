Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9622D63F3
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755011142; cv=fail; b=KUa7oAi58GxpSfIVC0qKByUv6nUQtwwZ2GEN2hdDEnMASUPrEw2u/10kYOsLDH7Dn6/B0A3+PczAIG9jwD1+rN6OhTWzksyl+frehNPSVH8T3sfzUcLq3Jhne7RKdFLGMGnZDjvi9K3ldiq356B92N+5Rb5zOXzGLGLWsbvBNXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755011142; c=relaxed/simple;
	bh=HFLfaZrxWle2mE17UDdMCtBIf32GL0xPmGV2HcSZOYM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ufj5rq3RS3Z02N3NJz44HckwV6mP/g6trQajkvFtWDVdgyMG6aJTfVf+vNIbdNmR3EVSN0vmhbYvSvU3Xxcto4If/whs866L7KwdsEDvc0OOCBgbCWVZD9hqztYgJxZpxMN/qe0KxpHcvlGWkVP2bswJF3e6ZN63WxXK+tJLL58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sPtlr8tH; arc=fail smtp.client-ip=40.107.244.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sPtlr8tH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUhn6BIazZaR+FfHMGX7P8I6pi0wq4N46LUDz606ZLeCQqGX9AQ+F2ByjynXL4fvYnD0oIirTp0Fd+lhjeB1CXOGO8ug5qeZ4xQmPN6D5bQ+BW02SzmZuLjowSQBdfSRLsjDCClVJ8mvjrSiehs244qBeaXW19Qf9Kn59ddCGGGXAv+lxJE9CUr7Kwc1NJdHEC3gsU7dWRrjt/szwZJYl1vfbsHWURo4Uyy7xFLWTNl+LxaH8EJ2NtN4B5uyY/q4lmrD82aLWDAHhzvu4WHF20KgktNCkfY29kwUKedieZf2ZxsHNfimrPKrACz058DLIN/nm1ev0Hjo92cExv+Txg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCfCqbf2wB8lPmkgeZom8TJwl5Xoj2rzXZMgvDsKi6Y=;
 b=ql965+AmUpMw4LkUo9jM7w56T5eys2U4yJftTrWufNWkhPxUjmBuxLCKbpsbEh3KgwVVxciXz9MZ7K3CYD4H6FYTbbdPOeMB8WEqbdQZgvKRj+zh6Qb5hDajiSsQt3VhUfTwKPolULCczvAxQ1Ld3w0amrVubzZThqll0hYacJotsUJuMWDPaomX8xTDdVNxS9Ob98UAKoOevt2+ZbPzYW61rXDlKwDpqGjqBcW+ONtkEYmW36T5MJS0qUiTvGP7uApui4Vb+/Y3Mcav5twaV2KqdgM0GtEuBVWZa+J9RSVUuu9eudU6oaZKvUb+Y7w6ps+HWiZS8Xa+stoAM3kl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCfCqbf2wB8lPmkgeZom8TJwl5Xoj2rzXZMgvDsKi6Y=;
 b=sPtlr8tHtL1C1IAsn4TaO8Z/dd4VsQDFsKJWUOlWG+UYhaHZLB0CRLZ71G6gDCTAD+1x+EC7vMcqrAdzYom2jJS9bxz8exBnbRWExzjSC55StvOOOiOTcp6a5wuJWyJw9LzIpCVHzrIYCGEmkhL7LH33e97Jj/TzibazTu+wFOk=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by SA3PR12MB9197.namprd12.prod.outlook.com (2603:10b6:806:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Tue, 12 Aug
 2025 15:05:38 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c%6]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 15:05:37 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"Gupta, Suraj" <Suraj.Gupta2@amd.com>
Subject: RE: [bug report] net: axienet: Introduce dmaengine support
Thread-Topic: [bug report] net: axienet: Introduce dmaengine support
Thread-Index: AQHcB7RKswJFN/m5NUmiXBjYC54MDbRfJSfQ
Date: Tue, 12 Aug 2025 15:05:37 +0000
Message-ID:
 <MN0PR12MB595367A34AD60FD8D7A46335B72BA@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <aJTNZQBAuY83TN2h@stanley.mountain>
In-Reply-To: <aJTNZQBAuY83TN2h@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-08-12T15:03:37.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|SA3PR12MB9197:EE_
x-ms-office365-filtering-correlation-id: 5936d8bf-6959-4a47-259a-08ddd9b1b233
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sj9CKIyphNXMGVZxEuXhcRNoIfNhbCN4fty244J7oVeblN28yl4KTTqZZF9c?=
 =?us-ascii?Q?1aWsnbVwQydDLOE6kIy8sZLnw5k0onLskacZiy1jRVE/+T7h/bfkWGJ2k5tW?=
 =?us-ascii?Q?RV7Wqjv6sGcFYxjtejLmX5ez2hUW50PQWQNVLibrqWGW810QFJCjzLB6915n?=
 =?us-ascii?Q?U/5ojCxzaHChep13ChHyTQD+7P3uGW1bQFFtGVzK91Z6jwXwJxDCaCwiaiep?=
 =?us-ascii?Q?nDgfgFNs4NvPOrX/nDpyXuFGgJ/FLJWQxdaO/we9CLmyY6oU5pBggdqly4qs?=
 =?us-ascii?Q?1f1/znzuBW3y8VBH4Noj+jyv+eTdfkbJnnWgU9V4tWSeH3vi9p3ax53mDlBj?=
 =?us-ascii?Q?AvenoE0uedUjI/Hk/3D7OZLB73wY/pkT5oFVFLuNraO4CWoP2D/FTiTUfsdk?=
 =?us-ascii?Q?8WnbmsBe5W8bHm1Hxym64owIqgn3JuBfQN/MrNw3tQyAS89LuTRgy6v/ypeR?=
 =?us-ascii?Q?SWUt/Wj26Ff3E6phPHPxmVgx7x22A//hHf2VYNnc5XQfhrvZu9Dm9gS65yg3?=
 =?us-ascii?Q?h1Z2+8pDCubuNsdp5St7qpM8Ww3XR9LDU89pvEdXIARhxfdV9qxhFt3cUpX4?=
 =?us-ascii?Q?uX0tULcaT+BFjD9/4Mqn57i4LIYvGHiYdmMU1p+KlO09V6xjwVYcuO5Kj8a7?=
 =?us-ascii?Q?bS5BE+qOaMQC870BHN6mlrSsB7C9uQmawQevVGW4fo0A6B0r3b4Fio1cv2Re?=
 =?us-ascii?Q?mmvZ6d/9PxJTZ/NCBnqql/W2vxhRoWuTVUx4Kxrp+BUsy9daMmTcs6zuoj4T?=
 =?us-ascii?Q?wxAT8jFASESWGoMd1d6ChhxbHpK2Y/5fkqtngBHAKNQjYwXyNSJFabfuo3uK?=
 =?us-ascii?Q?1vga4qakmZ2hfmrn1b3RIgIti5O6nwDmQD4gkobVylCPY4SWQvW7EpDu1OKo?=
 =?us-ascii?Q?n8CPDtdH+n+CaeacMNGBiCvNywJxME0aVVjTJftHj9oyNeLEC5Rv2xo50c+E?=
 =?us-ascii?Q?gaGwJjD1WXvbro4n7LGS6NWEl3XtHWwIbzNDnJU7W/vuGq5TAEo2wH9Soa/z?=
 =?us-ascii?Q?KeOCubyPAqd0xWnsPj3utTM63z3yia7fo12zpZ5pxSkURp6x9Secx+U1Glg8?=
 =?us-ascii?Q?fWrQiFaAqlwPwOVsc1oXIi0QdsJwBM4lbUQT0AVeXPkt/PXx91UI4qTB0HyC?=
 =?us-ascii?Q?sfsHihZbJ5znar4ZrGnoRyqoarT4sw3PImqTDe/A3tJpUwF7qIQmYhMo/Ieh?=
 =?us-ascii?Q?wY7nRsPvaORg5y7IeSvwvvOakb25qbYZUXnAcCJ33zMg6WcXcHE7yqYkvdRm?=
 =?us-ascii?Q?S593OcTI1p7d6c4TTjYd73n9iG0jA7BKzyEmFrJROLL0R55NXb/wZ74AojtS?=
 =?us-ascii?Q?ZfIHCRLdZFOwWFwr8QoVe8mulj7MHdLpojxHE/M1O0wllv1Dgadvd+Rr1rV0?=
 =?us-ascii?Q?g0vKWsqprbLpcaEtwxOnq7BRj+NUpldCS3smC59nnrKYAuWATJSE83H42t0n?=
 =?us-ascii?Q?bpk4ddF6wGnTrIryWt/aTzRk02eS/4Uv76gI8vxfo19gdEXH0TfggxUPxE/m?=
 =?us-ascii?Q?AgCDEeqgY+ErKoU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qOYUw7tr+P7lFeQNSporn5lnDFRbszecB62dodyTU53s84pi/Y7L1Dq0cVbG?=
 =?us-ascii?Q?2plQ2H5WUQAt85JUoEa39ZKRk4BNRj/6g/Nu2IHP78sCa7gEAkmeDPrbj/fA?=
 =?us-ascii?Q?6M1Ef9Tv5oRbNu6j1oXxNMxnAahOI2pgz3r03DWFH5vDLAWtwMKSzzVsF5vw?=
 =?us-ascii?Q?FS5PkbYThONH7km9yNYfig8TnW6IzqrZ5JtgFRjBZV93JEC7Vv2LgQY0+rhF?=
 =?us-ascii?Q?vAqhrYaV94itl92LzePWB6iPZbZXo4sMa5xx50BBGcUlGM9P4ta587Mlqa84?=
 =?us-ascii?Q?pO1/RFJirEFVcnjd9aK6NlbYM5WFE+h8e5CKUXPHM+VltFb2WfYz+Mgbf7UI?=
 =?us-ascii?Q?QlVbxFpHPDP+u5hIIi7fuCiNzFEbo9izzow1plvjaZUc94wNxedYXcMO6NTt?=
 =?us-ascii?Q?hczbqd0c8Ia6xA5dHAgY8pqUm5jHj/lqfANQjjVIobmU/R21mQ3RzSBWs2jq?=
 =?us-ascii?Q?l+hFOOIOZPPqUMyJ7pCyRud+zdtANy6KZG/A7mZyc8k/jGzoxI5BKIFvj4Wj?=
 =?us-ascii?Q?pxjgeizB9cEU9e+E98R3bwJbY0/gJdtcByM7JE0hrKWSny78Su4UYGmr3V70?=
 =?us-ascii?Q?fbUT7/aY11A6JQcf6c9XRwBG393v7bh9+QDp3VrISL4/66DBgVwpnCtNUnIZ?=
 =?us-ascii?Q?FwalMVbYWfDqL4Y5ovDb1esBYkb+cE9m7DC1fbilFi5t4u/KtJcmANvOBcle?=
 =?us-ascii?Q?QMKff4pS5pH0i9YO15TNXr8bB/oF9KfzV+NGP+QeuHbjtMY2AkhdPTVIo96b?=
 =?us-ascii?Q?HgrjfFPf+riDt/CLrTjCoUbaFTpJvqNZhWCrfuj9pz0NQk6OK8zyBVhh2E+U?=
 =?us-ascii?Q?zLkK/AjsrVbD4E7uTGPscOvmaHzONl7+rgmYVJiMkpmR3TZdRPR3wdfT8YO3?=
 =?us-ascii?Q?EqJImbhDaKa+v8iOJB9nfn85LRWi9KGlpp3Qaqvl+WxoTFkVretjUWcnC6h2?=
 =?us-ascii?Q?kz/u+aE/5hp7u4ikdv9NcTPZZLOjohSujfjPtU4GF3RWAmm54DjBiNDpswy7?=
 =?us-ascii?Q?VOJP7Ok3YOqQAeu7fJQxS8lRrw1qF0tuEH1EllY5d4kD94cqZopR7pMp5iQe?=
 =?us-ascii?Q?mGeH0U/niKbK7LhbYum9lahjH8m2OL0Y3an3IoN7iWolrRAV26ti+H2npXhC?=
 =?us-ascii?Q?S58m/fr3mQF2csXxP4sfKtJpeqEpeD5yFXq9J0yJm0fouZEhpAHzJy73jFeE?=
 =?us-ascii?Q?ko/q7Ati9FuaZV7GZafqn33mUm8x/1vrd+PfdeCURcnnU0tTYDW1WkDAlLl0?=
 =?us-ascii?Q?sSb+Myc6zvvM6shT/8yuN0yDd98kASGebl2BnJiZsmfDNMbvp8nPNT362SED?=
 =?us-ascii?Q?jupm5LCp+mf1y3O2r+hlrExs/RMF/r7nmFkqNZj9x0t7VZUW7SbqtPFRFBnv?=
 =?us-ascii?Q?CKqKyCA5qg537P22Fo2YtTgCWDBccicja7tEOuugEa0QAAsu0e5OL9UZMHBX?=
 =?us-ascii?Q?iN7vVI+GqBOamxKCPv+NgzaolCyC31CQTtphny5uHleh65+BTS+AlQX/BXCj?=
 =?us-ascii?Q?kaCemCIO3BmnOKyqzZkOeuIRDIVvpnLUdH8hTTuWc4djk7B4UbT3B5Jy1E+A?=
 =?us-ascii?Q?+6bpFjXbG3goZ2HUSiY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5936d8bf-6959-4a47-259a-08ddd9b1b233
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 15:05:37.8001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgFBaOliRPd5CEZWTgtD/aZWvvII/+bPXmFPz2/oJX0TMu7R9SamYT8dsVXSUs9n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9197

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Thursday, August 7, 2025 9:30 PM
> To: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>
> Cc: kernel-janitors@vger.kernel.org
> Subject: [bug report] net: axienet: Introduce dmaengine support
>
> Hello Radhey Shyam Pandey,
>
> Commit 6a91b846af85 ("net: axienet: Introduce dmaengine support") from No=
v 16,
> 2023 (linux-next), leads to the following Smatch static checker warning:
>
>       drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1171 axienet_dma_=
rx_cb()
>       error: 'app_metadata' dereferencing possible ERR_PTR()
>
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>     1156 static void axienet_dma_rx_cb(void *data, const struct dmaengine=
_result
> *result)
>     1157 {
>     1158         struct skbuf_dma_descriptor *skbuf_dma;
>     1159         size_t meta_len, meta_max_len, rx_len;
>     1160         struct axienet_local *lp =3D data;
>     1161         struct sk_buff *skb;
>     1162         u32 *app_metadata;
>     1163
>     1164         skbuf_dma =3D axienet_get_rx_desc(lp, lp->rx_ring_tail++=
);
>     1165         skb =3D skbuf_dma->skb;
>     1166         app_metadata =3D dmaengine_desc_get_metadata_ptr(skbuf_d=
ma-
> >desc, &meta_len,
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> No error checking.
>
>     1167                                                        &meta_max=
_len);
>     1168         dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp-
> >max_frm_size,
>     1169                          DMA_FROM_DEVICE);
>     1170         /* TODO: Derive app word index programmatically */
> --> 1171         rx_len =3D (app_metadata[LEN_APP] & 0xFFFF);
>                            ^^^^^^^^^^^^
> Dereference.
>
>     1172         skb_put(skb, rx_len);
>     1173         skb->protocol =3D eth_type_trans(skb, lp->ndev);
>     1174         skb->ip_summed =3D CHECKSUM_NONE;
>     1175
>     1176         __netif_rx(skb);
>     1177         u64_stats_update_begin(&lp->rx_stat_sync);
>     1178         u64_stats_add(&lp->rx_packets, 1);
>     1179         u64_stats_add(&lp->rx_bytes, rx_len);
>     1180         u64_stats_update_end(&lp->rx_stat_sync);
>     1181         axienet_rx_submit_desc(lp->ndev);
>     1182         dma_async_issue_pending(lp->rx_chan);
>     1183 }
>
Thanks. I acknowledge it and Suraj (added in CC)
will send out fix for it.

-Radhey
