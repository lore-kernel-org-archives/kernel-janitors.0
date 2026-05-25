Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F60D390987
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779739801; cv=pass; b=kbvJ6c5uWDfmP7KXkp6RFQEGArLpUNBlVAUbT9UuUTBg3kmAYW/ScH4Rt8Q4+Sa70auK3tZV2zAOB8anhI5WnPrlkaEUrtaL3qIPopNd07xUVR3EOZWR/DPRsHQm7qjKPNr1uUHcbpf3GbN93Ee0oTkLengmpWYHfKdtFxQc3DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779739801; c=relaxed/simple;
	bh=2RedkTW30Wz4PVzid6XSIxwtrRyZ78EWTGCjN5m+6S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTTr2CgX1xjQDPe9hbOO82LT7Ex8xSU5YBi5dCUAfrhfcVxkmzFWInVtWz5gfxvZ7vRqgZD52oKH6wiCBbB2oGB/rH57WvAgGK1XmeDkDDHBuG3B30gxqKPj5a5JqLC4+QeYtl3G4w5Fb04xI9qCQWNpZ1MInP9FClRSMFmKru4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPOD+X7B; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPOD+X7B"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-651bc83e74aso10150316d50.2
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 13:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779739799; cv=none;
        d=google.com; s=arc-20240605;
        b=SODRK/bmoiYDa6Xg/RUpwYWwLL2Zhr1boLhgOjU7hdiqoA0R+/LrUh73+OHuzqdmUe
         iUgyyTRaswv7C3GhInlyDOc+t3np5RVpLrITOdGeCXlcMSvzfMByD6UB0uDtmxJdTja4
         ZHKA834rDMp17QvZunQH/+pYba4xUnrdPZLVuzE9S2cr7NpWK9g4q6QL7/+8WNn2Ktbh
         BkP+4lUgR7gpon8//PpYO6eDyMNUSV69+BTwPitedBBP4zMlLSXxWOy31t4ew8GMIMXU
         uifQd3A6gaUEwonm9Fi3oRcNZqi4Euq6p8kEqS8YbTTmgAj6WOPoQBzY8eogqiLzcGiF
         0a+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V8S7A2LzGi9IwYzOZDU54V50Uf52f5bs0m7EFal7bdA=;
        fh=UXdyBjtD7AXgiTt1tq1+59iaCPJ4s0I6l8yP+l9mNyc=;
        b=G+uLQHzj9CYcgM+Zhn6GWLFg67rk5bn2cTBmqO7qpQTM2jsF8imP3QmcnWVROW66xX
         kNgVUWPJNY5kn+VMnAHgQICnIs/CzNcQuHvM58m++5uT0tDjHR8i+eAbpRnent60d2FH
         4HRrLIv7g7tW4q0E68TDfAcWCTvTI4zi3MvkZ8OAxXYMX1l85Kn94NOWxgsA0rRiG8mW
         reppsgwg2RVy88at5eS9adsW9Ss1P4u+5EjmJgy14zJB3Z7k3fCTFH2hZi9CSyQob7/s
         3fsO6bf7N/cLXu86ABrXcDjKuIxaODhkrw80ILVQRlic2KIZiIWPicJuaqPssHkx5fiV
         J9Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779739799; x=1780344599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8S7A2LzGi9IwYzOZDU54V50Uf52f5bs0m7EFal7bdA=;
        b=NPOD+X7ByW2QPL5VXMAg1N/DFmDZo5NaCsZZR3gW6GlcPCGQgF7WuqdYkRg4Pfp8bc
         En4rnjrRg0pg/FepfPVFoC60RjznzuCGZ+WMkad3vew4e69bPcd3ALie9rtRYfWXFNmk
         3FO/CTj1S2dEf9SE/bJdH8LrhQnygTC8UDZca6wa0LqN7MZs57R7ppx5tNF902uK4zdY
         q7DfGsZ9853VMrKleHxuGr+upTJ5hn7pe+UbPcvINHWr3m1q946jpd2UwfQU3fbifQ9g
         hsPGEXQaX3yFPDwQURzSinyor9imvDbUzrStYVRnurdYIt1VNv+BbRlI/LfODNQEwcGd
         T4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779739799; x=1780344599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8S7A2LzGi9IwYzOZDU54V50Uf52f5bs0m7EFal7bdA=;
        b=rQrfXBKZ09a18KmBEP75GDlGMT63U28duOCyJ55Jde5NEN0cuUile5b8j+1Jz+PY69
         JUqehbWYXlKNCicnB9rvsfK5cMAcfTXRoErcJIEU7Bfx4HCGfi6fIuHpPEnRs6Y4oZhh
         WnqB8i6i8Jp8duHjjp61VlJ8MLrr9FeU/Ehtrz8fQdWGn8OA7Q0vH+mhKLFmpuW+jNTA
         DdE2rd2aYCU9gdimksp9fPbh1T1aXzsHXJQKsHYRdcmE01r+t/Fb97iYkBAZRv2BsAv5
         1Njg9MNjlrWIzIs1LUOKFJ48bJ0L572y5bR8eu5D5LmZXFc/h9k3Qxt9onTEaRNFrO4B
         PZAg==
X-Forwarded-Encrypted: i=1; AFNElJ/qEPfusNEnMoYexSeseXPrSUqFUCS/UdEM3VfzuW3a6SS5HOGvPQOlgV4Yui0+4mHt0orqxmvtuo6UQOhNqEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwegM8/13RMeulGtuqkJnvfPDYocR1/ms8YjAVMZqSRhM4uhGxe
	Ix9imVXc0S4RnW77lNB10DkPQ3oneEtAb48MAAyhFCWRb0rKBHovrie8qm3Q2RnDXtTAkPtJ185
	jFlBNI1Pk62rjwwiUftAQ9s0kZt9EmfE=
X-Gm-Gg: Acq92OGOFLqRO4Uhv191rRbF2c8q96jI0RCeq/VT2hEQxFETaVM6QC47PDNch1qRBfS
	jbmdhG/q2h3pUlcPqhkUSNPf3SJcl3p7s4agc35PduY2oBmYAYKpsHCtrxxxAOkjx+IEZLswNhW
	ojG/Or6uB1UGcRb/nSBSPKUoBQ126QxwN0fwrGcwFh3uUDxGpu5EKmMr5hNHmMSSIR/OP8UV23o
	b7WxYPypsu4F3oz3zgmbaCpDQRnRS9EvyYptW4pCm4lwUL4zHQh5fy2Xd87aa+dJ9XrP/Pj14Dq
	cSlz8jWLBqf/A+fE1q1SYjWawAVfYQ==
X-Received: by 2002:a53:d048:0:10b0:650:11b3:3f4e with SMTP id
 956f58d0204a3-65ec98ddfe9mr12854113d50.32.1779739799343; Mon, 25 May 2026
 13:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahP3S9nOYN3pG-Fp@stanley.mountain> <CAKqfh0H0Z0xr4bAjctr9h95QTuEUTF1eCgBsRZVHn_KrkZZX3g@mail.gmail.com>
 <ahR1CUxzMkYDwVvO@stanley.mountain>
In-Reply-To: <ahR1CUxzMkYDwVvO@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 25 May 2026 15:08:14 -0500
X-Gm-Features: AVHnY4JKEwasvFbRd2zbbO8Xkk3eA46FEYb-vrw3-jof4gBxKDr_lN_jC5JDwo8
Message-ID: <CAKqfh0EEHCGct8F0VP1G+wv_NYUhqT3Bdfjos3NVGGbeAs09qw@mail.gmail.com>
Subject: Re: [PATCH] iio: core: fix uninitialized data in debugfs
To: Dan Carpenter <error27@gmail.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 11:13=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> On Mon, May 25, 2026 at 08:17:28AM -0500, Maxwell Doose wrote:
> > Hi Dan,
> >
> > On Mon, May 25, 2026 at 2:19=E2=80=AFAM Dan Carpenter <error27@gmail.co=
m> wrote:
> > >
> > > If *ppos is non-zero then simple_write_to_buffer() will not initializ=
e
> > > the start of buf[].  Non zero values for *ppos aren't going to work
> > > anyway.  Test for them at the start of the function and return -EINVA=
L.
> > >
> > > Fixes: 6d5dd486c715 ("iio: core: make use of simple_write_to_buffer()=
")
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > > ---
> > > The original copy_from_user() code was better:
> > > https://staticthinking.wordpress.com/2026/05/23/simple_write_to_buffe=
r-is-complicated/
> > > ---
> > >  drivers/iio/industrialio-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> >
> > Codewise looks good but often times people will prefer
> >
> > if (*ppos || count >=3D sizeof(buf))
> >
> > over
> >
> > if (*ppos !=3D 0 || count >=3D sizeof(buf))
>
> In this context, I feel like either is acceptable since zero
> represents the number zero.  I have a blog about that which I have
> been trying to promote.  #SEO
>
> https://staticthinking.wordpress.com/2024/02/20/when-to-use-0/
>

Interesting article, and I do agree that either is appropriate, just
wanted to give you a heads up in case Jonathan or Andy ask you to
change it.

best regards,
max


>
> >
> > Regardless,
> >
> > Reviewed-by: Maxwell Doose <m32285159@gmail.com>
> >
>
> Thanks.  And you're other comments with regards to -EINVAL and
> -ENOSPC are obviously correct.
>
> regards,
> dan carpenter
>
