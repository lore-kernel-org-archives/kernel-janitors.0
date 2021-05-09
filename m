Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF41C433ED
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 May 2021 00:42:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20D1F61352
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 May 2021 00:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhEIAnf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 8 May 2021 20:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhEIAnf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 8 May 2021 20:43:35 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD15C061573
        for <kernel-janitors@vger.kernel.org>; Sat,  8 May 2021 17:42:32 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id q10so8111222qkc.5
        for <kernel-janitors@vger.kernel.org>; Sat, 08 May 2021 17:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JxlS9M6QzzqwmlE5SuHekyfqLUtBvcqiH0nJv3d9St0=;
        b=a5zeTRskkokbnkSFsjDgJLUGGMIPGatuGWaXi2/KA/VaS+wH7Pp3pQYFC7XmK74C4k
         8qCj5GvPNeTXX/CW1hXQd5nfPcJ03MURlI+ruy9vMWlBFoH0VQWYBMhkQWFlVrkLyoPp
         vj9r0XBA2Qf9P25mTv6A/3tK+64GUccg+6UJgrdQ76o0uxbhe+rgaPUQb8dweMbZzJ2W
         aLPfclHmS6+zCl2bMfeJnGO8ZmWacMM7qDwHE/e8m1PtHSjU25TQ0BuEw4FBdd6ucRII
         sW8pScjuxanEJbv3ASlCs0dCqjxV4lhBXyoCUSuM0P1ZNXvwne14EFSaRri5HMQdN3+X
         v/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JxlS9M6QzzqwmlE5SuHekyfqLUtBvcqiH0nJv3d9St0=;
        b=IhuBSRXrTDqjHMJaME3vwrxkOeBRIgMQ861kZe4dBFGAEXQL00xiCuOS2lB5Jez+pz
         EHDeubtTncYRToxJqjUMo8k7Xk86TD4615ZJT2Iey8/oinJy4V4yCeJ7ZlOg8Yu5Sp4P
         ayGo3BCcCGwRjeoBBq/ge6XyLGlrRsQXQJeyBWKwj5K5JDF6WGllIDOjK5ptjBcWD8aj
         so9KSx6DVm9iFlVdS128KPrQR3byjP5Cem1d5p3O2ujE9N4MVZX8WHHeNrb8d35O80ey
         3HPLFUiBXjRBJwUY1M2LYDkun0lB6XDYcnzvpZoXY40GNCidtP8fhKxR3dFH8gtX3hMF
         5AVQ==
X-Gm-Message-State: AOAM531P5WEpkslOiZxebAMJgwyClqVGZOJJXTaORH+SgYQnAceIfAWR
        7lUvi32I+DHnhJmUeg8XOFM=
X-Google-Smtp-Source: ABdhPJy2hrUyLlOO91lt7nTZyHT4IWIQYW38IrwQ6xvJXUVhixCAkGj+P8uFrdAr7R0CHsx9x1Ya6w==
X-Received: by 2002:a05:620a:16ad:: with SMTP id s13mr16195508qkj.453.1620520950992;
        Sat, 08 May 2021 17:42:30 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id r81sm8440750qka.82.2021.05.08.17.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 17:42:30 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     christophe.jaillet@wanadoo.fr, dan.carpenter@oracle.com
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [RFC 2/2] staging: fbtft: use symbolic error messages
Date:   Sat,  8 May 2021 18:41:12 -0600
Message-Id: <20210509004112.421100-2-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210509004112.421100-1-eantoranz@gmail.com>
References: <20210509004112.421100-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Modify some error messages so that the symbolic error value be
printed instead of a numeric value.
---
 drivers/staging/fbtft/fb_ssd1351.c   | 3 +--
 drivers/staging/fbtft/fb_watterott.c | 3 +--
 drivers/staging/fbtft/fbtft-core.c   | 5 ++---
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index 900b28d826b2..adf486b36289 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -223,8 +223,7 @@ static void register_onboard_backlight(struct fbtft_par *par)
 				       &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n", bd);
 		return;
 	}
 	par->info->bl_dev = bd;
diff --git a/drivers/staging/fbtft/fb_watterott.c b/drivers/staging/fbtft/fb_watterott.c
index 76b25df376b8..f9ecc5202c47 100644
--- a/drivers/staging/fbtft/fb_watterott.c
+++ b/drivers/staging/fbtft/fb_watterott.c
@@ -263,8 +263,7 @@ static void register_chip_backlight(struct fbtft_par *par)
 				       &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n", bd);
 		return;
 	}
 	par->info->bl_dev = bd;
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 4f362dad4436..4d96ab2ea71c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -83,7 +83,7 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
 	if (IS_ERR(*gpiop)) {
 		ret = PTR_ERR(*gpiop);
 		dev_err(dev,
-			"Failed to request %s GPIO: %d\n", name, ret);
+			"Failed to request %s GPIO: %pe\n", name, *gpiop);
 		return ret;
 	}
 	fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
@@ -194,8 +194,7 @@ void fbtft_register_backlight(struct fbtft_par *par)
 				       &fbtft_bl_ops, &bl_props);
 	if (IS_ERR(bd)) {
 		dev_err(par->info->device,
-			"cannot register backlight device (%ld)\n",
-			PTR_ERR(bd));
+			"cannot register backlight device (%pe)\n", bd);
 		return;
 	}
 	par->info->bl_dev = bd;
-- 
2.30.2

