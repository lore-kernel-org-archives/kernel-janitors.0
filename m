Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D474C7EE43
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 20:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238532AbjFFUXv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 16:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237463AbjFFUXt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 16:23:49 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01712B0
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 13:23:48 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 492243F7E2;
        Tue,  6 Jun 2023 22:23:47 +0200 (CEST)
Date:   Tue, 6 Jun 2023 22:23:46 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
References: <ZH7vP2Swu8CYpgUL@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH7vP2Swu8CYpgUL@moroto>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023-06-06 11:33:03, Dan Carpenter wrote:
> The "vsync_hz" variable is unsigned int so it can't be less
> than zero.  The dpu_kms_get_clk_rate() function used to return a u64
> but I previously changed it to return an unsigned long and zero on
> error so it matches clk_get_rate().
> 
> Change the "vsync_hz" type to unsigned long as well and change the
> error checking to check for zero instead of negatives.  This change
> does not affect runtime at all.  It's just a clean up.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index d8ed85a238af..6aecaba14e7e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -324,7 +324,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	struct dpu_hw_tear_check tc_cfg = { 0 };
>  	struct drm_display_mode *mode;
>  	bool tc_enable = true;
> -	u32 vsync_hz;
> +	unsigned long vsync_hz;
>  	struct dpu_kms *dpu_kms;
>  
>  	if (phys_enc->has_intf_te) {
> @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	 * frequency divided by the no. of rows (lines) in the LCDpanel.
>  	 */
>  	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
> -	if (vsync_hz <= 0) {
> -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
> +	if (!vsync_hz) {
> +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
>  				 vsync_hz);

Nit: no need to print the value here, you know it's zero.  Could be
clarified to just "no vsync clock".

- Marijn

>  		return;
>  	}
> @@ -381,7 +381,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	tc_cfg.rd_ptr_irq = mode->vdisplay + 1;
>  
>  	DPU_DEBUG_CMDENC(cmd_enc,
> -		"tc vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
> +		"tc vsync_clk_speed_hz %lu vtotal %u vrefresh %u\n",
>  		vsync_hz, mode->vtotal, drm_mode_vrefresh(mode));
>  	DPU_DEBUG_CMDENC(cmd_enc,
>  		"tc enable %u start_pos %u rd_ptr_irq %u\n",
> -- 
> 2.39.2
> 
