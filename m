Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116A726039A
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740740800; cv=none; b=CJAWa0fsx8r3we0/6fxf5PNCAIL1coV7a6rJmEW/8tsXTlL9Nc5QULHHuP1FHz5YhWr+c0KGyIvzK8imDlZHdY2Zwj78lSobkrd00MvkvMwaT983Q4qzpkYjTP2KqI2h/K20WcbErh3Do3SvCQQlCnYtcAeipYw6vzTnLSsLIu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740740800; c=relaxed/simple;
	bh=PqzNhXG8rEzrQIahSpPfvm8F5A9fOvQwMmFjKMVbc+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEyJcKoUgONaQAdZ4lb8NA6h0n7UhOcq31IQnaFxAlnV07fnqwaozcqcMJO3C47S44D4yhw4kDimEvzwCTA4gbhgBYIx42eocPkvK+sHxWM6RI6fQjloUYySkABTQX5y6TY/arRo29CYTuZyB8ko4CUd1GJ8V9yYsDVYEd3i4Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AksxK9oA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AksxK9oA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fea78afde5so2363610a91.2
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740740798; x=1741345598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuWdIFYbGdIGzbdoqtKFKJ3QGnIaDDX+fXvfRKGdsQ8=;
        b=AksxK9oAufkksBakvAlBXxhS4WgoV29qWAt6qVsSZk7NfjSapzCbtr1FP1Y2+DpbYK
         GelfCW3i04E967RKOBD5khXl0cbvpB8zKsbjmaI8ENf31r4Im5r6Hp2yD7H2vmzh1dR1
         R0qCrmVAOJHYeIYRE0cHoMmgjJNjP53P+w+klHaqwuvRPvV05ZJ7gyLtTLCTkb3W68RK
         sN3V+XcQxRjuRlZFQd2TgdGJb42iRo+vriJhWyBycK4fDeVnCs5tKcz7OLXtbtNNkRZk
         PHWRvjPI7VnzCGn08HRk7z9R31q0HcgUCbmseyUE632ocMV5Jvn0TwCoD/im0iWX03xu
         k5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740740798; x=1741345598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuWdIFYbGdIGzbdoqtKFKJ3QGnIaDDX+fXvfRKGdsQ8=;
        b=u5DYc3dNyNAB2jfYhbxy/IvEteQ+AHn/6GjHQijFd9kwuw3FTa67jANlXORmO4Qu4E
         ccO5KkwbwttyzJIK0rJvEbiJWTviRE9sdLS+GJTUX0s5xFiN7fpmrV39mNN/8gQbUvUd
         zpY17n7fdH96WKE8YjlcspUonWwZYVkaTJHHjpmGG1Ymdf9GDwuxnbdfIrMllOu5P6lh
         SXVstG2TfSXX07eAhxLrkL5XuQteEKD0EdQQmaluzUXDX38VmKXg8McBGXVwBoH6WKYb
         dmEj31V6uHp42NGwPcbL7WuaFz+SoOuHbuYWH058asQbMSJ3oublN0WJGcxXFStGrdKn
         OBkw==
X-Forwarded-Encrypted: i=1; AJvYcCVN7jZRJ/Q/dKmUAg1Q9+BCUVmK7e1Z6TFjuSRlLN+rP1Qs53iwLxp8MwYSos290gWVkMf6gup8Vv2LTii9218=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMw4xHn4cPuiTVROINC3AbESp2fvyFW33DKgoi7V9TZzfJL6e1
	jAQupEIW4S88e7KRawUGXUj5/bkvzonFgdhlFnRdfKf9P0ffKKVY5RMeuxupWjALEft5VKCMy3y
	i5i12BComTTEj8EAkm4GD8AJXMPhCGBQwYfpihg==
X-Gm-Gg: ASbGncvi+m26CnmGMVEHi/NQcJSNaKiVmbuSzeJ1IyyyznRDsH0ISRxZ6EeN4dHlkto
	7TKTyT8QcfWMfKR0W5mqsq9oDMGdU+NjJePWioo0aS1+qxfLeRMTwxUtD7Ie+YLZ/SyMVXtt35K
	eoZVVuleBIbWCdgcgrPNEMv7bX4HOjTPhqIFhVCrw=
X-Google-Smtp-Source: AGHT+IE14J5EyrjT41IPrMy+AQqz4ht6I0+szOFBOfKDh5RgLjx+o6ItD3Gjmbn3/n+lVnncYUTWUZPZNtHUAosDJvE=
X-Received: by 2002:a17:90a:e703:b0:2f4:43ce:dcea with SMTP id
 98e67ed59e1d1-2febac0573fmr4660509a91.25.1740740798309; Fri, 28 Feb 2025
 03:06:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0f3ea3f6-8ae3-4352-b790-de0642edc4a2@stanley.mountain>
In-Reply-To: <0f3ea3f6-8ae3-4352-b790-de0642edc4a2@stanley.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Feb 2025 12:06:24 +0100
X-Gm-Features: AQ5f1JpeV5ycRU3DrKxW61_3nMWiAgdQ9swVjRcBZJsLsp0orZtWoPZ9LK6Zx_8
Message-ID: <CAMRc=MeF42NeNJ_kR7H7oJsCHt=grTtN=c-3RbjFhX=uRQ5X9w@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 9:17=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The gpiod_direction_input_nonotify() function is supposed to return zero
> if the direction for the pin is input.  But instead it accidentally
> returns GPIO_LINE_DIRECTION_IN (1) which will be cast into an ERR_PTR()
> in gpiochip_request_own_desc().  The callers dereference it and it leads
> to a crash.
>
> I changed gpiod_direction_output_raw_commit() just for consistency but
> returning GPIO_LINE_DIRECTION_OUT (0) is fine.
>
> Cc: stable@vger.kernel.org
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_d=
irection()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

This doesn't apply on top of v6.14-rc4, could you please rebase and
resend? Thanks for the catch!

Bartosz
