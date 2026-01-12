Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829DF1E1E16
	for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229200; cv=none; b=bnqeSwZcaZ+Yszg5C0FOWvKHgHEaH2snj7pLIvvtrhCiuP3WrhlvnZ3AeCiuP0F/4igtWAjTQ6bpeGwiBYE9jDbuIYCUDTShiwQ40n5IZUCX+9psYelfQ1zctyvkC0EhMmE8446zQefGJ5hbBhDewvcqjVrfCsGlGzI/W4UsYS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229200; c=relaxed/simple;
	bh=47xNcXYtEN0ng9qAKOXBkbiW0NSFaIqHEZUXSVPjBMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LY+n1igb+klBONY01f62sOZ3vD9OahlBQW2t3QvUd60dyh8Cb157GnKn4pEXdjTalMrZsGYFwEnTPoEF5EpR184Uaw0TnpTjvpIpXXT6urjRgqhq1Ee/w4K7nWVJfPgL2yOckkB+R/zCBieWOBDiHf/PQFJMu2v29SylgPBBkEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GU5LHsf7; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GU5LHsf7"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso5072353a91.2
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jan 2026 06:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768229199; x=1768833999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xjc6M9tmGl5hN1Yu645jKd7QvQ8TOMfGzm863v7vtE4=;
        b=GU5LHsf75SfJ7e3SdDIgVwto3gqw+fSOz/5TyI3g//ZR/Ia23PQK/NrsMto+gQRgYF
         nv3fEwfu1O2KEtycZRbBUSxOz9OL9EfrsrH6bcE/L2OG5bds0dEEGUDDeXvrWO7eemA7
         z1sQzv4lhzlcBVOnH+UKUiaKfvRKuRk5rpHX1nQL8rUJccScFagjpOQKbDULI/kJ1DgT
         Pp5vSHwC4KNke0ubOueECQfWWDKglLJZ0uO4vdEbT9e2Hcv4QkJ5mcACAnnexfHuiKAN
         EwVT6iTSAKFOkFOrd+4sqPsPQ1KbKOCRIcJ1Uiyz3hSErk5oUwWxL4tnrzPHrYWaAw/F
         lZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229199; x=1768833999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xjc6M9tmGl5hN1Yu645jKd7QvQ8TOMfGzm863v7vtE4=;
        b=xQjPsUWDApq/IWHof0zt3HrqbNuhJAWm+jZiu5GBcycK7GGFZAqd+NfcT+Zpubly+x
         PLzLl8bmwDtNAjmGW0VLu35NJMDw8bV28eVbgaKNLYGPKVT6a7NYOeSgnBrgbEXa9OU2
         kJOgIKfBCN3M3irBOz7fIqOkud1aGaB6YvEJ0oJFtWzi2UgnhIWcy9mSfNJfBcQbjhBW
         xSbt0crIqE1v7bMAPLZp362IroewX+yaZTVdFYogDBeCYeGQYHEFO9zdGBpnrRH8Eo7N
         ZfQzGkzADzRC8ToIAEQd5Yotje3FDIbe40PG0drZt8KiKudFKaEJTJHtM8Bqh2/nVmxL
         EH9w==
X-Forwarded-Encrypted: i=1; AJvYcCVD+/6f3LpEFra5mhiCoykn7qZpSV9PHLYNpFMl4rYhmEOdabuzyawF018cgOLaCANk3Td7WJAhYOGWTZI0X0s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kJOMAxGYDdjx2Mk3aadg//36VLiUGJkn1VmziQFXzSX5l9/n
	PrqRA5wuHVvqkZSeGfryhS9/eFEYRuiEEW1OcVV+gYCNmRJ11CbbjCVN5tJNpIrG6KzwR640CNs
	66DqOXO3RQPv3/rmAip48aNBaApJtdQU=
X-Gm-Gg: AY/fxX6qospdBipxk38aohl2ADKH8lkrJIm7J7TcsqRQeu5DyeCjxQ/CEDPgo5Y4HO+
	orUHzz5wlVM0mMCEjFc+BEHj1de6qpASAHsIQ5191JFcY6sPF8xlhrtaOzM1JVrQJZlWlTFkoY8
	seAmNXH589v3DfsIcyqoNZIzho/1ffZP4lYiNiONrnWMCm+wp6XCtiwME9bdLn+cVFuSNkjFNB0
	qG3Tfi3iYQCyTe0yaDQVUrDscnCzaUQLJd/zopWeeB/ILNcDqEdvsZUbfxUFA+HnmoPwVUPK9Sp
	0m/LJvIYPy5RzoO+qydAkO/pvojMsVT0RAIbRwHY
X-Google-Smtp-Source: AGHT+IGK1mIUb34t+JTkSSvIdWLdzisbXFU4RsJq4tdtJrHuJ2qQ6EEQfxsl1/i+NVAqAeTOmevUDpjDXGsQz4C25GE=
X-Received: by 2002:a17:90b:5628:b0:34a:8c77:d386 with SMTP id
 98e67ed59e1d1-34f68c91bbemr16314050a91.9.1768229198734; Mon, 12 Jan 2026
 06:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109154442.421248-1-coking@nvidia.com> <aWTaUvGu9dlvnJO9@sumit-xelite>
In-Reply-To: <aWTaUvGu9dlvnJO9@sumit-xelite>
From: ryan foster <foster.ryan.r@gmail.com>
Date: Mon, 12 Jan 2026 06:46:25 -0800
X-Gm-Features: AZwV_QjEJFTH8Bbgk4_6aa1ffC8HADv6P0jGsrQmwQ15AeggtFLkF1CcB4gKQZg
Message-ID: <CAHtS329G-H8vVVr==DZUAetzVNc4couN2OV3tH7qH_7YDGe8xA@mail.gmail.com>
Subject: Re: [PATCH][next] optee: make read-only array attr static const
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Colin Ian King <coking@nvidia.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
	op-tee@lists.trustedfirmware.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks like a micro-optimization, const makes the lookup array
explicitly immutable, and static keeps it out of the stack frame,
avoiding per-call initialization.

Is there a style preference for read only lookup arrays here, e.g.
Should these variables remain local but not static, or should they be
moved to file scope static const?

On Mon, Jan 12, 2026 at 3:26=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Fri, Jan 09, 2026 at 03:44:42PM +0000, Colin Ian King wrote:
> > Don't populate the read-only array attr on the stack at run
> > time, instead make it static const.
>
> Is there any value add to do this? AFAIK, the static local variables
> aren't preffered.
>
> -Sumit
>
> >
> > Signed-off-by: Colin Ian King <coking@nvidia.com>
> > ---
> >  drivers/tee/optee/rpc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> > index 97fc5b14db0c..1758eb7e6e8b 100644
> > --- a/drivers/tee/optee/rpc.c
> > +++ b/drivers/tee/optee/rpc.c
> > @@ -43,7 +43,7 @@ static void handle_rpc_func_cmd_i2c_transfer(struct t=
ee_context *ctx,
> >       struct i2c_msg msg =3D { };
> >       size_t i;
> >       int ret =3D -EOPNOTSUPP;
> > -     u8 attr[] =3D {
> > +     static const u8 attr[] =3D {
> >               TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> >               TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT,
> >               TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
> > --
> > 2.51.0
> >
>
