Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4266AC6FD1C
	for <kernel-janitors@archiver.kernel.org>; Wed, 22 Mar 2023 09:07:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjCVJHW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Mar 2023 05:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCVJHV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Mar 2023 05:07:21 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837AE5DC9E
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Mar 2023 02:07:01 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d17so7762911wrb.11
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Mar 2023 02:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679476019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHk+VaDQI0rTpTXkNcesDIxJIN8W2c9dqQAphpW43vY=;
        b=SMP1g2q2pIyCWahv36Bw48YL7tBMXOtnWMZS2ugqHshM9QS+MqZKFVQvOAXWMllQOj
         NBxcOm+sSFVF5vBQRLg12au7Ps9C/qVFOSl30tdulTDNRXvf6qS2XvtAwu4aSbnRYeJu
         /5HyGKEqRJhmX/553gd59CgUIO0f+vFaCyViNXE4FnwpMoCt1CL9Hvixu2+3evoWTHee
         j7D13vQcbfeHAqjDNucuzx1JZREVozWvpIXadoWp2cPvcYPMy5kpbpk/pwE412tX7Azc
         3/w1CzKV0WB6egOToxTMKP3HT2BzamTuwxe9vAL4B8LwGJ6JqBIyAfhNFwsWf06RaSrV
         Sfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679476019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHk+VaDQI0rTpTXkNcesDIxJIN8W2c9dqQAphpW43vY=;
        b=cWdejIE0WdLgWSGgaNq+bFL4tBMPLu9a3XigwU2Bfaai1nBuk+dRTBRYWR15pSjo9V
         +6VVHyADUqXOeOiIb3S+acOY4vfLqq5lY464+crGN9Czmzel+DSSRNnY8a5CtnIR9hL4
         OPiNKptbbzWM2KT6zT0PTs5zWEAQGa9fpQTsZbuPJeWoCmBHu2EHp148bN4tlFlfKq39
         kxieB/hger9frqjsiAIIeoTOv9iaFZAkAE8NbIXAkRewBQ0Q83xQlWtBkF6vIuL3rGIU
         CQ3smnQusFWk2kvVl1so1F38tuIkqgMVw9utGIEeGqO1RwQHEMMzJbbi0RcpaXW7W/N7
         zeuA==
X-Gm-Message-State: AO0yUKVTUDTG0Xv0e/jo99AZJPuMk2yS03KyGpKrpTs1ZMgG1p0D22Fe
        CBJX7HFP37Z4eqXteLpdW9s=
X-Google-Smtp-Source: AK7set9RFIuVDmgZ+l/wooxIdhLoXYmUMIW7OZDZGXrEvCM7uhpoZiSQdSPuLYfC5ZqxoCbug1HdeQ==
X-Received: by 2002:a5d:63c7:0:b0:2d1:6b10:f33c with SMTP id c7-20020a5d63c7000000b002d16b10f33cmr4513060wrw.14.1679476019423;
        Wed, 22 Mar 2023 02:06:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o6-20020adfeac6000000b002c71a32394dsm13386534wrn.64.2023.03.22.02.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 02:06:58 -0700 (PDT)
Date:   Wed, 22 Mar 2023 12:06:55 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Marian Cichy <m.cichy@pengutronix.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
Message-ID: <d0a1fc55-3ef6-444e-b3ef-fdc937d8d57a@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The devm_drm_dev_alloc() function returns error pointers.  It never
returns NULL.  Fix the check.

Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 24bc7b310367..fc1a4f6657c5 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -399,8 +399,8 @@ static int imx_lcdc_probe(struct platform_device *pdev)
 
 	lcdc = devm_drm_dev_alloc(dev, &imx_lcdc_drm_driver,
 				  struct imx_lcdc, drm);
-	if (!lcdc)
-		return -ENOMEM;
+	if (IS_ERR(lcdc))
+		return PTR_ERR(lcdc);
 
 	drm = &lcdc->drm;
 
-- 
2.39.1

