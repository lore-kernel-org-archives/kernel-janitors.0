Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B3AC46467
	for <kernel-janitors@archiver.kernel.org>; Sat,  7 Jan 2023 05:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjAGFZc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 7 Jan 2023 00:25:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjAGFZb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 7 Jan 2023 00:25:31 -0500
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC9D1C12B
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Jan 2023 21:25:29 -0800 (PST)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
        by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3074juDD004711;
        Fri, 6 Jan 2023 21:25:28 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3mxemvbm3y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 06 Jan 2023 21:25:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amjqnWtd3uWU6YyPuGOMHdOS+J5/qhCMPB682PdOcZmS4/N7/l/l3uiZ1fpQBhhCWowzXWzEBp+f3x3hpoxHAxesxX3aKiHNB/7Oo1M4kgWhl5oHF6LIJ/Md/FtqF3GAIOGSWA7CFI+bkMXXpN2PisUMbasFN6w9IawvK6e/yCyV/np+9GRbCwac3rfpsIgHWYDLscHtpjR0PYCQ6dQxnTlD/u/jLLJ1jcOnXMXKufCv29xkhEA1c5q7Q2KEx8IiJarXUg4y9bSuJRJsVuspSvuwZ4J6hGrltnQKdiBZs0c3LlN4g4Bv1oUOF97H2RMgR5HeedCH6cjV3osdoGpeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqxK6wV+17TeFJiW0s9d0bXm+Mkg2oHgSjkE++EUeHk=;
 b=ldAlY83HJ5AS6tucqHCggL+stURLyPyShHKpUZrjhjwtc43BjxZSGlnGvlDBgcstt6KAe9MNhAggE8fXDnHzzIBfAnhpL4oFd7aXdNrFSnE7QOZm6X2MRRrG1CvNRwmrioIUF7kQ/xCrVyvD5IDjlB6C5+2A0YU6XdExCJgqhbykTndJnqNeaEYrryUKiYBQG856uK9SFIb6VdJbEpF9dUVB3MnTJ64MSd5dfEwnmIHqzoapSKab1zRXN4QoWvvzHitkEHQqgDb5sW6mbuoJ/f6MTjmVFtfDPytqtLE9oEx88eXYMV4nPz1/aOGtFC2ad7mvHu7oMAWWvTGuY7SNqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nqxK6wV+17TeFJiW0s9d0bXm+Mkg2oHgSjkE++EUeHk=;
 b=cUI9ZQ9pruKvz2vbs+/rc21gGq5Pppea4/OS0gFcJxa9lbtmcqimbziR77CqiS1i463jOfvlSvV3qb9WazEnAAkdz5DAT46tN97s5PnKg90nISpKFa7BGQCUPkX8B3a+3+sx33tMSf4pnkCK2/J01XOBaQwtmDpVExiJD+oJ7SI=
Received: from DM6PR18MB2602.namprd18.prod.outlook.com (2603:10b6:5:15d::25)
 by IA1PR18MB5424.namprd18.prod.outlook.com (2603:10b6:208:445::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Sat, 7 Jan
 2023 05:25:27 +0000
Received: from DM6PR18MB2602.namprd18.prod.outlook.com
 ([fe80::2712:5400:9a13:a894]) by DM6PR18MB2602.namprd18.prod.outlook.com
 ([fe80::2712:5400:9a13:a894%7]) with mapi id 15.20.5944.019; Sat, 7 Jan 2023
 05:25:26 +0000
From:   Geethasowjanya Akula <gakula@marvell.com>
To:     Dan Carpenter <error27@gmail.com>
CC:     "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [EXT] [bug report] octeontx2-pf: Fix lmtst ID used in aura free
Thread-Topic: [EXT] [bug report] octeontx2-pf: Fix lmtst ID used in aura free
Thread-Index: AQHZIdzkX3Nj6XcJSEuRXorCAWueF66Sa258
Date:   Sat, 7 Jan 2023 05:25:26 +0000
Message-ID: <DM6PR18MB2602E8D341B2349BFB8836D6CDF89@DM6PR18MB2602.namprd18.prod.outlook.com>
References: <Y7gy6qQsFg8GD1x1@kili>
In-Reply-To: <Y7gy6qQsFg8GD1x1@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR18MB2602:EE_|IA1PR18MB5424:EE_
x-ms-office365-filtering-correlation-id: 87ad912a-a5e7-443a-5466-08daf06f9597
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MIKw7uotdziz9lrwqqakGnDZnVerFktQaUZhm0IrtHPioIzf3XgbJdgWYZByMmD7MSxuX7hgUJ8vDoosFBopgGO1wGFRIf6sjO5k3xzXkPDGCITlPy48OaBvcAl0pUVhWLESwZzmS5wocYFbatjecqA6hCGZflJXMe5xXSWuEOF7Cj0gyY+EUHDWxEkQPyJwbKRP925UdVM6NPbeXpPZJZ/qZdS9yWiIPtXJtM+vFD72IFIYQ+nMJyTWF4sp15XFNbe1zoHPdGAKPO0g4fHQqGz2ezazfoRFgc2EyMfL3cNsWfsTeHMTX3dHMQdyrLQlxK4v8fDmWkTxguX1BxN8doBYx5DZ44V8GCHbz/Hmk+ASOqjXT02v1u+q4TuttClNCsvpOZPLZK18N7Wk5XMycQioJSU6PMeQnboF709VqbOIYA74+ThvDEtlMCIId1MBfI9mMytu8SUwdxiCg0vIWXjMPQSrSptH4Enbcxs7GQ1TL0tCBeTQw5iA3xrYBitp8J3F5ZjXZI8O8awMbwHmenTkjZ9GNHrSr4s3p8yj+OLgT5P0nM4qaZrWlT1h7HYusMSifkh3BoWHVv3BIykjLxusXxEWUz0SQ6lJyq22qumajN5zmKz4Tp2i+CFFi1Lux4/GCMs0J7j5snaBMzBKkJQ5/EdVCvTv8sSEHKItXcXyY70SDBei9daJ4gypKGlZzs6QxDdHD2PHB8pUTtlRRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR18MB2602.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199015)(26005)(66946007)(186003)(91956017)(71200400001)(9686003)(478600001)(66446008)(4326008)(66556008)(66476007)(64756008)(316002)(6916009)(76116006)(41300700001)(83380400001)(8676002)(8936002)(52536014)(5660300002)(6506007)(2906002)(38100700002)(33656002)(55016003)(122000001)(38070700005)(86362001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FxzUyz7BPQ4m7sytEgZ3cXdBjk55HRB/6Ho9xWdhyouISpfkuae+1g+YXK?=
 =?iso-8859-1?Q?Ey9XtSxJe+a0gwY8SbjiQfu1aYGU8RtCtSx2Uly0TNN98LeFmFI6ofVHpP?=
 =?iso-8859-1?Q?0w8+yf8qyKCDKoHu758e06h1UOD0YFHmGKoDTZkOX/3oUm2JZO6pgrKODM?=
 =?iso-8859-1?Q?zsWNYUsrSDfokOd8LEWrsucW21dCNTV1btZccNqn1IBcAyRtEz/9WBIisq?=
 =?iso-8859-1?Q?pSX14Ro1huQPwQckuKXvHwI/mDWjMrx92XJddZybBQqFH2azaTfOb2pCkc?=
 =?iso-8859-1?Q?YcMibpIbZ8AdpRd+PmVSM4PF50+Cg7n9d7FIqFfLEviZfn2BHoszIJlaK3?=
 =?iso-8859-1?Q?kGTbv5d9q+2JDMsyiQyZj6OTXC6gsXOn5SvWqCiPXQyG8TAP/lL3qzbCCL?=
 =?iso-8859-1?Q?v3StIfKaPfCMgqlO35sNmia1Rm5CZ/YWZzJ/6zcqO3tcSjoUrBwRkaojnQ?=
 =?iso-8859-1?Q?Z3oCvP9J9P+4fJFBZI71NnaF24VvN17xfDVwRNWrC9Gl5oBAFPIEJc75Kw?=
 =?iso-8859-1?Q?jIh2wE+qPENEgzX2xCbB247t/oOU/ylyI5TyCIZH5wTu2h/HoDtHmYrjI9?=
 =?iso-8859-1?Q?Ovb5wI+EdJnJH1cCG7FSfcSoYvg9KbAQYTzee3NcsIJ7UJcxxOw4Z9WApP?=
 =?iso-8859-1?Q?oLCAHV8v0OGP/0ZjVcf5MRhpUUfxucrgTBnabF0lAnQVhAjEWtD0DI4s0D?=
 =?iso-8859-1?Q?fnFGPcx/v39FQGZF1uj0GoXGwR674RuKPt8JLQiBi+HSMlZ+HKTuozPhfp?=
 =?iso-8859-1?Q?qWLmsFWvkm5LwPYBBT34lSGeEihQQEbuLoNxMGHgP8jXbvlXfCnEKznOuD?=
 =?iso-8859-1?Q?9AP4ROw5q4s2264gslrHN6CGY8WMsbs+Uux3hjJE/kTiMjEJkl8N9KW5wA?=
 =?iso-8859-1?Q?Y7rjJfDApOhnOhovHW/prHmISaNL39L4tb/v7dMFxCQ12iggiQKyp9PVnj?=
 =?iso-8859-1?Q?kPF1vNOAZZkh/1bPPvYUhDfq4zeOEFpUdTdJAS3ful8XOBAeIdnxgW9G+7?=
 =?iso-8859-1?Q?TW5ZqKEtzagQs6VVisRDzX2TTkacd38whi0wsz/dZzHNLPVWzegzbl6oA/?=
 =?iso-8859-1?Q?6ybasLVQtewXQrz10PgyJ8tSxsupZxn/4Ub+0blxiRG+JZygym6DhE+ZqD?=
 =?iso-8859-1?Q?ZidJFo4qdogFojStn4Zvc9jxZtAi3tXGNR/pQW/9O8+BvyUrhoTgs6yoH4?=
 =?iso-8859-1?Q?ITEJDokdR1rGjkxXXhJmSI3fq7z7e4I2rxOlA5pXxXGKh0k4DpoymVZmUT?=
 =?iso-8859-1?Q?I5Vut8kENb3MAtu3JAWD6wB0yEhxWPuy4C9mgIigIFX3d400zdjt48zroT?=
 =?iso-8859-1?Q?YgNDqpKZYyHd1GrFb19qjtNe/8dkiS5FI08mdJ2BvdxIziIh8+rqIEH7/S?=
 =?iso-8859-1?Q?pyldUT1Hq7p2JzVcgdkYYCtKiAB+Ie8uCW1/1atNO+Yt2V3x9ofQNXd5ck?=
 =?iso-8859-1?Q?mKKPgXjSemdnFdiJhBAsJKkyPMYwthkfDvUqhsfdbnW7rkDsRTb4gMX/Ed?=
 =?iso-8859-1?Q?mSFjTeCt7vO9jjGwAmvtPQ9a6tYtRJalkb74jPRrduvL9/4e1UwF7ZMsxU?=
 =?iso-8859-1?Q?9ybnkrfzwuYTe76lAApzkQxvVnxaER/Qy5zppNn+f5z3T3hX/Tj9JKK3tP?=
 =?iso-8859-1?Q?dO5nqkV1GatdQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR18MB2602.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ad912a-a5e7-443a-5466-08daf06f9597
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2023 05:25:26.7636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RiV6KAO8p7lZvH0zoxFOR0ABihTH6B2VxMFyVz+L5NnngfyARl/bPnImQxdmt7E3xzlixKPVlAuzVMZopI9Nhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR18MB5424
X-Proofpoint-GUID: Z6P8Z2LYBfy4BxDMaj6yzxxYPTzJ4RMH
X-Proofpoint-ORIG-GUID: Z6P8Z2LYBfy4BxDMaj6yzxxYPTzJ4RMH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_14,2023-01-06_01,2022-06-22_01
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

=0A=
________________________________________=0A=
>From: Dan Carpenter <error27@gmail.com>=0A=
>Sent: Friday, January 6, 2023 8:10 PM=0A=
>To: Geethasowjanya Akula=0A=
>Cc: kernel-janitors@vger.kernel.org=0A=
>Subject: [EXT] [bug report] octeontx2-pf: Fix lmtst ID used in >aura free=
=0A=
=0A=
>External Email=0A=
=0A=
----------------------------------------------------------------------=0A=
>Hello Geetha sowjanya,=0A=
=0A=
>The patch 4af1b64f80fb: "octeontx2-pf: Fix lmtst ID used in aura=0A=
>free" from Jan 3, 2023, leads to the following Smatch static >checker=0A=
>warning:=0A=
=0A=
Thanks, Dan for reporting. Will submit the patch.=0A=
        >drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:138>1 otx=
2_sq_aura_pool_init()=0A=
        warn: sleeping in atomic context=0A=
=0A=
>drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c=0A=
>   1368         /* Flush accumulated messages */=0A=
>  1369         err =3D otx2_sync_mbox_msg(&pfvf->mbox);=0A=
>    1370         if (err)=0A=
>    1371                 goto fail;=0A=
>    1372=0A=
>   1373         get_cpu();=0A=
                 ^^^^^^^^^=0A=
>This new get_cpu() disables preemption.=0A=
=0A=
=0A=
>    1374         /* Allocate pointers and free them to aura/pool */=0A=
>   1375         for (qidx =3D 0; qidx < hw->tot_tx_queues; qidx++) {=0A=
>   1376                 pool_id =3D otx2_get_pool_idx(pfvf, AURA_NIX_SQ, q=
idx);=0A=
>    1377                 pool =3D &pfvf->qset.pool[pool_id];=0A=
>    1378=0A=
>    1379                 sq =3D &qset->sq[qidx];=0A=
>    1380                 sq->sqb_count =3D 0;=0A=
>--> 1381                 sq->sqb_ptrs =3D kcalloc(num_sqbs, sizeof(*sq->sq=
b_ptrs), GFP_KERNEL);=0A=
                                                                           =
      >^^^^^^^^^^=0A=
>Change this to GFP_ATOMIC?=0A=
>=0A=
>    1382                 if (!sq->sqb_ptrs) {=0A=
>    1383                         err =3D -ENOMEM;=0A=
>    1384                         goto err_mem;=0A=
>    1385                 }=0A=
>    1386=0A=
>    1387                 for (ptr =3D 0; ptr < num_sqbs; ptr++) {=0A=
>    1388                         err =3D otx2_alloc_rbuf(pfvf, pool, &bufp=
tr);=0A=
>    1389                         if (err)=0A=
>    1390                                 goto err_mem;=0A=
>    1391                         pfvf->hw_ops->aura_freeptr(pfvf, pool_id,=
 bufptr);=0A=
>    1392                         sq->sqb_ptrs[sq->sqb_count++] =3D (u64)bu=
fptr;=0A=
 >   1393                 }=0A=
 >   1394         }=0A=
 >  1395=0A=
 >   1396 err_mem:=0A=
 >   1397         put_cpu();=0A=
 >   1398         return err ? -ENOMEM : 0;=0A=
 >   1399=0A=
 >   1400 fail:=0A=
 >   1401         otx2_mbox_reset(&pfvf->mbox.mbox, 0);=0A=
 >   1402         otx2_aura_pool_free(pfvf);=0A=
  >  1403         return err;=0A=
  >  1404 }=0A=
=0A=
>regards,=0A=
>dan carpenter=0A=
=0A=
Thanks,=0A=
Geetha.=
