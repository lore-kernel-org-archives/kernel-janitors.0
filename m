Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE30C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Dec 2021 09:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379678AbhLCJ7v (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Dec 2021 04:59:51 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8316 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232991AbhLCJ7u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Dec 2021 04:59:50 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B38iE3Y007683;
        Fri, 3 Dec 2021 09:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=r4yrlaJ5E73F3hB0Q94JX+0/XsBEGLPyz5hv9+/VKgc=;
 b=UJFCwHEyM7dkZMhtf6i8PJeUXIeas8fYqQv8de87HzffJx9YK6bdTBg/swwGlYZd5BRQ
 GYGju2Z9tOgAwkDUjoX8hY1F1NIbLClgjqKTvqihtb8ZN9Uu0zwZflvuHj+cZZFWpvKR
 ZTalDbSbgnFm7zwvLNO3QqRPPM7stKEpKgI2WAwD2NG7snAjjXCawUxVlM69Jq/iWENT
 BnMaviH8gIA+uTxZJqVGuPeiGOBr24wq38uEMNBPCB5pow9WD7SewkjQS0d4RHSunSKg
 a/lmILg0txaRjeL4fF4ZcoOKE6Sgn45//QXxLXWHnrkLIpxg+Gnh1RIRW8XjkFCPjm1G Kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cp9gkxmk7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 Dec 2021 09:56:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B39tmvk182155;
        Fri, 3 Dec 2021 09:56:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by aserp3030.oracle.com with ESMTP id 3ckaqm1v4e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 Dec 2021 09:56:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiBZk739JcXNY4c0yEh4XKBJeSl/2H17FaZfl0NrUiClLfHeOuhverTHSwY4zCbWqVKLZwQdaQtzF8SUdQ9RS0JICvGDT+F9dF+aHbpAxf5VNPj7eIGof4ltRiAkC9KhOc8kkIcalI0iqH9A3Zqslb3PR0isCxnXZy4wdBW+p7mhsS2BtGZgltNfATpBJCn57j5tjeEHDSyut0MtplqkJTTxUkP3hWozgFauu3pSdZdncVQVXqfh1LOt24Z8t9b1JpUh1WeSG9xDtlYbZdU42GTh0fTtRHl9B1OMitJFr9cXQrPoLNTB1q1S/ZavPhQUUcSBYEtx0DRsJjGRJdLwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4yrlaJ5E73F3hB0Q94JX+0/XsBEGLPyz5hv9+/VKgc=;
 b=FG4BK4Zi0UGXXMt47xdy0XfWdljo+fAvZsc6rfxqTcqAP1lUtZ/MRFTbgDd78zF+jXfFwsxULsu+Tr1rWTrfwtWkxOWLkCb6DVotawH+3FhSoXYvj7sHe6ZKEaFD/ftJ4AeSW8fTBSX/krdelrzgI+gYoUMmlhL+ly6DFV2Xhl6SpvJAFUczYek5gmpLMp3waFHqfW4IdlBeiX0dhIKmX+K6UFHwCzy6lcGda+4I8B4HIlFKfbuMu4LDgTyQsr1zHwwmMuZyrjPNz2+hPAWwgh5ZkWiZCs+6PlsTrPVIRxm9lkN0JgIC0YUtTiFlmIQL+nMEGMC+rUqAmX4Rou864A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4yrlaJ5E73F3hB0Q94JX+0/XsBEGLPyz5hv9+/VKgc=;
 b=eDYmdJwpV46Hm58JQgNFm+a3H+CqMb/4ZwUtxsimoeS/KTejKko9Ii0l5ehoOJBJaPjApD/mltIoUHCpyxMoutZtEyUUHl092TQU9TLdpu9wIC6P8GqsXUl80Efyxjxp9UbZHs4GclrDfghlRbcol+cafISAPAU1I/QSCAEQbSk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5677.namprd10.prod.outlook.com
 (2603:10b6:303:18b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 09:56:21 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.027; Fri, 3 Dec 2021
 09:56:21 +0000
Date:   Fri, 3 Dec 2021 12:56:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     David Howells <dhowells@redhat.com>
Cc:     linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org
Subject: [PATCH] fscache: Fix a NULL vs IS_ERR() bug in fscache_alloc_volume()
Message-ID: <20211203095608.GC2480@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM5PR1001CA0043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by AM5PR1001CA0043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 09:56:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b5f16bd-7e64-4254-41d1-08d9b6432860
X-MS-TrafficTypeDiagnostic: MW4PR10MB5677:
X-Microsoft-Antispam-PRVS: <MW4PR10MB567743C01768621A9E17A9F38E6A9@MW4PR10MB5677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wi9llfniW0QB+U5F0Eat46GTDxd2blbES6XTgVqitHVKphqrZvf9zBfRuCvcAa1mnXlbEv0mO8+8ArQtUsp2tuhjsT207qxv1WxnHGBx1U8bWroYrO2ycMCF9pgdVbeM2LsRq6Jx+e5RR4eGzvqcrcvOgi8WQfyE0n90aNy9BQ/omorH8QeCtMLCSoahSMf37msW2WbAFnjIXUEinP8ymLHA6m9ZZHAldRZ8SznoNNVcvRJswWFBL7XAcKGQ2/SEmCTH+l1rBUpC5hQZkkpIDX/EOU/27SycCFYAXPiNOtAY56KgBFddeyfH4uhuBSeU1c+WPejWXbMza+SHUgqQcbM3xDLdFIVnqAPbtev7zJID2K4UP5nzGYaB71G15nTwllmH2G80O+zALUgA+OGhlyCFM7gMCBVAJhGTpbB0uwRT84WTR8Q1/xMoojoQhW3jg699lAUUZG2ShOPU49282xwjEi+PKQglgEB8szxICBwpv4EixQ1lQCf5JHwtqM+SwZ4p4WewHfQb/EiEmq2bDu84kwKj+WTnZ7jLhrVgVY9QsamfocyYqlHe5wsFPQdB+WVjvNDaAf0Vlf2iKQXPenqV2f2kR15v8LmrJjFjs199ButwVaNDIoFL1PVVh8BE+mpFp2wXwjmf4Lt/z61RgfRi/S/3bSaIvGZmQYAJslWqSv/cH6dnydzawAgebyRETxw/68mxVpSFeSzyoU1JIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(44832011)(33716001)(33656002)(38100700002)(186003)(38350700002)(2906002)(5660300002)(66476007)(83380400001)(1076003)(316002)(6496006)(956004)(6916009)(8676002)(26005)(86362001)(9686003)(4744005)(508600001)(6666004)(52116002)(9576002)(66946007)(8936002)(4326008)(66556008)(55016003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1XIKeEPohe7gJLh94QivwmB6mf0cpGE8Pq6aLoxB7CMuwGhklpZwAcPWZ1Uh?=
 =?us-ascii?Q?qXrq/xg2VXgrwZHuQLwsXJlz2W58d8g3NNcBgOwMvRxSy8gOG1831HRIL+P4?=
 =?us-ascii?Q?kjbmivIB3lIef3WhqiAfzIbaVbPv28a3DuYY4o4b4q3vKKX/tKqZed93NMFn?=
 =?us-ascii?Q?PPBrn6W2kVQNz7KUlrYMyWfjLk3lv00SO2LrdIvur31GiWxVkvG8S0a5KwDz?=
 =?us-ascii?Q?0awcSIF5XvFeiXpqoj2XTPVbem8EpppNhhO/yB6Ws/VqBQcrSG9SZLRKHjrV?=
 =?us-ascii?Q?73CZiFQHTY19VNLtmsLf3Znbdv/tQytEaG8pmcrg1WPnsueL4YjVa1j115uA?=
 =?us-ascii?Q?+L2v8icUtAA70RdqAKJ3Odgi9FUodRWTsQ5b39jDDW4x5IGxzxopI4sJZs3L?=
 =?us-ascii?Q?ljryfBogpRF4IpVIarYIKkqUfW2sdqfNPKBaZt7aHioWpD1ASLv4sPEDLccr?=
 =?us-ascii?Q?Bpgp7uZwIXOm8dvy9OqqSrsT/t6/22+qUvpnBq3tn7eo0iz3i4gXLqBuRur+?=
 =?us-ascii?Q?vEFxoD8k5eI1IgXHG46Rz2HHVcJMmB+y1IMz9G6U3hbm5YpEwCjbkl4G97H5?=
 =?us-ascii?Q?CJKRAYhchlPtSN0zyJK609obA33OvqYg1p8D1/eqCvMH/2Jm5CXV9M82mOJK?=
 =?us-ascii?Q?WdiTlpNCJo/ZI0ogSYL1j3+bA4BqY0QoQAcugYEYBsn4xVKu8xTVuebbMPWQ?=
 =?us-ascii?Q?vdJCxfNTFWMdo2os9THUtqEsSicrBi8E7vQapRO5G7xk2aNbXMm6vgWI/Kr7?=
 =?us-ascii?Q?joSaK9WefHgvwJCisP6A6uSThQmVTiAh4EJZcgQ39albq7XdvfjDwj0ReJ16?=
 =?us-ascii?Q?LVBJyBRC84qqIuvMLkKeoZTg42z4WKyjRLygqVyXqyuqBrXyf36Hi/zuPIFd?=
 =?us-ascii?Q?mLpHP8BjAT6lAcf4T8dRXS9OBBxxBkVdp50+izgwvwUYurTtzyq+CbhE11dD?=
 =?us-ascii?Q?2/iQwyrdeDGaRkgg8tIwvMkjcEMp1D79AVgBAdnMOebqQj5/bKHLg0wYj/OS?=
 =?us-ascii?Q?ZkNlnJVpo0CsNZr19fpDrAjnP9E8xooRgD8VN3tqfCFjjoeM7Ap2O6OeWF1L?=
 =?us-ascii?Q?YF2yaWfHeptj0kP1JrDDrYXzRqpWJu/dj1x2QleroeUGA0kPTsLDFqLvUNCz?=
 =?us-ascii?Q?xoTRr4nRHNCWk/0pGhga/1+z4FIXHbDOCCNNtajty2KUhZUuyJ/eeQm+zhYM?=
 =?us-ascii?Q?DJbmZo5QPHfdat076RHm266zPgbzqLzXnuQtKN2u0NOUdUxJA0fewi7sF6sX?=
 =?us-ascii?Q?GkmuMdPuSYo5IDAe70HjObDfrkxeA0nHQ/t+xwa/LCHPvvjTjT2145fFKJV1?=
 =?us-ascii?Q?fWaawiyoLsAVa6owaHawqE/LJ2dHcJL8SAubUGJy9ZWj7vm8aJYudBowh34e?=
 =?us-ascii?Q?3xLb7Z2UjZmN5xUlwiCAxnzwn8irgtRCP7p4onT6KbxbFYveIlhKOicxs0a7?=
 =?us-ascii?Q?oigCSA+IhM1Hicp+jMU+aPcHKHT8eLxNW2l5lxjQ4OO5G8ti8zQR2CK/OEcr?=
 =?us-ascii?Q?TTIo8naIv43R7JOezWmfsAJh9/4eioGK2Quiu3MLvBPnGszN+Yz7KXh1QtnX?=
 =?us-ascii?Q?dMP5hhE6ZRk4i75WOjXb5A65vSJ1A7dnJKVayYHcBTmKxq0l65HYq/Ydo3Hh?=
 =?us-ascii?Q?F5EBpDAUro/lywGXL4UMqAeUQVUvKRRJM/wfNsGfghwKdAONBeU4x+NcTLKm?=
 =?us-ascii?Q?lOiZkLbHUdHiJj6tegRXdr8DtOY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5f16bd-7e64-4254-41d1-08d9b6432860
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:56:20.9944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erQmzPcKDCA4mcoEsIv2lBveXJP52YY8dHt3QjtXiOQeoW7putCYVI20BEDtGCjq+ptBZS0Cs0CFb2Yi5MC1ezupagSNcoTE/BUpjlPO2tw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10186 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112030062
X-Proofpoint-ORIG-GUID: K2y9i6f5_WrSZuDaJZ86jLhrB2pTQlon
X-Proofpoint-GUID: K2y9i6f5_WrSZuDaJZ86jLhrB2pTQlon
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The fscache_lookup_cache() function does not return NULL, it returns
error pointers.

Fixes: 27beaec4d546 ("fscache: Implement volume registration")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/fscache/volume.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
index 4d0c2d43d54f..10f741c2072f 100644
--- a/fs/fscache/volume.c
+++ b/fs/fscache/volume.c
@@ -208,7 +208,7 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	char *key;
 
 	cache = fscache_lookup_cache(cache_name, false);
-	if (!cache)
+	if (IS_ERR(cache))
 		return NULL;
 
 	volume = kzalloc(sizeof(*volume), GFP_KERNEL);
-- 
2.20.1

