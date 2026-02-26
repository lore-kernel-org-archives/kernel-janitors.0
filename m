Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3AB392C2F
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Feb 2026 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772092932; cv=none; b=AC4emK3pLeS8tb1nI1CrTPQ3lsu4fe2+ULjdKcg7w3Yjgfsto4PQFszm2IScT/dQEaiO/mdjWwMga7SWvLoBNMb/VxQErfBZxakKjo9+Y24ksbQJv6YFP24t7QVvXs+tNpszsWVehoNdNyAYOR3VphxbxLR+IOM3ZoQy6q23WiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772092932; c=relaxed/simple;
	bh=psYWwKUvm0boCnP/VBokoXXzODe+2v77zcC70+9bdVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/982RsXPxWkI2aucUkuSX/ANZqOhVP2ShwgCLkZ5CAfHSFzdB7f/5jgUmuOmAveXDprFU+ORdjshXUaC78TPgn3Dh8d9s2WQ808c8DCZSkm7E7u9r+vgqao0UarfCfOjwXzDr6F6hcjs5xtK3NIqbOmY983TduyQxpnASrgPiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pWeDcwtH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pWeDcwtH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4398dd671daso569870f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Feb 2026 00:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772092929; x=1772697729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jLAiq0vc9Bp5MrzPDt1hlssSl6Q9GvdlXHn67lqmMxA=;
        b=pWeDcwtH/SyTRxn/gel4iQdgnwFWvs5yJ/2OOLRnMxf4DhoDBWrdrLaEUQAUdIfCCg
         dHdlqwvKZFBHEeRcAuBl7UKY5quebtTrvyqdj4mmm0XpFjWMm6sKF3wvSSUCuRUXtYGl
         tppbX2ixmydtaw7utT039N2BdU79iLrPrbr3JbtRjTXU6qh8jWXQ8nP5edo3WgsumjTI
         GMT3M4042PYVjNxftpvxsyVeNkvuWW3NXM2uqGRXJ88qNjMlL7vkK8OZH5kbx3dKtdju
         PAmL88vzpd4Ov1N7UFGIYt076MA71ThtUdaIulRB53bQ0zChNlcDM8A2cGwnJodMpygx
         vt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092929; x=1772697729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLAiq0vc9Bp5MrzPDt1hlssSl6Q9GvdlXHn67lqmMxA=;
        b=gYNeFf7Qpg6R1DQSPEM12nER9uMvx76WqRQOf34Y1bRl+CHdl1MZu9UKWIxKnH/Wrz
         f/R3xIQ3xoygdI3Oy4hAp1L2ElMtMVq31cMRsHdZa7u528QIzUw1+mS3ioQ3/Ttewr/y
         jgs/WuBjTDmey+gchH1n9qBAWSEErIhctXr/djZRu2Gicr3LbcdzCfFW+/1h5FPClhGz
         G4mloEgTebkCLeRB5iUTgFVAOWNeZ1mPdK8sLGcslIAsrTHY7RJywmllD5eTYmllLvWy
         QKiqmpbn+KQFD2yy6bJxbZQ15Fom0u5gKAVZzy95mY+l19QPcy270mu0hXAsY3l7mKWH
         u8Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUEf4xCSZqltDM3GSPD+yfR+h1N/Wokk7z5UkvUC866hVyjmbmw8oI8VJ0M2VCUlXQyeUTQLztHzJTN/3MgXL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNIG0/8DZDIBZ6Kcw+qvgsiajhdWIWUmIvFQBHIHBH7+ApzY+r
	RtMv5ZqPFzgg3a5sLn4b6faaIDhAXEyVzrRZB3GajK9+OxKQ1OC75jEJ9ieH8IhT2W8=
X-Gm-Gg: ATEYQzyQA9BiKdBaeRL6OmtrZ77t9JVbnnEmFiFmR+cTLGlW6Hv2T7bkqcijZWz6ffG
	Sy5TXE5g+cwZKcQEDLl1HEPaPV6o0HnvrdcSB9WIvBU7SIixzTeBM5jGJHiHzUccKBrwFyRbusd
	4fbF/N1F3gkHsG3dXgH+QiM2f063gQJScX7bB8xy/jFoR+aJi3HmUbo3lsAb86KUrgwQgW5JJ6P
	VbzIURJ8BApnNT3m3NEgXNLLRIAyb/A2R7Ys6VV3PLRL9Ia6LCtkhGmXO99FX6F/TzglBKB2p8h
	qdf5CfWbatjkE0rYK7OV5ChdbLiwSMmhDtGf7+vBvvO9FvV0gSawbSR8ZxfsaVAh0HSk7+Z5BzM
	vjccRXhD9t4RUB+WtoOSgi40DgIEleW5yXY0uGt0SdEBjbUgu0VejJdyZEg32dJvqofmv4UdRu5
	GEMv+l+o5FGf6D7NnuSRNBgieXMyMA
X-Received: by 2002:a5d:588b:0:b0:439:9106:3bb3 with SMTP id ffacd0b85a97d-43997f469ccmr2397212f8f.59.1772092929269;
        Thu, 26 Feb 2026 00:02:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm40536977f8f.17.2026.02.26.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:02:08 -0800 (PST)
Date: Thu, 26 Feb 2026 11:02:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Cc: Sridhar Samudrala <sridhar.samudrala@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v2] net: core: failover: fix NULL pointer dereference
 in failover_slave_register()
Message-ID: <aZ_9_twriI6Z1oh7@stanley.mountain>
References: <20260226075737.8948-1-zeeshanahmad022019@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226075737.8948-1-zeeshanahmad022019@gmail.com>

On Thu, Feb 26, 2026 at 12:57:37PM +0500, Zeeshan Ahmad wrote:
> Smatch warns that 'fops' is dereferenced at line 69 without a NULL check.
> While other callbacks in this function properly check 'fops', the
> rx_handler registration does not.
> 
> If failover_get_bymac() returns a valid failover_dev but a NULL fops,
> the kernel will encounter a NULL pointer dereference when registering
> the rx_handler.
> 
> Following the pattern of other failover callers, add a WARN_ON_ONCE()
> to catch this misconfiguration. Abort the registration if fops is
> missing to prevent an inconsistent state where a slave is logically
> linked to a master but lacks a functional data path hook.
> 
> Fixes: 30c8bd5aa8b2 ("net: Introduce generic failover module")
> Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
> ---
> v2:
>  - Target 'net' tree as this is a bug fix.
>  - Change logic from an early return (v1) to WARN_ON_ONCE() and abort
>    registration to prevent inconsistent state, as discussed with
>    Simon Horman.
>  - Update commit message with detailed impact analysis.
> 
>  net/core/failover.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/core/failover.c b/net/core/failover.c
> index 2a140b3ea669..1702bb1feca1 100644
> --- a/net/core/failover.c
> +++ b/net/core/failover.c
> @@ -63,6 +63,9 @@ static int failover_slave_register(struct net_device *slave_dev)
>  	    fops->slave_pre_register(slave_dev, failover_dev))
           ^^^^^^^^^^^^^^^^^^^^^^^^^
>  		goto done;
>  
> +	if (WARN_ON_ONCE(!fops))
> +		goto done;


Move the NULL check in front of the fops->slave_pre_register() stuff and
delete the other later NULL checks.

regards,
dan carpenter

