Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040A32E7F14
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Nov 2025 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971006; cv=none; b=IzQP6MRldCSsUlsbfwwM8eZaIMxLbD86ZeYSjDFIxIc/kPhD6F59VtO9R6rbiOWAuiIhw6+roGIMXQg6JwcdgmFT85eiTmHVsS30rD3hmhe4ebVa5iawtPdsbMmddCJgTmcCDzGvqyhC/pnVid22h5eRNd3y3JWscbnz2bOR8/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971006; c=relaxed/simple;
	bh=VlZWtSFMMXDvDtQwf/kOcJDDl+uZNgmUwtroal7tsrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qPCEOF5TYaw1qKOo3Oe6NpAI7yXeYmiXGNzqG2V6oFaLr73AvGu4l6YxQLejOjDXg9aTfIUGnGeRjbd31PD472sG2XT9j9PWp9RkPu/eGbkVwgdBj32UKAYLhe8E1wu6SivZnS6syIGy4zGfskg48S2s6+F8avenCa12N5Uerlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ngVJcCRI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ngVJcCRI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so25296065e9.0
        for <kernel-janitors@vger.kernel.org>; Sun, 23 Nov 2025 23:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763971003; x=1764575803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MLyA0fRsf5dKzM98MfbHJtyFqg51bHHkO/nryJa4EvE=;
        b=ngVJcCRIYehpB9CQlE2kVMgBc4eKU0PbvzTYmMOpRXMCvXruTYc2mPXxT5cbcAtWxy
         NinnXSY4B5tGNaEjg8T+XxaTZ843ND4X0dl3UURmytIHbXOXitzJd0bBnDl5EJkZHtBq
         F+Jjie9LSQb05R88pvKK8vq/RJdVbJrDICL/XOpjoq7srYFQfd6Ckix1ib67bZie+eOl
         Iqczko9N3kakiNUHnxdf9KFHfx8kbXcWN3E5ydZWyXZ9aa9gfO1AffFPn8Ee0w/s3V4j
         NBLbiRD2fCBb49NyU/+wgnmysSyzLJqyfRfXQb1wpseNLJp6BUA9LcNH2v7agXCE4pwI
         NrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971003; x=1764575803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLyA0fRsf5dKzM98MfbHJtyFqg51bHHkO/nryJa4EvE=;
        b=KLDE7K9WqMOUWadJlea2jXWnW8+mCQZcDajrblhBOcSANkYyhlU4ggn5nz+Z5coeH7
         cO/tunNVcs3QmWSTdCDGMCn1oBWlAwido3JeGbUUPhrO1UK+sVfGB7EdMsUkImiqFQxF
         YcUPtPnilOgbLoXC4hdYqW1ibuG8Lzcy6JUhxYDNteVLfEHwoy2kP7Iamw9D8lWDNQKY
         eKfkOYqaZB2n3vJfWZ9SFD+UtQJ8GsAAx6d38qP9zr3fxtYQ8J+ZjdcK6mAx/fzHJv1t
         /wUv1Faw9IO68QBARN+9fNAA5RjR+URtlzYNuka+sQv8ynT/gWQUSvBv8A0Mv+mPQR4P
         KfAg==
X-Forwarded-Encrypted: i=1; AJvYcCU5sAB1AeaRTeVzqwKftMnUAY6tKHXTYawgtJrIsUI5nEcxhVqjfGJLw8kuuUWHAKc04Ge+wHStXgGpQKwfWzA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5caB8BjFkWG/4jZKuU4eNSWuWmulkqsBc61hRxx1tmkmJyG8x
	TyvuFc11JZxPxf0N5+WJMFYMpffbnSYNP/fpn+CJKd3n4RBdHl9e6rF48uBXdAl02BI=
X-Gm-Gg: ASbGncs8/MeC06fb/GlsDLuvNI2sIbifwQGAahjurWyYGTEVXcY4DtsmIoqg9vRzB6g
	82GT+x2PylIfkp969xYl3bwaJqviItXVvoGywYv1ANMPyN2a0TuKy9FzwkzebLhMnKzkjB1ft1c
	RHFU1CORRGUiHV9sT2buRbL7VwSyWsVHz3mvLlk309p+wZbImOZgbq+GuQTOqpck1kmu5Ka+Dll
	TkCqt49/JDqTCCq/z+vVTiPLD4yASeEYGbnZdLfTXwvzcqUJZYX7XiehyITTW9NcHKokZe2oMYQ
	ZDEIam9IFi0axvashdWfxfZhzx0MrWbgCPsevJb5v048wA3gf1IHh6lZQMhuWrq/TSfP93gKT1Q
	vgenrdwKkySJE+uPpsKfBFqavqIksXq7cWiTEbqLxADVQnIhqVlV7RvIQzbhjVw65DkRloKeVGT
	ajBvm+ye3LOMlH7bQA
X-Google-Smtp-Source: AGHT+IHqB3xz9lcENVWCMvF8eQLj++2dyZ7qTY6KZB1gR5ZIqnYr04jVw2A6AhKpseHTB5WdRevx3A==
X-Received: by 2002:a05:600c:19d4:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-477c112635amr93678845e9.27.1763971003315;
        Sun, 23 Nov 2025 23:56:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf355af6sm182115855e9.3.2025.11.23.23.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 23:56:42 -0800 (PST)
Date: Mon, 24 Nov 2025 10:56:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] spi: Fix potential uninitialized variable in probe()
Message-ID: <aSQPto0zcTniM85G@stanley.mountain>
References: <aSBqhdjiywXq2Aso@stanley.mountain>
 <cd3dc38e-72f6-4e83-a67f-266523e686f1@sirena.org.uk>
 <20251121-apostle-stark-7af8aebfe9c1@spud>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-apostle-stark-7af8aebfe9c1@spud>

On Fri, Nov 21, 2025 at 04:20:41PM +0000, Conor Dooley wrote:
> On Fri, Nov 21, 2025 at 02:18:49PM +0000, Mark Brown wrote:
> > On Fri, Nov 21, 2025 at 04:35:01PM +0300, Dan Carpenter wrote:
> > > If the device tree is messed up, then potentially the "protocol" string
> > > could potentially be uninitialized.  Add a check to prevent that.
> > > 
> > > Fixes: 059f545832be ("spi: add support for microchip "soft" spi controller")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/spi/spi-microchip-core-spi.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/spi/spi-microchip-core-spi.c b/drivers/spi/spi-microchip-core-spi.c
> > > index b8738190cdcb..e65036cc62f3 100644
> > > --- a/drivers/spi/spi-microchip-core-spi.c
> > > +++ b/drivers/spi/spi-microchip-core-spi.c
> > > @@ -320,6 +320,8 @@ static int mchp_corespi_probe(struct platform_device *pdev)
> > >  	 */
> > >  	ret = of_property_read_string(pdev->dev.of_node, "microchip,protocol-configuration",
> > >  				      &protocol);
> > > +	if (ret)
> > > +		return ret;
> > >  	if (strcmp(protocol, "motorola") != 0)
> > >  		return dev_err_probe(&pdev->dev, -EINVAL,
> > >  				     "CoreSPI: protocol '%s' not supported by this driver\n",
> > 
> > This should probably also complain about not being able to get the
> > property, otherwise nobody is going to be able to figure out what's
> > wrong if we actually hit the error case.
> 
> The one thing to be careful of is that the property has a default, so
> EINVAL needs to be treated differently, so the decision tree is
> something like:
> if (ret == _EINVAL)
> 	<do nothing>
> else if (ret)
> 	abort complaining about malformed
> else if (!motorola)
> 	abort complaining about unsupported mode
> else
> 	<do nothing>
> 
> obviously that can just become two clauses, but you get the idea.

Sure.  I've sent a v2 which defaults to motorola.

regards,
dan carpenter
