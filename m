Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502CEC433ED
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 17:58:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C680613CD
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 17:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233225AbhDTR6e (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:58:34 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:60752 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTR6d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Apr 2021 13:58:33 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13KHo2YT020198;
        Tue, 20 Apr 2021 17:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=/NP0aVPyRs47W6GLPGaEeGhfjDqmD1N/kQqvIuTsibY=;
 b=gP+KfbgWO08rM/XtmNlb/Zs+V2ynuixryHql9x3Tg30GjvXk6X3kuTvhm3qK00bv8Q5I
 SclZ2RmJKso3P98BhAulGp6DYXbO6U2gbYzufVOvzPrn598YVwPxCVxCkuejf4vZ2nQA
 aVKb5xAYj446nwTS9pDjMo5bZyfUnqM+2vrCKC5KAbAtMeEZXahbWNilQlzfYzLBWWVW
 mcPIc1KyYjppLP5+KbUayskBvtJ6mEEIoJIxY/k3voPVNBeWVLJ0Ul78FU99vBV49yrq
 vJzrq+gqIReLafv7ktXh4himWuDFfc8Eemv2+GTJ4Q/zjiO0DIqBsdUKLANDzpmlYf4z Fw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 37yn6c846x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Apr 2021 17:58:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13KHp7ZP080998;
        Tue, 20 Apr 2021 17:58:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 3809kydqh9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Apr 2021 17:58:00 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13KHtDeE095098;
        Tue, 20 Apr 2021 17:57:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3809kydqg2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Apr 2021 17:57:59 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13KHvwTW025312;
        Tue, 20 Apr 2021 17:57:58 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 20 Apr 2021 17:57:57 +0000
Date:   Tue, 20 Apr 2021 20:57:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     loic.poulain@linaro.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: Add a WWAN subsystem
Message-ID: <YH8WICWXexnR0Xul@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: W1jPj3WlQJ_SI_-ttFcgtmjX5sOB8aG3
X-Proofpoint-ORIG-GUID: W1jPj3WlQJ_SI_-ttFcgtmjX5sOB8aG3
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9960 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 mlxlogscore=893 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104200122
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Loic Poulain,

The patch 9a44c1cc6388: "net: Add a WWAN subsystem" from Apr 16,
2021, leads to the following static checker warning:

	drivers/net/wwan/wwan_core.c:305 wwan_port_txon()
	warn: test_bit() takes a bit number

drivers/net/wwan/wwan_core.c
   303  void wwan_port_txon(struct wwan_port *port)
   304  {
   305          clear_bit(WWAN_PORT_TX_OFF, &port->flags);
                          ^^^^^^^^^^^^^^^^
This is BIT(0) but the clear_bit() argument should just be 0 otherwise
it's a double shift bug like BIT(BIT(0)).

   306          wake_up_interruptible(&port->waitqueue);
   307  }

See also:

drivers/net/wwan/wwan_core.c:305 wwan_port_txon() warn: test_bit() takes a bit number
drivers/net/wwan/wwan_core.c:312 wwan_port_txoff() warn: test_bit() takes a bit number
drivers/net/wwan/wwan_core.c:379 is_write_blocked() warn: test_bit() takes a bit number
drivers/net/wwan/mhi_wwan_ctrl.c:46 mhi_wwan_rx_budget_inc() warn: test_bit() takes a bit number
drivers/net/wwan/mhi_wwan_ctrl.c:62 mhi_wwan_rx_budget_dec() warn: test_bit() takes a bit number
drivers/net/wwan/mhi_wwan_ctrl.c:119 mhi_wwan_ctrl_start() warn: test_bit() takes a bit number
drivers/net/wwan/mhi_wwan_ctrl.c:120 mhi_wwan_ctrl_start() warn: test_bit() takes a bit number
drivers/net/wwan/mhi_wwan_ctrl.c:132 mhi_wwan_ctrl_stop() warn: test_bit() takes a bit number
drivers/net/wwan/mhi_wwan_ctrl.c:148 mhi_wwan_ctrl_tx() warn: test_bit() takes a bit number
drivers/net/wwan/mhi_wwan_ctrl.c:230 mhi_wwan_ctrl_probe() warn: test_bit() takes a bit number
drivers/net/wwan/mhi_wwan_ctrl.c:232 mhi_wwan_ctrl_probe() warn: test_bit() takes a bit number

regards,
dan carpenter
