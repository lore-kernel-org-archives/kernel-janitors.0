Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC54C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jan 2022 11:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352804AbiALLSF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 Jan 2022 06:18:05 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4290 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1352796AbiALLSE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Jan 2022 06:18:04 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CADuZ0009456;
        Wed, 12 Jan 2022 11:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=H84/ey5C2YutgTCIqff466C/8hMZPqoaIpzexTbC9Xo=;
 b=PzTuJb24KG4Nr+Cj7c4u587FEFPvDPEDbxrOk407D74YTytEFghJfnCLlc6AJEBy9Vmu
 tiQ+UUr81VBL5leUTP+9kE3rR69CjzjxVm4vtjoRFWzhW4c7qs/61DOYwvmJxcsnblj/
 Pmd8OjmlwjpVjBX1ABFqe1TynkLUPGM/WNstQS9SU4iw1bdmR15zcchyXKd86ykYByBc
 jkpO1sE1Pyx4oOXbceJZbz8u0NYXmn3qJkwJhkIk+VjUUO0alr6BMg5M2kSuz+fs2NH0
 U7maPEJvykCr99k3jbdP8fCUYGt2oxonQCx+wzAEOS50Kyb3CE4/OuBhZl3WLhIFnOCe uw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dgn74dt00-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Jan 2022 11:17:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20CBGCs8024842;
        Wed, 12 Jan 2022 11:17:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
        by userp3030.oracle.com with ESMTP id 3deyqyrcje-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 Jan 2022 11:17:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdbAUm8zCtUbJRZSR9RoSlRGp+vN1Vb5on2hgxgjdJ3ZXPZmvenzFiFvP0bxYYlAyX6X3fonORHRvwHqeD8VCWny5POLrDu4r36cwoB4IongXxWn7Jf4qoQdfPOsTIt38ya+7WFG0ZIcfjipk+Rgq/FT/S21plts/RcaUxNqZ6X4GUes7RV16rj54F9eGyzkmdZuyta7HYuZC96H+6WvsfRWuQhLf2Xx53YDRi6y6Phyu51Ts1MrXRPh9e8ewye/SKZqkKcU/rnT/x4NEQLdhfC1J1mqyqBwFfrPXqUkHAX2D8JNZeyUOxQQfa+1B/qi4BHd9zw9hDxGfnlUH0ZKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H84/ey5C2YutgTCIqff466C/8hMZPqoaIpzexTbC9Xo=;
 b=XBmAvECL4351FD4zzKmwrznMZr5seaaLgeIEMyQhSaNab3enH89LlGBMoz/3FKsT9XdO14Kzv4/UhJspAjqUxFGAIdiYhYAcSWZBbpPO14Bxjrdh25WrraD5PG0JlQsJyemZ3WXmxpWdTPhXqt257axVPpf7UxrFcHd4s15U8x+RsEMesBIto9mVgfZ03ju5gSwDN6LaV6pjtW7NtnZV/htCSta7iQ03bdMF6WTHfujmqjiaYXmFxp1v6xw7EMrAgRy+lJl69I4KlYhQe6XpRszf1sf/WK6Y127cltt7DKpefevZriZkuF708t5RLZd3e9Z1KmkStM9ePWHov5r9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H84/ey5C2YutgTCIqff466C/8hMZPqoaIpzexTbC9Xo=;
 b=QJszcSt4HlcLLamz9sNLsYKUQLvaflbpea99nzjvZc7dvFA62wjv2vNFiOC6MtwJ5SkXIBWqO33eAnGp60izA6oaQi10P9EettHcYBWr0qeVE58AWwwsANdiiUFElcxqHO/r/5uJV7CgqXFXl2ZLC/ca5gOhoOwbOv31sUh6Ixg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1550.namprd10.prod.outlook.com
 (2603:10b6:300:25::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 12 Jan
 2022 11:17:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b889:5c86:23c0:82b8%4]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 11:17:36 +0000
Date:   Wed, 12 Jan 2022 14:17:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: stm32: fix a refcount leak in stm32_usbphyc_pll_enable()
Message-ID: <20220112111724.GB3019@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c941a197-4e23-45fd-699c-08d9d5bd22e6
X-MS-TrafficTypeDiagnostic: MWHPR10MB1550:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB15507E7E4582B56A9A2B4E868E529@MWHPR10MB1550.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymRWvFe44+WwVTIU1H7ScC4cVXmvocmnkQXBYlN9anGTbGumwSxaJIcLgkzn8x+6zyitY09ovdwNMN1UFun7x6UoERUOIhJF5bV/jA0/0Pfn/EOyVpxaX1XpAy8aPNkxXmNSzPCteWvalk2YkHjQL2vQMT69xGi00bUaR6XKENlvu0nuebRYcjHAYCCl7nQzLzvhnQbwlhmGENwGaakSGG6QzKAcW5TvGCVwRyUpVWC6PwMeA81UNwjaQjTwkE/MhLm9LXV9fwZbe6XfXVF2jv/mC4AGMwGO3rsATtexesKZp/J3Zg6MHmWq4YEOpWF8yt5BAZva1RziSuyolm+SUg8mhp1pTbETl6cn2HaJdibP162U3yQRsEmNjpCaTqMfZKH3U3v4FE3hFr+XZdvfCsmo7YzzyLTLY8yhQa2voOy6m/Uw6AV16ZFnIXXjudYDS9q2VFwdW93Klj9JCDqqTyx631V+R50DRouzgWcIJ6wI8vTiGBpfmw3TnUKaKCBYwbg6ZrPDupcAPhO9OcjqxH2zIZOYyxEnG6YZJ3ejEJIXNiyBt3rbjNMO4d+Iw+3IACS17AkpPrPdl25PJtIafhGZn0ee32BD2HhBAXPQL3hasZepCRwj3yoH8Z0okepnm1TLJrHjgMm7Mqavub0orgxxsM2LBDk8MuVcz0qQWUN4gUlHuIiSau+lyLc0P0+Yh9zRgX1YbAadaLfGNWWEWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(26005)(6506007)(6486002)(66556008)(66476007)(38100700002)(186003)(7416002)(8936002)(8676002)(4744005)(508600001)(52116002)(38350700002)(5660300002)(54906003)(110136005)(316002)(4326008)(2906002)(44832011)(6512007)(9686003)(66946007)(83380400001)(1076003)(33656002)(86362001)(6666004)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+1nWrfPx7WEhNzogZrdCiW2UMtq6PLyR6A5vjQ7KGxIJDj/P7WvOkZKaROmT?=
 =?us-ascii?Q?XJ0taNuCfmY2KP5dACpACG9p+kAiejskVr+CMK31bXOigZFEBxCSJvTI3Gae?=
 =?us-ascii?Q?64f5zgNVbWSsiGI+XNfQs1lp8ESvmDGjTebl/S68oeGgopas5gbqWBef1jyE?=
 =?us-ascii?Q?mkzpi5zZxquIJfl5tf1BUTKmMox/85ay1dgegYWjsCXOJcydk1FcO21kcA1R?=
 =?us-ascii?Q?OzJHrTCqmcCZXGf5nM9vMBqzEPafE4DRW5ba6NX9J1I3fGNH1R/S+sWqrkGa?=
 =?us-ascii?Q?ze6Pr9gDIeUDYbAMfJhaAtziokpeMAkLrbRrP31r+h8sRuxdjHKLEqieWpEm?=
 =?us-ascii?Q?FyXR7ZTEZkBWQFMzzv8RpfUToF/v/QHwij6ENO1OP0gznplGP/a266541fyo?=
 =?us-ascii?Q?lHpoQTvNuDQ0zaAQPcsAYX7wOnSDvwl6AKf1lUyKmlJqwH0yNAA7KQja4tCs?=
 =?us-ascii?Q?G1sNzBidqbuE5x6L3Loy9aM6+mSFRGjkwg2tPIimkb62r9hrpWu/YyqRLOgE?=
 =?us-ascii?Q?7E8xVwM+CcOlCryN/2cCdNDewHvAjEw4uWvUeQSPMdAAbkT+U9YZUYMtPuaZ?=
 =?us-ascii?Q?ft4u/0SRvIaQ7FMsLqkmzqglBGlf+xXCEMXf9vNF5pMrqHSfeuWj8hZYtLwN?=
 =?us-ascii?Q?+/i2zGslPFAqI5v3SCK8j1TmmRh69eDrLjxlBcqgX9FxKy9SHWlz4McBvcy2?=
 =?us-ascii?Q?IUferlqljvKoieZJLCcqguSbb1WtKsWFCAt+5E6XIi6AnkjADPLDVlE+MlC9?=
 =?us-ascii?Q?jiIWkBrgDCxwxn7j5t/PU2aSY4AuYPBkxfjzbuN8CVRRTpZ1rRB6UGuiz5Sl?=
 =?us-ascii?Q?g0gE7oOj20rcxbcmqY6uqvR6QES9vlJflX6ynJo2LO47j1Gb4ObbrFm5Wzus?=
 =?us-ascii?Q?0QE2kCDkkDiJjxmiBi8zsUvFAMK5r475i8ko+AFvdXHHZfCOSr5WFoEL0oDR?=
 =?us-ascii?Q?7oz0a9+ZnkgasMC3ZqqM2QhFoxVpmD3I1oNkuV6VMJ/hnBtykAsI0QplpOYs?=
 =?us-ascii?Q?5RWqhKBZjRmpym85rOBpx/iTI1HEJwvMyozwXlT937YupsMELKBhYYBjEt3j?=
 =?us-ascii?Q?+UKKtalyPF94pQOq4p6KMuX+Mu8SVzhiMHL2c8bN00igMSXcHGJu0mqBzSzh?=
 =?us-ascii?Q?4udDknTH3zfjkiK+VE66UKe/YBPTDU5NJfnfHfCTk8WnDqi+C8gYWYffOJ8I?=
 =?us-ascii?Q?cL9/uPs+LqvJ7TmcRwhCsunsjCEBytwW7jpEN/gBufs3pqBa8lHxlasPH8VY?=
 =?us-ascii?Q?+UcjH+OOFK78fVfzce5Pf7lL81z9wXt0IvBT0XWFXI75Tc6SwoIi2f62bWTd?=
 =?us-ascii?Q?CEz+6//3jY1yi9RYVxHtZtb8/jue75b7dvCBaObjwc6k56FB8K+EK9ATSbO1?=
 =?us-ascii?Q?jagoECO3xjaG21Hcz8qnDTbvkDz5ouCnycLOhfc+lCL5785YQoAiEneAGhp8?=
 =?us-ascii?Q?UMGlfgrITU4OvUpmexlvDXDZ6NTtZP/S+9vd83Oczm6eoNbEeFR/Pphmhg8I?=
 =?us-ascii?Q?D7+KDVF4dgFEXu6HS9ngS124H09QiOEyIiscAQthqzrTPC5EKd/w7GRst1lu?=
 =?us-ascii?Q?mBUkG+ATtFmdCyIhytnGlzD1EVAVkPkA6lUc8otRlXKruCy73g84j/kcdx3i?=
 =?us-ascii?Q?4PVXfGVH1nCTDKlqkvRnppJtJbqvUg7WVWp2ZUT7NtqtmuaFlR/XqteaRMZi?=
 =?us-ascii?Q?Kd5rSB7ilkfXzGMk3L7iJOtlFo0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c941a197-4e23-45fd-699c-08d9d5bd22e6
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 11:17:36.1790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1/kohLsC1BqONdaf+t7gqsGDqQ9ZofOVIZ58KjEuJ+kvIzs7NeAc/TL25BL6zMJi8WYp1vCJfPizjpjOrxOEQCtro7asAq/eoe4ebBadmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1550
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120074
X-Proofpoint-ORIG-GUID: -idx8__eUtUrkwWijI2_qAUeqH9YSLfG
X-Proofpoint-GUID: -idx8__eUtUrkwWijI2_qAUeqH9YSLfG
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This error path needs to decrement "usbphyc->n_pll_cons.counter" before
returning.

Fixes: 5b1af71280ab ("phy: stm32: rework PLL Lock detection")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 2ce9bfd783d4..007a23c78d56 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -304,7 +304,7 @@ static int stm32_usbphyc_pll_enable(struct stm32_usbphyc *usbphyc)
 
 		ret = __stm32_usbphyc_pll_disable(usbphyc);
 		if (ret)
-			return ret;
+			goto dec_n_pll_cons;
 	}
 
 	ret = stm32_usbphyc_regulators_enable(usbphyc);
-- 
2.20.1

