Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CD7C433EF
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 Jan 2022 11:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbiAOLw0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 Jan 2022 06:52:26 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33698 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229486AbiAOLwZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 Jan 2022 06:52:25 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20F3CHS7003974;
        Sat, 15 Jan 2022 11:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=63H1ygHiO9hRWw+/iFdcumsoVXw2+MEmJOKVvNksogU=;
 b=KKQVC1Ce+pifI0naazRBQUYKaQ3dh7284vJQTbw/YTT8W4AoWj+nnebDvWQU4j8ezqN1
 ez5OxNivbraP3wME8M1Y7mquE+o6GndEFgcq6mZHyh5sof6iZJtUhmB3p8fGfKMrjHkZ
 HDbxeRfHLGTkpJM0S+/MdOxsSMDdici0iQ5cAXIrsiYdZ/EJnhvj0IW7XKydrU6d8TeO
 z3NeU36wWvxYzkKRCD7NvRtNmdDrqq7ezhVwFYQ9nz3ygTKdDHCj/raugkCCK6G6d6SZ
 x8j1WqI2G2XIsVfgJbqVGwTCtrb51iLZzxUHh6NUDpnqbz6JrAT4yW6MZcbOXZDBt5yg Gw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dkp5agej3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 Jan 2022 11:52:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20FBpo2g136242;
        Sat, 15 Jan 2022 11:52:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
        by userp3020.oracle.com with ESMTP id 3dkqqhamg0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 15 Jan 2022 11:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Izq2oMkoiWN1VkLhI5abqB3LjEH/nnddDP+gYOonkyNNnjvira9MPGT7QLBzWpiPy2gYDFjzPKlNJAXTRrswrtu7a5vjDx4/Ehf2Nkk4BtH7Qn4vAU/Qc0ka591TXpMx5wW0HctCUkbkjomY7EcWoScqwvp+J4YSKBUGbBg3eicERLKZkhwfIizPj/rMLh0jb8h01MWODdkQY0GwUgYN+vDkN1nzoIFXGPNjoXHPQyje5CezduG/k/TUoCdccDxwn0y3N+Q+Dps/VmUMo/VQO82ttgdCXCSAVUEO7xZ3RiOjctGfErKVFOjgWpXhZeurVagalhuq1TuHR0ZR2mlg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63H1ygHiO9hRWw+/iFdcumsoVXw2+MEmJOKVvNksogU=;
 b=VLosgpcXTcDVkoBaDbxOpoUdWlIjtoPvORhv2jorsbaO+8Tnp1GjFNH0oOb4L7RCXwWUvSk9scdsgNIMntAk+Ua4xKaUvXFa6jd+XsgPmI1UaiXqdQ5oP0xtQxAg25Q0Qq0gginyjBexX6FOS5rIAaMSqRpG5MKwz3p9t46/OTHQkORDqblj+Z2PV/iEdRX8AyKydc7CrVJGfzKte55fsy235ZPhuMA3uh/oystouR01iq5oovzFiqeFTo04kWEsC82nlVEFdOtC9pQHkR7LTe66CF+YWZXcm8OUus/KKiB3cztgScxLB++L2D3yxh+xVl24JRQZUl+vMc99HvbBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63H1ygHiO9hRWw+/iFdcumsoVXw2+MEmJOKVvNksogU=;
 b=tSc+wv5LAtcdoz4AMGdas5KvfghyRT9NT9RMqsUfa2RmRelOMcrOAui1r7n4YPJdQPTN9Df/98NGHN9SFVWysQsX9Z/gRwWF6eGjwPzILW3soa4SQmpJn/7CmwnQI/NodlUwBJNfNrpbrYT81hAt06iAQcpbqpDkv8hVeu1cL9g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sat, 15 Jan
 2022 11:52:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%5]) with mapi id 15.20.4888.012; Sat, 15 Jan 2022
 11:52:01 +0000
Date:   Sat, 15 Jan 2022 14:51:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Alan Douglas <adouglas@cadence.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: cadence: Sierra: fix error handling bugs in probe()
Message-ID: <20220115115146.GC7552@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0077.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12c25a1e-64b5-462f-9a5d-08d9d81d70cc
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2365472BAA15DB8FFA72C7138E559@MWHPR1001MB2365.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CL91wYn+q8zOv5OHbQzVJXn7t2e/8cUmRj5+aGCXa3VewtpIs07ey2Qr6mzZB2Y3I06fDHNUmfs8Su7WSB6MKshTnjtwxdo0OtvkKZ52BtqIjybu8LSRrgIEQclEiwC044DId61QrgszB+mNgbzywp3/vn8brk6YjoUMgIt4ahdvjGPTe4Zhal2NWJ/dP1nnHlY4oCKM958vBz2IrCaf8DPCsjpwnap8ur8s4yEOdoyzu6LXaa/100usIbJJ0FBkQUBp5s0LE1MfJreQY22pLi+AR2enC1G5z5q4pCArfgrUdKMXKvgX0zVSTabZmj6i4W2wSa9jqE25I+D10uXQOnBiuRjd/7mMruxTSCVbc63vPMnW/Gd16C9WjJ23hkbl75+0qNAILAd4NSn4TDDt3GGw18uKnHd1HNZqDoWeDTDmXkz0ld9KsYIlBHdPEDasUw9HAhk3KbSrK1qHgc+gTxnJ051+kLBmSWp/NNSaDJgT4BvuQzurFHvKKOCgCk+eySaeMdvhFwM5Y9gWUxjiFYfQokPvYioUOg1sND8+uamqmzPR3+vp77BIK9xER0hrBVvvNBAFSvkMDP2s+b2Yr9HFzh2/0ber30wm+cKAMG4sIpdJtcrjXtE6+vtOHBu97JgTTi83waiN0Ylsy2uIKwcf/NvMqXF/2NDYF8ACy2RbCA/JH2Rd6RaNRJyQBLSdRxWmOHS2Xc5MW3LOm2paXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(110136005)(54906003)(26005)(38100700002)(38350700002)(8936002)(44832011)(186003)(66476007)(2906002)(8676002)(66556008)(4326008)(83380400001)(33656002)(6666004)(316002)(6486002)(5660300002)(508600001)(66946007)(86362001)(9686003)(6512007)(1076003)(33716001)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iAvscaaLJfgvfRyiZibX/PVirlASxefOYZjSQGTPJOSu0HwdQBQIP9kxmOSo?=
 =?us-ascii?Q?ebVXxVtKwDoh1+kqnCgHK2Nz8b2+IFPt0+zcXDvYsPSMBSEUfPeEPtExN6CU?=
 =?us-ascii?Q?hdaWDifrx5zzuZfyM5zi9aDRXxrUK3/8oGesaW53jqW0cSodOk6RQzGVdbz7?=
 =?us-ascii?Q?jcm13clSADr5m/PT+HRJECoJLutDbrpEkH7j4/Sc3NDGzBUXv0Dq7SdocXhg?=
 =?us-ascii?Q?UE543sOuWc1mxRPmat/vKE2xsfcEhb9L9RIqcVmKHMUpfPudQM5uDbF24QEy?=
 =?us-ascii?Q?BP1IJxDAGuRWjM7LuW4fPrQwOL1yQdyVRNMqF57pSC95V+5raOr6ejrsdjsB?=
 =?us-ascii?Q?+RXgAzqrLegRL4BP46vW9VsbKgHnqVduskH/UCpdOehQAucAhSGu6j0Edbjr?=
 =?us-ascii?Q?zTBl2B5pidXg8WqIQ181RhUndQQFakgAWfSKSY0GGHGGFjtSAzlwWgQ0iCMM?=
 =?us-ascii?Q?j13xM4mERMy9mCVACU7AUw669nKXrRP6yeGhlE07LrKpXK8J9Lreno01VvQ3?=
 =?us-ascii?Q?31oNjeTQUvuVj4n7FlzJ59BSX4zdn0v7FIqn7ORWolO+n/AwtJY0Mh7xf48d?=
 =?us-ascii?Q?P30sSkNDIGHGIxv35PHAGHLPOwKAprlKiHdh5SKZXpT8XU2oxT+MGJ4BzIrg?=
 =?us-ascii?Q?itMXwp9lwZzVAOT+guaTDBIHhRQpAho31pOFWca3kgItBSEK4TyWdnWeeaV2?=
 =?us-ascii?Q?LhU9ZvR6lA4uVn9KFwOKjkHC51IKs27FExPiE0NrpaOuUqI5MeEbOrWbCczU?=
 =?us-ascii?Q?f4lhZF28tvYRTByuKeJYdHLxemagoG7kGdYDXbQgQGy2/QCY2qtZwL+O/vyH?=
 =?us-ascii?Q?/FBjwfihpcGxsNoq55BH/m6Y+7fluSVwQ2fA/EzaZscr1XrpufYXXPRN/X8Z?=
 =?us-ascii?Q?kn/n0eylQe5Rn8MGIICboxiiW1lNVEMazmJ1utv8z2/U+immdwWr1KMHu69J?=
 =?us-ascii?Q?Xo7fXAVRzG4IO1Out/uPR/pNIidgPkyzzOiDyEHsNavD5bdu6GEUNSQjmqbe?=
 =?us-ascii?Q?DVqVX2Tq9PFwC3HXnAbf/RnhppW9G/i62LD+8s/tm0y+jniwMOTu9nT6F8af?=
 =?us-ascii?Q?mY7jr44gAaqiKDcAuOA9c+IhWo7NWcfSNI5tBtNl6ir0BOWEflbXi9rl1lCD?=
 =?us-ascii?Q?IREArvyrzlyMXeFtdkVb+x8ICtX3HSOJg6NJUqr1lOk1aPUkfahon8JZkSEQ?=
 =?us-ascii?Q?5ueMrpxWq0IPGnFBKbhaTAJI1gw8r2c+6ipxTHBfZhY+EfFGk8TOm54+Rn/D?=
 =?us-ascii?Q?Feq+3vM2EAmqfkVK085THtM1J+yVETWeilTej9HxBo4+jO8fizWVy/BgBQ2j?=
 =?us-ascii?Q?j/dkFfeB1BafDyJlqVPmWtA/FWmdpY20dNP40icRIwcIQSHy2jw+vYgb3cIx?=
 =?us-ascii?Q?TeL3Y6V0IJULCgEkysCpbsNgZcQ8ttxxcjpKMBb2XTEjvucGrakl7AWsAGq8?=
 =?us-ascii?Q?95wJ6xErXP5/QDOfGenUzTHLz3CqgZfgd6lSMUfYT5KG3SdpWmRfGPK5CXc2?=
 =?us-ascii?Q?iFilIyQ0iSrbZWb15BxFlsYay3Lq8i7rXlr/TOu3yqeDGVShbHWYo9DNE8Ga?=
 =?us-ascii?Q?YFd2a9aQjXgZTiAPdsutbfMsLyGIzd2SWC5Uzxcnbm+uBl261nlEJcQ823JM?=
 =?us-ascii?Q?fEsZbymXkTPJqwke75ai8CwRUF29nRRkLfaCMs+Kz51ynVFsIa1NcEmECtMJ?=
 =?us-ascii?Q?kuMVjdkErWY/1aZzPPVPI8MsHRM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c25a1e-64b5-462f-9a5d-08d9d81d70cc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2022 11:52:01.2587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inoimUsUciTAqGuiK9w7WW9JFiM9zhSU9e0KwirnEmSwHfqQNSrJLK82xLcFFqcAYiXHYmsUIsmxomaqiKkl+Li6e2YLKT5CFjS3pw5Bv2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2365
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10227 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201150073
X-Proofpoint-ORIG-GUID: 06Hez2eSARdhKaPcWdWBfViSc6lQ-c3h
X-Proofpoint-GUID: 06Hez2eSARdhKaPcWdWBfViSc6lQ-c3h
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There are two bugs in the error handling:
1: If devm_of_phy_provider_register() fails then there was no cleanup.
2: The error handling called of_node_put(child) improperly leading to
   a use after free.  We are only holding the reference inside the loop
   so the last two gotos after the loop lead to a use after free bug.
   Fix this by cleaning up the partial allocations (or partial iterations)
   in the loop before doing the goto.

Fixes: a43f72ae136a ("phy: cadence: Sierra: Change MAX_LANES of Sierra to 16")
Fixes: 44d30d622821 ("phy: cadence: Add driver for Sierra PHY")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

 drivers/phy/cadence/phy-cadence-sierra.c | 35 ++++++++++++++----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index da24acd26666..e265647e29a2 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -1338,7 +1338,7 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const struct cdns_sierra_data *data;
 	unsigned int id_value;
-	int i, ret, node = 0;
+	int ret, node = 0;
 	void __iomem *base;
 	struct device_node *dn = dev->of_node, *child;
 
@@ -1416,7 +1416,8 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 			dev_err(dev, "failed to get reset %s\n",
 				child->full_name);
 			ret = PTR_ERR(sp->phys[node].lnk_rst);
-			goto put_child2;
+			of_node_put(child);
+			goto put_control;
 		}
 
 		if (!sp->autoconf) {
@@ -1424,7 +1425,9 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 			if (ret) {
 				dev_err(dev, "missing property in node %s\n",
 					child->name);
-				goto put_child;
+				of_node_put(child);
+				reset_control_put(sp->phys[node].lnk_rst);
+				goto put_control;
 			}
 		}
 
@@ -1434,7 +1437,9 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 
 		if (IS_ERR(gphy)) {
 			ret = PTR_ERR(gphy);
-			goto put_child;
+			of_node_put(child);
+			reset_control_put(sp->phys[node].lnk_rst);
+			goto put_control;
 		}
 		sp->phys[node].phy = gphy;
 		phy_set_drvdata(gphy, &sp->phys[node]);
@@ -1446,26 +1451,28 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 	if (sp->num_lanes > SIERRA_MAX_LANES) {
 		ret = -EINVAL;
 		dev_err(dev, "Invalid lane configuration\n");
-		goto put_child2;
+		goto put_control;
 	}
 
 	/* If more than one subnode, configure the PHY as multilink */
 	if (!sp->autoconf && sp->nsubnodes > 1) {
 		ret = cdns_sierra_phy_configure_multilink(sp);
 		if (ret)
-			goto put_child2;
+			goto put_control;
 	}
 
 	pm_runtime_enable(dev);
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	return PTR_ERR_OR_ZERO(phy_provider);
-
-put_child:
-	node++;
-put_child2:
-	for (i = 0; i < node; i++)
-		reset_control_put(sp->phys[i].lnk_rst);
-	of_node_put(child);
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		goto put_control;
+	}
+
+	return 0;
+
+put_control:
+	while (--node >= 0)
+		reset_control_put(sp->phys[node].lnk_rst);
 clk_disable:
 	cdns_sierra_phy_disable_clocks(sp);
 	reset_control_assert(sp->apb_rst);
-- 
2.20.1

