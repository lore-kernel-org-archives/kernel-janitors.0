Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9960BE810DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 12:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjI0MoJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjI0MoI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:44:08 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB13139
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:44:07 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-406402933edso24516465e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818645; x=1696423445; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eV/iObVOjNdpAvz3lG/ln1pocXCMm2I9lf4wBt2iVFs=;
        b=WWIWRvR2VHLpjS4TaFzJRB9Jj17btIghXwdnbM4SBzF2/R2JLUMHi1qE73+Nij1YWx
         8nQLQmSEDzfUpepJEaAHv1vOdIPYe54rXz+vwesvISRQ3t0CXWpKXaobbJQ/Ho8YnLSk
         6Ap2RqSRfyu71U0qyA1fADBwcdwa+s3DkwYM9qkMNUB3o4oGdYVjUwcfA9j2f2+fttzR
         D4kQ1OQvdROOJxNAjOIzd5FjMLDeSUrNFs9aXn32dS329ZOeDNrbRwYf0H1qKDpJG3xh
         zs1vyV9g69zLHcSMvl9QSQMfbEM0L/N0G+KyhQQwq2ra5pCpGPYQvWq3lptBDlCjappS
         JLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818645; x=1696423445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eV/iObVOjNdpAvz3lG/ln1pocXCMm2I9lf4wBt2iVFs=;
        b=RL1QuzcEw+tWwD4trYFI7S2X/R7Jm49kBwIlMtHC5oWi+4qED7E3K24bhe5QxPVt2Z
         GfPh6KUzx6bxQ8yNV/ISas2XhGnjI23ioVbYAfX55s2bFQtyUmkVGhOiTN4ypXRTUtvQ
         hFq9EPJh7veDLGH/pkb8VftkhEUQcPrQYATh5l+/cKjYcLe9WX199f5+0xG15s25s7n8
         5hblVHJGY7R0VjJy6KWwiCspOn/e47XfrflFW38KjeGNYQS3wv0/As31faJ/dOGJ7/7Z
         /Uj996cSp6HdPagc7eDzj4dHS05/OGgS8MYYYGPHLyyvfNw23Dg3hIlZlyFzQgAOogi2
         6jmw==
X-Gm-Message-State: AOJu0YyO1rArKJM6D5HK8TYQJ33OXHCZbgVkXT7/pha+7fY1ngPnl4s7
        S7er4iXwcQpsW+aTYnwjYY4TWA==
X-Google-Smtp-Source: AGHT+IFn+P/SI2/I2/gsxtiwld1WN2Rq/yE5OgOfu5Z2qxoxqkMq9FCOAA4ZlPaluoR2JWkiB2382w==
X-Received: by 2002:a1c:7418:0:b0:401:1b58:72f7 with SMTP id p24-20020a1c7418000000b004011b5872f7mr1911931wmc.38.1695818645544;
        Wed, 27 Sep 2023 05:44:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c234900b00405959bbf4fsm6752008wmq.19.2023.09.27.05.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:44:05 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:44:01 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     James Schulman <james.schulman@cirrus.com>
Cc:     David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: hda: cirrus_scodec: fix an error code
Message-ID: <5eea7fd5-67c8-4ed4-b5b3-b85dfb7572cc@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "ret" variable is zero but we should return -EINVAL.

Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/cirrus_scodec_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
index 5eb590cd4fe2..8ae373676bd1 100644
--- a/sound/pci/hda/cirrus_scodec_test.c
+++ b/sound/pci/hda/cirrus_scodec_test.c
@@ -137,8 +137,8 @@ static int cirrus_scodec_test_create_gpio(struct kunit *test)
 	priv->gpio_priv = dev_get_drvdata(&priv->gpio_pdev->dev);
 	if (!priv->gpio_priv) {
 		platform_device_put(priv->gpio_pdev);
-		KUNIT_FAIL(test, "Failed to get gpio private data: %d\n", ret);
-		return ret;
+		KUNIT_FAIL(test, "Failed to get gpio private data\n");
+		return -EINVAL;
 	}
 
 	return 0;
-- 
2.39.2

