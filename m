Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AFEC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Apr 2022 12:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346171AbiD1M3I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Apr 2022 08:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346208AbiD1M27 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Apr 2022 08:28:59 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E274B624C
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Apr 2022 05:25:44 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SAvsXr011286;
        Thu, 28 Apr 2022 12:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=vlVrA7pcHHyk4rAcecdj6ukzDxLyG9ezxe44HFqN5vw=;
 b=hfOWmQGS5y8jEVkCMG5XRfGYP3A9Hu3qrw7MVGBhQ96eV1OPwZAXHREVt0jmXZezYR6+
 6YqbbYQpqjEFjIrKtNB4QCRfZAn6938u0BqHpoIaw+7dvK2o9Uq8bY4FfrnvHRQvXwq3
 WOSr8UrXyb9nEkyBOACE3t7I6wbw87NJWMrbidxUummXG/MyrvIMz/6Cga/u7nfotHfl
 SFGXoDr9r28HAvpBBjkMLMLxBEL2mxThovW7IeEksch3Tu8KCiysn3nsOP22ZTMYT9Le
 Sajn0aClXauM+FvSYVHsjIeYER0cJ++wvburU1ldqn+PGjqfjaqZo5fy/20hPa0mQy5Q iA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4kx00-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Apr 2022 12:25:31 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23SCANHq020395;
        Thu, 28 Apr 2022 12:25:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fm7w6hmuc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Apr 2022 12:25:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C87am2+/dGOFwwtw7oFTJZsNYI0OdNHIYaTvs+QBfzRHcHzHGwy4b4be4HoxuM7h4iMfiN+pjPQtsZDtiuIRYVfy+TWRSswH+WlESb5vMnFX+HaL64fuK1dhO8cVHVJu+McfSH/tuhMKtwQw8e2wBFHAQlzZbOV91mDNM9lnynRw4VioDRNyAZjABmgfMCUGhi+hnQLH6gnFQF332oFh7A6UceuD04X6eENmbt1rICHxeAPPAtWWAU+sYDgwvpPKfgzutdOuE+KvVa6cdhBDtN+7e0U+EyD7Zk1lk2IMH+I/KQMUs57ZXcxElIPUbONfzzq40Dl29E1+lVcdIG1eHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlVrA7pcHHyk4rAcecdj6ukzDxLyG9ezxe44HFqN5vw=;
 b=kD3dVRHlE3Y1fV5nCdmGCbjoE8tuVdrKCtlba4Xhbfc2rmPNdRk4GsiYgaC5Jn8toxRwIY09ZOq+YeBjY53uNVxS1McmV5ewliSf9wRFiqbzVdBnPGOXe0JJNeyF9CMDMCJKlQbEXga8NDUoKgACV9j/3R7FZfKD024ou82vNfzmswYMhihLILvMjMiONLuR+FJ1MqkW1QE5PVrFu/4/a6B/gpgntD7f4JUiFz/ZJWM5b79RsI2PFGEeqf++n9ZmNGorfd6/gG3JzHKtEBfoPzWSJmsWLJDP8GkWxtBVL80WKz4Sby3woadaW67SQtVWudGRIDb7I4S/BtdATKpwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlVrA7pcHHyk4rAcecdj6ukzDxLyG9ezxe44HFqN5vw=;
 b=P+xy9j6b1ypaB+UQPjtnsiV00S3wNHm9gmQzSaNQeBMx0aXGgTUxSHMIgYLjYLjQeSJtpdo6/tBPV05IeiODN1HvyvPeG+s6FynXrdblxuQm7/11rKau2OQj/TWK6D0EgQQfWvMtMN7BveqrEuiDg7U7lbDGb9faJS/uREA4X4E=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN4PR10MB5800.namprd10.prod.outlook.com
 (2603:10b6:806:20f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Thu, 28 Apr
 2022 12:25:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 28 Apr 2022
 12:25:29 +0000
Date:   Thu, 28 Apr 2022 15:25:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/mmap: delete dead code in do_brk_flags()
Message-ID: <YmqHrpo/cBBq6lHf@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0109.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c19e332e-051c-4e1e-da9d-08da29122e27
X-MS-TrafficTypeDiagnostic: SN4PR10MB5800:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB580054F96865849B879391668EFD9@SN4PR10MB5800.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: acBVFrOUw1NWfN20vpaek3UT2/0w5SZoi29cszEb9ViHw+l3P3WFiSJOB0LPnD8wHnJbR/erp/z/vfckwEScfGFLsgm67rR+fw1Dolf2PSbTqey2jb4dMP7w7QowSQ5Pdt3MesMzIm9goqZ6FtksjAUt7GV8KY+P1mJRZCMiVCCmzOeif3x1M6BSkHuxEp+GLjsUGWhszb8R2iWuogBcl51lskmTCCa4Ylf6nb1u26QYCu53HV1tKdUcolOyW8NxxY/aTLW19crhwO6Mj64RRKLTgILr8lr4Oq/ZucgmUmiik2JyDsLjkhuv7tgyODWTupBOFw9xlmuHxEIQqPZAj2FBx25gME8bBUoFJmIcU2ZITd7nKXCLVs/ScXaWvZsoScpbfofK68WsHIFpz8a0SuPDWGUA+1ZCvkKPVYplkfxWe4kEHy5iOJbdQk9v6TMnmYnyA1wYdOnvSk802hNmJMzXqvjFKn3SDN8rtf6M9oJsZXi1Am1gcHqoG2mPwcyqr7Y/VkQJNZoYto60sWuuAaJ56M4AmYcvViWBRmdK4bOBvabjUP+654elEhbymTO4gpVbTdgqQQFrBkIEjV/QzbF03HB4gO9L/UEer8yEW3DbdYCtVaymaiOllUbnp/2LIlryBxq71hy7hEvshvob1X0CPiBsIMh4YoHMMBj/IkRrOyO76EyLYVSbsnRDNalhcGP89sL0BWM+zsXZ6lL6JQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(83380400001)(33716001)(6636002)(110136005)(8936002)(4326008)(316002)(186003)(66946007)(8676002)(66556008)(66476007)(26005)(6486002)(52116002)(4744005)(44832011)(38350700002)(38100700002)(508600001)(2906002)(86362001)(6512007)(9686003)(6506007)(5660300002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DqZ6BKXBMDWDiO7Epf9/KPGw4qnzQqrsJUaRHP0U3RVHpV473VkGqS3Apv/P?=
 =?us-ascii?Q?INwIEl+MYOBFUXFA3sR5qXQM584ghV1ey9xB/3mD+fTt7NHDH1emOGHtST3n?=
 =?us-ascii?Q?K45tuhKTEfSSDJTb+tHPWoXOskA06K7pIMmdFqOErT8yB7cAVX0/PHcR/A+T?=
 =?us-ascii?Q?+l54TkThLkXtwsRy8CPV4+fv9nbC4O9dngktOVLYDKjQJ7MnvYnZ8+wrnBYV?=
 =?us-ascii?Q?KQ1V8B1+gI09NA1eG5/afBtUzjyZFr4IaaBST73cUjQm0tXexjPAoO+AW2kc?=
 =?us-ascii?Q?jwyBSlyoFL9DsMOxOolnDXEJP+EEBFaJO89QwpuhzAZibS6260l7IVoj+vkZ?=
 =?us-ascii?Q?QNL+oi/TZIc5yWuPMSCDHlCbT3hs5cvvEAOabcRYK2k0p+sF7YALpWHvT6st?=
 =?us-ascii?Q?3D1WCzG5EjXv7AkXBIyTWI6C5TxM97WpGxBhM+oLFHwtT64Se1XlunQvxtRo?=
 =?us-ascii?Q?9kPQPcDYx/d3M07CXLIvYW1yZJgEbCgBjCD10rrf3qHG93TFLEmLDmEwPaIh?=
 =?us-ascii?Q?neOzWmwW8JDcaArTuBcG/WgFyw5bRfTV+zoSkAF2XcrFDIrFu5PjEEfB8umS?=
 =?us-ascii?Q?+hyprfmzyAxm4Crl2pnLZmfcz74ru3n71Zi0GE3xRZkv3Pqh9aBClsw8QCK0?=
 =?us-ascii?Q?XOTJh4AqYCzKu3ZmIqek0P+5nM6uzi/cuWuCN9qNy0ab2a7ZOzAtIE1X1Mzv?=
 =?us-ascii?Q?2MZnFPYdIm1tYQjarpt9UQ6Qd9Xz0svmoe8f06TK1+BWbO2/cH5Sdr3GO3UB?=
 =?us-ascii?Q?HD2Re6at2DDAQSgxz3wO9Sc0NhioLDsnCYtgtojqPu8HIHbSIefVHurguuLU?=
 =?us-ascii?Q?LaICKC4d/C84PC4f4IvJOw6WSbKsV7h0FoniCJEDTZDJ+I35XAH0Qu6rMLr+?=
 =?us-ascii?Q?ZS6gvLj+7bE5HQ6QybpW1k4f8kfxSyMSiMl3mbjJwXAPtwoEgB6mPdy915O2?=
 =?us-ascii?Q?vvxmO2tKj1xSzUFtvM1V5X/W6ygvIWB1xdNeaIK3JV1lVgkYCOR4PGwdYIS9?=
 =?us-ascii?Q?0fnz4AMZudeU0+5ErMQQnq/55wQ7Slrgu6e+LE3ZcsoEdgMvVZdXcDx5awfx?=
 =?us-ascii?Q?P66cGsLgC2wJIomKHhHYFUdAInwHOHC+HRWmWBTaNix6raZhVFdTnKBO+25x?=
 =?us-ascii?Q?yZNOl8U58E1X71BGyo0qGYBxKEwOtRlxvoyztGbIS9o5WEAZsh5jFn2ThVpA?=
 =?us-ascii?Q?Cr0j7g67Q1OyO5QMOeXHWCGQxgLfUyFm7kzp946AAu6rOEz9KLiD/q/f1Ge0?=
 =?us-ascii?Q?7AAclMjb6PW25I/7+h72oOyR+F9fAJVJTVeIG4kPsi8OmKlfmY46mmvfkWQr?=
 =?us-ascii?Q?LTrbqyWoypRrhNSM2+/mVc9uMuObQU2bVWNmHU4p1A87w2u/zDrPG8zqJJGM?=
 =?us-ascii?Q?xVGfsBpGTm4RXEdtppVJlOWpjSlZA1dO6Cv8/f/KnLkhaykIXXQK57MR6Prs?=
 =?us-ascii?Q?yzbmfYw/Pja6g/HX4529k5Qlgsy0obf93XpipXAyKTTxL71MpcLzoyX3VWsV?=
 =?us-ascii?Q?F/Jdk7uFwgtFHWxRh4dfZXkpf8LcIFLgkhT57IxGUotyqpr2z43AoE2+vvKD?=
 =?us-ascii?Q?SQ90kH0EJUl8LhPXqKnDTCJMKB7qDgRZKvD4fBitko7WOVBw7Xjvq6C3FDL8?=
 =?us-ascii?Q?U6Iogi9JPh5tcuZFJYjr8AippdkvZ9Cx0oRM3xO1krKWKenk4cUR2AGM/xLa?=
 =?us-ascii?Q?/cZtmEmwPUSl1NFosfrlOxVG++SHnWSVG+D3rAR+n306OvdoMZCE/D+a2e72?=
 =?us-ascii?Q?WW0GJkpmgLm1MCKEabqCwDhWMTImzME=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19e332e-051c-4e1e-da9d-08da29122e27
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 12:25:29.0141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dz6ghZD4S8BlZ3svewnWf9uike/KGUdosZgKsj2yLdlsD0JdB8A4+nvs9kyJEdq4tYGh8InHrSOa4USSMYdsfm0bGbsVgws9Y9oFzf5RSpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5800
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-28_01:2022-04-28,2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280076
X-Proofpoint-GUID: Is46P7RoNrALwGZDp1HzietH0VX3uh9O
X-Proofpoint-ORIG-GUID: Is46P7RoNrALwGZDp1HzietH0VX3uh9O
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code can't be reached.  It's harmless but it leads to a Smatch
warning:

    mm/mmap.c:3040 do_brk_flags() warn: ignoring unreachable code.

Fixes: d2bbe46ab3b9 ("mm/mmap: change do_brk_flags() to expand existing VMA and add do_brk_munmap()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This doesn't fix a bug, but I added a Fixes tag so that it could be
folded in together with the original commit.

 mm/mmap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index b5c8f8c919c3..257858671618 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3037,7 +3037,6 @@ static int do_brk_flags(struct ma_state *mas, struct vm_area_struct *vma,
 	validate_mm(mm);
 	return 0;
 
-	vm_area_free(vma);
 vma_alloc_fail:
 	vm_unacct_memory(len >> PAGE_SHIFT);
 	return -ENOMEM;
-- 
2.35.1

