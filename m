Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09A1DED51
	for <kernel-janitors@vger.kernel.org>; Tue,  6 May 2025 11:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530165; cv=none; b=R5yq3c7XCqP+Ygq7iFihXw9SMzcZA9v/fUgB8vhaHD0oDWN05mKnDJTi/sBo8CB2vbXVIbWlZv+hC4H3fD/hXbRac4eJuUvjLVwBx1pFv/8Ha4ujYk/dQZTo1/N2LTAlmwQDuEdjTRr1ONDPOyqt6FOz8mZmLRtoJClLn7Q9vlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530165; c=relaxed/simple;
	bh=Ic6iSBqqOYzgqBs0HWZuf5LIeAmlU/Dk/nOP/28CaHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=In9T0yQ+LArHOQYB+15Te4LUYhmYUYsGKg5jAc2T5MPdScLezty4lWD8E4SRVanL5OSHJwz+1bZf1zUj6pAG6hBB3MHEP03SDRqEIOBZAK/UB9BmEOUcewZOSLWlFjJBFQWMlPhLz49ij2PUr6w2Fqr8jYo9gYEGbqBb+OPp6mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8h74pHz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8h74pHz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso52524785e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 06 May 2025 04:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746530162; x=1747134962; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AZCwgOWOOCWTlbTNg+Glm3yWO7Px7uzRJr4qQIo37HE=;
        b=q8h74pHzgCsX2aFWHKuI7jWS0k5ifTSuGh+hdR6G4sVgVqHRmD1nLZVAyQUfUYq96e
         IsNxObUHqkcVkzSJM+sg+NtKaa7b4SxyC1/i8voGv7GDeCApBd12VY+NUmdvNXn3EVcU
         NercAKKrONxgUJetuGfmvQnIzbYgXWgawWRu2Pm9OOy5bw5aOeO/YrYppAXRS4okSHzg
         /B00IqjDsFL7OSQqw6rWVuLyddk3duXdNt075YOQh9NYu6Wa/XhVKLfB+NOtpVjWO+Gg
         d/wQjO298/WcGJmABbtOoU29QmhdXDjU1CET7U5dHIRKOXZrmr3k1jaTvdXRvL1aiRYl
         k3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530162; x=1747134962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZCwgOWOOCWTlbTNg+Glm3yWO7Px7uzRJr4qQIo37HE=;
        b=EqqtISt7s950tW8o+YGDO4uoDWoFaOfojkBpZZolLh32ImL9i2xCZ4VYGNa+zC2ttN
         NFlrkgYqQoUWwLRA0zRnSL17CoPvv12JtVY3sr6gk1BJM/Asy/T1iCGfza97HIM0RKkz
         JdPwBQ6/zSMABm0bet/gOHd3E0cREG8RT956EmTk0Q7ZQ2nqWYZ1PUM69+2k1v0mW+QZ
         H+fnxFwcmd8ELZGfO1+Y/czQhNbyyTIRpPDYbWD0F81Woc0ZmBs84svLhG3YXiSJ1GU2
         /dxBHx+ogwCSm1747NRi8Q+3yucT29GjHX7P9aaqlPG8ZE2b8EyU5iFvbY0GBhJkVIvB
         TP1g==
X-Forwarded-Encrypted: i=1; AJvYcCVF6B33BUSSQ4gne/N/L0NWpY135yX0BRPZTM3SDAU0JmPK4NmISd5xxdHAuZRXhXYfrdv2XNuGEFBaWwDZ1Vg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBojZBgdCUy8JRPvTLKZDsBrvnVOMiYztaWT0TPc5fXwf4O1B/
	FyHOf4UOk6cY9WgghYBAuy6Umqoda2C04jtRJBGxbXGmIHRV6l6SKTjoe/eLS2Q=
X-Gm-Gg: ASbGncu6YLxC9Q6+iJPryC5AnzgRoRIp9v/R2tFhnFp9KQ56O8gCbKwa78jKkvhUJi8
	kq2hzgolLR5UlrAJNGOrfmaeZTplLg4AGvfNpyXtHkwtZNjF8g8ElXMhSpURR6/RsMdlBWuOgjz
	dyfCmmv8LCc4K3xjY9BonTFIW4YpMKsaRNgBK/mSwU9XADw/9kguYdviZILJjs2cQweslXdypmP
	yq6djO3K5MDMdyhwmCxRQ9GHmeSLx0MKawdEHatdOV+EZNmmi2ovNOeU7UBpZxobBfITPE7iYT8
	tgj9Vq6996g+VJpvMlbm7XJlzYLaRuHswsOmY13Z9xrkOP1r3efE62E3
X-Google-Smtp-Source: AGHT+IEb/FzHjC2BdixzCZvpPpVp5jderqE1DM9mJQuUaUitas1wO3yPRwuVgog0ub9hO25i19Te4w==
X-Received: by 2002:a05:600c:4ec6:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-441c48dc0a1mr103108985e9.16.1746530162207;
        Tue, 06 May 2025 04:16:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a286b9sm164637705e9.28.2025.05.06.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:16:01 -0700 (PDT)
Date: Tue, 6 May 2025 14:15:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] mtd: rawnand: loongson1: Fix error code in
 ls1x_nand_dma_transfer()
Message-ID: <aBnvbYaE-tud_o0x@stanley.mountain>
References: <aBSEwag_ducqOwy7@stanley.mountain>
 <CAJhJPsUZz2kwMyWPDrc_ktb5O6ECcAyO1OrXXVWh9yvkrKRidg@mail.gmail.com>
 <aBnXPYLSNJASR51f@stanley.mountain>
 <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJhJPsX2-Q+Yq86_Vdyxe-_SVR0j1e5buE8Yw+RbJgp6Kadh8Q@mail.gmail.com>

On Tue, May 06, 2025 at 06:01:15PM +0800, Keguang Zhang wrote:
> On Tue, May 6, 2025 at 5:32 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, May 06, 2025 at 05:16:03PM +0800, Keguang Zhang wrote:
> > > On Fri, May 2, 2025 at 4:39 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > The "desc" variable is NULL and PTR_ERR(NULL) is zero/success.  Return
> > > > a negative error code instead.
> > > >
> > > > Fixes: d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller Driver")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > ---
> > > > It's hard to know what the patch prefix should be here.  Ideally when we
> > > > add a new driver we would use the patch prefix for the driver.
> > > >
> > > > Tired: subsystem: Add driver XXX
> > > > Wired: subsystem: XXX: Add driver for XXX
> > > >
> > > >  drivers/mtd/nand/raw/loongson1-nand-controller.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/mtd/nand/raw/loongson1-nand-controller.c b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > index 6a369b1c7d86..8754bb4f8b56 100644
> > > > --- a/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > +++ b/drivers/mtd/nand/raw/loongson1-nand-controller.c
> > > > @@ -371,7 +371,7 @@ static int ls1x_nand_dma_transfer(struct ls1x_nand_host *host, struct ls1x_nand_
> > > >         desc = dmaengine_prep_slave_single(chan, dma_addr, op->len, xfer_dir, DMA_PREP_INTERRUPT);
> > > >         if (!desc) {
> > > >                 dev_err(dev, "failed to prepare DMA descriptor\n");
> > > > -               ret = PTR_ERR(desc);
> > > > +               ret = -ENOMEM;
> > >
> > > Thank you for fixing this issue.
> > > However, I believe -EIO is more appropriate than -ENOMEM, since
> > > dmaengine_prep_slave_single() can return errors other than -ENOMEM.
> > >
> >
> > It's not an I/O error so -EIO isn't correct.
> >
> > There are a bunch of reasons it could fail but most likely
> > dma_pool_alloc() failed.  I think -ENOMEM is correct.
> >
> 
> Have you reviewed the implementation of ls1x_dma_prep_slave_sg()?

The ls1x_dma_prep_slave_sg() has basically two error cases, buggy drivers
and allocation errors.  Someone could argue that if people pass invalid
data then the correct return is -EINVAL but in these cases it's a buggy
driver and we fix bugs, we don't work around them.  So the correct
return is -ENOMEM.

> Errors in this function can be caused not only by -ENOMEM, but also by -EINVAL.
> Moreover, in most cases, the error handling logic for
> dmaengine_prep_slave_single() returns -EIO when the function returns
> NULL.

There are some that return -EIO but hardly the majority.  Other places
return -ENOMEM or -EINVAL.  It's not worth going back and fixing all of
these but really -ENOMEM is the correct return.

regards,
dan carpenter

