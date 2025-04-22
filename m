Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AFB2153D4
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 10:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317470; cv=none; b=HkQqkPUtA27kjn+HbAnmLV5RJyHJw9gFljwQkIgLQnJqLQiXn2jdIyOIFMagYJ0ZIV1PctTQ5G0oaD1s3FskfayN7tOEliEvL14WzUGEas5oguARAgY9JXLKgEYHoloLAOI562C9fpJyrTo0Beq9EbtgFew7XmXowroz5jmfHAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317470; c=relaxed/simple;
	bh=SgCvUZ2Dp0RNubBkgcpghs+gpJMLGKE0/0/7IcZzQyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TB9MHSqD2zZ546NROdu1z1YwPclfm1jnk8fWkmq48giCuNtGIU+Zo01x5tR4VU/9pMTT12sQHEncDlo0P+AbrF+65G7+A7HCzVx3B4++WRLCtIaAAzJ2NPe61UssipiKFmrpw7L1K8dw081WbNO1JoC1p4r7JNwnj42BxSx0Q3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpWEkbCG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpWEkbCG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee651e419so2745428f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Apr 2025 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317466; x=1745922266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGpR7DHAu3crb15D4InspITnPezktxxxhM+Ewq44KWQ=;
        b=QpWEkbCGp9JY5duWuwOyD42AjKuQA6fT9QrM03bAUHnjjVoiYU4PYVG1GjMKBd2Exy
         pN99M/rhjZiVpTIhA7m6I8HlXU1J6fhOtPrNcU0VW0Jlqvjnic4+WE7IXsL8iiqgiL29
         X35JdXg0HxAd1gQ9vZlXHH1y6dvGQmcrXye8VtJowOIaj/MBEUMwi8yrmUhfhOM+fLM1
         1Og8a+ArJCxPmipkYE9GDAjUT3UkNMQKAuPRnc25wpF1nPWkLTUvIa4lwAOlytk9rl+B
         1fy9JqNj7XiYzwQCa+i2wMxEKZA66p3MjAxgA6C+UsrWkXmeuynXictud6uwrAfXaZo1
         oO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317466; x=1745922266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGpR7DHAu3crb15D4InspITnPezktxxxhM+Ewq44KWQ=;
        b=OWrDF47+A24+ktK2CIYrgUMzSRRWTnfwBdXxozgfaDaDo8rTdrf+MV5t4NDlVveo5H
         mPgGeVli2x+QbGaU8E/V9/grpHsJjD1RqYjboLPow+GnOxTKVE+eDS2oHoc5iXl3EA4L
         HBattddktcLcLYVYr/Hil8GMYTKgVOHDqQhX8rVDEVM2v0PFFNN5OtIhu3+8cOCm+0DY
         TEnkHYIO+lLMeVldKtGLw1sIXOuYHsYGW9MBMIgSM+/LS3ZxSqQNO+y4fajD7jg2fDnF
         NlgUT0W4hCTlcTnFGbiO0QFQTRLDtV8j19mhXOBtaECZFTPl68KL+pro5D0Ydi3JtJNp
         BSJA==
X-Forwarded-Encrypted: i=1; AJvYcCVk9NVSChVsF2JThJXOfJnvuLyzJ3dHQnTT/s/DfZSx8FmyY7LqbWjxIk9S0cZ2U64sgmIt7asU8yptCrQPbnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC99P30e4wLRvoq36v8btVoF+dPWpJcA1HZ3Dxqd7py5nNGCec
	sdlJ2rU+3HrECv30mnIjOc9MAZsn3PBMXg7HwgYVhNlR8dn74EffuW3k/PCBS34=
X-Gm-Gg: ASbGnctbC8yIWRolb0XaUqFqcUQ/AxWSbzc1Ff2SDxnukiaLsryg9xS/ebKkc5L/LgH
	Cy99QE5WPXgH1qm6QGenUJbCrw3lR+XiJpnVim9YY0M9VBPBetyv5bUb/n0jScVkVR7XCxv5B5W
	oFxPWPaYqhrWNW05wlKwIS/HnzA7ocdGDS0rNk5oMML2eEAJxUmCchK5+pJUOqYue9/yzMZMeb7
	v/DoVPBtSoUTkJwd9+TgR5HVndRXp0fADjj9ouvL4qEeMWwr4lU4ndDOD/CIBhrKDlM+T/bjc1J
	IQNDHWwyml0dqeGJfcmkQBmPa+DGJx/X+DC6cdOg8zDWKQ==
X-Google-Smtp-Source: AGHT+IHutLphGbGE1hCdZLvaGiMQTDK82f9s6pbuK+KpdDS9Fqw1DprMwHPrbtUhvJfTJXHudGQhPw==
X-Received: by 2002:a05:6000:40df:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-39efba51048mr10695810f8f.24.1745317465705;
        Tue, 22 Apr 2025 03:24:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43330esm14497713f8f.21.2025.04.22.03.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:24:25 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:24:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Su Hui <suhui@nfschina.com>, davem@davemloft.net,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] crypto: using size_add() for kmalloc()
Message-ID: <2169828c-127c-4bf7-b953-2f1194b72830@stanley.mountain>
References: <20250421055104.663552-1-suhui@nfschina.com>
 <aAY0lyWzsRVDge_f@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAY0lyWzsRVDge_f@gondor.apana.org.au>

On Mon, Apr 21, 2025 at 08:05:43PM +0800, Herbert Xu wrote:
> On Mon, Apr 21, 2025 at 01:51:06PM +0800, Su Hui wrote:
> >
> > @@ -433,7 +434,7 @@ static inline struct aead_request *aead_request_alloc(struct crypto_aead *tfm,
> >  {
> >  	struct aead_request *req;
> >  
> > -	req = kmalloc(sizeof(*req) + crypto_aead_reqsize(tfm), gfp);
> > +	req = kmalloc(size_add(sizeof(*req), crypto_aead_reqsize(tfm)), gfp);
> 
> This is just wrong.  You should fail the allocation altogether
> rather than proceeding with a length that is insufficient.

When size_add() overflows then it returns SIZE_MAX.  None of the
allocation functions can allocate SIZE_MAX bytes so kmalloc() will
fail and that's already handled correctly.  Meanwhile if
"sizeof(*req) + crypto_aead_reqsize(tfm)" overflows then the
allocation will succeed and it results in memory corruption.

This is exactly what Kees did with the mass conversion to
struct_size().  I occasionally run across places where Kees's mass
conversion patches did fix real integer overflow bugs.

regards,
dan carpenter

