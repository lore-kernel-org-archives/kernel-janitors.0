Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D422DC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Nov 2021 11:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B985B611CC
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Nov 2021 11:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343587AbhKILwz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 Nov 2021 06:52:55 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:1346 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242051AbhKILwz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Nov 2021 06:52:55 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9Bf6cZ017452;
        Tue, 9 Nov 2021 11:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=F3tu/v2oJ4a49kKyBv0lSQyMbZLx1CgIkhG+tiBaSFU=;
 b=A2anDVdAEd9Y/3yJPn/FSlEtbeUTyHJv7EDzwceOrngnV3mgMLIEAmfbgSb3NusuIM6+
 klJY0ncrOaubEkRRifR2ZAptPDQvb+U6jzIdXCqFOj6WGJ2Dcp5dqvExhhPvwfWmsJFb
 gMCnq+Nr8TS6GXetYBd2mpvC/ewX5l8Uy1tpUdEbCTSVdMXCr7OEI77tI21ygoxK0voU
 S+oV+loV7eiTPBgRf1rsQOvVtGsGxU8tZygOZXYCC3uuGyDSNs1qP8DwiOqfsbdZuruu
 z7x7pOF18UYZlS7MtdUCqgYrrkgXvvSEZkCNwmVVQBa+FqwgB2Id0lfWKYuWL3BtRy8S jA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c6uh4jbkh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Nov 2021 11:50:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A9BjNm1185621;
        Tue, 9 Nov 2021 11:50:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by userp3030.oracle.com with ESMTP id 3c5etvgsk3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Nov 2021 11:49:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxqm28ZwYLfjd09OMApz7g/NcL+FMdeZp8iejMGi5ZqPnMk0S2+zWQ09T6uzBR6+CRfoh3TZxhVaaPXMFGOGFFZDTw7Ftw1lqTax83/69mE+bW2tIm2Mw2G7quN2YS0TlGnrHGnxrB+Yd5/sAiAFKtryfKJJO23G5oq8w5VdBtoL+3b82qi+X4HJ/6AqhWtA7ZOB5dcQmNOte2YpEKDadEhle6mACCjFGvdUw2ccCEts0ZhnNcPuAiQc1LnsgCP7OTGlFKTbTJ/NB/p/7cDZNMLwlZSL98WTfXsSOOUfQG8QNHzqkX7mZ0cvM97VU7BS8HYfBSAPapQsuFnepQx/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3tu/v2oJ4a49kKyBv0lSQyMbZLx1CgIkhG+tiBaSFU=;
 b=Z2YejhQjL5mk0aMGF/hv5/fjVmKxVR3GzfS+aGQ9Lo0PL59P0eHJQ6poviAlpiP7/0SmxbcfC3h7O/u4a3rs7e2dGLiLx8hl+z67LiS6VQPmjg0q7EBDQqa53S7Afz7U4Y+ysa0Dzv4XWxIrtkLMHADtBCeT/vAUSGPFIRYf+MlBJf1RfZqYw+fUB9QKDBlxPTVBO/T0AZo1UBhu0KBCdeD3ylxqesQOdG4dPPGUVCr7/7LrIkpfFq99ATkyRfoVImx4nrAGJUtEhss1yOmBs7e2ZW8nYatUCA06rAQWT/YZum8RdZovIqABp3jZxU3didSuDh4JKPAvgpVi/SIpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3tu/v2oJ4a49kKyBv0lSQyMbZLx1CgIkhG+tiBaSFU=;
 b=UT0Us0mwtEci06BUqq4YGp9BOTdR4/vYp/RQMRimOrKozZ2flV3Xdzp3H5R+6Wrtap5vVdoMztT34/N3jeeQD8W97lOPAQawib3OMYMMGdjfSNijE5HW93a3dMAfT2c6g3kCA8I14XQYdGai2/SELXsszTX5imqY/U3oOqTywk0=
Authentication-Results: lwfinger.net; dkim=none (message not signed)
 header.d=none;lwfinger.net; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1999.namprd10.prod.outlook.com
 (2603:10b6:300:10a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 11:49:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 11:49:52 +0000
Date:   Tue, 9 Nov 2021 14:49:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        Martin Kaiser <martin@kaiser.cx>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: r8188eu: fix a memory leak in rtw_wx_read32()
Message-ID: <20211109114935.GC16587@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0168.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0168.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:45::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Tue, 9 Nov 2021 11:49:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dba6b4ae-098b-4b9c-64b1-08d9a3770a92
X-MS-TrafficTypeDiagnostic: MWHPR10MB1999:
X-Microsoft-Antispam-PRVS: <MWHPR10MB19999F7DB63A56A4E5A9961F8E929@MWHPR10MB1999.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:416;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zke/Y3mjyDw8VmknAXXjh+3hRdoxNxjzlCkHhYSfNj3tJY9hACxrOUCxV/2zIX+0TrZ7+L2G4jNJKeMoat4LW/yZJYbPyCARNuySfIcyI39+sTtVSl48ZKOjTfAyBWTN0gnFaNSmtvrzdQBIBs4bGiVSoGGRJsFAb3sg1FDnGz5KZTQ1qwAI/bp5HUsyEPeTwYawi6BY3nrVSC7R90rAkkcFwmCBqLiH6bSImQde5LGm38qfiGpg/K4v5VoOJ8RUm1Em+ERBwCc/DOqKjr9LrTUedygBzs/DYvoez6Dt+cLrnLUZ++tF8eTmMymtuSTijirlb3jDW3qy8U1nqoOybvpqkJ8zf4aW2I0q3zGsLDYnta5cYvDOUkxKZAfeaydz+bZ4kbnM+nWxpFD+wOr0/2+XlmCaHCC5+3sErxFwdr/Raum3H54OLbTh4QXNxDLurW0B32vWlT/EBaQPzdjZF91GfycuY1POGywFJ1ZOGBXPJzFIQbItUUtRoLNSGEqc/2D9j30aefrdoTdkhCevKU4dW+ekXwVI6K4peRg7CafY9YcJCAfnYQqrwrz4l7EFFHXLDbmccAem3lL0VYF91+9iz8A5Y42s8H6clMwmwAf62q+YWjprGgFk+XykxTz78jAQojtGQqnuGqqzqC9UsP5bPMFHnaDTcypi6IlizWmuhNS4JI9yol0mLOyI5li/friRnKIfEA0CTHYfSK3FVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(33656002)(508600001)(55016002)(6496006)(26005)(186003)(9576002)(33716001)(6916009)(54906003)(52116002)(86362001)(4326008)(316002)(44832011)(9686003)(66946007)(38350700002)(38100700002)(6666004)(1076003)(83380400001)(956004)(5660300002)(2906002)(66556008)(66476007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t2kpoUjuCbgZNR910ilXbMlGNGxFzvRfJ5+RpZnt0n8HElaHDxI/9QS4Tlgg?=
 =?us-ascii?Q?MMNzfkFU/+Q6eTK5sjn3ROjlblTvI4C77XAnbJHMwYDoBIemoPMaXRrCD/eU?=
 =?us-ascii?Q?O6K88x/xx75LchAYmZQ6JaX2uZMAkkkwHZp9WbbIuENoU9zK0kEU0N6wfpE7?=
 =?us-ascii?Q?Gn+rutXRHWAYJI/LPWWFgvS7d+pjgWD90i8UTcp06nAIMjDO55HfpfZ4iLjJ?=
 =?us-ascii?Q?1tqKaom9zN73KDeGWKNY+vlaeAIDhE3Y/ET1SNJaekjqluxOzlRXJozU40TT?=
 =?us-ascii?Q?j2xSooxwcmC0F9A/MyrdQRT/lCSQ9mBJ3XHej1dpaWrb1y8cJWqaZBs0aa1+?=
 =?us-ascii?Q?B+Ru9/YGO4Le4X6pk2p7+AoF9bt/vQGVHJwEYPYoBiBJuWz7lt+QmwD1mo1c?=
 =?us-ascii?Q?WIf8hsxt8qeAqn0EIBKQNkfPet6fjzISjdGfIbV+0og/JzHkzoi9MIbeIEyu?=
 =?us-ascii?Q?CRWV3H2n1gBBetpqxMQNvwA7GXk//edKH4nUwb8iPh7uqKMaJ1eNwLhctRN7?=
 =?us-ascii?Q?5XWJ5QC6MGLWijxunTL1x4cc+MyHUAmf82lFg+8939IiQifOj7FgCwdkNAkQ?=
 =?us-ascii?Q?MysurDxgvyOEmpwgAzELFZNg1uzW7VU8tcxVPDA7NcTKp5nhOkjw/7J/89wL?=
 =?us-ascii?Q?dmsQewZMP2Zw0AjxN86Q59MWhHHX0EXZLiijgtimmBV0PwBOkrltvwG/w44E?=
 =?us-ascii?Q?2Let/zBW9jloVE9XONuxctP2Yl2nl5lb8jblLm0kCFs2xrauYBqMT+UO3Kpm?=
 =?us-ascii?Q?jaMloCMGRH1LG0TpY3TKTKypsuoH+UE12aXrhMPw9w/eka9yFMFwM8JLASuR?=
 =?us-ascii?Q?dGYBtYq8Koeow0B4mAjGyXBod2hi8E1PgR+X2Z5NNZk+UfZFm5gNfcG0QdZN?=
 =?us-ascii?Q?vV+8dP3IvaLGn3895G4tmT0mREykr+MS5msJ+Wm4B3RQjCBC8G3Qf4040koq?=
 =?us-ascii?Q?StS3jqh3uGQ5yf2/IYBLW94BslIfpxRK4EuG5bhxEZ4u3rxtNTGr0d353opn?=
 =?us-ascii?Q?6DVjuczNQRmBfM3dQBZRPftwvgoj3G+gwhdOLPRSRLFI+I8w9/cLWzeFiyjR?=
 =?us-ascii?Q?koryQ9LHSLAW8/GIMguW2alQhH7zz0eH3TiKamHFgcxBrPFaN5X3FnLOvBP1?=
 =?us-ascii?Q?z3x6NIYKZ1yuYiXX5NPvGy/StrRdvjV5QxRHfjSmYdVg92Unhge1GlHH6iLv?=
 =?us-ascii?Q?FfLDGNhLtt2bI/hHfBfdg+gL3FHnuaxPbsQCwUGsfcEspTzXCPmP0KtPenjN?=
 =?us-ascii?Q?MolZ7gF8i1/Fm6dFHtjuyKwwXPDMbQmNFnyblY6XV4Xf8n5x6rGVjonJdaS+?=
 =?us-ascii?Q?zhImNwBoJSz6p1whE5aAGPqOMhKbQv6agwU7rVk0Y5tNNWUZPWm4PoDOLmBq?=
 =?us-ascii?Q?W6jOiTDi/h6GJuteWe9ZQy3DG0qO4kM2CYIKxmuSWEA64fYe0XD7Cqz5c/uI?=
 =?us-ascii?Q?kZ7Q/mV7Gqh9QeaDCPI4Sm/k9svkvZfrzvi8UhINBWz13mIf1JFIepO81X5Z?=
 =?us-ascii?Q?ijlYc9kWyA67/ifUxN8wHNVzj37X2Qtkl3y499C9bYm8DH6zpfaLLXIRaDgD?=
 =?us-ascii?Q?DZqpgfI0lWVz3kw836a3STpJWxy2VnLaDo/aMXMZbiEk4+AE10UVORw1e6gk?=
 =?us-ascii?Q?F4qgQmNswyD+c48RmJA0aqFAvIfoGIv0bcAXIdnSXFafrzulG3SMTUtD6WY3?=
 =?us-ascii?Q?Kkq9mVS7P6wvuKjVlCeHV17DGDo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba6b4ae-098b-4b9c-64b1-08d9a3770a92
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:49:52.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luFC1Bk8GQLQju7NWW2QS95r+ao60NRawU4Gr6hTCqrkX4UtjMi1LfQHlv2N7Zc3uYE0qopLtA5NBhJkMv3brYaDU1J1P8SoZyPnNkx2iaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1999
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090071
X-Proofpoint-ORIG-GUID: GdAnHuclncWaMqRBubql4cRqxpH2R60_
X-Proofpoint-GUID: GdAnHuclncWaMqRBubql4cRqxpH2R60_
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Free "ptmp" before returning -EINVAL.

Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 52d42e576443..9404355726d0 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1980,6 +1980,7 @@ static int rtw_wx_read32(struct net_device *dev,
 	u32 data32;
 	u32 bytes;
 	u8 *ptmp;
+	int ret;
 
 	padapter = (struct adapter *)rtw_netdev_priv(dev);
 	p = &wrqu->data;
@@ -2007,12 +2008,17 @@ static int rtw_wx_read32(struct net_device *dev,
 		break;
 	default:
 		DBG_88E(KERN_INFO "%s: usage> read [bytes],[address(hex)]\n", __func__);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_free_ptmp;
 	}
 	DBG_88E(KERN_INFO "%s: addr = 0x%08X data =%s\n", __func__, addr, extra);
 
 	kfree(ptmp);
 	return 0;
+
+err_free_ptmp:
+	kfree(ptmp);
+	return ret;
 }
 
 static int rtw_wx_write32(struct net_device *dev,
-- 
2.20.1

