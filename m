Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F71C433E0
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 12:08:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C76A64E89
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 12:08:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhCRMIN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Mar 2021 08:08:13 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:52088 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhCRMHo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Mar 2021 08:07:44 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IC5Z4Y053534;
        Thu, 18 Mar 2021 12:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=JCJ0C2eYxUhyo1Loq0IHU2gZfUe2B2CX20eWKKywjzE=;
 b=smCZdvvwLY70939p1uBL3mWNrMtN+wyYN8M9v8BJ/D96OQty7QKDZyH0GvwdE/73MXDm
 +b75kuaEnIwf/Q0vishqPEkbTCq2GLcnKWsj6sxqXWr0vswu2hXWtPOuyfaMJ/k2ooPQ
 WU+3hhmfr88Pqd8xwAy844u+KcbHNN3qaH7Hpiz5QpEdv0HDLX64Chmg1pN9NJyL/v2b
 a/bf8ThHZijbh30jPZN0JmgXPtHZYpL8YYFKzqb27pnZSZmzMDUM+Sz5HRD9RxDpszYz
 xHu4iaquO3b8Xd9JakKVh8fX27KBol4FsKD8uyUMY9Spf1uk2W9kKahcSsy6ITn8Sfg5 fQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 378nbmf8mb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Mar 2021 12:07:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12IC6noK019643;
        Thu, 18 Mar 2021 12:07:40 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 3796yw48x4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Mar 2021 12:07:40 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12IC7dE1019203;
        Thu, 18 Mar 2021 12:07:39 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 18 Mar 2021 12:07:38 +0000
Date:   Thu, 18 Mar 2021 15:07:32 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     horatiu.vultur@microchip.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ocelot: Extend MRP
Message-ID: <YFNChN/C6JwVAV2t@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9926 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxscore=0 clxscore=1011 mlxlogscore=984
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103180093
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Horatiu Vultur,

This is a semi-automatic email about new static checker warnings.

The patch 7c588c3e96e9: "net: ocelot: Extend MRP" from Mar 16, 2021,
leads to the following Smatch complaint:

    drivers/net/ethernet/mscc/ocelot_mrp.c:180 ocelot_mrp_del()
    error: we previously assumed 'ocelot_port' could be null (see line 173)

drivers/net/ethernet/mscc/ocelot_mrp.c
   153  int ocelot_mrp_del(struct ocelot *ocelot, int port,
   154                     const struct switchdev_obj_mrp *mrp)
   155  {
   156          struct ocelot_port *ocelot_port = ocelot->ports[port];
   157          int i;
   158  
   159          if (!ocelot_port)
   160                  return -EOPNOTSUPP;
   161  
   162          if (ocelot_port->mrp_ring_id != mrp->ring_id)
   163                  return 0;
   164  
   165          ocelot_mrp_del_vcap(ocelot, port);
   166          ocelot_mrp_del_vcap(ocelot, port + ocelot->num_phys_ports);
   167  
   168          ocelot_port->mrp_ring_id = 0;
   169  
   170          for (i = 0; i < ocelot->num_phys_ports; ++i) {

This loop tries to verify that all the ports have ring_id == 0 otherwise
we return.  It's slightly confusing why this matters.

   171                  ocelot_port = ocelot->ports[i];
   172	
   173			if (!ocelot_port)
                             ^^^^^^^^^^^
Assume the last element of the array is NULL

   174				continue;
   175	
   176			if (ocelot_port->mrp_ring_id != 0)
   177				goto out;

This would be more clear if instead of a "goto out;" it just did a
direct "return 0;"

   178		}
   179	
   180		ocelot_mrp_del_mac(ocelot, ocelot_port);

We delete the last mac address of all the ring_ids are zero but if the
last port is zero it will crash.

   181	out:
   182		return 0;

regards,
dan carpenter
