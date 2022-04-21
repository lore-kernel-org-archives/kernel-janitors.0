Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679A4C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 21 Apr 2022 15:53:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390309AbiDUPz4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 21 Apr 2022 11:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244480AbiDUPzw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Apr 2022 11:55:52 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8154515722
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Apr 2022 08:53:02 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23LE13pf009567;
        Thu, 21 Apr 2022 15:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=RjXXqvr7XnJ0zTNVFUCxabQyJpX4OGNPjileAUD7GPs=;
 b=gwWrKGckC+BbOrio8z//3KCpgyQRZEd9AJnoEScGWmaNxt9gBsbtFUyUXuifUky54fCW
 LsHFzwtu6MHXNnmpM/TMngQYfbBZ70o1arWxOkBvme4Zmll1CoszJ3ko1cIO8SGmdAck
 1idC2JNj6himw2c7NDQGMi0bm1bG6XkyWFJWuvDgyyv5ThI8F+EOhGLtRVBDpavn1Orz
 LWjDeOl2XkMTPZ/wlRxetT69SB9Qazk5r+yt0bXnpT8UMDCmG5AoiD7ArBiBWV9BtFug
 EyALXZOHYRFO6NspScXRuKSq88BtvBMCKj8fMucL04ddyBMln0EsTXX+BXNsbCmAJvuC RQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ffndtmfcu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Apr 2022 15:53:00 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23LFpltY001706;
        Thu, 21 Apr 2022 15:52:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3ffm894wyq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Apr 2022 15:52:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOyKsIK+2Fh6y0BPM3uA0cL9Xr8cxjbhpKYCpAm46bX4LuVlxFe0/W/XBMcO73r26xscgAkAJPlWovWxcroUfFEgH95G0QAKofuZWx51Upn4jwTZM02MczTa+tHRbmOU8PwuSUPg2tSLxdWbxS3KPYA8ItU5Rpe7LvJy9DmdfT/C+8lhWpN/nrhECvT6PEm5zhTW/FU0uOcK2GX2rRB/l1Xmv3okOJolcunQheZJRvvfL48hmTWX/DtHx8P08ZeZTIIS0wOQfcxeCHRVlcKKsg8hvRx5OSJ/7O322gselSq6JO2ICZB3//XtAyGbtmSxUZvfFFWt+RexvmSbV+K0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjXXqvr7XnJ0zTNVFUCxabQyJpX4OGNPjileAUD7GPs=;
 b=T3kI8JEEOw9MkdcxEYwGevQDKSW0gDLGSdNg+PP6NahdR7gs/1qp5+W7zSg+DyjiaaGTwM2anb/nzcDLzkN2wqbWu07CXf3zu3BU0RgVKwJ9VHQY3jr+EvAcZWzuwygLu7p1CoEBjsZ7iaf/nUA14wIUu7c1aOSQJCMuyaxf68n+2HhgBZLpdvHQThzJrHsMOfNtIKkW4k9g/OB5g4PDzTtrbTbpbQPaRxhakjftpWA7avX1NYmjhV9g28cgwyT8CicS15jXAEWDAf6dHYBjWO23T6sWwGhgKyOqineaD1aNfDEU2sFVx6t8R9+Tei5wcACk8TL0r6IdyA6uKUbL/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjXXqvr7XnJ0zTNVFUCxabQyJpX4OGNPjileAUD7GPs=;
 b=AfcHl6yGdSPYjrRn70FZkF+2ZuzL9tgq4oigN1ZRLlyzSxMb2oZ0Su8jraSPbCU4t7UO4CdhibPnxK8MYgWWCeWC5rhx7hOmtmHLCptMsZ5Ffm4MUIv+PkpOVbFVVz8jitbCmm3DpmXtDBOBaJ5TAE/YEdpgVuhYU2kdjLzP4sY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1634.namprd10.prod.outlook.com
 (2603:10b6:405:5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 15:52:57 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 15:52:57 +0000
Date:   Thu, 21 Apr 2022 18:52:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     horatiu.vultur@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: lan966x: Update FDMA to change MTU.
Message-ID: <YmF90Dj/DKXoRMiq@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0058.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfc35d85-de29-453f-17e1-08da23af00f5
X-MS-TrafficTypeDiagnostic: BN6PR10MB1634:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1634A8E6EC03DBAA2BC06A708EF49@BN6PR10MB1634.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLd0RGVqoHidUKthdBrL2+sQUslOMyVRsi4CDk7FiFYAsARUCSOsRzQJGiSiDviMsuKEdmWKhqb7XtWkTAJ81KR8YpWpDgRT7HHujcpmeJN5HLeROp0wOZo3kVJgPuqZ1sBLrjOUtzFpnowRlLBQIv8+uy5Zl4sKXxKmH36QJu/P3NZVN9mzyj4fCTR3MP1Qg9ExzwTiM19ft0FnvlVm7RzBYwilipVVWhwg2dsglcLhBIoQEz8NaeoFBcdX8WWd4g2J4yLnX35weh9SGSkj1k6MCyjDCRDD048hw4GJibOwWZr673StS2Dlxu0UbAa5EpnPJNtqfpKQ49Ti50TAPN+3vWHgokNqpxP3UleeN2VH+F2Irxwzmri/SAXX3TgD8H3eKFVAZmKdLXLWP9K77JttXbfw53+pyD6BR8TneX8DAT3HOeCvQ7XnfGx4YA48oT9h6Z9YqpWTIb+MZuyuCgwDt36NWvlHf2ZV2DPbUGXmrCNt72OxGN644vF4VC0mZ9NuU3jzIqvovwEC+eEN+qw+2QWITm3vg/f3PBK31JiWMsGSZDaX3G8aOqkvt5S8g+CeEOMamASSa9yJ51vYN22aLykl6zw+Cdbd/cO5KS8uxiJkC2Un892XO6jqz18fZ3ojvnIZrN0R5T2OQw/nNNzSPAyKeIQpuTaJVW8tVVOi/1/Uc5JoPNNbJoYszIjLEETIyqT2F6KAfNjsQ83bQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(4326008)(66476007)(83380400001)(26005)(66556008)(33716001)(66946007)(86362001)(186003)(38100700002)(15650500001)(8676002)(6666004)(6506007)(8936002)(9686003)(38350700002)(508600001)(6486002)(44832011)(6512007)(316002)(6916009)(2906002)(52116002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mqgk8iRMsW6cuiVOftbZMZu1s/vw+bgUK1vbILCOQ9F8gVoAtzQlv2hKKceJ?=
 =?us-ascii?Q?a1FV1BYO3U3Pq5ThkjaA4r5QNzTqUoyTCR5RoNhwdSR3Wdw0OBb0qQqZrko1?=
 =?us-ascii?Q?QcTULKgAX+/Gbs2aiiwCTHRUwr7ejBT4SOay8NXsTwBYJLG9zsFZxggZeEwE?=
 =?us-ascii?Q?Sq0ZyNStGepvpTXdH5IGtmstn3sHfoNEH6plWp40LhX4MP3ZBbTXoFcWj1EF?=
 =?us-ascii?Q?rNQCxJavWWiy35KjSKAbh1h45RTTsyfSHB7qWfp8MOYXHwts5CBkLgos9O2l?=
 =?us-ascii?Q?sMjGx5+NqLqFcaquISdtgbqoGkVQN4ksXKOfNNA7besBgkf8k0kEkk/CaXSz?=
 =?us-ascii?Q?fba8anNSuVkKw1l61ZH/u+MlU+SM5geY5sLbcXCL4LN3+JpRVdTwmqbacFEw?=
 =?us-ascii?Q?B+kcrSeSg9aPeKloF7dijCw6uDhPz1egqsiYcg4YjWRXdcK0LrCN1/SKOCCk?=
 =?us-ascii?Q?Nx+wmxYKtxolvTV453Lcw2rLiET3gIfHWFi56T2z5lqmD/NvtEV17iR5r6gm?=
 =?us-ascii?Q?PX6e3Y1qlz2Iztz4CVjH2W+VVl3ULK55zi3BmtZMfnVHRbJGDN5hAwB+qIrD?=
 =?us-ascii?Q?N/z5rn3nu5imzbHutok9ZcIJE4xHMo+6hm6XXq7nE+x9x8pyADMWVkb/xObu?=
 =?us-ascii?Q?LVLFLDFBTuNkXzHt6le6l3xtZ9FXd4RROqM9vKQ6zJCT8E94epBp8jW65FmY?=
 =?us-ascii?Q?gLnpwCIfwnZPFL6VPxrXCKzkW4a+7tKFxxsYlx/X0AgAMClGnztNQy2XDcDm?=
 =?us-ascii?Q?Hp9Z+Nbua0KEQghrurIclP8ed57rgvcdkgENzX8XsAwC04AcMXGthtuTpNLm?=
 =?us-ascii?Q?dXuNJ82r1xZ2g9Ya4/an1tyA37wcMuriQlq0P13rkGNnNd5/Zpv4wsOvBznF?=
 =?us-ascii?Q?SNua2/4MkfoE8WmKaWIS5PGAnTICLbVe+MNoGoMaD7FrjkEB2CIEuvL7NvLI?=
 =?us-ascii?Q?IQb1L1U4IulUq4jb3TkK9JLa/CYaERF98wWWZh2ncu3ASeRKs7FIKJBwjWDq?=
 =?us-ascii?Q?8bfv3cBMzNK1m1+71/l3AuvB12fFMZD1pSo5Ecy+GhBe18XZ5EDqe81+lT6Q?=
 =?us-ascii?Q?jUx/IMdtviH+1GjKZIt1fSRhtOqKIa4wrDiap+BIP354KjLiaNo4qOsZthbz?=
 =?us-ascii?Q?G1MDIqyb6Gn66/N4vMo3zSKNt9uTXX6L1l6mv50lw5hqrvLgE2Jfry8aUP4w?=
 =?us-ascii?Q?Q5qApjGMKA+nkz7wMiGNrcfcgPLYcLAyvgNEf87sUpBSXCRAReJ+dj0lINR0?=
 =?us-ascii?Q?IzjPvfUlFAnI8OOBoJPmt/WvDnwiMcjEO0o1TsYLzZr70iZdJrGAwW9xaRTH?=
 =?us-ascii?Q?6yzkhcc00UA99lalT2pDjaxKwsY8wIWF3r01egZYQ3khESAnCrDf3JGF6HeM?=
 =?us-ascii?Q?wU2khc8r+kcAgUktbSr+9IkRSMQJ5bZGTlDroAv0XInlZk62NySO6BGzkxmd?=
 =?us-ascii?Q?8dgocQdLv8HbXqQMVGCzEYBtxJlp1sq1Fa+zrQnSVNqlCQ+1i484xklKECY5?=
 =?us-ascii?Q?wlSNBmc62krIJp1iBZWUCteyrDRWncsFIx47xAWPqcPucHB1/urAzhq6oMsy?=
 =?us-ascii?Q?BYdvHj4k399zxnuCXCbeUDm9b3oGuorbBy+jchquHdilZ/ktsM2mo+Fbyiz3?=
 =?us-ascii?Q?5rHD/nDNKuO3IfcYZAOsuXpkfEcVeuhyI1RxZtTlMjhhDMOAbsWRGFKyvEGO?=
 =?us-ascii?Q?IjxqOTQWpjeEoKB+w+1e9nIqtkjRvLjyuynBWWMUaAYL9ufn7SNBFL6Pw/UE?=
 =?us-ascii?Q?NKrv+5/YYAwy1ddfx/0vVvcwPh4TTck=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc35d85-de29-453f-17e1-08da23af00f5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 15:52:56.9751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0sJXdiEqvEbmf8LJVgRZFs/04sSCt3GIrA2pkMt9vXlRG5Ttrt+qrTI0yEnTUkOVC3/EKFQdUnnF6fD1EZWs7oWqfVsg1WiqYK1cSSooXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1634
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-21_02:2022-04-21,2022-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=786 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204210086
X-Proofpoint-ORIG-GUID: zg2dG7t2HRlMBGuW3SpB_nVYNupAF3vj
X-Proofpoint-GUID: zg2dG7t2HRlMBGuW3SpB_nVYNupAF3vj
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Horatiu Vultur,

The patch 2ea1cbac267e: "net: lan966x: Update FDMA to change MTU."
from Apr 8, 2022, leads to the following Smatch static checker
warning:

	drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:736 lan966x_fdma_reload()
	warn: 'rx_dcbs' was already freed.

drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
    685 static int lan966x_fdma_reload(struct lan966x *lan966x, int new_mtu)
    686 {
    687         void *rx_dcbs, *tx_dcbs, *tx_dcbs_buf;
    688         dma_addr_t rx_dma, tx_dma;
    689         u32 size;
    690         int err;
    691 
    692         /* Store these for later to free them */
    693         rx_dma = lan966x->rx.dma;
    694         tx_dma = lan966x->tx.dma;
    695         rx_dcbs = lan966x->rx.dcbs;
    696         tx_dcbs = lan966x->tx.dcbs;
    697         tx_dcbs_buf = lan966x->tx.dcbs_buf;
    698 
    699         napi_synchronize(&lan966x->napi);
    700         napi_disable(&lan966x->napi);
    701         lan966x_fdma_stop_netdev(lan966x);
    702 
    703         lan966x_fdma_rx_disable(&lan966x->rx);
    704         lan966x_fdma_rx_free_pages(&lan966x->rx);
    705         lan966x->rx.page_order = round_up(new_mtu, PAGE_SIZE) / PAGE_SIZE - 1;
    706         err = lan966x_fdma_rx_alloc(&lan966x->rx);
    707         if (err)
    708                 goto restore;
    709         lan966x_fdma_rx_start(&lan966x->rx);
    710 
    711         size = sizeof(struct lan966x_rx_dcb) * FDMA_DCB_MAX;
    712         size = ALIGN(size, PAGE_SIZE);
    713         dma_free_coherent(lan966x->dev, size, rx_dcbs, rx_dma);
                                                      ^^^^^^^
Freed

    714 
    715         lan966x_fdma_tx_disable(&lan966x->tx);
    716         err = lan966x_fdma_tx_alloc(&lan966x->tx);
    717         if (err)
    718                 goto restore_tx;
                        ^^^^^^^^^^^^^^^

    719 
    720         size = sizeof(struct lan966x_tx_dcb) * FDMA_DCB_MAX;
    721         size = ALIGN(size, PAGE_SIZE);
    722         dma_free_coherent(lan966x->dev, size, tx_dcbs, tx_dma);
    723 
    724         kfree(tx_dcbs_buf);
    725 
    726         lan966x_fdma_wakeup_netdev(lan966x);
    727         napi_enable(&lan966x->napi);
    728 
    729         return err;
    730 restore:
    731         lan966x->rx.dma = rx_dma;
    732         lan966x->tx.dma = tx_dma;
    733         lan966x_fdma_rx_start(&lan966x->rx);
    734 
    735 restore_tx:
--> 736         lan966x->rx.dcbs = rx_dcbs;
                                   ^^^^^^^

    737         lan966x->tx.dcbs = tx_dcbs;
    738         lan966x->tx.dcbs_buf = tx_dcbs_buf;
    739 
    740         return err;
    741 }

regards,
dan carpenter
