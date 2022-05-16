Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7957BC433EF
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 May 2022 07:14:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240923AbiEPHOM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 May 2022 03:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235171AbiEPHOJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 May 2022 03:14:09 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509B6E010
        for <kernel-janitors@vger.kernel.org>; Mon, 16 May 2022 00:14:08 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G3mbGo015504;
        Mon, 16 May 2022 07:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=vuxk00jgLJ1ajvnCRAyGn97s9d0f32CmTpiUmryRP0M=;
 b=M+kwQnJlb1s5kqqYH7AdshF4IWRFhhdRjh95DCFp81YpxbM06jxtOQrskGlIj/BcUien
 Gbh235Zdqe1wZ4KJjNGKw/Ozsu5VvzYcmm9vdn286L4P1BsEhXUTgIDKKsKy2bIVtByQ
 T77JWEmjNMDr8bE1yYMAU7Ebm/ZiOtQQEV33J+UeRk92wDJ2TKAroUGDW7jCmwz8fpp4
 uLo9+p335P0XJlNCno+ZxH8DdZKzPK0WMO3ZJgdHJ6kPfzedeDqpw7JFVW5wQdtwfopt
 7aTwUMQt+ZPC6AASTP/y5UzYjIGRrfEno85bM+J6t/kFYCA4thtdoles/HuCSsFcS/tB fQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g2371tfsx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 May 2022 07:14:07 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24G75Q8Z008876;
        Mon, 16 May 2022 07:14:06 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g22v18fty-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 May 2022 07:14:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fU4Cz4QqGC/SVG6w0Cj0NUqEH5USQurvy6s0uXdX194R4Ik6OpHFteWtrnG8SG0cXCozn/g//fsUYK0Mexyi6haiihdMgAtmbzypSwNegUNsDk8P7ROxqG5IvFtEDZ1fzvLfiUc7A+vErc8OkIQiV8+kJlqvQywoQ+X2HOsq6JQvZAQm44p8j2YISdWMTRPD1cakxrBTEICxQjQxclgjd1e8EeG7bAwzuzwmjgBQvbGOy07Dkq/L2KUdfR8ksjUTo9ElBfnlxeoSwHfwmSwVdbZJvavzAPTeo1B7Txre9HH4hZwLEFUWBdCcyuiEAoAitcSsSSoQIgi+DoNPgANa0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuxk00jgLJ1ajvnCRAyGn97s9d0f32CmTpiUmryRP0M=;
 b=bCo+fkXjCcD0wKmKHcZK5RTELMrlQVPYPuJ99BMPXA/bfpMtAVrRlazI332u0fCQzeiCXkrO/WCeVSvEVKrT4ZmjkrYNkzHzQma3hFZ6r1wlygC/BVWA2qq2gVYzLC2PFFBkjA92ZSUoYLUP82W0N6OnNEPdU1/B2Hq/s8OSj9LPSmaBZRt15OxeB0KE1GJAR1Ot0ukcLeYxbCc5UnpkOJlVo9aSmvoRICZcDpxkCXNCKInypkHIrMttHeP3zNjQ9X+r5rXhTsw9BujBCoEyVOxPJa6SpvQt+6aZNAdiXG003sHK038qAtytyBVYCO2oi+C5rbqNq3E3irNT0F/JtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuxk00jgLJ1ajvnCRAyGn97s9d0f32CmTpiUmryRP0M=;
 b=fWQaDNygdOmiiFxV5pnojiG/Qa6zpnG+VNz8pZQjTpqtEJowycDTEiG95cj3pn3YTA6Nn+DWwvlGhj78Yh9osQOAPWe71zfWhqOPHFjflRqFJ7H0gNWxOK2jkRWR5MCO4d0y5StfIk+LdpZf/8w9Qo/agFfrzh/ql+gC3bnhFyw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB2002.namprd10.prod.outlook.com
 (2603:10b6:404:100::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Mon, 16 May
 2022 07:14:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 07:14:04 +0000
Date:   Mon, 16 May 2022 10:13:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     habetsm.xilinx@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] sfc/siena: Remove build references to missing
 functionality
Message-ID: <YoH5tJMnwuGTrn1Z@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0057.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5ff5483-4a69-4ab7-a63b-08da370ba909
X-MS-TrafficTypeDiagnostic: BN6PR10MB2002:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB20022EC28A2EDA48813F96AD8ECF9@BN6PR10MB2002.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDluKFmfqRKn4mvXDbuuH4X1IiVI+xHv+beD9032twtsszCWgU4s2Hc/Xh4aeRISsRgyaiOIIF1hggizXFpX1tTy0zfULxvqRmXvTn4J5f7v1ZeNYllchYGTy6hWsJahtZ7rw/bMVLtrJL/RDgJKO8hJqfcwGwfXU7EPU2QuxuQtKmrkdAHZgxzGQOpcArBrCuc0Q9wQNC5WUCP4B2Yqzo5qLhJAAVNjGv2Iai5kJvtscuRtmWrvWlYh6/LInLThJBs3Q4L2zIxzNDGAxJOSP7YbiWibEF7LBuI3Le4ntqcs8VRWdFufkcBPS6f1IS2BmiByX6JeqIMVkhpaVAC2gqUKYCYzqWjwklsnM323Df98wFliuE5nAVzlUXAD/8wm+HT4KyL4M7HaLG86iNXrmu3XdFB4chdXVX7DJYdpsUeVX6z5hiZBsGcGAwDskyYnP/oXAHnL16QFV68jWzzT/MMvjmJ6+dOtaE/1zXlboV41Z/L3NY4ALC/j8wxdm/u5ekyNK4AhmpC+qNUKOvw38RIm3WPht1DIlSpxfBKrjO7OGzLIQcHzp8QJ6CtPtLtQlNJuMK0YKdNLjZPEBn157mIYDaRYXPl8JlNEObR+hAGyMtbsyNb+TraBENptLY45tuGxuHSR/EgHjfAbITjOPcE35/2QWQIByiFdb39kiCfRsBGt6lPa4totbrUAawPL8tgDrqQDptqFHQZcsbrMCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66946007)(38100700002)(66556008)(86362001)(4326008)(38350700002)(33716001)(6916009)(83380400001)(6506007)(5660300002)(8676002)(6512007)(9686003)(26005)(6666004)(186003)(52116002)(508600001)(8936002)(2906002)(66476007)(316002)(6486002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uiej8UOtCb/h4PvWDyxL+KC4rAi+Pe3o4+oc4APtJ81s6/PLGOz+OVI7ezaT?=
 =?us-ascii?Q?us4M+6q5QXbXhOVqS3M1Ojr5bx14i9ghRy+RzHOttcMgs5EqmeUnZaqrWP6a?=
 =?us-ascii?Q?Ftn1q+bf44ecGSMs4SvqiybwhsB4QM5uMHkZfpU/XzWp2xRObQQxzQJPijCp?=
 =?us-ascii?Q?Z+YAHL9PDSjnlIcUgHlKnu3nVFBFolYbp5h3gB/UkoaIzuMcHYeBx4Kd4GYg?=
 =?us-ascii?Q?vjCJk2jh6ev7x4Ws12VVHJucOJmyZfAefQrBTzm8Can4qFgxeGhenZ/KWtsp?=
 =?us-ascii?Q?4ZnBQBiE2fp+hQDRHWRHO1+A3F/fVbh9xisUKnLb0RYNL1RyGkJ8WtqHpRTF?=
 =?us-ascii?Q?0SoP7ypjSR3LJlqrjHQXosa6x65ZTrJNIlVPnE2BHW5dvT7DFwSU9kqEb+Wo?=
 =?us-ascii?Q?gsLT77M0ctsIS/PQWctMsD2mODo+ATYSJzT0r/52jfmatvkVkTqEAyyRbpL6?=
 =?us-ascii?Q?nkWLbkbWuKQG6f/FQIpeBryjMPgpqfM+3HFLnf1LAuSeEo8KdYGQixoNa+YE?=
 =?us-ascii?Q?B0bJBcQw9NwdH+bW1R65D4wZpz8UpMeAtS2SbGkyRe4MNYSlPF0Up9Kzf5Rq?=
 =?us-ascii?Q?IKp87bSFRBZgE60v3kSHTqvboomq+OrpiUiF7rwda6UK34RvmUOHXYkcqLHX?=
 =?us-ascii?Q?bYExiralwlM08LUoNNfOUo/KyohDQ+6/3yGhj3sL4AerZGYvgb+4kFba4H/v?=
 =?us-ascii?Q?UsRWinaewsRhsx4NmLqsl/rlp46PlAiUtabkb3Fc7+tT3jygUe2vojBIJXpB?=
 =?us-ascii?Q?cqRU569TUqckHHWZtNllgqTtUrmzprxLvoLHH/Aedr6s5CpxvHoGHQwLqHk/?=
 =?us-ascii?Q?NVsGpao1jyREtpQU2pHu1pocZ08+ZCQYbwW5xi4YgAWQh+LQtmoBsUq8C7Ch?=
 =?us-ascii?Q?EjEKBjgGJHM1Wr7f/LjoQ75bilJeC/Ja2bglCCj2Y9vylUlppTkYsccPXDDx?=
 =?us-ascii?Q?Vy2KDBsgoTEB1QmnkqUfDx+Mi3z7mW4f1MKe/3zpX6xZpTSrQC0CD12CyGuO?=
 =?us-ascii?Q?DV3CdIBK+v4c9lSXY5DdBcuKlwJ1NMsgd3TBwpO3wt3U+U1V+j1atSCzNgKd?=
 =?us-ascii?Q?ZPjg6xFY4WwSzr+d56mZp2oKl7GZbs1HvAiCKInjRm0iKlpepdwm2YKIB9mq?=
 =?us-ascii?Q?LUxwGRgFToZuOf2wmq1UuPCz54CubrNPsAEvWkjgcyYgdvUDVvslm721lyEI?=
 =?us-ascii?Q?KX/+OavKsnHsQOEJGzQD9bREntly+1cDyviGf7HKkQDNg1rRaavFAomSohM1?=
 =?us-ascii?Q?EkTlcNNy9sgGj3Yh8arTUFpoD6nvXv/ArtvpIKfI0ywkcRdyvsxQ7pAJFKnA?=
 =?us-ascii?Q?qaSf7I17v447u7hcIxAAr16ScVL1gjwHdmseIRzcpXrQn9PP7Zpx/b6U7Djh?=
 =?us-ascii?Q?p+ODM/7hSm7Y6Vdl4o/9kjvfL3cxBU7UZOZBlCP6fSmcsbzn7/CiuOpODali?=
 =?us-ascii?Q?k/k8cjb70TLwAhavUijsoEgrNFA0I2w5bU+PRT5Zxn7gGPJHyZrC/k2kQJdP?=
 =?us-ascii?Q?3bBEmuSoMlFFpGaoDYagwZhkoeDAedUcQ/gCqxIArJnxUcW4m2qZjXHf63jo?=
 =?us-ascii?Q?SenPObsPQWEFE7TN76jiYRzqSFzhRbOeci/DOPtCJCg0ac5Nb/n1JBwgL1mT?=
 =?us-ascii?Q?RE7DknMARSDb7t4g+iczePM/M7M5Vn1WvhIFttA5lJn80e5iWIkIc2D9TMoF?=
 =?us-ascii?Q?LwHljwygnpp1rurEGJ71wgYs+CXLDw0QzFIdHcTCWcc8hZXL7WoGQluZBPtI?=
 =?us-ascii?Q?F+zpydK40C+rJXnfiSa9ZRdBmPFf4JI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ff5483-4a69-4ab7-a63b-08da370ba909
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 07:14:04.7589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCPMKQx/1kNxP6zsDvOXG4mXyQ7C76IKMyUD0xc3N558GVP1v/lPVp1Lsmnlwa5x1IiKvn7g5zdkf1/SUJTUlZBgPTuy7AQ3sTF3wAHgaKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB2002
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-16_03:2022-05-13,2022-05-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=838 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205160038
X-Proofpoint-GUID: EyV4JQbN14CwtvigO4Mm1yR6jtTUW2g8
X-Proofpoint-ORIG-GUID: EyV4JQbN14CwtvigO4Mm1yR6jtTUW2g8
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Martin Habets,

The patch 956f2d86cb37: "sfc/siena: Remove build references to
missing functionality" from May 9, 2022, leads to the following
Smatch static checker warning:

	drivers/net/ethernet/sfc/siena/tx.c:184 __efx_siena_enqueue_skb()
	warn: duplicate check 'segments' (previous on line 158)

drivers/net/ethernet/sfc/siena/tx.c
    139 netdev_tx_t __efx_siena_enqueue_skb(struct efx_tx_queue *tx_queue,
    140                                     struct sk_buff *skb)
    141 {
    142         unsigned int old_insert_count = tx_queue->insert_count;
    143         bool xmit_more = netdev_xmit_more();
    144         bool data_mapped = false;
    145         unsigned int segments;
    146         unsigned int skb_len;
    147         int rc;
    148 
    149         skb_len = skb->len;
    150         segments = skb_is_gso(skb) ? skb_shinfo(skb)->gso_segs : 0;
    151         if (segments == 1)
    152                 segments = 0; /* Don't use TSO for a single segment. */
    153 
    154         /* Handle TSO first - it's *possible* (although unlikely) that we might
    155          * be passed a packet to segment that's smaller than the copybreak/PIO
    156          * size limit.
    157          */
    158         if (segments) {
    159                 rc = efx_siena_tx_tso_fallback(tx_queue, skb);
    160                 tx_queue->tso_fallbacks++;
    161                 if (rc == 0)
    162                         return 0;
    163                 goto err;

If segments is non-zero then we hit this goto.

    164         } else if (skb->data_len && skb_len <= EFX_TX_CB_SIZE) {
    165                 /* Pad short packets or coalesce short fragmented packets. */
    166                 if (efx_enqueue_skb_copy(tx_queue, skb))
    167                         goto err;
    168                 tx_queue->cb_packets++;
    169                 data_mapped = true;
    170         }
    171 
    172         /* Map for DMA and create descriptors if we haven't done so already. */
    173         if (!data_mapped && (efx_siena_tx_map_data(tx_queue, skb, segments)))
    174                 goto err;
    175 
    176         efx_tx_maybe_stop_queue(tx_queue);
    177 
    178         tx_queue->xmit_pending = true;
    179 
    180         /* Pass off to hardware */
    181         if (__netdev_tx_sent_queue(tx_queue->core_txq, skb_len, xmit_more))
    182                 efx_tx_send_pending(tx_queue->channel);
    183 
--> 184         if (segments) {

So this if statement can be deleted.

    185                 tx_queue->tso_bursts++;
    186                 tx_queue->tso_packets += segments;
    187                 tx_queue->tx_packets  += segments;
    188         } else {
    189                 tx_queue->tx_packets++;
    190         }
    191 
    192         return NETDEV_TX_OK;
    193 
    194 
    195 err:
    196         efx_siena_enqueue_unwind(tx_queue, old_insert_count);
    197         dev_kfree_skb_any(skb);
    198 
    199         /* If we're not expecting another transmit and we had something to push
    200          * on this queue or a partner queue then we need to push here to get the
    201          * previous packets out.
    202          */
    203         if (!xmit_more)
    204                 efx_tx_send_pending(tx_queue->channel);
    205 
    206         return NETDEV_TX_OK;
    207 }

regards,
dan carpenter
