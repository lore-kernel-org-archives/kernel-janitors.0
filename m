Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D356F30C
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Mar 2025 23:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740956507; cv=none; b=S+YPJ+3CG1qAtOX4+PxZ0rY3Omph8VCqrb6NjIPCW/q6P+Cg7CUXiB95aara9sycWnE5rGc3SJxxEU+ytU6jTRu/3OFv+8JBAmsU/BohwNP5W3/vfV6TQkH3unoA3e/8KOxNqbPmqFQ21arWfhYSjaY7qlZh8gmw80aSb3Ae6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740956507; c=relaxed/simple;
	bh=jDVHo04Kmb5ngdt51Au/CD+pY3gOrWBpnMnys3Hb7uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCN9PUI1DEyKOtJyZLrM4uCvSWtdDJj5UPA6fcd/+Gbv/7zB4UunDz2uY5sl9Przfarkuls/d30+Kck1wvbsaHPwTAgjy53mTbgt2+3sdyARYC7mWIkLCvjY3T39PNtp+YifunSoJyJk8mxUavxvxhLO2Sm74zjPeWkXTumaKsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdUht8qs; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdUht8qs"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5495c63bdc0so1448032e87.1
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Mar 2025 15:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740956503; x=1741561303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6tLHwT02MdyiarYGqAftjy+FZoaHm2RQy2amBFDQNM=;
        b=RdUht8qs1oFFZC8MjKPE1tOAHmKwgyNlUdU0zSf1NyIQDyMGMfhAXvdWub1Ocd2nYH
         d0Vp5oMORbYs6BaumxNAPw8i90NW/2iqwEFD0YM1gcERqwRdF8RB4XW8Wf5Fur/VKzsd
         Mk5K1VjAfM08OQAG/iYvZP1XPmm3F80usSvMW25h/cy2hLqfHTEuUa0cl4ewIXhDMDTY
         fSxKumipVOZlXVz9DyJ4j0mTxVsZmS+Aq4igcsNgvKHwtrIu80slqrsyAH5CGtklBmMa
         wUgYsiX8Hr1aeSigdNmAS/2RA59YbkzM3XiIiKQqEK44H+joKeZougzSFQSU0N6S9lr8
         DSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740956503; x=1741561303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+6tLHwT02MdyiarYGqAftjy+FZoaHm2RQy2amBFDQNM=;
        b=SfD9HJJHjxdQoQnsnGPcel6pmsrZ9TFqzpUnXaquBC4mTUvDRUXm5mZV8xbpjt9ghr
         6+v+gi+SXUCXD7extnoScOUZw6KueaCE0mtkkoRGg7Q+BiJzHjrXU7B0MgjqgWtgweXT
         csNUnnKm5GfIAjTFTEHjYSIKxZymn3Qt74ULWqbmBZvNm9EdLNPjCFzpghL1GhvcTDZd
         1muTwKrAaUjcQVD5tzCLysMgeBZkFkWbhiLlr4YwYUyEFDId3GlGR7jXpUS6r4P6yRRq
         lKoAsBp0yB+6SiugH498Wwntv+vNqBnLjl/JhNIrb5G8pCAY86UCQAaOjCNEtreqVxl9
         vH/g==
X-Gm-Message-State: AOJu0YzXT32uDWnJAhc5kyjUuOnHqfUq4rKEKgVv3mMxC2mHibMX/7F6
	F9jGkfCL6ihS7m9sUeoPtDizf445O5/lpDuRRD7JLxp9brKNahwtLfu3mkndHgA=
X-Gm-Gg: ASbGncuLu3JqsjPC2KtEFrGso1gqRY8mZGng+Nw7M+2195gguKZn4dkc+EfygopFZ+w
	qeA8vuRParKX+MSj8DsHSRepXknLxlWseCFXOuQpTaDSvd1zIty5zMM4p4tlLOQAgOHmIrCp/aD
	1h386QTclNphiTdMWaS2bzt+0ciKORnYq/KedaTZcdYIJg1yyIiqNIlxUQ6ZM7SwSXCNlkq+YpQ
	LN/dZYE6DCxStenuHhadzU1iXhrXArGRKriLICxxy5ZnyaMdYhyzRop5m3DAP52eNWiqfG+eleu
	mxZBqJV+T7Fgc7e/XhXYseQ9A0Wi3iPKSPyGzxT6Nq2DPj9pj8tbDAzvob0BuoK6gzNrxTbCUV1
	bH6y0E8N+qjRU/WF1Y7ZwwIw0
X-Google-Smtp-Source: AGHT+IE6iJ6MJULbhVODlhEs0Uz3Bo0Jahq2KVUfeiM0dMjeCLZC5DbHiJxY2q28Q7dzFsOZ3W5T5w==
X-Received: by 2002:a05:6512:3b11:b0:545:2f48:d524 with SMTP id 2adb3069b0e04-5494c320d25mr3513353e87.29.1740956502909;
        Sun, 02 Mar 2025 15:01:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54956a2c610sm747244e87.4.2025.03.02.15.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 15:01:41 -0800 (PST)
Date: Mon, 3 Mar 2025 01:01:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Archit Taneja <architt@codeaurora.org>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, cocci@inria.fr, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Delete a variable initialisation
 before a null pointer check in two functions
Message-ID: <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>

On Sun, Mar 02, 2025 at 09:56:00PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 11 Apr 2023 18:24:24 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> 
> Thus avoid the risk for undefined behaviour by removing extra
> initialisations for the variable “c” (also because it was already
> reassigned with the same value behind this pointer check).
> 
> This issue was detected by using the Coccinelle software.

Please don't send resends and/or new iterations in response to your
previous patchsets. Otherwise they have a pretty high chance to be
ignored by the maintainers. Use a fresh git-send-email command to send
new patchset.

> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 0fcad9760b6f..870ab3ebbc94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -176,7 +176,7 @@ static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
>  static int dpu_hw_pp_connect_external_te(struct dpu_hw_pingpong *pp,
>  		bool enable_external_te)
>  {
> -	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +	struct dpu_hw_blk_reg_map *c;
>  	u32 cfg;
>  	int orig;
> 
> @@ -221,7 +221,7 @@ static int dpu_hw_pp_get_vsync_info(struct dpu_hw_pingpong *pp,
> 
>  static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
>  {
> -	struct dpu_hw_blk_reg_map *c = &pp->hw;
> +	struct dpu_hw_blk_reg_map *c;
>  	u32 height, init;
>  	u32 line = 0xFFFF;
> 
> --
> 2.40.0
> 

-- 
With best wishes
Dmitry
