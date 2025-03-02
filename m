Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678781CD1E1
	for <kernel-janitors@vger.kernel.org>; Sun,  2 Mar 2025 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740940992; cv=none; b=lbNTS9/VfDmlQgZutE0ZYdcRt8Nl91Cm0JYFF71y2bvV1ihGP9YANtClmMjaj8z/EzdUdoU6fCxfiLYFDNzCucd0sTvj7Zp6WPQ7md/iFCBm+6ALCM3u7uBqrXaS1QNKLb9FFWZndaZEOs0vjHNhWhF3hoSgmljkdBNRVwXDcOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740940992; c=relaxed/simple;
	bh=+H1JYRsmzoPrlN0IZH2KXuNuKiNSEAFuP+sgrI0/RtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZR5fmdF0iG4SUuSY3r8LijYMWbpXeptNaR4BX6vQRsFzz6InaWYJ5ntm5pxkz3CRx064vjaeQk4vmSwk5qNLD0fCfb4AxqF/RDiZ6de8MS7TsxUWWRPoyMQQ6ojjQNkTObqClD9jvfokUjvy1Sqlb/qPI6JZ9wclRMnCr9+ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHSKZRXJ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHSKZRXJ"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30ba563a6d1so12757441fa.1
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Mar 2025 10:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740940988; x=1741545788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYfSZwjrk1wuwLyH83CewpZux6QazFFyjHhdeIqoGk0=;
        b=xHSKZRXJmjxn4HtvvUvqGeQ3d5UkVE4L2yO2HyRj9rBsz9uRxhFKfXP094NjQPckcZ
         g4cJNRAjO3RmQZL9XMrNqP2VavpOcqVHM0JDkc37E089owDZM5GhbB0jZ8S/MTRI72FK
         qMxQnPZicawaODzDBql/UUr33T4B3dNiKZQMSJ3Ix5zG6Vx2UoH+tbC9jZfTd8k8emJC
         cj6dV/wcHGnXOUf9GT/94+gAWp3FecbemdSpgjlLI39L54uFLvJ68LcrRHaLkMsaAQXk
         C2Je81kM3X2WkAr68jAX7Mu5sU0guaW1p4bWVVrbmqXPN34Ge3/hxWKUaItxjE7iDBp0
         D7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740940988; x=1741545788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYfSZwjrk1wuwLyH83CewpZux6QazFFyjHhdeIqoGk0=;
        b=Kz/uRF0guyjeh8N8+lCi2MVi55o/eFeUERoZD7CJEq94JIkYCjHHQpGats67P6hQjk
         aiApXnPQQNT0Wmw2+h9mMdjGufVwXaQYL+MeltX1eBMgJmziei12Vn6TwdWJ1ZcScakz
         Ftd71gJaxhiN9j+cU1hFHiAFa1FYJ7dA5EubIDQhhQGEQNMUbtskRRw7keGAwVOyxGjF
         xF9l9GJ+6nX1um0SoOx2vZ4uVLaY1ukvp293hL4nWcAI+6zw31fV6eGusoehIhkr64Io
         l4Atwl4TpcKCine7A1ifgyZe1p5BfDM+HI5eM80HyPYhEzasJQFy9i2EqQGLYXaDE/w/
         My+w==
X-Forwarded-Encrypted: i=1; AJvYcCXV/6tOwQ91U0xk9R5aw9XLpjQzNjkXMhu1AmeK02zj7GoJ0v/nHadLvy6at67CbPEDASroJWjiTnf8tRXiGgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIlqcsl2mh0XCC7Bucw30Hc9BcyZ399zkMLVdstZyl8PES3CqA
	jt6yv9e/9ndg8G0i4NXZszB7LBUi5g+zzYcY+W+vp9h0Z2DB9wPrL9BVRSv8l+w=
X-Gm-Gg: ASbGncsb8Sq+WncLd6RA/PheCZRiqEXTS+1KahPL5iMZwgfKPbtCUlRZ3dM5IZM1zxb
	wEnfclc+lMPTGZEzUyFpA1IXQG4QYYuBFGAH4YKm27Gj1HKx0zFfE1sq4WsDSaBmJeyiHCiE2+B
	IflCKz+PMS4KYkhJfWn2GvEvjMsLgbbROQ1D4iQgsxoIx9SQ1me58zg4023qB1a5bXUk+/TvXoh
	Dv/ZS5b9dY+LPoIjcn6CUjaGC10Rq4YkKlg16451BuFXZlYgZvwgeMlt/iyPBJxuS/blURl52Uw
	x6AS+4RBDVzxTPTHsyCSxhYf8Dp2JTIMXDusosnipiNcpn/pPtzo4b0k91vhIyEO2zNoT3sEuO6
	mizLZg2qiJ0e0h7UbJfTGAMw1
X-Google-Smtp-Source: AGHT+IEYTGmoWgInNdncfhUdNvmlzFmlOJQaw/FJcWHC4CdZnaQ0MmPAPvQbmmMMOiLgnNAPW8hDoA==
X-Received: by 2002:a2e:a4b9:0:b0:30b:919e:3021 with SMTP id 38308e7fff4ca-30b919e30aamr32112101fa.10.1740940988464;
        Sun, 02 Mar 2025 10:43:08 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bbf2927a3sm347551fa.1.2025.03.02.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 10:43:07 -0800 (PST)
Date: Sun, 2 Mar 2025 20:43:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: andersson@kernel.org, Michael.Srba@seznam.cz, konradybcio@kernel.org, 
	jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: qcom-ssc-block-bus: Remove some duplicated
 iounmap() calls
Message-ID: <keric3hixhjbxscdtqbgbi66lz5oklj7dunhfbmmtscjlmjykd@6ud3faz63pvz>
References: <cover.1740932040.git.christophe.jaillet@wanadoo.fr>
 <efd06711b126e761a06eb5ef82daf9ad4e116a10.1740932040.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd06711b126e761a06eb5ef82daf9ad4e116a10.1740932040.git.christophe.jaillet@wanadoo.fr>

On Sun, Mar 02, 2025 at 05:21:34PM +0100, Christophe JAILLET wrote:
> reg_mpm_sscaon_config[01] are allocated with devm_ioremap_resource(). So,
> they will be unmapped automatically by the manage resource framework.
> 
> Remove the incorrect explicit iounmap() calls from the remove function.
> 
> Fixes: 97d485edc1d9 ("bus: add driver for initializing the SSC bus on (some) qcom SoCs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/bus/qcom-ssc-block-bus.c | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
