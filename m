Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A1CC7EE2A
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237042AbjFFIdt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236698AbjFFIdo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:33:44 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77BEE7E
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:33:15 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f735bfcbbbso22008095e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040388; x=1688632388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGNvezJMXfjn7ToqqZuXUFZItGnK+ZI8rSYUZp66fL0=;
        b=ebW+dZ4PFwVmuzs+A/1mErcEfwlk42eaHMnN0FTXdU4DToHNMqjg4hps7BaomOmmnG
         ULeztuZ667nKmYkB8ryIIMId0Ya0i1cXnLd/2Jms6MjS7sKP1cyJAOU6jeF085HhLoTY
         lRn40UYUUe074EBieFDm8LmII0z3VjGADQOBO416duu0D4HLC/dxSxgOShk3e9tnQu6G
         z7cIOOTpWmTUCCKwHUfk/AY8KznVOufjFOyrDOcxDNKRzEAmuKQ+1SEEhsDwkOAvnlKK
         SOeWPzLVkwYxz5X6SCq/3oB97ZfRVn3MS5PjBh6rNiLAom3mBQQdr8q4n7gRCRwvF5dc
         wi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040388; x=1688632388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGNvezJMXfjn7ToqqZuXUFZItGnK+ZI8rSYUZp66fL0=;
        b=FnJcIjDp3Rav5tR9dUA7tIv9X8xAOXtxo+mHtoqn2cyW/78r0+r8zz4mLkr6VgXBLD
         6QJ6M1iI3jLaemb/HS7qmGLOEJnRJxStuwXgN/WxckoPVH5VvkpD92RNYQ0u68fd47v4
         cbKEFvuEek3V4UNN2DmqBC4ucRPE3NAj61zBgVSAvyDf/FEVgWa/ZEloJg0g4g6RgfiN
         HBKZ4xb+ijQkjGq05Rty7v3/QtyBi20Kx1PevVzkRBZzd2PiWlrYjumPIO9LdJaxqgaI
         gecYR3KJWxNmpEVUaJXADeKc4LQO7LhLllp9se4/o6JVznqJwIb9ulsUBTVLYbn3iZHT
         KTBg==
X-Gm-Message-State: AC+VfDylMZrxkT0ie8WWBX2aLTYwjHEb6ZKH4U+SIwAdd5RkgTTPk8s6
        ipZ/5tmOim8JK3n0Li3U9MHEJg==
X-Google-Smtp-Source: ACHHUZ69J8r5vJcWEWXn2VmWqlCRB7PTWJZj88krqf7/cGT0YE5tj+fKqFHTvwx1gzn5SpOc8uSZ5g==
X-Received: by 2002:adf:fccb:0:b0:30c:2bbf:bf75 with SMTP id f11-20020adffccb000000b0030c2bbfbf75mr1071217wrs.26.1686040388227;
        Tue, 06 Jun 2023 01:33:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l24-20020a1ced18000000b003f31cb7a203sm13443342wmh.14.2023.06.06.01.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:33:07 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:33:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <ZH7vP2Swu8CYpgUL@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "vsync_hz" variable is unsigned int so it can't be less
than zero.  The dpu_kms_get_clk_rate() function used to return a u64
but I previously changed it to return an unsigned long and zero on
error so it matches clk_get_rate().

Change the "vsync_hz" type to unsigned long as well and change the
error checking to check for zero instead of negatives.  This change
does not affect runtime at all.  It's just a clean up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d8ed85a238af..6aecaba14e7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -324,7 +324,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	struct dpu_hw_tear_check tc_cfg = { 0 };
 	struct drm_display_mode *mode;
 	bool tc_enable = true;
-	u32 vsync_hz;
+	unsigned long vsync_hz;
 	struct dpu_kms *dpu_kms;
 
 	if (phys_enc->has_intf_te) {
@@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	 * frequency divided by the no. of rows (lines) in the LCDpanel.
 	 */
 	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
-	if (vsync_hz <= 0) {
-		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
+	if (!vsync_hz) {
+		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
 				 vsync_hz);
 		return;
 	}
@@ -381,7 +381,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	tc_cfg.rd_ptr_irq = mode->vdisplay + 1;
 
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
+		"tc vsync_clk_speed_hz %lu vtotal %u vrefresh %u\n",
 		vsync_hz, mode->vtotal, drm_mode_vrefresh(mode));
 	DPU_DEBUG_CMDENC(cmd_enc,
 		"tc enable %u start_pos %u rd_ptr_irq %u\n",
-- 
2.39.2

