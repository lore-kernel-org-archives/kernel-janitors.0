Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E105C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 May 2022 05:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbiESFRy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 May 2022 01:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbiESFRx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 May 2022 01:17:53 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CED1AFB1D
        for <kernel-janitors@vger.kernel.org>; Wed, 18 May 2022 22:17:51 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IMIt4t027473;
        Thu, 19 May 2022 05:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=6P89fd9m5THYopYz5OVVJSHhZhIKQaMW8lyYcqsv2jI=;
 b=n1GXgBcKAFlsprt1w4k/z+ew3YtbslPclaCI8wOy4nmkmN8qLQ9dg8bAGniQDFhmrXG/
 D/hDRltRIVWoRe+OeDqpssQ6g+j54KuFut6H5bLS5nquQR46HbmK9a6FioEGC8QImN9s
 rFAdKK9dfKqUA74eXe/q7HuD+Nr4rFYKz6dwWXf/vEZx+QsgTawk6iu+yHqRfBgkXtUV
 81He3U7vV9pF8EXeEmHiyYpJ3d5avNtFbRBDrLuBehhMKg0JNdQHHDraDrtn+KSx/RWx
 FbVtfFOb4cm0tdrLBtz7JAICzTMiLwlgzgTmAbU53qRMY90Z6lcft39PISHncw7a0UZc xw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g241sb5kk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 May 2022 05:17:35 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24J5BAI6029843;
        Thu, 19 May 2022 05:17:35 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g22v4wg2v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 May 2022 05:17:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6/+OvxzwjQ+sk9TRZDTUpJ+BwiQrBTdmrwqAN7IV/ivgT6H8oRCjtslqP1MiNNszdqoIfB7ZuLmnRhTebIEfEpnuSTgexqjXpp2i/tNsX8Q8k0FZmmezav9a7DFMntLAPOinT77nzBqmiYwP/FO8ygScflXwUvFGu8vi1mW6gFm3sqTM8P1So6UYqbaqac0KKAYYap4Hbwuvi46YtVUCGggV2zeyziCCzHheTcw3NvIsKudcU3KOv+vAgZJ9IaCDO6x8vZsLcJNWNKh+j8jYmNCecJzXWzdZbKymazrR0g5pL9FHoAdbzC8ynlnVGj/pL23jFuTkyRdPDuaJ9vlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P89fd9m5THYopYz5OVVJSHhZhIKQaMW8lyYcqsv2jI=;
 b=Q9YqrmyjT8oRGMlvM8DL5K0CEkAMP47XcQU1KSrlCaX1CUt3G8NkWo9eqbo4nMqO5n8nmGLUhW+iWWkfU6cK+Zpt0UqS4o+NeIHx6jF0OKyAQ2ik6m9OTggwQkYiYREbQ+UMK0C+mv2jHVashPPlDFl3SdCzWKv+TAodhKHG+nnNiPOYDXarGHtBgvZo//1KRMmM2EA6fyppTtvhUQxFHSOFrBYJx4cYraBGDhWfKx2bKuxdgdUQfp6Z7W1FkFMjegiznB6wmWcH3n9B2tLl3YKQmvQupi8CzlYczrmV0F/1IW9uvIrUfiuD4ame0FK1aWFC8FlCoA83m5xeQQvQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P89fd9m5THYopYz5OVVJSHhZhIKQaMW8lyYcqsv2jI=;
 b=LAmXoJJPLN0v3vqZKyMBFDMmT9jMMTcrITmaunR0hxTfcUTCvtSJQdx77wD9e5OR5sdYZvfNyOUBakcJ/ozXuU9+/Rx0GD5bEVelc+tDxGyQ9qMXWu0b5CIJRaafb1X7tyBroYszx2VEbCXn7EFw8t9a4yzkapV/z5kX8AjpKwE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3248.namprd10.prod.outlook.com
 (2603:10b6:208:129::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Thu, 19 May
 2022 05:17:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 05:17:32 +0000
Date:   Thu, 19 May 2022 08:17:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>
Cc:     Phillip Potter <phil@philpotter.co.uk>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Straube <straube.linux@gmail.com>,
        Martin Kaiser <martin@kaiser.cx>,
        Abdun Nihaal <abdun.nihaal@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] staging: r8188eu: delete rtw_wx_read/write32()
Message-ID: <YoXS4OaD1oauPvmj@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZRAP278CA0015.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::25) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a771118-fa3f-4d88-12f7-08da3956e0c8
X-MS-TrafficTypeDiagnostic: MN2PR10MB3248:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB324894C8C6AEE50C0B0D42168ED09@MN2PR10MB3248.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2CcNE/Q62o7kjnT39MH6kPVEVFvu4vk9y8ZrXvNhR0dvVrr9P/D/iCyIxWAlfsh45HemWSbnLJY1F/8RTvueUqgLhVV1DwyOTCDNPWCtyI1DZvPHabKslqCKxDx7DkLgPIuWIlsENBpp7mHjIl7OsosOeb/OakkSxfxrMzb2hfqoB+5tZMfneipAId/rqkdeQbCuR3YaNU/OViYsHKEdc2wSRr1bJwAttJ+/D3YewIv5qtRUQmsu75duoe1dJMpVxpXPSEDvbR0m4IaY2mY9QDakxOwyqusie2k4jNERHVGC4PGDHh7LBLWL+FBQrfTgzGDRjjpU7j4VOUe6YP0hGyRh1BLpBudawMyg0nvu9DIoY+x5iBSXTIpt4Hr+M7hC2qzCcNQJROjCGiMj3to101gdd5D9tsBqAOwmy3iwya4hJ0G3Sz7fOD0pEyqiYwj4M0UKQnKejTDB77jPKIh7VCNIw8kyKGJMOjSs3Ptz1XpO1qvzIABC4ziamDrBEHXWFkGenCRMBu1wWYgnZG7UTmHsmE9hHekSqmpsoow3dP9GjfrQjLgvJ67FPla9m4/nLfjF1iAFbN+SXR+IlwM1CyxcfT9LHWKV2dbd9G4jGB/aRpMFQFCtIiwtrsTiZN2VUK8iKZeoQ/AyNrs9kaNXapkPuJMuovs5WHQvGS/qf/Si32y54vshhq5V4DHhSp4rzIMQQJFk0jfOwEPdj1HGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(316002)(52116002)(6486002)(8936002)(2906002)(6666004)(508600001)(6506007)(83380400001)(38350700002)(186003)(44832011)(86362001)(5660300002)(66946007)(66476007)(9686003)(38100700002)(6916009)(26005)(54906003)(6512007)(8676002)(33716001)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xydNkGR+JzmDwX5hP+MoMz+T/jAZdRp6gPGq6ffCTN+4JFkIo8w+whePIjhR?=
 =?us-ascii?Q?hGFl7C8FULXGE/dIXN9gq8zfQP4goFkFsuzUfMl1JBtWjDVMXOzQGkWTAebB?=
 =?us-ascii?Q?MJTyQE9E5j9Zx3HMPrazKGNflhkKeftU7wb8BkGZdrKvisSy4vCe+v4hUdHm?=
 =?us-ascii?Q?l8i1TLC0JMgjgI8r1l9aDGaI3y2l7FGpGtj7Sns7rOLpgpF1k8oBScPi4avv?=
 =?us-ascii?Q?+nxslrURdClWHxXEmtf5ase8wFgKVt15qf0wa35W4Hg3dwPeY5Hch1C5pjAt?=
 =?us-ascii?Q?4MHYtNWN4fIvTLMrDBUnhdU4TVXKCXHykaUWP+hLtPTFQfTFGLqCQDNWtXPh?=
 =?us-ascii?Q?KJbJNCUCXSXOHgIzvCK3es3bXpQK5hgKHir/n0Nwpcg4T+wHqDKWT9dNY7ya?=
 =?us-ascii?Q?Z0qIU85z1phRdXQ5PCAVv7APk8w4MvmF/aTk+JehyWhwhDkJJZ1mEnFEVHz3?=
 =?us-ascii?Q?/2w2hbFEbNGxDLV9pS5oILX42xZoCtWB1HYZ75Dpwitr/eej+L8UKgq2DEJa?=
 =?us-ascii?Q?UoZ6vqUwa3639n5M6hC9WIvUzlKOhDXw7ZRcQfSNlyEvsiUmtVSeKomOyXhK?=
 =?us-ascii?Q?x0zh/diFai13gPvoRzkQyTf0kMl8ljXcqnBQxtpcuN32R1qI0r0msqLFnlo3?=
 =?us-ascii?Q?EQPc7fg8zHF/dQ4aJBzkcZpRExorF7NmWCI+qVBBR2CWWv77WVmqwnr7uBu+?=
 =?us-ascii?Q?W6rYjyWvqqGhEXbgtvLac+m+OTn+HlI3FEfQdeb0Gdw0UlbioyYJwS9YcoHU?=
 =?us-ascii?Q?IzHCMP4ozdcFGxLDOZITdqP8IVUu7Z3mM9rzZXiJtXP/oZ09n5ln+ZmcY1uH?=
 =?us-ascii?Q?eOh/n+u0Cd3aeJCXeyPxs7wbIM2m7JKKIAkOqj3ER2wKXfncuPgwh/ad55MN?=
 =?us-ascii?Q?dp5mM1BOeRQdJemKi3UzewrrTG1U2y55EJOKsSHIh/AxJH1qB5kkEoWT6+eN?=
 =?us-ascii?Q?saLyVUeOHus8DbBqEzaqalkRJXWsGQ4agnk0vSc932paqy/jebbPsHxaauMd?=
 =?us-ascii?Q?wWRhVkpxHtmlNL5GZlxQh6i5VoVEAc/Foqo0bm08uqsTroTHmdcH8kuZaDwm?=
 =?us-ascii?Q?dajdtnLnEBymiAa8/XtJ4jSx/iXqx6cG9x3Z5P9WCwKPvVYnQrORB4HCRyE2?=
 =?us-ascii?Q?Fjv8n85DSI17duvzY4nmnLjACUKikPDqf733Y2MffEm3q9Qh1H0PfT+UpBLc?=
 =?us-ascii?Q?OBDg6iG+JeAmnGx+mXq4DUzhfB5bSJHgxXlXkAxSJ5imRsYVr6rZgCwolvnt?=
 =?us-ascii?Q?7HM4MuiaRZqrKxoOQwPMEJvjV79J/S445uER0HprtLnTe6YSsD2aSNxohdJl?=
 =?us-ascii?Q?G3SA+g1o8mB0yJXwZVXhXW6i+U9NEkFGjU1RZ0DG6k5WiEysQBZWHpYXrJOS?=
 =?us-ascii?Q?aVKWyMV6IhRoHUmBqYxKXyf80VnGjqSpmUnWylZsDsZ7wd6S9wEG6rQV/O/b?=
 =?us-ascii?Q?qs7CN1PRP5SGKFisjRefiJiwTmda98nNG2y5cuJiHLWeaso3ZEZiqSEYCwYg?=
 =?us-ascii?Q?koQfA4GnEJP2VL2IYuCeRDyO9Ow+Zq7UZ6ZyUEP9FhrYcGMsCELdZycrqEF2?=
 =?us-ascii?Q?h/qZFdLNrg0qMv37iW9uTjkMB1NPjaPBDSOSC8muorpOmHFB15pqsteIJ7+D?=
 =?us-ascii?Q?D25pgxTPx2scpLEHLlroQZQxjdzYCjzt22b5BC0w4Vpqf5Uq4gEddU3B0JYY?=
 =?us-ascii?Q?PZmccceapcReyrYBrxWPz6TL8VHejZE3i3rzNDYsI4pVIXFENwFH95L1rvsh?=
 =?us-ascii?Q?Wu1S1eTw1Sj+Q/IyU6+3nTckeMW7rW8=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a771118-fa3f-4d88-12f7-08da3956e0c8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 05:17:32.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDe1AGFEnvm9Qr/iOpJk/8tr3hjsfGb04us7WCKiTr3h40tCJ4NPpJoDVBHnt//2xRGlu0LIH3l/r42dsB46nvGUftx9vN0LxVDOhE9tFug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3248
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-18_09:2022-05-17,2022-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190033
X-Proofpoint-GUID: ZWHTkBx1TC7gQSYaAA8zv1s5IXY-hLfn
X-Proofpoint-ORIG-GUID: ZWHTkBx1TC7gQSYaAA8zv1s5IXY-hLfn
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These debugging tools let you call:

	status = usb_control_msg_recv/send(udev, 0, REALTEK_USB_VENQT_CMD_REQ,
				      REALTEK_USB_VENQT_READ/WRITE, value,
				      REALTEK_USB_VENQT_CMD_IDX, io_buf,
				      size, RTW_USB_CONTROL_MSG_TIMEOUT,
				      GFP_KERNEL);

with a user controlled "value" in the 0-0xffff range.  It's not a valid
API.

Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 86 +-------------------
 1 file changed, 2 insertions(+), 84 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 42cb79cee2ae..a802c1e7b456 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1886,88 +1886,6 @@ static int rtw_wx_get_nick(struct net_device *dev,
 	return 0;
 }
 
-static int rtw_wx_read32(struct net_device *dev,
-			    struct iw_request_info *info,
-			    union iwreq_data *wrqu, char *extra)
-{
-	struct adapter *padapter;
-	struct iw_point *p;
-	u16 len;
-	u32 addr;
-	u32 data32;
-	u32 bytes;
-	u8 *ptmp;
-	int ret;
-
-	padapter = (struct adapter *)rtw_netdev_priv(dev);
-	p = &wrqu->data;
-	len = p->length;
-	ptmp = memdup_user(p->pointer, len);
-	if (IS_ERR(ptmp))
-		return PTR_ERR(ptmp);
-
-	bytes = 0;
-	addr = 0;
-	sscanf(ptmp, "%d,%x", &bytes, &addr);
-
-	switch (bytes) {
-	case 1:
-		data32 = rtw_read8(padapter, addr);
-		sprintf(extra, "0x%02X", data32);
-		break;
-	case 2:
-		data32 = rtw_read16(padapter, addr);
-		sprintf(extra, "0x%04X", data32);
-		break;
-	case 4:
-		data32 = rtw_read32(padapter, addr);
-		sprintf(extra, "0x%08X", data32);
-		break;
-	default:
-		ret = -EINVAL;
-		goto err_free_ptmp;
-	}
-
-	kfree(ptmp);
-	return 0;
-
-err_free_ptmp:
-	kfree(ptmp);
-	return ret;
-}
-
-static int rtw_wx_write32(struct net_device *dev,
-			    struct iw_request_info *info,
-			    union iwreq_data *wrqu, char *extra)
-{
-	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
-
-	u32 addr;
-	u32 data32;
-	u32 bytes;
-
-	bytes = 0;
-	addr = 0;
-	data32 = 0;
-	sscanf(extra, "%d,%x,%x", &bytes, &addr, &data32);
-
-	switch (bytes) {
-	case 1:
-		rtw_write8(padapter, addr, (u8)data32);
-		break;
-	case 2:
-		rtw_write16(padapter, addr, (u16)data32);
-		break;
-	case 4:
-		rtw_write32(padapter, addr, data32);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int rtw_wx_read_rf(struct net_device *dev,
 			    struct iw_request_info *info,
 			    union iwreq_data *wrqu, char *extra)
@@ -3771,8 +3689,8 @@ static const struct iw_priv_args rtw_private_args[] = {
 };
 
 static iw_handler rtw_private_handler[] = {
-rtw_wx_write32,				/* 0x00 */
-rtw_wx_read32,				/* 0x01 */
+	NULL,				/* 0x00 */
+	NULL,				/* 0x01 */
 	NULL,				/* 0x02 */
 NULL,					/* 0x03 */
 /*  for MM DTV platform */
-- 
2.35.1

