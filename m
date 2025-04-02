Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE50238151
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Apr 2025 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593722; cv=none; b=jBPBXwGwjtEammsrRJ9sdhBiCbnJNAfRrERyTvlMzgk4lweiKw1WTzPUuS7czarVXVCqaTJhZIEAe6QvLeyugVyg6hJY8CE6jm4uW6h9UIJKtniEgqghujZYg6PzA/u5fXzWRL57kIppUg4MZdONhpSd6ozuPlehDbZebf8hmYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593722; c=relaxed/simple;
	bh=CMMMlPjZNL2MskP5JZ2m0ywYhfJzY2Vi/GF+ouYfsUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhKyl9REHvB9Q5hDpNlRmVikCnmE2j93k7d27ZsmF5n55A0MXdOys21+4Kq88/KLnIYA1EFbXrB/2l/e/YusGIL9bZVo9nK8p2577BhljWxXKrdtn7EBOPXi+oYV360rLP+bYxLp8F9JW+c6FoFwjsY347Rn4SBY2Wmwz9mZWTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=MEIVzlYi; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MEIVzlYi"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ff07872097so57880067b3.3
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Apr 2025 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1743593719; x=1744198519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s1/KlpYm3UM4GjlGHXNbUdwP3FIBF3TOQzxxk/M8qKo=;
        b=MEIVzlYiB5Ftp78/K6i4LEEXLcfhY9MZ7/YUNtkBsB9E7sy1bxuW+Um/TuqRWXVtWH
         Lk6WU2AgUQ9MWocnIaztPZ5fhsVwcS4/Ia1cMJ3HPFG0IQQr/QmNMgFIp833KON2tc04
         m2wRMZLXpqVWDe5Pbr0FqIwhjV5JVzXksZkrE8Lh0jvRfB/kFsxqW4cuUce4kf9b58EH
         6DS0Eyuczwys+mc0Qf8s1P4JHIvvYcYuW2cQevL4RC95Qc23YPX6gLB4/K+kWB9P6uqR
         t9yubM6FSI8Xd3vfhkOUH34WZswdkucLuF7J1vAJnIgFkjFpA/D65VI69K0tiCLy0z/f
         VQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593719; x=1744198519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1/KlpYm3UM4GjlGHXNbUdwP3FIBF3TOQzxxk/M8qKo=;
        b=LZH7zS3qviXhaIVRkyTdCdmIbmDndwzBNEzaipc4bccwlOKxcnixGTQGPKfqdW5kcM
         ZlcMqWREb1azJqGPr289T3QoKRtuhstbnbw/kon574PLXjwHpaoCtMzEE05ktjq7cHCf
         F+ytNBQ4lewG0uzGNQThBPSSndZUQcWT2OHGG++/8yYYoojRm+kqJCPnao5z1/takbtf
         ndHEB+MgYhdVqfckklClkTnE/Atf5a9YnSndryGAcsyaf4fUDmvl5yKE8fZWuRUEEHSA
         kgZtv/hvXONX7NwqAy1bcqOu6X1xFZjZvZq1sHGu9+0won+mbWKDmYbV8LOf1osEdETW
         W39w==
X-Forwarded-Encrypted: i=1; AJvYcCXlcQ/rxrEvBV00HchWuMvGW3Gh/M0m8OIGpcweMR3NgRJ5ZGg1yOkVCSaYXVTBeZFbVx23I518fcOGI68pwNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLKqcy5lEmk8FmfnA1EmdJi3VBpR76ox7J627O52p7mzQ1J4v
	s5gBfzZV/S5Ylf+XCF0nP9Vbnuu/66jf274iMF3Zd5iCnAwgHXwUz82BXo+8vNk2CYYk+24LRFC
	qzOUqfrYVDEVTl9zWGJrWgQrLt3sErMoB4UWd+g==
X-Gm-Gg: ASbGnctN+O9fPajkyBdYH+JrfRXrEqrpEnccSRS/7JvEcGKLMzaGgwfxTAAkeOQtPMX
	r3VHZaf9YTxXfHDyTjYuyFpr/5a26hRRjZXCUQy5HFqbD9t7EToF/k5bY4uEVBVn8p+6DdLsYQr
	TG4F+LOKnYF4EQHTa5MF2FcrAIX6Ac4ia6Hez45Gx5QhDU9uyZux6EtUHMEdu8PHWJlpVX
X-Google-Smtp-Source: AGHT+IGr8Yxz3zfQtp5zVjqj96xcJ11TwxaJBj5hp4ypVaFwNYzSnui2oiuDQ1M/uFDaiwTUhmCsnNbBU6oKxM6+wWo=
X-Received: by 2002:a05:690c:4d82:b0:6fb:1f78:d9ee with SMTP id
 00721157ae682-702571161cfmr249550377b3.15.1743593719430; Wed, 02 Apr 2025
 04:35:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
In-Reply-To: <8305d098-bd28-45e6-acda-29e629dfccc9@stanley.mountain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 2 Apr 2025 11:34:58 +0000
X-Gm-Features: AQ5f1JrgSH9_HopXXMS8ZOVaiXusrf2OzR6y0mAxNfEdCRKuLRfnxeiLZ3pZEkA
Message-ID: <CAPY8ntCtAdWg1yN+DgxRe3np4Nu3aDUrrdqe4Q9WeqJMtbrrAg@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: release firmware on error paths in vc4_hvs_bind()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan

On Wed, 2 Apr 2025 at 12:00, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Call rpi_firmware_put() on these two error paths before returning.

Ack that there is an issue here, but it seems easier to me to move the block

        max_rate = rpi_firmware_clk_get_max_rate(firmware,
                             RPI_FIRMWARE_CORE_CLK_ID);
        rpi_firmware_put(firmware);
        if (max_rate >= 550000000)
            hvs->vc5_hdmi_enable_hdmi_20 = true;

        if (max_rate >= 600000000)
            hvs->vc5_hdmi_enable_4096by2160 = true;

        hvs->max_core_rate = max_rate;

to before we make the devm_clk_get calls. It has no dependencies on
having retrieved the clocks, and hopefully means we don't get the same
type of leaks creeping back in in future.

Thanks
  Dave

> Fixes: 2fa4ef5fb943 ("drm/vc4: hvs: Create hw_init function")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hvs.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 4811d794001f..41e9d0aff757 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -1678,6 +1678,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 hvs->core_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "core" : NULL);
>                 if (IS_ERR(hvs->core_clk)) {
> +                       rpi_firmware_put(firmware);
>                         dev_err(&pdev->dev, "Couldn't get core clock\n");
>                         return PTR_ERR(hvs->core_clk);
>                 }
> @@ -1685,6 +1686,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 hvs->disp_clk = devm_clk_get(&pdev->dev,
>                                              (vc4->gen >= VC4_GEN_6_C) ? "disp" : NULL);
>                 if (IS_ERR(hvs->disp_clk)) {
> +                       rpi_firmware_put(firmware);
>                         dev_err(&pdev->dev, "Couldn't get disp clock\n");
>                         return PTR_ERR(hvs->disp_clk);
>                 }
> --
> 2.47.2
>
