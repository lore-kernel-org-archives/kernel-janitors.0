Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDC213B2B8
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Nov 2024 21:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730929539; cv=none; b=qxbAaaD5Kt5K9D/9CBCURsu5e37dB6azd0U5Qm8mIL2akkEo7niIyHKv2p7KU6i8IxBwrFpx2K7EuoPDkWvn1ZdaTeJ7qxVAr6R5eM3nYVNeXrYRKDrUyO4Mh7ReIBx2w5RjDwwZ+wdjtmR0PJObzzU8AD6OPFPxXpxxLXDmO/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730929539; c=relaxed/simple;
	bh=3XjTb8z/OatcAGlD70H52F9d4EjSpcmkKKzfQEYX9JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3IueMrF+9Dn6GbiUFKFUtZPO6u1TZcVd36r2nNOT95tQg9WEEEBFnXc6ZmepxigmnvHnlHRzX4S63MS0VRmxPZiUOTtxWQZDwOhnzeY+WT+ixhRvnNJFBDjz/iUVJMZomLPVMCK+MqOyKTzITEpXqzaGByDFZXt2/LPSAIrFsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkRxEy0h; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkRxEy0h"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d5689eea8so134564f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Nov 2024 13:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730929536; x=1731534336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZG/igyMP++w3vhsSNt9GffWfG68As9xDtf6/9FjLaY=;
        b=PkRxEy0h0Ur+Jmh5tYHalLezV8YDHl6inrztumpRGeRT6rT2BOhw6NslKTfYlDBhHP
         dLxc6sDxitlOQgHyF451KlSXZ1oYfnCQUSRmf3wOv17aciImpNYtACYMyXLNIvEMdcqR
         eTLVA9bNLG2FhPXuZhsKRmruzb0yN5pYdA8t+veQFTFvwTwfwK1bI2J6D/PJDD+z2LhY
         0yay148HPPK0aQw3nx+LtpgGkNI0ckYGxGV+Wgu0yxzWlOfgv5J3z9ST59qjQTIJsric
         PLX5SJ04rD0DePLSS7Ik0TLmwTTSXqKdMQbNJzM/dapZlgXcZ/r8I5XBfvkImNhs8O3C
         bHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730929536; x=1731534336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZG/igyMP++w3vhsSNt9GffWfG68As9xDtf6/9FjLaY=;
        b=xOgJTdVPeZKTlvPbcE7cOjTT6yu6idwT03ArT8f1ASgswlm0y34mI4YukqDBOnMr3b
         Eu9lARhevB7NZu0w0tQMEnyTPzyDOiK6xrntAEstNChSVQ770ZdI/CKOfLrJuTirFsbE
         HRx6vkNPjHDfN3KsOWkZJGE8DfoWH9E1uRIoWQIyg4ywE7vfkvn83TvCuadlNVPy4dCb
         +MsvK0js0XRuYQPLR2SAhAFFp6TKG8eKZAin2ikDIFEs0aecOBS7kzTanhkmrytS/9rJ
         ay2GscXlC6hB0WsjRyp5ZZdxldXA/3Q4V6wrvqWnZku+FppGebsj3OzVeJ3A0r7ywJEz
         A8ow==
X-Forwarded-Encrypted: i=1; AJvYcCUQiAtGEs4SvZcDSEpZjKmTt3YnOXqYa+XfEf5lvjVU8qgbVB8Ga8lVeAQilnbL4YDD5kuu1huAEz3nOfrNTAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZidFje8QWR0SHqNAV3HtqErh2nMwvJo8CZYajE89gAe91L24X
	xNLlTiofJMKZkyRj9JdQinSnmADPuEuydlAQ4O7E5X9/Igkpvtyy/vOWgemxBTw=
X-Google-Smtp-Source: AGHT+IGQ0v+koMdAwFpvu3s3vBOtc/f9ove0xeGvJGuO0IWV0GiECd61P64DFb85ruuM8ktF6Hv5hQ==
X-Received: by 2002:a05:6000:12c5:b0:37c:c5be:1121 with SMTP id ffacd0b85a97d-380610f7bb8mr28648760f8f.9.1730929535965;
        Wed, 06 Nov 2024 13:45:35 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e7449sm20333098f8f.49.2024.11.06.13.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 13:45:35 -0800 (PST)
Date: Thu, 7 Nov 2024 00:45:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] fs/9p: remove redundant variable ret
Message-ID: <23a44a2f-2a99-47a7-a446-d96b5adf62ec@suswa.mountain>
References: <20241106152209.1626630-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106152209.1626630-1-colin.i.king@gmail.com>

On Wed, Nov 06, 2024 at 03:22:09PM +0000, Colin Ian King wrote:
> The assignments and return checks on ret are redundant. Clean up
> the code by just returning the return value from the call to
> v9fs_init_inode_cache.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  fs/9p/v9fs.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/fs/9p/v9fs.c b/fs/9p/v9fs.c
> index 281a1ed03a04..ee0a374e0d9d 100644
> --- a/fs/9p/v9fs.c
> +++ b/fs/9p/v9fs.c
> @@ -661,12 +661,7 @@ static void v9fs_destroy_inode_cache(void)
>  
>  static int v9fs_cache_register(void)
>  {
> -	int ret;
> -
> -	ret = v9fs_init_inode_cache();
> -	if (ret < 0)
> -		return ret;
> -	return ret;
> +	return v9fs_init_inode_cache();
>  }

Better to delete the whole function and call v9fs_init_inode_cache()
directly.

regards,
dan carpenter

