Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5800B190679
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Apr 2025 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743697584; cv=none; b=Q1lghXZpXSQxrKPFPbenly+O+hPNwnfnw9TA9GWop9OObUKvmmd4EQWiIZ429sTz4GurDJ6IJpjCSh95FyBXpZkOY/btASkJaPvoYQ4jJPKBFaOCtayEK7YgI12mQzwGloIFDrfTrHIIROf0ztRdDQKlyl0GIWFYMnJlPDEqPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743697584; c=relaxed/simple;
	bh=+s8s3iJwvgJFaiQIGmpy8fRqd2r8FfQyKC/ROUIwOkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8Ohz2rwP2eAzYkdoBkzTDKbYtyUcZ5rTr3SHH39WcQX/wgiLONEIXdlk2RLjybUmcBXhqhC8/sVL5BqQOsJJnDtEvobrEKoZMs09Fwz+Ki3TrbVgZKFBBgWu/AM5bbbx2JgZyMMsiZzerRiF2tJgZcVx69aRxaI5fz+n+6iRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=tgsxo7Lc; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tgsxo7Lc"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f6ca9a3425so13620787b3.2
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Apr 2025 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1743697580; x=1744302380; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm8Etobzk8cCk6jshrfzA7BBUoXgq8Cf4UsElyUuFB0=;
        b=tgsxo7LcZTdvY+zIoAEc6qjvQDNyrDG+Y1WwmkZIxQ8yzNNgnbZxdl8nP7w4GddLc2
         vCv2YeH4OAGSc7VlvzX8Y36KKdQQhlBeNMM76yw/Lkfd6uiLc6YNog8IoXwxi005mrVm
         6buLxH2oNBplZYHYfiAaKF1dK5L6S64Spzb8tT2X5L+vNaaA9Hk8jXMH7HRvCBsDRLhq
         MNnSqk5qWD+uiLHE7qUFdn6fcfpo15f8sMdQoI6VFUR+WEGAECeSTs8cl9YjSJj0OnwF
         b+gxqZF1MJDMjxo9jJLPXdp/17vbd8YBV1KWORzO5lngPWhfkPckdR1wmW0n7lBMlB/K
         lEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743697580; x=1744302380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gm8Etobzk8cCk6jshrfzA7BBUoXgq8Cf4UsElyUuFB0=;
        b=W7BT51Kny/lV4lQUIuZ2IbriRJ1WxqalYiPym5cNUnw/uBB2m73nKuR/mpKnVgEjCu
         MTKILNbClI7G2A4kHTZj34cS8ljxqKzZllsAD4M6ZBdQl98aCgsxOGKkl7yGjP11QcpO
         CHZ8Hr6UFftgzSfNBn21uHL9vAvCwXqwMVSjOw7i1fl9jeWzu4F6hsbBJDnbJ8mf+LYj
         910KzQ1ckDKQcAKoeeqYDKUqUgupV6HS/JjCXRh2H8YxoGQIXHIupBHhnCDTAxDXu5V4
         z3bjzPHVcRy0vISWEZJXmXAvWHodK5JNvT7JoC4erD8SACk9S7JZmiex5xtmjwA5uWE2
         azBg==
X-Forwarded-Encrypted: i=1; AJvYcCV6j2BdhxT75YFZan8KeY/OS/9HMn9TsFWDaf9bEExO8VZRCUvct9z/rySqeZpfhwYwf8Eac9FkSUzezosZYNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+AssSqFvdoXQPptysehi2+lSAkKg7HD/T9jRB9CIDvoesNoS4
	Luj/Pl1oJwfsY5+98DTO01DeQnXQErkO3tF3uI/jcYIAuY1N/u4i/27EDcsj50fuveGm7RlRDm8
	m54nlODeBSeHiSRiNLyJncFfHlYGP0AmHhlZDuQ==
X-Gm-Gg: ASbGnctoe+HED8qG3UoL31KbeXaCPx43GMiLMGm95YKLv8g6C7nS67YzF36AmcIFBAj
	migK45iDYBbCao/+ey9aEWZuVquEiX3W53TsoH+yTPu1juQFuM+AA5NapjTmzMdvX5ZS4MJquvO
	7CF0iHA71ROXEmK/vtfq8x1rWYINzXD9jyD4KVZ6Q9JLZKjNUt8YS8axZYcisVgOcizXmu
X-Google-Smtp-Source: AGHT+IGs/lOpJlBNxZfkClJkSSGiTQDpBO7ne5t+K8sFSvFVEpfHXiFzI6JjuxfYULF42IuuaAUSHa6+5r5ZRFQKL/0=
X-Received: by 2002:a05:690c:a8b:b0:6fd:4849:62da with SMTP id
 00721157ae682-703e1581140mr850257b3.22.1743697580267; Thu, 03 Apr 2025
 09:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
In-Reply-To: <ee4989e2-f55e-4d09-8a0d-306b78b9c9d0@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 3 Apr 2025 16:25:55 +0000
X-Gm-Features: AQ5f1JpvJpXj_gh69LgHu7W2pAa3-WCUx4V9ie5tB7F6PHPJUleIgDiNR0yj7Fo
Message-ID: <CAPY8ntCCvXObQ_7GNwjqNMB-=1ucy9WsipvptgvPxk3p2R3Ryg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vc4: release firmware on error paths in vc4_hvs_bind()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 13:14, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> There was a bug where we should have called rpi_firmware_put(firmware)
> if devm_clk_get() failed.  Really, it's better and more readable to
> move all the firmware code together so that we can release it one
> time.
>
> Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks for the respin

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
> v2: Use a cleaner solution
>
>  drivers/gpu/drm/vc4/vc4_hvs.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 4811d794001f..06aedd906d74 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -1675,6 +1675,17 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 if (!firmware)
>                         return -EPROBE_DEFER;
>
> +               max_rate = rpi_firmware_clk_get_max_rate(firmware,
> +                                                        RPI_FIRMWARE_CORE_CLK_ID);
> +               rpi_firmware_put(firmware);
> +               if (max_rate >= 550000000)
> +                       hvs->vc5_hdmi_enable_hdmi_20 = true;
> +
> +               if (max_rate >= 600000000)
> +                       hvs->vc5_hdmi_enable_4096by2160 = true;
> +
> +               hvs->max_core_rate = max_rate;
> +
>                 hvs->core_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
>                 if (IS_ERR(hvs->core_clk)) {
> @@ -1689,17 +1700,6 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                         return PTR_ERR(hvs->disp_clk);
>                 }
>
> -               max_rate = rpi_firmware_clk_get_max_rate(firmware,
> -                                                        RPI_FIRMWARE_CORE_CLK_ID);
> -               rpi_firmware_put(firmware);
> -               if (max_rate >= 550000000)
> -                       hvs->vc5_hdmi_enable_hdmi_20 = true;
> -
> -               if (max_rate >= 600000000)
> -                       hvs->vc5_hdmi_enable_4096by2160 = true;
> -
> -               hvs->max_core_rate = max_rate;
> -
>                 ret = clk_prepare_enable(hvs->core_clk);
>                 if (ret) {
>                         dev_err(&pdev->dev, "Couldn't enable the core clock\n");
> --
> 2.47.2
>
