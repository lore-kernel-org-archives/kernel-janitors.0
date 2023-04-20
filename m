Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90703C77B73
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 08:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbjDTIdd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 04:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbjDTIdb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 04:33:31 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C99F9D
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 01:33:30 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id o29-20020a05600c511d00b003f1739de43cso709114wms.4
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681979609; x=1684571609;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=woHSg1kHD9P+uwP6r4Cn6r0KTjKAlW+V2NCjsW/6MOo=;
        b=HMr4aq0ZLdLQicdWNgra3lbVYJWoFYR4geIvV1wBhOT6XqRru70KXLzSXmK2dEzBIJ
         4FLFB1eaxN6HlZyCRobKNCIs4jnmkoe8m+OjUtEpv8/pMt7jTDJtd7lRxy2JbabOMVpk
         iyQvWR+xGNL0evmGwyk5UQcrc9IkwB0inIT054OajHKNZ1LehrD7MORwf0D3N0bbF7su
         EyFHsCWP9UEKCmJm7ezZlKsezeSo5z65NeNX7llBkVVHrzLoKDx9h1w5fdcHPB2+ZGG6
         8mEzHwK3qNZf6BadJBM9y18YV1o2RWzEVO+ZNhxVHfrZIQ78/dZkMjLW6ozlO+qiiDTe
         20OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681979609; x=1684571609;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woHSg1kHD9P+uwP6r4Cn6r0KTjKAlW+V2NCjsW/6MOo=;
        b=IfW/dap8M9WocGNvnHRwiOeakvKgaMfCTMaRgxybbOlqkV9v9COM8RCDJTHoKhjpf2
         qKyc7NKPc1U4MUL8nW4NpPni/FYPSFkteYuC7goWVeex+g1Y3ZfTUaFFc07T2Jc1u2wm
         /nWjylOsdeYnCQfln09K2ek7yfVXulfx/XQdZmr2yjMwrfdn+EKz2IDBN4Xi5vMrHlb7
         2nEu3BolqbRH018aRKUEB79FCB5qsoEDJ2u/OGZnQT1i1+69/9wc13mSnPpHFxJdL8Sa
         gPF7EvFCfbh3X5niHW+sDUKXH8EFHqrxFqNYfw311zKHW3DGIgJuZcXiV6nUuvF/ykWk
         Xn3A==
X-Gm-Message-State: AAQBX9c/x4FCTuxQ43ereUZTzGJiu6F3FlSjZvv+iIMfHpopK+Yr7CDD
        VBOm8dn7MmEtxK9rGj3sDScKMWM0D8mzB5BlVsz8SZsX
X-Google-Smtp-Source: AKy350Z7tXpuxC+GVtQh+mE45SV2strjtSOCTrdrZ/Pkb6eO2/4KTghv3dUAn30zRUotPvolZRj/Pw==
X-Received: by 2002:a1c:f70b:0:b0:3f0:a3cb:c750 with SMTP id v11-20020a1cf70b000000b003f0a3cbc750mr552647wmh.40.1681979608735;
        Thu, 20 Apr 2023 01:33:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k25-20020a05600c081900b003f17122587bsm4603620wmp.36.2023.04.20.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 01:33:28 -0700 (PDT)
Date:   Thu, 20 Apr 2023 11:33:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     vigneshr@ti.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ti: am65-cpsw-nuss: Add switchdev support
Message-ID: <5c7bae37-3e0a-4f84-9d23-cd8f0d859823@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Vignesh Raghavendra,

The patch 86e8b070b25e: "net: ti: am65-cpsw-nuss: Add switchdev
support" from Feb 11, 2021, leads to the following Smatch static
checker warning:

	drivers/net/ethernet/ti/am65-cpsw-switchdev.c:187 am65_cpsw_port_vlan_add()
	warn: missing error code? 'ret'

drivers/net/ethernet/ti/am65-cpsw-switchdev.c
    149 static int am65_cpsw_port_vlan_add(struct am65_cpsw_port *port, bool untag, bool pvid,
    150                                    u16 vid, struct net_device *orig_dev)
    151 {
    152         bool cpu_port = netif_is_bridge_master(orig_dev);
    153         struct am65_cpsw_common *cpsw = port->common;
    154         int unreg_mcast_mask = 0;
    155         int reg_mcast_mask = 0;
    156         int untag_mask = 0;
    157         int port_mask;
    158         int ret = 0;
    159         u32 flags;
    160 
    161         if (cpu_port) {
    162                 port_mask = BIT(HOST_PORT_NUM);
    163                 flags = orig_dev->flags;
    164                 unreg_mcast_mask = port_mask;
    165         } else {
    166                 port_mask = BIT(port->port_id);
    167                 flags = port->ndev->flags;
    168         }
    169 
    170         if (flags & IFF_MULTICAST)
    171                 reg_mcast_mask = port_mask;
    172 
    173         if (untag)
    174                 untag_mask = port_mask;
    175 
    176         ret = cpsw_ale_vlan_add_modify(cpsw->ale, vid, port_mask, untag_mask,
    177                                        reg_mcast_mask, unreg_mcast_mask);
    178         if (ret) {
                    ^^^
ret is zero.

    179                 netdev_err(port->ndev, "Unable to add vlan\n");
    180                 return ret;
    181         }
    182 
    183         if (cpu_port)
    184                 cpsw_ale_add_ucast(cpsw->ale, port->slave.mac_addr,
    185                                    HOST_PORT_NUM, ALE_VLAN | ALE_SECURE, vid);
    186         if (!pvid)
--> 187                 return ret;

I think returning zero might have been intentional here, but it would
be better to do an explicit "return 0;"

    188 
    189         am65_cpsw_set_pvid(port, vid, 0, 0);
    190 
    191         netdev_dbg(port->ndev, "VID add: %s: vid:%u ports:%X\n",
    192                    port->ndev->name, vid, port_mask);
    193 
    194         return ret;

Same here too, I suppose, although Smatch doesn't care about this.

    195 }

regards,
dan carpenter
