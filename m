Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A94CC07E96
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jul 2021 14:17:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44DE161178
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jul 2021 14:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhGHOTw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Jul 2021 10:19:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27082 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229592AbhGHOTw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Jul 2021 10:19:52 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 168E2XJ2021519;
        Thu, 8 Jul 2021 14:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=S8hzLvAkNfcu4FrRO6KJDaQDKo9qeixfAosF7S3qgIM=;
 b=ExER/jgyACp3526IpFiGvUdfKzTr5uU0DVKuynqH8WlKTwCSgnc8JUXapRwU6KS0yzZC
 a4Kaid4CM0PtluaE6Bvsd6grYezJMe1czlOPCD/fi0Ud1jP5v4ken2qjrLk1Aa3/HnlN
 DnFDC3wQMP/zl4M5dpyNxuZf6J4Ce8WD5lz7e1Ql6zh9kWtXhF/zdqVWocJxj07xCVFo
 eteejwopI9O9es3sQJrqEyqMZdwFWs0Bk3Ob1O/cyPqqeAIfPV60GL1hmlTTM5MNuVuE
 86ep3d8QV+V61O4zoxVNn8k0doAm99gwwn/7aFnelSW9RezO30jN6x+ry04FDf/MWRj+ sA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39n4yd38tr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Jul 2021 14:16:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 168E0PTD044062;
        Thu, 8 Jul 2021 14:16:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        by aserp3020.oracle.com with ESMTP id 39jfqcuetw-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 08 Jul 2021 14:16:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1dFQzfXCk18JcHRFASN/3koWSqjVISesIYkbYMDD+tORkMBVjZjrPEuOGO6dRbNxMNNGWyPZmJZ9yYCX0oqmAzjpUPCNNkOGqDL2T0Mzao1tPB6R6ddDJbrEwRIVRh6bubupz25xMSHjxsin5MfOAUcU2zk1gwvDNxzgOr2JRDbqBXtX1PBmIrwhN7VU9473fT8DMDvI8jMGeCEO3KFUO/slJmrw4TcaCxHiaqwOdzMHqFXIQ05D/M8ydARFIQliiIbCNHnA7Yu8dJ3bJoSFr/+VLNBO3aHu3ilct/5/CLYZiEQDD6yi4zepYRXfP7vwlMroY6Z15AmyzaL+8T83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8hzLvAkNfcu4FrRO6KJDaQDKo9qeixfAosF7S3qgIM=;
 b=BpgFmumQvKI4WD3iJRjjacx2mzPKJFSKqG7OAeaW5XikIKMQDs0fHlcCHp2K8YppdhTwbQCErUZgo3qUZV7Mrsqb8YaDjdHFak/SUEMJMlLwi1dh8Jj+KpT//jYCfyN44nueUvDTn8JYyBjIx9C63dYXuwkgrTegpf+TcpC/fLfvuVqvTuIttJKMnmpLHiTNQcsiNhUXCUrTFXT9aNGXcX/rPKe6hWIuaTRTjjiSyIXCw0A9Vc6s4P+j4UQNZNWyv9HkRYUDvyzpYCrokpuqLahrEv9Zg14HF8R5vksuCDXDdP3+Smb4x1dbmfLsKtGLisFsUtZxpBGlJ7DMFej7zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8hzLvAkNfcu4FrRO6KJDaQDKo9qeixfAosF7S3qgIM=;
 b=tEx6FNLD84nccx/38q2ozdeJZTTQrIaUJcnKZL00lyxgQcLXmfyqvzkUK0Ikm6y+CjkvGVSK83Sppj/MIp22X0EZhwVx5XunSt4hiuN2egtbsMwEMbma305WCymUUUD2RrSofKTomEuVVDW1T0/cCo6gXyqBB4l5EQcxpN8ySg0=
Authentication-Results: fasheh.com; dkim=none (message not signed)
 header.d=none;fasheh.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4500.namprd10.prod.outlook.com
 (2603:10b6:303:98::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 14:16:43 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.033; Thu, 8 Jul 2021
 14:16:43 +0000
Date:   Thu, 8 Jul 2021 17:16:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Mark Fasheh <mark@fasheh.com>, Larry Chen <lchen@suse.com>
Cc:     Joel Becker <jlbec@evilplan.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>,
        ocfs2-devel@oss.oracle.com, kernel-janitors@vger.kernel.org
Subject: [PATCH] ocfs2: remove an unnecessary condition
Message-ID: <YOcItgIXtisi3MaO@mwanda>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: JNXP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mwanda (102.222.70.252) by JNXP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23 via Frontend Transport; Thu, 8 Jul 2021 14:16:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b0e76bf-ff9d-4a4a-2a45-08d9421b02cc
X-MS-TrafficTypeDiagnostic: CO1PR10MB4500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB45008EE3C02FA0B62CEE40738E199@CO1PR10MB4500.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6U8eGf1iWG4JNuYRGD95Vtb7SoUR1ysTONM8QABR5YeT7eMKbEtlS547FDK8aN7sg1HZ3yuzk30uIfXPEjc9EWbAsmI/uBBMHutagTQtMuMRS1A6a5K9bOtVoOSmJ5ThZuZJxJmkGXvgbscV2PlpbAOqBrlh6IpNUV0kIDRWBasvUsnQXk+5havJ8+vDroMn0TLl+1WG7qP3D2k6iq2pNB/o034m0Oc4OErdURTNnqKy5VJB4o/RE8bKHqp7wqnr3c7CsDIKB53dFZ1PVZiko8msotFbA/R0V0/rR3OWb83mBtaroMfRh81jy7NOv4vd5EgfyfuiDOcn2cwF/LiLUX6nJWCFa2wlUYvVJdiGlt+sd0WShHapCbR+PvNg6IUUnMGC3JFtd6ekBE6jjMkElRi6MNttWNElmqZ4JeS5Eyl6l+rv9CUVycgsuQedwsinfWSFRl3YnI7fGYqGIts5A7n5SDXMXpW8Rb1KScSHx3dsX15gfDF7NZlfUoufrpo2nlECX/jOTkH4Yy0FLGmU8X7JuVNWWB3SFDQvFoFKnmd8lN42UCTEIgNJnvo68MDihQR6hiSPWvHw8y7AcxEbInsMrXVaue6RQzqDYF8tfImXNAv3aPlKfqhQ/nxUNaNoEZ0ztn7dD0T+TiYBqp0dOLC4WTvMbW+Pjm+oP1KDr2Mg1q2emD5u2xM9pnfOGxdNkLJryxHhLCODJhVkZ1e5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(376002)(396003)(39860400002)(6496006)(26005)(186003)(8676002)(478600001)(52116002)(44832011)(66556008)(38350700002)(956004)(2906002)(8936002)(66946007)(9576002)(66476007)(38100700002)(83380400001)(6666004)(110136005)(33716001)(54906003)(4744005)(316002)(86362001)(55016002)(5660300002)(4326008)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Adqm7nL3jO1hEXRGBgwzQYw7JTcfqK1L08IE/N/DSiAG+65giBCVbh00woZF?=
 =?us-ascii?Q?ixYSMF16Q/BN3uif1V0kybyY0iGllXpGO1krUluhC7MwOHKVUb5Lo2GPMJjY?=
 =?us-ascii?Q?kUAHfhcK2y1wYUDOGTp+DM284nkPLPMoi/g5BxN8HlqvyocvJdAVaXxsuwzi?=
 =?us-ascii?Q?+Wv5+Ez3EPl+K4Tii0qELJVqV0A9+yD756QlElrFpFTcCbVsFoY1DYDaNH87?=
 =?us-ascii?Q?PomB9YPFEnKSY6Y4zhSqpWcGiuZbVXwfcXNmHwTVTJfPv0YdPXjHYkGtKPol?=
 =?us-ascii?Q?U1trIOKAizJwvTbZzcXALDCq/FMsh9pKYHfl0nMiWjOwdMuxRSbQLAwAJvFN?=
 =?us-ascii?Q?b7zpWjm87HOatFze8cw2EE1iIZi5rbxo2J1Yn9Bs7DCBMuT1Imm4P5ZMc2DS?=
 =?us-ascii?Q?uCZgYkEP/cCs8CbrBECdDoWU8+7FNIYUz/83SMzZSqHO+65iH15VpJDGthjs?=
 =?us-ascii?Q?yjIvuMeIcMA5DvfHx9AeTVHcCR30pfnrr1pO4MYiVOnCHJUgybSc7AaHI0ue?=
 =?us-ascii?Q?AWBFgbhk5j6UBaB0XiFXWx1bnhLiKclcZz1LQT+w/ggI7J2Z3VO3QbQO+q8G?=
 =?us-ascii?Q?3MtphZUzwbGxElYuKh+E426yo5YyhpOiyCDjSnkmmtWtQMWtXvPBXeBLLNRi?=
 =?us-ascii?Q?pBbc8oTB4a0uzo7ySRkeC7+aXV+S1FEREOqeuWkO/grBWCyYMT0fpmuBjS3u?=
 =?us-ascii?Q?vj2xzwppOgGM5BRS4nMGZonuXEb3nWooIBuZ5RRdoVygovl7BQgXZYakybYW?=
 =?us-ascii?Q?/dX3gMZzNPexKdy/MdrvvD/lK/sV4lKo51i/UxOp+pU2S8i0IEnODM9jv7wI?=
 =?us-ascii?Q?OAMTsd6s7ny3H5aCJkxyg8cBsFnpFOA79unIEcf+1T6cKLyWO35XwyDYEnUG?=
 =?us-ascii?Q?WSoOXVZfctizZyrMGgg48EcJPpWb3Y8DL1Sin9/QBmlDMV/irIVJiYbq3dkM?=
 =?us-ascii?Q?YxAUC/Wm3jTBrT41MBrcXt6BLzmwr373/mrgxQvqsNI4YFoy4VNPNTn7tQJr?=
 =?us-ascii?Q?6DWdTMnlrz6+fTbdGDLldlD+nh+RCu9MVYRxXBlX/o5mTR4K7GAVb10Xx4Rp?=
 =?us-ascii?Q?ncpMc8tchiQtaKxfDe5sHQ+gsNwWBn+eafYM83Ym9UA49G92tjjQy3UVc7hP?=
 =?us-ascii?Q?7n+iXUDJHNCjN+jFKaHmDgEmyg3eRyrCkENzYQyCnc55lA2ow/Y+H0lT3QMN?=
 =?us-ascii?Q?vUcpvnN+1Z+XNFVTkm/jhJRa/+ZSdgWFcfnmTm8aZiYDjfLqmhgSCFMCbHUB?=
 =?us-ascii?Q?d5XKtkw6BuOwFEaQwlJCmpx8ny5kmz1pGHSTB43d9pn2/UFTP5noxnK3S8Zy?=
 =?us-ascii?Q?JSIrdUlSHXaZN+snNuPql7Vd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0e76bf-ff9d-4a4a-2a45-08d9421b02cc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 14:16:43.0029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO6gSVtdwSJ2AO1J/7XSE++Kt3OR938QfG1aSrVdOvG5m4VAMXB98BS4vVpMQJiDBx23I2h9KiyCqvyWG99uL4YcxOI6Lx8XwyZP3gHRF4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4500
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10038 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107080077
X-Proofpoint-GUID: CZc__NbbcJbZWf4jRhVOJu4d-mHeJChx
X-Proofpoint-ORIG-GUID: CZc__NbbcJbZWf4jRhVOJu4d-mHeJChx
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The case where "tmp_oh" is NULL is handled at the start of the function.
At this point we know it's non-NULL so this will always return 1.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ocfs2/dlmglue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlmglue.c b/fs/ocfs2/dlmglue.c
index 48fd369c29a4..33fbdc823278 100644
--- a/fs/ocfs2/dlmglue.c
+++ b/fs/ocfs2/dlmglue.c
@@ -2721,7 +2721,7 @@ int ocfs2_inode_lock_tracker(struct inode *inode,
 			return status;
 		}
 	}
-	return tmp_oh ? 1 : 0;
+	return 1;
 }
 
 void ocfs2_inode_unlock_tracker(struct inode *inode,
-- 
2.30.2

