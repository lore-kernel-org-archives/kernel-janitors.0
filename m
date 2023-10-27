Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F1BC25B47
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Oct 2023 12:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345825AbjJ0MSh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Oct 2023 08:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345802AbjJ0MSf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Oct 2023 08:18:35 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8D61B9
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 05:18:33 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c5056059e0so30073091fa.3
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698409112; x=1699013912; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpUWJTFpNjZIZmlXASTkiTbyMnR1l2jQNO9OKE0q/GM=;
        b=pE6+grLQaaewtp632izCFvBX+dXcwDo7OtL2ItcZZjGSGNb7RvQGXf6/e3wMOHLMVK
         po5ElzvZshbpk9gZJAmOFowWHMSi2s28Txvp4W4kC/zBQsA5SsPSdTC4eUOJDr01yXUA
         qWUO2dWVXSAZEOLL5jp82weY094cv0HgYO3itkcBHt0SapryzPlzaYNG0rx97qwA7o4U
         Pi+E1xR/1m6ZtXLCb0NqsN805AZ7UjXP64CULje2+KJhArmL5qH4/v4rR6+b7yZ4EiOD
         VbS2HMi55rGnSjpWmv9i208mF7lbJJIwwDJfjIzqTb9GlpTWxINRuHxl8P35Qr0T2oM4
         zw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698409112; x=1699013912;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpUWJTFpNjZIZmlXASTkiTbyMnR1l2jQNO9OKE0q/GM=;
        b=j2WJrwM1WKlVbwpIBzdKqryGaA4uDpmBXYfetZxCS0xDEJiV9QkUTWCB1U7bFeVnhf
         kY9ysTP2hX8Y60OfUowY4D/uILnJWK6QQF3yU4lSIBDXR334AA/Vb5Myj1/QcJQcTBlh
         qw2g6W/OEDgEGMRW+Cq3RK5fmFPHMr8+AgWFnFPMzCH3Laalc3Gkzm7ov0GuTgybWQ74
         d0AVdEHPIbR0FGR63ViU4pG7Q24JtjS4EGErwyZYQjtWLbWnCEHhWnjlWguQ2tZ/yveZ
         YRz4n+z2IsSPlVgrz2J962A0HxOH6dMiUP1f0wzTP7xjb6iYF8YlR60T+akFceMmIZdU
         BNAQ==
X-Gm-Message-State: AOJu0YyjmJvQiVPoNZ7II5Rova7gSfq8JyWKCMX9OlD161dz/cGfEsdv
        C/K+LqK6eanSWSgahLgTZWzjYg==
X-Google-Smtp-Source: AGHT+IHImjFD7lLH1TbPG7jI/g8XfCWe653u0TtNhH0Hv6ccJVrEwmTebgogehWeNAQTLInLhq/J5w==
X-Received: by 2002:a2e:8e67:0:b0:2bd:d34:d98a with SMTP id t7-20020a2e8e67000000b002bd0d34d98amr1702848ljk.44.1698409111745;
        Fri, 27 Oct 2023 05:18:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y20-20020a1c4b14000000b0040588d85b3asm4867476wma.15.2023.10.27.05.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:18:31 -0700 (PDT)
Date:   Fri, 27 Oct 2023 15:18:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Nick Dyer <nick@shmanahar.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Christopher Heiny <cheiny@synaptics.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: synaptics-rmi4 - fix use after free in
 rmi_unregister_function()
Message-ID: <706efd36-7561-42f3-adfa-dd1d0bd4f5a1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The put_device() calls rmi_release_function() which frees "fn" so the
dereference on the next line "fn->num_of_irqs" is a use after free.
Move the put_device() to the end to fix this.

Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to irq_domain")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/input/rmi4/rmi_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index f2e093b0b998..1b45b1d3077d 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -277,11 +277,11 @@ void rmi_unregister_function(struct rmi_function *fn)
 
 	device_del(&fn->dev);
 	of_node_put(fn->dev.of_node);
-	put_device(&fn->dev);
 
 	for (i = 0; i < fn->num_of_irqs; i++)
 		irq_dispose_mapping(fn->irq[i]);
 
+	put_device(&fn->dev);
 }
 
 /**
-- 
2.42.0

