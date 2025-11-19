Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15D2C235E
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 07:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536395; cv=none; b=X3Ch5glI8RKaynkrpKuRhf/qdgal2q4Yobqs/JhhWuf90tFXktydl8spSSk3gB+nyDFMFXD+qikzCkaeZlNLhBot3QVF28A25Y5Whl05NEc62/3dslgtZDiLVvkUMzqaiqEoiMEUuynDOhyjiKK0KxjZif7M5g5nIoGO+0dSJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536395; c=relaxed/simple;
	bh=3ftyJeNEROOQRmpQz9ADffJrhoo3yBZl2kX9QuLh3Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Blnw3f0pF3p6YSTA49n2fpz17IAdvIibR9sZdGHuRDuynrZZWmzdvA7lgbDCAEnY0cI6CL2tKzTzJxv5F2cn9+Bu712/DgV1ucpauSYkaAuBAmPaheSVG6+BOZerbDRde0lmkrFfX795u0Nedx4u41z4TBj7HlsuY9xxMJ4SuyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNCQ1oOS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNCQ1oOS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso936725e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Nov 2025 23:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763536391; x=1764141191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fEeop7THHC2Z4mZ+uFXO7gKPD1aZpuBWKQn9Nyzeq9c=;
        b=VNCQ1oOSyfLagq1iuX2ZH9B1+PsuW8CA3+dSAD7QIrJoY7dTluNQwbePanLXs99hS2
         DYBLiq0L3dWsuObl5Q4Q+HEFVa3CzEMLV8UcwYaRJcaSJPfXMeFf30O7k+P6YR0RYXvv
         Bdvk+X8r+SrqZUfBdeDAMx4a2BZlRE+GbBZsPTLdrXHEjEVSnQ/Ezo4Tn63bVWvp1/v/
         M84YKpJ/9hwJW7/66eah1yxoG88/+YeVv8sEXYHopxJvCFP9RZknJxmgSSsLhxxRO4Wt
         hB08t+jP6KrN97ODDwO8CTu+jjDNBRhjTIyEkfiOivt1NVA0g90yjZSxFlB+kMTksesL
         SOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763536391; x=1764141191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEeop7THHC2Z4mZ+uFXO7gKPD1aZpuBWKQn9Nyzeq9c=;
        b=Gu1UaA8tHMP+ocn2q/uR2kJ33JiVPDU4EY0DNHJI7Yqp7bA3xxknZQowGqqfr4BShO
         7JKzprLqBC1UPJH9zoS+s9AZqzxsvzD9eqc5pe4uY0ftL/e+n/TpowGLjswjs5Gad/qi
         OCwc1TtsRrDgCR6bjdogd1g9flt2ljd+w7NI6i4vHSKUvR+BYG8IRp7qZE8sJ2G9/Ka6
         stVe5Y5+/RCujE6cgLDuLHa/gZwoMVOsMxEcRnp149ZqtBC7RflbYpAKAstSA8i6rJYF
         WFcd0x0IXBCK9UHLTbjr/rP7lF5F/8bJgBF6DFgkq24nab3BS7UPki0podHOIO2TMd1o
         QLRw==
X-Forwarded-Encrypted: i=1; AJvYcCUgCnyZv9yhTije/P0ZTICkaCU++VBFyw3FK+h98ybnr88DkA1l8vxiJlLtVYR31NL6oCtveCPgSCvpGWZdFX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYz9UXPtlgDxFFFsRjBEk+JXuYzM7zjmDy+7sZLa3XBtw5bvuM
	/GypmxitoJ2A87ESLcWlGTuMwvMpo//CCMDL07q1dFIq6odEIUuNWkySybWqN8ytK/oYZHTKjBr
	u71nQ
X-Gm-Gg: ASbGncsXl0HJpn5cGvV38hcxNKBbTgW1/Fje+qFPEDW3hcP+n9wOWHy4QN0A0DzcZhK
	HEQCKaoV5x8YGkD1AS7l+mIszmcTWAxwnpLfCEqegP9VVUcsNFz6EIWb1yh3tF7pou6ZaMANY9p
	YNCjGjbq+wY2BjSa5rqr4IEcB3QedLuLBGYsl0XNbWIzOCY3xs4728sodEGce1Z6gVFgNAd8Nxo
	aA0S27zcyJWaDNC97pHIaaW1vHrF4i4ZEdh+jD7w0L14Nj6Uo8n1F0LC9PVmrnCaH681pGqEq5H
	RzUizW4eSwvUZ5v9TQ8M8RpJIQ43kGSDKjIsNoMze0XFyBR2GlHjtHeL1FaqPDbL/HTZSzRU/o4
	ZOATL9BZ3lUnj82KmyaYKXMbaNmp/BDdKDkLrt4ZaiXHHpeSDtJcKpDjVUY9gtfsdG7cpVny7rl
	Nq3mU6VvPBbGXr16qyHN8/YM9m4Ag=
X-Google-Smtp-Source: AGHT+IFXU+nC9ZIeAepoDKLNINnFSoupsWUwJ82hsu4iGdnTOqFrq4RmnDZ9NA5coiMKgryDL2/Yvw==
X-Received: by 2002:a05:600c:8b68:b0:475:d7fd:5c59 with SMTP id 5b1f17b1804b1-477b183de88mr11222795e9.16.1763536391552;
        Tue, 18 Nov 2025 23:13:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477b1037d32sm30368275e9.12.2025.11.18.23.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 23:13:11 -0800 (PST)
Date: Wed, 19 Nov 2025 10:13:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: CL Wang <cl634@andestech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] rtc: atcrtc100: Fix signedness bug in probe()
Message-ID: <aR1uAuEtucZ11VMd@stanley.mountain>
References: <aRxPGBEX8hbY6sjV@stanley.mountain>
 <aR0s653C4g2auavf@swlinux02>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR0s653C4g2auavf@swlinux02>

On Wed, Nov 19, 2025 at 10:35:23AM +0800, CL Wang wrote:
> On Tue, Nov 18, 2025 at 01:48:56PM +0300, Dan Carpenter wrote:
> 
> Hi Dan,
> 
> Thank you for pointing out the issue and for providing the fix.
> 
> You're absolutely correct that using an unsigned type for alarm_irq
> prevents proper error handling when platform_get_irq() returns a
> negative value. I will apply your patch and also review other return
> value checks to ensure there are no similar issues elsewhere.
> 
> Thank you again for your detailed review and suggestions.
> 

You're welcome.  These are just Smatch warnings.  Nothing super
major.

https://github.com/error27/smatch
https://github.com/error27/smatch/blob/master/Documentation/smatch.rst

regards,
dan carpenter


