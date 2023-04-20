Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4F8C77B72
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 08:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbjDTI12 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 04:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233880AbjDTI11 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 04:27:27 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627C13A9B
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 01:27:25 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f17b967bfbso12859335e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681979244; x=1684571244;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oJvG7bYWn+8aug7ZgdAASHVZFthA+onSEdwypKEW3k=;
        b=Y0JpUpdxUHVu93dMbeuH4vlS9lZMXy5S4MuqFu9qox1kn2kjvmgLjrPpmy6JNjIe7F
         67n+SvfFjZaXpupXMQtXChq+qOTIaesiRQxbnb3C18yw4HGxPZNXZLrmc6YazbnR3GNd
         fSdmo43Ox1UJOFR6CDDrowYdmqL+whUi623mFzeb76nvx+QGmDC4otQEMnEftF6pjuOR
         BrXiFnafcKrvavOeldD+ooAn7I0NX99iMCFBeKXm2O8VoxEU7yaJnL+ZLOED69k8ywec
         j+RqAeVNkU2B7qVff8ryCoYrtS5WinO7dMBdpNIbeZhJnA/GCPAMo4flA196ba6VSHUp
         7QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681979244; x=1684571244;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5oJvG7bYWn+8aug7ZgdAASHVZFthA+onSEdwypKEW3k=;
        b=hZ/rk/B44M4PGRd+IEiCh51m1fnvvMz/SZ22F1Egllt1y22ShhowF6fBUNIPDfinhg
         xHFbr7eIoVM9S87NcpgyA1SCLkLDJpwmk4zOXyPqsqvaXK2UD++is9NHUhrQyBHDEleC
         bHGAv7GHEEkUJP6AzGaHyaJIzBrAFwyhxPngNQeK/7qYtGy/IUwrgOei10///EzDYxHj
         cI029pAdtp71DqqpjzxCZYKpsODIsPAmlbeZkDyA6GzwZ/emqD3dtBh/Ys8ydqxm3C/6
         NRDuOMxbKvQfbzZsyV+UXSfUbjUHVMdoARTu7q9xsMl6fjf3E2o76iMtqIZTycifhUn4
         LHNg==
X-Gm-Message-State: AAQBX9dvoKDmw8C7fHAWXXq/3hTfhXn8QWQQijmlIgD/ca/NElPxAR3e
        ROnHrP48cfHk+JfqFHFqumRCjXQntQZsi8BefC9RrpCY
X-Google-Smtp-Source: AKy350Ys51NSXRRxpuJzebuaZqRKIpcomXuUSQjdciLt2dFubn3V61xZRtNA/H2Fw9SVkuYhDvTXyA==
X-Received: by 2002:adf:fc0b:0:b0:2f0:2d96:1c5a with SMTP id i11-20020adffc0b000000b002f02d961c5amr714472wrr.32.1681979243844;
        Thu, 20 Apr 2023 01:27:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t15-20020adfe44f000000b002f00793bd7asm1328903wrm.27.2023.04.20.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 01:27:23 -0700 (PDT)
Date:   Thu, 20 Apr 2023 11:27:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     grygorii.strashko@ti.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ethernet: ti: am65-cpsw-nuss: restore vlan
 configuration while down/up
Message-ID: <b528a774-4a46-4d08-85d3-fe47de129f9b@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Grygorii Strashko,

The patch 7bcffde02152: "net: ethernet: ti: am65-cpsw-nuss: restore
vlan configuration while down/up" from Jun 26, 2020, leads to the
following Smatch static checker warning:

	drivers/net/ethernet/ti/am65-cpsw-nuss.c:188 am65_cpsw_nuss_ndo_slave_add_vid()
	warn: duplicate check 'vid' (previous on line 180)

drivers/net/ethernet/ti/am65-cpsw-nuss.c
    169 static int am65_cpsw_nuss_ndo_slave_add_vid(struct net_device *ndev,
    170                                             __be16 proto, u16 vid)
    171 {
    172         struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
    173         struct am65_cpsw_port *port = am65_ndev_to_port(ndev);
    174         u32 port_mask, unreg_mcast = 0;
    175         int ret;
    176 
    177         if (!common->is_emac_mode)
    178                 return 0;
    179 
    180         if (!netif_running(ndev) || !vid)
                                            ^^^^
If "vid" is zero then we return here.

    181                 return 0;
    182 
    183         ret = pm_runtime_resume_and_get(common->dev);
    184         if (ret < 0)
    185                 return ret;
    186 
    187         port_mask = BIT(port->port_id) | ALE_PORT_HOST;
--> 188         if (!vid)
    189                 unreg_mcast = port_mask;
    190         dev_info(common->dev, "Adding vlan %d to vlan filter\n", vid);
    191         ret = cpsw_ale_vlan_add_modify(common->ale, vid, port_mask,
    192                                        unreg_mcast, port_mask, 0);

So we chould just remove the unreg_mcast variable and call?:

	ret = cpsw_ale_vlan_add_modify(common->ale, vid, port_mask,
				       port_mask, port_mask, 0);

    193 
    194         pm_runtime_put(common->dev);
    195         return ret;
    196 }

regards,
dan carpenter
