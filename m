Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D825782D
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Jul 2026 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784904185; cv=pass; b=mP+Y7PAaE7kuRrjVAff/8/oi7K9uF8rgmDVs9YAmWWveKE4fG3LDL9Mz6I5z8TxO1J4Ca9yqurmyroaDWLsbV76sKT0EdLNPVSqArfQL5DR+ahy9diky6jRvjGK+2pHqv0O900bRTqhXhmJ/8JDPB8Xmqbk8eSjT/SMg9EDVCSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784904185; c=relaxed/simple;
	bh=JrcjCrjwi5Qjnh2+RlonhvhKLKSVHszVEp1BFBb5O4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M2zaz5TqfEnJ/Wb4/PGGgCdj8wHbRIyDPqpBkhc308QPrSCZvP2LB6Cv99fMrw/sulHirfl/egx4hzQGSmsPfXck9hrBleoXQvW69TBhHCaDmJpqCpsjPPb3fcRQAxmn8DL+xA3hzIElQdvgI2FHg6WiXKv+63DtBZ7s/rIaj1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwEiracu; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwEiracu"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81ea0b7d137so2699897b3.2
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Jul 2026 07:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784904182; cv=none;
        d=google.com; s=arc-20260327;
        b=jZ8GKv7herwbY8FKjH4rMsaeRW4tt6/iVlvPq5N6xU6QKbw5dSzHjDoozl0FBNt/CO
         9pz9Uik9cDJ5X7dJYM1t23qucUHRfKPAGSFqzAxDC6UCX20FULyoQCULsFGD+5kDlmi6
         WeJf9YFkukpmZXaYerGmGif1ooqlvDHgqTPSQtrqUe9Kw0NEIevLjcuC6wSztIWavez3
         GK3/j3zXZ7Oo6ZfDjQzgsihrOnjYrAjJoi+j+gz8MQ8fsfITSc5z2A9+jnqxR22VKX+8
         VDb/zOkg37UGPuAkdK40FEwkPBqhbyGlSp2ro3vpv1s5oyFIbk54n4ZvDfsjg2cUl9P3
         VgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=40R9Zxw027ms/Fu4Pi8SHJPW0gKWq8gjqx1E5LRYD3s=;
        fh=5bhTo50vIJJx168F19yJ8SumEeZeSTAen8dHIxp6gqs=;
        b=CKBnQ3HFdBOFRb1n5OBlPTn/ED2UjhbiwMP9rZUcF9A0po3XHlqe+jsVVeclP7Hjls
         Tf5rAOwOEF4rs0uFV3Jp+hWEopqfgwYAPxLofMAir6sxB/cBPkNiIinHhEG50uDDw9ls
         /X8cNJ6EfScvyubjc1d3f8Cd3NANtM3uK1D2lMfEH2P7pMdT50m/aDttLoZo5udU46Xo
         TcjT6tjvUjx3yLsKV9sfL5jTby6QI//sDPRNVQS1QSJy8YPnH1PuMiGlnBG0XvstFZr9
         8lEL1JROWHsjw/AAqkmItww31j7qw5WWtaGfM8HU9AD6cKk5V5mDsm50nzHSzx/7JCwP
         yA5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784904182; x=1785508982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=40R9Zxw027ms/Fu4Pi8SHJPW0gKWq8gjqx1E5LRYD3s=;
        b=AwEiracuhYhqWnWPsA7doU0CJbmm/kQLnXPZGTduwPqj5aHzEiNEAgb1h1WHOIQAS8
         KL8hWYSjF96b67hk2pXEdC+yKLEkd6l32E8VzvIcfO+11VEuIP6D8LKvO/dxZTjBzOi3
         Zg+I+0ozLhAzLorAeHS+rU3Ki9tShLxBtv2oSl+Cw5bYDmdDiNDRmOxD7cuKklE2keat
         yBsHCshG71aHVzA6E3dh2b7lPDybVROGqjjQx9CKaSEH8lLvJsysRyCMUyo5FXa9GS0V
         ebQEw3sT+qS+OQVCHhH38dgn0q3AmtYQf2mNO6mJFf8k4Lv0rItyoFRS+QVZT+PXxsNz
         TOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784904182; x=1785508982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40R9Zxw027ms/Fu4Pi8SHJPW0gKWq8gjqx1E5LRYD3s=;
        b=ggtEERSDCD8j3AkFYtfv8kOnku0ctSRyDjH1GnwYorc/5eNSE/0gw16IPtlU+2NYSr
         Glmd+pSdd6XLBRG9IRnPxATL2QAx6DHy/X7EuQ+IPgcZSAb47j2iRxMFBhAS5ZGSnnNe
         aS4QgJ9K+HPVOvRHVEyUmFS+UPmbbWIFceqr3EPScy9YGYrC/NkWhVc5DX3+qa+JUjGz
         v7eD0IrVJhmUZWmKOlXHV4gAdeOqaPS70kpfvn943zt99dgWOHYHzuksjB274+yuOAqt
         QalqK3PPVrxawGHhVaFZV0VncX3W3Rl0oXuuURUkEyRsgW/9YDNX4o2lgQRb9XMdGq83
         7T4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrZ5kjA9N873WXl+uR6CB8qUMePFWq5sjAx8KGIZgUJvtlWdfxGRhDfb8xkd8rBfLVTgnimhpyW921RYXfgggg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywza0SkBUVnsCD3iQxN1Y/rLUlvovtx9HpM2JRcVU+4g8h2ihNw
	Tq0oNzQn0evwYNsAEfP5kJflihVU71nhu+CZPHqMLgP3z8RPE+huzz2GPuso8wYGusHVn8jnupU
	aZuc5Qk7LQzdXZ60qN+o1zCMxU6vfLeqJP6xoUv4=
X-Gm-Gg: AR+sD10/2shuoYjp0Fa9NaLaTH7ysX3vOa9/Tczm23v/PycRwgigifB9dPd24GajVkg
	rsyz+3w9IlCoLR3jBfyzF2koQCqmjHt3FtXDkOj4xXtNUFojfD3hnl/KD9bHdlgPG0O38HWW3xu
	cXlDSd+yGMQqA+z9xFjuTf/rk1vObWDjZxY7magJ79Wh/htWvoXYMVuJB8hGWKODLrsviV5hsCF
	JUWLNv4+LjEFzmbu+n5zrmu+7bJ37TZ3vfMO5Cf1bzvy0m2NGd3UO32RgZQ+IfoPYhkQQ==
X-Received: by 2002:a05:690c:d0d:b0:81e:b3d9:4295 with SMTP id
 00721157ae682-81f4c390e02mr24981977b3.60.1784904182241; Fri, 24 Jul 2026
 07:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723184538.3888637-2-ekffu200098@gmail.com> <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de>
In-Reply-To: <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 24 Jul 2026 23:42:51 +0900
X-Gm-Features: AUfX_myl00xXBUA5qTiBhpgdFQbaoUWsGjc-tQWSqm4A-o4NHHL3a7Qmdr-m9MM
Message-ID: <CABFDxMFYvuAZSGcPmhAj4H43dwYBG01P2-UQPGa=-M=yRE8YKg@mail.gmail.com>
Subject: Re: [cocci] [PATCH 01/36] coccinelle: misc: add cond_return_no_effect.cocci
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jul 24, 2026 at 8:19=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/scripts/coccinelle/misc/cond_return_no_effect.cocci
> > @@ -0,0 +1,121 @@
> =E2=80=A6
> > +@depends on patch@
> > +local idexpression ret;
> > +expression E;
> > +binary operator cmp =3D {<, <=3D, >, >=3D, =3D=3D, !=3D};
> > +constant C;
> > +@@
> > +-    ret =3D E;
> > +-    if (\(ret \| !ret \| ret cmp C\))
> > +-            return ret;
> > +-    return ret;
> > ++    return E;
> > +
> > +@depends on patch@
> > +idexpression ret;
> > +binary operator cmp =3D {<, <=3D, >, >=3D, =3D=3D, !=3D};
> > +constant C;
> > +@@
> > +-    if (\(ret \| !ret \| ret cmp C\))
> > +-            return ret;
> > +     return ret;
> =E2=80=A6
>
> How do you think about to combine such transformation rules
> by using an SmPL disjunction?

The two rules look similar, but the metavariable kinds are different
for a reason.

- If both rules used `local idexpression`, the second rule could miss
global or static variable cases, even though such patterns are not
common.
- If both rules used `idexpression`, the first rule could remove an
assignment to a global or static variable, which would be a false
positive.

Combining them with two separate metavariables would be okay, but I
don't see much benefit in that change. So I'd prefer to stay existing
form.

> Regards,
> Markus

Thanks for reviewing :)

Best Regards,
Sang-Heon Jeon
