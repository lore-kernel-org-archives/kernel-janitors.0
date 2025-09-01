Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7C62D594C
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Sep 2025 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741275; cv=none; b=hKvkkNKa7coYQ6pYtguP5dm4O5ZL2gUMvRMURv7yamJpa469814tDSO1VWpdG4j4XyYCEHvv3xaCoQuHSN08lKUVxccyxJnRVYl2KRq//L4bENvd3soNYgSeW2eOI8gbXc/lfwTe6oPTV+IpMNWbkhMI7jUT22uv0EschKnAD7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741275; c=relaxed/simple;
	bh=7kFVcfD+IxNCst6vSp3QY/q+xJYIwtMvDsluFn4y28E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ze4fDd1HyezZ4ucgN/nJRNpq7LKu48uwi1l3S71bMytdCS3jrVe1ZkITzXTvxIWAlkIkWolC+npLu9E+XIYE9JWtfVfTZT0cBpIw5J0tif8+0KbPDUQ7Fa0vCl1B9YdjqLZvYeKt9ipUgQx/FtBrLwysNNyE6au9YweV5jjXC2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=X19rsRFz; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="X19rsRFz"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e96f401c478so4064449276.3
        for <kernel-janitors@vger.kernel.org>; Mon, 01 Sep 2025 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1756741273; x=1757346073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHKEov60ZzmVR4/OSBANPJk+KzVHprHoCBj7JSL3kNI=;
        b=X19rsRFzHQvkLQ6cD7CL9FiR5rxmWhVIkJojGCWaNq6pHe2OxqKj+lT45O4i6r94De
         yGo94gFFo4KhdF7Fgvfu9xVojEGoEwbDM7WeVu7YojDIZh/Ses3oFN4cmc2VfPBu3gRA
         Iic5xYUp7hDepbCcvfw2Qb2Wc6OY1qEko6LllzbSnc1MIppuTUrUTKLFugqv5ag2bNhk
         JIY2fRFKQ4tqPyMpSHGmrPWR8bTMbq6PyBLS61TCvE795IhBhYUvHQHJF7nTZKmd9ERP
         0yJ0vfrLhV/Uw3oFKwLki3hGaWmYcS9XHb54UQtrpO3DSZVGN22yvF1Abw62eYt61+Ni
         LU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741273; x=1757346073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHKEov60ZzmVR4/OSBANPJk+KzVHprHoCBj7JSL3kNI=;
        b=tB7FDenUsQ1WsP7GpN6gx7m18ZdRpg7m5HFOcuO/6BtpQdHTi24PtmO2yTyduLjpas
         3YxRtlrZeRTWOrssrcbl8ZxTTHFPZCcGvW6s7Dh+f7BM0FiR8UIPMym9wvcfJGQwySuu
         YiBlAbdvoDjGi+RFt2QJyLagX661cXjggBhhVy1YsXI7INKRsQOV6A/acluRqAxOGRKT
         4XmXAI7aNZH6kOGscmqL8HeS0DKrFha1n/QqtP9on4M+pE2FrxPwhxYnT6qMN/29owXx
         fjcy7zGqzs/kBwKcwRBROsnM49xM/UjWqkY63XBaz23pWKAyQAjDv2OE8SZzWZW7rlaO
         JyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2E9ioC+IX8WLJT6ZW7vu0lGth/PK22TTsGZL5k9Dw68vNTqnPMv0I9B9eJZfP9v6dwwVRwQ9+Rdal8lMoYVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywql+Q/KLdxcL2TqsONEhqECIsyvX2SZHkD7PerSw9F1YRBvYkG
	CLl0zBI9sF/dWiACAzgYgUTqL34r0gGoSpfT+1vlPFf2jq9pgtvVX/pX8DQIyKZzgh4=
X-Gm-Gg: ASbGncsvD3t6TdCaT8puiOm7EI5gy71zf+XHMaSGkMGdTVLbj0ig+AK9OEjLnF74WpU
	1Vaftu3JuGZmiIv9D3Jk5aaWN3gc9rWNtQGNvZlxpBy15e6ZC7QWu/8dKvgj3HHAHNK0OqxGJaD
	SkG8cy6hFSGcYNUjmrBopSWZqXtydGxOq9vCHSm+hzKLUV2GOyWiPTAN0UIEwbBBZmC5q15h6Q6
	PXZS0Tq7o8Qzxbdm32X1IT+Wb9ifj4B576sp57lYKa9p+aDvNFJynwnyZaS7guCd/P7BbZuLGmY
	XtWGeRzYmcJsy3guihC3bwLXxnIC3XsjKX7JRVrPyLearBEZqdm6gmJvmwDH55Esswp1yXdYl2/
	/a2SRUhxPNUSqX3ZTNXpWim8i7uzSHbZehlR10UZS+hTBN3a+UCzqInXvMCUJctPQ2mk8vG+Ueh
	RawzMDvn1KcNo=
X-Google-Smtp-Source: AGHT+IHshmBrcDbRWHW+DIQgXjYuWEls4RUO7+NexTMMLQQCo/dX5rge0WSIMFgz93lRWnOjPAIL3Q==
X-Received: by 2002:a05:6902:2b12:b0:e95:1cac:6393 with SMTP id 3f1490d57ef6-e98a5759c26mr8458902276.11.1756741273205;
        Mon, 01 Sep 2025 08:41:13 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e98ac5aae52sm2088280276.34.2025.09.01.08.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:41:12 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d605a70bdso27902587b3.3;
        Mon, 01 Sep 2025 08:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDSX0KE8GrTk67c6gHAkO0vJJX2wI41+DZZ+izaKDeVT4QpWiXCe9YTSnqxSejAJQpogmnEH0o+JngvJUh@vger.kernel.org, AJvYcCXhi1RE6QfnHFrrwG5uFqpuy2QOYPn73KpByKxb7id5Ih7/g+AaQx8JIiyYOOx4eI55xFghVZ9OunHrKTdxiog=@vger.kernel.org
X-Received: by 2002:a05:690c:dcd:b0:71f:f866:bba4 with SMTP id
 00721157ae682-72276399149mr77541167b3.17.1756741272503; Mon, 01 Sep 2025
 08:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aKcRW6fsRP_o5C_y@stanley.mountain>
In-Reply-To: <aKcRW6fsRP_o5C_y@stanley.mountain>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 1 Sep 2025 17:41:01 +0200
X-Gmail-Original-Message-ID: <CAAObsKBCPMzXV=2F4M2PrsES1M+0OHA2ZJtmYTuQMPPd1u34Vw@mail.gmail.com>
X-Gm-Features: Ac12FXx7SKvTTtIn3H-UONdlJo2MpxhJozLfBtiot7SO0qywsKGbTt0HEy5Ygf4
Message-ID: <CAAObsKBCPMzXV=2F4M2PrsES1M+0OHA2ZJtmYTuQMPPd1u34Vw@mail.gmail.com>
Subject: Re: [PATCH next] accel/rocket: Fix some error checking in rocket_core_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 2:30=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The problem is that pm_runtime_get_sync() can return 1 on success so
> checking for zero doesn't work.  Use the pm_runtime_resume_and_get()
> function instead.  The pm_runtime_resume_and_get() function does
> additional cleanup as well so that's a bonus as well.
>
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/accel/rocket/rocket_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Dan, I have applied it to drm-misc-next.

Regards,

Tomeu

> diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/ro=
cket_core.c
> index 72fb5e5798fa..abe7719c1db4 100644
> --- a/drivers/accel/rocket/rocket_core.c
> +++ b/drivers/accel/rocket/rocket_core.c
> @@ -74,7 +74,7 @@ int rocket_core_init(struct rocket_core *core)
>
>         pm_runtime_enable(dev);
>
> -       err =3D pm_runtime_get_sync(dev);
> +       err =3D pm_runtime_resume_and_get(dev);
>         if (err) {
>                 rocket_job_fini(core);
>                 return err;
> --
> 2.47.2
>
