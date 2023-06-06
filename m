Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C480C77B73
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:18:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236156AbjFFISu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236081AbjFFISr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:18:47 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684CFE49
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:18:45 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30af20f5f67so5743556f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039524; x=1688631524;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r1ogFYOCyCFggyVGMppR34+8UlfrkJd0gNAyYus2c7g=;
        b=GaG1+A/1fqB4K0sbQ53AXMdJkSekcvvdxU93FR0Sl4ZGcV9BC4YC12z984o5xqeIg5
         wph71hndT/zbGpnrzvhxtJF+EGGdYGwnJ2xPdlRWVAs/rYBKj+97rqjEhYmGkQO9MKJk
         seJY5gu0yPutMel+ZkqF+QmP4JdVFKcwrLdRkn+CipWJpfwAP9siotUlyUwgSJaXnZoA
         x6ut+oNptwIz5G6D77TRLkYrrly8eFrnTyzTrdGVTD3u3XfH9U5lwRCzDzvbXcGxkk5P
         5KqHgpiSgdUJPCRWP5NaGPOO134PrNqn//fEebmipori8S8WYYue8qHd2zUpbw3i4Oa+
         vzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039524; x=1688631524;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r1ogFYOCyCFggyVGMppR34+8UlfrkJd0gNAyYus2c7g=;
        b=iAALw0aUqtG06Gw8Twj9/hKWf8JH3SLvj1Om6XFzCk/ZB33PnO9OEcHJ3nru++aGqC
         8pmJcRT2sqWwksb7fuy3rDsZWNN9Ir+UgU4bIlmd1r/lCNz+ih23+jRBTJ2b1ptzoWfG
         cxp0Uy6e+S7Bk24DqmQqMzQaappcgjcYDKOk7h99lxlTSD5py9FGtrJlbzN99sg25UVo
         Zud7WnRJBwY4YFmSdk6iTqaZvmRTCxOsGFKciy4bOCnQXalvrHT9uYt01DLFb7qHcI1y
         20zqceeL4ShgRUX7rFIUjIdfQLeU5QeXtU1AjXCuau3iX49ahV4c2fPjZDxwBcmUUEHt
         MGQw==
X-Gm-Message-State: AC+VfDyl6agXIS6OAI2IZqxoVzZZYLzZnp5Ck5AT+m2hn+GP+lNRMdp0
        EEk23MJzFc0GNbzJ1HcVn/sErA==
X-Google-Smtp-Source: ACHHUZ4co9T62EMNnO0BuoPuXsJlGg091sebkcpWwQ08ejOZgq+8Q/rhKN06jYlX3r6Sqsuq8KBhaA==
X-Received: by 2002:a5d:40cd:0:b0:30a:eac4:26a0 with SMTP id b13-20020a5d40cd000000b0030aeac426a0mr1150739wrq.18.1686039524012;
        Tue, 06 Jun 2023 01:18:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m25-20020a7bca59000000b003f7e62d38d4sm4263267wml.25.2023.06.06.01.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:18:42 -0700 (PDT)
From:   Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Tue, 6 Jun 2023 11:15:46 +0300
To:     Michal Simek <michal.simek@amd.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clocksource/drivers/timer-cadence-ttc: fix a signedness bug
 in probe()
Message-ID: <ZH7rMgjh+z3TUKGu@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Make the "irq" variable signed so the error handling can work.

Fixes: e932900a3279 ("arm: zynq: Use standard timer binding")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Untested.  Presumably if probe fails the system
is unbootable so I didn't bother looking at the resource leaks.

drivers/clocksource/timer-cadence-ttc.c:377 ttc_setup_clocksource() warn: 'clk' from clk_prepare_enable() not released on lines: 370.
drivers/clocksource/timer-cadence-ttc.c:466 ttc_setup_clockevent() warn: 'clk' from clk_prepare_enable() not released on lines: 466.
drivers/clocksource/timer-cadence-ttc.c:529 ttc_timer_probe() warn: 'irq' from irq_of_parse_and_map() not released on lines: 508,516,521,525.
drivers/clocksource/timer-cadence-ttc.c:529 ttc_timer_probe() warn: 'timer_baseaddr' from of_iomap() not released on lines: 498,508,516,521,525.
---
 drivers/clocksource/timer-cadence-ttc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-cadence-ttc.c b/drivers/clocksource/timer-cadence-ttc.c
index 4efd0cf3b602d..8ba1f5c2d7992 100644
--- a/drivers/clocksource/timer-cadence-ttc.c
+++ b/drivers/clocksource/timer-cadence-ttc.c
@@ -468,13 +468,13 @@ static int __init ttc_setup_clockevent(struct clk *clk,
 
 static int __init ttc_timer_probe(struct platform_device *pdev)
 {
-	unsigned int irq;
 	void __iomem *timer_baseaddr;
 	struct clk *clk_cs, *clk_ce;
 	static int initialized;
 	int clksel, ret;
 	u32 timer_width = 16;
 	struct device_node *timer = pdev->dev.of_node;
+	int irq;
 
 	if (initialized)
 		return 0;
-- 
2.30.2

