Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435DBC83003
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Jun 2023 09:15:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbjFHJPf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Jun 2023 05:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234380AbjFHJPd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Jun 2023 05:15:33 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1259A19B
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Jun 2023 02:15:32 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-30af20f5f67so380380f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jun 2023 02:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686215730; x=1688807730;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RySa5TKNiSsUD/90w92orRJEIYhEVSGdB85+66FnSA=;
        b=mpC92LVOdl/5WmkIGe0GW1UkaOKSkWpiVMnE7MxRMUzmduDVvakeDuJbXwzon9xx06
         h2kszxa6Q/zZCGN1TUcANr5Qo8yjUN66VlWcHG2bh7+swXyZ2dAuYAlJrqXwxLviZ+LQ
         nfSLtnAn2NBSeB8TNIQevkWKI/w17xILOPWIuB0I3CZVL2PaJZZO6yucWln3LEk9q1JJ
         xUYDFwhjSHn95HYqNysv1+b/FWgAiQaxikcffL2lgI1B9tCaagdxH/XBX0VOaHHmY5AY
         Y8RHdm6BjCVBK5TM5zqasqPXrvU7IUJm+sJjy76yOm/UsX5Ih7s2QtRYNDGe42gu9YmV
         OPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686215730; x=1688807730;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3RySa5TKNiSsUD/90w92orRJEIYhEVSGdB85+66FnSA=;
        b=ASZ6BcWsspviqzWUWSsonnBbxlBoa3GcJz3nzi4H/K+fYCC5OyqTG7P+M+9pX45tC5
         SUp0uQ91TjDkb5ppD19IDeF0SzBZmg69T0c7uDTwjlqUGukuOPjgWWORS42x5m6eNkNp
         hwd7L3Lna0yaW6OZjiOSG7gYN4bkrVuxkMc3jp22iUGVnx2zdk2g4g2HLF2MUAKFVbFW
         PgvE2Zh11u7KixcbLdMzZ0dNlx0OSpFtx9O6CAUqLpe/qV6XBRRopKWe6RxrAY1heE1r
         AqQqe6JSCUd0HZwOj2AvHkV8u1hdn+Bq5xPwJIXUXJJjFhfCfOmGhoG6fjdAmhdUV7kF
         ll+A==
X-Gm-Message-State: AC+VfDwActFm9oeKmf9b+ZKImUSIqYIutYcT2mrIQTPo83LN8+IA7c8u
        Mx5PQl/rRn3gf4NCSlEjTLsuvA==
X-Google-Smtp-Source: ACHHUZ5sHNLLbkCtJHL6hEVSUHaRtgooC4bpxt6UOn69Qv0TvZpAnODCn/1nIOo+cXufx6q67xuXpg==
X-Received: by 2002:a5d:4003:0:b0:30a:d747:b357 with SMTP id n3-20020a5d4003000000b0030ad747b357mr6375438wrp.56.1686215730511;
        Thu, 08 Jun 2023 02:15:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b14-20020adfe30e000000b00307a86a4bcesm974061wrj.35.2023.06.08.02.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:15:29 -0700 (PDT)
Date:   Thu, 8 Jun 2023 11:23:33 +0300
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
Subject: [PATCH v2] drm/msm/dpu: tidy up some error checking
Message-ID: <907e4b37-b9a2-4e14-bff2-ec2a0aa45965@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "vsync_hz" variable is unsigned int so it can't be less
than zero.  The dpu_kms_get_clk_rate() function used to return a u64
but I previously changed it to return an unsigned long and zero on
error so it matches clk_get_rate().

Change the "vsync_hz" type to unsigned long as well and change the
error checking to check for zero instead of negatives.  This change
does not affect runtime at all beyond a minor adjustment to the debug
output.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
---
v2: update the debug output

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 4f8c9187f76d..27a823c72c06 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -323,8 +323,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 		to_dpu_encoder_phys_cmd(phys_enc);
 	struct dpu_hw_tear_check tc_cfg = { 0 };
 	struct drm_display_mode *mode;
+	unsigned long vsync_hz;
 	bool tc_enable = true;
-	u32 vsync_hz;
 	struct dpu_kms *dpu_kms;
 
 	if (phys_enc->has_intf_te) {
@@ -359,9 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	 * frequency divided by the no. of rows (lines) in the LCDpanel.
 	 */
 	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
-	if (vsync_hz <= 0) {
-		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
-				 vsync_hz);
+	if (!vsync_hz) {
+		DPU_DEBUG_CMDENC(cmd_enc, "no vsync clock\n");
 		return;
 	}
 
@@ -381,7 +380,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	tc_cfg.rd_ptr_irq = mode->vdisplay + 1;
 
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
+		"tc vsync_clk_speed_hz %lu vtotal %u vrefresh %u\n",
 		vsync_hz, mode->vtotal, drm_mode_vrefresh(mode));
 	DPU_DEBUG_CMDENC(cmd_enc,
 		"tc enable %u start_pos %u rd_ptr_irq %u\n",
-- 
2.39.2

