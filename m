Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDEAECAAD1
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Sep 2022 10:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234029AbiIAK1m (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Sep 2022 06:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234170AbiIAK1Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Sep 2022 06:27:25 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BC91166CB
        for <kernel-janitors@vger.kernel.org>; Thu,  1 Sep 2022 03:27:14 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2819H1D2016997;
        Thu, 1 Sep 2022 10:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=HB34uJOytPV8OuXiNhJbu6bpa/LCoIGPmw1EkAkdAOE=;
 b=uLql5Sr864ybtbAd4NtAYzzi87fay3uC4EODGGKN4bfWFKalM+yLU07nh8PWUCWD1f2P
 o6bMXTJZVnv/QC8+gtWHdJQ4qCzM6lBBXPbYuN+VxwiL+S2o0Y6JY9vjqIylboGUaBBW
 P9gWAhFTuV3ZQwH/V1Hv8Qb+oWAHTpuRS2pGO1KZzEreUKwn5npMz4H64Wu7du1OnOWn
 p4ZfpWqRDcbTlmNjfYCk0Y970q8ohbY7OXR96zDT1VkPFKX1rFa0Z67BhnK0Q4ZFQWHX
 3NvzeUJmNdUeZOZSWscmTxxXHrMTI7VkRfkRSfyQsdN5tCxPrfBKT/hfGA28BVIoWMtJ dA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7bttbtvt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 10:27:09 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2819p9UQ022974;
        Thu, 1 Sep 2022 10:27:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3j79q6a4h6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 01 Sep 2022 10:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvty+B42CeGpPkHuCIrN5D6o8/UqJBhKovbZ/fr6IJ65r7YoOwWMh/16ezLRQd3CxsJiNi+mEXf/bHCLXBFPAQca6oUHemM/HUo/Vn6K0HQ3Cf40+/VMcCojJnLN1SHGUYL8mwSegVweW9x3t3i2I8X+JS2wHi8rSYBR1/8oqpsosx2IMEJXxxG2HnU2fKzNFxS5cCcJPcMV01FcmkvicFdMdANawtW0lfHkU2Sswvxdn2Fj6m5Q77SIVr4Arclaw6aMOuRhBfz/hUEVlRsawIvN1l0IamhNafaLE8l7wZaPBdebXwYVgCkdR1RDlXrqVeMTubWE2X5zvpbCfUZdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HB34uJOytPV8OuXiNhJbu6bpa/LCoIGPmw1EkAkdAOE=;
 b=hYpbmTJ67HvOrV8WGyQbVBnrm/7nw7d5zC0I3TawP0+QoyDkPXkv4IQDND6VHCM7mD56ivjrAJooIox4ifU7SRNdxjQvZckNsP8+LEOk72O2wMesN6/V49InVvbiWKYjCdu583uMXya6kTGnTMubtTkpFnioxRPCpiVvwocX/RIn3Xpuzbu6HxgL/5Y1TXhUP/z0T6ehw4CYURXRiD8uDVOX41xpOQqm/xAgWj74l+cuGebQBrjDtJibZLht4vYpM6/TxQvPIS+7Iec26c8l2EQNMXv/nHJsy6XCOUXVc7J368PuGvri+nBX2gRF8dmR3MC+84grkMoRkTFakRWkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HB34uJOytPV8OuXiNhJbu6bpa/LCoIGPmw1EkAkdAOE=;
 b=DvfN7NsidwQbqA+1bqOibR/3JMt7ualdi6B7VfFtPFQnh1oDTltTtsw1R2aceVNSbwQho1wvWsVR4IXdZi4BiU7kHajd7kLqQJCAWSiQfrB9q5rOZ3v1DyhvJTpn4revIZ3la2h4lTpE06nR+BXbyltI1YgZHTDJhFOsV4coP28=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5016.namprd10.prod.outlook.com
 (2603:10b6:408:12e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 1 Sep
 2022 10:27:03 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 10:27:03 +0000
Date:   Thu, 1 Sep 2022 13:26:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mengyuanlou@net-swift.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ngbe: Add build support for ngbe
Message-ID: <YxCI7jjmqUe18JgK@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0193.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d47d760-8935-49af-01ef-08da8c0482fb
X-MS-TrafficTypeDiagnostic: BN0PR10MB5016:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiTpD6FECkEKbd5j790Her/ts9n2rK8YzeOJ/kucIMaEaK9JN7cxfX6oMUYymG/uF/9yP0zyHqzcRWu5M6ydlAKYCSxjn5Su5m/9eRWzjCnyfr1PJseZkUR/IYlSs3OJ3Ta4GXD1ubvB3GwkpIVo2eIIeLum0PF5VWpze12SyG7nTSAEB2EXAndpuZbBBwhd7fiQwDjEi49Vt+/ni3zqTYFPkMtDQeK8YO6/1sNiwbFleges3I/6WCqRa3XyM8BL4AfGfOHJj4G9GokEFTWDSXPqcenDY8lFsGjtMnhboetpCYTQRd0YEvApCBrUy7K/KDy9n5nLOsYaifpZLdcDeeYvfa+vOqGHE5BbzrPEDfTLD2+QikU1YqO8qZ9tajafkVWBZBzUT4dY+Vq+vfpEqLW9Q78S+dJAVDSfalwvB4mq3A16tCAux0MVXbSF5oBHLZFXsMXMHRK444y/ch3ihBoR3S5Ur3tCh+pHdGuWcyAiJDVMngNmdueDxATPC4hx9uB6j3Rf52yfILoj7c1HUBaZdLy8w30pXYiOksjI6jY2Y2xcCYJEiKfZ28CHLG/YOewGoNPoBNVulckNI/k4daUrXlQ/xCPM9t3A1jjvXKhiOia/MxP1YUDVIgqEgkRQoAj8wY7JPL18Hft/GhPSHbbIwG+FIkhGsEJxfLYuDb5L22AOmoeLl7Q2vqdOqr37ubu5dxv6F0uZAhsj0Wt/Aeiip88wPz3mxhWmYW8rrGUZ58dQnXUsEp+h2ojYqeGP+7pBW3Xy9l5g12vE6vSeVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(396003)(39860400002)(346002)(376002)(136003)(8676002)(66476007)(66556008)(4326008)(66946007)(33716001)(2906002)(5660300002)(8936002)(41300700001)(6506007)(6666004)(316002)(86362001)(6916009)(4744005)(44832011)(478600001)(6486002)(186003)(38100700002)(9686003)(6512007)(52116002)(26005)(83380400001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CTPYUnBCOxagJypEX6ohI2J50KfDOnse2lF/l6mrun9QrMWZKBasPLLRQogX?=
 =?us-ascii?Q?bdKhcFjKBx6gqLEC9GeeJsEKRi5WVK2y5hhLrVDbC1RCfF1fHjIjsLHbbtLP?=
 =?us-ascii?Q?6lPC0Vh+6auaLCHBIrRNPDpwt5zugBefSn6QUcD35n8miH8sboWOWs5dGRA9?=
 =?us-ascii?Q?G0olu5dlDyNDdC9EK+t1QGOGUH3afdkK67o1ShpYILWdOhY811MhGGv0HtN5?=
 =?us-ascii?Q?wGifXf//B+EJyh7W7ZGQxequztqafJCVc/NHndA9tdI1+tffbQqnKYOrNUjM?=
 =?us-ascii?Q?PwNhsIwALeAV4jJmQKnsYgNDxmvonmtknbPj28LmaBAZ35IDqoQG6Hy9FDJ0?=
 =?us-ascii?Q?CjiLeChz7B3x8p5hGsgaJ/nMp5kfaxhZ9Ia2rmNmv72yYrGoiCGIJYRbxC1t?=
 =?us-ascii?Q?ykI5owuz+yD3UVTTpyQjwPH48KmSak3auODVgHRb5oz5wO2QlMh7GZZ/2XmA?=
 =?us-ascii?Q?0kHVM7y3tKp/81iplN7ItdJGkSmTi4U4MnjdU7mU0u6+0rnvAFP7tdQii6DZ?=
 =?us-ascii?Q?wbolwm+36GojwkKVvEOM1pPPUpru/hl6tLsyv55+lCpf2vgWvnIqbo5H3DrL?=
 =?us-ascii?Q?GFcshDpWwUth3mOq3O/kOJP7bh69sMPaZ9nedKfEluI78aeX6SILfJqzxs86?=
 =?us-ascii?Q?o3DLB1c7jaZtYKgYcJRwf4Mp78HmVzYAd6HO1oglhVl+PA7CAHReLC3hwU8w?=
 =?us-ascii?Q?ZXg40jcGgfxJ1+l1qDfDbl/z/I4ES0JjT2d+gVW028t/c9hmoI+k7aC1+WD5?=
 =?us-ascii?Q?PJylgCtRi6TIbglbAJTbdLC1Gs3VTwzf/FGdlBF0M956nWY+FknLsVbjHclH?=
 =?us-ascii?Q?hAuYwNBB1Awcqt9ys5oZ8ctQMdLlLfis1mxEvHd/ViInrg3addhkaknsezID?=
 =?us-ascii?Q?FZQIAT8puyHzvGxSY5eSRMSS1aWRLNHljMXqUiWzNQW2QFZR6Jzid9cnz2N9?=
 =?us-ascii?Q?D9YxYdBVU4GZsZ+oI8uZF+ezgc9bJo96jh/1SZzg3jj7INY8aiCQoyxezH0q?=
 =?us-ascii?Q?E6j4JhSW2t3N2uXMZUQKFgloBz/KF9oNk67PseeVBl8AjsNzCbKjcmyHxkSD?=
 =?us-ascii?Q?d9lGLMj8gviW40XPR/CKUJborh0GKUiVWj87ZpcnOoalrjLP7GihWMuvZfsu?=
 =?us-ascii?Q?9ASWUsY3cQRREgxhk4ue01Q7slC/V9/B9SrgrwWnCR2mEcq2HxeHX2GmQBJS?=
 =?us-ascii?Q?b7Bv3NrZez2Nlvuw/yKBMhYJiXPyJBGeZ8S3m54CxN1ejQDG4JA5Hzkok6K6?=
 =?us-ascii?Q?1LFUuJy21/b7DzHG18Z0n97mGNroQ4cet3Y/uQzY56yG/mFH16ud1eF3LLC9?=
 =?us-ascii?Q?S19I/jyBT5wNdsC8ZVRSpE18+wjZmwDCx7iKvqFFmFxwRewNPjjEQSBoqE6W?=
 =?us-ascii?Q?YVX4FzufUlKvqB/yP64iPllvr/skfrGQ0d4BEnxR+Wtu/qH0RuwN1UOmi4Tc?=
 =?us-ascii?Q?E4E5WTiiArFRcvH6JrdhmhE1/s3lB+EBFHPX8fYT/GYsfdqOPZSCoCM5ftUt?=
 =?us-ascii?Q?SONN9Zn9ZBFJbQbxvUWyyzYb8NaCnwfEXpWqz4R/YLeGE8PwCpsO6r2j9yxs?=
 =?us-ascii?Q?z9CojtoVv1mPNOCoivTIoPugQjq60D5dDKXklIboTYHlhzSqnprkLb8x0kxV?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d47d760-8935-49af-01ef-08da8c0482fb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 10:27:03.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBu7TTMjXIQzq/9i03Davt4BeTRf2oU9Dw/ZJ7zdyqJPY8Tn1JNwvrDn31HyxS61J9pKK4ZP7GfB15Rmsk/SbMYdBOqTlSK3JJsjKsbyoTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5016
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_07,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=945 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010046
X-Proofpoint-ORIG-GUID: 6oIMAAbx0a3d-M8dgHF8vYGHBrUtZDtH
X-Proofpoint-GUID: 6oIMAAbx0a3d-M8dgHF8vYGHBrUtZDtH
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Mengyuan Lou,

The patch e79e40c83b9f: "net: ngbe: Add build support for ngbe" from
Aug 26, 2022, leads to the following Smatch static checker warning:

	drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:54 ngbe_shutdown()
	error: uninitialized symbol 'wake'.

drivers/net/ethernet/wangxun/ngbe/ngbe_main.c
    47 static void ngbe_shutdown(struct pci_dev *pdev)
    48 {
    49         bool wake;
    50 
    51         ngbe_dev_shutdown(pdev, &wake);
                                       ^^^^^
Never initialized.

    52 
    53         if (system_state == SYSTEM_POWER_OFF) {
--> 54                 pci_wake_from_d3(pdev, wake);
                                              ^^^^
Uninitalized.

    55                 pci_set_power_state(pdev, PCI_D3hot);
    56         }
    57 }

regards,
dan carpenter
