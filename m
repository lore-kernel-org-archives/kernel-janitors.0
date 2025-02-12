Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D3209669
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354479; cv=none; b=SPRQG1zSojD6CJk2sOsdj4pgSJL5fhzInNqxjR9ATqr4bq36B4V0AXrDojB+AUPatqGHaRTbo6Ms+zDiR07MR6oGyk2s065lYj2DyiYjMNqQmzIwvO6wx9x7DH10ULC3Yxb7gqHeojy1vOkni8YgH4lw5oy85rUZ0u3l8eer8yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354479; c=relaxed/simple;
	bh=sLtMNl2PIK/GBgnQIKx/qPFCh0ea5y3KjwR+JGxQbxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtQdEcTM/O1IAw7qZsdpOVy+psFvjEF9fBbVQGNYvkMy1bT5qxg8WkdfKHZ5iHuTFtFunYVDjAfUpw+r98FQrhqxbjpsFAX+UOsM4qOIh3n80jsmXV9bOgNqJznvQpR5DRNFNx55QashVRJ9FwyrgS0VQjaRy7vafbKQdIgskw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ag+g7u1q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ag+g7u1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739354476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k10/aEW9kI4Fw7g7ICooPKDGPu1yctxg0l9c8ZseCIM=;
	b=ag+g7u1qDtYw/QcwbCDCqqQ2lfEpfwLaab9xlmie5m+S8UTLb6pOvlZL//kQIwfKDAsq41
	hQF8WUT9Y+3wRTNLBtPrAHgUTavzMtOQQvNnsWxor1X71VeZrrLKqKLoZxEp0BlwVzuuPd
	BeV97o+4a1mGPPmBLrNX3nIVvTYb7uY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-4VF4PnetPe6IJMIW0DAZLQ-1; Wed, 12 Feb 2025 05:01:14 -0500
X-MC-Unique: 4VF4PnetPe6IJMIW0DAZLQ-1
X-Mimecast-MFC-AGG-ID: 4VF4PnetPe6IJMIW0DAZLQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fa3b466245so9082294a91.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 02:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739354473; x=1739959273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k10/aEW9kI4Fw7g7ICooPKDGPu1yctxg0l9c8ZseCIM=;
        b=SExk8X9CszTKHpt1A8LXIjAwiEdSG3CVnZX7k466OdLX8IqPAgRRaXFfH1P/5WIgFj
         KYCR2j2hYJsKwJjmCXd1yoHFkcCcpQOBbgcrE/lRUchKGvTuUW6IduJcduh4yMWwYU9S
         ZEcUHHA0gQs9l6WUGXj+R9Vhp5BrLEVQmJNZJOAgnRTcDX1kGzfCCbokGshqzyJZffTT
         Ajk+p9grrNt0BH0AolDFQC0Uk36XYWdsaygNmaMNL1c1g3O9HsTmMcTUDow4SbRUbYyn
         TdTpa8y36mJKKPhqQtNeW5S2oOUEF1b+8u7g9tCC2IYjaQK7u4q9hfl8xb+o7I5bd/Tx
         6M+A==
X-Forwarded-Encrypted: i=1; AJvYcCXvYUO0PnpeLZDdby/AGMmbvRfVx31oDlIRv6SdQZ4CDyMzARLSur8++pHlXgDVA02Xtj0eHYUW4YuWCoplPAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNi00wWN+KDUnTGnvibTDhYv6o1pHjfBcnbZBvWe55RG+4Adfm
	7m7manBO182VwxGCIP7sNEio+xLkhCHlx2C+MHukpmHIxzfKCKjaZmkc10T85ktS5zKdr9EO/u2
	V0scbOjFRpoUOunYq6mewcOqO6HEWLxlHPQWKl4ROKou9y37OU1QvFSXHr+YD+FJ1PzEK3bdDau
	5QPW40kbtvUhXkgNBZvJYLhFKOhlroyi3krOjT5r7g6G3lRqBNElOAC80b
X-Gm-Gg: ASbGncsPUz+x7b5Q0twV00HG1qVjv9DNCTeWl2v/6aORJNo4jrNat4M2oJow9zKgVSl
	s827Q2VrXoGYr8CYH/1yWdq9H+u9AhEPBDY400Rg8CEkD5DIPmPtZ5bfFYJqb/LNZNmi6dwUCUz
	6dm7Hhs6nQU7fgmewHZ4w=
X-Received: by 2002:a17:90b:3a08:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-2fbf5c6a05amr3885260a91.30.1739354473033;
        Wed, 12 Feb 2025 02:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHapn9jYWGyKoK8rERdyukBRLyP6apd4I5Sp/cSU8BhLWDuyyGc2UAEQe4Lq75zmYbK/CB6jhRtH7HcRUIhM4Q=
X-Received: by 2002:a17:90b:3a08:b0:2ee:db8a:2a01 with SMTP id
 98e67ed59e1d1-2fbf5c6a05amr3885222a91.30.1739354472720; Wed, 12 Feb 2025
 02:01:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 12 Feb 2025 10:00:36 +0000
X-Gm-Features: AWEUYZn-hP_kxTTtLow8M16VioOce2ZF8-IggRFFQ_uJOeNCeNsgfNjbEVocXew
Message-ID: <CAOgh=FzNk089VSrLbuAS=UA45dpY3mVFoebE2xg5ZGvTrtmVWg@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>, Jens Axboe <axboe@kernel.dk>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, 
	kernel-janitors@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Feb 2025 at 09:08, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> This code calls kfree(bfr); and then passes "bfr" to rtk->ops->crashed()
> which is a use after free.  The ->crashed function pointer is implemented
> by apple_nvme_rtkit_crashed() and it doesn't use the "bfr" pointer so
> this doesn't cause a problem.  But it still looks sketchy as can be.
>
> Fix this by moving kfree() after the last usage of bfr.
>
> Fixes: c559645f343a ("soc: apple: rtkit: Pass the crashlog to the crashed() callback")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

I wish we used the attribute cleanup stuff by default more in the
kernel, it would prevent a lot of things like this, it does what we
want it to do, most of the time.

Although I'm not sure it was introduced yet when the code was written.

Is mise le meas/Regards,

Eric Curtin

> ---
> This is based on static analysis with smatch, only compile tested.
> ---
>  drivers/soc/apple/rtkit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 4b0783091a92..1ccec7ba640c 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -360,7 +360,6 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
>                 apple_rtkit_memcpy(rtk, bfr, &rtk->crashlog_buffer, 0,
>                                    rtk->crashlog_buffer.size);
>                 apple_rtkit_crashlog_dump(rtk, bfr, rtk->crashlog_buffer.size);
> -               kfree(bfr);
>         } else {
>                 dev_err(rtk->dev,
>                         "RTKit: Couldn't allocate crashlog shadow buffer\n");
> @@ -369,6 +368,8 @@ static void apple_rtkit_crashlog_rx(struct apple_rtkit *rtk, u64 msg)
>         rtk->crashed = true;
>         if (rtk->ops->crashed)
>                 rtk->ops->crashed(rtk->cookie, bfr, rtk->crashlog_buffer.size);
> +
> +       kfree(bfr);
>  }
>
>  static void apple_rtkit_ioreport_rx(struct apple_rtkit *rtk, u64 msg)
> --
> 2.39.3
>
>

