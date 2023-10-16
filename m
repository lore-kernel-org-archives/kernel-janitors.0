Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8FBCDB482
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Oct 2023 11:20:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbjJPLUB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Oct 2023 07:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbjJPLUA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Oct 2023 07:20:00 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28082B4
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Oct 2023 04:19:58 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-405505b07dfso33475565e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 16 Oct 2023 04:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697455196; x=1698059996; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8KsGpPOOoWej+EABAJ7O0MnezxzJN0p6iOYP9JLBdQ=;
        b=bsEAkxWY0dzw4kb9IARJlAMASvaxvEHrkDR1Cv7mzOkiEEKWZjplB5nQUpTsjP5tLo
         D8wTUqty9LpDUOXUNPX3iT4cZ2uMT0Lq4LDSM5Ll4e79Cg7eGCLQPNCgtdglsyxFqAAk
         Qn2Sdx+IIJBF8LsBEk5ltng9JGnt8XAiYLqa16SUOTSaYwX/4tf95RNM1USnuaz7CeUw
         ENfWZOH11Uu6S9nGST6hoCE82Pc29C3QdlalUd9s2YbHzhIn9IAO2qUY9eBQL+wdSi7C
         GjykIu4ItNhuHfnRPiC7qm4cX9oWlJ/g0igZHj10JaGnUQ3a+2E5EzZbEFjwQkWfbNeQ
         Mu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697455196; x=1698059996;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A8KsGpPOOoWej+EABAJ7O0MnezxzJN0p6iOYP9JLBdQ=;
        b=gDPZfbqTaAmszGoolHRkR5CPbQZsHibV/DAEwrAOnP6ASRJGcgiHFDKtkJx6o+JEZZ
         aNlInG08Y/ruLJWc9d/gq+anLtmFIEmoVScpCZT0qgsx2TB2k6hu6kXb+X2ecRIIofBh
         N7lt7hsPt/p/UnPeBf/bznKfr7zMFgljK85HmT7vsUwiDv9fjOFAjX0JPMiLzQnvslpU
         rxEeVGG75wB1mG+FzoPHGqAQvdjulKNWXC+m/6M30BQLnrJ3QDbI99G0E/uf92M/ndQx
         Lbcw88VcqyW0gADdj+H8rooOrOMgjMOZv2PZvcNrNwPg13F0xesMwuaY7OWF5She3mm9
         cJBw==
X-Gm-Message-State: AOJu0YzC9C+EJcOLDeOzCtttu3tjccflQ7KoRXutgUjWkAUGQeEfCt6Y
        kUrHQB9a2MAz+ToCMV43T3FO4Q==
X-Google-Smtp-Source: AGHT+IEwsg3DmJum5HD3wiLEYwzwIlJS3Ala8HDGksmUXDObbnciWs0r3lFHIdZY4gQew0/dSIC84g==
X-Received: by 2002:a05:600c:1552:b0:407:7def:382c with SMTP id f18-20020a05600c155200b004077def382cmr4012116wmg.13.1697455196603;
        Mon, 16 Oct 2023 04:19:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c358b00b004075d5664basm6983560wmq.8.2023.10.16.04.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 04:19:56 -0700 (PDT)
Date:   Mon, 16 Oct 2023 14:19:52 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Helge Deller <deller@gmx.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Yang Yang <yang.yang29@zte.com>,
        Xu Panda <xu.panda@zte.com.cn>,
        Lucy Mielke <mielkesteven@icloud.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev: omapfb: fix some error codes
Message-ID: <843b063c-ee4a-4e17-add6-75e2cc82c2f4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Return negative -ENXIO instead of positive ENXIO.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
No fixes tag because the caller doesn't check for errors.

 drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index f28cb90947a3..42c96f1cfc93 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1645,13 +1645,13 @@ static int omapfb_do_probe(struct platform_device *pdev,
 	}
 	fbdev->int_irq = platform_get_irq(pdev, 0);
 	if (fbdev->int_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
 	fbdev->ext_irq = platform_get_irq(pdev, 1);
 	if (fbdev->ext_irq < 0) {
-		r = ENXIO;
+		r = -ENXIO;
 		goto cleanup;
 	}
 
-- 
2.39.2

