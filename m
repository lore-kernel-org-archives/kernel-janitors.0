Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE1924CEF4
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Apr 2025 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682436; cv=none; b=bbGxY9/uPF+kEPB7PGDdr++kzilzP6g50PIC68CNA3sxOH1d/io+WfNETXiCeNL7FmpR7oxujY5UpIxu7NLwOil6px93QW/Dwah8OHoIxiich995CJcPO205j6ltTOp5THnbWL6TdJ6g5R9VadzTupl6nKSmboQhiC1QiUyNWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682436; c=relaxed/simple;
	bh=dMh+PH2DOFIYTZ2nD33jFFijdt4/YdxCeBsnRsmq0o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUUV8aXEZwsDnJH9jKhhjj4Azs6UX2MuLht3tVPXdOd1hY0uKRN1FzcXfhIYV7SBLiWmiJ0AN/TDQ9Swt44yBlckC5eNnMdp7/S9aS9WHb0w2Vj+zYiGcv17mz+hAVHQWJTMMX0cn2esQMoTLvqCn0UAiRjJZxW1VXeAvMQ3eQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TFArq9NE; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TFArq9NE"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so552473f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Apr 2025 05:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743682433; x=1744287233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iU6vhdM1OwZrAPd+i9V1VxGRpqECj+EW6TIAG2RUe28=;
        b=TFArq9NEeR22gxILhLQ3IkEHdJDJ4ExJL93Kc96TRdPo8Uvnu003RaG884gh2CcO4z
         +LRZktsORrH6qMoVvll9+DvnuOGAmOqTehbMkdAE8NRnZ75B1FxCfizsYi3QTZe1GuMF
         pQTxK8cP84Y3UHvfII5NvVLQZv4WWZ6IF4qmo8u0byl/khYXgo3yag5MzS8R578JB1eM
         TDZiRbyyYgvKEyJF99olbKQo/GZFsheHrULy4TysP1oiRes3ZxO37U/Mv10Fgp2sAm7H
         ff+rVuVok6j+4AW3IHarMTnSNCT2XiO7EqH5TvmWPlJ7iWrgMeH3nAnhLQBXgnfgGB3R
         1YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682433; x=1744287233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU6vhdM1OwZrAPd+i9V1VxGRpqECj+EW6TIAG2RUe28=;
        b=ct/ixTwKx31zJ1/DSIhugrp98CeuUSId7fiO2FnBb5pQboXc0/2MoLMNRS06whyP6G
         g9jTUa9oakL3UqbOLwbv1yqBioa8Gzuy6Ck3I3yxfKzZ4ivZbT+2SNTma/A3HzCtPKne
         PM0eGGDRcrqvW0hRNDP2EsFOWZt+Wc6mySMAxK+QACnABPveYewJ0TRGk5ZaeUZx0qBV
         piFO/uLuDpflsAOyPV+C2fu26IjUhKsUu4Vq4hnaKXjfgdC/kCeDsLLEah71w7t+ehcm
         G23PXq4XD78Hhqb3LI/xktvqMVtwv/QO82fp2ZZPSMaSTAl4tffQ1oV9DSC7mBhjnQ9G
         66bw==
X-Forwarded-Encrypted: i=1; AJvYcCXqPnvKfhebcY/71bE0qGCxeL5MKU9loy4tD5pH9o1v3N634Cyqhj8bCLPGu6TCUeLfdFucTtwuOnX0JGD/Q0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSvJfSTj4mtw/M2VGRsgkXnaVoBrNwj+Q4XFZb0jO/xIzvqTkg
	LuxxxHlsGZFY5/siEPQBwVwMy0Rqt/o52Sqx2PDOuOohmU8MP0szYfBphj1k4SY=
X-Gm-Gg: ASbGncvpNp3URc47V3t9vnXR9U+OQh/y7xFQWwSJU6CTi6pp/bt8fvB/u/hVkPKkSKb
	xiQUySPmyktpuLtACbV0HzHY/jjSphZEbwjM2m3TuxFMmXTq7e2hhM7Zog5x+tLv0TZGu0WCfmj
	XTSzs7TQbFtuMgVpb9VnN6EToKXukbWjp4R5PFf06Rc+/UUfqYBHjB7e+IEsR4SSd//Q1mkC2Rg
	y/YWFa9C0eC2XvlQHphQac2qBvcjgPJJGBvH/Dwsh37ooipdewM50sD3fxwgzKArjOqu0iBUhhV
	zXE8/zkx+SVB7DcIDVpBH9+A9zDd41MzbnOGCzUOsaJ89cp9KA==
X-Google-Smtp-Source: AGHT+IGLHzdFOx5S+wASF4XaTudHsSa7tKhdihI+harwoyguW1Z/pMadFg3DBe4cRW/G7uF6fS9A7w==
X-Received: by 2002:a5d:64c3:0:b0:390:e8d4:6517 with SMTP id ffacd0b85a97d-39c120dd02bmr16086596f8f.21.1743682433218;
        Thu, 03 Apr 2025 05:13:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30096cc1sm1641886f8f.5.2025.04.03.05.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:13:52 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:13:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: release firmware on error paths in
 vc4_hvs_bind()
Message-ID: <87fea3e7-7abf-4849-a616-26d1df715408@stanley.mountain>
References: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
 <CAPY8ntCtAdWg1yN+DgxRe3np4Nu3aDUrrdqe4Q9WeqJMtbrrAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCtAdWg1yN+DgxRe3np4Nu3aDUrrdqe4Q9WeqJMtbrrAg@mail.gmail.com>

On Wed, Apr 02, 2025 at 11:34:58AM +0000, Dave Stevenson wrote:
> Hi Dan
> 
> On Wed, 2 Apr 2025 at 12:00, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Call rpi_firmware_put() on these two error paths before returning.
> 
> Ack that there is an issue here, but it seems easier to me to move the block
> 
>         max_rate = rpi_firmware_clk_get_max_rate(firmware,
>                              RPI_FIRMWARE_CORE_CLK_ID);
>         rpi_firmware_put(firmware);
>         if (max_rate >= 550000000)
>             hvs->vc5_hdmi_enable_hdmi_20 = true;
> 
>         if (max_rate >= 600000000)
>             hvs->vc5_hdmi_enable_4096by2160 = true;
> 
>         hvs->max_core_rate = max_rate;
> 
> to before we make the devm_clk_get calls. It has no dependencies on
> having retrieved the clocks, and hopefully means we don't get the same
> type of leaks creeping back in in future.
> 

Yeah.  That's a good cleanup.  I will resend.

regards,
dan carpenter

> Thanks
>   Dave
> 
> > Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hvs.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> > index 4811d794001f..41e9d0aff757 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -1678,6 +1678,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
> >                 hvs->core_clk = devm_clk_get(&pdev->dev,
> >                                              (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
> >                 if (IS_ERR(hvs->core_clk)) {
> > +                       rpi_firmware_put(firmware);
> >                         dev_err(&pdev->dev, "Couldn't get core clock\n");
> >                         return PTR_ERR(hvs->core_clk);
> >                 }
> > @@ -1685,6 +1686,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
> >                 hvs->disp_clk = devm_clk_get(&pdev->dev,
> >                                              (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
> >                 if (IS_ERR(hvs->disp_clk)) {
> > +                       rpi_firmware_put(firmware);
> >                         dev_err(&pdev->dev, "Couldn't get disp clock\n");
> >                         return PTR_ERR(hvs->disp_clk);
> >                 }
> > --
> > 2.47.2
> >
