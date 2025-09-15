Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF261FA178
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Sep 2025 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934727; cv=none; b=nkhDbTUMkvFpMWPpcm2vfSUsXBQoNo21EGdWVYVPY4rERG23RSFt+LFS7/DWDOJXdDIQlbNQvHmwiwJ0NIHR1J3I3NyWIN1Y+Q4i0RKwQLGFB2hip2POgfN0f/3ggSLgKiCPzVX8mVI8zhGwZqjBGQWL0WxPJW3hcPiP90pIhPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934727; c=relaxed/simple;
	bh=gDuk4GIitaqY85XZ1LRd0lc1m7wpqbst8TMHKLHdrZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moVPj8BsDTHxrdVatnHHMfeTU7l5Nv/ivzXxutgrKdkvc+750WFabseVBWqrULSHyu4LZ+tcgQ9+mPqX777mjcrsHG482d3MT+OVbC8+/UHdrhLO64Kqp/4p1fUW1j3sQml1TOJYzUwlBHmEBLxwCNnwEkU8KU109EUcluFTnXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAdHyVCj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAdHyVCj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso24663825e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 15 Sep 2025 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757934724; x=1758539524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=badnNnqIsXkPn2EvMp9u+z86UbkTv8uQkG/3+BUdjvA=;
        b=QAdHyVCjZdpq3WAg7QCnql6PAfsQbk8Dhhsdh4D8VLYMnyb03EVVG04+OWQwxJLvQG
         UQOjDwsZZWFa5ebxusbmWs8fH9TrXpGTvI8je9qTIHzAQnyUv9UyiHerHv5Hm43maekj
         QWZ4F5blcz0XJo6lihsoh0gPc27uKJxnGQR92mPyhRP52uFZQKAXz+fj6j0fd5q8D50H
         csEnQu3AsayOqCNKbnqWzev/YGIBwhK7Z2c8kBf/y5vO+meW0kK9URE+BkXyaodv5Flw
         8RFYgVhPUNmcA7SwXh9HUAOVw3Bvs/cHd/jgw0ApYh+meSPhzV6aUbT0gDyti0yYm2xe
         39nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934724; x=1758539524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=badnNnqIsXkPn2EvMp9u+z86UbkTv8uQkG/3+BUdjvA=;
        b=oHOdIIGGIYgbTxDjA4jGvY62DPIzvwEZDcGtxHmxLsVEXte0CFfPwbiKLvrPST6mOz
         NGs371ZLZa6iNphg2Jp+ih+LEY20V756aOZYlKlTqye5aHC9YdNUsL16czqrp6/rXJ+t
         l4cT96ua2uIwwrpmpDlVyQqKbjGBjiDyuPHTmKRt91sr304J5qy8v1XIH7hnugr7r3cH
         AOEGcECzQCspUOVEdNoHTfA1D4NiRCdxE8TUTOLcmLNF1+zFCphUuQoUf6rWdtJb2Ih4
         PaHNx+wvAAnm8YpL5l3oBn8G5/j1aRAVnn/Y4xCvBc54ckcDQeF+p1/CvCTevEycPmoF
         V3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/NWh5t9GXlpKSS8RsBk+CPrguS/blKzh9AKgmTyUnhzg4GbUaQjE0Y9G19GT81NaHGZaY7Pdl0N1isLz1ACQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnVGxe52ztE+koOgr3pwHWV6WwRsAnV5zLl8BOv5V7gt8A7ICM
	BVoZLIeCevZeCHSAe8B2Sh4OEu+j1FlLxSWlJrNMkewkjzYVekv5RNP859VhgJFaPI8=
X-Gm-Gg: ASbGncuUbsekt/Ljbfll3x/0+/kAHEzMm60QUnhrLrt62nYCN27TDYZhtk4eL8jRrUd
	d+SQ6CsNBnaDNGtucRwI/j6PoZ/ee3siL7vywMODmY1BIQIlK7ojjoDBbaUaq3HtJY806OUJnGw
	5D2Vb+ZYAAw49+Q9TO6hPQA28YkE9V9zZLpjUqiCACRXHeM0pCNFux+fhqwK8xWeD8i9U3wzaVY
	P8a8GUSGh70QQcbmxHvs1XWrm0UgUgDUjcbL44fymhs24oYUpDt0R0WImOefYzfncnDZouujq+d
	Cc0d9tIg0CylSE1jcsSVpG5poIteSIcUkaQuI6iQKh0qeEAw3s6E4x8sTHgBHgotV/m+PSavWYR
	F2lUwH6YP3ujTLWrDPlnrYs5pLxBlseU0CMLijQ==
X-Google-Smtp-Source: AGHT+IGm63UEHY4s1jwbRi4GCTY1XYfJ6+b0wYpsutPmJZyaFuGMrawbriAbxQunREyvB8TmP6296Q==
X-Received: by 2002:a05:600c:1c0e:b0:45f:2870:222e with SMTP id 5b1f17b1804b1-45f2a023010mr42132565e9.26.1757934724348;
        Mon, 15 Sep 2025 04:12:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037d62besm171722925e9.21.2025.09.15.04.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:12:03 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:12:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/xe: Fix a NULL vs IS_ERR() in
 xe_vm_add_compute_exec_queue()
Message-ID: <aMf0gA6Zyj3PpgZn@stanley.mountain>
References: <aJTMBdX97cof_009@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJTMBdX97cof_009@stanley.mountain>

Ping?

regards,
dan carpenter

On Thu, Aug 07, 2025 at 06:53:41PM +0300, Dan Carpenter wrote:
> The xe_preempt_fence_create() function returns error pointers.  It
> never returns NULL.  Update the error checking to match.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..5c58c6d99dce 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -240,8 +240,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  
>  	pfence = xe_preempt_fence_create(q, q->lr.context,
>  					 ++q->lr.seqno);
> -	if (!pfence) {
> -		err = -ENOMEM;
> +	if (IS_ERR(pfence)) {
> +		err = PTR_ERR(pfence);
>  		goto out_fini;
>  	}
>  
> -- 
> 2.47.2
