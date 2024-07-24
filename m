Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAD213A26F
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721862822; cv=none; b=tPAflA18PR8ttrcByKwYpfjvln2iQIsbAG9k/yfjAo++vQgRnoeWwkt+ghQPgMrPNonQHKr3KqKS5ERYdt6WZ36d1/39+CORSBlCLVGRDT+tX0NPzWYjgRAafg2I4lUqf7zx+BjxMRu1yaORLg4MJzwEz2Bsq64BCsDnP5RpxgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721862822; c=relaxed/simple;
	bh=Z9UCdjQkajAMGg+VKP2WjMYx+FBwnrs/7dfcKKnX+f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfzfQLZoL9X2hbI4FQZx4wiUhIfCeFvoUjjO9UWqxP6F/fthzLWXb4HL3I0kawE+R2qsgLBUcg0wWEU250IDsJARrNDkIVFB4VZX5iMJWRgNUlgAKwX14NPnF4zKU4VlkzpqUgAUx0J/gL+or/mCi3nJ3qVVnpbwcwys/P2Y12s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qy42YCSZ; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qy42YCSZ"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-260e6298635so815352fac.1
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Jul 2024 16:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721862820; x=1722467620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JVZralwPwiyvAuVLFB8SHSI/9xmSlrRnq5tuPqIjMK0=;
        b=qy42YCSZdQSZ6eVK0C8X/j3LioXcc9YccB0vJGlmE/lc5y/+ji7UmgXcQGSNB8Vdof
         wnpIGslwnNMw0bdi5yWpf4wmdwKmVmeS1HrQL7tJqbkVUX/HJwY1ZWGoUJOmHFcn2ose
         oNC+Q4Wp51SQmcVwbSq23EML4+xuMvB7x6hUnJL0NVaZ8P4zXIUqvv0YhkJ3/tLNgBLE
         4ap8RfR7W7XSjTUVk5pmdS4rPpLghebo+wRqleriP31vCoG+YAi2+XI7w/zPQ3c9ov0l
         9cfUXkeqCWygtbFf3xCaDey5crHZAuSTO8XuVXX07k0d0Lojg3seFLaB7lycoYpPnCrO
         pFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721862820; x=1722467620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVZralwPwiyvAuVLFB8SHSI/9xmSlrRnq5tuPqIjMK0=;
        b=irc24zrme6v2eyVPPZCqIqFPDRICkUAJmQ+E/pvb3wmCicmM52a5wgi5LYUyLk2u4+
         4c8DeljKxiyfiGcfc7JW2Hcq7q3teSY70+p5Zpbzzs0YEsO1YewZ0c5cw5R4Yc3Xa6LU
         /fh5aDvd1r2J1Ydk46CQXryqmGyGHG8HmViWyGrAC/4uSY7A+CRjEdyLBv9vtHyWzgLm
         vZgv777xBXAj1Lez+1GBxjz6phq5K0Xkq8+jExCE/7dX+7jgYGKVCrhmHmg45SceQaLh
         ChqM/pVsXU6EDZNUwjJY4sx6huP32RRrhmapG6GNBHHLnqYZX8CHlQ3stvIUtRE2XIDY
         XcDw==
X-Forwarded-Encrypted: i=1; AJvYcCXrcXpwjGczRSOICRHf/2tbsNCbWTkP0uBsHVTgIAZx4P+50pl7tfVbiLErE3QatQWoWcLzzOFtL33mzQgqEWva92e5GG6ovQhlP6NsRhnZ
X-Gm-Message-State: AOJu0YwzqDPBskPKn9HC8ag5SmEzXYmoWKS9qsBuOTNQha3pfEBT6GiO
	nSOfAZjlGz24ayeCgO6Y1v0Lc1hSlNh5UUhXLb96IQqCHTzMCORygJ2WNOowgSM=
X-Google-Smtp-Source: AGHT+IHc5ncP/7OxvEdUdVvNovIn0BJIcsES2AgG9AcaRyNRoBxTRkF+ars3EyxOOy7F4tNt1SFfhw==
X-Received: by 2002:a05:6870:289b:b0:25e:ba6f:a93f with SMTP id 586e51a60fabf-2648e8d17a1mr1881105fac.13.1721862819725;
        Wed, 24 Jul 2024 16:13:39 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6751:f2ec:fdb9:323e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70930712849sm87262a34.26.2024.07.24.16.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 16:13:39 -0700 (PDT)
Date: Wed, 24 Jul 2024 18:13:37 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>
Cc: Karsten Keil <kkeil@suse.de>, Karsten Keil <isdn@linux-pingi.de>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-XXX] mISDN: Fix a use after free in hfcmulti_tx()
Message-ID: <bf7461e5-ebf5-4e1d-b58f-c59d7d6bd8a2@suswa.mountain>
References: <8be65f5a-c2dd-4ba0-8a10-bfe5980b8cfb@stanley.mountain>
 <20240724185302.GI97837@kernel.org>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724185302.GI97837@kernel.org>

On Wed, Jul 24, 2024 at 07:53:02PM +0100, Simon Horman wrote:
> On Wed, Jul 24, 2024 at 11:08:18AM -0500, Dan Carpenter wrote:
> > Don't dereference *sp after calling dev_kfree_skb(*sp).
> > 
> > Fixes: af69fb3a8ffa ("Add mISDN HFC multiport driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/isdn/hardware/mISDN/hfcmulti.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> I guess that this is net material.

Yeah.  I verified that it applied to net but forgot to update the
subject.  :/

regards,
dan carpenter

> 
> Reviewed-by: Simon Horman <horms@kernel.org>
