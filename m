Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D5FC19F2D
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Aug 2022 08:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236832AbiHII4d (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 9 Aug 2022 04:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241422AbiHII40 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 9 Aug 2022 04:56:26 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945562253E
        for <kernel-janitors@vger.kernel.org>; Tue,  9 Aug 2022 01:56:24 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2795HALP001640;
        Tue, 9 Aug 2022 08:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=ynLKoLabHQJ/rv16P+DE5Ksz+4IBDT8gP7b8DEALUQw=;
 b=KPqXbnTLTbrfArzlKuSyU0xArADFzqIoRnTYs3wRunjCMag4E9nxPnUGCRL4CCQnsM95
 KbieKxr7zG8XII2vCCuH4dtUPlu7lzeHeC+1MV8hDf+vyO8/hoLI1Etr95EBAngzqQqH
 T0zJOL2fmKOqx95UMCYdoDZnEQQdHdB71/6ZXnI30/WsiU7k4MPWOruQnMjLKgLhfyLZ
 UtuDmFXu0Irmxbwg5mY1c6WsxwGXZMV6PU6AjPsHYq2WPTm/6q2eSBdAV6aL4tIkgIPx
 fyre+7/hS+tgb/c1v18RpbD3Zll3gTXB780AvzyplGE9Pg147AzwPm6z67Fw8SBCughw Ww== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hsg69nvgq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Aug 2022 08:56:22 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 27960E85038076;
        Tue, 9 Aug 2022 08:56:16 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hu0n3c2gb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 09 Aug 2022 08:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lB2DIxS34d5opppoTEQL4fLiC5+g/BjxgWaK+DLYxmHdJcHRDH5t67Xmyk05sUhDJUWlvwvDu7ZpDqkxgB3wOOcyZU27YUksZgvLU69mbJ7cAv/JeBZtbStaI4IXxiU3Sy6QlsQzosqOGztDsURkXBrQIPw2u/ws6bBHj0eTXf0wLg6mrM6LdxHYIiDwZCOro+4ESoQTQApctk5IhZRKYOZ5/5kWu90zmr3oTk3PQc0Obs+jHOw3QVaqlL+V6l+vegV7R1O6ZuyKWIpP+Cvmd6LgjD1TjJDiKgLtNGmVfUZdgM7cpFDLYTMcjVn4/y48Yp9iPJPmFZ4LrMSw2HyC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynLKoLabHQJ/rv16P+DE5Ksz+4IBDT8gP7b8DEALUQw=;
 b=ZVOyfzm1QxqJdpMW+9TkUYfLgLb2b2nbB1dyEjdRKQB6I+NftO+p/3fsOpUNs103oj/POMb45EoJxN1U0SwqA7XWrWIT6tOqySiHCnKazywFO/qUzObBCUzZroKLev5g8OJd/VMgzdkoYIZxI3wAN1DPLu/ZJIEBs+c/aCc1o37psiD0sV9fCv0IIu4MlF9ip1JvteN0LQz9uM+s3/X/KWkm1xGQb4T83MzBe0Qi6p138VroMALBLtn0+N6ki3NhLrLKqAXYDqRR641dw470HmxmOQGkyYWDNfRYZOM5ze4HlPfoZKotqsClsmoKdRsGFYiHVJEnRGdET/I1C1GrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynLKoLabHQJ/rv16P+DE5Ksz+4IBDT8gP7b8DEALUQw=;
 b=i4NB4NLhjhogxOXfdia2Ckt8C/SONBw8E2JX/pHitc8GNwd+neNi+VGZ/GLI2nMQiOF60+z0rJtgiMq31IIYgCxTq9/pddggNbR1ASoHjbaAn2djbtAQqDw00kfkaPKlumZjMOQnugLCWP1U3DJDINCRn/vcZihs03XNMLsLNPE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3478.namprd10.prod.outlook.com
 (2603:10b6:a03:124::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 08:56:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 08:56:13 +0000
Date:   Tue, 9 Aug 2022 11:56:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ap420073@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: atlantic: Implement xdp data plane
Message-ID: <YvIhJLZKQBqLtcjW@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZRAP278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c203651a-d8fd-45e9-d095-08da79e502c9
X-MS-TrafficTypeDiagnostic: BYAPR10MB3478:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JoIIqunZzmWRoTsT9QNhgPYxZVocT1MZ6f7WEfECli+wMzkjWrgKQymoETbHyD5lDyhy7FhwQ5caHtiOlYQce2VKJSs62WcLaNm42i2gQpwYibLsLt/ERLBVzz+lTYP5ImbeRKeEQeMG5kNUe8n0pS3af5StVyikb/9K7hDJF8sh9uOgvdgIf1YwNTYREdw4iMKucqEIYbeUDd4YaRTwlEdfAViD7ez4h6RjD7szhp93Of3LJ8cgMTIQClkEKraYpPykhETkdHKIlp5d3zo8VUlgmzrWxSFm9uzD4kVsogzMSgfaUmzxNWdMghbTrJJN7vTgC4JmqEWpcbDGUIE4OOQv9nwLFotVkeNiPEYdP9qChMevVCSfTT/NBLgvr3xDVMb1D+tA5f0K5P1zZXBK2KkP94DpKidMRrNoKXz2rXiQvO0g+fkhk4DlTLwq9tAZ+YRqzl8PQMc7V7TFwo3cWw33cKvGVaMYZCPk7J0ebm6Gib2b0z5SowKgGWJFXixdy5Cs3693Tk2WdxKj3JQuAtlhNY+4XpirDAXv8BgJe1pHw9Jkem4vDlZhDbfMMkJIuJDdYVaT4KZK8zizF3nVR4aNb+ZMHyL97rbRRM3Dl0Fhs+Y3XCbEZn6sKT2V3xlIDYGgQhO0m5cEwfsEfTT9neJ4g8vtpK+WY5YNTMCUdynhD4FhwVcyRrrx626/yMJyKRaZNYeD5gUrI/i17juFgbCS7TdvcQ6CNmb8nN64gnhZTJMcIWuzbTchxv0wzFo8lOR2QxgW9DYDblWJplSjwrMREP/h0M8lvYCvoMA4qk2RmXbDeQyQGZ6YqoCN7sXj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(376002)(136003)(366004)(39860400002)(396003)(9686003)(41300700001)(26005)(6512007)(6666004)(86362001)(6506007)(52116002)(6486002)(38100700002)(38350700002)(83380400001)(186003)(8936002)(33716001)(4326008)(8676002)(5660300002)(66476007)(66556008)(44832011)(66946007)(478600001)(6916009)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hGrHYm0I7ZuxgCEDCrHHtxFoePqHrFFshvMVeCcCGtZC7I7A8xqyqFk/rosV?=
 =?us-ascii?Q?Xh3CYlOBdV4hBGOf/8vYc5lc4vy2MRwTjutASdSyYahgWZtluNwmtTNFke/j?=
 =?us-ascii?Q?0oO+pR8IuOgjiVlZUmkkS++ysEvDrFfqj1zcvrzCdDKxQtFDBat6e3vBjm7q?=
 =?us-ascii?Q?sTewVimTkpOfJ0hte/iyPplpqegGQq8zOhBlLRuKAqTI6PNjXSbEy+JR7jMC?=
 =?us-ascii?Q?uttxntIbQ/VPcH+xWyKNXuogt1xFpoKYJGyG4c+BImkHLSjojA0Bty29wnHk?=
 =?us-ascii?Q?MyTHCWfYo0eIYE4b5u57shJRj01JPcZFnwoMDVj2nc47AN1DvbkU7LQNDLwU?=
 =?us-ascii?Q?wgvwABl8yAhp3Z9TSzMc564skZ3baKvQD61qShGSRMT0jYxyib+EAo8ifRxA?=
 =?us-ascii?Q?OeoylMsKKBFuJs8Fl2/VvYc6X2c2bpwY4aQQxRor2ly0uvcZ8EIjtKVEEyXL?=
 =?us-ascii?Q?nwtGMjfcyw/Hx9PjN82K24cE6kZ5DqF1rB0t514L9nkxeoWIh5zZpGg/zRK7?=
 =?us-ascii?Q?5NtL1DeWdu3K2iFjkj+T3FT7aG8gxYZR3aKoe+QoAYUjpdLugNmkxadiTMkW?=
 =?us-ascii?Q?o6TQ6pZS478GvU0v4gkQ6CMXhFwtITa+93WtAOMr+CN9dzjl7vPAsLJzaIq7?=
 =?us-ascii?Q?e50598InevCJDCdXpcUCwnPjtvGOwSu6iWRrpZ8Pt5u5y0bGcKZtoOgQxgsA?=
 =?us-ascii?Q?hmPE+Dw9lMmFefgIkL0gxFWjih7DUbgiieKZUARkmV93P2ykOWD9AyDF7TYB?=
 =?us-ascii?Q?75s86KZD3ItAosH095chqmCdlo4NvoNYSTt8LV5sscuDgxuAMEgcM2tpHzDf?=
 =?us-ascii?Q?hjlSHEcvW4OpqlbgHdUtklaVKFFfIIJgeb7r58tFR/JBPIRy+uaZ12XL+aat?=
 =?us-ascii?Q?r/obbMW/d5ZTtq8IF+MRNCfTtifzIyF1FGMLkYYQe2J70FT1gdzeQpTz/RUl?=
 =?us-ascii?Q?wk0GrllcSoXCD8q/Dxx0B6WIyTjpu5qhyR7ycYXG/pPYgYlsc4cZJ43dGDQ+?=
 =?us-ascii?Q?PWqYHeCyu7tQR0RiwICqsN0mbl4cT/F9YNDmzvpNBVywRDinihH2xJ95nUEp?=
 =?us-ascii?Q?Om861Kv8EEBUQ+BDw/GhHmJ4i2+N7JB5myJrG24Lb8zLv6UkPR+29zlAo6ov?=
 =?us-ascii?Q?cUADvLl9l/Q2lsvAlOpuvHJRO1meNsB0RYPo059hBQzb7s1NB1sMzb7tj1n+?=
 =?us-ascii?Q?b2+Ak8gTdy4uCsO/CBnDxAoSCcIM/UBm22y3POnIdXxkgKfdrEBte3VEgNen?=
 =?us-ascii?Q?derMDCZuvHMZJUIj6WkeRkecnX6pHlKXkiNdNXHoiFkXEdCOyuEKl8eQLJDQ?=
 =?us-ascii?Q?FD2g0SWI3afjTTiMWP87RT3i1CX4qjDCsJU11E5k9M5w40avzzx8aFqGRlqZ?=
 =?us-ascii?Q?bKj2rJS7AIWyzgXFTz1ueTLhjBoiE1/6zuh09ssc5nVK63UWYFmXJ1O2DDHO?=
 =?us-ascii?Q?4gQGwXenhZICPyj+9gVlh3tLqtfQlod3XoTbecK4pkjRQSIb2J/N1KlNt0JH?=
 =?us-ascii?Q?6A408UdREC569/pbg1Y1ZkwqvPsdg5XWKayq1qHHDwI3opLCA5XgUwCTZZ3O?=
 =?us-ascii?Q?lP7HWj0xJNHxXjMgSqLiBKB84GR1CaRf7FsM89cUR0Cct2EjBrtxAdtKwtKO?=
 =?us-ascii?Q?Og=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c203651a-d8fd-45e9-d095-08da79e502c9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 08:56:13.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeQfmhKQZM06HE21/NCLy6QHVOFKD3fjVvNS6N3zJDdbl+QEtCasWVAkqjmxVoL32e6oM6cFcOY9m3qijHnercHX+SvWMOdzqZLbKozXwLo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3478
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=791
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208090040
X-Proofpoint-ORIG-GUID: _FIwDWA9Gmi6aAbWjMyVz5XPWCa5olls
X-Proofpoint-GUID: _FIwDWA9Gmi6aAbWjMyVz5XPWCa5olls
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Taehee Yoo,

The patch 26efaef759a1: "net: atlantic: Implement xdp data plane"
from Apr 17, 2022, leads to the following Smatch static checker
warning:

	drivers/net/ethernet/aquantia/atlantic/aq_ring.c:496 aq_xdp_run_prog()
	error: passing non negative 6 to ERR_PTR

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

aq_nic_xmit_xdpf() returns NETDEV_TX_BUSY or negative error codes from
->hw_ring_tx_xmit().  This bug will lead to a crash.

    463                 if (result == NETDEV_TX_BUSY)
    464                         goto out_aborted;
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
    497 }

regards,
dan carpenter
