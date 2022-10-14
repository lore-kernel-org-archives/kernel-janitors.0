Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611EFC4332F
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Oct 2022 09:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiJNJZx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Oct 2022 05:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiJNJZw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Oct 2022 05:25:52 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2683D4A09
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Oct 2022 02:25:49 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E8YriI028241;
        Fri, 14 Oct 2022 09:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=u3ZNqRHmLgFeef4loJ3XPFpW0SyOlDX/XSsqF2UdPxg=;
 b=DeDE9bqBdstSRv/a781XAb/UQvVN9lBnrQ2W4Sxtdou/xg2h6he3f2qkX1OeC6ipfVwX
 i0Co+zMsIicmQiex1Lz+H5m3rgBexzvHPfHEA9Iq1OHjMSyk4rQs22TKv14mQfe0lpTA
 mgHatTOVGNITxABq2OyXU6ushcB3cUZqt97/oIoIx261htyVmDjfRuGZ2T1QsgUd/tNe
 1a7cRb6UubehLuyP/LdixYPzhnoOepvtl2pk3kt1MZcDmesOnvLLuMzcV3HVVx+GddOj
 C03k/v+nsuXhRAzUoj/Zm01yBOpcng86AObMU4tJS3Zt2iHguLTXdb4AQIHwnN+yRZ0U dw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k73ncr817-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 09:25:18 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 29E70alt020891;
        Fri, 14 Oct 2022 09:25:17 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3k2yn6shap-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 14 Oct 2022 09:25:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghkGcNJ/8jZ+Tx7L/ag6KXLsaJJP+LpuFB7BTLBxZHrrnEvt3/aD8FjgUWC2uHvwRZvL27NBOY4Rxl+M+bTp2KJdTpAkUirzeYC/oADDs0Nva08TJ4FdzG0al38uRC/91+69C/TjafzKNNjYzHcgFk9CN01TB6f9QMJdoXYcwyQKfJbkejK/8WCpQx3qSv0tKJe4ZGftnL67O1CjO3KqnQUeT2YBhGnZa2Lcfhyp/ibLiRCkPf9CNJu7vD3gf2DmqcMa71WpUAucv0dri0dPVALdQ8bQZI1h5QUUaMdzGnFOWZmMgzQkJQq11CMsVENhO56tOFv+V1erRbUcT6YyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3ZNqRHmLgFeef4loJ3XPFpW0SyOlDX/XSsqF2UdPxg=;
 b=KTeXbkje4AuDNMHoq3L/R15VyDnDLR/sVkCox7XL/Ywbo/Lek5HXGqu9Bk4JbuOZRNlUGMaeiupIjUwtbSbBEDPxjjrPEeOOg9ecSNzndOHT+s+aW66DqBGgaiUY7H4QcHKv0u7Z2QoOAMtHw7AS12CC+mDGNlVsGoLB4Aw4C4/2i0ipxaxS7UwMzFS31l5R/LJauaHlHrrWIAj0/xrmYyGX9ABuvDqWllsOyQvb+1kq7Ijpd0E+3w9h23nXL1ld614iOrwrY41sdlO85aUkWiqjiTG/mM5eRqdJwaTQD6uWtKoJ2Z8vXbdUDRf+e6vvBqH1a3yiX5KV7RtlVa/4rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3ZNqRHmLgFeef4loJ3XPFpW0SyOlDX/XSsqF2UdPxg=;
 b=IkrKupaLNYE2+2Im/E9pfqqg3+vJo6EFls1qT72wHP+aGFbhr+ignBtGfDgAbnWJTLHNcVi/XKlVLM/kCicjLT+5JM/3Eq+10SzIrg6reoQexUZ89QgHEpy9pNWVMGKzid8IcT6491sQ+qEBL5b3T/pWLRa5udKppHFmd2sZPdo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5568.namprd10.prod.outlook.com
 (2603:10b6:a03:3d3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 14 Oct
 2022 09:25:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Fri, 14 Oct 2022
 09:25:15 +0000
Date:   Fri, 14 Oct 2022 12:25:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: stm32: fix an error code in probe
Message-ID: <Y0kq8j6S+5nDdMpr@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0173.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|SJ0PR10MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: 688b6eaf-9efe-4451-2f34-08daadc60060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2dMuGJxidbeNUGMWDf+PHPLEcgMJGMH+AyT1EmOLxF3czopKIuogK8o9FVgqGvfta2PlHpvgZ95GKdMqp6NT0XUKK3N87CM0PAdkOWv6x4pAtRAA89pMAhxMws7bUUSsRgn8cZ0Ds5GJI3MpIbHjOXZxYWzUTF+S7V9WcHk36B9Asi+YK12e66spLn+LRzm4o174l4mrotC3yTVgX4dXPURp6ax3ahHBdemo0W4b1/XwOmHiyLtB7tfKUleZct88uryFnUPI2sdCXFoQzM9IiHT5CaFVeK88L2em14oN7J2Vm74YN34++Jeeicc7SGdnbawspMmUGZTGN0JQroD150B0bMj1uQekwsDXKK7rhAqJs8ITFtqBoZ5HDDMa2xF0o/DatWk/yxfdeYFwDfmFSLuNnMJNXonYDDc8SlzMvbrqhZ+gCgSE4lP0/iCcKOsMrTuLqytCEVNsldu2VJg2QX/3lItysFEh32Ud65Ca1Op7bsW+QTp2oa+nGdtCOTfQN0SpRrR6mWJ0zwBtjlZgtXVDgJgPBUuPmeYXdwEGdXLQFBy/ZLohDxBPC5p2GkaPM+99+qGehhUz/E9W5CTpVvjCt1MyM5e3bW7hSeN6TUafUXjktvSK5fNX7qcpfmvN4Q8djFAVSbijXmgSQZo32Y+U7Juz06Zk4ZMKdQR6aM+tHZRM+srDGxA3CgaiNRsFBn7jKIcyBylAaQsr1HFbcn41mHjZQOCpF1WPrE5JbsjtgrpLo3LcBePV+BaBrNM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199015)(4326008)(41300700001)(66946007)(66556008)(5660300002)(66476007)(44832011)(8676002)(186003)(4744005)(9686003)(8936002)(6512007)(26005)(6666004)(33716001)(478600001)(2906002)(6506007)(6486002)(38100700002)(54906003)(316002)(86362001)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vs+6JPC+gay69h/nV+uYAU2cGic6Uo9odcjJ1850QU7zxxGd447CQbk2Daev?=
 =?us-ascii?Q?1+zNRujt6wrHySl6hPPr4yXn5fnD1UC1yKOwoNLY98QVjvpjbmPo5/zE/ZNy?=
 =?us-ascii?Q?NBYbJw7L8jEFkjrzO+5iTRVmSftANitUdyxtCr6KDOeEmdIooKMYutNvAiuP?=
 =?us-ascii?Q?IssFkoO9oaFvPuj4+hVw0Lg1Xp3+81y+xSiwIB0yHXKNlwz5GSRkJOgoK356?=
 =?us-ascii?Q?geRPyo+97FuTsZ+OaI2OQk6Ab4cgS0koJgO2f9PGVWFLKOMhRv5tIatfclKw?=
 =?us-ascii?Q?BeUXfRNHu+Gyxg3vkbe+D7fmmQLxWwWCR0HVUtji8BEUUyKmnSouptGvygw3?=
 =?us-ascii?Q?kiPHXSnhYryKKc+zKj0qyEMQOW3fmRLlpcIb8+5ZGVdclMKoJc5KKc53Cw8y?=
 =?us-ascii?Q?6/e9gXNmltw4YDV8UHos+C70CAibIBkpvsrkkgv6mkASeO+Ja05QiuPmN7/E?=
 =?us-ascii?Q?MT2FZeI58pUiARyNWfe9flgl+dwdu9LkK0NNqvyBeBqB90CQsTrsP0mWvheQ?=
 =?us-ascii?Q?eNIBDCNSNXY9WYeDdFUHWciNSswCdF8RnYNms/4OB0RjT03W9XjNqS2ql3N9?=
 =?us-ascii?Q?CEn0DCU/lm+XqOu+PaWTnMV+7MWtvTe9DYyws6ybCY/nN0F8LWbrB3ATZVhf?=
 =?us-ascii?Q?5RaWpH5QGvHlshkrmASbLl/NYssRsjhEtYlIyzvnl7mAamwbXwLc29QgRfKr?=
 =?us-ascii?Q?qNNIK7VU8C5eAuA8CAMWM4rsRk6Y+E6hduBkHGQRNycLvNwSSH0dobAwre88?=
 =?us-ascii?Q?fL9bcezPQ1zvtKq+DImaM47gkJX+byDdx3kebk/roQC18kkNtakIo8GtaoYZ?=
 =?us-ascii?Q?JnjYclwyJmO9eZLgW7H95DulDfC5mDKlw9s5WykKEr6J+bz5FTbJl4drGJmJ?=
 =?us-ascii?Q?gN6LuPRtv4tK0J5WTIRvwvWrJS8KWGoKXU8rG9kBD5/iP7mzB3p+SV/2ruGi?=
 =?us-ascii?Q?Hu59DTpcppBjzw8m3F143TNFDM1otSPkvQ+dHYVKOnAMyRnZQgPvrFgwcZuf?=
 =?us-ascii?Q?jIpcsk8g6RUetKILbjw6UqNmAL+fTC99Wm5wC46JBcUtFWoKU+Bhbgx2foIw?=
 =?us-ascii?Q?KDcI1o/gtsby3RS4eQAzeA/tCWELt6d2PTa5+s8cdTAHNVY+L1NTpkKkBMt1?=
 =?us-ascii?Q?gMn+qNL28ZJo3jJbUe3KpvwY8i9m12F+UOIa1t2h9UrcnIMkMJTfQPTSTqNn?=
 =?us-ascii?Q?da1yU3gD6tLodHTqmkQapDi0PHXe3m+MH2x8ZF9RoEH+ZS6H4TC5qRIHJQef?=
 =?us-ascii?Q?XoMfSIsF8RQqezgnxvDZE+FGI13GFfzPAJ0GBX2Dq26XT5n/a6t4yAm7aEWZ?=
 =?us-ascii?Q?4Xs2hXp2wFbTIiX9ZJKnhyuUtbNQJXS6Vc2eBKX/qD4bFTnu5oUSaI2N/FCt?=
 =?us-ascii?Q?yrq7Zw7GA+EvJHL9174I37aVMuhAU1zCCXyg1HLxUMuJgXgYC2m9gLM9NkJ/?=
 =?us-ascii?Q?LWOHoHvmV70fDVBs1UzLD522yNmSZrFKnBG0BBxEVE2Eeb/+2by9ViCFaP/l?=
 =?us-ascii?Q?XecLDHUYoOvTNXTYc+9NkjNYKVP9pO8h9SQq1BESyUftIdR9dKrTzqVagIC/?=
 =?us-ascii?Q?gCIPXX2P6Z5Qu/FSYvXH2cVI+6YX84BrDKhIa/2WIsm/ri5uz+mie7m1Q5JJ?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 688b6eaf-9efe-4451-2f34-08daadc60060
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:25:14.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWaJdkmho3Blbcy8UmKluXSXQ8fST52O8qKV/plxJKDVh4CP9mOjhwz6ZbbEIrIPvRti1194k+B8rJBJ7RDNTXAP8ysBCdLE/Qbj9zR0Nlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5568
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_05,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140053
X-Proofpoint-GUID: zH_Cx_hDjspPwyYWSinCaAmRv1pxvXb6
X-Proofpoint-ORIG-GUID: zH_Cx_hDjspPwyYWSinCaAmRv1pxvXb6
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If "index > usbphyc->nphys" is true then this returns success but it
should return -EINVAL.

Fixes: 94c358da3a05 ("phy: stm32: add support for STM32 USB PHY Controller (USBPHYC)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index a98c911cc37a..5bb9647b078f 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -710,6 +710,8 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		ret = of_property_read_u32(child, "reg", &index);
 		if (ret || index > usbphyc->nphys) {
 			dev_err(&phy->dev, "invalid reg property: %d\n", ret);
+			if (!ret)
+				ret = -EINVAL;
 			goto put_child;
 		}
 
-- 
2.35.1

