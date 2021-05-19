Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E46C433ED
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 May 2021 08:31:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FE716135F
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 May 2021 08:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235632AbhESIcg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 May 2021 04:32:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48092 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234182AbhESIcg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 May 2021 04:32:36 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14J8VGib002960;
        Wed, 19 May 2021 08:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Br1TyCoTmtGrZRabedTQbhiW2Bal2CFMsouHP+s4w9o=;
 b=J3oZO0hdvfu3WDd3MhC0wpuORCTa+DWNzTl48ZnwDvdqzwYSFrY15oR52ap9OT+44q9g
 EU5dLlAsBQwIXrn2G83fcF1I6a70lKFbn5Jhev4tydlmifgl+oX1NUbU1KjJ4Wad3pJr
 +DXtJQXqnvoatDuh987B8L2nFW//zXfXWhe+G4Ltwtcj+1/RmxIgXg24xUixw1//Mw8i
 j53MkAZD5CP3YC/FTfPKJrOQFUY0kVAe+eLBke7+bx7KbulA6pfOFX7xStFfNqVOOWWb
 MkzUTCQXay5A6/76PgMeujmLXk/D+Z8F5EkQregDQQdpkojawpLbFqbAPqqq5DcMYfve ug== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38kh0h91ss-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 May 2021 08:31:16 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14J8VFpc140419;
        Wed, 19 May 2021 08:31:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38mechge6c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 May 2021 08:31:15 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14J8QrQ9104928;
        Wed, 19 May 2021 08:31:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 38mechge5s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 19 May 2021 08:31:14 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14J8VEoI017489;
        Wed, 19 May 2021 08:31:14 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 19 May 2021 08:31:13 +0000
Date:   Wed, 19 May 2021 11:31:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     ansuelsmth@gmail.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: dsa: qca8k: add support for switch rev
Message-ID: <YKTMzJOmd7AZGQID@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: MhHgPpoOBi5dnNEdD1ajqwJtB-MES4Ur
X-Proofpoint-ORIG-GUID: MhHgPpoOBi5dnNEdD1ajqwJtB-MES4Ur
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Ansuel Smith,

The patch 95ffeaf18b3b: "net: dsa: qca8k: add support for switch rev"
from May 14, 2021, leads to the following static checker warning:

drivers/net/dsa/qca8k.c:163 qca8k_read() warn: unsigned 'val' is never less than zero.
drivers/net/dsa/qca8k.c:212 qca8k_rmw() warn: unsigned 'val' is never less than zero.
drivers/net/dsa/qca8k.c:309 qca8k_busy_wait() warn: unsigned 'val' is never less than zero.
drivers/net/dsa/qca8k.c:324 qca8k_fdb_read() warn: unsigned 'val' is never less than zero.
drivers/net/dsa/qca8k.c:400 qca8k_fdb_access() warn: unsigned 'reg' is never less than zero.
drivers/net/dsa/qca8k.c:481 qca8k_vlan_access() warn: unsigned 'reg' is never less than zero.
drivers/net/dsa/qca8k.c:509 qca8k_vlan_add() warn: unsigned 'reg' is never less than zero.
drivers/net/dsa/qca8k.c:544 qca8k_vlan_del() warn: unsigned 'reg' is never less than zero.
drivers/net/dsa/qca8k.c:648 qca8k_mdio_busy_wait() warn: unsigned 'val' is never less than zero.
drivers/net/dsa/qca8k.c:1315 qca8k_phylink_mac_link_state() warn: unsigned 'reg' is never less than zero.
drivers/net/dsa/qca8k.c:1425 qca8k_get_ethtool_stats() warn: unsigned 'val' is never less than zero.
drivers/net/dsa/qca8k.c:1430 qca8k_get_ethtool_stats() warn: unsigned 'hi' is never less than zero.
drivers/net/dsa/qca8k.c:1459 qca8k_set_mac_eee() warn: unsigned 'reg' is never less than zero.
drivers/net/dsa/qca8k.c:1799 qca8k_read_switch_id() warn: unsigned 'val' is never less than zero.

drivers/net/dsa/qca8k.c:732 qca8k_mdio_read() warn: always true condition '(val >= 0) => (0-u32max >= 0)'

drivers/net/dsa/qca8k.c
   151  static u32
               ^^^
This is a unsigned, but the callers expect int.  Which is harmless but
kind of messy.

   152  qca8k_read(struct qca8k_priv *priv, u32 reg)
   153  {
   154          struct mii_bus *bus = priv->bus;
   155          u16 r1, r2, page;
   156          u32 val;
   157  
   158          qca8k_split_addr(reg, &r1, &r2, &page);
   159  
   160          mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
   161  
   162          val = qca8k_set_page(bus, page);
   163          if (val < 0)

Obviously unsigned can't be less than zero.

   164                  goto exit;
   165  
   166          val = qca8k_mii_read32(bus, 0x10 | r2, r1);

How high can this be?  In real life I expect that it's fine and there
are few times where we actually need to go over INT_MAX (2 million
should be enough for anybody), but it might be better to not mix this
with error codes?

   167  
   168  exit:
   169          mutex_unlock(&bus->mdio_lock);
   170          return val;
   171  }

regards,
dan carpenter
