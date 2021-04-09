Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0747C43460
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 06:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AAF7610CF
	for <kernel-janitors@archiver.kernel.org>; Fri,  9 Apr 2021 06:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbhDIGr5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 9 Apr 2021 02:47:57 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51828 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbhDIGrz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 9 Apr 2021 02:47:55 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1396jviF024106;
        Fri, 9 Apr 2021 06:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=w6hK+KGzUIsDEezHpjQ76dhJ9nEa/abMtpbrS7chqGk=;
 b=m5gQHeAXQChrIrqWdCgN3SBVo5V/SYC6SeTiHH835q3qyjySQ/YNPSeRSAX1UV/OgIvZ
 A6j9TMRc3gbq/03CoMsOUgxm+edaKvZGYGfHRwFxNz2Twv1ZVS+51XEqvWS0wxZnCJCf
 g/2ZJbqo1EdoPNzMYJqLBtdZymG+zUXSduvrul4xeIByMNQM+27E9VNEBMhQCgHpgBAY
 FXTyftehBTi2hGv5VBq9nSC98tWhDICdZFVEiPvYfpux0zeeNLSXQzV50t0wdrCT72+B
 8/8HQwYWKgd8amLynFF3szRHDumzHn2TPRz7yYv+dZLOkzHkcnssbhi9KIF+0k1AFagQ NA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 37rvagg7dc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 06:47:41 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1396k9Jb069125;
        Fri, 9 Apr 2021 06:47:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 37rvbgndrn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Apr 2021 06:47:40 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 1396ldMh015308;
        Fri, 9 Apr 2021 06:47:39 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 08 Apr 2021 23:47:38 -0700
Date:   Fri, 9 Apr 2021 09:47:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     snelson@pensando.io
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] ionic: add ethtool support for PTP
Message-ID: <YG/4hBGWp35acsPo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=899 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090049
X-Proofpoint-GUID: wZV9hq3p-RtYFMN5xWMCMXM1sIawA4xe
X-Proofpoint-ORIG-GUID: wZV9hq3p-RtYFMN5xWMCMXM1sIawA4xe
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9948 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 mlxlogscore=879
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104090049
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Shannon Nelson,

The patch f8ba81da73fc: "ionic: add ethtool support for PTP" from Apr
1, 2021, leads to the following static checker warning:

drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:895 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V1_L4_SYNC' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:899 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:903 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V1_L4_EVENT' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:907 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V2_L4_SYNC' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:911 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:915 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V2_L4_EVENT' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:927 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V2_L2_EVENT' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:931 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V2_SYNC' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:935 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V2_DELAY_REQ' is a shifter (not for '|=').
drivers/net/ethernet/pensando/ionic/ionic_ethtool.c:939 ionic_get_ts_info() warn: 'HWTSTAMP_FILTER_PTP_V2_EVENT' is a shifter (not for '|=').

drivers/net/ethernet/pensando/ionic/ionic_ethtool.c
   884          /* rx filters */
   885  
   886          info->rx_filters = BIT(HWTSTAMP_FILTER_NONE) |
   887                             BIT(HWTSTAMP_FILTER_ALL);
   888  
   889          mask = cpu_to_le64(IONIC_PKT_CLS_NTP_ALL);
   890          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   891                  info->rx_filters |= HWTSTAMP_FILTER_NTP_ALL;
   892  
   893          mask = cpu_to_le64(IONIC_PKT_CLS_PTP1_SYNC);
   894          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   895                  info->rx_filters |= HWTSTAMP_FILTER_PTP_V1_L4_SYNC;

This should probably be: BIT(HWTSTAMP_FILTER_PTP_V1_L4_SYNC).  This value
is 4.

   896  
   897          mask = cpu_to_le64(IONIC_PKT_CLS_PTP1_DREQ);
   898          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   899                  info->rx_filters |= HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ;

This value is 5 so BIT(4) | BIT(1).

   900  
   901          mask = cpu_to_le64(IONIC_PKT_CLS_PTP1_ALL);
   902          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   903                  info->rx_filters |= HWTSTAMP_FILTER_PTP_V1_L4_EVENT;
   904  
   905          mask = cpu_to_le64(IONIC_PKT_CLS_PTP2_L4_SYNC);
   906          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   907                  info->rx_filters |= HWTSTAMP_FILTER_PTP_V2_L4_SYNC;
   908  
   909          mask = cpu_to_le64(IONIC_PKT_CLS_PTP2_L4_DREQ);
   910          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   911                  info->rx_filters |= HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ;
   912  
   913          mask = cpu_to_le64(IONIC_PKT_CLS_PTP2_L4_ALL);
   914          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   915                  info->rx_filters |= HWTSTAMP_FILTER_PTP_V2_L4_EVENT;
   916  
   917          mask = cpu_to_le64(IONIC_PKT_CLS_PTP2_L2_SYNC);
   918          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   919                  info->rx_filters |= HWTSTAMP_FILTER_PTP_V2_L2_SYNC;
   920  
   921          mask = cpu_to_le64(IONIC_PKT_CLS_PTP2_L2_DREQ);
   922          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)
   923                  info->rx_filters |= HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ;
   924  
   925          mask = cpu_to_le64(IONIC_PKT_CLS_PTP2_L2_ALL);
   926          if ((ionic->ident.lif.eth.hwstamp_rx_filters & mask) == mask)

regards,
dan carpenter
