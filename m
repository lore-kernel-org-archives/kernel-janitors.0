Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76CAC43334
	for <kernel-janitors@archiver.kernel.org>; Tue, 19 Jul 2022 11:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbiGSLSt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 19 Jul 2022 07:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiGSLSs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 19 Jul 2022 07:18:48 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F852127A
        for <kernel-janitors@vger.kernel.org>; Tue, 19 Jul 2022 04:18:47 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JBDQuV023354;
        Tue, 19 Jul 2022 11:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=FVPiodwGfcq794N/pMTqodPs5H/KlDaJwNwHPl1joio=;
 b=ZU7AllDrXuT2w7F1NLQpT5qac8olbFmhDcGT3zcdVzaTVcbjErIQCjjvMJLtSvCyofZL
 V7ARgxFVGbFKTyaybB6ROCIgyFL7qXn8MUnTck82Yv1CHiybzLasHJ1F/+qtJbaIsomK
 hvRhwnC0ZFINTnycumfENdfHvP7MMWViF0uw1KHESD2DAkBGrksrBnNbPvq54HRn21t7
 wA7bva+xbOLS7Uh5eSTRuC7ai889Ku6gqgbpvUM0SxkF2EQ+Y30Yzhqvk+JbwBrgW3sD
 KQZpvOHZ/FBrePMwl816VL3bw43Szz5MpLAz06N+uxVy22y5+UtIHcs7nOyliJtnMWbW 2g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbnvtdxu0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Jul 2022 11:18:46 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26J8ZgQq016456;
        Tue, 19 Jul 2022 11:18:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1emerxh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 Jul 2022 11:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgrvLqUvkeUm1elQwRBOryZ1cBaT51X//FVX4lfyDeaN6cbaLTOTaxAj19GGgM8Sjhs6Ek2TwQ1HxVPS9tSR/yrW8Uc+qZoz7PoYdcNIeUA+Ng4FJ203CAhFH1FULuhb/6Fw8ZeDfTAR1pz9AmjjyWyIyFcTOmkp032KquNQtrWxzLgwhoYtEDX0pG2Dg0ykKMIonWTlHA01Kjioe8tx6zFBROz0oxwLnb4Nq/WGx3M6QaPbQ6kWh8E4uwmy3gd935tFM+qyZyxbkCHzkfYr3kY43bX6DkPXr7Njdaw+7OgoFtJI+hj+Hiks3s5pU02FhVtm6g6cdzmWBAnsyrT+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVPiodwGfcq794N/pMTqodPs5H/KlDaJwNwHPl1joio=;
 b=cPmU7AJV/TtsR7HrmDWwoJuNYlbPIsaNICzh7ZTkoAg3HByRduVDKCm41KY/ggsRdhbES+ejl6gCbznJe56I+qG+nddsmySkMp8iwqledqmSmDx2HkseZ1HvAyAZLm28trRzxWetEHiZde+v2h797aBfrbVagbkvsMHoGUcOxp/vHWejuTB/gYxpQnmZ6zR9nYxH+gH4cNlfhvZ9cxrl984cL7pLCPZpy3LzT3WZONBLoZzLrN9l57uURtPm4L0euAPUyQtVPNq1K/VikuPFh+P21oklTABFUkJK/gpktTQQJf/aCEW4X7f0GT6fglmmc3ylyYQujSMKrelJQpYZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVPiodwGfcq794N/pMTqodPs5H/KlDaJwNwHPl1joio=;
 b=H304HEKBm05DhnYirsrwRZJtaphbFg/N13hQa4NqkMMg2Fi/7Z7WbOHzGfl3OJVkrUzaZ7xJFErsPHQZZHrdMd/2j6ojfuTFOGLKmaejCCwiY8/zZNTbfV8UOU2mq6sLp6gJ/d6f8FRK/hS1aKzNfrq+x3aLvERbpgJyqefjgI4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1763.namprd10.prod.outlook.com
 (2603:10b6:405:b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Tue, 19 Jul
 2022 11:18:43 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.024; Tue, 19 Jul 2022
 11:18:43 +0000
Date:   Tue, 19 Jul 2022 14:18:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ap420073@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: atlantic: Implement xdp data plane
Message-ID: <YtaTCWFeFquphes0@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0001.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17b09abb-c931-4ab9-0e9f-08da6978704e
X-MS-TrafficTypeDiagnostic: BN6PR10MB1763:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +YYLGP0D/7fnjavNykJ7S15drAZHcdvrXsEmDK5SngC0lO8qk1PMXzLiuQmzYuNl7HxHH7LORj9ht/FufHiJfYYkZ7yeLDF7mnTYFZokYwA6/1onOeRDEaS9drBw85VYnWw7GkhZZzQrDDLXe0OU7Mp7GH7CW2VZdKd/SEWP2oce1DaBgc7TEq/vnznvHRumaOMykQBunUrRIKGiOm+y1an1BmkeC8BQJIJybT8DTk8LnbW0+ouXNm5MHSJ0LmfaPCTJ2mVhQRqhridYoA9DLf/otjXFsarpUUVOCB2MrnM4SjFTvJW82AUPpZtjg6lTlt92EgVVyKTeK3whSLC1KYP5L2MzN8mGjPuvcsBJTlwC44uFUAwY8IKMcS3MUAhWh6vkdEOH3TYiVEwONeJ9zowI5KL/sXIFl5L2Dvt1SaXL1cpEf4Npjej1qtizRRQvKeE01LqLxiiB1BAx4tZ3SC910ArYUB56pI2IrMThZfxQJqsE9xDTJjyj80JjahHMo/DMs51AiA9AWnP9zNrwgmXpa/Q2y7XMQwvv9lqlfZII1i/5eOPQVC3JbxSU2Gp4JnlHopJdtm5X+FBTrOkXIGxOLQ3OL1m3e5bSEP0890FSc/6hnLDbrh0WbzUgzyaFG2H4thpPzSgQTVSRbj6J5FqrG17RR790I1/VYeMtBArz/kDf9zekdm4nodhayfK4QDkevuQUEQFhcou/TSFh6or7b9yhtRSKE26wCp5AaZ4c3pCLvPhKGuAarhQVdPRcu/0I5/GTZv9xSAnrtLyLmYidDH8m6V1L5E+heN7DFbP+P8VXWVqHBrmj2/pCAW2T
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(376002)(366004)(346002)(39860400002)(136003)(478600001)(8936002)(6666004)(5660300002)(52116002)(6486002)(86362001)(41300700001)(2906002)(26005)(6512007)(9686003)(6506007)(44832011)(33716001)(186003)(38100700002)(38350700002)(83380400001)(6916009)(316002)(66476007)(8676002)(4326008)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UOSXHZ67Miy2ZLGfnl1rDWKgzudtr2tXl6uvXXh+mSFVt9AFeqG9YFbC0osq?=
 =?us-ascii?Q?/qKJhBQZsjbyCgnWDhYx1x6ctaTcs+RB3eac4YeQlph1RrqIqMuvDJzbNY3z?=
 =?us-ascii?Q?DuU6eULHxT7i7v0MbqHpienaEXb5EZda7aJAqhjOKParzIxcRTFw8oejHz1g?=
 =?us-ascii?Q?wcAI4qi0aiQ31l1OLmeDy0kHPBi6Hv7UNAz0bPpHcMwLwpBxyPIqLSqxH0NF?=
 =?us-ascii?Q?ylkifCQokAXMNkdn1GNJV1+AbmWYA6b+wC6Igl5z9C4Xdkj7qil72ZrmyIM6?=
 =?us-ascii?Q?lX3LayUnk+L8M9j6850tmQ9KtMpOmfn2FgmBMkVNRqCs0PTtKC2mbcPQtyt+?=
 =?us-ascii?Q?lSFYmVRJfgflLKhapHj/r6KxHS/HsTaGQVXrUfyf9QSXvs7gv9/94eBp0QWs?=
 =?us-ascii?Q?z64YDFhbmCrdZOy2ATO2LQctdLCz1wS7PxOiqzrgRsRVMuz1gf8Oq6xnmBQ4?=
 =?us-ascii?Q?r31CfNxD8ob/0q7kUmd+7marNNklul6TbqN29TD7GBWEpmiyhcYq9lyxVIo/?=
 =?us-ascii?Q?ziWH9QmwNBvYT2f1N/jt4Re8g7VK4NOD7XGfQoE4WzRS9RFrhoyEfksAErj8?=
 =?us-ascii?Q?x+1xL3a/5HgmTI/Oxb1uHt4FIAiIOHSKsSrbRcLx9vXsx69+hcjA8USXgV2B?=
 =?us-ascii?Q?13KSbVcfBmcg82xlVBN9r0k4lGmjs08NqRCv9i1V6ATfPy4JrGKeaI0/x0FR?=
 =?us-ascii?Q?kx8vlfHlTEqaCkK70kClOcdZTZZRKGpOfgbV2aamqTE1ThWG6A6DES6V10MQ?=
 =?us-ascii?Q?3Gbcbf/8dE1Hi6V99SKXHSh01VqJ+fKu73iH5gcLZkB6kR3VR18QFM69orfH?=
 =?us-ascii?Q?DGx3XuNTx+T6/DrG0dNcBxQ68AhdJYOeRizOBfMuar956PJYniDs4qcsM2/N?=
 =?us-ascii?Q?PQ/VgpYwQRbSAJIxdI9oPoXWAh2wxlwkkIrjgy4Iq/7tdifoX3JruwMqm3Se?=
 =?us-ascii?Q?gv9HL0U96n/mk8Se3KBrM95F4T4abvDgMoAf1doOJ1uuh93CmyTCTret0keM?=
 =?us-ascii?Q?hb1L4w+0DEv9LU/GLvVLNWVRS64l5aplXvDBTwczWlLwDe/YbJV5yB4aLKlf?=
 =?us-ascii?Q?3jKIF/OL31gPw4t/IKTKz8GSBCV/QWmt/kgHsF4DN0X1XA+mn61D6ZkTRCJm?=
 =?us-ascii?Q?iQDQhlWbgJap1c1zJefSfvI44DwKZm8sZ9aDOYkdhR8tvJ/bVtrzg9tLTTvm?=
 =?us-ascii?Q?ojFd1qP6K/+f/W9koLAR8BT4njBTZduDCuu1FydE72W6hyGrva+TlGPWZJoY?=
 =?us-ascii?Q?ZGkijabZEQBXEw04kl3oL+AWJJxeCTfwWIlHnhmcYZ0RfG+bv92nhLd5Zwei?=
 =?us-ascii?Q?khQC0pJLxVcaw/UP7Sg34NgF6lEw1PxjQn0NYcbJ+rmGzlQdGvotp35tXuGK?=
 =?us-ascii?Q?C8jo5tlpHD+Bvcob/sKyvtJa+MeCtSTzWNS0MXkhySburG+GJ3usuwTd9KHw?=
 =?us-ascii?Q?eZmZ/PPtlApx1ITUg165xiO1dAV7tKX12ddIy4js43XoTF/4La2K+PPeyNYm?=
 =?us-ascii?Q?SVr3tV13ODYHn7F0jwiVkZQK36tq+SZtxmflKYD6UYqvateFt9QBzaINsYJi?=
 =?us-ascii?Q?VHsmyY9FVsFTq30whr/JLDX2cdFGqnnIIzneMxIhftGcnh3CVdV232w1TiVW?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b09abb-c931-4ab9-0e9f-08da6978704e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 11:18:43.1251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ7YfgeFso0OBuBcSso/ZFtesli8ve0z0+xLVDc5/VG3MZC+lQD5Xyw9Cx5EV7IEcW1IAHuQGuykMC55EOJg7cJePb4ZsJ2gjdDxVK1jY8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_22,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=892
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207190048
X-Proofpoint-GUID: Ds448OxRWOxhumdZLrKCkBaKX8RbcIgW
X-Proofpoint-ORIG-GUID: Ds448OxRWOxhumdZLrKCkBaKX8RbcIgW
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Taehee Yoo,

The patch 26efaef759a1: "net: atlantic: Implement xdp data plane"
from Apr 17, 2022, leads to the following Smatch static checker
warning:

drivers/net/ethernet/aquantia/atlantic/aq_ring.c:496 aq_xdp_run_prog() error: passing non negative 6 to ERR_PTR

drivers/net/ethernet/aquantia/atlantic/aq_ring.c
    415 static struct sk_buff *aq_xdp_run_prog(struct aq_nic_s *aq_nic,
    416                                        struct xdp_buff *xdp,
    417                                        struct aq_ring_s *rx_ring,
    418                                        struct aq_ring_buff_s *buff)
    419 {
    420         int result = NETDEV_TX_BUSY;
    421         struct aq_ring_s *tx_ring;
    422         struct xdp_frame *xdpf;
    423         struct bpf_prog *prog;
    424         u32 act = XDP_ABORTED;
    425         struct sk_buff *skb;
    426 
    427         u64_stats_update_begin(&rx_ring->stats.rx.syncp);
    428         ++rx_ring->stats.rx.packets;
    429         rx_ring->stats.rx.bytes += xdp_get_buff_len(xdp);
    430         u64_stats_update_end(&rx_ring->stats.rx.syncp);
    431 
    432         prog = READ_ONCE(rx_ring->xdp_prog);
    433         if (!prog)
    434                 goto pass;
    435 
    436         prefetchw(xdp->data_hard_start); /* xdp_frame write */
    437 
    438         /* single buffer XDP program, but packet is multi buffer, aborted */
    439         if (xdp_buff_has_frags(xdp) && !prog->aux->xdp_has_frags)
    440                 goto out_aborted;
    441 
    442         act = bpf_prog_run_xdp(prog, xdp);
    443         switch (act) {
    444         case XDP_PASS:
    445 pass:
    446                 xdpf = xdp_convert_buff_to_frame(xdp);
    447                 if (unlikely(!xdpf))
    448                         goto out_aborted;
    449                 skb = xdp_build_skb_from_frame(xdpf, aq_nic->ndev);
    450                 if (!skb)
    451                         goto out_aborted;
    452                 u64_stats_update_begin(&rx_ring->stats.rx.syncp);
    453                 ++rx_ring->stats.rx.xdp_pass;
    454                 u64_stats_update_end(&rx_ring->stats.rx.syncp);
    455                 aq_get_rxpages_xdp(buff, xdp);
    456                 return skb;
    457         case XDP_TX:
    458                 xdpf = xdp_convert_buff_to_frame(xdp);
    459                 if (unlikely(!xdpf))
    460                         goto out_aborted;
    461                 tx_ring = aq_nic->aq_ring_tx[rx_ring->idx];
    462                 result = aq_nic_xmit_xdpf(aq_nic, tx_ring, xdpf);
    463                 if (result == NETDEV_TX_BUSY)
    464                         goto out_aborted;

The aq_nic_xmit_xdpf() function returns zero on success and a mix of
NETDEV_TX_BUSY or negative error codes on failure.  Mixing error codes...

    465                 u64_stats_update_begin(&rx_ring->stats.rx.syncp);
    466                 ++rx_ring->stats.rx.xdp_tx;
    467                 u64_stats_update_end(&rx_ring->stats.rx.syncp);
    468                 aq_get_rxpages_xdp(buff, xdp);
    469                 break;
    470         case XDP_REDIRECT:
    471                 if (xdp_do_redirect(aq_nic->ndev, xdp, prog) < 0)
    472                         goto out_aborted;
    473                 xdp_do_flush();
    474                 u64_stats_update_begin(&rx_ring->stats.rx.syncp);
    475                 ++rx_ring->stats.rx.xdp_redirect;
    476                 u64_stats_update_end(&rx_ring->stats.rx.syncp);
    477                 aq_get_rxpages_xdp(buff, xdp);
    478                 break;
    479         default:
    480                 fallthrough;
    481         case XDP_ABORTED:
    482 out_aborted:
    483                 u64_stats_update_begin(&rx_ring->stats.rx.syncp);
    484                 ++rx_ring->stats.rx.xdp_aborted;
    485                 u64_stats_update_end(&rx_ring->stats.rx.syncp);
    486                 trace_xdp_exception(aq_nic->ndev, prog, act);
    487                 bpf_warn_invalid_xdp_action(aq_nic->ndev, prog, act);
    488                 break;
    489         case XDP_DROP:
    490                 u64_stats_update_begin(&rx_ring->stats.rx.syncp);
    491                 ++rx_ring->stats.rx.xdp_drop;
    492                 u64_stats_update_end(&rx_ring->stats.rx.syncp);
    493                 break;
    494         }
    495 
--> 496         return ERR_PTR(-result);

... is always risky and will lead to a crash in the caller.

    497 }

regards,
dan carpenter
