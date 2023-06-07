Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2DFC77B7A
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 14:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbjFGOnZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 10:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241116AbjFGOnY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 10:43:24 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D36281FC0
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 07:43:05 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30b023b0068so584540f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Jun 2023 07:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686148984; x=1688740984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgVx/ivppv/BoC/MHBYYnozcIe3rB0Gk/93SvU0ieGk=;
        b=iH7pl4QNui1hU+6JKz4/bUDAgdQYy03ZueQYLgxmh6OIy3u7Gx1wldh/KcHEiq+6kz
         /Vk/iu4XBqjg8U2XjuWn0BAvz2yomQV6DTDLPaBt33TM9xnkL7KTx6+9QfRjnYiWBxxP
         7lSGdu75EAUROtZNp1GiMCDTtrtLbEhh80noXR5Aq/52MX9Ya4ep1h65dqGxo0Vcy7ht
         Z2/KZzISCKKxY1U2ltcw40/Qkjlq+Soeu5uwySeDDck2fgWOMg/GHSxmVpqJ+rBfK9wN
         nE/gVlqnGX9oc6g6K8O0S4FytYEa4LnLPDFLy8G/8gsI6tD7tWXy2REN47hPUqFGwVZI
         96Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686148984; x=1688740984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgVx/ivppv/BoC/MHBYYnozcIe3rB0Gk/93SvU0ieGk=;
        b=J12X4aQtYMENgLlc4ZN9Ijwty0oFOzTjjLAewHYStMpe1EV0+hG36I1RK3HBsLNWDM
         s8wYDlItuQmPBlPUEyGy+jDoM7LZOzCwpmcOFPnvUIzzmLthCfmHdotNAZxLk2vT6OLS
         eE+wCJMncPwGrbtgUzgwGw8tbBj09/ZTP/d+lyteviauqmRaulpsWXUgfyR8RUeI+TDA
         e8e70jnRnasUdlAK1HtaVNclzpXZL0SqcHn2wwiHhJe/u/zpMMSfQKEIu7G9KWtFUuj6
         nnjYFPjyf7SBzWDzvhWhxdJPcd/0t8xIZJPeia8TpR0rozAs5HIqSaUuwdBGcfDkOfba
         pdHw==
X-Gm-Message-State: AC+VfDw1dg7laEotPOlkwOdFCIpbTIpiq1RvEAkdRINr//hiRhYlUXrY
        ew1rodTiQELGdTXmpttBPbVtZg==
X-Google-Smtp-Source: ACHHUZ4BJFkUr8BQPVvtoygEGhGFQ/34JaENFvbKrT9Mxiyyf1zIQ0xfupRRBYQHPNv3qH+L0Ngz+A==
X-Received: by 2002:a5d:458c:0:b0:309:5029:95a9 with SMTP id p12-20020a5d458c000000b00309502995a9mr4791008wrq.32.1686148984213;
        Wed, 07 Jun 2023 07:43:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j14-20020adff54e000000b0030aec5e020fsm15785659wrp.86.2023.06.07.07.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 07:43:01 -0700 (PDT)
Date:   Wed, 7 Jun 2023 17:42:58 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <b27d016b-ff87-435b-8341-45a4369049fa@kadam.mountain>
References: <ZH7vP2Swu8CYpgUL@moroto>
 <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gkeclhi5ouudxiwbd6wds7y2svtdcamyuqcnk42z7hr2js52qh@25ox3nxgeuzp>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 06, 2023 at 10:23:46PM +0200, Marijn Suijten wrote:
> > @@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
> >  	 * frequency divided by the no. of rows (lines) in the LCDpanel.
> >  	 */
> >  	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
> > -	if (vsync_hz <= 0) {
> > -		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
> > +	if (!vsync_hz) {
> > +		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
> >  				 vsync_hz);
> 
> Nit: no need to print the value here, you know it's zero.  Could be
> clarified to just "no vsync clock".
> 

Yeah.  That's obviously not useful.  Sorry, I will resend.

regards,
dan carpenter

