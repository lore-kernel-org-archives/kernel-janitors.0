Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87461C7EE26
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 May 2023 08:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbjEVIyP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 May 2023 04:54:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbjEVIx6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 May 2023 04:53:58 -0400
X-Greylist: delayed 354 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 May 2023 01:53:49 PDT
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D2F1A5
        for <kernel-janitors@vger.kernel.org>; Mon, 22 May 2023 01:53:49 -0700 (PDT)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl [82.72.63.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A203A3F2EA;
        Mon, 22 May 2023 10:47:51 +0200 (CEST)
Date:   Mon, 22 May 2023 10:47:50 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: signedness bug in
 dpu_encoder_phys_cmd_tearcheck_config()
Message-ID: <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
References: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023-05-22 10:48:01, Dan Carpenter wrote:
> The "vsync_hz" variable is used to store negative error codes so it
> needs to be signed for the error checking to work correctly.

Nicely spotted, but it it looks like we have more to fix then.  The type
returned by dpu_kms_get_clk_rate() is u64:

- Perhaps the int used in this patch is too small (though 19.2MHz vsync
  clock ought to fit);
- That function should also return a signed number as part of this
  contract.

- Marijn

> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 74470d068622..b29e6d1ba7f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -320,7 +320,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	struct dpu_hw_tear_check tc_cfg = { 0 };
>  	struct drm_display_mode *mode;
>  	bool tc_enable = true;
> -	u32 vsync_hz;
> +	int vsync_hz;
>  	struct dpu_kms *dpu_kms;
>  
>  	if (!phys_enc->hw_pp) {
> -- 
> 2.39.2
> 
