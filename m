Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAB2C54EE9
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Sep 2022 11:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiIVLVj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Sep 2022 07:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiIVLVi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Sep 2022 07:21:38 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A851F61C
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Sep 2022 04:21:36 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MAO2tm019801;
        Thu, 22 Sep 2022 11:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=3Fvz8RAsUdbigcTVPPS0xIu7xN8RoT7i217E/aWqaZY=;
 b=ITwpbIxCAfk0ghlCwtaNxJkyBYKD5btgf889DdfZ2lTJMP0XziGetu9BThO4d5Ds5Ue3
 l/2ma2cREnEK+OrDYl+VHk43+4Ik2jPcfucSg+VdfxhKxEJaXAlDnsopIhm4Kw1On3hH
 7QoF28B8S/PtFRPNvnmcgNGCh58igiyTeON8G1lj3KpuBiHYMmxvJSiRzXhxceeYL9qp
 YE5N0DHvWUQxxonbXAjDHBIFjeUWgpXP4ozRqh8n69U1VBzYbCQl4OORtie0EGNC2Kch
 ZCp8jRgYhtGWf83fp8UT02wGlDBHbTYb3h2WntFiyC9B7s7JBljwZuJLAgZMKcwvro5P og== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn688mnq1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Sep 2022 11:21:19 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28MBKrNM005638;
        Thu, 22 Sep 2022 11:21:18 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jp3cqfxdr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Sep 2022 11:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pi8i2HM6U24BzCgYfETgThMe3SWAn1fMABotzruPp2xNdPWig75sIuO+BApWpm6Ouh2jql89n9l3v4HG6h31yk8Rr2nVQ6tv4dp1T+D1lwRshXedrKUhOUzbUE9Xt4l4oDUMSZgiu9cn+tuy+L0wlHFPJvZ/J5wT2c2pp9Gk6LoxIKaPyyJTmMpsZIwwoCKF4FkYLZsowvzNPJqgGU7OM2SaiuMFjWbWgUvZ2tIVRMREHTRXgU21U/TY5o4k+n3sjDlODBKg9Jaq2/NHf9VJiNz9y/vrwjLYjtJpOLPgncwqm9AZ3IamjRALZaWJih//Q/ExWTSiT5FYFA5ouCWr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Fvz8RAsUdbigcTVPPS0xIu7xN8RoT7i217E/aWqaZY=;
 b=AQmNPt2uUp+FL4pxqA3QjTkKzVmiWiqRkkxB3CNia1/yE69BJ5aCiIFR9JFwxLBcAhBMM/tajrQZ281t9dVb1UgFsEEE6MsRtP6zdkFV1r54RUUhgdk9XJnpjwWXTBNvNcivXHwMJE/OdItEpT+65GSsM06Q782hHquqCF0wToMt+TPNx0vVmvuGFwcMeEM3JzRL4Iz3k4hYgmrCj1bl0RGiF0mk07SzfYs3yotV58B7mP99gXMcrW2GNXOmm0NLE0dPrqWuQStAfgzsmGPRmnekEiFgSqiUo7Qk4ejqTg2QSiaIRRCW5ZJqKh58Wrz8tpbN1WuzEFZ3JgukfbqSUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Fvz8RAsUdbigcTVPPS0xIu7xN8RoT7i217E/aWqaZY=;
 b=vFlbzuxw09q0DaDzpbGP2C8EtdRuxMJW8LGHSavMUBFSCvfMZ9tKOO6BosrNve3a0SlZlEqKL/FH17f5lcyFbsxqxejNViPFuzVQlvYAtYIi1CoojfBD8CWxWvlRbuidQLw7GHWGDTqtk+FW/yYExfELwrIk5uDSz/adQXO1k+s=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB4741.namprd10.prod.outlook.com
 (2603:10b6:510:3d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 11:21:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5654.019; Thu, 22 Sep 2022
 11:21:16 +0000
Date:   Thu, 22 Sep 2022 14:21:07 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Roger Quadros <rogerq@kernel.org>, Jyri Sarha <jsarha@ti.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Tanmay Patil <t-patil@ti.com>, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: ti: phy-j721e-wiz: fix reference leaks in wiz_probe()
Message-ID: <YyxFI8aW23IC/21U@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH0PR10MB4741:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b019f27-a361-49a8-a89e-08da9c8c9033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qcIhlm52cjJ7HzWmsJoRXdzNqtY06teQmGs73KrBMBFQcZHCQv3KSdByaUNmMmUoGUDaUbyfAg8oeWfinFrmYERdEaYzyihPThR2swlybImacFv+5s79jg1N738+Ts2CMPO+kK1cUOhdspgKlZx9WGudle2q1xBGDBCM9ZHc821GHYr7GKwyuprcn8wD1hCPZNrAP+jNxwUuZOW7ISP0qDplvhr720Fy09iu2mHf9cjSodecYduLBUwC9Dh7lUirE6fxyNery0IcvmrbrDfq+TzRmMnoB8gmQNOmlOdUrPzenTE/mUn0m/NtjclsVJJUdV2lKbKwbZPtqQ0wlu8VViFfdAClDvhdpdy/heAIUXqNLpveoHwSHKxS5onYpitkNuocnw528JJW39mfFB4LqQgjDHpuxz7w0BB23ZrFG3oXMZpFGdrWcEEQ4gtlEpwbrY9XFpI3Kkn3kS/wWvCtADyaDa2Z/r4cB+8/CSkfx3i3i6KBb2vNy2bx5JuMg3QvzZx+/Nav87TkeBDZOISa4UiCnYx74Eaa8ufgNjoYCl2Gpfs2TCKGRUxpy1zGh5gugdcKqEGC/T6Q5fD+hEyQYlv5+7nRm5xGpILL1IccQqyRJlOPwfskPPTz2HZFaTBrfDKatYKNYsKG2XGM2YNy6CHOelMpPmQUPLpok3txdeViZmJdhne6hwB2Y/PrCCT3oSDowyYGec0aS6mYX/P9mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199015)(8676002)(186003)(41300700001)(86362001)(6486002)(2906002)(44832011)(38100700002)(478600001)(5660300002)(6666004)(9686003)(4326008)(26005)(66946007)(110136005)(33716001)(316002)(83380400001)(6512007)(6506007)(54906003)(66476007)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XdNXhWi9+4faENDKOI0mrvw2fDrOiKf4mcsPjOKwWQwWYUNiUB3anL3uC0FG?=
 =?us-ascii?Q?0508ZmVXztFFWdoV4Jsv74pXzaogIiHmGfVSVds3TKk5M4JbOMDMLbvAnJQj?=
 =?us-ascii?Q?Og5BCAaV4FNz3JM/rYvHjvvmgz7mOUlBcuTLGpIhYJZ308SPwz0Pagy7R/VO?=
 =?us-ascii?Q?IdhmWAJmrLaJfSS8mNc9nU4G8F4e9dnGptEjCE04FzFZ5liorYz+Of29NeCZ?=
 =?us-ascii?Q?EBlSX5i4bll5eRqZP8hbfos2/cm9NjCzs7jSG4DBfeHVF0hajIiXvUW07IZp?=
 =?us-ascii?Q?AhVczx7baRtaBSCBOmtAsjtyaMwt/QVU7BRHZePEcqhV7hO67h9a5GZ+ea3q?=
 =?us-ascii?Q?eTYckkqhs891lLS5/yFhJ6fqR/WSd75SJ82oelzPz4CACW/2gdGDTyYU0YE1?=
 =?us-ascii?Q?nRwG4/6+5inG9C94/4LQJ5OdEQq3FHqEsVQ/H2B74aaZHUdzO0XXapah/8uE?=
 =?us-ascii?Q?a5AwKDNIrLRBjbBvAoZtZJXfpRzmQlIFd/L4Gxl1JK989Ux++rVhMSIpTpg3?=
 =?us-ascii?Q?YSHtGFn+wMgbA9mApJqoGyArvrXyd2ism5MWpC+qQPNqWGFTJ9hoOJ3nubgm?=
 =?us-ascii?Q?xZWWfxLzS0SIcKLjH35BAzFgUyBUtkn6mVwEmfdpJhX5uKvohdt+SyGjDQ7B?=
 =?us-ascii?Q?IuXf4/ARsy+9A15uA8VmYsuOzCJL2h4+FmmSY3/On8FM21tSoY8xzzT15/Xt?=
 =?us-ascii?Q?bHCk2AsJTax7P61GoiXn0bbAh21DUYpDxUoEFxWDje5MEOyy5ZN/os5eGsDn?=
 =?us-ascii?Q?IKfN4AlaC4HTO+bRPFVPtRAtA9BrkkwhhxOBiHwFJKKnaiRALBC8YPplQcFR?=
 =?us-ascii?Q?hkszvQFjSm7Lz86VimdBFdIq300gLv1Fs0B045ngoWQXqi6ra7uBCmcFMXk6?=
 =?us-ascii?Q?VpocWnNZ3Dhl7g2S4MgzseQOa8vbIm22w/RwuiP/yipxQl2W9CsXDjGxh0iu?=
 =?us-ascii?Q?fcht3gr+e70W4657ySA+7QbwXh8DbBkhP8BPvdm1sXBr/2YUSvhR1srBP8LS?=
 =?us-ascii?Q?8z873xQEv4HamK8+P2cm8ZNorRS/M7DuhAzapt+4+U1UUDQGF69A2BCOmLdU?=
 =?us-ascii?Q?ESeOTxV+37PArQ8MUqZJ9WVQoR4fRTu5R1ANCa2CppDluHYpNxYWhSJ173Gg?=
 =?us-ascii?Q?N3W/KS8NLwj0G5WSpgU/jBtA29nmoZUX2W4NoOiHK/jUWkxJ+LBSRzIQHvhk?=
 =?us-ascii?Q?N8xEz7glQjFmI9kJap76Z4p7U4DXBRN1h1Af0kCcOuEUe7Cu45iU0eC+JRn3?=
 =?us-ascii?Q?uJoCv0XYRY/O2vfbMD+Oa1GIThd9QP7pCaAJZSQxJMfAXKJs2sXhCiaSno4t?=
 =?us-ascii?Q?LIzZaM8sWRFmQ46w1cLH37MNHakCWG/UAH+wUWAy6ggLX9JZizkif0mC0VjN?=
 =?us-ascii?Q?rjVEgWWMSUg7qCCsSAYWCPdR5lcJ4g34vKQSE8RvPnBxJlpczuAKEmxGVhIW?=
 =?us-ascii?Q?T9yxd/M8PWKGYRqgbjc3l/MUl60eETwh57wzvYth/psZRVWoBlWGZOCgTvqa?=
 =?us-ascii?Q?Uco+vf7Lac9GkHYCe5bJFbANUyLAY/eCA+FXNrA91N/kN2EafA2F4zDfMEWZ?=
 =?us-ascii?Q?tV8ElVaGrXbvDCcYL4WfblXMeE2vbFUqgY/RVUT8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b019f27-a361-49a8-a89e-08da9c8c9033
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 11:21:15.9692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1930q9L/GA8ybg7i+9rZi12Z8O16E2vWqZ5X6WeixkeEDlAJc3PrTXR5x1umN/Xa+bElnVQBywVtovc7+4liaJEeoTQoUboM7L4OBI8CJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_07,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220075
X-Proofpoint-GUID: 4hkwZVIZvsL2IE4877iyPXwf3jWuOl7y
X-Proofpoint-ORIG-GUID: 4hkwZVIZvsL2IE4877iyPXwf3jWuOl7y
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These two error paths need to call of_node_put(child_node) before
returning.

Fixes: edd473d4293a ("phy: ti: phy-j721e-wiz: add support for j7200-wiz-10g")
Fixes: 7ae14cf581f2 ("phy: ti: j721e-wiz: Implement DisplayPort mode to the wiz driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/phy/ti/phy-j721e-wiz.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 20af142580ad..438ccce3d1bf 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1400,7 +1400,8 @@ static int wiz_probe(struct platform_device *pdev)
 	if (IS_ERR(wiz->scm_regmap)) {
 		if (wiz->type == J7200_WIZ_10G) {
 			dev_err(dev, "Couldn't get ti,scm regmap\n");
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err_addr_to_resource;
 		}
 
 		wiz->scm_regmap = NULL;
@@ -1450,7 +1451,7 @@ static int wiz_probe(struct platform_device *pdev)
 
 	ret = wiz_get_lane_phy_types(dev, wiz);
 	if (ret)
-		return ret;
+		goto err_addr_to_resource;
 
 	wiz->dev = dev;
 	wiz->regmap = regmap;
-- 
2.35.1

