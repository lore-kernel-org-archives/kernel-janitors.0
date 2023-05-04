Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D61DC7EE21
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 10:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjEDKyE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 06:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjEDKyD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 06:54:03 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D5B49F7
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 03:54:02 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2f939bea9ebso252085f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 May 2023 03:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683197641; x=1685789641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mak+/8tgM9Xe43QF0nYG9nprPJsIfRVjt1FrrJwmdlk=;
        b=RlNErPiKKcMDkTbpO4JaG2wnYArrg+tuU/Ka9mdSgk+28sBApqk/2xIpimVPk79Zod
         XOH5JhD8EMp7g4iLyxa+NHWHOhzAaTQnO8mzFujTXrxbEeZsdjjHWsmsZt2rgm/yusth
         DYpkZdUTytYKIZS5rLHW3PQftngkw8mIatZUxLEhYLYs3/8NHMwncOQ64GFJsFHG6/YL
         HqMUQZIIWkDPA+P+i0RR671cfK+3mLAnMNFY2dWb4flDKp8e0DiyYqr29iuiuCwYuK5h
         zudBLkm4DnFHaWRNYpCLkURaRQJUqvoa2OwFo4QwWeUNFVJnGmL/9udqUXOLJmquV9Dm
         uQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683197641; x=1685789641;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mak+/8tgM9Xe43QF0nYG9nprPJsIfRVjt1FrrJwmdlk=;
        b=O3d4Iz/GzxELhx5moLJenfjouODQ6sjl0cPYzcwVOUNhC+9SFPJDkRUYi/Fwx/SzmY
         5zo8/wNRXKF/NnMe5VhLzvD7Cgf03g5zO8JgzGFiC4exXag9KO8bq805Yeq+nEriP4p5
         lZiIvl+SPnWkN3G5jznpHyOSCEtsaTt2Hs4kbkHmafD0wn6DDjR5vJqc6uh2lZKhlDZb
         OhM8UL65p84MeOD1J3z9XCCl1u/8suq2QwJDuBvhOCDTgozqsB/phmSYVnCYGIAi+8cP
         G/Zk8EHRxCsrCCD6zarutIk2YZe8JsgNEQ1o7Tiq5DZeih2M9EZb3quE0I01c1EHOvRG
         X1dA==
X-Gm-Message-State: AC+VfDzEUGk1aS2eUyO+JALupcTL6uZla8jzHZ8D5S12ZAcp52FJKXiq
        IgAmVipjhUMu13P0ESy9p1xNaNHTyFYyc0YuXTk=
X-Google-Smtp-Source: ACHHUZ6uOHiq3Q0/ZO6nIqI2wnd8IeOHXdKBaFcBaTE2/5EIEFQKmEYHsy42ufRsnDJ6Be1FWaujOw==
X-Received: by 2002:adf:f60d:0:b0:304:9fb0:6a8 with SMTP id t13-20020adff60d000000b003049fb006a8mr2086930wrp.18.1683197640975;
        Thu, 04 May 2023 03:54:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j10-20020adfe50a000000b0030631f199f9sm9299272wrm.34.2023.05.04.03.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 03:53:58 -0700 (PDT)
Date:   Thu, 4 May 2023 13:53:53 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     samin.guo@starfivetech.com
Cc:     kernel-janitors@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [bug report] net: stmmac: Add glue layer for StarFive JH7110 SoC
Message-ID: <e16d3d7b-3789-4951-9cd0-06693c7c6293@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Samin Guo,

The patch 4bd3bb7b4526: "net: stmmac: Add glue layer for StarFive
JH7110 SoC" from Apr 17, 2023, leads to the following Smatch static
checker warning:

drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c:148 starfive_dwmac_probe()
warn: inconsistent refcounting 'plat_dat->mdio_node->kobj.kref.refcount.refs.counter':
  inc on: 113,117,122,140
  dec on: 145

drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
    93 static int starfive_dwmac_probe(struct platform_device *pdev)
    94 {
    95         struct plat_stmmacenet_data *plat_dat;
    96         struct stmmac_resources stmmac_res;
    97         struct starfive_dwmac *dwmac;
    98         struct clk *clk_gtx;
    99         int err;
    100 
    101         err = stmmac_get_platform_resources(pdev, &stmmac_res);
    102         if (err)
    103                 return dev_err_probe(&pdev->dev, err,
    104                                      "failed to get resources\n");
    105 
    106         plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
    107         if (IS_ERR(plat_dat))
    108                 return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat),
    109                                      "dt configuration failed\n");

All the error paths after stmmac_probe_config_dt() succeeds should call
stmmac_remove_config_dt() but only the last one does.

    110 
    111         dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
    112         if (!dwmac)
    113                 return -ENOMEM;
    114 
    115         dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
    116         if (IS_ERR(dwmac->clk_tx))
    117                 return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->clk_tx),
    118                                      "error getting tx clock\n");
    119 
    120         clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
    121         if (IS_ERR(clk_gtx))
    122                 return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
    123                                      "error getting gtx clock\n");
    124 
    125         /* Generally, the rgmii_tx clock is provided by the internal clock,
    126          * which needs to match the corresponding clock frequency according
    127          * to different speeds. If the rgmii_tx clock is provided by the
    128          * external rgmii_rxin, there is no need to configure the clock
    129          * internally, because rgmii_rxin will be adaptively adjusted.
    130          */
    131         if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
    132                 plat_dat->fix_mac_speed = starfive_dwmac_fix_mac_speed;
    133 
    134         dwmac->dev = &pdev->dev;
    135         plat_dat->bsp_priv = dwmac;
    136         plat_dat->dma_cfg->dche = true;
    137 
    138         err = starfive_dwmac_set_mode(plat_dat);
    139         if (err)
    140                 return err;
    141 
    142         err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
    143         if (err) {
    144                 stmmac_remove_config_dt(pdev, plat_dat);
    145                 return err;
    146         }
    147 
--> 148         return 0;
    149 }

regards,
dan carpenter
