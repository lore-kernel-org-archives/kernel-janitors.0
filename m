Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BE8C25B70
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 Oct 2023 12:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345761AbjJ0MFG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 Oct 2023 08:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345740AbjJ0MFF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 Oct 2023 08:05:05 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019F918A
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 05:05:01 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507a0907896so2872932e87.2
        for <kernel-janitors@vger.kernel.org>; Fri, 27 Oct 2023 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698408300; x=1699013100; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hPBeFfhGzz7b9reukuJd9y/UBu4JJXA38Z99vzaShGU=;
        b=JOY80YAg4jZ4FB10dGRGRO3FasoX8v92N+oOIAZY4uma/rpNpXSeu+4g3Hn5jlrRYj
         0sFgFyy087nelp1+K5lcECy7rw7Lt5WsJXBy2CiExPVnKDUzfy0EG9ySmdm3SmKD6c+C
         H5mahBnvatmSC5jnC28P9JjQ6abUAalx5TTcSKI0jlUcGKIiRkLlQ96OMc508xcdlKLb
         7WvTuLPIhVAmyhQtRqeSaXjEKQAGnPmPCdR/x7Bdpr27sL3q21pfi5oPn57nr8jL01ob
         HobjcKTKJ/Uw+Rnk+vCcHTBHNYoGgUFSGV/gkrEDTeUgyEhjfvF993jXvoXq+pvpT0Ug
         Xkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698408300; x=1699013100;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hPBeFfhGzz7b9reukuJd9y/UBu4JJXA38Z99vzaShGU=;
        b=rMEuYFesTxYo03rPtEVC0wq4DwnKZui3Vkpgtk24k/KDS/u1i7+KyLwWiGloLXG+xo
         dhBusfAYquCfY+Wg2xoR+xw1S0uB7p/7THnCzH5Dv55LgP1l41AWq0+5rFq9r0WFf4XJ
         TXlSv7gbHA7GcDZTD3AFioj39wv/C8xf8f08GpEHV7Ze7wPaDKb1GR1AWdYxVD+oJUqz
         NVrNAEZF7IZA8YA9RywbeAuAc3GlG98RwmnZQxOxAKdLSmgsfgKTwDq2wORlwbe7lPAn
         PDWFz0NsOKGVIthjBEVExf97uHAz6Ru/OdNKgqUZ/iRfEHaBqKedVzDxG2wmnXToWyFJ
         YTcA==
X-Gm-Message-State: AOJu0YxkRmxtZUGu942nn+xMYtJaooAGZziVvIy3f/bjmmuXZalkxHWi
        CkoVLxhcJpfOfEKhjRodEQfT4w==
X-Google-Smtp-Source: AGHT+IE2TD3mcdg9qAax1VoYDY/yTuv41aG+a5xNuJLSiW9RCK7h0wL0oxjupUYN1A9aWv+pqg0YQQ==
X-Received: by 2002:a05:6512:2807:b0:502:d35b:5058 with SMTP id cf7-20020a056512280700b00502d35b5058mr2101718lfb.4.1698408300149;
        Fri, 27 Oct 2023 05:05:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b00401b242e2e6sm4962968wmq.47.2023.10.27.05.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 05:04:59 -0700 (PDT)
Date:   Fri, 27 Oct 2023 15:04:56 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Helge Deller <deller@gmx.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Zheng Wang <zyytlz.wz@163.com>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] fbdev/imsttfb: fix double free in probe()
Message-ID: <014c0272-0d53-4625-8517-e8b4aa68f4dd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The init_imstt() function calls framebuffer_release() on error and then
the probe() function calls it again.  It should only be done in probe.

Fixes: 518ecb6a209f ("fbdev: imsttfb: Fix error path of imsttfb_probe()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/fbdev/imsttfb.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index e7e03e920729..acb943f85700 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1421,7 +1421,6 @@ static int init_imstt(struct fb_info *info)
 	if ((info->var.xres * info->var.yres) * (info->var.bits_per_pixel >> 3) > info->fix.smem_len
 	    || !(compute_imstt_regvals(par, info->var.xres, info->var.yres))) {
 		printk("imsttfb: %ux%ux%u not supported\n", info->var.xres, info->var.yres, info->var.bits_per_pixel);
-		framebuffer_release(info);
 		return -ENODEV;
 	}
 
@@ -1453,14 +1452,11 @@ static int init_imstt(struct fb_info *info)
 	              FBINFO_HWACCEL_FILLRECT |
 	              FBINFO_HWACCEL_YPAN;
 
-	if (fb_alloc_cmap(&info->cmap, 0, 0)) {
-		framebuffer_release(info);
+	if (fb_alloc_cmap(&info->cmap, 0, 0))
 		return -ENODEV;
-	}
 
 	if (register_framebuffer(info) < 0) {
 		fb_dealloc_cmap(&info->cmap);
-		framebuffer_release(info);
 		return -ENODEV;
 	}
 
-- 
2.42.0

