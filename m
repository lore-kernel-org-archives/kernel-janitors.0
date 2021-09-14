Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1080C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Sep 2021 11:01:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81FAC610A2
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Sep 2021 11:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231941AbhINLCd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Sep 2021 07:02:33 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13442 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231934AbhINLC3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Sep 2021 07:02:29 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18E9cqWd024470;
        Tue, 14 Sep 2021 11:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=3r+yEkqFN9rJOF4SCghUFrF5WHcmgaMF0c0pV2MCDvM=;
 b=uSp1nHkJdJSQ2nqfybUrNAHfUIUcmVRJl1ISupr+HRshh28omI05sRyNjece67fM+qHQ
 JcYaSTDOAJ489vhz7CblJI8hp6X+Vd24fWR845eHLeRC2fR3RpNLm4ZH33mTR9wd0R2p
 ybjpjgpHVvPw0ida/Fyxgu/f2K21EGtfNiLjNutX1Vlqqr/f/yDs3v3eAYDXkWKGcZ3f
 a+FPkyLRL6xgvgatgW4l7GWd5U0EVCtvK3Z2EQ3sO8QvaC24nxp5Fz0h1y0DbyZK5NMF
 NoH2RSnPILhHDnMLpf5fOAt2zpyNjyk71DS9kZRYNOMETyzpUVaGlDr1hlnxTth/7S+S Qg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=3r+yEkqFN9rJOF4SCghUFrF5WHcmgaMF0c0pV2MCDvM=;
 b=XvIX2i0YnN84KbO3F6MKJbulDvrAHPyduzVzxFlRzJ3jYHqs4OKSTXY6oWU8UvIWWkih
 lonA2ojAyR6qF8fKhYb6qOjdUeLNvHIhDdb9nV37nzqD5bfWcmTBxwxNiBWPZTw58COW
 8v1FNikVfHoh400wx41a9IqUZo3JYmtsnSr9u6cvDQlT+vS765dUQQ26HcvwK5MxABzj
 IGr2B+tK42b2Pdm+Lp/00+mC3QwM8wJ2c30TyVDNCEH+Fu530ub5Y1pJOMnomhr8cHnP
 kcUx/5c9GYVw4C1/ZC42mArXLFqiYGowA2YrsjB/Gp5PJ27cbeTMxFehlGmd5oHE7SLb Ow== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b2pyg8sem-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Sep 2021 11:00:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18EB0Y5h018246;
        Tue, 14 Sep 2021 11:00:51 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
        by aserp3030.oracle.com with ESMTP id 3b0jgcxafd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Sep 2021 11:00:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nw2ES8BJZGY15n88jGecjceh3QUPy5ibvb/BJa2gDCcfr9cQDKvADgjzqmOcvIh/yy3kIQy7jn5NDk03QtnQ6y1D3uxjTc+nsNO6s/5PoVoALu6Lg6PnLWG+J7XXKDaXn8H6z3dnevHcolURo2WpX5b8H66ridI6Cm5jUPsgcHc1er3yZlz2itnNk9g3wq7b8vkNmJu+nxvu6bq7DkoJNrqmZX7kPuxyKIC/ahtXxOCV2/PlHhnYgxkbi7Vwi0pj3xWjtsE6B9qLmx8yRqKQFARYJx+tcbX3skJyIa8XWrdb/9gZaC/oXVFhuITqvlYUTQZn3k+iSk10Yy7+cW4fRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3r+yEkqFN9rJOF4SCghUFrF5WHcmgaMF0c0pV2MCDvM=;
 b=QlSVaIgwx/aT+RjeSIxfyI6Vkbn0ZWwuBMduJBaWsTr09GnUQ7kPMqyDOS5MZ5DR1v5NMNFESc5dpPWzB4TOEKMox1oLdBrc09KqwTKyONuw7cPaM4xVch7RtVyL8GTKNDy83GnaZIoWwfpVBw9zC6AyBXDICDaS/g2kdUe9TeFgsOMZ8STxveQC/VW/v9pLOggVCQH/8iLwVZD5NzWVYHZs818IEZQ1lQ0TGqEKuKUzRx0UADHEdU2Whlrg8KYKBeA8HGaYcleSqvz7imttZplA3pcGgsyg8hJa0upSu8uKyGMWFAH4G80BkecaDYGrVuKeNYXKl0HA9Sbyb+Sr1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r+yEkqFN9rJOF4SCghUFrF5WHcmgaMF0c0pV2MCDvM=;
 b=coVBH43KRpW6lWn2vPVZthmR+bFCRowr5pS6bV7865TbmdLMC+nLOIdsXz7qIE9aNy11VNYr4EqREodYw8f2/UXW3oTYf8sP0kjqrPuOUlmHAUq9Aq4zBMm3mVM+NBSZafHk33XPLmj+3lpV0bapxxRPxFn9bm48fB6TaWdII0o=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1294.namprd10.prod.outlook.com
 (2603:10b6:300:20::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 11:00:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 11:00:49 +0000
Date:   Tue, 14 Sep 2021 14:00:38 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: ti: gmii-sel: check of_get_address() for failure
Message-ID: <20210914110038.GB11657@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 11:00:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79bb56c8-625b-479b-a46e-08d9776ee8fd
X-MS-TrafficTypeDiagnostic: MWHPR10MB1294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1294FBA6FE644FB89FB42ABD8EDA9@MWHPR10MB1294.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLOr5jQNXZ/OLl/OLsNjbija385LOhPypiAQUIGLQIIupL4QfgGxNEyfVH7qPiy/8LUMlCc4/tuQ5h8LTC4vWboncXvfl08Cwpa0qKkrm7hmOeVfANnt+RhSCCfEaQU4Ryi4v1ano+XO3KpMEpysTl9qpTTD51BrIZOj2t69+Ao12NmvhjxCZ4GNdqxqjPX726Wj/G5KTNt8suL/Gmgcv8/5Dbn2YxbZx4EtIH64Saovh7v84f+VuG/9kOyR0c+5/yWIO4iJ4qCfOCvqbs3yFUgKGpP7s0JxWQNNJOKZNUG9BAQTx7jwePo/ZnKYUa1cKsehoG5ARAyVBkVcKc3uEyzxadR2aMzgUTfJLD24KDjNTeDoeJ5PC+nDqQ9IiMK0ax+yWZYUN+h9jvHGfrtOFlqCq3x57McDAy3nNPE6/6J8kAZcUWhbes+nShzSenD+Lnla2ScMaUHa3rF67fq60ec6MpvzWFHS6P3Pt7cLE18Q65Ostzw+PNAN5qlmBhDX7HA1q2ovqnKcuThVEWcmqiZVf+eq02lDnFXz1E/kwtrg0Xw5dj2cGq4Co66fQZJCW0i4Z0QXw1Ksa0BIosXkdnGv856eCOT4GLmD8TWuRkTaSQm/hwbJh3rn8SsyWzZUa5f8aGVCfhzFYuF+hpYKoLoAPuY6NrNQiKa5sX+ztbRbi0Z3faAf+rUJqzQmRCV/FlbAGvtopKoPH6Msa2P4Uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(346002)(376002)(39860400002)(33716001)(6496006)(44832011)(4744005)(9686003)(6666004)(186003)(52116002)(5660300002)(38350700002)(8676002)(38100700002)(956004)(66946007)(66476007)(9576002)(66556008)(55016002)(478600001)(8936002)(2906002)(110136005)(26005)(316002)(86362001)(33656002)(4326008)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rirck7M4aIYeDHqNcbUYICVMxLx7AjQReYFPfbq60O5ub3sZxXXBUMRL25U5?=
 =?us-ascii?Q?pfhNyTM3hP+O4591CjEdyWnWdRYNBvlOm5k61LIN8RSmcZqdsqtJg/akJI0H?=
 =?us-ascii?Q?uFhiaNpB4iAQt2UMR47y2eqI2IIdQx3ibegqz4oiDi/n9FS4BkXsQ6FLgK0X?=
 =?us-ascii?Q?IVlHUhgB3BrbKczkm5ej/wi3NsYXkyR7nC9rksoN1STIPBzN8OQShuY8ZNcS?=
 =?us-ascii?Q?fNXpho8yYmUoYn02PL0KGaGqS6GhYqSK+rQmJHF5V2vxkQs2SD1aMfuUkv+w?=
 =?us-ascii?Q?Ki7RHgcOfRGiuSUqOlYhu6s126JboPG9Q9zeu6hzmLhATnaZwd4xxtx/dnb5?=
 =?us-ascii?Q?fFrwW83A871hOKbUOTHYGxrjR/6ypts1wBPK+6LkaaCM7y2dpkoWGeikJZmc?=
 =?us-ascii?Q?1riGpGqhSXU0VPo1DWADyMf5znVC2r0yeQtBvMZ9IqTSrnsl7r9DMwul4lBL?=
 =?us-ascii?Q?OJAJk70KZAup+QEcJpITodQc9FRvioMwFYtasKxm2TayoQxpQoC8tAy6ca3b?=
 =?us-ascii?Q?vrl03S5Sfjfi+FP+xgvjPv3fc/Kdswba+D+dql1EWD6vn6Nx3ffndrMmryZj?=
 =?us-ascii?Q?sSR4n0vEXaYLBpN4UcCKu8SUtz6h5qL7FuDXNmEDI4CLnAu1MrQmjbt6wAn5?=
 =?us-ascii?Q?U+A4ZJKaT0YHqE2Z1O9nXmi0AjPYqjn6d05M1uLpf5KFnNLAILg1aJE0U4+P?=
 =?us-ascii?Q?bLhw3zY7mUT6KiuptEBZ+yWvCyNQQI8X4A50PWvL5nRfCG3Wrhu1JrhDdoWp?=
 =?us-ascii?Q?B1KqQumSrmCp7JRz6s35QOZivcvPf2cPL4bW8W8SIeRnUga13QpanSAVdckw?=
 =?us-ascii?Q?KYQZplvHzUhzwH1beDrSqGtnkQ/HVNjOVra1sEcT+DuA6yqo73dIvtmYRE8j?=
 =?us-ascii?Q?kHnvemOXXI+/rWp+VG7sLC1sxN04XFNSf3JEJtW8Jl1U7hCkqK+phdqAEhn0?=
 =?us-ascii?Q?nAmnCIG7VRy3mVZQJpKYgzm7GqtQSJQmsKqKMa5ihT5ZYkRiFHUyiR5V0gpT?=
 =?us-ascii?Q?aVV3zGigBKXMcwLQikKFifAZfAr7hzsa767K+vm9K26x/CJFijNH/5+Lg/vj?=
 =?us-ascii?Q?9gPv4U5vGBzlyqTGvtChKQYP2v321WRT39f45ALyC71cJGmFSpZ3XYxldIHZ?=
 =?us-ascii?Q?iE8tg6FoMJl9WBgHugPqy9lpLKcpRLwttU2wEJPTGEUt2CYnvd4AGZFBq6ra?=
 =?us-ascii?Q?AZjgSyYkWEYBCIiTNLM8dW0gDA4s/W5YV6m3b52nZFSHwht8BJfHzXrjALEq?=
 =?us-ascii?Q?FvR3p4vFYnBB1/xFaa0AniDgZcAl6DbIJ7WjIibmdP+PUKiJ89uxjgETT3Rd?=
 =?us-ascii?Q?Co2S13bnONHCltQYPWtTZcHq?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bb56c8-625b-479b-a46e-08d9776ee8fd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 11:00:48.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldxd+7n3+ZY+4LFoVds9jsmlo89vx0JahuSAzaxC6jSCsjFPuwFO7/c5ERw5+zxDmlBY4zALIHN1hiwWUCZHWBigduq+p6ZP2iocZ26DZ9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1294
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10106 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140068
X-Proofpoint-GUID: nzxzI2KA9Pup0XraIoBS6i8nDeL1P1zv
X-Proofpoint-ORIG-GUID: nzxzI2KA9Pup0XraIoBS6i8nDeL1P1zv
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that if of_get_address() returns NULL, then "size"
isn't initialized.  Also it would lead to an Oops.

Fixes: 7f78322cdd67 ("phy: ti: gmii-sel: retrieve ports number and base offset from dt")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/phy/ti/phy-gmii-sel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
index 5fd2e8a08bfc..d0ab69750c6b 100644
--- a/drivers/phy/ti/phy-gmii-sel.c
+++ b/drivers/phy/ti/phy-gmii-sel.c
@@ -320,6 +320,8 @@ static int phy_gmii_sel_init_ports(struct phy_gmii_sel_priv *priv)
 		u64 size;
 
 		offset = of_get_address(dev->of_node, 0, &size, NULL);
+		if (!offset)
+			return -EINVAL;
 		priv->num_ports = size / sizeof(u32);
 		if (!priv->num_ports)
 			return -EINVAL;
-- 
2.20.1

