Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AA41DE4FD
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Dec 2024 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218750; cv=none; b=cCZtBckhQKbGopz/2xZruZQp4/yb41dXty1vj0ZPbtp1kH8/Sv3lWaybtPOFIianBUFrSgJ3dE7yfqh2BIy5Yq26fNeYVCvGyp1nxVI4nmL9wDiiHUxsKyEEgc1wVNn4PXXMpx2vgqpIpRhRUElxVgsT+d3nFTWzax2zcuGGSBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218750; c=relaxed/simple;
	bh=f4yo24MCyvcNw5BjdCp4RT4JHWYru/YdElzMFQMZDkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XszsBSwM+X3bL7N+ODTR/XreJIEjGBw1VRXpbToPLQz5z748GRZuQjWtcUE5/1aAufz3xRk0k8dx+/Wjkk4g4u4ASgJ48NDXKqNzArsq6RHfDKyWkCC4IGRwANyRW7MvkaYRmJmyhOiSHOojOPgQkrePOhkPZaQkqv8bmxyFOao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y6xBdlZJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y6xBdlZJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434a766b475so48638325e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Dec 2024 01:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733218747; x=1733823547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kAfAbX2jpmVWuMhv4f3fZGpU5CJs4ntFjeUeVvna/QY=;
        b=y6xBdlZJDIxUvbRYDMQ3a0rvI04pw8wKHjWx+Sn+fwkgPJn9t5rClPcmRiln8vUCev
         BDTlovrblcX/vAZpPXlOi9ca72C8bCYZDILRjYPZ+OYi1XFOF5UhBnjjxo19D3iIvsyc
         k8rpKomDLIq1Tt8RqsQ9LF4lNtBfOod5E/M1yfLs+V+jdPZRHiEE7AHSSq8eL4a65RDu
         oKExQJk5pZRLpNpdp+/Jyl1T4zemAJpHCWFZ+/G9xXL9kl9Ul9vimkviYkZipVlgQVS+
         ZNN6+YSNsB/S8n8IML5GL9zWM0i0mLHGwjP3+jTjct1gG94M5EAsWfYYlmmHca649/9V
         JrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733218747; x=1733823547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAfAbX2jpmVWuMhv4f3fZGpU5CJs4ntFjeUeVvna/QY=;
        b=H3qSVFJ52GG6WjJStkQumvjo3+OSmCZapaaiqOVKsFZl1lkchMeJRrCrcDe6rv7d/l
         495ZnOMqMV5UAwfg0IjOGZfr9Dm1wuqcABQ5bQa2L3em/hXpGfTjKP28nL74Gq1QrOYv
         aumktRXuzYL9TLeBokQyzqU8FCf65N607yAWPNOfoSDEcvCNObZ72UWF7RRY4Qt3jLMj
         ylzDNqvmYbvIjepTbyWMQqpXZKRM2euAYCA1Y7S9UuzoUGp9D7ZY4gzHjRINqQvQYIqS
         QCo8fpMZSzVl+uhM0k/23s6dH8xUd9kNHFLP2argR4NNaINPKT4jezbLMubhZ7QcsVPj
         pgUA==
X-Forwarded-Encrypted: i=1; AJvYcCW5DKMIPAdKDvzd9eIFc2xL3dnUyu6bmpjM+bUGOxAulXHS4Uvp5KqoJcsw2xrA69C+A+00tb0H/hNh7H9Pikg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtbzJQN/naNaLs17pJ2yUvWHFlysILzKMVndwEFUOcVH0ZTa1O
	liW6FnkYu4kgoqLHgSGXe4qa9kHETQOVTmcv1xVxuJJ7IePAAUNHcl7TwNd9k1w=
X-Gm-Gg: ASbGncsfs0TTd/cylscf8kGEf7KPHjl65+IAY+vdCKrYRCqL85kzehPVJuAx6ypX6ul
	boBcWi1Ho0PUqrv0UPSkz6n9DBhg18lC5emrU19LdGU6fqaNjVE2O1D68lpvzNfjo9NLbptyA3s
	wOCEZMnTbgmNuF7yCfAQEoIHDdITzdU1Dq/xpCYlVHRGzQvd0/ZuaEs4V61sOLbSP9/J2Lcmy6U
	IhfjyKB3R52gJVq7REpDQsyMbel7En8M4MnReXphNnWL4E+xUjcpzA=
X-Google-Smtp-Source: AGHT+IFuW8hsbnPhok9NFkBE4GSNLWnfGNwEuWOJe5NvY0AGJzwDm00YwQeKFz6uXex+mAAN6s/h6g==
X-Received: by 2002:a05:600c:138a:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-434d09b1831mr16625405e9.3.1733218747389;
        Tue, 03 Dec 2024 01:39:07 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f32589sm186562195e9.28.2024.12.03.01.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:39:06 -0800 (PST)
Date: Tue, 3 Dec 2024 12:39:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Cc: Yevgeny Kliteynik <kliteyn@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Muhammad Sammar <muhammads@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net/mlx5: DR, prevent potential error pointer
 dereference
Message-ID: <bf47a26a-ec69-433b-9cf9-667f9bccbec1@stanley.mountain>
References: <aadb7736-c497-43db-a93a-4461d1426de4@stanley.mountain>
 <ad93dd90-671b-4c0e-8a96-9dab239a5d07@intel.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad93dd90-671b-4c0e-8a96-9dab239a5d07@intel.com>

On Tue, Dec 03, 2024 at 10:32:13AM +0100, Mateusz Polchlopek wrote:
> 
> 
> On 11/30/2024 11:01 AM, Dan Carpenter wrote:
> > The dr_domain_add_vport_cap() function genereally returns NULL on error
> 
> Typo. Should be "generally"
> 

Sure.

> > but sometimes we want it to return ERR_PTR(-EBUSY) so the caller can
> > retry.  The problem here is that "ret" can be either -EBUSY or -ENOMEM
> 
> Please remove unnecessary space.
> 

What are you talking about?

regards,
dan carpenter


