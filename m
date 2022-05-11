Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7A6C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 11 May 2022 13:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244275AbiEKN7x (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 11 May 2022 09:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244262AbiEKN7u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 11 May 2022 09:59:50 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFA85B892
        for <kernel-janitors@vger.kernel.org>; Wed, 11 May 2022 06:59:49 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BBsgBP003190;
        Wed, 11 May 2022 13:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=S4opLXCYfB39RFcIiaGybIuHW1nY3l4Syw4I3kYO5U8=;
 b=M2bLJc5eWY3PT26fGzdF4dCTawtNfPItSQDjpCPFO+fvRm8uhiZvQTEMGC0mTsVeQxDp
 FcU6CKXG6ZwTSD0eDGBscObITqTfVj6LWMkV0cFEW3D09nt5q5jUOeNxLqNHg/fkjrqk
 2txzQUM/QEhUw0Udr5tXaUjuFQ1s4BCOfkjQKtsaMs8nMJcAT02GwohW4KIbPx8VE+kU
 KVyj6fSXaoD8mJQ7Vol/6iQw2+VbKg0ETOLMNOBANRhuOh+un5w1hHHaEZY0jQH3lt9x
 iK3mZLN6y8UeyoTmUcDh1A98f5mMp6JnM+7qKMaHxR7f9+hQm9qC2HHDgKHKV//7KtE3 fQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g0a04gsnu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 May 2022 13:59:47 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24BDuPPF021571;
        Wed, 11 May 2022 13:59:46 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fwf744m2u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 11 May 2022 13:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Od0Kkm6C+6dfvHcZ0YgfNJswBcZsbejebcWBGz8Kj25mw5JGOWqz+YGrSkr3R3IJEoIWBFh4jzRyqBcMsf2NNniYrCEt8Qwgx9Xaiyp9NY9l+iwk164kSIGfLHOU8DYgrSzv1lqn3IHT6kAOYwfw5CZcI8ED/mhM2CNr0erHRXJcGc/t2RKp4AtZU1fEyOxZJhqkxOIRgcHgO+CnOEhyHXEDKB1gI4ywTQs2xZNhnby+VnsWu2P+nh1l3hlLlPlbwIc4rjaU4hqCZQD7jeMcJEStDpvmLhS1mk1wLpL9fxAZeqNwWELbHQhNJtcYc3Dq2PoibAs1br1JlPu5GZ94Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4opLXCYfB39RFcIiaGybIuHW1nY3l4Syw4I3kYO5U8=;
 b=IJpLVs0wiz8T9/KhToXrxvlks1zgI8PDMPxT09TZp7jMHVrL1gseUX/JlkbaTh1eYLuciC2zecYYjiuVqzT5euzggiiGFnIN5b7Q2jFgwMwdG/ekKCJjxQhNZb0/ocbHRWnnpyBYS/5GdwDzhy3NVa6VMumweK5IB1cpJzgPc9OeEZLAZvAxbdOZQKLu/VKLgTD5HSnNM/kDC8giZFaoNGOqVHJdc8lsHHGkDHZALo3xPSWpn0LWIJAWR8NNQ6njZLZaIGPWP1npB7nNMcRqhDG/RQ/V3fhZPa3LA1KOz7Ye2PcOHrAwhS6Wj9613DI8kyfDVp0T4rondgWhA6QTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4opLXCYfB39RFcIiaGybIuHW1nY3l4Syw4I3kYO5U8=;
 b=CufZJBOCXANgIjqW97/jedd0Fc0AzMywxy6TuhzeO7IhHDWfxki5N1iYxTLKgap1vkCx58Wdrf4uNW+aDQOty2a6urwX5KIh4KrhHzIwW0innL/tkplrBmUNevmHbCFwFrwG7JT2tmEBwb8dBvDB0FDr7gQu6LDvbaac4fMIhm0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3869.namprd10.prod.outlook.com
 (2603:10b6:208:1ba::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 11 May
 2022 13:59:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 13:59:44 +0000
Date:   Wed, 11 May 2022 16:59:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     horatiu.vultur@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: lan966x: Update FDMA to change MTU.
Message-ID: <20220511135931.GC29930@kadam>
References: <YmF90Dj/DKXoRMiq@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmF90Dj/DKXoRMiq@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0032.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9628079a-9d56-4e57-a2d7-08da3356806a
X-MS-TrafficTypeDiagnostic: MN2PR10MB3869:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB38691AD312EF4B0A56A9B3F18EC89@MN2PR10MB3869.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbtE49JN8LnxU6+8MgW/nV3b0/D0HLEeESnGj1cy6sH6RtJfokHh1sAwi8AwO8x8Usw1QBg5Nr4Zcy33hYgMpP+goB71nlQGglF8Dh5F7RhUop/G94hPEgKvMg+cpvnxyRLj1/wZv4FRF8Au7lJnx69I9miz0Uko4VyVwgMRUczReZ0yFrpQPt22ptyI6DMlkPWfDXEJakvOVCMmII24xojbqPTUFrRqbPj2oW1dcEYBDbJcpuNJFSfPdOoc8dC0zkQonsfy1AlB9drKDsrEoc+4JvUzRGc7FqVzrKkixG+sw9SFZr8h97Z2pHR+RIfIn1VyklByx9aHpwUzG0OnBALCrNYTTONJ9SsE/16+nsA3XXF25s5Sj3+jnDImyV7QyH+t2zXKvMQqrdPhQl9+4QrLFRkwCzmXJME/LxkY8qtKgrwBRX2epg3bts0BSEQkF6FmoQfxY87Auosy3DJ3UvvVex43oJeWtKwdzR9bAW1ILLXg1Pti4qj68KQJw6plm609+bQnLXBSXyntdjmkjL60v4c/MN2oRujJrCudOqzcgt1U9tGZLetBCmMTEhWfu9BP3RqPLYwfzNbQeQmNQD/ZKfAAFmUcjGx80T8VWhlrPNnhVzACGPF0E9hsjy1EvAOo6o/zxnwc92nwwAu5+pPcEmmvLWtR8WTQq7gZRLOghWcbuky7QmflX8/cmcAAfHzmwCzVLJoZiQeKJCVkRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6916009)(5660300002)(8936002)(508600001)(316002)(6486002)(38100700002)(44832011)(33716001)(66476007)(66556008)(66946007)(86362001)(4326008)(8676002)(2906002)(38350700002)(6666004)(15650500001)(33656002)(6506007)(83380400001)(26005)(9686003)(6512007)(1076003)(52116002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PsOY1QNMvJta5w/gZyM156Zsq2f9Xw5if6eIn13P3uHolIc5bE47cWRyti1v?=
 =?us-ascii?Q?paq5uqqdxq6nMWsPK7Ovh/Kv+5bJJUtWjUnO1OJ9P9LL0bWvB0cD7HOsiIDS?=
 =?us-ascii?Q?bKV2bLcN+azLZon2C7xT8gN42J6T54lLghEzxzkYdIBS5FBmabP8a07W1Q2H?=
 =?us-ascii?Q?ksaGlK4ecXK2YC+jm5aXqYCibXpkh4VVK7kWfiqTZhALMz3naBvPBLErxfIX?=
 =?us-ascii?Q?u8QjZENqXXfSJAGVRFUF6Y0xYA1L9YKLgdydg0ltd8EFnALzj/ff/NE5bmgg?=
 =?us-ascii?Q?04LvUOuW9nOlxSetCHp5pIUtsAmHfUckZ1Tl/6T4DqytvoCqj1UBAl87lB+C?=
 =?us-ascii?Q?5XFiHZ3fVMs/x/Ddre1DMLFOu4tW3qWwF6+RGQbX7ApCFh6pdJGInB7FgpQo?=
 =?us-ascii?Q?BoOkSa3d2IaYtavFm9zmvTer6uJfkPUJFnVYFORAye+B2bAxc0t671JX+ajZ?=
 =?us-ascii?Q?mHIA0Z/Aszob2/kImLSiv6pnCw+GO/+gNuXFKmxTU0wTewTu7DezKWqchitg?=
 =?us-ascii?Q?Bo2qDLh65RC43MCAMefoCq+FQCkbXVy1ujs6m4XxO1RRIxLo7Oov7eBZOfYA?=
 =?us-ascii?Q?YGrq7bSq0CY7rCYCDZ2ECKr3p1bxn064J77odrYvFsSI6q/x5TihEDOVvQjJ?=
 =?us-ascii?Q?X5BNeczQcNbuRc1VnkEC/RyuWi6EhFFz8UTrM6mb5G8+d0ivnaTc20fBJCLJ?=
 =?us-ascii?Q?Dvp7oBAC/1hAFlCqBKqMo7cId5UA/xuiRd4UpBi3+RI3tTLinBJZbRuBHCxJ?=
 =?us-ascii?Q?7uw7SsreVSSZCusiBqOuwvADUbb0N3jcYK1L9HRlIPhBOdpw32WcyDw5+4sf?=
 =?us-ascii?Q?Z2m7suFCkoqIPELmh6k/A3A0vJfAmHC96PdDFTJ+8K+8AY4cTmhvsaIuWuH4?=
 =?us-ascii?Q?3Xs85qgkW8NgA0NBRZKCzNaF9f0sxWpfWOzdKZxVWXsrJLsN1Naoqfei1JuD?=
 =?us-ascii?Q?Osh9c3NRxYqM4Yj1WiyYu8OcH1eoebpK7l/QJlPJZrT3h0+YKaLmqXG6oB8p?=
 =?us-ascii?Q?H9i8fmM8l7iI3+3gs8kNbqjQTiLdg8GtzhhdNAA0vdCq5zpNx+X7wdwfgDpA?=
 =?us-ascii?Q?z7SFk++xDUKtPRXgQ+64Q7ZAryZqFfnFtWQQ3VDTgRES3C2mq89prxXXUsvB?=
 =?us-ascii?Q?NMrc6PwdXI9ur0GhYYW14iDcCybmA9ysAeCAF3SE4dHr4ad+epDfb0H0bBAE?=
 =?us-ascii?Q?7WDzYgMkIzvZgWF3tv675YiNNW+db2gnA342x9GlOfcMUVTB2V3mkNdTwWKZ?=
 =?us-ascii?Q?egJMN39PKuGlgcxVKTN/E45KRE90W4jylUyTc0Av1cxcl58P/Vrr7VnAvx1G?=
 =?us-ascii?Q?fJ2MezaEhICo8xZU9DMGBJh82JOiyOwCRx4zxZC3+Ptnm1ny3JaqmwAGJ/QU?=
 =?us-ascii?Q?tElx8VBRi9NzVgdF4u6K/cgj7UWt0G+Tm4ZSczwTgaZ6SNWe8DTuacFzdxFN?=
 =?us-ascii?Q?LZs2Ew1QqrA5ssNle3b6KQJ0gz7hbUe4/VJ65fpYwMLLUvcppjHmkUGOWdhS?=
 =?us-ascii?Q?8UKI+Bs4J8aa9fxaTKbRucURTJgV6hy4P+sesTNPxSDGhnHhVu0tFrfpD4MZ?=
 =?us-ascii?Q?SATwmQRVFb9GuGccoAgsJHtMqgnjgwuHoWs5SenHvJaGOGWToBTwID6OlWlh?=
 =?us-ascii?Q?KuBNIayyerIvakBNotQbeUYmcr+qV6D1Sn6bXukwZaFZ7a+RYxFeJ+kwkj5z?=
 =?us-ascii?Q?/HU0eak5k46lpOQM/mJ+CyWdkaRB/eav8K9rT8HtGMHoZhu6b7lLnh2oJyyw?=
 =?us-ascii?Q?N9CY9aPgZWsNV1xb594ND9ZlXXwsdkY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9628079a-9d56-4e57-a2d7-08da3356806a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 13:59:44.4303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoTB7p3moN6tNBrACuSVTJwZvH1SBtumVZpyPJVTYdJokZ6jxFe3MucXg3vz6gCMYTF9hNjFv3SuZHSfRASGhMHCUhuHCZZJCkp1jELipX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3869
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-11_05:2022-05-11,2022-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110066
X-Proofpoint-GUID: dv5HOVEOSyhaWn7MzsBKtN_thDeKauVU
X-Proofpoint-ORIG-GUID: dv5HOVEOSyhaWn7MzsBKtN_thDeKauVU
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ping!

regards,
dan carpenter

On Thu, Apr 21, 2022 at 06:52:48PM +0300, Dan Carpenter wrote:
> Hello Horatiu Vultur,
> 
> The patch 2ea1cbac267e: "net: lan966x: Update FDMA to change MTU."
> from Apr 8, 2022, leads to the following Smatch static checker
> warning:
> 
> 	drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c:736 lan966x_fdma_reload()
> 	warn: 'rx_dcbs' was already freed.
> 
> drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
>     685 static int lan966x_fdma_reload(struct lan966x *lan966x, int new_mtu)
>     686 {
>     687         void *rx_dcbs, *tx_dcbs, *tx_dcbs_buf;
>     688         dma_addr_t rx_dma, tx_dma;
>     689         u32 size;
>     690         int err;
>     691 
>     692         /* Store these for later to free them */
>     693         rx_dma = lan966x->rx.dma;
>     694         tx_dma = lan966x->tx.dma;
>     695         rx_dcbs = lan966x->rx.dcbs;
>     696         tx_dcbs = lan966x->tx.dcbs;
>     697         tx_dcbs_buf = lan966x->tx.dcbs_buf;
>     698 
>     699         napi_synchronize(&lan966x->napi);
>     700         napi_disable(&lan966x->napi);
>     701         lan966x_fdma_stop_netdev(lan966x);
>     702 
>     703         lan966x_fdma_rx_disable(&lan966x->rx);
>     704         lan966x_fdma_rx_free_pages(&lan966x->rx);
>     705         lan966x->rx.page_order = round_up(new_mtu, PAGE_SIZE) / PAGE_SIZE - 1;
>     706         err = lan966x_fdma_rx_alloc(&lan966x->rx);
>     707         if (err)
>     708                 goto restore;
>     709         lan966x_fdma_rx_start(&lan966x->rx);
>     710 
>     711         size = sizeof(struct lan966x_rx_dcb) * FDMA_DCB_MAX;
>     712         size = ALIGN(size, PAGE_SIZE);
>     713         dma_free_coherent(lan966x->dev, size, rx_dcbs, rx_dma);
>                                                       ^^^^^^^
> Freed
> 
>     714 
>     715         lan966x_fdma_tx_disable(&lan966x->tx);
>     716         err = lan966x_fdma_tx_alloc(&lan966x->tx);
>     717         if (err)
>     718                 goto restore_tx;
>                         ^^^^^^^^^^^^^^^
> 
>     719 
>     720         size = sizeof(struct lan966x_tx_dcb) * FDMA_DCB_MAX;
>     721         size = ALIGN(size, PAGE_SIZE);
>     722         dma_free_coherent(lan966x->dev, size, tx_dcbs, tx_dma);
>     723 
>     724         kfree(tx_dcbs_buf);
>     725 
>     726         lan966x_fdma_wakeup_netdev(lan966x);
>     727         napi_enable(&lan966x->napi);
>     728 
>     729         return err;
>     730 restore:
>     731         lan966x->rx.dma = rx_dma;
>     732         lan966x->tx.dma = tx_dma;
>     733         lan966x_fdma_rx_start(&lan966x->rx);
>     734 
>     735 restore_tx:
> --> 736         lan966x->rx.dcbs = rx_dcbs;
>                                    ^^^^^^^
> 
>     737         lan966x->tx.dcbs = tx_dcbs;
>     738         lan966x->tx.dcbs_buf = tx_dcbs_buf;
>     739 
>     740         return err;
>     741 }
> 
> regards,
> dan carpenter
