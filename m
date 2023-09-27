Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8B5E810DC
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 12:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbjI0Mju (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231668AbjI0Mjt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:39:49 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94786139
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:39:48 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so10829034f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818387; x=1696423187; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIhs4BXY6YTveTvsRzye3j10AAGXVI9gvPzsJlGfAZg=;
        b=jlHGwqaLAXIfm1Sgu4OJ8/84uMg3fCpCnLacKoJH17Vc4pAUeEv8UTpxPWbutN6a3T
         gBldw/pF8LrpVYTMdr4OQGff/91Cqj/LGApCLgWOTlWz6ethqiumHW3XSzzNQk6O2Bzi
         xx1vQ7PkRmXtBwoh734yIxGva1SF0AgBPTJdN0p5dLo6LEwhqSAjoJDezqW93Wnd97lK
         FOpn41WlK3ko0N+bGg5P2zoVQ4GzRx/1+0TV2weitrtNgwNwx2uj7O1YeqdlZ9yyPxBF
         o7F+IVild1Ip22tBZZo/dnfiLajffc0DEO+c4gsI9LtveRN6/SrJByi9xAhbtY5YmvWO
         9+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818387; x=1696423187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIhs4BXY6YTveTvsRzye3j10AAGXVI9gvPzsJlGfAZg=;
        b=VL7Z7p3a5uJNUn6mjKOensJtdyAL/JkKcwtjYy/QG52zsHy1UjpMRnHBiIDr1TUivt
         VOeE92Dv9HoOi44F0o4BbEnm8HvfpYqL6Hud9YVEVTcAd0aohUXVWu99fGWzJjpIXHpc
         AGXK2kO4XHg4r2oebdEuVF5IBbuJ8P5nNTK5J8KthIt+PclqvyNJvqmxrEr3B0Ggfnc5
         8UFzC1rXFriQOcP7FOhhNGN9RkR1YD5SgQgnNBFTXL2dxn5bDJglhhcOTXeOtYQNUMqT
         mA/ucRDdY50Icn5LGAUikk8XKezVw+0Z19Rmc4v/GMIJlZjC/IApt3jIbDCdyyW0ubEJ
         roUQ==
X-Gm-Message-State: AOJu0YwrOI5gEh2EosOG0l/LW46GzlM4HfRWgtvGCKj3NsZ/wsffc7Hi
        rNOcRD8KmFzQvlOk/pvC1GnaZg==
X-Google-Smtp-Source: AGHT+IEX1DR+gf+lCbxY7PiBtDS+udqlOUQsbofCCFY2WMj3GiFEZa/d1gZ3zztXu9BXUCF+I4ff7w==
X-Received: by 2002:adf:fa12:0:b0:31d:c73d:d2ed with SMTP id m18-20020adffa12000000b0031dc73dd2edmr1456778wrr.5.1695818386752;
        Wed, 27 Sep 2023 05:39:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d6511000000b0031fd849e797sm17033260wru.105.2023.09.27.05.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:39:46 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:39:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marvin Lin <milkfafa@gmail.com>
Cc:     Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
Message-ID: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The of_parse_phandle() function returns NULL on error.  It never returns
error pointers.  Update the check accordingly.

Fixes: 70721089985c ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index ac8d73b794d3..b9e6782f59b4 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1660,9 +1660,9 @@ static int npcm_video_ece_init(struct npcm_video *video)
 	void __iomem *regs;
 
 	ece_node = of_parse_phandle(video->dev->of_node, "nuvoton,ece", 0);
-	if (IS_ERR(ece_node)) {
+	if (!ece_node) {
 		dev_err(dev, "Failed to get ECE phandle in DTS\n");
-		return PTR_ERR(ece_node);
+		return -ENODEV;
 	}
 
 	video->ece.enable = of_device_is_available(ece_node);
-- 
2.39.2

