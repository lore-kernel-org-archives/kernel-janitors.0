Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C05C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  1 Dec 2021 07:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347121AbhLAHOs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 1 Dec 2021 02:14:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27596 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347106AbhLAHOr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Dec 2021 02:14:47 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B15ngJO015150;
        Wed, 1 Dec 2021 07:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=5Cl5t9JynECLUST/wJDnKMgQ93OlivqZ/Ytg8hrgzs0=;
 b=vla2aa1BXoQp3ndpR/Q03pKty39fdaetZtPBd9uOZMnwM5QmTUP797Vx9vu9k7wgWtK1
 8zinuZIeLUJMxlkeeeFwshySnwvXrkcGAXCnCu0JtGLSJDiWhzAL+fawuu+oxyiOw10V
 YkahUxFibJMnRSWQ91R306BEXLgK74Vqh7zvOzOep7ojNN4xgYma3C/pyixpczjYvOD9
 9RujSATOzdrEvCawwtRGVc+hfMzYPfsCcx/rTplN4ihqPrPpuOm+WS03mGH5NBkEQ3No
 OprHjKUe41skkWUzacbEifvYzqmMf0oDLIevNnp5aWYQKV49TeNJd+2o1vZl2aCWg/RD 4A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cmt8cecv0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 Dec 2021 07:11:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B175n1f177987;
        Wed, 1 Dec 2021 07:11:24 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
        by userp3030.oracle.com with ESMTP id 3ck9t16cpm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 01 Dec 2021 07:11:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDWf5jPOn/0bRkpJ3KpC57Ha/Dx74g/wNDC4PafD1S1ScaZaGGtOWcgHPSrVGdO0lMAvAblladlxHRJq8P87wiMHbtR6chYgB6uCQlgo9cIzP60+0AQivukGbgVO9FhYa3D0HvX5AhchRL2kgp4yY2kFOTHyKlN0Pz6QYSgdHOzI/Ja+3iMV18HNcnqT8f3eI3JC9iZPMp+lDC1wwWYZaYKd03Oyk1ALLABeMx+Go9miRXL8X32VbLdVNPBOFh+/VHbPQNOB9uduqCWiOn1E2U6iZjI3jDClqDVdvUwQvYbTT38E0+16JwG7F3YYfHF4+7onOv16z8ZSpzHdfaExAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Cl5t9JynECLUST/wJDnKMgQ93OlivqZ/Ytg8hrgzs0=;
 b=FJJGrDEbq+3yNfgjlpWP6BpGUit03lT5G0CrSAseqZ+6WuXAQ2A+2j/rQhG4ZCHKYKgpm6A865KmxM2Xla2m2Jct7PdxxebD9rU61b9Lixdp26U99D9AOFNzll0N848suZra28+GVDZbtrfZXUBmEsP8sZ0nfyttaSjihmWkvN+X7uk9K+X5HJTkryIakvfK3vNlQuvJGs55uXchVNp/UFU/APh5kLDAFJdiKFR/ZjbxtXeCHpCOPrwazHLsXv6ijX8NNMsHNG00aEillIc88INsnX8CVSyWXMA3QeXIyy96kCFfcdkgOd7HDs+HHcr4y/0P3GnREFgmcwDsIvsNog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Cl5t9JynECLUST/wJDnKMgQ93OlivqZ/Ytg8hrgzs0=;
 b=Y/qrCICT2tCg9I6LZOzt05tbx+sfmbSTcCBeiodqONU/gXEPrU+wvrto/7yLlzWiXpcE+OPb5JzSDJ1kIpX1xJ5kKOWEX3S1cchCPPKuHuo+6ppKVqFTLB5d4krX2uYGfbQQGNCAqyyHsCgoMuyn70XPtG3c/bBwy0j02kNrVDY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2256.namprd10.prod.outlook.com
 (2603:10b6:301:31::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 1 Dec
 2021 07:11:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.027; Wed, 1 Dec 2021
 07:11:21 +0000
Date:   Wed, 1 Dec 2021 10:11:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     horatiu.vultur@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: lan966x: add port module support
Message-ID: <20211201071104.GA19105@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0185.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0185.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:44::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend Transport; Wed, 1 Dec 2021 07:11:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 310e43a9-dba5-49dd-1564-08d9b499c75e
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2256:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB22569F038E3FD1178D2873DA8E689@MWHPR1001MB2256.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RjHiwRgf9OvXPU9hdf3pNdQavTDF7X078/IqBanuDyPYu/+GpW64f7jndKGTCwghgzBPeivF0LoXmPDwqtqleO5QZFMkusL/rFcupy1tF8AJ3DBi1IeV8czIBUNUuR8fF5Ws8GUnK/RGKHs/JL0RoZ/YUL5l+y9VOD/36D4Ar8uiO56D2Mi1WWo95qQLWY4X0YcfVv8luPQ9ed8uxVd69HbiaUdGCSBBiyKP/tcQYPDIHxxe5EYoagbdgiYM4SQoVpiDsfcA18mWYFYlZJ7Q8L/vPOnyz28GnfNamk17q17ygivHcJx+c4249nJkhMQz69ZtIP1yogPyNY5Jt4QIcomYDFGbXb3L/fUnQyVjSnsuHTIzbeZP5amUOA8vVdM22xiCaJDNDBbDoK1qesLw69GENKHTYQtDWQ/0J2zvF8n0umNa5hbnW1ZAkAB0WBbB6MWA5wmPw21geBokAyjKMVak0Y7a8zb9naxSNoU3RZS3chjSFSh9suhKr23jAJPV/MTrV0/+cC6SR6T6D6Mg1ZCqTEo4fpq3cIQcNOqZI7JJLivqRPkoIYIsbVnvViWP/RNwzp4aOVX1S3ZlUI6gawE3EoDGD7gAuL8HnJkd//a+FhiRQThnmMLzKmXYF0L1khDBYZuKW4O89nNxzwTEV6digMgtIorKAHr70OUczRF0GmAM6F+STbxUVd+m4U/3AgxMfbnReVabNa+m3uUN9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016003)(8676002)(4326008)(33656002)(316002)(956004)(66476007)(9686003)(5660300002)(66946007)(26005)(1076003)(186003)(66556008)(6666004)(38350700002)(86362001)(38100700002)(508600001)(6916009)(44832011)(52116002)(6496006)(33716001)(83380400001)(2906002)(8936002)(9576002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B1MUragKOV4DsXz9RM9C7ZhRDaYAOvk2/xTbXyY2S9HZg2tBTFws2MtIjkSq?=
 =?us-ascii?Q?noefBcWz8GCombFWiUP5eyCXva76GPJ8IZNWk1N/No3UEWrODplSU+g7RdQr?=
 =?us-ascii?Q?5dJ5huzEWTraWFJR4DTqMQeb1SpShxSXJA+4EqZjZOBMXL114GKV2GudZNqi?=
 =?us-ascii?Q?F0Ib0epoDFc7vGOjQtJOEJPoTjWcEOrVn/wZEfVPQZ9tp0pW2+tFzEj3iE91?=
 =?us-ascii?Q?04ydpVtX8GmoCl+BPk4r9NYrLp89ab6PYwuwCBIRIdSWp1/RwdRflMjbAjpo?=
 =?us-ascii?Q?6zrCrE8Q3Q5YcG6X7XYEL827B+HqUkKTHwR25AP6Jz5JhVNn0XiDrU3bQ9es?=
 =?us-ascii?Q?lzWt/87Ydi3a7aC/YvTbpoq7HKAqanza6cNeTIUocx28K1VhGtw981py/E8v?=
 =?us-ascii?Q?Lz32RL4zfsc7VOnpKFR17DVCy22HCTCdYvaNQXbp3VxjiUviQFZp4IVnyO9g?=
 =?us-ascii?Q?PQhRcfjcTI8C9zYrPSt2Oir7EuEnivMseyLM/Ov9cPxh0HY2jzPvq4RRUKPU?=
 =?us-ascii?Q?uTvIvsjP2cNjCjVsY+uwrIohjukNiv89KMn1FKMULWxytrVUi2C8zHzY7kFj?=
 =?us-ascii?Q?sY6pwFWdMYJ8rYA5XD952T3mH8WrW6n6f8FWvttFpNgsMCm6nrw9f7J6esC+?=
 =?us-ascii?Q?EAjLaPfh6wOf5vQwTcrNmysPzPKZcN1t4/R5keV3yYuMm8GnB0wqM4eBmX2C?=
 =?us-ascii?Q?aewhL9X3HcxbmSoPSfcOfr26IJaFqhZedrUDcepahUMdjaIxSkmwIJXPNvay?=
 =?us-ascii?Q?8duBBDeN7pfgaWUQCHQaAO2aT9xkF7tJW7whzjThQYmjGcSpu7eYlz9nWnuf?=
 =?us-ascii?Q?5jXLYvVLoukibQyRQTRPwLnvkhhcJC1qYbFJXeTmsHv14fxolz/1+tQMM/rR?=
 =?us-ascii?Q?W8cjF20bFwoByXERqdtACZ3jG9WTBoFvY7khwtzPU3cb3UXKZPmi/5wHTJTR?=
 =?us-ascii?Q?HhUHycqs3XVQ5vHTHwwTVGqvgf497shKoSXy6MOGnS2JeZnxYVLFoeOCbGab?=
 =?us-ascii?Q?MgnoTcYD82JQhtwVxn5slL5D6vrERkAMcNY8oBqR38ON+9edwc45sApH+4r6?=
 =?us-ascii?Q?pUp1jRP6IQ/z+bngLPa9f3MT7niaAMhD06vTRruRKM2zbEN3uGEFmzIAtwil?=
 =?us-ascii?Q?tzxLKHb0xr1NvVUuRdfM2tg0DoId//Q3w5FdsD8yHeiwpUV4FRw6SqYxAWFi?=
 =?us-ascii?Q?pEl3CJ11dOuBkVJPl9hpXPyAvoVeLGA8u4QCiHcSth4AMnRCDm2C3IRA051+?=
 =?us-ascii?Q?E9tzg8Pid3L1X8MhfSrwFrJzaa5YLnvhmjCl4i5nhw9MFe+ymbtM8++E4h/S?=
 =?us-ascii?Q?9g8qgSBzhM8rZUW51qVD0sev0Q9bEd0GYzA+TgOX6xaQdX3dn+RVZNXrrRdB?=
 =?us-ascii?Q?rPnupYLLxeFZaSvZDcuc8HOBNqF5inY7MTcbvrTNwvXPvwF72MNoVP1pPBpi?=
 =?us-ascii?Q?S2xw9ReJ3V3bDl/PINLExHxysWeOEbJZOJf0HU0WffFwnBOwBIT5nEDggyfY?=
 =?us-ascii?Q?lTwgKmwEbUNytMfhXyIfn/islmuEaSrN4stRFlFMbbk3SGmrYWKOkg3ErLO/?=
 =?us-ascii?Q?64tptvMMaN+5UjB59gwYu1rEqFW1+I1ysGlOF7gKZPQnNKZi7nKXhkXQX0jj?=
 =?us-ascii?Q?Jt1njp7GRM+pvEfe/lDDpsVuJ70MV4rvby+8xRyYNbw0yu/pftIt6AFNF8j9?=
 =?us-ascii?Q?eFz6qlrSVKjzBiDsgos58odcyKg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310e43a9-dba5-49dd-1564-08d9b499c75e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 07:11:21.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sq6m0tjFraYvlThfrahSNHUX/4sxLnj3YapZOkf/SNavvvXlyN34kqYEG2smQlveBH4+nLlrWMwMgwg8Yhf8zcpc62lDTNRcTPbNaf/cF2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2256
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10184 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxlogscore=819 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112010041
X-Proofpoint-ORIG-GUID: OrN5z1cwfxkRjMpfl6yW-QqzcsbpHTDg
X-Proofpoint-GUID: OrN5z1cwfxkRjMpfl6yW-QqzcsbpHTDg
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Horatiu Vultur,

The patch d28d6d2e37d1: "net: lan966x: add port module support" from
Nov 29, 2021, leads to the following Smatch static checker warning:

	drivers/net/ethernet/microchip/lan966x/lan966x_main.c:515 lan966x_xtr_irq_handler()
	warn: duplicate check 'sz < 0' (previous on line 502)

drivers/net/ethernet/microchip/lan966x/lan966x_main.c
    448 static irqreturn_t lan966x_xtr_irq_handler(int irq, void *args)
    449 {
    450         struct lan966x *lan966x = args;
    451         int i, grp = 0, err = 0;
    452 
    453         if (!(lan_rd(lan966x, QS_XTR_DATA_PRESENT) & BIT(grp)))
    454                 return IRQ_NONE;
    455 
    456         do {
    457                 struct net_device *dev;
    458                 struct sk_buff *skb;
    459                 int sz = 0, buf_len;
    460                 u64 src_port, len;
    461                 u32 ifh[IFH_LEN];
    462                 u32 *buf;
    463                 u32 val;
    464 
    465                 for (i = 0; i < IFH_LEN; i++) {
    466                         err = lan966x_rx_frame_word(lan966x, grp, &ifh[i]);
    467                         if (err != 4)
    468                                 goto recover;
    469                 }
    470 
    471                 err = 0;
    472 
    473                 lan966x_ifh_get_src_port(ifh, &src_port);
    474                 lan966x_ifh_get_len(ifh, &len);
    475 
    476                 WARN_ON(src_port >= lan966x->num_phys_ports);
    477 
    478                 dev = lan966x->ports[src_port]->dev;
    479                 skb = netdev_alloc_skb(dev, len);
    480                 if (unlikely(!skb)) {
    481                         netdev_err(dev, "Unable to allocate sk_buff\n");
    482                         err = -ENOMEM;
    483                         break;
    484                 }
    485                 buf_len = len - ETH_FCS_LEN;
    486                 buf = (u32 *)skb_put(skb, buf_len);
    487 
    488                 len = 0;
    489                 do {
    490                         sz = lan966x_rx_frame_word(lan966x, grp, &val);
    491                         if (sz < 0) {
    492                                 kfree_skb(skb);
    493                                 goto recover;
    494                         }
    495 
    496                         *buf++ = val;
    497                         len += sz;
    498                 } while (len < buf_len);
    499 
    500                 /* Read the FCS */
    501                 sz = lan966x_rx_frame_word(lan966x, grp, &val);
    502                 if (sz < 0) {
                            ^^^^^^

    503                         kfree_skb(skb);
    504                         goto recover;
    505                 }
    506 
    507                 /* Update the statistics if part of the FCS was read before */
    508                 len -= ETH_FCS_LEN - sz;
    509 
    510                 if (unlikely(dev->features & NETIF_F_RXFCS)) {
    511                         buf = (u32 *)skb_put(skb, ETH_FCS_LEN);
    512                         *buf = val;
    513                 }
    514 
--> 515                 if (sz < 0) {
                            ^^^^^^
"sz" can't be negative here.

    516                         err = sz;
    517                         break;
    518                 }
    519 
    520                 skb->protocol = eth_type_trans(skb, dev);
    521 
    522                 netif_rx_ni(skb);
    523                 dev->stats.rx_bytes += len;
    524                 dev->stats.rx_packets++;
    525 
    526 recover:
    527                 if (sz < 0 || err)
    528                         lan_rd(lan966x, QS_XTR_RD(grp));
    529 
    530         } while (lan_rd(lan966x, QS_XTR_DATA_PRESENT) & BIT(grp));
    531 
    532         return IRQ_HANDLED;
    533 }

regards,
dan carpenter
