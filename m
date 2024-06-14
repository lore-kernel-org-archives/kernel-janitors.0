Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324E1A2547
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718391131; cv=none; b=NqgnnasluxVmgrUnt8VeE/Pg5Ts9q+fsDg6/GxxstN3UH6BbdjuhLR+F7JGmdjR1TYcl3TYqlLgAZULytuitO5DyhkbIKLVKMgULRrDog+1+WX8BkHtszVNn5Stl7euukB87OEB8XWm0QYlBP3CdILzqQPV7iwGeGXOuaMt8LCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718391131; c=relaxed/simple;
	bh=Wnop8Qq538e7eVgLq4rlSTIJC3zohtdzZO1W1QS3zjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfhN4m9TDB+X3tnNC93zWQKuOke3SG7yrFO9ZuDzZIa6DjiJZuDjqpJh+0Bj2Xl7jJDBI3qxkhAFP3IQdC4faFT+QRTChot+PWIoCeuwtZofbGYME0VUvt+f5OavSwIYZFFdDepidWb7l+v6aserAB286v36ssWGDos8NP8gV4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=f4+ZqOpx; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="f4+ZqOpx"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d2255f84e9so1581066b6e.0
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1718391127; x=1718995927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVDBvdP08HJe2LLNeEFHiRk2XhY0KePdWqVaxMDbvKE=;
        b=f4+ZqOpxDlaOGx/uXxzo+JBV3c2J+GdTOHq0+3o/5hHOeiEIA3IMlgKm9Hvu7Y+4Pn
         HKoQYCiCJj7/mPtUf5e1lapZ3Stw453sOUQmF43/uKKN/vqrX+TshpH6rxDd1KQ7zN2x
         EOGzifnTP+0JdNPUnf5sv5ffBAXf+KbzaJ50jCN1lv55KQLh1VB3OSuyCN2R/iUEZ93O
         kN87c9B6b1nv3WH2i50U1tVXOQocVi+ftsmta9MD6vSkoz9WLR2+IMxCgtyhL0oFYjuH
         4IXpXhNh5eLnMGKUUHtWmSji8+VhyIHzRXeUaHP7L6izMP2mjkzQB0iZCBBCyH6gicic
         y6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718391127; x=1718995927;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVDBvdP08HJe2LLNeEFHiRk2XhY0KePdWqVaxMDbvKE=;
        b=aLFCbnnruhFB+TfnZGeMM3nsfbu0aqz6GltH/pR3TExoO/MPgECr/HhqFCthhGC5Ml
         ea7fbMxX4MOj4BTxH50qG/ixtLrjHpPPzpByECQjNuFW4x49wFq3o8MqFXtAXaNunbsm
         NVFiqBlnvdee8nJeVAtT456auXN3kTC2xVeyrU2GHn4abQThoZ+5B/NHUUVKJoeHo0+O
         WGyC2ajKv1dsa0iFRGds5UR2MlQLwSXUhLnc4cgbS0uW0p5EYmm1AvxgY/TRwyRi0ii0
         tU6Zn0mEHguWCfQcQE99qF5n6+/tOhtwOO03cck1GUzRM456rNMgf7HAtbVYdTnnccmV
         g/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUn4faiLD7OlCx+yf67uFQAWDmY7uPjJOp3I9I19Bol+ox77+9WkQIpfCkHCgawq+Km4PvyKhs6YwepfqMruYGrHJrp8CaX305HK9sUTtxt
X-Gm-Message-State: AOJu0Yyu1X/1GKK0nzypoNiA/JPf0VVI+yczzVbpMuFXNEN3tNX530wE
	6jHMTF/r5iC2WvuZj940HjbYoFCYrNl3jm4gQGsjmo2feXxVecf3CwEFJRbgBrc=
X-Google-Smtp-Source: AGHT+IH5wsewHDu4BXzms8+/hfuFuKIa/9eeUhy5xDV/FWcrmW7WzNgNCo/H/BIyrLMqqglhgTp+DQ==
X-Received: by 2002:a05:6808:11d0:b0:3d1:d36b:379e with SMTP id 5614622812f47-3d244f362e9mr3226002b6e.26.1718391127297;
        Fri, 14 Jun 2024 11:52:07 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:c3a8:c961:e73:5e22])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2476bb36fsm618151b6e.40.2024.06.14.11.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 11:52:06 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:52:05 -0500
From: Corey Minyard <corey@minyard.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Quan Nguyen <quan@os.amperecomputing.com>,
	Corey Minyard <minyard@acm.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi: ssif_bmc: prevent integer overflow on 32bit systems
Message-ID: <ZmyRVQzcIbDwgnP9@mail.minyard.net>
Reply-To: corey@minyard.net
References: <1431ca2e-4e9c-4520-bfc0-6879313c30e9@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1431ca2e-4e9c-4520-bfc0-6879313c30e9@moroto.mountain>

On Fri, Jun 14, 2024 at 08:30:44PM +0300, Dan Carpenter wrote:
> There are actually two bugs here.  First, we need to ensure that count
> is at least sizeof(u32) or msg.len will be uninitialized data.
> 
> The "msg.len" variable is a u32 that comes from the user.  On 32bit
> systems the "sizeof_field(struct ipmi_ssif_msg, len) + msg.len"
> addition can overflow if "msg.len" is greater than U32_MAX - 4.
> 
> Valid lengths for "msg.len" are 1-254.  Add a check for that to
> prevent the integer overflow.

Thanks, this is in my tree.

-corey

> 
> Fixes: dd2bc5cc9e25 ("ipmi: ssif_bmc: Add SSIF BMC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/char/ipmi/ssif_bmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> ---
>  drivers/char/ipmi/ssif_bmc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> index 56346fb32872..ab4e87a99f08 100644
> --- a/drivers/char/ipmi/ssif_bmc.c
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -177,13 +177,15 @@ static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t
>  	unsigned long flags;
>  	ssize_t ret;
>  
> -	if (count > sizeof(struct ipmi_ssif_msg))
> +	if (count < sizeof(msg.len) ||
> +	    count > sizeof(struct ipmi_ssif_msg))
>  		return -EINVAL;
>  
>  	if (copy_from_user(&msg, buf, count))
>  		return -EFAULT;
>  
> -	if (!msg.len || count < sizeof_field(struct ipmi_ssif_msg, len) + msg.len)
> +	if (!msg.len || msg.len > IPMI_SSIF_PAYLOAD_MAX ||
> +	    count < sizeof_field(struct ipmi_ssif_msg, len) + msg.len)
>  		return -EINVAL;
>  
>  	spin_lock_irqsave(&ssif_bmc->lock, flags);
> -- 
> 2.43.0
> 
