Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6B2C6FD1C
	for <kernel-janitors@archiver.kernel.org>; Wed, 22 Mar 2023 09:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjCVJHr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Mar 2023 05:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCVJHk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Mar 2023 05:07:40 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B556B5DEEF
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Mar 2023 02:07:18 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o40-20020a05600c512800b003eddedc47aeso5445684wms.3
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Mar 2023 02:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679476035;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgoPZHhwzWdFKXnDcAIhowUCI5lnMebfejYcdgL1dJc=;
        b=LZ1aEKYA367XVcEFCBHSX7A56UANMixln7g0rnLRfR6BoPNgn2rVDaAIO0szGTFBGi
         yYs2FaG8oxss1eKST0DW5gMX4OEMlTOGDDI6eGfTZMCLLd43z8jih7qE8u+LoyxuN3Gh
         ZnhibhSGs5u0Gq9xQ0CNDCu98U3DVeNZD9nyY+IOhgyMSfn65bRy6mz0WVTiszLZi9LO
         nybtrV9h4EaSEy/Oe8V1yiJkekduW3XQnTAi+TudKjkw8yez/mN3QaPExmJTsbpGPCMo
         7ZX6NCuk1UtIXRihZUtlp5qmJSg6973rnORIDEUSKkvCVuKs5jT4D1KQ+jRPG0KEeC9u
         j78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679476035;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgoPZHhwzWdFKXnDcAIhowUCI5lnMebfejYcdgL1dJc=;
        b=K1C8HDQ5v3sb2ygDaMGSRa1Ioe02te/txnOMOWJ3N0Y35ELKgbRkzdrYAD2OitjCmh
         ClAVHWz3ClnvfyTDBGLsYQbhRvZzy5+88uL/QplBpP0HTsnvxertFO+TQYtw8+uvKTxl
         VWOTZMOafnqz8+2aO8m+5TRYOMWWs+2gWGrj7E5i9M9U+qSa57s6zpylTJYy4iTn6/sz
         95nTQB+3Z3eii98qnceR8bbPUYNJsHLfH3kAPceeVcnLTyYLN2Y8XMURxwELLQSYN/rO
         2SNMU+jvOeMaLCP22oJPUxJCxcT3jtRwu/djMLjW+MS/91153afzWgkCJeBCaIgDPPwB
         +FDg==
X-Gm-Message-State: AO0yUKVr3kDFWPcl0eWCg7smdn4tq8cEGivonTzE0TeBgu0+FnAQQl96
        FFLMr/IItHZpNYTUWuhu7sQ=
X-Google-Smtp-Source: AK7set9jgPjUxqGQ6jwxmB0a217WhVojsK9yGHhtU6jvRwV5m1Yl5QO4gQ+clKQvKwBfsRLF5Y4urw==
X-Received: by 2002:a1c:7c0b:0:b0:3eb:2e19:ff3a with SMTP id x11-20020a1c7c0b000000b003eb2e19ff3amr4578635wmc.7.1679476035162;
        Wed, 22 Mar 2023 02:07:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p2-20020a05600c204200b003e91b9a92c9sm16050285wmg.24.2023.03.22.02.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 02:07:14 -0700 (PDT)
Date:   Wed, 22 Mar 2023 12:07:10 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Morgan <macromorgan@hotmail.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panel: magnachip: Prevent error pointer dereference in
 probe
Message-ID: <de0273a8-8910-4ac4-b4ed-f7691c4d2ca6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Don't dereference "db->dsi_dev" when it is an error pointer.

Fixes: 249a4f5e663c ("drm/panel: Add Magnachip D53E6EA8966 Panel Driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
index 8c362c40227f..26d358b9b85a 100644
--- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
+++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
@@ -418,7 +418,7 @@ static int d53e6ea8966_probe(struct spi_device *spi)
 	if (IS_ERR(db->dsi_dev)) {
 		dev_err(dev, "failed to register dsi device: %ld\n",
 			PTR_ERR(db->dsi_dev));
-		ret = PTR_ERR(db->dsi_dev);
+		return PTR_ERR(db->dsi_dev);
 	}
 
 	db->dsi_dev->lanes = 2;
-- 
2.39.1

