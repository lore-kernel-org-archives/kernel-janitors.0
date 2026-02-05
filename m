Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F6B43C049
	for <kernel-janitors@vger.kernel.org>; Thu,  5 Feb 2026 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770310619; cv=pass; b=WcRpZRmvazj2FwJe3Ui2X0wdOH/oxQzDOISCbj2Hn6dwKNJ9qR5Wiy2aennQ/IHmUWZM+TPwCdy3Ti+8R2zhCmWe+DioyCJErfpXH9masmAyOa0Zjg6BS0QWvEUnRzyVzzMz0IYqx8TgRLUV1tV/rIL7b5eEtZ1LNAv/wpmdvCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770310619; c=relaxed/simple;
	bh=FubNU7Nwqx3hIcILlR6yYjmKrhWkkBVcmDPP+R5NhlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+grVzcSICNxKOWkmW3UhqW2badDOrugbfabL2eQbUj6JnMYX4GYjkLT/Q86Xd7Qfye09JSf59KbWkPG+7piQ1HTGK/P6/Rxt4x34iXdPAIkWXZ6Kb9B+OvklDR0L1Aq9EoD63M5ZwUdCuKBUaC9tV4olS25umsaoeCVKzdpizQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXAqkjjl; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXAqkjjl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-65939428896so1823159a12.1
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Feb 2026 08:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770310617; cv=none;
        d=google.com; s=arc-20240605;
        b=Bj7Gg1FB6p5McCpmJJOZKn8rMGD052tYpKwq/KrlDi7Ty1HvCX94c/15cbmFXGdF55
         JfhDUN5IET6aqM4z+QdF2qI8UYdKPe5eaYkw1f73nqEl/wLZHQYoxHEVwr7GL5KkmEA0
         Om2nekvVpDCHqiUP//O3oRDQSBMLILMvvdcfZv9ixW2OpLs7STbfoVsOuoxDWIjkm8JK
         exkaxGrlYOcQWMG6ByqfpI1rpdNlSYCv3c+J+AHYDCvOabbPc/7UXFfhgVOtunmLZANc
         7eYk71xMKxWccyEVylgWg/Vthl+Y48kJYdcCqXN8JNUJSiEhnPuZKjtGNsJCXz8/qT+N
         bLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/3sQQzeXOoaPPSSsU2vRBnHaln2TVQn2cJYpZhDkrFA=;
        fh=p2tvtrGFZ4Kko0lblPzADX817m7YwnsudbCSwQLJgBk=;
        b=HP8Ka1xMd2OGmq94hCI7DAWvPFfg6abd9B/5c1f3thOXJj/7XafN570UitXO7TKHTy
         hkJHLbHE8F590mvhgc7/nGTanlAfGNGh7UdMnCdAAzXQohdrdoOq85ig2jypzjlCIwvl
         qwD6/5E6E9ByWK3NXl3eTrv5HGk++pZzlh/Xii8JxMp7d5w2x2LPGE0HahZE5pC7JPIa
         32hIjru1izFf0W9s/fIUu96M/kLV7bSkwuBqnlRS4rzJdHDkpiQfvJ0YATTnFaSJ9TAp
         9c1PYwPJxIfKBra/re9y1cUakDg674MNZyMCm0SVVd1LKde8pGKGhUlABqdXn/z7yumO
         bfdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770310617; x=1770915417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3sQQzeXOoaPPSSsU2vRBnHaln2TVQn2cJYpZhDkrFA=;
        b=dXAqkjjlOQwDw2Y8mtbL5oqyX9d85WJRV6cvntFwEEIjq3w5ViBDDXYTy8WjZ3VnJM
         00nVfFmZIKJGMv404DDgkGmRBIc9SqzGEFzLI/Xt4iTSAuv7EwyRmiYBjQPWUhvpig0R
         9PBthrSamemMHlbqXnlMvK9XD5oLgoXeJqY/D/msQCinBd7UEvka3cMWzQrBcCB4Gml/
         1ALWeA8sBw+tdUfBx0aPYDJCYLa9P2lja93YR9BvRaYOEyxFlfm8RYkqGdbI1ZKWjYGD
         amd9L+2Lhw6JX05uCy77I1eV0e3R5UgYAXH4Qo9fJW/AStd4lXGrFjx/t/c9XEWzJBH0
         n4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770310617; x=1770915417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3sQQzeXOoaPPSSsU2vRBnHaln2TVQn2cJYpZhDkrFA=;
        b=Gq2NT4cnnofa/tHczrv96nCUguz7RizGIUczaomwL8M8zSkxUC2muXhFhifwQWW1BT
         Yi1eqketCZb08nR4azn2cwbsyjHuPVlBjx+n9U+GCGPNxPtBr/Mqfa9KOO4Jn2/eYUMC
         6ZJyFzxD0FtSbsvnRoRCbA6yLqXm5sbsS38CcX95qJJTzXWUdWVz06sB7auoHnyQekzE
         RVz1Wt0ZWl29mEIwbwTy0o+PwGnqAbFV+krah2MGoigqte7rIkNLcUmRhq2FpZO0dixl
         UNQn6z10bCruamUimEqeGrtrIN+t45je84jDpz+o5ex90vsXu+G3/NH/sLPdkJUiG06k
         Je4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNmQyuXmNin4wf1LajLZffHCG8ZLSw3o2O/wkR4phMV/EQ2Z+GnW8a3WfLen6aH12C0RxiitiFESAmRJ+YpbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiBdqKLSg1zsw55cjGsJMX0PeQUhCOEylsPu1FVE/0vBZ7gZYU
	Sd7U4qm+7qwhL69HSb5dK5NC7qrQyzMLECz6maHcmMZEQYUBpfddQ424dFRGeS3K4kbzRE7epye
	vfqhiE7fbYDymw5fEsH6fTGF/hTrdQGM=
X-Gm-Gg: AZuq6aIIADoEWMiISVKP08F7VVxC4A47zp5wDd57K+6p3gJP9mTuH/hI5a/0oCPmigm
	zoWFETZJq3whRzRqDesGNjta4zsbBPjTmxOH2+A5tG8hr3q9gyk94Dx9sL4icQxqRtrucHtdPgq
	h7sknOugQqj60oT5N74qzXfZYRltmBAmwbOqToiQdClJzQ4cFIcJkNmGOYA/tQWk2NRcUQDWFd9
	W2sBuPSex0z1nL4iR952kRG6h/MKOFiIkjmx8x8rMmqk+fXQLooU0n6Xn9ikSxtoJ+SAuVHceAO
	TrmAIfnTuIlSGNSgwmZvjW5Z7gystIa1U8CqK4LZCTiryljh8xESkEsB6SCmajPWAL0DB1s=
X-Received: by 2002:a17:907:d0c:b0:b8d:d9a7:1b74 with SMTP id
 a640c23a62f3a-b8e9f373a93mr420024366b.65.1770310616891; Thu, 05 Feb 2026
 08:56:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205131234.3244467-1-harshit.m.mogalapalli@oracle.com>
 <20260205131234.3244467-8-harshit.m.mogalapalli@oracle.com>
 <aYTFUMe3jUO_bGCr@smile.fi.intel.com> <34bac81e-6a6c-4cf6-b370-beead4f705c1@oracle.com>
In-Reply-To: <34bac81e-6a6c-4cf6-b370-beead4f705c1@oracle.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Feb 2026 18:56:20 +0200
X-Gm-Features: AZwV_Qi0HB7b0WeOF9-L3bHR_a1LclmNjzGpK8yNC1n2BCSBY2W5nybVUSREUUk
Message-ID: <CAHp75VfSYGoNUTqDb9WLYNYeChkB4mM+LEBpyRVnLOEKkr==WQ@mail.gmail.com>
Subject: Re: [PATCH v5 next 7/7] iio: sca3000: manage device registration with
 devm helper
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Andrew Ijano <andrew.ijano@gmail.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	David Lechner <dlechner@baylibe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:51=E2=80=AFPM Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
> On 05/02/26 21:59, Andy Shevchenko wrote:
> > On Thu, Feb 05, 2026 at 05:12:13AM -0800, Harshit Mogalapalli wrote:

...

> >> -    struct iio_dev *indio_dev =3D spi_get_drvdata(spi);
> >
> > Do you still need spi_set_drvdata() or analogue in the ->probe()?
> >
>
> That's a great catch, I don't see spi_get_drvdata() anymore after this
> series, so yes I think we should get rid of this.
>
> Should I fold that into this patch in v6, as spi_get_drvdata() is also
> removed in this patch ?

Ideally it should be done in this patch, but let's wait for Jonathan.
He usually may tweak these small things when applying.

--=20
With Best Regards,
Andy Shevchenko
