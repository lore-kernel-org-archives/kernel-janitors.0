Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D94B2FE05A
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Sep 2025 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268740; cv=none; b=inF68hCmNmK6chagHm3Ra0swbDMkTH2Cs1js0L8LmClGHzTUPmuJlcJ89FYO00omN7xuc1uqw32bj2MYXa0E5QVfCSQTkgibwC4SAoTv/x4OVMsMnEXIxawWjEeyUxUy5IxyPMNo2oqJ3CBbjbcNQ9c4l5fXvQByB8XzPEMh7dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268740; c=relaxed/simple;
	bh=O+hzsSvVnJz7MunYFuB149YvUwD55qvPOuK7bklmxF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdK+8l16B3K6vIWoT1uqsxYS99FPsvekcWj5/kRqMh7pZ+8ldSvTEiVnxtd3ZcVFhLCRtZ72oCX+1q9QbkbESpvs+E36QXt/8AWAEfD+QyJQYMMds7bACCoGpFSXt+Pvf+/41ZiBulCWhLYjoF/ULwAcng64YSknsQEtIatmdrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U8sgX+OM; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U8sgX+OM"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-74a61973bedso1461967a34.0
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Sep 2025 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758268737; x=1758873537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHJ3UbPpS3D5IfXMLoQP0sFO1NEt5wlea5HnZpiaQh0=;
        b=U8sgX+OMvuAMhWAlTzti44Vh98HqEFnUG2ujSwiS4fo7cGSZmErv3+k68VHbPMegHO
         PHFMKM4nYYFJ3D+JwXM+7gaRNA5fCkfCSL3yES2TQ/pBnUy3z0saX/GzcQQAb6taAwlD
         QOQiyhBhPaT4CRkHFTJWIqkoJpqIjMFHknaca3MqRAN7tDvleJLK7Lupl2Zbeh1ilakS
         Ge9eY9UlcjI/abZ8h8i6Z7Oop9r7c6FD87tIZKg3IQdWCB8q4iXzv8UP2qGT9xyCUFWy
         nuCoFuqvGCRyC5OYjvZIsrvWKYRhJysn7KbsoX4QStZumnJunHE6lw+SDaOG7hAmNDiu
         jR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268737; x=1758873537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHJ3UbPpS3D5IfXMLoQP0sFO1NEt5wlea5HnZpiaQh0=;
        b=rmls/ciTqdm+eXUp7KpaTGx1hJ64rxWoWeOtpqV3/cHRLfIkYzZVEAjBepKdxejHmo
         BcRxaZ2i8CPzFPEFDDX4IPJt7Bw/K9KyBC6mzrO2L0FpMkVOeAurZGUkeCyal43Q7TRK
         gzBAoUgsUwX4S3rHc2iwy3M/ZICaN8dzgXZ3loaxrd7ZaNy53TofFgYl1p7ZpmzAqpTD
         6GncyWWbIOQ2iTwy1dFHuqaI+oF6fzrGzMMMMcDeCVizuYGYUx/jwQ6fFczPJnxNOyEA
         +PFmmDPENG1f6RCkLtHfV/EtzNVXYwvBkY5wEENeYBua2ZRbCO8kO/52SSIhdWDRPzm/
         TN3g==
X-Forwarded-Encrypted: i=1; AJvYcCVnKDo8+b1fGdnaCJVHcskcmmk2vdnzhbSv+T+BNj1oZup5ZeUbFAg6uS+6yRPs4Y/TUkJNM8wr7ZMnqDWF2+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTu6roiGnRkBDwfUcMI2hFGqhbmPFkN55Ds/jmydH81uPmsLX
	AEnatUeiek5ARBKRz8L0ESBwHupj8wMaSgXElf2PB5UGKS9BfOAqDyaYRhmS0mBFkSeAdQrk93Y
	+rhFu1pZ2qGO17IiSgtTrfkHoPiNo4FBZXzhQwbiCsg==
X-Gm-Gg: ASbGncsQj110C7tWTAQTyd5h+uqa036QgKRdkZ6uzT/yvnCckWe0KY0rhYhrHuBVzPK
	3oAPhf4xq9yKN+idHNbeemKKJ+jgW24df9qQRQaB0TpvvOqE53Yhwj64Ntxo+tybmrDz8xfbroH
	m2xcJXrqAGJhz874Xxa63s9PreA592irQcXY+XAuo9jboeIPDK+WLTPbggMv/XcDi7eFMF3qRV3
	MrlVvPT
X-Google-Smtp-Source: AGHT+IFkd+gNrjrot18Zo5hmp077YMeppKIoRCZvWMh3/mqyMghiA3DIyH1IQhZkyQF86NUjQQnEf00dsGPBqTCeBfU=
X-Received: by 2002:a05:6808:6f85:b0:43d:6b7b:2469 with SMTP id
 5614622812f47-43d6c129f19mr966534b6e.4.1758268737218; Fri, 19 Sep 2025
 00:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMvV8WIKnqLN3w6R@stanley.mountain> <aMzodGIvL88HNi0d@sumit-X1>
In-Reply-To: <aMzodGIvL88HNi0d@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 19 Sep 2025 09:58:46 +0200
X-Gm-Features: AS18NWD_RyD3kl7DRtBl_0VNsyLANW3lHRdWn6UrulYuNqtupf3pr3qBMXZkBaU
Message-ID: <CAHUa44HLULAZ3XXimqDzCfG8rc8OzU-ACmv2Gaee7Xbi=w3VEg@mail.gmail.com>
Subject: Re: [PATCH] tee: qcom: return -EFAULT instead of -EINVAL if
 copy_from_user() fails
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 7:22=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Thu, Sep 18, 2025 at 12:50:41PM +0300, Dan Carpenter wrote:
> > If copy_from_user() fails, the correct error code is -EFAULT, not
> > -EINVAL.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/tee/qcomtee/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Applied.

/Jens

>
> -Sumit
>
> >
> > diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> > index 783acc59cfa9..b6715ada7700 100644
> > --- a/drivers/tee/qcomtee/core.c
> > +++ b/drivers/tee/qcomtee/core.c
> > @@ -424,7 +424,7 @@ static int qcomtee_prepare_msg(struct qcomtee_objec=
t_invoke_ctx *oic,
> >               if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
> >                       memcpy(msgptr, u[i].b.addr, u[i].b.size);
> >               else if (copy_from_user(msgptr, u[i].b.uaddr, u[i].b.size=
))
> > -                     return -EINVAL;
> > +                     return -EFAULT;
> >
> >               offset +=3D qcomtee_msg_offset_align(u[i].b.size);
> >               ib++;
> > --
> > 2.51.0
> >
