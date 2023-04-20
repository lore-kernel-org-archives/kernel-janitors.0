Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0B2C77B72
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 13:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjDTNWc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 09:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjDTNWb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 09:22:31 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28DE49CE
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 06:22:29 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33KDMRdk038847;
        Thu, 20 Apr 2023 08:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1681996947;
        bh=XU7JDYXj4tuyjTJCQ2kUQvx69J3GAho4PNAyATsoNqc=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=fz7s0YsSEgidnf+YpWUzZXfFj5YP3q3C/XEMCxkH/BkN9ixQ9llF6gkHHTnQKFm/7
         H54wa423cEtQYtRAGs+5jPYyX37e24SdRzkl+t/d1E2CxQtvY1zICWNgx9MQSrIkwt
         705nTL2fO6TEUmfm6pEK5vW5KG00FyOD1aTPqmkc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33KDMRQi104648
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Apr 2023 08:22:27 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 20
 Apr 2023 08:22:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 20 Apr 2023 08:22:26 -0500
Received: from [10.249.133.214] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33KDMOZE031811;
        Thu, 20 Apr 2023 08:22:25 -0500
Message-ID: <722a2b1d-2989-13cf-3986-1eac8121b8a4@ti.com>
Date:   Thu, 20 Apr 2023 18:52:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [bug report] net: ti: am65-cpsw-nuss: Add switchdev support
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>
CC:     <kernel-janitors@vger.kernel.org>
References: <5c7bae37-3e0a-4f84-9d23-cd8f0d859823@kili.mountain>
From:   "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <5c7bae37-3e0a-4f84-9d23-cd8f0d859823@kili.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

+ Siddharth

On 4/20/2023 2:03 PM, Dan Carpenter wrote:
> Hello Vignesh Raghavendra,
> 
> The patch 86e8b070b25e: "net: ti: am65-cpsw-nuss: Add switchdev
> support" from Feb 11, 2021, leads to the following Smatch static
> checker warning:
> 
> 	drivers/net/ethernet/ti/am65-cpsw-switchdev.c:187 am65_cpsw_port_vlan_add()
> 	warn: missing error code? 'ret'
> 
> drivers/net/ethernet/ti/am65-cpsw-switchdev.c
>     149 static int am65_cpsw_port_vlan_add(struct am65_cpsw_port *port, bool untag, bool pvid,
>     150                                    u16 vid, struct net_device *orig_dev)
>     151 {
>     152         bool cpu_port = netif_is_bridge_master(orig_dev);
>     153         struct am65_cpsw_common *cpsw = port->common;
>     154         int unreg_mcast_mask = 0;
>     155         int reg_mcast_mask = 0;
>     156         int untag_mask = 0;
>     157         int port_mask;
>     158         int ret = 0;
>     159         u32 flags;
>     160 
>     161         if (cpu_port) {
>     162                 port_mask = BIT(HOST_PORT_NUM);
>     163                 flags = orig_dev->flags;
>     164                 unreg_mcast_mask = port_mask;
>     165         } else {
>     166                 port_mask = BIT(port->port_id);
>     167                 flags = port->ndev->flags;
>     168         }
>     169 
>     170         if (flags & IFF_MULTICAST)
>     171                 reg_mcast_mask = port_mask;
>     172 
>     173         if (untag)
>     174                 untag_mask = port_mask;
>     175 
>     176         ret = cpsw_ale_vlan_add_modify(cpsw->ale, vid, port_mask, untag_mask,
>     177                                        reg_mcast_mask, unreg_mcast_mask);
>     178         if (ret) {
>                     ^^^
> ret is zero.
> 
>     179                 netdev_err(port->ndev, "Unable to add vlan\n");
>     180                 return ret;
>     181         }
>     182 
>     183         if (cpu_port)
>     184                 cpsw_ale_add_ucast(cpsw->ale, port->slave.mac_addr,
>     185                                    HOST_PORT_NUM, ALE_VLAN | ALE_SECURE, vid);
>     186         if (!pvid)
> --> 187                 return ret;
> 
> I think returning zero might have been intentional here, but it would
> be better to do an explicit "return 0;"
> 

Correct

>     188 
>     189         am65_cpsw_set_pvid(port, vid, 0, 0);
>     190 
>     191         netdev_dbg(port->ndev, "VID add: %s: vid:%u ports:%X\n",
>     192                    port->ndev->name, vid, port_mask);
>     193 
>     194         return ret;
> 
> Same here too, I suppose, although Smatch doesn't care about this.

Your suggestions make sense. Thanks for the report. I or Siddharth will
send a fix.

> 
>     195 }
> 

Regards
Vignesh
