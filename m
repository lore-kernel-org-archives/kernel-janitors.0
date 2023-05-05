Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322A4C77B7D
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 May 2023 08:07:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbjEEIHf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 May 2023 04:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjEEIHe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 04:07:34 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E914810F3
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 01:07:32 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f19b9d5358so14449635e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 05 May 2023 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683274051; x=1685866051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8hKMUg8kY6OgOJ0A/p1H2ALtJ2wJO7O/AuoZxwxYfCA=;
        b=PzJywIow4UKwbTK4d4AgvE1NR61+yyyexpRfj+sB+TesvStRQ9QfPF5ujoeHFGwBPz
         /glCzUbkPSGU6o3d6jaHvCnXdPaj3RZORRo8TsEBGft4hbXAR9vJdsMv2U+//iZVaL8J
         gEViC3Z1rzHirCgr58u/9OF/18V8kjMNGTUK5sBbMltdVGfCMYOX9HgrR4ydp1cZhCtr
         cemFPxNCQ7C+kKyHIHaHnz4pBZ7rzs/OkZVshg1f3iTpVwMjmJ+nHBQtQomCxjTVbVVX
         Ir6eSaDsm/SJ/K12120Sab0z/8SPUhD06Su+cx6txCTBs3KuuxyEbjHJ3G+s/G5gyTn4
         VArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683274051; x=1685866051;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8hKMUg8kY6OgOJ0A/p1H2ALtJ2wJO7O/AuoZxwxYfCA=;
        b=HkuowvTFAKMMRmaAG0D0L+3e9WzKkw6uxkv5/vfcUxqb970oRExaaRhUxbvnLFjiED
         QO8kss2cqtqpBVfrb8oPz3VatdLLU0FrOItnaQErz0G1qW9e+LbnnFLXhBgsAYx8zbtV
         +/MQYE97bLVFOrSuI71gqexo7uVDJvL6jf5qU2ZGcZiB+mJoWdYtJeXpYT1tx67Xk1v3
         9Owm1z66C1Fnl4vpkxNtXVx7ze4thXAziZUUCrOruOVgOaiA5C9G8eSuVOdQUMssuz38
         9PwZE9zOrqulvNttjoDVvfAkQBH36g6D1mm/CQFf+cz/3V069p7n6y/TP6q7lpBKDtBZ
         zsrw==
X-Gm-Message-State: AC+VfDxrSkZwYT5qZSva1TRoojVUonNvMNJ0z32pvkRyQ+O8wlH9wof3
        JerbfZL1BGN6575RLi4g7Vzl8A==
X-Google-Smtp-Source: ACHHUZ6M+Dy9gFlV/bqvpt4/bPlP+RTeLl1mzxJ2kLJ7V5vhBPI5W6oofUjwXreM5tfFeFADUYbrMA==
X-Received: by 2002:a1c:7412:0:b0:3f3:fff7:1d96 with SMTP id p18-20020a1c7412000000b003f3fff71d96mr402357wmc.29.1683274051238;
        Fri, 05 May 2023 01:07:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020a1c750b000000b003f1712b1402sm7164765wmc.30.2023.05.05.01.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 01:07:29 -0700 (PDT)
Date:   Fri, 5 May 2023 11:07:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     sbhatta@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-pf: Disable packet I/O for graceful exit
Message-ID: <3a065906-24a5-417b-b59f-fa35596bdf16@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Subbaraya Sundeep,

The patch c926252205c4: "octeontx2-pf: Disable packet I/O for
graceful exit" from May 3, 2023, leads to the following Smatch static
checker warning:

	drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c:1843 otx2_open()
	warn: was negative '-EIO' intended?

drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
    1833         /* Install DMAC Filters */
    1834         if (pf->flags & OTX2_FLAG_DMACFLTR_SUPPORT)
    1835                 otx2_dmacflt_reinstall_flows(pf);
    1836 
    1837         err = otx2_rxtx_enable(pf, true);
    1838         /* If a mbox communication error happens at this point then interface
    1839          * will end up in a state such that it is in down state but hardware
    1840          * mcam entries are enabled to receive the packets. Hence disable the
    1841          * packet I/O.
    1842          */
--> 1843         if (err == EIO)
                            ^^^
This should be negative -EIO?  I think it's the return from the
MBOX_MESSAGES functions which return negatives.

    1844                 goto err_disable_rxtx;
    1845         else if (err)
    1846                 goto err_tx_stop_queues;
    1847 

regards,
dan carpenter
