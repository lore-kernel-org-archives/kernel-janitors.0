Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCCA4A07
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740756765; cv=none; b=L1BJw4VPbpL378p5ULQv7soRcQ4+roDobLA+WxgNGoV/DlARIytHI6QVxhTaINYzqlRA5H4HrmHALMhwD3pZs7BI8lOYmRC0mmNdPzMdE+wjiE0k/01QZZev1xzF3CsQflxJTX21iRM+OqHQgCcr8FqPbW3UTi4MyBo2SFs8x70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740756765; c=relaxed/simple;
	bh=DMQqRiGujJ4dSNfxS4EszoUvJrU/f3c6wp4L0gFxA/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hyEJiB3e0hUp+AAohTFdWMzNtYRAC5/5dPYRoaFpLF4b+kwm6tQbAisX4orvrX83aD93SBnZbwfVQh+HzHA+g05x1kGG1o0I+pZjo1hM7K1qLj09OROWq0aw+hq+oPAebuKm6WBdHax6uhLRnZJ7aBI4r/yufraZYS3f/K6Mrfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tT3ygLZi; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tT3ygLZi"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4398738217aso20340665e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 07:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740756762; x=1741361562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMUKsvaouG0UB9E7Om23QceA3c5sBw0tPBAVm+Fn34s=;
        b=tT3ygLZiONfl3UfMLqz+khFnxP2zBq2c3aVV5fUHzPcIlgRi5JWVvEMedXURhtm/6K
         6nVAs54U82l/Rlp+yQXB5DqzQ7gvlesqVckxRixZ0nTyr1uyUoqh2DarM6X+ex/m181V
         CGftwBPEEiPX/BI3xnw1K71Wnm47fmxy5hx6SPkdrUkqi1sR1KlhDUwLwcvZHEgbGOPm
         o/Ac5xA6yjOVtkeHVyYtbQT68Zf0JP2OQnZj/A6NNR6xV+oYX+S3dS0odzLzZaWso/1X
         yN3VfMqBpRO4IZ/01LSv2bM23CCovRpwQ/Rnq7IWFs6PdTB5psAAlucR367dU+PMqamP
         HlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740756762; x=1741361562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMUKsvaouG0UB9E7Om23QceA3c5sBw0tPBAVm+Fn34s=;
        b=vF46Za6717emv/ApZaBfXMyckkFoxHzK8Mxy8+C+9GzYxnPKEIyYusmQUd4xYoM9IU
         bJ+aEGYVljMLC/7+UEsddBxgdASw8NbU35wSvcQoFtXZ8cTEmJ2ROpafadY7/d0BKCOr
         LNTr+krv9Xi21Ix1Yts+oIOr65D1aaVNH5FO5gqdXY2mTkwQoo51EaO2xbL8xuiksW72
         xHRLdYTl1D6m7VyxeU11p8N5HKhQTIJvrAZpwiO+SHizoZNeFELzC3jKziu4LDBa0GzN
         T9hAKchYcbsWxvIu/UUlQH4JWeTKZlRvqp9INqSsFgHZvJvfL5P/5+wmFqKV7Uzkxgu6
         l8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUvw860BecRKLVgSoX9oFUQoduJx4WIHeMM0aDSAa99li/uO+QtiBTMnNS7l5EnYFOxmsAfAQ8HC4qzCugBgwI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyena3cDINk378PuZY4GzqgyFkAFEJoSStBhylt5jadLiBSBWrT
	PH63O3EQ1We419X3JiOmQ1jO4R3AufveaCtAIdnZHJF+/LysP7fGLOW8sXbwse8=
X-Gm-Gg: ASbGncsIehawWBvqoqFgZHMvvuRAykgDIfquAiHuerElj+llWcLUhbTPU203zmMjw3t
	fSzjqeSbJFfQHDBhbXtGSPs8PNWo+Zk0PGU3vaKaQ8CiRD4k9xBHUgg4RmSEzTAsuSDjarCi6uB
	Mi2HB2oVX06IidGptkczn7TrMAMEE740IWLCdX9uGpt2enqpo9CpcR82S2BF90B4ALbjxzw3c41
	+VYqs86jJYT9D8Cq2kC6mwm9wIyrNE7YlidJoBfM/8SdCE+qZoTDLqJwqYlJBZfLJX7LGO34SvF
	vGx7CMAAL5Frr6ELciaOyEsRCA==
X-Google-Smtp-Source: AGHT+IH7Ob5jHWVnFM8sBJW6D5pRWYa1Oj4+ZIyL7NLAPOb1b1HXP7i5h+shOUEsYUZZ/iItiE5YOg==
X-Received: by 2002:a05:600c:3590:b0:439:33dd:48ea with SMTP id 5b1f17b1804b1-43ba66cf24emr32434295e9.2.1740756761832;
        Fri, 28 Feb 2025 07:32:41 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:20b1:5ded:f332:cacd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b7a28bcfdsm59852675e9.40.2025.02.28.07.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:32:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
Date: Fri, 28 Feb 2025 16:32:40 +0100
Message-ID: <174075675438.58699.5156226276115874344.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <254f3925-3015-4c9d-aac5-bb9b4b2cd2c5@stanley.mountain>
References: <254f3925-3015-4c9d-aac5-bb9b4b2cd2c5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 28 Feb 2025 16:03:47 +0300, Dan Carpenter wrote:
> The gpiod_direction_input_nonotify() function is supposed to return zero
> if the direction for the pin is input.  But instead it accidentally
> returns GPIO_LINE_DIRECTION_IN (1) which will be cast into an ERR_PTR()
> in gpiochip_request_own_desc().  The callers dereference it and it leads
> to a crash.
> 
> I changed gpiod_direction_output_raw_commit() just for consistency but
> returning GPIO_LINE_DIRECTION_OUT (0) is fine.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
      commit: 64407f4b5807dc9dec8135e1bfd45d2cb11b4ea0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
