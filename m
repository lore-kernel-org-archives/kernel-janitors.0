Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993FE3F788E
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777384195; cv=none; b=HhVqB9MZX6KoRlh0GzGVGQlbMbvUFGdY7mbEn6ZGK/zl/Ji75ObAGgaUFhtGm5zY4qeWnDCoNXO7VXlIBNIRkKUPZhrOUWsHJU1aSYbNcOilEM3P6+/GcKkYK4QzjfKpxNu0o1aeCLepiBn1ylllJZmTZ6RYLfDMJXwY6yPCN08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777384195; c=relaxed/simple;
	bh=i+nKcGjkS/5Tczt523KayzkEsOUyVHbiSfY3f11u3hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2J+vKbo+e6fsGiivjcrAfmtf26BDNJhNpJN8q3uJtoQuKJRbN7TcJesQjsmk38bn4pC60TIii4aN40+e7dGKNmSONicFjXn21l/Gom9bFDvhdXxWZu2KG0JqGJ6qNt9+magy+G6U48lLQUycspiORUNX4OC+cJa1JRKWNoVcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pi5cKqt5; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pi5cKqt5"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so195701355e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Apr 2026 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777384193; x=1777988993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yMSrgBhN+mHfZpVt9bh3H6mTLY0wCmlOX7rIndgq/38=;
        b=pi5cKqt5VZ8OyWIWcOqAL4vWNV+C9+vbi7mV/wrjeeKIQnHC35ispLokP6YULp4fku
         vvEOg+H25XSVtwtW60Ox89K181iaxz1fyx2WDZYl5vKSWjBd13XGbU6ngp7Kmzm/o/ln
         15tizZCKOI2nAEn1pVo4c+KuOQ5XkLFm+pZY7GCHnuZWytnI8E6GSMa0YRNhsddDN+SS
         ZEmfK4OghiZOPOWiC816YeM3rcqh5lM7cWsKzz4ekGQRjknLJds6DTfe+OClK+xois0f
         NpgPSh/mlI5HBZsaV/grbUewvzQf6QKGWoZCvbCS+BaxD329jub02EXkcLFTjVuWiS03
         weLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384193; x=1777988993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMSrgBhN+mHfZpVt9bh3H6mTLY0wCmlOX7rIndgq/38=;
        b=PZkZEVZK3Ni/h2Lsatisu7Z0OygbBw2/1QeD8ZO/Vbm5W0mh8fy05UVCGE7daqCgFb
         +lQTp3Ox4sX5PxG5JeoUiQF/mr0Fou+wmkE5PIUxwQLxrJW29+WmEk3zKZS8kINQXqbW
         AIWNRhnh8wdhr2ars5W7z1M/kEAyHRKWkYnNnMnTp2q63dfb8ZNQhYucffWnbVPI8b8J
         RLUkUuel65H8lVLs2kYqA+5xBBt4gpUHurQRkB296yaCFobtcYUvyx1WG2nNSMCHtQLq
         yjBqTBnhrAPgttb/If9vGXgP9Iww8XxOIXHMn0EnSdwXhB2MihfT8Tzva1bJeyOQf5pD
         XSqA==
X-Forwarded-Encrypted: i=1; AFNElJ/BNdzs+spVA2EyWGX7Ico3ahlLEQ5wpBl2DM7E3QCtOofs1q/5MnRhINjnwvsgKJ9wwWgawb7fYOIygpbRUzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+p3zBO0dppRwcn760jEF/bAGFG/jGGQuhzTBCscYo51ySiDV
	+XK2xx9hUzoQLzLNkxbLNDrBnbIk7nfOTCXX/QXMe9vV4GHhRczFfGT/
X-Gm-Gg: AeBDieseBd87R6bmOhVPH7O4t36ZGBJBKSilTJxDdcttG9soeEc7mGnERoAFZBOCH+B
	3Xf+O7CWoUCjflFXMdf9aEsOFggBWwYgzeXoYfoNumYzOwJZhpy1iGgbI6jViHVCq5GcdIOIvme
	Pam1XFhOMmxUtp/vM6ylHutH9PDpFP7tAow1wZXZ92Znz2PJtB2hI7skP43c2pVc03MwwazppqI
	tj8PX0roeJ2Ge9yNORPkM09w2i8jaAATs0TTwdh4/SZYmyaGvYOPUouX+t69V9MIf4Qdd14LOPK
	ots5q71jFPfF/l23mAEoaOHxPDWeHHeGUcDW/xohd/CyBb3XBxUvmKYyyzHtD5CnBF/+x3jEPDK
	3bvaeIVr/w3kFk35rZJPR0k7LTDjjUsalFyKo9U1V5pCVtKPyHQeYbb6E5ui3mRpzXR3jYXAi9O
	q++2BvtLR7p6z2F2JWxT4aBqLQKIJnIg==
X-Received: by 2002:a5d:5f96:0:b0:43f:e413:e5ad with SMTP id ffacd0b85a97d-446448b87f3mr5644612f8f.0.1777384192756;
        Tue, 28 Apr 2026 06:49:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f994a3fsm6535789f8f.25.2026.04.28.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:49:52 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:49:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: Alejandro Lucero <alejandro.lucero-palau@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] sfc: fix error code in
 efx_devlink_info_running_versions()
Message-ID: <afC6_N4cCewJrkis@stanley.mountain>
References: <aeyEzO6C-v6J1VHH@stanley.mountain>
 <0dd0c884-c846-4f17-986d-fb24b21a836f@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dd0c884-c846-4f17-986d-fb24b21a836f@gmail.com>

On Tue, Apr 28, 2026 at 02:36:55PM +0100, Edward Cree wrote:
> On 25/04/2026 10:09, Dan Carpenter wrote:
> > Return -EINVAL if efx_mcdi_rpc() doesn't return enough space.
> > 
> > Fixes: 14743ddd2495 ("sfc: add devlink info support for ef100")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  drivers/net/ethernet/sfc/efx_devlink.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/sfc/efx_devlink.c b/drivers/net/ethernet/sfc/efx_devlink.c
> > index d842c60dfc10..45f412bb9b5d 100644
> > --- a/drivers/net/ethernet/sfc/efx_devlink.c
> > +++ b/drivers/net/ethernet/sfc/efx_devlink.c
> > @@ -531,7 +531,7 @@ static int efx_devlink_info_running_versions(struct efx_nic *efx,
> >  	if (rc || outlength < MC_CMD_GET_VERSION_OUT_LEN) {
> >  		netif_err(efx, drv, efx->net_dev,
> >  			  "mcdi MC_CMD_GET_VERSION failed\n");
> > -		return rc;
> > +		return rc ?: -EINVAL;
> >  	}
> >  
> >  	/* Handle previous output */
> 
> Usual practice in sfc is to use -EIO for 'MC response was too short'; it
>  signifies misbehaviour from the hardware, not any invalid input argument
>  as -EINVAL would suggest.
> Other than that, looks fine.

Sure, I'll send a v2.

regards,
dan carpenter

