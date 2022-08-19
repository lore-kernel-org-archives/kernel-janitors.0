Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50803C25B0E
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Aug 2022 05:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239341AbiHSF0K (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Aug 2022 01:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245425AbiHSF0I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Aug 2022 01:26:08 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9126BE01FD
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Aug 2022 22:26:06 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3veYI005907;
        Fri, 19 Aug 2022 05:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=yPh9b/Kk5jS9TOQHp7zm0VQGF3Q09K+dZpYrWO+bono=;
 b=Xlq71XNVZbFUovXVP5jHrHGpxrkUT1rrbyLXSK8naZlE7BVDJ+hgqtMaoeydSiFhNLl6
 KLbTLYtR7dqe9XC635QS2bfhH+crjoGOz9Y87WA1YVJ2+ctC8RfDggeUWFZ1HPYbT3nT
 FzujIkCXZiWvS12w7hFNSanGffxNuecaF1xdfaqnZ/0RtR1M6yi5MvL41A0/UMszl48m
 7l3kjzUItazF7uD4Whe/BZJEdXI37vKTvJPeHVWCdAvjSQt7LWRUyzguJeOe9ATO0Mtm
 ni0eF8SZ31PgJtVfDp3gB7R15TyZZsz00dgeS2+DsV7i6/qmNDistnkHJ+6YiZj28UTp Qg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j232rr380-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Aug 2022 05:25:48 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27J0DvYM031893;
        Fri, 19 Aug 2022 05:25:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hx2d560tq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 19 Aug 2022 05:25:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsaRGc9ASH+wm0RwpyfDs8yH9SNimvJbItcaCvbRNoOwJWeg81h46KEphWL2q26zY57eUNQfWhSRhIFX5SPs5X9hZjOwCldudkd/2YEvSBznIE0BYzj2xSjSM9Rr+JzK2Q/IKqkubl0ZDq9QKZYdf3vknXmy4Ad47bKbmRXDz8rW6yxD6U4QQBD8I/D2uBENjaKflUqdMQxKCLvc9lTnJaWFQuvwSqC2Hi1Cu5606UarWM/jvsUqC1iTpm1Dj3hq3dwcK0ge0q2l1UGep461HQiNlHlc0YEjNuDH75bHxJUDhdxB9F23uFhDea3Hfz9iiJ4er8WzQzCOMD7wofamuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPh9b/Kk5jS9TOQHp7zm0VQGF3Q09K+dZpYrWO+bono=;
 b=RYQ74TjVrAd0ybhwDz/oYwOIiXWKOqf8gerG3w2fQU6LFXwYr/7VcQkXPnArn1dkDMuwLRtCFiC2IbIDQSdv1cu/LywIIiaR8KmvICQEA3H7gfrwMtvGpbupdgOrttPywLbCURuXcAF9w5S7IipBSZy2Ftwk9O+D2dp98RBzYlkqQ9RIMD6g9UlJeGjZvAH9Y63jxlLptVnZGcwk+Q1c5FiDvUBerruMEoLJ3Hz8q00bMbxSiago8+S8a3zLktLWianxjZK9REXm1TRJ3DjLK4GH/H8P9l0/0ESoyCwk/P0oewUyUpJdBKyxS93U0LsG/ol2Dw0Wjf7GGomnH4XYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPh9b/Kk5jS9TOQHp7zm0VQGF3Q09K+dZpYrWO+bono=;
 b=yGuV47IzIaeweczUROhx9ApSah4JJkg90wUzCEMULVZbWzIAaX7/a8UQaroweBMLFxDuSOp9eWWCRUJPe60vYljYvMnV8fg+Xk5GdVnyCzCXLOWbqGwULq/YwkLwFKDCTQ/07r9VWf6SXJPKu2HPV2f5BS6ANwbxHSndzZ1J4YU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4124.namprd10.prod.outlook.com
 (2603:10b6:5:218::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 19 Aug
 2022 05:25:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.028; Fri, 19 Aug 2022
 05:25:45 +0000
Date:   Fri, 19 Aug 2022 08:25:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write
 functions
Message-ID: <Yv8ezribLQbq5ggv@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0096.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f443150a-ab01-427b-afc6-08da81a34459
X-MS-TrafficTypeDiagnostic: DM6PR10MB4124:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muycJGylGY7olqXP5bnQs9UTZYkkbnMBy9KAd/SwgWEGd70+9W0R52X/HOqtmzivZbWVxOesMGmceK40t0d+63BEzxbqWGABVMEBIzqPffXur+WImDWmkdQvQE8LkJyztmB7V+NbcY0fszF/a3xKcbZfuDOoryG2frdqKVuT5f4KtnB7b0vMqfCJgqfGK4AsrozoIuOsBG5N6gR4W4G1HvMAKgAmW4WAjowMYvyG/xWMpB0dE/+jwaVulr9cmyBoDz13wzQMrOS1NKHrCE7LPuq9fmPByKiiM2AMTu6TUabgn089NAqZ7eQ6o4L04X4T9zqA24WTnEdSotTu0eclPmRzINJh8HIj9/66cbovGPBeYYz4IDF/0r1TaJ6jyU/Vg6QtFeBOJ8SNn8rYX89J715c3GNZy0GWwClRnDLEkCna8bA3tiB0v81VnLm0WMZaTe9WhrGsdlkHe5rrJYnHbVSyR6+7WYoNXWc7/FYAZnvJI5sTFfel8uTIvnn7pld5duh3bxODxsDV8N1+nAsoPG6/D+sSeZpCr9awUodOD6FI+KruJ9eUy2pIuoTNteXSNx4r1wgVAJlWBIiwplArD8L6SMHjDuIocBJLi9X4Chjw3+BZM8Z5TIcd8Whrf+41AEdWcA9K9LW04jPO2jnkL8SasdoHvePDDuJM7S+Cn42C+Fi/z+EvQ2ekdkLwuY/9k/Y0FBnVmlVDPWoso7UZeGYeBvrDwxNwmA0oPyZYw0vBvqKM1+CAG3B9CmyPRtiMVOtFHirw7FXfoyvd7w2HGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(346002)(136003)(376002)(39860400002)(396003)(41300700001)(52116002)(186003)(478600001)(6512007)(26005)(9686003)(33716001)(83380400001)(44832011)(316002)(6666004)(6506007)(2906002)(54906003)(8936002)(6486002)(5660300002)(8676002)(66556008)(4326008)(66476007)(66946007)(38350700002)(110136005)(86362001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PjtrF4RBKfUkyPEEX1TCIF+Ae+aQRnoTyNZftsLt93uzHhB/vYvAob4V7Dvk?=
 =?us-ascii?Q?HAxpi5BygNwIr8e8Yr4k1G8FKCJsx9NDFHH9SFlJ1H2DBfxNa6zEvNSm2awS?=
 =?us-ascii?Q?Q55d9kVxwg8s43H5rU70vvESpdCNb61ZE2Erwu/LxiE7agOTXVP/Q0CtMuZp?=
 =?us-ascii?Q?ybjOPWztwT1kre7+SPHQQjxTKJQfzJ8NCq1CQn+It3c02hgelbuIZQoc+LpB?=
 =?us-ascii?Q?KdUNe9LHh0o8lIIBZ4BHOnDq77BODGuwFa5cs2WzjDCwuuXgwePx+eZRhHR1?=
 =?us-ascii?Q?bt42SmvniJzpfJ0xtoJ+YUxMTiDEUpNGtgjah1moqS4E9ewJV/Aci8Omv6Wf?=
 =?us-ascii?Q?uvCoyTi3oCRVp5tq8N1m0ycPWKWsWCJwz9T2MD+VTOXPaGFv/CQxFN2sRf15?=
 =?us-ascii?Q?Ht5CNcCyYr/JhcvosMj9EaDO4UbBP+1985R2ixyy7WuiHGXBiq7V0T7XIz7y?=
 =?us-ascii?Q?on5sPeJYbaT83u0gn1SW8rxz415fci2WGDfaLA6sqrLwSXaze6Cv6qfMGLpT?=
 =?us-ascii?Q?0Hd0x9pRYBD9OMFvg+O5rG+EAg1DGxkRpYFsIxWFNdKFNPFPAVp5Tz31vMr2?=
 =?us-ascii?Q?VErMGymPZaZ8Hx4YweNBEp7Dx9s0xCzCZfdV3upjXzk3UrJpXWwtSqUzrwzT?=
 =?us-ascii?Q?yD9bLND9XT6J0HUdoNztNm63o8dm4xqGqvyp1KJ2ygujkHBI9dFQWpxBMmC2?=
 =?us-ascii?Q?WLmAPGWqfBELTOxwcF/zBx78E6viGIYoZuL/jEXAbtR++DNiY/Y59obx5B2N?=
 =?us-ascii?Q?lW37nxvaomUw1OEoDM01eWnwzWlNNb8AjZKnKYb+j7COiquJ5LNX0sgaykkF?=
 =?us-ascii?Q?dEZwDZ+XlUBIotjP7ewJm2zKIjnjJWU+rZeVjEeF1vE3OYOaDZuac9f4J+jT?=
 =?us-ascii?Q?xu6uO2n076oploMcdTvDuEXufbhLAZO0dU4pHDypHTdeyQVu5ZgUrIeh76w8?=
 =?us-ascii?Q?8Py/HCM9kRCujSjMKmEKD0Ey8L62cS/P3qPlD0ZnYADrp5K1vHlRHYDLdUro?=
 =?us-ascii?Q?i07QM7dj6Ip45McQiN7pGVYWCE0h8Nh89OPuzk5RB/jrkLu7gYLUUg9Rhfzw?=
 =?us-ascii?Q?Vezv9Q+TNKk2eGu92aA+k3a8oEFrZrtGLXllpGorvux+CkXse2t4TDQdaws3?=
 =?us-ascii?Q?XkuLw+nNQOhlOqh/Ru5zy87yAqY3h2i2h3yQ73/NkxPED4XjGGp85MRZXh3D?=
 =?us-ascii?Q?ya2QaDKEfHeHnA0nFNFcsFZQDlN1LFTId/MkHntZtPjgoJSWYIfA3dza1XYx?=
 =?us-ascii?Q?eZivGfc2rkVQts30Ju/m8Kv6GZncqrSaA4vsb7NMGpwX2TCyhcwubpN7Ozf3?=
 =?us-ascii?Q?EhVOyiWtgw3NDg2pn3qcyKIDo0DJh9XiJ3MWDyg6xA5fGGIirUNlltvgcMbw?=
 =?us-ascii?Q?j3qRu/HeuUUDf+ytGdZYhZ41hr1RlDUeVG7d10IUX4TZZDMVYIEKOBGxVLRZ?=
 =?us-ascii?Q?UyHTA4SIMbA6pjCBgnhNqZIp5Mur2VCYmGFDT4lNLTbwnDik+s3heYI2HX69?=
 =?us-ascii?Q?xzaA5S9LQ+24XLMCSdvjIqK72KzdDbotNeCwi5Smr+p+f7D5vEJo5pl+W2n0?=
 =?us-ascii?Q?o41Bhalb4VUHBM5MwD45y7gH3FE5xowHMytMhP91REIDxasj2Tc77xKpIySk?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?SRIO2MWR6RThplAC7O23vPbONdCt8wh7kHaoDoC1UXabVeJ9ZJqN+gB66KLm?=
 =?us-ascii?Q?gkQE4HCvuV3qUup1lEx25NLnimO4G1P4pybkzS4F7/X48LtDftDqoIXTwnxM?=
 =?us-ascii?Q?EcfgJXKnzN8Yg3MOOYOzp3AchUjhz7nLB2UDLPeHmRiNhHIK60+krSbDbrwX?=
 =?us-ascii?Q?QwIvbex2bkroqyG49JtMZ22iDUNOA8maB3OvIPqKBoZXJe/aj5y62BL4XXZR?=
 =?us-ascii?Q?fLgdVmGdaKxTkbCnLTQSjTHT/1n9ICKwPKxt94pCY0LIPgcb7q6n+cRNL1og?=
 =?us-ascii?Q?ylVGbGXVXf/45g8YrvCf+aH6s+3Ko8W4jR0NnArDEdpvsyt4X+U8HG2U6JTt?=
 =?us-ascii?Q?ojURcF1/B0Ok+GUhE5lCuU3kdLipJjiA7pB9DnXiad+owkpfxZGn17S6kYl8?=
 =?us-ascii?Q?Untx13XrN7X2naEuq/PO8ykNQ7rlDfDig4yPAQg4VNIKoXjhizTj1JOcNC+u?=
 =?us-ascii?Q?4C8oZoZSXcPweBdjw6uJy+W5RY//DmVXtbA4AKY0YTe6ubePfRkz+K+x55UM?=
 =?us-ascii?Q?TeWlgL8ldy9BlRuR3erXGics2TWUqkFc0FIEj7HB8/KmOMLXULfifLa4TP01?=
 =?us-ascii?Q?OFmS2mb3eDzklKkDhhPY2sNM1tJAbJK9Hcs0/oi1SM1ctgzA8g42nCXj57/u?=
 =?us-ascii?Q?UYMKAUzmxUUBCrT0jjnotzuBBTe41RkgmuulCElgZ5OTgVDXZb7HjzwezpZ9?=
 =?us-ascii?Q?7BZ3gGIMRbHllCqFSQvG/+N+ZruLvIfXYOQ0iqh9vV8jDZ7bd9/17CAK1px5?=
 =?us-ascii?Q?WLNA3n8GAmV7B4xUcZDfpK1TjkIRHlw94wOnGR42snVWGce+mjk0OFL8NgQq?=
 =?us-ascii?Q?eZgxAcCzENGmib2/jNsg8e8oAHUxzjjb9u8JgShNzGogMKcIJweDD2TtO/Gn?=
 =?us-ascii?Q?Db29BctF+h6c+Nf3TO4t95pgCglkmJEybugJve/vZVivfZK78hiRPt2egafq?=
 =?us-ascii?Q?cmLE94QBpDXKYEZx08J2k3Jqrynm7JK3e8PZpmbwVN831Tmf/268oG2hQfpe?=
 =?us-ascii?Q?O7VTE1PMIblFqnZYkx0iyM4jKcmIcpVFg+SPv4Nzyx9e6Nnr4PssXgLhkZfE?=
 =?us-ascii?Q?LPybb8V+xP4wxU8rNDXjaAkA6PP2YqMMSRqOZIPAq4audACRdiNl2yXF/qph?=
 =?us-ascii?Q?NzNklkT/pae2VYHslOpNNIiq5o7HIVwbpiDtBCPXleN0pLv6cm0+yp22Rhhz?=
 =?us-ascii?Q?RBPjND0SFjfK1kwWh4G2cGskZzwy7KssPmdpyw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f443150a-ab01-427b-afc6-08da81a34459
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 05:25:45.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDXXjcoyyL2aInjOYYLYwCw2sHVOMBk5FdHS+s5yOTPbG6g10Xktmz/bW57XPJBq3GMDBut6RR06/qeTcNLSLS4IOXV29kagFlqQLF6FGYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190022
X-Proofpoint-ORIG-GUID: wO8g7i7Zj6Qbck9mGAe6Jpn0eSLoIALB
X-Proofpoint-GUID: wO8g7i7Zj6Qbck9mGAe6Jpn0eSLoIALB
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

It looks like there are a potential out of bounds accesses in the
read/write() functions.  Also can "len" be negative?  Let's check for
that too.

Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  This code is obviously harmless however it may
not be required.  The regmap range checking is slightly complicated and
I haven't remembered where all it's done.

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

