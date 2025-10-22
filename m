Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8862FB0A6
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142090; cv=none; b=sNalmOY8W3tBLOAK+0IXzLN8spvI3uZVGgbIe5DSX+BiuGYkDuE73iG3MSuxz6uLAXSqLs1M3fDazemHyhpYXmS5MgpJAjwmt1ciSnXdyMlfn0YQxa8mrV5WTaB62pgaCiYBlGlql+rCJzM1cwjFbcqPwOJp/CR5eDPvtDng6eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142090; c=relaxed/simple;
	bh=n6MZQWS9UxRif9lNNulxaU6i8BsuZ5VcpBJFujfN/yI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+rS84jnYbF9nlgWe2fdlV4mX8ZTJYLkAs+y46HKS7YvGp/6QEG/AC+YDzhypot+V0JsQEHqvV4biN7tpagJt7fRN8cOrSolZ8cj+Uanlk2qOpnU1Ded11AefKEyBJVXKd4HYsP0/eMhpiKcDC7M9fWZ1S5rDqO4aAhuyKK4/lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5jn9DZK; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5jn9DZK"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6ceeea4b46so12277a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Oct 2025 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142088; x=1761746888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxWecD44n8F7A68MtB2Gk3SGRDfmDIC8qrgGGOx9IvQ=;
        b=L5jn9DZK1yikZIa4fYdhTzlJ63nQ2IGV0pgyS0h6MHui7Dy3NnAliASW7jNf1YeKCx
         JUVyvP06V+4uGjBfOKA1hTOUBpN4oPi2vYGVvdLkBTO46LxH7WSj9twZBKg3i+DAQjt7
         QMQADk1l621dlM+rX4FZ90FicW6zpacAKxAbcxPAgimQgKo1G+exHITZAM1E+TAUV29N
         dLL44o0F6C04kA9v8Vr1gQnLMP/YbRQerRa9qGKL79ddJ47SY3rydvTqlCPKcS5Tag9U
         q3gkMnwnW88RRLsW1wqrBhZLsEUkM5NtHUaP+zmCm7rZAUaYLEl3BH5BjowFz8Dh+SUF
         2BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142088; x=1761746888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxWecD44n8F7A68MtB2Gk3SGRDfmDIC8qrgGGOx9IvQ=;
        b=Bj1KdBnUPUC7MqCJ430r6Rm0vKjkxj2KA6SWfUVBTwh9CUn15yEqBqZF7VLJT/OiIb
         z35TPfJUcSN49/gAXcQPl1bWTEf5Oz8XsrTQ7ZgTBhN4CNz29vuxXOp3vK6oDenzWory
         CYo1w79sIQF7pnRpoGn7SlxnEKX9MItZkKxfLS2FHMW8tYtEEB3jqwmft3oNNh2ARbWu
         EY7+PHBMoJMp0wHV9nB6OQmBIw79vJSntEbQ4BeZ4vVyswYsxN0P4Sqa82SRSJC7RhqT
         UTTWTKgc5iSwYSNlD5ORynAsny/M2KrZa8KheT/cWTaX7IWdWGjE6ujsiByrIPBkOCw8
         pkYg==
X-Forwarded-Encrypted: i=1; AJvYcCXxtgBq7lZywCTlrdbOxfRIDEbXLtaJvM/oL3zYk3pzV40GoF/lVO5dHSLJM2ZMGgWr30Ox5WXGZ6mSZK6eMC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF23NNDsHn5rPsvReoYTy6rQsfrjAv4qAvivHLWtysCNWuytez
	9+gpZQ8IH5jcGfRnxUPvIrFR6JX+jd/JfBhO+yG0NVW6LbVOE28x++QmnsOKWrHtTiGRTCHI+y6
	rvsI/2yjTPoHGIOEJuVAn71keiwxvvjENWg==
X-Gm-Gg: ASbGnctzzKsv6jj+4pwL+10LRNRQayCugtm9qQECIWH90dUwYroCh0iE0X1wzccind+
	Oj5gVIa1ipwuyZey8JpIEszhbuXv0M1EXFgSL9B/EKgHKf7qgdsMRH938N5WJ2CxqQnxSar8U1w
	ADtOYwOmU5H4oM0Egb3ERoi4QhJY8KOuFHkdHtLF2gI2GenF2vO49S1VrnHkvRi2IX0YKh4VQdj
	R5nqPdqogE1xBbgyvVCNPrDRY0ma4xFJjieTUUBoY+QcQ+BizibAY2iIkxB
X-Google-Smtp-Source: AGHT+IGM3mvFgkHnTG7QRIj/Gmy3p+LRuhhPAH5vukdmhYx7TsNqfkR+YhVrgCxY2EWb4hIpzDcGres9mluYuxqKhfc=
X-Received: by 2002:a17:903:120b:b0:28d:1904:6e77 with SMTP id
 d9443c01a7336-290c9d26917mr126853125ad.3.1761142087899; Wed, 22 Oct 2025
 07:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPi5_CILMKn3ZrVd@stanley.mountain>
In-Reply-To: <aPi5_CILMKn3ZrVd@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Oct 2025 10:07:56 -0400
X-Gm-Features: AS18NWBdUcj9BuAc7F-BssClfHNNkfo9ryZDxZvVPhEuoCs-u5I60K5betUL5-0
Message-ID: <CADnq5_MoG0s7K5wCaf8-32SWCnOeaPkYvDCyixem_w_jVBbgag@mail.gmail.com>
Subject: Re: [PATCH next] drm/amdgpu/userqueue: Fix use after free in amdgpu_userq_buffer_vas_list_cleanup()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Prike Liang <Prike.Liang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sunil Khatri <sunil.khatri@amd.com>, 
	Shashank Sharma <shashank.sharma@amd.com>, 
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Wed, Oct 22, 2025 at 9:31=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The amdgpu_userq_buffer_va_list_del() function frees "va_cursor" but it
> is dereferenced on the next line when we print the debug message.  Print
> the debug message first and then free it.
>
> Fixes: 2a28f9665dca ("drm/amdgpu: track the userq bo va for its obj manag=
ement")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index 9d4751a39c20..2200e0bbf040 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -159,9 +159,9 @@ static int amdgpu_userq_buffer_vas_list_cleanup(struc=
t amdgpu_device *adev,
>                         r =3D -EINVAL;
>                         goto err;
>                 }
> -               amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
>                 dev_dbg(adev->dev, "delete the userq:%p va:%llx\n",
>                         queue, va_cursor->gpu_addr);
> +               amdgpu_userq_buffer_va_list_del(mapping, va_cursor);
>         }
>  err:
>         amdgpu_bo_unreserve(queue->vm->root.bo);
> --
> 2.51.0
>
