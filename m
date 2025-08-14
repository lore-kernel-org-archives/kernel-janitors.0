Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53240281508
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Aug 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163981; cv=none; b=Xjajz85CbNV3gZ3hWTW3l55b6hMZ1Jqw4YUFhBWEbDk1/c1/mD9gmML7wDrTZYbGxxWeOBAGSAvCLhFWDLELJUMEWgKSVdgJDiJzqi2gPDrzA1ScsLhDklDorOH3NOiaekvwOHpczgT+nsQNN4I933Z+aG9os66yNyTOWIPFEgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163981; c=relaxed/simple;
	bh=Ddcf2otYVNARg/taorSZLAtQAtvhMThscR3wOc9nohs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/JiKybdkCwYCZdnAkrG4Awe03iLGzyCo9BD+gV7B2O/HflXYVJWDbBCKk4AWRzt/OKyRWslhVmGsgPvFngiXnjXzI7eIfXno+3XBpksHATuuZmkQ+fRvpejfOwTO9eaQ0nrxJ3D7NGXUgdTtmDwnPZfvl6tPgN+OdpquxPZZyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fU3mZIT6; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fU3mZIT6"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb731ca8eso119709966b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Aug 2025 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163977; x=1755768777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PgWqN4timfjl4cZJRm42vhchyn9UqvfvoLN2gf4TII=;
        b=fU3mZIT6gEwgZDiGnmaheocxclu9gw4fft58ddiZWBISqEEf1hZSUMK2bBmzVFqS3y
         o8L7noQ4rUy5x1mZ6SGh0Yque5vYLKcVI7gvHvPDsdiBBrqQOGqVQlOMWQcAN358uiv+
         yexl7lSVNGWTe3wUFwitSt+MeJGvMQUzn0IRB1zBXpIEh8ZQBAuP3LnQ+Ivv+qE2pkGu
         7XpMbiuDTHBW1pbGKBSFg/0FB4MI2GZuZdIU1rKzcAIMnc/NiR2bd4JccGfaogSsoyRG
         d0qsEhG1DNFdLJZb4CTubErfLgrnNYrC4WbPnogJLll0V43Tu60njrJQk6qcJuRF9J82
         VntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163977; x=1755768777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PgWqN4timfjl4cZJRm42vhchyn9UqvfvoLN2gf4TII=;
        b=aO+3CozyyTHcBk6uTffQT79CB6z24ZV/ZpEZAq4X+ReAC3Q9Tmur9fesftQ35mLP93
         xz10UPXnVU6SjMr4Qq3X+oC4bKj9RtYS0B5fns92rF0VdmxbqP8PbD19o0+vI/zwwhpO
         HCt2X+3JiCqe8NiiHo/oB8KAEBbBkWk/D5ZFvaRyrDS0Ze9YRSYWh/bqTsxq2zVPE6oK
         YowUuFmHunhzDGyQsMOlJQsfZEYzUa/KMzdffneb51SxC4HdKCaqhVos0PHE7ivY1wF2
         eyrxo9jonDtGGypow1zLLR48Lv4elOAw+3xmYo/mxaEF/4epdFe58ngAkdkVBU4uIHmr
         8Ovg==
X-Forwarded-Encrypted: i=1; AJvYcCUOdvmQ9eJiPK51CqrfbnyUMH2hUluSF2Vx9/UMYuSItMybeqmv1S0MGX2SlRAfCHFsKyQz/gW96R2yBcwV91E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DFxTs+IStLJl+mn+wBG54ONcw+0wxGXt04kqwoxRMxeympF2
	cxNKW64UdiSpK/EkvjtwA3kY4G2+eTaoDy6jg2bSrjwlvj1k6zgy4X3ZjzILhUdQdF16nrxefF+
	VVsfE53bQVEVRn9qr8s6G0k5Tv2BlleT9cED8qxnUVman1UPCSXvF
X-Gm-Gg: ASbGncvD0VTcvbT6b6Eg/UR+16twY3vyXoGHl8j5lpdpG7J952b0yx0l7YwpG3/XFIf
	nxZSZgzntyAoGHIt0ULU+uS0x3UireFiH+9McjHL20v1Y2u/FA3gIC39Ij+36Yt4VhOq98quSdH
	funYebUTZN+vrAdFL2WfXwAGTIK3d2ze+S7Mb3k1RgQek/+OBfZWRn3+GVsXMiaFlbGcQmIFqzQ
	Zlo59KvAXiHczUhrkt7OAVMoXIh0JeRhm4mtDo=
X-Google-Smtp-Source: AGHT+IFrAVXvmsSi7GbBhU2lB5DsCLyrrz/JBWyYAZLJ3h+X8DtQSjG9apEyelCtFkio9GsKeQdg8qpPOGy++jb/RKw=
X-Received: by 2002:a17:907:7e99:b0:af9:e3d3:a450 with SMTP id
 a640c23a62f3a-afcbe02ae07mr165697966b.6.1755163977510; Thu, 14 Aug 2025
 02:32:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aJwk0yBSCccGCjX3@stanley.mountain> <175506979055.8476.10658684000717777329.b4-ty@linaro.org>
 <CACRpkda_-JBGTTh7pLd+MkoVyCCKDqTZm8t9vaxWMWDE+sGyLw@mail.gmail.com>
In-Reply-To: <CACRpkda_-JBGTTh7pLd+MkoVyCCKDqTZm8t9vaxWMWDE+sGyLw@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 14 Aug 2025 11:32:46 +0200
X-Gm-Features: Ac12FXwz2T5b5IuGlaWDfV_45Y7w640Ir8a_Q8gAQw7wKqwa0C0dwbE5i-RKcEo
Message-ID: <CACMJSeue_3A33gQjkN2T0=G14faWs7NaXK9sEy=q877w9f+-AQ@mail.gmail.com>
Subject: Re: [PATCH next] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Richard <thomas.richard@bootlin.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 14 Aug 2025 at 10:42, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Wed, Aug 13, 2025 at 9:23=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > On Wed, 13 Aug 2025 08:38:27 +0300, Dan Carpenter wrote:
> > > The "> chip->ngpio" comparison here needs to be ">=3D chip->ngpio",
> > > otherwise it leads to an out of bounds access.  The fwd->valid_mask
> > > bitmap only has chip->ngpio bits and the fwd->descs[] array has that
> > > same number of elements.  These values are set in
> > > devm_gpiochip_fwd_alloc().
> > >
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
> >       https://git.kernel.org/brgl/linux/c/148547000cfc1ba8cec0285726833=
3d08724b9cc
>
> Do I need this for the aggregator immutable branch I merged yesterday?
>
> I have only merged that branch to my new development series, if
> you need me to pull in a new version just send a new pull request
> and I will use that instead.
>
> Yours,
> Linus Walleij

No, it's not a build-time dependency and it will end up in next anyway
from my tree.

Bart
