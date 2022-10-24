Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4A9FA373F
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Oct 2022 16:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbiJXQKf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Oct 2022 12:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbiJXQIC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Oct 2022 12:08:02 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3100812A93
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Oct 2022 07:59:31 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29OAO3kF024651;
        Mon, 24 Oct 2022 12:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=A9CqWjAAVpleEkQILJ9Bc+lXIcBsNcUT3z3lXI45A8Q=;
 b=eXO34wV72YqxknWxndr53XEewjm31pC4wdOxGxRZcTQcymxFrkX1DOXdFu2nbj7PAg5o
 EYIA9sDjDOP+fnmfGl9toZKSUR0E/DV3slMI1Bl7OiW4UTCJc0kXjquJX7Sb8AgusTNM
 t9aPkevLpvQarPKmUmPPAYmNSnMUeoKNimETrysnq4U5P9ipzD09S/jevTzmJ8CCW3dh
 /9RYV1x2iwHqwRL8uSYPHikiJv/Xn4v5hxyM5vBcLORtXgTHw5S8qny/WF90yjgln1t+
 qeUmIaCBSl4njNWuA8ZxZ5wgywmKRG9OJxyi8b0eeSVt8lZiHU5m5YqCGsXopl2Aur8h tg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc7a2ufb5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Oct 2022 12:18:33 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29O9sfa9032034;
        Mon, 24 Oct 2022 12:18:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3kc6y3tuq3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Oct 2022 12:18:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4qx8ckOnblfCui1oUHx9vzw50BbyLNZQzSkvCD4YY4HsXP6UQwb5tw130DTF9ib8Tg3jKIMZEj0dtNTBYfQn4UwbuZhd7JEpFVko/2ZzDuTAs/1Hi7B6jUaRoRWwXxMNlEvhpxcmh3kzWh8WdfbhW9BN5AQcYz0Ro1jmeZ8TPijbZuS2EmaRj0I2/MhpREvK7iyg+y/+qLMNdH68ytcKmaD3irdCCbeLwhRRMiaO6Kix3S8eT3Uw5BL3j5Ab+Kdrvkvy/Polagjn3bPeMuhAugKn8Z9z+WjGYcfbyQczsU0b1CKQDbd9F1kFfa0mnW5+71LqSSnWVBI5pv3a9GufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9CqWjAAVpleEkQILJ9Bc+lXIcBsNcUT3z3lXI45A8Q=;
 b=NLek8apGYfN+tC6e62n0cwvoWJyeyVtRHFRfVFoepw7A+Dh2VR4mfLkkQmmYIG07GyvcjKgO58shyl/gL/hXafLGVrN+5cGR4tMTeOLBo+pbuqZdbS0bPFCHkTNZh14wVqAINGcAZjhKchkeiYebQdOy3iaYU3RznKNRv+nvWc8pZq2uYfz0zyMB/Uo6FR4u4PPF0IqMQrHFYIJ1G2KtQBaYsYnLMnnJEfuRtrxKq2iz5aiG0J3XugQv/bsMoeUdhlpOcJDFxF5HUq9VzJZSE4Jx+fcH/cwMAbk0GCd6uVc0IviJlhTvrqzIAQyKbsBxdavd+ne1k3Pp89LRGcNkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9CqWjAAVpleEkQILJ9Bc+lXIcBsNcUT3z3lXI45A8Q=;
 b=BX0v5qcAhr8S2SwE6idKXKOAruuysq4WK1jbka6W/AXtt2c/yltS6JJc4RI0BWYEeSQLRqirRrW3RL3tpWPW9y13Mwxr26OkmJFWFJ7FgkpGhs2cbFl+BqLKlLyrWDfxTYdas/PLsWhc8Uu6rJuINbmFn806tVXCOA9WYr+vlhw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH7PR10MB6625.namprd10.prod.outlook.com
 (2603:10b6:510:208::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 12:18:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Mon, 24 Oct 2022
 12:18:30 +0000
Date:   Mon, 24 Oct 2022 15:18:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH resend] mfd: mt6370: add bounds checking to regmap_read/write
 functions
Message-ID: <Y1aCiReTZDbPp/rS@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: JN2P275CA0005.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH7PR10MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: fef43359-25dc-4e89-0ff4-08dab5b9dca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nxze8QF3jGwBNQXwm2v9Xr8UAe39oKMKb9ZxuJZkiF2BWhojs+I8JPj6SR6UM66t/mzbWoZZw84BvtUdW29Txs769U/lBR68wFny35Eg3DaL0p5zxANxOyO4du/hOlHE0Xe/IEjIIYQQriQIiqz/96BkueVBkRQpKkEvZLjjEgVfj7UQoCQi654TRb7c694tPfnjjpv7vf1H6UMmR1bnVTLR64jFg5h2eLf3Y/fEjt/yCWrDviJlCO03GzS9ov5xi4wvAdYQTcC0a6G7lNM4v9kWaMaiS9rnZymPwGlkyMNJf5hcNCB1G8M666u835h1+TDbSnsYBizWRI2YtqjLwOT2ssc7WGJBrNg8U2WwEM5sijI+yj5f/ESLZJ65sX0Fe0yu9AGeQoxrn+8FhytnaUc5twhaWMvm/Naa65feAFCBVNqdBUqcCjP/XMraeWoSJlWtvJEanBhmZ+r9Z5+kUfJgrUhZdd2cGYUWEjC64wncNvlSgjDFUrVfpG2OyJ3qo5pGvkVZlhQFbTQSxQJt4nK7TyXNyhTAEf8ck0XyG9GmOGQNp2tkYzrK9sqt2sQrV6l2tOPmiN7lNh2XmH+7dHr0CvHtNXDYLCmqktc6awlh2DuFmBXYkuYvbsPgkIzDUsNX0JltGqpI8uc8OYvyeWmt6htj7SQZYR5muKXAMCYhcEFy4gIOqyrAQI0eIGADETP6eU1ZscGqbPxI9xUxjgtVFJPavFbEG/+BnyeeU90=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(2906002)(5660300002)(4326008)(110136005)(54906003)(44832011)(66946007)(8676002)(66476007)(41300700001)(8936002)(66556008)(316002)(26005)(6512007)(83380400001)(186003)(966005)(9686003)(33716001)(6506007)(38100700002)(86362001)(6666004)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CXqFOYCvI4gFGohnHoo8tYfttkwnTWAEYiXNFgTrwyiXMwf2lHBNQOsw8Ic2?=
 =?us-ascii?Q?CE6lLXjaz2DjM/EofOcaPgQYWznYhVbojxfSVGEusMArxo+ANNOaaU9qozAe?=
 =?us-ascii?Q?cOB0D8Lr09fuaii6r0vbs6OI+toXFOCvTwM+C94edN54cZ2cJrHHeriIcg86?=
 =?us-ascii?Q?j50rvTXSd/NJT97Rkv+J/EzQwaTtNthjoLLQHog5JItnDqD/fBQpaZAGp6l1?=
 =?us-ascii?Q?gbnbBo/v1lgFxBEqjlOumf90FfPuUQBJscWJJ3Ma8bnoRWxXSdJn6m4hoEDl?=
 =?us-ascii?Q?1HDZ8ebdyxAC5fY/Frqk1OibLFryPWujnvdOPxbKb2i20rPQYd0g0/vdZRo1?=
 =?us-ascii?Q?ynhlJNr3x5QAzpZ5BkP2vseGWfKdWoRuomVtaaZOqgi3Zh7gRuxxy4t8Ti4p?=
 =?us-ascii?Q?Hv6IXdTbM4xwgefnm5LG8FhKSMJb+CjAKjYNKNnW0sMPMjwdmFqT6BAMKr/s?=
 =?us-ascii?Q?Eaeex4giSncdowDXAdmk8cxHmd9aglAkIlRa7m5kWRIP8Jo0MebfRkXvCHQF?=
 =?us-ascii?Q?QkSeknxk+diBpSUB0BYsY+Tg6CzZYcR9AU032y7/Dcidq0QJxohJEeBg+63J?=
 =?us-ascii?Q?OeoaxMNhweZUXN2WbuFeoUVTg3izhQo8xZfipfBF3PSpIOWNTQjdoJmUL899?=
 =?us-ascii?Q?yIhIaAs7iC209vWu8H8bnRJr6Uny/YJ8zfC0fDJL/701Ouon8bs1VTwClmaN?=
 =?us-ascii?Q?mK2iaOA8w8+P/9tATTBByNn3eymfGJqMqFGQgtmaqt6oJu1ngKM4a/gxSjUQ?=
 =?us-ascii?Q?qynXW+7gQJt5alEpc4mHNOOF8iPG2AUpyPEOtV1HbQRNP8nkXsP2x8QiP9Wd?=
 =?us-ascii?Q?s5y0XRlOtD5abS4Z4sE6xeew2W0gaMmgXPKC6/rLiN+HjaB3cAZ+qHKpL4mS?=
 =?us-ascii?Q?0XzD0ctUa8G5x2nuVj/6O0gVZ5Ug11k/OUO0Y+qrSykGAlWNU73O520K9nyz?=
 =?us-ascii?Q?DKPfwYQMQ6EUCr8tbZDQraxyntTvc2drnYZ7pUn3MUaLiB21bPaqVFGcYxfM?=
 =?us-ascii?Q?WG9W85OHcKDdt/aVp4/uaFKeRKBJi8H7H5rAZaeDYghAYF+t9f7b8RW0hybt?=
 =?us-ascii?Q?5ULUBnemvQ3AN7tlHtSz98bIRErFBr1gCS4BhPWKTQ1wbxRf+vhfaDOWG6ri?=
 =?us-ascii?Q?crP2tanPP6Xknx2Rsl7IATTlj2V+KvvBUeoRty6PezYuH2hGdU3AXKOnVcVG?=
 =?us-ascii?Q?stYaWEo69oOnbHK/8ZAjhE2/waBboYQ75wMzV+kbpT0rsotCVzKgWkgrYR5W?=
 =?us-ascii?Q?BppRa29CQTsaKztJauZ3/41tk3X1S16kN4Z9VHr+Zqnb3RGtFsO9KSle3Ui0?=
 =?us-ascii?Q?GgUwbKKhI3/BVs+P5ghK1OmJOPsFlSKdM66qql8kkXKPYoQKHq9AeIOpR+CV?=
 =?us-ascii?Q?99yjtWih2YaokzMxNt/TLrjCfop/Y26h56sA8bwIEk/FthJ8dZHyW4h2+Gns?=
 =?us-ascii?Q?IBxd4ZXSo9MZU0oxOwTbPliymhJBHY0h4osCy1V4RJX3sPf5ZcZ0Hr2+qoQj?=
 =?us-ascii?Q?8LszgPGGbKWLr8yZO2uxYIbAuF8p3h7hUQoAYHSzQmDsmj9jH+Kp4OzRVQdK?=
 =?us-ascii?Q?pITc4D4Q35xjAtgxnnrU7eWFodCk/d8RrKgoP5d05bZxG8p6+8YPWmb71vrS?=
 =?us-ascii?Q?+g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef43359-25dc-4e89-0ff4-08dab5b9dca5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 12:18:30.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClXVmU+7MGdplo7bh605e7vps4CQVLmIdx6qj2jMsR2ENJ1Fp98NCyA1ag6JipNsXwT1o+4Lq583OanJtyxMG6HirRs7pRqyYaraUJSWGtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6625
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_03,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210240076
X-Proofpoint-GUID: AFcwXv4b50ilt5neTKSM0zlp8XccQIPq
X-Proofpoint-ORIG-GUID: AFcwXv4b50ilt5neTKSM0zlp8XccQIPq
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

It looks like there are a potential out of bounds accesses in the
read/write() functions.  Also can "len" be negative?  Let's check for
that too.

Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This came from static analysis, but then I couldn't figure out the next
day if it was actually required or not so we dropped it.  But then
ChiYuan Huang did some testing and it was required.

There was some debate around various style questions but honestly I'm
pretty happy with the style the way I wrote it.  I've written a long
blog on why "unsigned int" is good at the user space boundary but should
not be the default choice as a stack variable.

https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/

The other style issue was wether to use ARRAY_SIZE() or MT6370_MAX_I2C
and I just think ARRAY_SIZE() is more obvious to the reader.

 drivers/mfd/mt6370.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
index cf19cce2fdc0..fd5e1d6a0272 100644
--- a/drivers/mfd/mt6370.c
+++ b/drivers/mfd/mt6370.c
@@ -190,6 +190,9 @@ static int mt6370_regmap_read(void *context, const void *reg_buf,
 	bank_idx = u8_buf[0];
 	bank_addr = u8_buf[1];
 
+	if (bank_idx >= ARRAY_SIZE(info->i2c))
+		return -EINVAL;
+
 	ret = i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_addr,
 					    val_size, val_buf);
 	if (ret < 0)
@@ -211,6 +214,9 @@ static int mt6370_regmap_write(void *context, const void *data, size_t count)
 	bank_idx = u8_buf[0];
 	bank_addr = u8_buf[1];
 
+	if (len < 0 || bank_idx >= ARRAY_SIZE(info->i2c))
+		return -EINVAL;
+
 	return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_addr,
 					      len, data + MT6370_MAX_ADDRLEN);
 }
-- 
2.35.1
