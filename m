Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2591D0DDF
	for <kernel-janitors@vger.kernel.org>; Fri,  6 Sep 2024 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632708; cv=none; b=bAJiEBLnR4J4hDdJhjn2iDvNYUQFMYj+6B5iC1nm1KvPxGZqpTQyavZjHspy8kT2Ly5s4YMlhBqflqdd7yxtyFbqrPqurfLD3s4k+zsXqT51kcYSY/qfj6fD6gPTa/QafXJX4+kaVjktiSDsgnpU+NCKiEDGdimbsL5mROxwqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632708; c=relaxed/simple;
	bh=NVJfO6SPhpTnYD1CFBP5bziNAgZr+IINawp6SK6Qrm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEGzpMjr7JoLACIIhqdXN7r+Vsl4uXe3GKbnqpsH3Wggll4+Bdz6RHEIL9g8sc3bM1+nn4P/d7FAAXvD4Ju+bElhlcJdi/eQT4hRmFsBeaD05b6z47Zz/+CIT+czs0FOBxmF3+bFBKaoEFpNuUR6aOogWz4sPK2590QlNNGPpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gx5/cU8F; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gx5/cU8F"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7d50ac2e3f8so198989a12.2
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Sep 2024 07:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725632706; x=1726237506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOjxjW0E7mrhCHOj00DUfJG7I+XVl5lMKnSmx2DxXqs=;
        b=gx5/cU8F15mUPU287zDQy9FeMfJPRfZ6nxQ+7lIr69Y0isDYUrsa1uVF/FZpPOM6sS
         pC+2/jwFvlTPR00B4ZVYrJqYUYFRDQ5rq/3cnX/bcBLLU9QCd+E5m/76lay4iJYwDE0i
         fIv7iYWWO1+JJxq5KGlxJmb1VnX0S3/dtopNVNlso8t9NVe8036lWjbfFYhw5CpqhIz1
         kIEIzXtLozw4W2MoL3wBGMnPVPRjskF78GsP5yZqAM20FCv+hgGAdpSs3rZ8mwKlC+0j
         ElrUngYQ2BNYEsR5P0LxOIBxiBIDvNRRaaowUY/1eUQyiZ0BubSEkuUoUkeLSYxEd2oH
         evPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725632706; x=1726237506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOjxjW0E7mrhCHOj00DUfJG7I+XVl5lMKnSmx2DxXqs=;
        b=EQM6m2zuO11bhGh4fLZPnh0Fj4SSfjmwTTBD7hr/I+RKInt1xEK3tQ4qyblUYMcqTo
         JKCXX0KV8WhIy7KEA19sji6dISuV7qYnvNXoN1/xBMYjg60ISNHyxAy1CYbB/e8Nd5zb
         lfPt6EkjqLTS6llXoEIYVsbhTqwmUh0X2CESUzLRn0uYIzlXZV6SeGKnCknbuJs4RzAW
         6atQcDdLWjQXsWSldj6vZ9PGTiMzD5Xz1+tiE7wwXLJ0haCzX+Ywsi0cXEtFppVi6IJc
         xoupH21cNE4x7BagV+yOXu00WzQDsl+1A2ch24cNrhwu3E1MX31XvoO2a0f1tSDHvWjp
         a3jA==
X-Forwarded-Encrypted: i=1; AJvYcCXErHBe9BEHGnDd+Ke/JXcF8ezeW3U4KS+2lVcb+KF9u3PZs4kFa0yE3/J1E9lOj3yp0jKhKTTzajJLFl7fE6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCOq/slwq1QvEZTcUvjPCjJqZLudPEIi0bd1qsECQtwG+rd/Gt
	mP1jPXxcK7Oz2lWZV5PfPHbw8eFugqHnogtSdOC1f2ELrbb87YrhNW8MiGqFIuhPDjP5nSlkItl
	fbsN8uaS2jYhJJ4JoI197XzpTj7E=
X-Google-Smtp-Source: AGHT+IEy5rWOKJ5Gz5F3bS2JgBwgff8Yo6Ip762+uWZOvxTJEfguBwNyFf9HUm99vRoGB/LuqXbNra//CoFdpiMhQDY=
X-Received: by 2002:a05:6a20:914b:b0:1c4:f30e:97ff with SMTP id
 adf61e73a8af0-1cf1d25f025mr1615569637.9.1725632706146; Fri, 06 Sep 2024
 07:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4152e10c-2ec5-4ac3-be47-c97fcafdb35f@stanley.mountain>
In-Reply-To: <4152e10c-2ec5-4ac3-be47-c97fcafdb35f@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Sep 2024 10:24:53 -0400
Message-ID: <CADnq5_PfCeCA4ZZtHBB1KfM5NmFoYh8eFxXH3r2nSJ7XMSOKhg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/mes11: Indent an if statment
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jiadong Zhu <Jiadong.Zhu@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jack Xiao <Jack.Xiao@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	Yifan Zhang <yifan1.zhang@amd.com>, shaoyunl <shaoyun.liu@amd.com>, 
	Sunil Khatri <sunil.khatri@amd.com>, Tim Huang <Tim.Huang@amd.com>, chongli2 <chongli2@amd.com>, 
	amd-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Thu, Sep 5, 2024 at 3:08=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> Indent the "break" statement one more tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/mes_v11_0.c
> index 0f055d1b1da6..ee91ff9e52a2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> @@ -415,7 +415,7 @@ static int mes_v11_0_reset_queue_mmio(struct amdgpu_m=
es *mes, uint32_t queue_typ
>                 /* wait till dequeue take effects */
>                 for (i =3D 0; i < adev->usec_timeout; i++) {
>                         if (!(RREG32_SOC15(GC, 0, regCP_HQD_ACTIVE) & 1))
> -                       break;
> +                               break;
>                         udelay(1);
>                 }
>                 if (i >=3D adev->usec_timeout) {
> --
> 2.45.2
>
