Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2BB2582
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Oct 2024 07:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729841452; cv=none; b=US/WWJO4AFOZWHw77NI+NqBRPTadl/mW5X5iT3eKGnLRZlxSTgoE6Yt+cP7FqDNjYFMaRo5svtCudyAZuWPAvb9+JyVD8mdvoPdTkYKrEbq4rh1y3qS6AhT7Vxd/7v7g26xMVBts91TZ7hOxEDMFDCNYXFZS9uw5i9n3Zm3JRYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729841452; c=relaxed/simple;
	bh=tgy99DmJT1rVp1LrmB6ojFA2kufaH3nzhaBGHtk9wW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4zgbPH2hb4644Hvsm6yCnbSgdXT9x/wnNuZs6CXS2//nXX9cyrzqevY1diAE3AcM56Wd5Oi3fu6rYEdVEVIDlOt3vzmlelmAEIENtIAI3wIv5oepMBarHBz3bFuIt3IzD9lcSE/5NSci9QaxAvAIrYaQHt+HRoXhdmQiIGCWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WEbNN5rz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WEbNN5rz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so17960235e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Oct 2024 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729841449; x=1730446249; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WtHDy1uLFgkmsG/x5nxbwS/MMMaeDjb30sYbzTEX8Zw=;
        b=WEbNN5rzsIG7tseACo0OdLHx1ax16wU0n2Nv1J03790Q28o73lWzm7YCEpc0j3YtuR
         ykI0KDIevxGFrsn0KEYyKYCOd6gg+2O7VJlYktov06EAj1m2zYmvOjNsa5JUBdRT0b2e
         bevITz5ZhXJxakC96YOknw+le52Dk3+BxfQVZ/SVwj1WSud9KPolQjR10HUKWR6cWUYP
         vKSuRi7NBqA8eFQlZ3U/5tamluomclBXJQ3WPYxITLFMmMVK5Sj7RJUfy5Bw/q+5VfyO
         YRGJAOgSq0dOuwTZrsGGiSsFvohyF7mY8M/XX6WCT7V3+LnyNj5selT8xm/oT5yAGtJI
         xexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729841449; x=1730446249;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtHDy1uLFgkmsG/x5nxbwS/MMMaeDjb30sYbzTEX8Zw=;
        b=Z4wLIA4U+5TWf4DyoFlc/cDXUwbQh75UaoKRRVkOAhVOf80WdCIRHxiJQ0NuwDU7hx
         4Kkrsw2oqRD+eemiY1ULnJMocknOq1VNe7cf/56k2rXAPjc1xoDSEgth8DOUCbp4+bU2
         pLQGcNumT3LN3Y3mjSDLTKoLjmx9h5T6Gja1p/y6jM6GKl8Slx+0L2OaTFv/5AhynDrv
         nVxjXTRLTnIYlSharUksOCovfzRtl0Lu5kV/axakJiKwG92EHxWzPkQ1nOtfHVLXHCPG
         ssiwwrYkhS4iI6iVmdkSkQsTZInQNGVGHlvbgGTF2fmpheXvWmyPqLgwKkSle8o9nxrx
         1k3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdZkMcCj0yuWDtKVEp047JSokOYOHlb3i+j/FvFrvWIPgFyryvtUX9g8YXq3myt3MvxOvWOCzANKjzfvVWQO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvJTwVbRzXXQaLOt7ge6Xrk4cjiUBeuDZ7qvGZeoo1dyILKq8u
	Jd3H2lRVN+HDngL4W1QKundiVnM1mQuk6Lf9LyGqTbmv3Oji4vBMyFnDIKzOFB8=
X-Google-Smtp-Source: AGHT+IHxF+XBAnXeDnDqIMGQCJ8rtAbnYKULA9dlRYGwuNkgYKpDnNMejLiqlKZPt83EjxSWFFNeTg==
X-Received: by 2002:a05:600c:1c01:b0:431:5a0e:fa2e with SMTP id 5b1f17b1804b1-4318c715cc0mr39763695e9.21.1729841448665;
        Fri, 25 Oct 2024 00:30:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b71479sm800087f8f.69.2024.10.25.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:30:48 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:30:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/sharp-memory: Fix some checks in
 sharp_memory_probe()
Message-ID: <3c078224-071e-4dd9-bf8d-51dbd0f2a9b2@stanley.mountain>
References: <0d307349-c141-49ee-8b34-67caf5f8b638@stanley.mountain>
 <hojly7qagyszxbgonzqmuuxucdfqwovrjyiktdxpibku6yodum@n7algnce2tts>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hojly7qagyszxbgonzqmuuxucdfqwovrjyiktdxpibku6yodum@n7algnce2tts>

On Thu, Oct 24, 2024 at 11:08:05PM +0200, Uwe Kleine-König wrote:
> On Wed, Oct 23, 2024 at 11:30:31AM +0300, Dan Carpenter wrote:
> > The devm_drm_dev_alloc() function returns error pointers, it never
> > returns NULL.  Change that check to IS_ERR().
> > 
> > The devm_gpiod_get_optional() function returns a mix of error pointers
> > if there is an error, or NULL if there is no GPIO assigned.  Add a check
> > for error pointers.
> > 
> > Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/tiny/sharp-memory.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
> > index 2d2315bd6aef..1bcdd79166a4 100644
> > --- a/drivers/gpu/drm/tiny/sharp-memory.c
> > +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> > @@ -543,8 +543,8 @@ static int sharp_memory_probe(struct spi_device *spi)
> >  
> >  	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
> >  				 struct sharp_memory_device, drm);
> > -	if (!smd)
> > -		return -ENOMEM;
> > +	if (IS_ERR(smd))
> > +		return PTR_ERR(smd);
> >  
> >  	spi_set_drvdata(spi, smd);
> >  
> > @@ -555,6 +555,8 @@ static int sharp_memory_probe(struct spi_device *spi)
> >  		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
> >  
> >  	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(smd->enable_gpio))
> > +		return PTR_ERR(smd->enable_gpio);
> >  	if (!smd->enable_gpio)
> >  		dev_warn(dev, "Enable gpio not defined\n");
> 
> Use dev_err_probe() instead of plain returns?
> 

Sure.  Let me resend.

regards,
dan carpenter

