Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91828C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Nov 2021 07:49:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7218C6120F
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Nov 2021 07:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbhKQHwD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Nov 2021 02:52:03 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:65122 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232915AbhKQHwC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Nov 2021 02:52:02 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH6RSZr031237;
        Wed, 17 Nov 2021 07:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1DLqFFz5+qizKN2wfHA1ZnUy02/S+aL7kVz6065cie8=;
 b=gP2iZyP4H6KI29kcZlDSh6Dt46yRTccz+4KCwbyWD9ZJ7vaoBCzQ4Auy0NRRSt2aH04U
 CltELOxe/Jn2p3+jQ0I03f4gmlX5J5NwvX5ps25EHtRWgwuYLX5dt72ol2+uLP7P0YiU
 q5FvIzi1CJ6PGnvuuC5I0pg9GCpBCCzW+Tdoel8Whmk8vg3OvFq6ypNzVu0ykTmIcOta
 M3blE8SEfDto7cP/DMkLGMSGza2/ycIAWym0bKuHkNbcTVYOdI7jB5qb35o6ru2fXF5G
 kZzTIAEyTaS0IPP+p2f9c9KVl/MS44tni3uQZWqgFbg6xUMNrADmNIFgLerXs+PaYTKk SA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cbhv87bmr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:48:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AH7eGk4113774;
        Wed, 17 Nov 2021 07:48:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
        by userp3030.oracle.com with ESMTP id 3ca2fxd05q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Nov 2021 07:48:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuUeWvIGM6mEBXTME2G7cmX2PLCmAcnryf/clYhTMLz6mSkHkWCMU427jK8t+4odZMPoFeWGFBw9W2DshDcDCHFAaUNI0NvCo5hX/Hf0h5mfFOMLhndhRMoyliCxMTEWW3N6NZJD6MByAyV+7svDfY4rmeEvqudoBvpmS40+638PUBG38VGiQt2ejI6+b4/2fjnFF5CTW3Pxc3U/mpyprYyZZKdH2YhoGmvH6zDe/sS9GEWlOrbYDWRKLB2EqyCK8Lqbds9O0nHtkcns1ejCtxSawYWLgCcOlLmosVKJrWUufAsJSj43C+9AV7wxqKNEGBwnJX2JS+hF3M2dR2h+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DLqFFz5+qizKN2wfHA1ZnUy02/S+aL7kVz6065cie8=;
 b=YkrTQ5S1bMyrYzJHOj/Ssp/LbGF1gNIsatnWtPqBQnJ2dui+EaN9jh57CR2wvQomLCI1kQZ/DjMovBOamM+NdDuSIyJgLNIjAAf/3C0UU8TojgA/SRehStHXAjWzm1rqADqSAvkPA6Ic0Xu+2gRXv0atAT++R9l+ovMWYCtTqXD2EfkCEWFSvmtzi9sW8fwrP+dbXjmzAp9cDPuWtAVWMUVDuavhjeCXkSbSKOwvTjPgnVXeQVjdbnUnJGu+y47FsrCBJEZtEpQBDoS+mgrYUYD4XgMNdE2t9xrZl6cUm20qA+jhTd0nue0Xd5Ug3lIiRali1NrHrr7ATne26bb3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DLqFFz5+qizKN2wfHA1ZnUy02/S+aL7kVz6065cie8=;
 b=M/RYdjstTprlVa0G/0Wi+jKRiHUKmuT1arTXjHbfxH4Hf/uxkei+wHFAxhnJlGIY+8M4r/3+qGxGu8qdkukmWd3CWVCiSCWyOzl6J0sZThhT5DRqLEsQh6XPETdZ96l+J/cnKIrsrxBFx4r/2/3BpQjPCWEvI/43AQflayyJB20=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4434.namprd10.prod.outlook.com
 (2603:10b6:303:9a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 07:48:54 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Wed, 17 Nov 2021
 07:48:54 +0000
Date:   Wed, 17 Nov 2021 10:48:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: HiSilicon: Fix copy and paste bug in error handling
Message-ID: <20211117074843.GE5237@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0022.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend Transport; Wed, 17 Nov 2021 07:48:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 714ed1b3-84e8-4bfd-2659-08d9a99eb45f
X-MS-TrafficTypeDiagnostic: CO1PR10MB4434:
X-Microsoft-Antispam-PRVS: <CO1PR10MB44349C2641EA88642EA9AA538E9A9@CO1PR10MB4434.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fo/WPbVkkQNkNBRaKi7F3++O59pHi2QHdWXBOeHuH3uwavYW2iGZC/lLqix1PGDuURD4Ecy91aVDbVufaBk5Oy46tQp5fqXtMvU1kF32MYf+6BVEQf93aiNt6Wox7fSA34do8y42cUqHhwE3od3JBQHvxLh4DqR3VpTGRyXICsDiwvz9J3zwVPoV0AXQuF8/aL+0gPWxp5/3ylw0HEW4JCtvmhc0BFIYCTAf+iflCaY0oeiXGU8lWR1o9mjd1wUXbFWObJGSNvfmNpSxVYtlSm4Bu5O/VjUKYSAqDVGqUhPYJdoZovoRgYAwNewswAseGEBhADoYhUor1TB0c66LWdB7y67Rgn3aB03PnzizIMa6BF41ns8XjhlK986YHrL7szsKgptlJLU9h9DxEKpjJ6xgsYBAqi2MU0zhxEeENB2ZOB3R19QmvRstWJ07T8LLTdFg8tHpnvwz0vkoFJ4XJLJhtexb28YziefYK7aq/xyeSi0mgYxFVPI0GXEWVMHASzSKi4+BIQke0bxRU8puvz5ugeNRG8k/4oPDh3jyJPFZa7EvRqz/SA5bA5k9k3bLr/yvfBfWCG3RzDSEShU3lK0iqaprz37f6s0bsMYYP3j/I5WX5qg1u12RBZmshAUUJbr+xVE0CptjBHFtnddsgcdyK2jDGutZqfBShNc0M+SyGxgvAjI5JTT/FBwaqSAzEj1kWD3W3mFV3bQ24jbg8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(366004)(33716001)(956004)(8676002)(44832011)(26005)(52116002)(1076003)(6496006)(83380400001)(186003)(4744005)(4326008)(6666004)(33656002)(66946007)(316002)(54906003)(110136005)(66556008)(2906002)(9576002)(66476007)(9686003)(5660300002)(86362001)(55016002)(8936002)(38350700002)(508600001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JHcp2kP+xfqdzPQKw4Yb2ptIWcUnMT4VU7uUQceCrhLu/Sinhw/lwiSyOlem?=
 =?us-ascii?Q?vYF8zWSxKKBJb+AwezQneljWQlmiTdvcSsl5OXHD/SnRocUkKCma5RrOfSDp?=
 =?us-ascii?Q?TkzOX1d67fPudreOlkoO/GCpMLhJuM9mvpb/iAPO540uCaXshRjw6L3OqAdl?=
 =?us-ascii?Q?69vVT1gPN+Qd/WRGAhR62Tu+Uhmkq9Ih630p25ZnL3T1acGyQfQp8sWwmhLy?=
 =?us-ascii?Q?TRxiFskoJPem4aipmCCjSBfO6zhVjLbhNvo9t2f+JX4yw7d5jjj2lBFhmqHx?=
 =?us-ascii?Q?Cu1lXIssg309gM3jEGnNi6LosOdG8LoCddLgKTgasbX4w7fnJUkKDT6KmYYc?=
 =?us-ascii?Q?UgFEpkkehqhZ66CpuY9ZpqkvYZe7h1cB+vDOwU6QdbGLmUldSsrN6YqR6R8S?=
 =?us-ascii?Q?c2qc+bOWoj3L9cu3UC4j/kuvtQwIaM6893nMJCqUo/owznZNZCd33fnI/UZy?=
 =?us-ascii?Q?3Far7E43x9JMJZ1zBwCYHsmDDySWCA0BGDSTD71Rd5UOgy63iZFqI09TEfL0?=
 =?us-ascii?Q?9b3k8kr6B0ixVwxbUVfpx6OyYhlNPufDrqjcHuz+g1v2TPOZ6CgRguTMFA1o?=
 =?us-ascii?Q?/E0Xae8UZU2pWpSLo2O6sLd22YHsR31XwUQ5JMrYh8SuGmJULGR97AKYn0FW?=
 =?us-ascii?Q?Kua8Uaska5ANoXE1tw9tpuewUiW9P8rpRlVrbBCubh0aYEtNGut0CWu8M5ZV?=
 =?us-ascii?Q?3D1hj1RzSsnCfwe91uCz4MDtooeY+nwU3YshJsm/QB7Y6w43MLOqc75XmlK5?=
 =?us-ascii?Q?qSPIlhKTBliQ0lFAOGemfZK+VVW4ftHxAtF3avAersEqqfMC2+BjNtw/7anV?=
 =?us-ascii?Q?tx4uL1dx2DMCBy1O2IniucJBxVbC+J6BwuaaqtSvgdzvwh4L+XFbP5UVuscM?=
 =?us-ascii?Q?lObYNynOciyQpxWsT2NCt+tpVtdtsduZm2U75tBbVLCQuHDqQ/qrfJ+JRJBU?=
 =?us-ascii?Q?fFdT3Ii6Qt/R+ZMC1YmdbXOq/iPxgGYg35oiT3tn6rAmMXLejNUsprA+F0Ok?=
 =?us-ascii?Q?3jPllUykJM2szCCzyyyawMA5wU3rA14k6MPmtGrBIdIUUpVEzszzyTTUG2Ja?=
 =?us-ascii?Q?IXD0hfnDjijhX61RFpVDuYZttaDC6xU/T2GDhk2YJYDWdfXB+/Zw3vLvB50p?=
 =?us-ascii?Q?gsQ+bOSzvAN3gHUOEID87668DzT+uHtE1PwZ53dSO3pE7YgDcHpMYP4P/lB6?=
 =?us-ascii?Q?7fY3p33gAbzQ3jnu9mgCH10cOl1jBEI52do2ZuybE9rJy/5Z/uI8krKIi61v?=
 =?us-ascii?Q?DWUw8QIanxSWWlA9If+28nXWDFlsVzUEV4cqi/SvqUxJIJH1MGyjT9rBZx4D?=
 =?us-ascii?Q?7iUPdFFrbrhm28GBnNcddt43LGVqOS9ZKabWsPhmwyuugTS6kKFHf/l1qM+/?=
 =?us-ascii?Q?lFYaPArcpZCh/EbKfDwKBe0hxh27X1QQGqj53HCiHBnMKNxUqw7odwJQgsiI?=
 =?us-ascii?Q?68/2Lenimk4esqTauUdF6UC2VWN/bIVGWlszJnOjCrSqfZRCVuQOhcdSRJdd?=
 =?us-ascii?Q?N2n8IW4WuT2hGgr/G4hKC6Hbn5vgCGRTKk6Oh3MNxHwsl+HpF3YWiwgvvVM6?=
 =?us-ascii?Q?UlRrRlHjwDyyNLY9+QzFV4b0czM6/CGyPVEnvPY2mG5y2KYW/vmpUf3lkdKQ?=
 =?us-ascii?Q?uM9mZ73VfRadAup8kujDu0QeR0UP8KjxvCucwumZufyiZztXY2zQDG4PmH/e?=
 =?us-ascii?Q?srYPbfqjP1yI0nkMAeRjlG/6/zk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714ed1b3-84e8-4bfd-2659-08d9a99eb45f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 07:48:54.6896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6ZM0FYVni69fX9Y/bo3eisjxZ46Uey6fRqh+iNkZV93Lp/MDbntrHxAo9zY8prfTKXCfecznhQtms9kjCsYIi5ZmaCErbkB7b1p2BPDlg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4434
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170035
X-Proofpoint-GUID: oX4-KISubuO9IpMcpCH5JJUnp5z7pFWo
X-Proofpoint-ORIG-GUID: oX4-KISubuO9IpMcpCH5JJUnp5z7pFWo
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This should check ">pmctrl" instead of "->sysctrl".  This bug could
potentially lead to a crash if we dereference the error pointer.

Fixes: 73075011ffff ("phy: HiSilicon: Add driver for Kirin 970 PCIe PHY")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/phy/hisilicon/phy-hi3670-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/hisilicon/phy-hi3670-pcie.c b/drivers/phy/hisilicon/phy-hi3670-pcie.c
index c64c6679b1b9..0ac9634b398d 100644
--- a/drivers/phy/hisilicon/phy-hi3670-pcie.c
+++ b/drivers/phy/hisilicon/phy-hi3670-pcie.c
@@ -757,8 +757,8 @@ static int hi3670_pcie_phy_get_resources(struct hi3670_pcie_phy *phy,
 		return PTR_ERR(phy->sysctrl);
 
 	phy->pmctrl = syscon_regmap_lookup_by_compatible("hisilicon,hi3670-pmctrl");
-	if (IS_ERR(phy->sysctrl))
-		return PTR_ERR(phy->sysctrl);
+	if (IS_ERR(phy->pmctrl))
+		return PTR_ERR(phy->pmctrl);
 
 	/* clocks */
 	phy->phy_ref_clk = devm_clk_get(dev, "phy_ref");
-- 
2.20.1

