Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5381C43334
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Jul 2022 03:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbiGNDZO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 13 Jul 2022 23:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbiGNDZJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 13 Jul 2022 23:25:09 -0400
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39F325C58
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jul 2022 20:25:05 -0700 (PDT)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DNXEA2006791
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jul 2022 20:25:05 -0700
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3h9d0mehx6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jul 2022 20:25:05 -0700
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26E3Argt014842
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Jul 2022 20:25:05 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3h9d0mehx4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Jul 2022 20:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdupO9kEd0rHBm0RY5K6ovxPuwZMKoe4lbtrvaGku46+n0wiHbrgdXuQhxRCz4vVvDouvhME4xb7GuapA3umPIEVwvJXLEWBpFrPqS/uxNr7q74ZT2GWTXDQ5H9I1OhmW4L28RRVIcDBbpX+KbWjMl7+pprNHBEXcvFcKjZrV7GvL50/BFOO/8wNlTfUuxkYbkA7XhNcCvlo3A+UazRt9+JozoOaK4pXGaF0JftpxKhoEXQrK6aGJjVrowH365+GL0aJ9CCi1tMGnIiC8nPbLYhNMn+pk/X5iutCR0SqdFygbOlpqx5nR7IYRucyHpuz3HY/Z5krhulEo0vmim4bSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk0zZg4/6d6T5kLdkuxZW2xeFRX0BkEYJ/Fu8igTs2E=;
 b=J/oc4/O5zNwEuDSXsDuSq5XQ1L0IAueENpzuLmzWToyWycs1358TPeGQoJeyU95u1LwKREb1oTVfrWYGgEHVeAP6SAAZVjJAySTqp9iblNCI77U4p8EyUoklcHGmzsaFojFnLorlWYUQ6FE8QQFDmUNs9qWkEMoBXIYJO/MxlI56RuxqdmYz/RnWCN+NkKQ2R2OhzrTGI3ROB+TYqJg6jKh/ORAooP8ivY9VeqC7xO9OizdoGsJtRCwd4IfsVUeeN5YOt5cl/J7Ki0IISds3MQR+z/2qesUbYpQ2VKH0E4mQgO3mAlc9/6ESdlkExAw0+cvN0pr/3/mm5irumDoQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk0zZg4/6d6T5kLdkuxZW2xeFRX0BkEYJ/Fu8igTs2E=;
 b=iYJeEgPS9Y+FPdxqzp1WJMOBSG4xX0lG3IpZ/en+ZEz1BH8ob39uFJIvWIUArJRJTMtpFXMVVxe64XjnDpJvvIiI9wHrA0/GrfGoYra/tHwyE3hJMHrEODRY0Q+uV5uDxUhrP5vPHY5kEiacz3vnf8glCcw7DBo0oHrcNILhZFw=
Received: from MWHPR1801MB1918.namprd18.prod.outlook.com
 (2603:10b6:301:68::33) by BYAPR18MB2856.namprd18.prod.outlook.com
 (2603:10b6:a03:10e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Thu, 14 Jul
 2022 03:25:02 +0000
Received: from MWHPR1801MB1918.namprd18.prod.outlook.com
 ([fe80::b489:f25f:d89c:ff0a]) by MWHPR1801MB1918.namprd18.prod.outlook.com
 ([fe80::b489:f25f:d89c:ff0a%7]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 03:25:02 +0000
From:   Ratheesh Kannoth <rkannoth@marvell.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [EXT] [bug report] octeontx2-af: Drop rules for NPC MCAM
Thread-Topic: [EXT] [bug report] octeontx2-af: Drop rules for NPC MCAM
Thread-Index: AQHYlqxJWM8kY8KuHkC3Nu7VZoMTia18XtLg
Date:   Thu, 14 Jul 2022 03:25:02 +0000
Message-ID: <MWHPR1801MB19186110DDA1663479B6E6AED3889@MWHPR1801MB1918.namprd18.prod.outlook.com>
References: <Ys6tO+/RAH7WEDH7@kili>
In-Reply-To: <Ys6tO+/RAH7WEDH7@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0396e1af-8a66-4961-bf79-08da65487059
x-ms-traffictypediagnostic: BYAPR18MB2856:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wequOQiKHI6gKIqWQCzziVNJ9QJYhd4G28iTiS2HRcdAHmqS6jXpSo6ontP+y7hUyO/QU6mHFDFtwvkCO0mIMPfaSe64edJp96zG62qH1UFBBE0ObLXVPi0YGc0LBJYe5ddvFFhqGZWrUZQdjQGb24S+wBGkeNFNTIVtqs1KIFzo+7DAnVMeIwW3eFhLj2KuBAt5J7ibt+Y969iftRF5RTzR4QVO0JYhzqHs58nrf/GEljwSZDX/QDQx66KhsfSaUe7X/s1GOt1cnJRGJ0q3QgsRUKrSslOR2RJDj/Tmq1mP09TdIyiOzmNQwifY9qhFlaUdUdNmACBPUZDpVQOf6bjjLlyxHNiVpPTklhU9Ae8hp8I1WGApp6LREsUtaq+fpLafbWEMrUtROrzpl+3qe26aQnRu3wIH9pr1ZM1LZjnNWhQqDR+RqVGxQhnZcwvn9q/PA9D6tUhYPqEaKzekmFlttcewvt461fgg0WkO7/g5fGaS+bX2VVCRWhX229JjF0Y/J5fqT+Slv8NCInXpJMSVstPVCKEf6I9lHnDV70tpxDA0sNfZga9iPXIrPo+NQdALVkJqkVKmCQsayZQuZBvZ0+PjeNbWbf4ElSamp9K1B+3WOp/0yA2nr2m/yrzyx+/7YNvXjkBqMenWFCDPKnuQcYjYEWplPzRnTKxfZKfoyqe+cFXE7pVRAAVbVFlQI0W5HixXd0ZJXqkWFWdj7LBJ+rzJX6SRGSynTlMyAJQMmu0RQVcp5o08FE87VplU9lMP3+rsgoU3IqU0XZgySU0UhMDimnFO9K+Co5RbLEFRpqi2QW2WoiFxZGuhxNoZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1801MB1918.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(6506007)(316002)(478600001)(71200400001)(7696005)(41300700001)(66946007)(6916009)(2906002)(9686003)(8676002)(66556008)(55016003)(52536014)(8936002)(66476007)(66446008)(64756008)(5660300002)(76116006)(26005)(4326008)(83380400001)(86362001)(38070700005)(122000001)(186003)(38100700002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G1GHTPuwAU/L+e5UhNLTpO0sronDDpCZJG7bFrYnjnyO9+4zpRFocrjHxZQ7?=
 =?us-ascii?Q?FPigHbMMjoM3cMZhMIZIL0W+1G87PurD1mdQMNPz+UI0PPH4GKLnPq2XXGno?=
 =?us-ascii?Q?sdzOYO9rP4KmdDuOfibTGbzgmSoL0nMNSeUSANego8hCPrmGizQ97JX6JZbN?=
 =?us-ascii?Q?K2bJrxEUYeT43CphHvio0n9Tg1oZy4jZdypYq6vL9vco7Eii5CVFd6o/YjvF?=
 =?us-ascii?Q?mP3d5h/PCJPBplA378XwmauibMlhe6gf3W4nxu+Vlne1j86QFv6UESW6NEmO?=
 =?us-ascii?Q?MUwVLVwmDPyqXi973W6uc/RqOFN1Yn3mJtBwbR8C9qAMGhG4fVCpSsIRlwxb?=
 =?us-ascii?Q?xhil7AqCYR+WtP4MkbnIpudhR9CDF+SR9/NUb+xVcTYQXn4Ydg6ahg528aBy?=
 =?us-ascii?Q?WIzJLD3WAD2667OXox1XjUr61ia8mFrwnrNVQwtBsFVhx/61MTeJcbX8FjDc?=
 =?us-ascii?Q?TZW54DnaJi0/OW/TQEV1I9HkIoBuvfNLbhkbieESmT6UYkwl9l+V19RLO2eM?=
 =?us-ascii?Q?XQa4h6POsuRtDk80DRrze6qzG4dxKgz7J53tzE8jfKfzU/q/Zmua3Vnyb9AU?=
 =?us-ascii?Q?G9j6/ykogfFmJ725vOX2EU3Qi6eQUF5HBqLRNQCBTwuZzIR0WzSZA6LBYMMD?=
 =?us-ascii?Q?halMMtyZF8ozk/S9dSIfNww949K5YwuNxMXckTZhvQ75nevB3vui05B0tGKD?=
 =?us-ascii?Q?jrVTFk9lmurszS0J3SYAmfzl66t6jkMUvdkdosMLHXSukNGEzjzv0zUP8446?=
 =?us-ascii?Q?v4comkAbt1YYsuwwrsclrB7tR2m9Q8FkkUTflA2Wi3kbMn3NXU56Ny6TFB5l?=
 =?us-ascii?Q?0ICmy4Kj6Lo1B3AI/BkhfcA1e27Bvh+6PThxTmwdUPBMLMAqy2abR4/HGBeY?=
 =?us-ascii?Q?DzYfY/nxqzMXfHB5adsmYu0Mw1mnjAZPV+jhWCqO/v9FKDrLJ3Jp2C7wQfY9?=
 =?us-ascii?Q?o2lyrnnf5EHyZeleMrDEggWmJpG+PxPID2oIvUvFyHKmmYRnJokfSa/9vePN?=
 =?us-ascii?Q?2TH16hZuXVlwDo7+JNgS8FkeeYlN2E3DUPYpksCysZGIvMurBb9rGEBKt/zy?=
 =?us-ascii?Q?M6+Qq1GxcRFPahpthE4BXSGukXlG3xtIEInjEny+SuV8A5J5EoMC9YhXhyyb?=
 =?us-ascii?Q?P47VEVnIPmhJu51UH58Xy5WQgDESqlsfni+6Vq5EWEqDR7KmMQZSGHhokD3m?=
 =?us-ascii?Q?sdtErF69h1l7VWnH2a83SfcoASYBme+rtGSw3Y/uUHp8CSNxlCfmE0e01asJ?=
 =?us-ascii?Q?/yHOful0Ce6Sz8tqzqOaFUuSOhauUHziKPzwKj42dqUALJ/mHmLlQNT1iwoz?=
 =?us-ascii?Q?Zs5OghwiGGFhPJfmdUAIX65IiMRLdPmbDVTCeMGq97adgulMQ5OpxNzbbbQF?=
 =?us-ascii?Q?iAByph1MIB2D2EpCVuNS9omkgrgnkdvtDgVTeDs6/T8pwFPa69ajQ1ggjSOQ?=
 =?us-ascii?Q?RAeDvIP35HH8Ha2/xOoSCNw0zUn3e/e3WOsIqqPsq+3gNdHz9olQfXMdm8lD?=
 =?us-ascii?Q?Dv4St9vAu3bFOGFNHYakkpR5W0Xyj07QQ+25w10DRJ510ZD+Dlf2D4iGaCD7?=
 =?us-ascii?Q?aUJA3Fibxiv3WB6gzdUh4PaNXXWsoUkiA/0rH5/3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1801MB1918.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0396e1af-8a66-4961-bf79-08da65487059
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 03:25:02.3014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Ms64T3Clk+JdeKpGuQTjYCNVCXB5AEsgLSuvLgdL9bixZTT/kyzGwQQPhwswBCBtZmglSbuZzBqqIu4cDpfGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR18MB2856
X-Proofpoint-GUID: jUiLpGmXTf_BajtOPg2xNsDHaPuqv7w_
X-Proofpoint-ORIG-GUID: ZgmkSRhaGS0MfB6AqdLUURlyu2XToTT2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_02,2022-07-13_03,2022-06-22_01
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

>-----Original Message-----
>From: Dan Carpenter <dan.carpenter@oracle.com>=20
>Sent: Wednesday, July 13, 2022 5:02 PM
>To: Ratheesh Kannoth <rkannoth@marvell.com>
>Cc: kernel-janitors@vger.kernel.org
>Subject: [EXT] [bug report] octeontx2-af: Drop rules for NPC MCAM

>External Email

----------------------------------------------------------------------
>Hello Ratheesh Kannoth,

>The patch 3571fe07a090: "octeontx2-af: Drop rules for NPC MCAM" from Jul 8=
, 2022, leads to the following Smatch static checker warning:
Dan,
Thanks !!

I tried to run smatch tool and could not see any of these errors ? Am I mis=
sing any step ?
=3D=3D=3D
./smatch-master/smatch_scripts/kchecker drivers/net/ethernet/marvell/octeon=
tx2/

  CHECK   drivers/net/ethernet/marvell/octeontx2/af/rvu_sdp.c
  CC      drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.o
  CHECK   drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c
  AR      drivers/net/ethernet/marvell/octeontx2/af/built-in.a
  CHECK   drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
  CHECK   drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
=3D=3D=3D=3D


>drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1964 rvu_npc_exac=
t_init()
>error: uninitialized symbol 'err'.

>drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c
 >  1953=20
  >  1954                 dev_dbg(rvu->dev,
  >  1955                         "%s:Drop rule cgx=3D%d lmac=3D%d chan(val=
=3D0x%llx, mask=3D0x%llx\n",
   > 1956                         __func__, cgx_id, lmac_id, chan_val, chan=
_mask);
>    1957=20
 >   1958                 rc =3D rvu_npc_exact_save_drop_rule_chan_and_mask=
(rvu, table->num_drop_rules,
 >   1959                                                                 c=
han_val, chan_mask, pcifunc);
 >   1960                 if (!rc) {
  >  1961                         dev_err(rvu->dev,
   > 1962                                 "%s: failed to set drop info for =
cgx=3D%d, lmac=3D%d, chan=3D%llx\n",
  >  1963                                 __func__, cgx_id, lmac_id, chan_v=
al);
--> 1964                         return err;


>"err" is uninitialized.  This should be return -EINVAL or something.

Fixed by 6a605eb1d71ea8cec50bdf7151c772c599a5fb70 commit.=20

>Let me just send the whole list.  The rest are mostly caused by no error c=
hecking.  It's possibly deliberate.  Hard to tell without knowing the subsy=
stem more deeply.

>drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1232 rvu_npc_exac=
t_del_table_entry_by_id() error: uninitialized symbol 'drop_mcam_idx'.
>drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1312 rvu_npc_exac=
t_add_table_entry() error: uninitialized symbol 'drop_mcam_idx'.
>drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1391 rvu_npc_exac=
t_update_table_entry() error: uninitialized symbol 'hash_index'.
>drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1428 rvu_npc_exac=
t_promisc_disable() error: uninitialized symbol 'drop_mcam_idx'.
>drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1473 rvu_npc_exac=
t_promisc_enable() error: uninitialized symbol 'drop_mcam_idx'.
Will fix and post patch.

>drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1964 rvu_npc_exac=
t_init() error: uninitialized symbol 'err'.
Fixed by 6a605eb1d71ea8cec50bdf7151c772c599a5fb70 commit.

>drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h:735 otx2_mbox_all=
oc_msg_npc_get_secret_key() warn: struct type mismatch 'mbox_msghdr vs npc_=
get_secret_key_req'
I don't see any issue in the code.=20

>drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c:191 otx2_dmacfl=
t_update() error: 'rsp' dereferencing possible ERR_PTR()
>drivers/net/ethernet/marvell/octeontx2/nic/otx2_dmac_flt.c:60 otx2_dmacflt=
_add_pfmac() error: 'rsp' dereferencing possible ERR_PTR()
Fixed. Will post new patch.



    1965                 }
    1966=20
    1967                 err =3D npc_install_mcam_drop_rule(rvu, *drop_mcam=
_idx,
    1968                                                  &table->counter_i=
dx[*drop_mcam_idx],
    1969                                                  chan_val, chan_ma=
sk,
    1970                                                  exact_val, exact_=
mask,
    1971                                                  bcast_mcast_val, =
bcast_mcast_mask);
    1972                 if (err) {
    1973                         dev_err(rvu->dev,
    1974                                 "failed to configure drop rule (cg=
x=3D%d lmac=3D%d)\n",
    1975                                 cgx_id, lmac_id);
    1976                         return err;
    1977                 }
    1978=20
    1979                 (*drop_mcam_idx)++;
    1980         }
    1981=20
    1982         dev_info(rvu->dev, "initialized exact match table successf=
ully\n");
    1983         return 0;
    1984 }

regards,
dan carpenter
