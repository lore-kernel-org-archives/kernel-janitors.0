Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F26A332
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Oct 2024 02:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133674; cv=none; b=CfoFB2LMHX5MrFv/YhzJlkVN9AcTYfvGGw/5pbVPdOoYXOI51lbGzcQ36oYmbC3Gjcq2l3OlaNtzr2DCIdwhgMMcXxrhO2LgSU9zSIaBCrPVA5D9zkF0QKjeqpF5vRUUpT8RlbC4Z6/tDtuQax4t5672ecwNsMRtkW41HZ8+2j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133674; c=relaxed/simple;
	bh=QOxGn6HUGUC7agxtcrT7HyZI+wUqBau396XTdEeY4VM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVCJkVV5r1tSS+skAGg4akbB4U4UJKnfwqMvHm/kbHAD+mqaVyIo79X4/6WKtcjWr4Q4tp5EX9jw/CycrzZxxgEhq9+936ZEwqp1VNQz+rmhCO4itBCBjWhao3z1vhfzF5VSrhiuEx/nyWqErbEwYIqfqKzKL87sVH/42zkBTbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=o54veFtX; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="o54veFtX"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c95a962c2bso620343a12.2
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 19:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729133669; x=1729738469; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLxmOw/KJpTCPuMZfngsa+JDKUmVUuEwD65qtQ7UoWU=;
        b=o54veFtXNeC2tYD9KaP1Uqs1RfCVyOGJGFwl0Df4MMt9K6nxCilET2f4X3j6QUE1so
         uirs3k/XbilyLhpTIySYwbFHb4LAxxZA1SUFH3G/A7rx968X24ix4R0cTHnrdZyICFz4
         8AnnasaGqreBP67KV6Vc8SlA6tTyEh+zU6DwPw5MOaqBHIHYRouz/zv2qQoacLPJqfeA
         78qalM3LkIAhJ/GUUzzT5l1JYe9F654Qj3siUr65HryxKXN0+63jSmkI8BltBDQYMUJG
         lqljGEcHhd/fas4eWnSf1mimmwFsSJ8tJA98s21ELC9Wcn+l6ijf7wmjDa3M6BoAB3oG
         Y0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729133669; x=1729738469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLxmOw/KJpTCPuMZfngsa+JDKUmVUuEwD65qtQ7UoWU=;
        b=OEk0y6VtzIi+dN68mlKI3q2ex3ibtprt/qtahFtG0WbzHoIYNSS88QpsHb5sFKfAXw
         sprhgXHqUx51QVQOAKSotHaVuOI5xsK1bLytjFKabtmz44Hwys4xSFJknFlwn6NR/mt8
         kNh1wO+sxQrfhcjO/XAUbhJf9bVuF5zxi7IoXALeULdp9dHv6mxjHePWHgJxoOa/eLqr
         atOg9+AC1lLbD8CcKMb6jFcmSLwb0Y5bIa4nIGzPff43ljsDYX042KNYarQ1SHSfmJj7
         6ipxRsAU8E5AXsBoC5KOZoZaF5zBBU45mhNPYVSqkKMtJ+ZNEmotuZQSsLzpGZWMIHyM
         rYJw==
X-Forwarded-Encrypted: i=1; AJvYcCV6gztkEmCzboudfGmziAVNRpXE0z6GeW4/N6zMRsbllbEIV9y2+KmeFZdFwAxaCzpYIbL7z8JFR5Oj7y3fAU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJOggDnF3climhqC7BSdVhy8A8F+D/cwcqbOscXNufnOYtMSbR
	eHjDmWbE5Wu6WaOBxMF8sQf9Aed5W2KdDiSVhbSlOT35//HvtIZKV3U2RjD4qr+DdaL+CwQPY06
	PgO7vJdPVABK2VXp1X8u6OxL1mTpn5x7GrpxjYA==
X-Google-Smtp-Source: AGHT+IHJr0xtyYJ73R4TB29Xaxtuba8FwbpRz+j+A4yiemcdfoXx5LoOn1+I+zgJ2gBD6GfkFXcv7FUmqsgjZ2m9e3Q=
X-Received: by 2002:a05:6402:1e8a:b0:5c8:957a:b1e2 with SMTP id
 4fb4d7f45d1cf-5c948adff84mr13751317a12.0.1729133669244; Wed, 16 Oct 2024
 19:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016134223.4079-1-everestkc@everestkc.com.np> <2f82fbcb-4a3c-4dfe-8852-7fc0b27c38e4@linuxfoundation.org>
In-Reply-To: <2f82fbcb-4a3c-4dfe-8852-7fc0b27c38e4@linuxfoundation.org>
From: "Everest K.C." <everestkc@everestkc.com.np>
Date: Wed, 16 Oct 2024 20:54:17 -0600
Message-ID: <CAEO-vhFkT6RwR6h7KRD0YyQphhuqm0d53xj7xp7r3gco+DxwHg@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: th1520: Dereference pointer only after
 NULL check
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	linus.walleij@linaro.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 3:00=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 10/16/24 07:42, Everest K.C. wrote:
> > The pointer `func` is dereferenced before NULL check.
> > Move the dereference after the NULL check.
>
> Change log looks fine.
>
> Short log that clearly says it is a fix would be better:
>
> Fix potential null pointer defereference
>
> >
> > This issue was reported by Coverity Scan.
> > Report:
> > CID 1600802: (#1 of 1): Dereference before null check
> > (REVERSE_INULL)
> > check_after_deref: Null-checking func suggests that it
> > may be null, but it has already been dereferenced on all
> > paths leading to the check.
> >
> > Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> > Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> > ---
> >   drivers/pinctrl/pinctrl-th1520.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl=
-th1520.c
> > index 7474d8da32f9..07f8b51fb294 100644
> > --- a/drivers/pinctrl/pinctrl-th1520.c
> > +++ b/drivers/pinctrl/pinctrl-th1520.c
> > @@ -803,11 +803,13 @@ static int th1520_pinmux_set_mux(struct pinctrl_d=
ev *pctldev,
> >   {
> >       struct th1520_pinctrl *thp =3D pinctrl_dev_get_drvdata(pctldev);
> >       const struct function_desc *func =3D pinmux_generic_get_function(=
pctldev, fsel);
> > -     enum th1520_muxtype muxtype =3D (uintptr_t)func->data;
> > +     enum th1520_muxtype muxtype;
> >
> >       if (!func)
> >               return -EINVAL;
> >
> > +     muxtype =3D (uintptr_t)func->data;
> > +
> >       return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
> >                                th1520_pad_muxdata(thp->desc.pins[gsel].=
drv_data),
> >                                muxtype);
>
> Otherwise looks good to me. With the change to short log:
>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
The patch sent by another patch submitter has already been
applied for this issue.
https://lore.kernel.org/all/20241016155655.334518-1-colin.i.king@gmail.com/
> thanks,
> -- Shuah
>
Thanks,
Everest K.C.
