Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B84A3E
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400721; cv=none; b=Gfoe7V9HaDPGVNxr7P4Yk3ZNj2tiuw4soDDReKc4KYU6yoFAbdBC6iTfDqgfb004xvms+wZLbIEKgDpB0NAZs9bvAt6uzbtdQ6+XSzskRA+W2UUW6Jq4hLnp/9WhaGjRDldGYT9pPDbkrBd5P9u5ED+XxU3VXZpROPXJ372iluw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400721; c=relaxed/simple;
	bh=cnjftqRTix1Iq4pNd26G3m4Fq6fJQhDX3rKnWMPwe/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=snt6xL8483Zn6EE0aPKsAaEGQnOOr1WoP2LEX9GuQXovIjBbNdtILLaBznsg6dxx6To4F9/VuBlFe708D8xhsQ93p0E3nvW52F3amxZmNi+KE4NveH9QBU5nAue7mb0kvrCImQPJXb1E07JZcUje90jTx/3P3PUQVjSqtcaWYOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=P9K/UdFI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="P9K/UdFI"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c30d9085aso4646517f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745400718; x=1746005518; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/ibIxkHiQKL+uy9WgHCoDI8gDfvMqpX6jxocIOb2Ak=;
        b=P9K/UdFIJVhjamib2bLQMQc4Au7N4eY32dATE4WJFLvDgW4AXPly0uv1tiHgdOwWgq
         R4A8xDWBFBLPdylSx1QG4pXeWtSRxjc+uS+w3ZCLNSFDUsHwyc1A7Iim/wiNGpPtXLFG
         LelfAfxCJtbRPO8MuCc0GcS4IvlLQrz5Nb2UKb/B+m6AEm1dMHLBgGFP4bSTj7IZH7wc
         8s+wTzPc4V6XWSeBtLCGjRnNpfzAAHCyJIWor26IDenCK2Nf9y7KSjb6akcIkc10XXS+
         9NzWQOxDnvz+4QKrORJ9+AiXtGEfkHDTTRv2r6+++WGlRnqDK2TowucXN0zt6985ZpgV
         Pvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400718; x=1746005518;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/ibIxkHiQKL+uy9WgHCoDI8gDfvMqpX6jxocIOb2Ak=;
        b=vJoUvdglI1g8CR3pgGVnIl3SO4DZICJ7R43IXj347fMRMfFEICK9JTVJBz32on+mZ2
         TyNZSKF3cSTcJlzxrFJ3HKFJKlXJfPIH4f3MUnSxN3GfglvUoZwEgVE8jjwKjnvUT5ON
         RJMqQT0SVN8hNqVNM0FQpQBi3MtvBpUOwhVQ3JOJ4NG7HGR1Fg2Boy9pMefFPhHdq+aH
         PvvS3bkhXjZHHTOok4OuuSN00YXyqWkNzBRq7JFTyC48E1vWX4u3cyJ+NkIXr4JVJyZE
         +qJR1SgT3hffdqJcD5c3b/xmTswnqkDIYwNECE910aLOsl9L9DSNsra4Cf2H+0iXooj9
         0UYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCJFJCysaLOd+1RErbhLOxDynYuItOtJqAh1Bq2Owgw5MeA5O0u1A3aWtbUxh14N72OeXYUDreTbj4kCoaAVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBM3NSyRf7mvSknt4h6sfQwaH4m2p0z1ntFIz5hDpL2Pxl3kKp
	yYLmsEIGkU8gRy5PQZlgpj/XhjBb5jev8y8RoaDGEa+xTDcMiBrwTPQl8xK9Xd0=
X-Gm-Gg: ASbGncvnsWtcC8ljzEI2HYHPVsCR8vB+tXgAWViTLNt2fmcYCDm77zvzXKe/hHb5YAs
	lsvx0xVQXsW9fUbjtoIZPAUVmMYfaB51zftaoidsqGSrikmX5AqXKBDhkpwYfozlZ1JRHoiw/TY
	G5WchD14pY0q+OFYwaMaAWSlMuGUISFAGsUjT/Qq2Cx8aSWLxxYywv+414RfiJuoLG1wYDlNlAi
	V0eflYH9tVIFvHOqlimefPB+n1a4DzlXMHv30xXTwBiv5gEijVigmOLi+mHc7+I+k4zkG4mwIMX
	3UMlfAsF53n7stNAOAEeXnLRoURrkIYEWiJBpv6M
X-Google-Smtp-Source: AGHT+IFg6enZe+1trj27dPXdi1sR5KVmpei5QX91LSKw+3qUguME3MQq9BDTJG3uhoa8q4Oe51KzZg==
X-Received: by 2002:a05:6000:228a:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-39efbae02a8mr16225715f8f.39.1745400717823;
        Wed, 23 Apr 2025 02:31:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf73:b178:1f43:c630])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4206fasm17848060f8f.2.2025.04.23.02.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:31:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  Leon
 Romanovsky <leon@kernel.org>,  "Rafael J. Wysocki" <rafael@kernel.org>,
  Danilo Krummrich <dakr@kernel.org>,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] driver core: auxiliary bus: Fix IS_ERR() vs NULL
 check in __devm_auxiliary_device_create()
In-Reply-To: <aAiiLzqVulfGDPsl@stanley.mountain> (Dan Carpenter's message of
	"Wed, 23 Apr 2025 11:17:51 +0300")
References: <aAiiLzqVulfGDPsl@stanley.mountain>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 23 Apr 2025 11:31:56 +0200
Message-ID: <1jzfg7nrzn.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 23 Apr 2025 at 11:17, Dan Carpenter <dan.carpenter@linaro.org> wrote:

> The auxiliary_device_create() function returns NULL.  It doesn't return
> error pointers.  Update the checking to match.
>
> Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for catching this mistake Dan.

The thing was initially setup to return error code. Greg asked to
simply return NULL on error and I forgot to re-align the devm variant.

So I think the fix should be to check for NULL as you did but return
NULL too so it is aligned with non-devm variant.

If you wish, I can handle a v2.

> ---
>  drivers/base/auxiliary.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index 810b6105a75d..61b876d90b7f 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -491,8 +491,8 @@ struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
>  	int ret;
>  
>  	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
> -	if (IS_ERR(auxdev))
> -		return auxdev;
> +	if (!auxdev)
> +		return ERR_PTR(-ENOMEM);
>  
>  	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
>  				       auxdev);

-- 
Jerome
