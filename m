Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4321B42049
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414283; cv=none; b=iepo3Q4lB/Zl+x90EF18Ap1pjgo4xNwKaLyloKj/T4mHgKm4hj8R+Mc5TgL2JDoUuuNJfmgv8OpRsfC4hoBWiS2V8iDHn0q/gwzOfCCzLBdb4g/1HAC36lKzbkOX1B08kAXYQTzOwpw03JZcuL+ClJEOu6Ki6CrlbnrCwO4HskM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414283; c=relaxed/simple;
	bh=SHjWYbn5WkeKcmIqhVF+HHwMxRYFZfSoxCXUjjtCIxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UmPR84QwavIEPjpszE6mFvasahLpVEhePnmY4Hbp1xBOKm+aSwLR/oNKV6B2lIOXgIYuosMGcmmtCuzkJBlf3kJn5WC3DcbVZ7s62oRTUmT97KJZShdZGLovVjnbCS8UohA6TsNjUZhROSAYxyIuJAR79WXSOBmUnOwDmGJfncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=S5bn3l+5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="S5bn3l+5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso54183315e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745414278; x=1746019078; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ba5AfVNw33NAfhYW0ZQ8jsvM44DbHtT1wO+n7IyhglM=;
        b=S5bn3l+5xAOr2hPLy7pax5VkihG5Mh+gIzxm1+WZKPlny4cVA3d23b1jRsjJEVqcuK
         e6vm6pb7xSW49UnvhY0HTnfQQRewKiqggneTgmxXAHHxkwWOQOgMSr2ZQoK3OHELcxH0
         K1QZuXIhxLk/fp9e138+42Bxo479S3S6FJjD//2ghqzvxZz3tXyF+C/u3JoZt8vsj+lR
         slsBlPCSZVo3ZJCbEsAbNohpnjuJxYVvACO0BuRJDlI+w1tHUTJN4P5tNJHtesYCDcmq
         sNlA6sYeoWOeLlw8Fv4XOjbkEThpJIRMwMKSAvv9PL4oHAlM51ZNjU10K6lVBtu2qw6k
         wsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414278; x=1746019078;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba5AfVNw33NAfhYW0ZQ8jsvM44DbHtT1wO+n7IyhglM=;
        b=nLXpKcj35MMagG1eQ9ndHNgBKZ07MDnBnsNJZmRVI0bDaoOl7q6GJeVfLYaSRIJ52h
         zeBOGuSFyB4YzcNTJ1tNmAdyNKSdbPzzkWiWp2k1I1C/I6qmtc6bztjN/jHDi6TEFZHg
         2h1yg+sZzzh8OMiCWzxJ0GFyhvVyXOBphjib6c4+fGjJN5HzV9r7tndZsn0IXDZ0SkiF
         9Gs9doyQJ+4Cf7gcvtprG0zLrh3bWJaB5u0QvqpxN0A9AjYcg4mDFreKd91l6gf+iJ4W
         +DZHkSpecFEc7Q83eLjwNv1bN2suq9/eMLlyJASKIZwhfNA/P2rP73mEaCQ0cuDGmiRP
         jZyw==
X-Forwarded-Encrypted: i=1; AJvYcCW+sXBhR6WeUB4I2iXppKLfKWqLM+8hlhzu+sWz9xMXaiVsbvwq8O88GpPw5wG0HKbZI31q+KF8NhqidTR2Md8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe2N1rFVnKgxZ82JBH7VT8o9PzU/6vjrwzU3UUjOqtna03xpyc
	QHb6NS1WYYHoYlPXbjSme6Dm3F7RL4eG6RyE/nt8VywkmUIHXABwdnAr6AjS1Qg=
X-Gm-Gg: ASbGncsx4cxJo1o2DOkea1XvT3RQlHofghkeoPtPX9dHuMnYbr3MvZ81HgpmK70NKbD
	d+brhTOvndhOCAA7IrBg49XNrRTreY1KxqdCkJGmvTpmFNxHzO/V15C8NrbXZNy1d0a78ORaHbE
	usM6x6z4+uSGv1v3yKBmVJO+iPzqPxZGIyuB0y9zNCuzCeA/uSCo+pEUvjmLZfe33mvgSiIne26
	/XQK/TVf1L/c1zPkx+okSxbNkMIvX4Ccv8HvsNqGHdCg1OZ1/j5cYZbVlQkovDfHYuDJFfNvkpE
	oJEUrMyHDjM5mBJXaAEIY9p1qeH+en3fcbk6F9QaIF0ZUJ5AMRw=
X-Google-Smtp-Source: AGHT+IEOWCFtN8WC6LmkUw2g4vml73X+8RArIcZBxgibY4zfqw3U4CU4njM2C2foaCrE7QcWo8jVCg==
X-Received: by 2002:a05:6000:4282:b0:39c:1257:feb8 with SMTP id ffacd0b85a97d-39efbb0a99emr15239383f8f.56.1745414277943;
        Wed, 23 Apr 2025 06:17:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf73:b178:1f43:c630])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa43ce2esm19098407f8f.57.2025.04.23.06.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:17:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  Leon
 Romanovsky <leon@kernel.org>,  "Rafael J. Wysocki" <rafael@kernel.org>,
  Danilo Krummrich <dakr@kernel.org>,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 next] driver core: auxiliary bus: Fix IS_ERR() vs
 NULL mixup in __devm_auxiliary_device_create()
In-Reply-To: <aAi7Kg3aTguFD0fU@stanley.mountain> (Dan Carpenter's message of
	"Wed, 23 Apr 2025 13:04:26 +0300")
References: <aAi7Kg3aTguFD0fU@stanley.mountain>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 23 Apr 2025 15:17:56 +0200
Message-ID: <1jtt6fnhiz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 23 Apr 2025 at 13:04, Dan Carpenter <dan.carpenter@linaro.org> wrote:

> This code was originally going to use error pointers but we decided it
> should return NULL instead.  The error pointer code in
> __devm_auxiliary_device_create() was left over from the first version.
> Update it to use NULL.  No callers have been merged yet, so that makes
> this change simple and self contained.
>
> Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
> v2: Originally I just updated the check for auxiliary_device_create()
>     failure and returned ERR_PTR(-ENOMEM) but obviously the
>     auxiliary_device_create() and devm_auxiliary_device_create()
>     functions should return the same thing, NULL.
>
>  drivers/base/auxiliary.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index 810b6105a75d..dba7c8e13a53 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -491,13 +491,13 @@ struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
>  	int ret;
>  
>  	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
> -	if (IS_ERR(auxdev))
> -		return auxdev;
> +	if (!auxdev)
> +		return NULL;
>  
>  	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
>  				       auxdev);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return NULL;
>  
>  	return auxdev;
>  }

-- 
Jerome
