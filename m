Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CF0C05027
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Jan 2023 09:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236790AbjAZJ0t (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Jan 2023 04:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236836AbjAZJ0r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Jan 2023 04:26:47 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CDE3A84
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 01:26:42 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j17so721193wms.0
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Jan 2023 01:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lidck4lW/zmw+foGw+y/7lttrAnguvFB5SfFlQVGE4=;
        b=nyvmsai7ZWt+8fiqIQJmJU1b5/dbt1jtvHROKxY7qs4cBunuCgFYWBS3vYtLuCEMAD
         PUtk9CgscbpUf5aVFQZ5LMQmlm5dx6m6vT9bSPEtqbRezF7snejuuAlHTvaYea4c5XvO
         EdCf+/jnIiAMhxfBHTW4qHsg/9IrLG/ewT9OboFuQVc4SK0bV/ApuUap2xiYIYpQ1uOx
         UOMR1OnbIwxxSpoB1YpkkRpDIbepNTX9bZiWWIH/UDKiyiNLbGD5Fmd9qnbnVo4fWZ/N
         cJTtarAbeTrKwcXJRTT5Pb41K5kSpL3pbKn/FipP4I7xSa2PJCuYmxDt6ltApD6EaQxj
         kV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lidck4lW/zmw+foGw+y/7lttrAnguvFB5SfFlQVGE4=;
        b=49uDjB9ApW5+5qEVDWlun2oRBBGlXvPjD0/t17xhEn3asguSWmnC04sYO/Kgx6s9AS
         H5ChSb+dOPU4y0vlwqUVdb2sfZ22yploH7/C3fN/eW1Jb9PExGFmD7QzqjZQ9GptKVdF
         t2pj5oCiS1CRPkDG3HTfoNHXR4oYAuvzY0wrcWglHCBFSEupadaLdmwhG5Pj0j3if4J3
         VqXJLbjYgxiSZfYmJIFyFmDFHoTxtgPCEmuOoMZYWn3JOmjxQuXJS1wCqmp0CAaOATS4
         SeX3mN7bLjfP51wAsjQ0bwTuwEAUDmCXHc4cPq7Hl8/ezatEfGrHFXsGC6B4VUgUbzj0
         Jx2w==
X-Gm-Message-State: AFqh2kofSVCcz4KBMFMB/Z22Vr0Fi5IS7T0Sj5sAJ4+9/zHOyEDG18Ip
        aY61HxGH7XvuvzwOQrWDZzdXBUpUAK0=
X-Google-Smtp-Source: AMrXdXvBqRioyyA4099IubEJx8GR5Jtpr3rsCZ5m5Oyz8/c3oySRDIwRWgrlRYHiUeSXqbL2NsTbFA==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id n6-20020a05600c4f8600b003db066ecfddmr32709189wmq.9.1674725200604;
        Thu, 26 Jan 2023 01:26:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c071500b003db1ca20170sm896026wmn.37.2023.01.26.01.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 01:26:40 -0800 (PST)
Date:   Thu, 26 Jan 2023 12:26:35 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Trevor Wu <trevor.wu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8188: remove some dead code
Message-ID: <Y9JHSwcfdNcfMjjt@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We know that "irq < 0", so delete the unnecessary check.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 57a31330e5f4..e8e84de86542 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3220,8 +3220,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+		return dev_err_probe(dev, irq_id, "no irq found");
 
 	ret = devm_request_irq(dev, irq_id, mt8188_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-- 
2.35.1

