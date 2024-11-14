Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A526D1632DE
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574674; cv=none; b=E+Oa4ZzICpkEA7oZgsZ6kbfqst7ApIzGl7WtaaDIzHu0h22bG+pTGxHGpz0lfWQ5TOy8zrC6TeUJ0mtgNTx/pj5cbT9zxsrMqJnn1mZUUaI/xSdCPGDdjuWhJ2NruKRwitP/D2h3NGdJgc1nHxUI1HIxS67illrKROqHwJVyOQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574674; c=relaxed/simple;
	bh=rwLTIjTp1zdqDObkdY+d+liJFZYYxTRT5NDlHebd/78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQ3hSlPwTewFlbbpe6+oiuP2ieuGqRrtmpdgduBCzXytWlhP+w0oSR2DTm5fz9PFsFEQBKImU7mxShINRSTVSMXIGZ38i+nMDhNLRkrXptaVvLHeGPqGdhVqbb/qfAokdlXyO7wRro1EVudvIR8qrMjyEIxhZXaAPUtZ+eOu0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bfxawefe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bfxawefe"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cf04f75e1aso520262a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 00:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731574671; x=1732179471; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbQDz8bnzrpIu+TOHQPeiD1K6+1spFdelZENd64veIQ=;
        b=bfxawefeF30w9s1W7pRUK/qIJVAq05mkWYpwHirM3jPRa/QQ7l1iMhO3fGlQ48xUIc
         j54EM+ONN830Frw3Rq/adKAgo15mNtQu821YSX7RI1GuLxsAXAxh/JcIJITGiKjfiTrQ
         fY7tza8b1J7ntonSJSfzNPDCg1DUmueG0VJR1Wa+0C8r/ce/Lc9xLD07gNV91TauG9P5
         uJiqm/vNAMFKdZnWBzOSXs7gT4G9B1SvAKoon5Ko60O9UnPwP7SBO9A3igwPDfKf8aTN
         xrskXxTSxIRWiX+iuxLL53BG6JqeFOlFb0gQUvW4Nee0+4as6Eeb2wRyupG73GGmzUut
         RYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574671; x=1732179471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbQDz8bnzrpIu+TOHQPeiD1K6+1spFdelZENd64veIQ=;
        b=K+lY4G95/NsPQxs/m2Y+nVB2BG0YkzPgssaYALy40eW5eLzreSxzee9YvZ9V6BrPRa
         09Aavfgg8W6aIaXOaIjLi2B9C7kjE+FaGVchU5x7tO2eFM1dVdKgPZRpF2T1tlRDoS1Z
         L1qhE8s2a5fucQFCBpapi/YqtpnVtunfCZPsYwWt7ONGW3jzbAAcX/gK1wB6zX86FOt0
         nlPp9D4u9so/cJlp12L5Dy6h8roW/HH4aRHiCFAkYabFNrGz6838qRjKijBwoCafvl72
         dRKw0CiKslm7bsre4/74Iw2b5CCuK1NvB0tlmW+MXAbt2UoiBTwfWwX9jOINmUEdttaA
         9oCA==
X-Forwarded-Encrypted: i=1; AJvYcCXpoVYAvahPouDcdVJoPBh3u/wSIgeZFv+ipuqxbEq4xobk1qBIBzqVqBwjVXTDlN8XaoR193mRQ6wijQ3qazQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKeLpwiwFH7LVpaYBMuopqZdmkOWsaH29xHZj46ONQV3rBiebc
	IXiH0QUdnPu9NLiTPQxHnL+cHfMBKdGBW3MPOJMIGLH31PwPC1ZmLr4L6FuB9YU=
X-Google-Smtp-Source: AGHT+IF+lgQLdO4dE5if0pVOm/wKl9mRYOB+40nEsOkzxOGa7AvqMKFsDRtr86qysSD1D/s8l9jt6Q==
X-Received: by 2002:a05:6402:2355:b0:5c9:8a75:a707 with SMTP id 4fb4d7f45d1cf-5cf0a306754mr17336067a12.2.1731574670997;
        Thu, 14 Nov 2024 00:57:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79c0ad33sm355356a12.65.2024.11.14.00.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 00:57:50 -0800 (PST)
Date: Thu, 14 Nov 2024 11:57:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: stuyoder@gmail.com, laurentiu.tudor@nxp.com, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc:  Fix the double free in fsl_mc_device_add()
Message-ID: <b767348e-d89c-416e-acea-1ebbff3bea20@stanley.mountain>
References: <20241114082751.3475110-1-suhui@nfschina.com>
 <656ca826-cb81-4b46-8e15-ec0b1044db8d@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <656ca826-cb81-4b46-8e15-ec0b1044db8d@stanley.mountain>

On Thu, Nov 14, 2024 at 11:41:25AM +0300, Dan Carpenter wrote:
> On Thu, Nov 14, 2024 at 04:27:52PM +0800, Su Hui wrote:
> > Clang static checker(scan-build) warning：
> > drivers/bus/fsl-mc/fsl-mc-bus.c: line 909, column 2
> > Attempt to free released memory.
> > 
> > When 'obj_desc->type' == "dprc" and begin to free 'mc_bus' and 'mc_dev',
> > there is a double free problem because of 'mc_dev = &mc_bus->mc_dev'.
> > Add a judgment to fix this problem.
> > 
> > Fixes: a042fbed0290 ("staging: fsl-mc: simplify couple of deallocations")
> > Signed-off-by: Su Hui <suhui@nfschina.com>
> > ---
> >  drivers/bus/fsl-mc/fsl-mc-bus.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > index 930d8a3ba722..8d2d5d3cc782 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> > +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> > @@ -905,8 +905,10 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
> >  
> >  error_cleanup_dev:
> >  	kfree(mc_dev->regions);
> > -	kfree(mc_bus);
> > -	kfree(mc_dev);
> > +	if (strcmp(mc_dev->obj_desc.type, "dprc") == 0)
> 
> This works, but it would probably be nicer to write this as:
> 
> 	if (is_fsl_mc_bus_dprc(mc_dev))
> 		kfree(mc_bus);
> 	else
> 		kfree(mc_dev);
> 
> That way it would match the release function.

   820          mc_dev->dev.release = fsl_mc_device_release;

	[ snip ]

   891           * The device-specific probe callback will get invoked by device_add()
   892           */
   893          error = device_add(&mc_dev->dev);
   894          if (error < 0) {
   895                  dev_err(parent_dev,
   896                          "device_add() failed for device %s: %d\n",
   897                          dev_name(&mc_dev->dev), error);
   898                  goto error_cleanup_dev;

I don't think this goto is correct.  I think fsl_mc_device_release() will be
called automaticall on this path so the goto is a double free.

   899          }
   900  
   901          dev_dbg(parent_dev, "added %s\n", dev_name(&mc_dev->dev));
   902  
   903          *new_mc_dev = mc_dev;
   904          return 0;
   905  
   906  error_cleanup_dev:
   907          kfree(mc_dev->regions);
   908          if (is_fsl_mc_bus_dprc(mc_dev))
   909                  kfree(mc_bus);
   910          else
   911                  kfree(mc_dev);
   912  
   913          return error;
   914  }

regards,
dan carpenter

