Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10E9C7EE26
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 07:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232524AbjEVHvY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 03:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232585AbjEVHvC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 03:51:02 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6EA1FDB
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 00:49:17 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f60410106cso5399805e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684741697; x=1687333697;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxCjNxus8tnjJReDiipZLMxj1QZwVVeWD4jhS9X7t7A=;
        b=ymJrz7kfcXpOOlpTscx0UtyxGdinDrxNwoWkPkT9pLgEpVgEOoUDud5Soy2qCpFPvB
         aIYzb+4G5zX53U1HvuQ+ZhpVJAFiDHaYu32dYrLZuZqc/7Qeg8BNXVJYZXMBh2YNahPE
         UAB4nwwIUEzjsfAlLfGllu+Hb0z8yABih1iXb7e1HokGnrj5M2Nsl/wz325iCMO7nM6P
         Yn1ZN/3OcpQhSKv9vTqTDlI+B+cKlhH3runwKg4L5RxUeqBEbURovHSlcGVLvQx8XJMp
         mmPB8xAvWLP4iRhTWln4xTl+w2VRD8jI7HR3FXp3FHKnd6cerHVCdfKM5ypsQD7tymtv
         rNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684741697; x=1687333697;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxCjNxus8tnjJReDiipZLMxj1QZwVVeWD4jhS9X7t7A=;
        b=NSUeSP0/BkLaCURESMYsmWvQ8hGRY749QHNk+wVy57i94PpCYwZoKwz4vIppOqLZo3
         GeCKlQuSN6/KhM4lvAWpMu9Wmc338uTpXht2F1jNSUX3n93U8haHgPPDu0nBJs4WtulV
         VDnGz4ldWzzsWse02MYz2Ib160EJr5u3XYiRWLcSt0wamBvaVSe7Jve4qsFNHojIqf4/
         KhfbZGDx1OzEA1m/PwM0aVhll7w4l81gomASziFzaDvOZSZpfrZ1jpzKh4fhOmu7DdNA
         /PCSca8WvJakJQ1P5Ctch80evfRHVASc5NqaTEF65z54FnkEjcGwZn9iJYzL5fq40byT
         BzAQ==
X-Gm-Message-State: AC+VfDzigSIM58lCdrogazg7h+wajBmw20LQBLohHbYRGLtMKjhK+uIU
        hm4/ozg1yKYVePjQYqOLiEA1kQ==
X-Google-Smtp-Source: ACHHUZ7cFurERYcei8OxV43QzgQaXbGtEMksPp59wutARMVqjbHYmlhh2SrlLVF0ZizHkEip9DiG6w==
X-Received: by 2002:a7b:ce15:0:b0:3f5:ff24:27de with SMTP id m21-20020a7bce15000000b003f5ff2427demr3641960wmc.32.1684741697389;
        Mon, 22 May 2023 00:48:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003f506e6ff83sm7424492wmd.22.2023.05.22.00.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:48:15 -0700 (PDT)
Date:   Mon, 22 May 2023 10:48:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     naveenm@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Add PTP PPS Errata workaround on CN10K
 silicon
Message-ID: <fad5f011-8fd4-4013-938d-b4d6d67dab26@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Naveen Mamindlapalli,

The patch 2ef4e45d99b1: "octeontx2-af: Add PTP PPS Errata workaround
on CN10K silicon" from Sep 10, 2022, leads to the following Smatch
static checker warning:

	drivers/net/ethernet/marvell/octeontx2/af/ptp.c:455 ptp_remove()
	warn: variable dereferenced before IS_ERR check 'ptp' (see line 452)

drivers/net/ethernet/marvell/octeontx2/af/ptp.c
    447 static void ptp_remove(struct pci_dev *pdev)
    448 {
    449         struct ptp *ptp = pci_get_drvdata(pdev);
    450         u64 clock_cfg;
    451 
    452         if (cn10k_ptp_errata(ptp) && hrtimer_active(&ptp->hrtimer))
                                     ^^^                    ^^^^

    453                 hrtimer_cancel(&ptp->hrtimer);
                                       ^^^^
Dereferences.

    454 
--> 455         if (IS_ERR_OR_NULL(ptp))
                                   ^^^
Checked too late.  Hopefully this check can be removed.

    456                 return;
    457 
    458         /* Disable PTP clock */
    459         clock_cfg = readq(ptp->reg_base + PTP_CLOCK_CFG);
    460         clock_cfg &= ~PTP_CLOCK_CFG_PTP_EN;
    461         writeq(clock_cfg, ptp->reg_base + PTP_CLOCK_CFG);
    462 }

regards,
dan carpenter
