Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4FDC7EE21
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 May 2023 10:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjEDKry (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 May 2023 06:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjEDKrw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 May 2023 06:47:52 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBDF5248
        for <kernel-janitors@vger.kernel.org>; Thu,  4 May 2023 03:47:49 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-2f9b9aa9d75so191918f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 May 2023 03:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683197267; x=1685789267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FffhIOzLqL3FMSK6eJLE/93VuibM3yF1mff+K7WW1t8=;
        b=gSd0NtZwNAmJ1WH35Qukhp58ZcpwufKxvyGDCLqhvCYxiy8c0xbE5Z4FfphRe0wVV9
         QT0FVd5CSffsJ5PdLVc+UMJaBCsCvRboWGxDE9stlT/hT6i4mlGkmkiCmS2KwYXlggeH
         PAbCM6UkzHtUw3lWGqcAFvThO0OEuAO/Vd9b+3ybE5Gul4pAPsdsp6f3nePDbcSR59hb
         JY92RwR0GRQzhQQsfsVmWGKc3ut+ROW9snVSQty66dM9QfklvH/elDbEMv09N/PM73pF
         u9/C3UAnrbzS4XQDY3UzdsylJwVnpYSgyB/03cptcHf0nBWbZyfHwvnH5M+cyjyUep+S
         ElWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683197267; x=1685789267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FffhIOzLqL3FMSK6eJLE/93VuibM3yF1mff+K7WW1t8=;
        b=A+TdJz2tNkuzHr7KcUyUJeoAIZe97YZKZCHuib2Zm9sJjee2DC2Tja8vw8852iHXpe
         eBSkuhY/bK0kXsfYQCYu7lNtoxrqXZrkFCPsHUROQWaW2wCvyPNI+XO2W6o4RB+iAsni
         Kdqbir1Zh1a1LEB6uxN9VGZUZlepTThn060rHb0D4IxSVl0QV7qHHx9DLXr5oqb3PcXJ
         PAFp6vXSpSxkSukNzFY2JlV167HKP6+14LDL2jhMjSUWL/0la5TNuvLMjSjtdDPVlNgC
         +VELdBKAsIRh6+ZrXKiDluylIju9yEbc+XbeEX6bfUgjP3+BoLtzXRfRAuwEVu1BlLX/
         ufVA==
X-Gm-Message-State: AC+VfDxAy511hhesqvjRB+/UWDutpQ6gttzJj8G5kkxck3K9DczpoaG3
        351Vplb4FDKS9Z7nIEqF1YO69Q==
X-Google-Smtp-Source: ACHHUZ7DOJzHTS4uhnkB8CK+JY2ET2dNShv4FJCFB+fpWruCMnUZYo5A92pALiHcrobQkjFu3yAgTA==
X-Received: by 2002:a5d:530a:0:b0:306:4125:8bc0 with SMTP id e10-20020a5d530a000000b0030641258bc0mr2239905wrv.29.1683197267662;
        Thu, 04 May 2023 03:47:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p18-20020a5d4e12000000b0030647d1f34bsm2720305wrt.1.2023.05.04.03.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 03:47:45 -0700 (PDT)
Date:   Thu, 4 May 2023 13:47:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     shannon.nelson@amd.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] pds_core: add devcmd device interfaces
Message-ID: <209a09f6-5ec6-40c7-a5ec-6260d8f54d25@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Shannon Nelson,

The patch 523847df1b37: "pds_core: add devcmd device interfaces" from
Apr 19, 2023, leads to the following Smatch static checker warning:

	drivers/net/ethernet/amd/pds_core/main.c:290 pdsc_init_pf()
	error: double unlocked '&pdsc->config_lock' (orig line 253)

drivers/net/ethernet/amd/pds_core/main.c
    212 static int pdsc_init_pf(struct pdsc *pdsc)
    213 {
    214         struct devlink_health_reporter *hr;
    215         char wq_name[PDSC_WQ_NAME_LEN];
    216         struct devlink *dl;
    217         int err;
    218 
    219         pcie_print_link_status(pdsc->pdev);
    220 
    221         err = pci_request_regions(pdsc->pdev, PDS_CORE_DRV_NAME);
    222         if (err) {
    223                 dev_err(pdsc->dev, "Cannot request PCI regions: %pe\n",
    224                         ERR_PTR(err));
    225                 return err;
    226         }
    227 
    228         err = pdsc_map_bars(pdsc);
    229         if (err)
    230                 goto err_out_release_regions;
    231 
    232         /* General workqueue and timer, but don't start timer yet */
    233         snprintf(wq_name, sizeof(wq_name), "%s.%d", PDS_CORE_DRV_NAME, pdsc->uid);
    234         pdsc->wq = create_singlethread_workqueue(wq_name);
    235         INIT_WORK(&pdsc->health_work, pdsc_health_thread);
    236         timer_setup(&pdsc->wdtimer, pdsc_wdtimer_cb, 0);
    237         pdsc->wdtimer_period = PDSC_WATCHDOG_SECS * HZ;
    238 
    239         mutex_init(&pdsc->devcmd_lock);
    240         mutex_init(&pdsc->config_lock);
    241         spin_lock_init(&pdsc->adminq_lock);
    242 
    243         mutex_lock(&pdsc->config_lock);
    244         set_bit(PDSC_S_FW_DEAD, &pdsc->state);
    245 
    246         err = pdsc_setup(pdsc, PDSC_SETUP_INIT);
    247         if (err)
    248                 goto err_out_unmap_bars;
    249         err = pdsc_start(pdsc);
    250         if (err)
    251                 goto err_out_teardown;
    252 
    253         mutex_unlock(&pdsc->config_lock);

unlock

    254 
    255         dl = priv_to_devlink(pdsc);
    256         devl_lock(dl);
    257         err = devl_params_register(dl, pdsc_dl_params,
    258                                    ARRAY_SIZE(pdsc_dl_params));
    259         if (err) {
    260                 dev_warn(pdsc->dev, "Failed to register devlink params: %pe\n",
    261                          ERR_PTR(err));
    262                 goto err_out_unlock_dl;

goto

    263         }
    264 
    265         hr = devl_health_reporter_create(dl, &pdsc_fw_reporter_ops, 0, pdsc);
    266         if (IS_ERR(hr)) {
    267                 dev_warn(pdsc->dev, "Failed to create fw reporter: %pe\n", hr);
    268                 err = PTR_ERR(hr);
    269                 goto err_out_unreg_params;
    270         }
    271         pdsc->fw_reporter = hr;
    272 
    273         devl_register(dl);
    274         devl_unlock(dl);
    275 
    276         /* Lastly, start the health check timer */
    277         mod_timer(&pdsc->wdtimer, round_jiffies(jiffies + pdsc->wdtimer_period));
    278 
    279         return 0;
    280 
    281 err_out_unreg_params:
    282         devl_params_unregister(dl, pdsc_dl_params,
    283                                ARRAY_SIZE(pdsc_dl_params));
    284 err_out_unlock_dl:
    285         devl_unlock(dl);
    286         pdsc_stop(pdsc);
    287 err_out_teardown:
    288         pdsc_teardown(pdsc, PDSC_TEARDOWN_REMOVING);
    289 err_out_unmap_bars:
--> 290         mutex_unlock(&pdsc->config_lock);

double unlock.

    291         del_timer_sync(&pdsc->wdtimer);
    292         if (pdsc->wq)
    293                 destroy_workqueue(pdsc->wq);
    294         mutex_destroy(&pdsc->config_lock);
    295         mutex_destroy(&pdsc->devcmd_lock);
    296         pci_free_irq_vectors(pdsc->pdev);
    297         pdsc_unmap_bars(pdsc);
    298 err_out_release_regions:
    299         pci_release_regions(pdsc->pdev);
    300 
    301         return err;
    302 }

regards,
dan carpenter
