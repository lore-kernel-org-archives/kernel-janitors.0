Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6803C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Dec 2021 09:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351567AbhLCJxf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Dec 2021 04:53:35 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47324 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232991AbhLCJxf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Dec 2021 04:53:35 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B38iSd8025636;
        Fri, 3 Dec 2021 09:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=u5SWCGuhW7gSgRwGAANW8slKDczm4oCr0DuEGkBFqqo=;
 b=NGP7c/YKYZA85A1xvJAwXnyjPyt2lJbHIgIWWoM4KP5vXhVydO5VMkc7AF4/WRYaRwgv
 dG6pCJeYvLIOov4eugEKuvsWvoPr0i/OkJjBwwH8abk+FUPfz0W3+dSkQqDvPAHG49hX
 PVeM0GnMcYdnEbxKFRJjohOCs8V5ymlEMRNQWP5uRiUy2Eoip6Jtdv4JKgyw2iO0wKNa
 BYMyJ23Mpg9Z2kGkY4rDHoqTOm+QtR9rSsElI5qLsGVlVXv5cY4WCHBe0gWtt+tF6InF
 owci8dKH9879ZG0TMp8zyx3yUVDVjS6ucWBR65rVRQBWPX7zOD5WAs+NYdrQHTmDxzC7 Vg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cpasyw4q3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 Dec 2021 09:50:08 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B39kwhZ065385;
        Fri, 3 Dec 2021 09:50:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
        by userp3030.oracle.com with ESMTP id 3ck9t5w5jj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 03 Dec 2021 09:50:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncWU62zzC854xhHNKjA9+shNJruiWfIYFOL3lS81UDaeBdShjaePGLrHhVl4cFOPprgcFuseUYGMv3QC6/VR3pW47/N/rLdLdkfBuSuOgotDPqyFqeZtLWzEpQazEAtNKN4xl4GkqqSAYAZlaZfoPHJfVQJdJ3KykX8A4OGoxWsbFIoq+Dc70sKiQbWiN1TQErI9yuWR4HhbW0/afU4lhEmjWKLZTK9sGnh91sj/CXCS3Lqu1wPyspwnUsE4j8AwUYlh/nzjsUlE8n3cU0HgggWA/54LT6U4oCR3l+tdR7oB0ZMJ1W65hFOcym8jZa1z/kCQygOfmFBta5+tQY2kUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5SWCGuhW7gSgRwGAANW8slKDczm4oCr0DuEGkBFqqo=;
 b=hki7chp0ZqkSOXq9x3qNG6JKvTMrvLz+cAC18q3VQWpzLA2RvpcqsToeyFg02cpbCSqR1h+Ezzxnxbsad+6ty18sPlMvRcYLP+LtF1dAbJmTFsZzZwgFplR3Ko/E2bCUxVYtYNGa1CQu8IiJ3z+GdNitkDA50xrMk6LI6LVeVD3HN+7427DyyhSCY35RDEtKcN6w0jfb1liQArZzGXCJoFLG73r5drP3UHHdDxDWMJp1uutusbLR1NRwwEuDm5ACS4bwMbqP/y3Z8EXXs7WAdiazVRLgV2pwvjqsPQpEx2yF0LPSsKMyDnCNBoQLYtrtFaQQw24XU6dr96sjEmBugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5SWCGuhW7gSgRwGAANW8slKDczm4oCr0DuEGkBFqqo=;
 b=n0LhhihXnnU4g0BUg2c4aV2XaMavNEQ3W0tuJC4raU1BL26IX2owVlbNKA2mq+saSuADkxAMhskeB4fUHQHnCTsjVLGESvrOLnfD4bKhXgJic+NNiseELGq5fPGOKOfL9FadxL5UFdy9cc5/vhWRV+5MyNJJ2GaZ3BuKlFTX+cA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1902.namprd10.prod.outlook.com
 (2603:10b6:300:10d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 09:50:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.027; Fri, 3 Dec 2021
 09:50:04 +0000
Date:   Fri, 3 Dec 2021 12:49:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     David Howells <dhowells@redhat.com>
Cc:     linux-cachefs@redhat.com, kernel-janitors@vger.kernel.org
Subject: [PATCH] fscache, cachefiles: fix some tracing output
Message-ID: <20211203094950.GA2480@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0180.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0180.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:45::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 09:49:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 298f7aba-157d-494c-e570-08d9b64247a3
X-MS-TrafficTypeDiagnostic: MWHPR10MB1902:
X-Microsoft-Antispam-PRVS: <MWHPR10MB19028BE2D9B49164494AE86F8E6A9@MWHPR10MB1902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:88;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TQGlG2koQHXipyXf9dDWs2Vqo0D9Huy+ktB7EXj+eemE5UlJYch6VVXbcvG2Kykku8VNwaQP1jNJNAD4Of+ZR7l/rrV0hi9GCVC+NmQ+y0cSGL3KilXsXfD+PY47hKGZJOGoqExGMB2JFQQGhhXKtKeyhHgTTtQ07DcBmZD/M5URST16K4BHLVuw/btOVaxSn+7xZL7w4aWJMVPMVP8QdoJw0YbyfW8cMDvHevbmQvLgde5Y7hQngFJhGjx4ciLMRexURZWyzNZKXARGSro3NJDbL67mzoEMqkEq60in6Fy6o9aDIxeBBuT13Kl1n6n3Ad2yfFwp2sIav80ZeTnnDLD/MUn/ppFn/GKLwXXIwOxEgP8okQx/v98Akl8HWpReTUp9uMqNzu1m01nGmIeMvkkSLYvgIeitAOoyiR4DEjmdrDWtpIwjUMPi/LRY4CG7rPxaxgSolbm1Ikm7Um+3bW3zPGsXjvDnSVytXDB8TRZTVE94Z08CERDiBKc7woV3fDblvjUqbP07DQKHR7/0hpzXcdjCChGBu/t+Hhlms/RRCSDzQE8VqtgMQl1IKPmV7PtkatfXlockvSEddaKpeOW75iv5/zTa2IJc0lUFgoiiUo43Nqvc7JzGA383+WWyit3j+LOYODxOYYbHsqeCWH1uYPzHPMRe4VMZ1pEKdPFPH878gzG5Y3t5NzpGS9JCu2aNI0f4j1sun/7OUMrK/0hmXOqKDHrTZ9TBtjBeIH/CUpCygXCxWw052W/2VW9C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33716001)(8936002)(9686003)(956004)(66556008)(33656002)(86362001)(9576002)(8676002)(52116002)(6496006)(6916009)(1076003)(55016003)(66946007)(26005)(186003)(83380400001)(6666004)(5660300002)(44832011)(2906002)(508600001)(4326008)(66476007)(38350700002)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TLVt/ZtpJNn+xPRiLQ2wdL52OZ9VyfJjsM8mcdMm6y+PK1PIDZtEbdaIdD5p?=
 =?us-ascii?Q?i8kE5sjAm59MhypJo4tGipiIp2Mpz9NR0sWxvgOB2HvmnxPDZQFmB7DJ26WN?=
 =?us-ascii?Q?E+Mnl976jms4/p0z4t/0LQRMkHh7YTlhdjLM8ybuDxlODo907fx9oRghsG7O?=
 =?us-ascii?Q?wD667zMHZ51LvOn87AFHPtjqmI0VQdaErUxWli5IG9VM4eCSZS3tQ7lKPRNU?=
 =?us-ascii?Q?/hkEGJ9TS9bUZgXL2IxNYR9S6dzSeTNGeIrGsStA27hxA4ULNgAFipgmAEWg?=
 =?us-ascii?Q?5zvc4p6jogu0Q5cNowM7+ghyotIvpmxqkbEXP7v+EGiEo8EtFaXeYo4/VuBl?=
 =?us-ascii?Q?EOVBZcgl7JFXsEgnxjj2pFnDJtHMt+4G8ROZEe/GycR+amBRAxm0UBaVx7et?=
 =?us-ascii?Q?aTvF5ceboSdv2QuBEFTmL2o9pNMN5xurbgNT7BT1lK9Yuhz0aYzE4woR9RRw?=
 =?us-ascii?Q?e2X0iyvfB7c87WiXhFeiP7k5jzXtytjI9L6xc7Nmgg4LwHZmadGyYf+u8lpY?=
 =?us-ascii?Q?kpsoIUKbgFDxB2jxZm3HWd1oKHFSUhssRLJ3tBGXwop0HxkDaHbs/C/Zxy7s?=
 =?us-ascii?Q?ZXTWZxv8hF8rqjvxSEo2xRw2ijoQtL+YhCXOlvVUtB21V48ZeiqCjBfuGe5t?=
 =?us-ascii?Q?eKEGURiEoHqGLZRqsYqy7RdehzeX3V+sMnGgjOwDxW5tWfo+Yp7+/75giPM+?=
 =?us-ascii?Q?cqpty23oQIkCWLA6Ppua+cA2MjLJF3NA2NRaemhbhaAkA0MrAfs4GzYcHGw8?=
 =?us-ascii?Q?zFQd045u5KGdAlnwDzIxISuMXrC4W7ugYYOtJBrcNILMmBo0QXi72oiBy/sG?=
 =?us-ascii?Q?eN0nBxTemXBs2hEDe9oGevFOiORszMcI+3TZPPCrisIR1ejuzK2s8yi/czKT?=
 =?us-ascii?Q?5xhqH7cXw7PexX9jl2ZOGe/3S2XEYQR27oflBxg/34lkisQdEWiFdmj9HQsz?=
 =?us-ascii?Q?aBDbyiP+KDSI0xgDCYegxuiX/V/B1aTkxOVS0WeAW3tl6g2sB79c/9Ji6iTZ?=
 =?us-ascii?Q?ZJfZ1fqjmlFhHq+WY4seP973gnAEMR4uHcXHMsWjlJjDC0i2P/86g7hQPSyP?=
 =?us-ascii?Q?bI2YuAM9AxeGrAsFS/9KDjqFixTsvrK1j0WBVgXYPyWkYo4qXn9G13f3AdTU?=
 =?us-ascii?Q?b0M0WzLKbX7b8a0/PTywqMcBK0JF2wL5hfa6TP2BbCHN8Agjg87tkdC0aNbY?=
 =?us-ascii?Q?ybMKbNtKOqS81UXWud3tXnCz6hG2Y2ggHb680Mk2AbnGXIY8dXD0HpGm9Nk5?=
 =?us-ascii?Q?tUk7h2zscWEx4xNA3Pn5er5/GV277tTJEdKfzDdS+KVhspCupChqQFrO42ow?=
 =?us-ascii?Q?ggCYYoGtEkxDmw8ubCTq/mAnTgayepcblsNu8lbnRdE13BdKNuusWNEaz9Ha?=
 =?us-ascii?Q?ZwuYI7tsntMMZKzZkttH219Rc5RNULL5/x3vVA+93HsvncMapAlo0uuBV7QF?=
 =?us-ascii?Q?nWKiR3Rnq/YZC0nlDHGvlGUJ4UOYrWZup9RnLNaAsaUTEsfBon0nrCt9srDN?=
 =?us-ascii?Q?ddHkGqf8DDAYoMSHTzmToR0tZlzgA2yDKlJiRoicyyjnXCikm4KTAXx76edI?=
 =?us-ascii?Q?Ai+Pz9lkTZvyRbsFFkh6Suk3P8ToqNBRajv+/UqyjIbwtv9DzQ0Tvll3b3R5?=
 =?us-ascii?Q?n2O5bYxzgb5Hrysa7aNgRPldV3AA6mZIOmCtDIhrtzomXyB2hrzAJt+QaCG0?=
 =?us-ascii?Q?h4v6QQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298f7aba-157d-494c-e570-08d9b64247a3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:50:04.1692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6F7iCp7l2CuUKra5qtcx+VVUh3HKMZ3AVDuV2SDNdP2GZYgBmNpA9gzxir07dcKoQzNx6ZfP2Elhh++KpMSzoSFAFu+2QF6D+ahmaFXRac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1902
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10186 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112030061
X-Proofpoint-GUID: IB012PR0pfew7rxE1idhD1NUKW1Rf-Eg
X-Proofpoint-ORIG-GUID: IB012PR0pfew7rxE1idhD1NUKW1Rf-Eg
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These are cut and paste bugs.  It is using the wrong error codes.

Fixes: 5cc1b2a78318 ("cachefiles: Implement backing file wrangling")
Fixes: e19b617e438a ("cachefiles: Implement culling daemon commands")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cachefiles/namei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index a651da35dcd0..a2f895f45c25 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -390,7 +390,7 @@ int cachefiles_bury_object(struct cachefiles_cache *cache,
 			ret = vfs_rename(&rd);
 		if (ret != 0)
 			trace_cachefiles_vfs_error(object, d_inode(dir),
-						   PTR_ERR(grave),
+						   ret,
 						   cachefiles_trace_rename_error);
 		if (ret != 0 && ret != -ENOMEM)
 			cachefiles_io_error(cache,
@@ -702,7 +702,7 @@ bool cachefiles_commit_tmpfile(struct cachefiles_cache *cache,
 		ret = vfs_link(object->file->f_path.dentry, &init_user_ns,
 			       d_inode(fan), dentry, NULL);
 	if (ret < 0) {
-		trace_cachefiles_vfs_error(object, d_inode(fan), PTR_ERR(dentry),
+		trace_cachefiles_vfs_error(object, d_inode(fan), ret,
 					   cachefiles_trace_link_error);
 		_debug("link fail %d", ret);
 	} else {
-- 
2.20.1

