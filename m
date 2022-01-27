Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED36C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Jan 2022 08:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237956AbiA0Ixq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Jan 2022 03:53:46 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39858 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237928AbiA0Ixp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Jan 2022 03:53:45 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R6upGL011847;
        Thu, 27 Jan 2022 08:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=QXxwgrKYJqYwWMkQGaWsN+FLzQg4Jnp9hz4RTB5hTB0=;
 b=V2Auot1Ck8S3D7ZWwaoTdhNMy8LDJ4wUGB448PF0mqYdcspqm3QBX+dtk/IaBoF/Qj8l
 dxgVNd2JFMqmGCYt8u5wUDODNOBzXgMfEJ/26GCYpJMAGiczfMB/5I9iebZA/DG7Cf3R
 ag02TpE7ux020c0fCRRGEHKJVzYhqqqAAnyB2jsHzYrEEesHyPCiNzVz7nO4hphD2oTF
 rHnk1AXMYA81oTfNQojZOXJUZGTTxkuTW42uXRFF1MMC8Dny97tBTKUVjREa8/ekUatd
 CNZjvVA+eSPKsJEvh9xGhsyFwUWUsPHyonNvktNDA0Wh4wBCZYHJ3ajLuAbS1T1eAikg lA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dsxaaggnp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jan 2022 08:53:42 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20R8p4X5081282;
        Thu, 27 Jan 2022 08:53:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by userp3030.oracle.com with ESMTP id 3dr722whft-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jan 2022 08:53:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKlQbaQ53Irwa+Fy6QB5SkijLk+KmJpveqLlVDZwis+4rSFs4jdm7n5mZHXzAPMfe+k6lhRtVyPo8cUKuJky1vtMH7XLQ5S5Ux/0ptm4FNK1UPAc3sIM1Xonv8ycMOty+BNaF4j9GjI9Y3kEcXBGYTf+4HqKRuTKPLQnLdih9EF0TfCw0t5XvExjZ57SEPgeuf0nJQtVO+/x8KGUvJg7rSMV3N0uhGhxNVkKWlkii+sv2g6LWpRC04DPOaWHrFkFAoFT1N7Obd6iHfaq2UVCtHmUzpSBNlX9odTWwedK+x9jMcX9FgqnXvodqXbFEK7y1RFhOhJWEfKvY9NboNSi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXxwgrKYJqYwWMkQGaWsN+FLzQg4Jnp9hz4RTB5hTB0=;
 b=KcFl+V6hOgedZVH5ZSa4AJElth/h4EAutWkSM34ljxs07GpvN/qO+ocRA37UTf5ISINm7WCoPklhwir/hXcSjbhdyZhs5ADyQiqbyEGD2A80SF9ES04jqJUxpBVvsmvTPvWs6BK0T7U6xYipzhPVW9dbzaknZw3H++npTCALORu+TcgsjvacuUBdflf9YY9EF3UnRrTBtFr+PyU+aHfx/0EKdoMkcw7agAcRJuLC5i1fjXfRnWYtOxMHZ/32siARPmlLQzWs4ScOlZTRqQLKD9thLRU6pYcYgoMIE+eJvjYBLFRgPr1iOT737wr8MDjEjHlQH+ZqOazK7OxgV/HqXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXxwgrKYJqYwWMkQGaWsN+FLzQg4Jnp9hz4RTB5hTB0=;
 b=N/PnW2NJn52KjbA3c32QIdN8TwwgkjZTQPsHzc5pExqhwMaQT66j3ADwCapfEjzXd/f1jfTowas1FsnGFrr4CIjaAOyafi2uQWpysnm9o/9JHJq7R4MSVhM1oJefSS+4G7NcGY3nEiVeLrogu9IP9reE+/9LHZCBuwKOIVyFrIQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3685.namprd10.prod.outlook.com
 (2603:10b6:a03:124::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:53:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 08:53:38 +0000
Date:   Thu, 27 Jan 2022 11:53:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     lorenzo@kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: mvneta: add frags support to XDP_TX
Message-ID: <20220127085320.GB25851@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: JNAP275CA0023.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64db0262-d439-4efc-da08-08d9e17282d9
X-MS-TrafficTypeDiagnostic: BYAPR10MB3685:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB36857D9E8CE60C73E2716D528E219@BYAPR10MB3685.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BdQ9R+LMXq3HsdUHYfsuofCTdxvvhQiO3uyXneBgM8RrMlKB2YK1zfbMm7T5OdOboPCDD6TCOv+Tgow1Vu5i1LPIp8WG/tiK0re/KMriQD9T9u8LAZOe+3nxdL+Lt6rr7qgucQzcqiYVAMNLW8T0FqJt6wC+Ow1y/t/X6HWHjnel3sTMEsVFjtt7Ii8jHuulBeI2DkvG3vyRg2Of0CXs1sTowqm4AJiYdMS8ceSzo8xCWFMO3xllxPw52rpxzPAe7pvDkNC8SbZsI1M+HELDXGQu5377l4bZ+ibwdgpmvKf8FgJxD2YLzKgMfRPuHK3u3Kh/bvys0y77bYJTO9wUuo70F3tEkTEF/k/SH1Il02eZO0THjClaaUwvmU1buV5YCAx/JZWfNdjXb2fKATWAvtsURuqnuJv1Y1yl/6X9l4ylcSpxVNI+oW/N1bkVkZiwFJghKbWZH4I4/XGUEYMkKbL6bJ8TYUwr9KypOUFz2lLnx+PVdRlhhnYtgZdQRpElhKjDX8C71l4DhjLxapm/zklNM9olQRdi0DFQFeCzhITLYgT3kRLOH8TbcDzJxespe4mjgiPG0GOJv2JY+0T8i4mzh75jcluHF/hitKCG6IQfmJedtPbhSnvejQdN3Bh+YZfq+BlEnxKM4DLj3ott1i6Y10y06yrkBwsuGB49ZT+IkmA2GX3FNX0HlSJsasLcBsFNUJ9KcYwqdukgH9U5SA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(508600001)(86362001)(2906002)(316002)(6916009)(38350700002)(66946007)(5660300002)(66476007)(66556008)(38100700002)(8936002)(33716001)(8676002)(4326008)(6486002)(83380400001)(44832011)(33656002)(6512007)(1076003)(186003)(6506007)(26005)(9686003)(52116002)(6666004)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RSOB0tZSL4/v08J6pRwoeXkhdzd5zQhOhxZnn6w+BGrwOwPptlIYVR8x8sBG?=
 =?us-ascii?Q?l5bb7fRbXMXdjqPsgkJBE83BX8pHlyXTO1pVJL+kBCiizIGT+q0A1pwn+K8f?=
 =?us-ascii?Q?gKr3e/Ve5gYGpCfS7Yeluxm0MzJwLzznjqTcg3muB/GJgTOCSjOaQ5Z/0i1m?=
 =?us-ascii?Q?nBLv9fSDGcdYNsQlWM/brErkX0I34sKplNkRi4DELMXHZeqpocdjzGmJehk0?=
 =?us-ascii?Q?t+dieeZyvXkFbTYYCAbgIq+SyCY0mxzTZRDr+EsD7WkjR3HK6OMxvUeUcaIN?=
 =?us-ascii?Q?C5xXwwX9u4W9QyTMYmz7d+ofvimtQBWyIDNapyXlEpEAtRlo8D62ejPJUXmA?=
 =?us-ascii?Q?MCd0jUVwt2AhGQxsiqztvTGHU2rAWXdm2VJSiRZIeDrKCRo6TYsHRZ8UzQJ3?=
 =?us-ascii?Q?NwHRMIEC2uL+rMh5aWH8VemNqLVwj2fd35McBwD5YTCdH2X287eowi4bQAJG?=
 =?us-ascii?Q?wB3HoJZ2CUD5aIhS796DVSkbhBraGDpfmbNlGz09QQpMiIpydZpg4bEPUzZV?=
 =?us-ascii?Q?2KOFnZn7cTZVBB3u7Vy+Rx8ORwlbUvMm3eD8SUkvOSBtMmTazQ7Mc52mc/iP?=
 =?us-ascii?Q?1JWzmMpA7Wbmw+1JoTrt8Uwz5iloxdizmk8QXE1JwibtWKwILCCbbWrW1w/S?=
 =?us-ascii?Q?GEjTVCFUoMYrPnERUWDF1RYRRWqIESSa1oCfuXw6Xpazq2FlBiGXFZokqkqg?=
 =?us-ascii?Q?KrVOlgAmZ8dwKx5lv2jkM+CuZxUWJ5s8dQwCAc34YTerp/cWHlm6X5sVXvUQ?=
 =?us-ascii?Q?ZFJ7wSIOpDK4Ds6ZbJ1k3lEy0KZo3tIlVnE2xk1aOmyXNfhVgH5TzvjP/86Y?=
 =?us-ascii?Q?5eVZ+afi5Dpe+sp4IK30ec8QNGpmMhcz59Vq+o4O8GEaL1hJcaINjoT5wZg7?=
 =?us-ascii?Q?Vl1PxIBc75K+NngbG3BVUEALB0vmxMwdZKVv/1j4cQM0LyYHDUI3EYPJcvVy?=
 =?us-ascii?Q?z2sVpFQ2lKEwW8Cu2VXL3Q5qMHwzE0zbW/pQ1UKq2xorKYOijplKvsU14EJy?=
 =?us-ascii?Q?gp8jSMuh5iIMPtiufcVkRxiACgLzMiTqFRs+oiS6/Zq810/5rg9uh+czSlL0?=
 =?us-ascii?Q?+2ypvE7XFHOSeQVhPcaBOknKSkeyam42IzSDIS0JBoctCYk82sltyS0FJ4cr?=
 =?us-ascii?Q?E/chbFNrXOHEUE3/Xr2G9AtzAXn4nIJCW51ffS/goAduoyIZqjgsNA7P8xvf?=
 =?us-ascii?Q?9oOnKHPQZLJVQ0hwjl8l8n2FfTu9fAQ5Go73DvMb2ariX7jPKjKndhIJtQfW?=
 =?us-ascii?Q?sOv3rsvO7uTsmmImNEhzV2cnE9dPazSHV24UQDrTn7dahoPRWBFyeIRR0CnS?=
 =?us-ascii?Q?t9+JKksOvmhQyLnXCROYxoFMVs3FkHJg1VKJU3YhBeYSZS4FAahB3UueFV6e?=
 =?us-ascii?Q?ciJWRaW2OxeXd7aIeIxQJdgcRRj322pC41TO6S2f7aq+8g114AZrhS1C32iK?=
 =?us-ascii?Q?D2/kx/bk1YF1lupo8YmT0I2rrFDXXi/icp2TvvEIUAVtoSG7TgMgZx4Psl5X?=
 =?us-ascii?Q?+f4xTqXAAR2KusbG2Hi+xrW5qTwCL5ctjx27Frb4DZ2Fk5cdvenxcjdhsvGt?=
 =?us-ascii?Q?cKjYpZHlm3RFrpecfSxa51hGrv6uFY6MYaD/qOizyVzXnol3NrI8s68VoTS0?=
 =?us-ascii?Q?j3HyBw+3Lbx3ht+5pvMkhaBnM6SnEJrtE3kwpXINKPaNz3kY3RqhfYD9BxVn?=
 =?us-ascii?Q?h2gV1v1ljAR6pnOp1sljGzBj+6w=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64db0262-d439-4efc-da08-08d9e17282d9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:53:38.8722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itYeMGL17U8/cz/B+h9Yjw6reNp7ladu5M0dh2+/dN1Yiuhb+VwEgsgKSRMdFPEcaDvn557UmW60uZ7hGfZukVeGACGKHj8uO+AcE6SPOlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3685
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270052
X-Proofpoint-GUID: fKsHAkOrfXsaa4HAgDttVP6_H0S8RG64
X-Proofpoint-ORIG-GUID: fKsHAkOrfXsaa4HAgDttVP6_H0S8RG64
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Lorenzo Bianconi,

This is a semi-automatic email about new static checker warnings.

The patch c41ced023a98: "net: mvneta: add frags support to XDP_TX"
from Jan 21, 2022, leads to the following Smatch complaint:

    drivers/net/ethernet/marvell/mvneta.c:2145 mvneta_xdp_submit_frame()
    warn: variable dereferenced before check 'tx_desc' (see line 2136)

drivers/net/ethernet/marvell/mvneta.c
  2080        static int
  2081        mvneta_xdp_submit_frame(struct mvneta_port *pp, struct mvneta_tx_queue *txq,
  2082                                struct xdp_frame *xdpf, int *nxmit_byte, bool dma_map)
  2083        {
  2084                struct skb_shared_info *sinfo = xdp_get_shared_info_from_frame(xdpf);
  2085                struct device *dev = pp->dev->dev.parent;
  2086                struct mvneta_tx_desc *tx_desc = NULL;
  2087                int i, num_frames = 1;
  2088                struct page *page;
  2089
  2090                if (unlikely(xdp_frame_has_frags(xdpf)))
  2091                        num_frames += sinfo->nr_frags;
  2092
  2093                if (txq->count + num_frames >= txq->size)
  2094                        return MVNETA_XDP_DROPPED;
  2095
  2096                for (i = 0; i < num_frames; i++) {

We know num_frames is non-zero

  2097                        struct mvneta_tx_buf *buf = &txq->buf[txq->txq_put_index];
  2098                        skb_frag_t *frag = NULL;
  2099                        int len = xdpf->len;
  2100                        dma_addr_t dma_addr;
  2101
  2102                        if (unlikely(i)) { /* paged area */
  2103                                frag = &sinfo->frags[i - 1];
  2104                                len = skb_frag_size(frag);
  2105                        }
  2106
  2107                        tx_desc = mvneta_txq_next_desc_get(txq);
  2108                        if (dma_map) {
  2109                                /* ndo_xdp_xmit */
  2110                                void *data;
  2111
  2112                                data = unlikely(frag) ? skb_frag_address(frag)
  2113                                                      : xdpf->data;
  2114                                dma_addr = dma_map_single(dev, data, len,
  2115                                                          DMA_TO_DEVICE);
  2116                                if (dma_mapping_error(dev, dma_addr)) {
  2117                                        mvneta_txq_desc_put(txq);
  2118                                        goto unmap;
  2119                                }
  2120
  2121                                buf->type = MVNETA_TYPE_XDP_NDO;
  2122                        } else {
  2123                                page = unlikely(frag) ? skb_frag_page(frag)
  2124                                                      : virt_to_page(xdpf->data);
  2125                                dma_addr = page_pool_get_dma_addr(page);
  2126                                if (unlikely(frag))
  2127                                        dma_addr += skb_frag_off(frag);
  2128                                else
  2129                                        dma_addr += sizeof(*xdpf) + xdpf->headroom;
  2130                                dma_sync_single_for_device(dev, dma_addr, len,
  2131                                                           DMA_BIDIRECTIONAL);
  2132                                buf->type = MVNETA_TYPE_XDP_TX;
  2133                        }
  2134                        buf->xdpf = unlikely(i) ? NULL : xdpf;
  2135
  2136                        tx_desc->command = unlikely(i) ? 0 : MVNETA_TXD_F_DESC;
                              ^^^^^^^^^^^^^^^^
Dereferenced

  2137                        tx_desc->buf_phys_addr = dma_addr;
  2138                        tx_desc->data_size = len;
  2139                        *nxmit_byte += len;
  2140
  2141                        mvneta_txq_inc_put(txq);
  2142                }
  2143
  2144                /*last descriptor */
  2145                if (likely(tx_desc))
                                 ^^^^^^^
Checked after dereference.

  2146                        tx_desc->command |= MVNETA_TXD_L_DESC | MVNETA_TXD_Z_PAD;
  2147
  2148                txq->pending += num_frames;
  2149                txq->count += num_frames;
  2150
  2151                return MVNETA_XDP_TX;
  2152
  2153        unmap:
  2154                for (i--; i >= 0; i--) {
  2155                        mvneta_txq_desc_put(txq);
  2156                        tx_desc = txq->descs + txq->next_desc_to_proc;
  2157                        dma_unmap_single(dev, tx_desc->buf_phys_addr,
  2158                                         tx_desc->data_size,

regards,
dan carpenter
