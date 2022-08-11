Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60694C19F2A
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Aug 2022 11:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234320AbiHKLAs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Aug 2022 07:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbiHKLAq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Aug 2022 07:00:46 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C3D6B14B
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Aug 2022 04:00:46 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B95q0D032436;
        Thu, 11 Aug 2022 11:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=Xn7WILszhMaSQHS8Sv9eVzF5bQLcvv9lAFsFo6DpxgQ=;
 b=fhNZYXOzq15vTTRbEBmqQx19LmM67JEVbXDIt78PXl+/Ts5HY1HFgJ7T2J7mffQWDCEK
 ODdM+ERZNMqy15m3ZloYEDakj04GQ2nZphkZ5W3dTGteJjZIA7VdtEp2MvzW7BDtJnnm
 4myRs6NkJYsjJXqw4ua/H+Lum+kvOKjKnU3KHSbmxERbA5yc88xo0lm9v/sXTF5dbpCC
 DcoPfx1gstgvBazsgJYQi8Azrbrws7vHDlzO6vb3HWSvis2zECSGdJ0JBb+MeKFp9Oq0
 3+1EUKhYJWb5JeeqrEAXmKtA1wFm//FKzDtOv8qTwd6PEZE6dOqDaPxUHbiVd0GejGZL BQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqdve1b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Aug 2022 11:00:36 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27B9EPue018962;
        Thu, 11 Aug 2022 11:00:35 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3huwqk07w2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 11 Aug 2022 11:00:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBLCuSWQB4Q7V3oR/NtXWpz24utH9eM4jO0YJUBfSnSdqzzQa/z0DBV948eyC79DrdHXDl8cWzJ3a6cQIwqeZp6NQSMp7zM7535BTf5+43JEBp3iBpnYbZy56DyGL0tDDeQwogPbD64mS0UGnhCex8ezso5IRh8/jLQ2/MjHU4sShADDka04n+HtHdPKWWO4pfwdnSNVXOEQUMo7H4Wh3wEyN0Pj7FxZ0390/sUMP/Fp8F19OMJhWYcFDTOH4DI/i9P2zeV2QvjOCsLJYq9gS6kmM4Aoa3THoF0HlPMnjcAh3JjLVGSzlc0rEziV6KOZuxdcoEmRD4nn2vOCa6cSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xn7WILszhMaSQHS8Sv9eVzF5bQLcvv9lAFsFo6DpxgQ=;
 b=Vd3mlqh2aMcz8aarwhNsBOi77Iy2PuXF8TDwROWb70DxEK4y5Ir13L/2RkAmeksmrs5cSWHwE/CVor9fun75SVjwHLOHnGwuR9b4JNjRhCdKFfWgZiUIjIOHD5zgsgkB1CmHSrKWxMU06Wu9UugvIjmOMK0JAHvZEw3sHPQC3evOeiIrr4DxU9SUXT3KnqdxNhfxtqzCkzy5o/rZdOHXwlqkxHyKhQvKj7kRRoKuNNjZFipx1bXrtMOleYSBKNFMgDGm1XiP58uZ1jJsnEcbBD//QwT7hRLoEKdSLrc0yr1lKtHgGAYGtlqnhi4vpPhsRM4yj7d3mZViydLi590KlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xn7WILszhMaSQHS8Sv9eVzF5bQLcvv9lAFsFo6DpxgQ=;
 b=iiezkWA6MqZljp0gnTPQLdw9Ru3PZX3gCzLK4ldT7QJIks9Q/fRGtWflyHaxpAvI3bSbrTKaHYxTg0RH1Ia62pALqV/IFh+UDTMDYZKoLQsStcftxicLCrFsrcvBKD6sOHsGYqXC/dOHHZSp6/zpDh4Gw2d49aSoUCjN4asDe6o=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1708.namprd10.prod.outlook.com
 (2603:10b6:4:e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 11 Aug
 2022 11:00:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 11:00:33 +0000
Date:   Thu, 11 Aug 2022 14:00:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Joel Stanley <joel@jms.id.au>, Robert Lippert <roblip@gmail.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] soc: aspeed: fix platform_get_irq() error checking
Message-ID: <YvThRi0vUw0kXOal@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0116.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b2a7218-0393-4fbb-7c08-08da7b88b65a
X-MS-TrafficTypeDiagnostic: DM5PR10MB1708:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7flIFiJ8OyScqXkFylvv+u6ZOPWn6kZwtgmWKGHjSniHlKG50w/Yi5Q+ODeOimGe+uSUxhY9njf1lbeixf8tmLcgFWGFqzx7M7PpL6MGYb1Fjtfh2R9mcwwEJOA51acrI7UjnuAfuuzSTPpz8A+nG+ggm5NznHVbkaTX3cwrHc5Al2eFMSOmYl/wKVRuS2p8nkne24zLyBQavpTlWqIHWIXdjPPLQV57TwJ4XQ1Si5johIAcFynr1lpieuB35ssw+SpblaA7Oth3yFCuiu+Xu/Nt+hefThue6/Nmn3O45b3rofF5pIAZMFdDdPDd2khPvSFie06jMWLEEHiMdqtnmac3BKjJyLTzFoPR4mjlHjU6pz71VFc6L1CX/tXII7Od1+C8xqH6Id53EGQFdtv44p4mlU3dFCM4nNbXQEmlezzBUf1F7D9jYDUhvbO2N9Pdafe4B9NL1C7Yd5/BytbOLTqhrPE5npAI9A+Q62+iCfbwNxWye1huyypsvE57kuhiAZqDUI5bHWXzuLRXcTpaOpss56Oikh4qJCBvPYjmXoOKfC+ACJSw4YFvR0Y5/EssWwaGyZIWL6btx7Hzigxvu/5/Qvpd741UBPF4n61E0P3qXBoeYieET/EYO+AvTp/7U1IliT+xcpBq+HbiS815Ak91nkChAnppWmBLmG7EwipNu1WK+gh3w/5qtQssgZMLkenagbD8xAllmoMCXFRbcrTqaVgZpBfvSP+UQuIrkR1dwZPO5KzGfHo4tJCC+u4nsqblaluPTgW68Egp2Fa+XaVnGsvAz9srY13f0wX90dM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(346002)(366004)(376002)(39860400002)(136003)(44832011)(8936002)(9686003)(52116002)(5660300002)(4744005)(186003)(38350700002)(33716001)(38100700002)(2906002)(6666004)(6506007)(6512007)(26005)(86362001)(110136005)(6486002)(4326008)(316002)(83380400001)(66556008)(66946007)(66476007)(478600001)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MoEhPpnE+8c8s9HZ0OIKYdEIAC8k5nqupgbnVVos57/GHik07fhCTRkkIBVx?=
 =?us-ascii?Q?steaQ51GOHEIlNLsI/DoNq0sMfhpXgB785kc2nvDyrcZsDo9XXEc+tDGEVaT?=
 =?us-ascii?Q?wFMitEsCy/Nvq6b2T9pk0h2f24DlDGAW8LPWCwIR/tZGZZqcGNph0vIvqVuY?=
 =?us-ascii?Q?GTZ+2iW6QD9I6d9gWE8nKp3U7s2QLwpGvW7FRDZyGb2Tm4YiYLNaB6JU2Jf8?=
 =?us-ascii?Q?vkeMuBqk/IYAGT6X2GPNtzuOz5DlHSA3PAvrvHpgnrQ1iEDLpcogQdV58HcR?=
 =?us-ascii?Q?+UgAwOjQBuWmyifgjsZGIIHZ1xg51aCPdg8U4Z5wQ8imCIb1y+KGhMwVvH0h?=
 =?us-ascii?Q?oY76c8le53i+i1AbNkVZDtfvSqPKv03B6hpeCR6qZNmi2bBIe2n4z3PUdyeU?=
 =?us-ascii?Q?GtcJ9N5SBGrfMxQr4Gx54Z2ACH30nxSYYoL3ZzRUYQVsjVFMy5r9B/4hmz2B?=
 =?us-ascii?Q?xYBjm9ekRJdOGMz6SwESYZghk6Nsg9lpKLXc5lx3OeoKARktDJpJDfKWRFOq?=
 =?us-ascii?Q?1/eAY1n8vbVwNQd0dGdo+khNhbZfF1ocS4xd02aAVVL5i1JLh/8gmHsSFAT8?=
 =?us-ascii?Q?7XTbKk+5WwgVp8Np39LoqY37LPfjScijmTqVwMpKt/XW1yDcMDzH8ulYm0CA?=
 =?us-ascii?Q?pnt2ht5w5ns+ndQ8C6EBwnGJfBk3Yh1PkjBkG/fhA5XCHExMurFIgERVe2i4?=
 =?us-ascii?Q?1xOyimRPpj5DlRBU7jvQDjmN13QrBqwj4IpgLDyGtvsyATRsy2bZGdZp52nN?=
 =?us-ascii?Q?tkNmBZ+G7hsOX87x00FCCUszZO2THhnCcqmIdJkOcnGBz+s6rmCYtK0yZ/Vn?=
 =?us-ascii?Q?ez6r+lf16laO35pKUu58yvC/AiaY1TyH6ej74UM42J29dXUbSkIz1LSDWume?=
 =?us-ascii?Q?8GKzfM4nOfpZZ4CLCCnZQoPwfAOjC1oVEsoip6YsijgPfEhuqn4+Lc8AeIgO?=
 =?us-ascii?Q?tupdxbuwjN7wqmTdnrQ8435IghUev80sj2bYrI+zUZj9MFurwJXtj49zVBhJ?=
 =?us-ascii?Q?2AvmGaDx3kPHDw9JcI5ULW8Ok3EEXQTZR3lFJSUyd8LPQJZ/cgo35UP4JAue?=
 =?us-ascii?Q?O2V2etJDRHlAsdPaRAwPG1EOhiAMWVBbH5anK8/vc186EzBl/TZL1Wel/0U8?=
 =?us-ascii?Q?71rFFpYuudwEEYEbYe82aUX54c/mMvoIpw+IikAgTQcFjyrKp6c524foaQLD?=
 =?us-ascii?Q?iv4xZu6cI5I5yYZkHvn5+L/a3zeAttzTSn5020DrSAp03FL7uL+KAkt3SZbh?=
 =?us-ascii?Q?PftpSFWCV9IUV+/XSqj82UK3+8lV2nD+3mFsC286UsGLe0hmMN3KmNoXzsIi?=
 =?us-ascii?Q?Bi6MSTQTJaxtSIYN8tVmmNsqVf2zME2fbtOaWJp7pkbQbSW+j8YuQUkKZkim?=
 =?us-ascii?Q?Pfarq1eRy16JEdzuVqsE/Z/6r7w+GhaycC80aF0CFYvIFnOQsO10LLe4JAXf?=
 =?us-ascii?Q?zk2CFpLcO4FBKy6h4KdOSk6zXDcoMe+qleM75RQk4QLb7K2inz0saIdi4RTG?=
 =?us-ascii?Q?vk8BxlLV931bIj3w9HPwk+uGExIT1ysnUOFK3HM0WBHRhAEcldTkEApLT40h?=
 =?us-ascii?Q?4xFiubJx6mEG7I6cywgWAlanuCDcNxkMw2oDHb4sAxZUo8gglODFm2cQIky1?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?zBbCiTITyHJyQL+CHmvNrxrnH9yEKVNBkoqwg1vm2CD+h+bqkDp5DFJ/pwU4?=
 =?us-ascii?Q?sWFX6plC3CAwDDfHKnlkCtNSA/75MlDklO/z0ajFIdQLGA+0ljmbtZxOCP/i?=
 =?us-ascii?Q?J2v168cvrBlezSckrg9WovlC9K/Tq9pUF5S67+ZqKMcBrV5PZupA3sLi1hBP?=
 =?us-ascii?Q?soENGHjzWtpRUepqdGoGrlImePgmHV/n5u6PXnBaGK7b+MyBqpVhhwaHVjxt?=
 =?us-ascii?Q?XDtZ77YFmAX7CNyp/lEoVejWXkgwO3j7AeH80Zz+wToWNXzYo2ySaYjmw/pI?=
 =?us-ascii?Q?elFM/x6MFf0mtFvQ9Y0g9FhypiamOhP+rY41qtirK+p8/wrlFeI5S18rNRqz?=
 =?us-ascii?Q?mRbZWN8JkEyy80uokAwcPOYYLDZaCuMFDZgmd6RogsqsltBKIc7OM3TAjpfD?=
 =?us-ascii?Q?gOBxdVLzCu3eCkcbhHJY/vs/VY5FXUFtzmvtXDkgRsn/bbRXy8+pH3eNfRhD?=
 =?us-ascii?Q?Unup3SV360Kn/Fse4ZVduYnKuGPU7T3byAWnVLnrprdfBc/8dOqy1wEHwSLz?=
 =?us-ascii?Q?ZQJfqRCFa0PzO0GkiN9qVjbIDYu8Itwy4G3M3d1wS6YoSuEBFRH42efJ0+gx?=
 =?us-ascii?Q?xx1YbheMWcbyPiF4f2dsgAQ/9X4t/mC4EgUQKc70/T6Pr6F4mBymT+YqDOGO?=
 =?us-ascii?Q?LZGPoGeOApc/xVNJISCT+5+0vrjM8KNImZUer24oLopCo/IWeTsYigCtaZN7?=
 =?us-ascii?Q?/rKIrVhYqfhrj2w3M3iTQvN598dFgVW4RUcj+2krej0sE+4cxykMP3dDhUhZ?=
 =?us-ascii?Q?AdLlPbI9WziNmRs+w9cq1cekVQ50RtGT7oH7QWYHI4m1nvBxv1iB/PjjNLRj?=
 =?us-ascii?Q?Q/g0shqxojh3OXbG5AvJSTSzWUOlaQBRaGAPECB9aa62T4xNfVgSbJmUN9q+?=
 =?us-ascii?Q?4n1Dp31PgUKrZ7nFQ8M86dnkZKKrpTZR1vQMIGDUQ+k0XDQkLlRgQi0gY4dF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2a7218-0393-4fbb-7c08-08da7b88b65a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 11:00:33.2748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+p04zxSryOk12BZOsNsxeo0C4bZNsFM6tp4ENMpCwf5puwx1eh2AhJqvOJh4n289aDPFZ1YxTUcIpOxDP1zua42yAVBXGN++zgm71ohXJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1708
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110032
X-Proofpoint-GUID: KbymgqILwqqUeGGY87PEuSDuEQHzxgex
X-Proofpoint-ORIG-GUID: KbymgqILwqqUeGGY87PEuSDuEQHzxgex
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The platform_get_irq() function returns negative error codes but this
code is testing for zero instead.

Fixes: 9f4f9ae81d0a ("drivers/misc: add Aspeed LPC snoop driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index eceeaf8dfbeb..c4a03b3a5cf8 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -167,8 +167,8 @@ static int aspeed_lpc_snoop_config_irq(struct aspeed_lpc_snoop *lpc_snoop,
 	int rc;
 
 	lpc_snoop->irq = platform_get_irq(pdev, 0);
-	if (!lpc_snoop->irq)
-		return -ENODEV;
+	if (lpc_snoop->irq < 0)
+		return lpc_snoop->irq;
 
 	rc = devm_request_irq(dev, lpc_snoop->irq,
 			      aspeed_lpc_snoop_irq, IRQF_SHARED,
-- 
2.35.1

