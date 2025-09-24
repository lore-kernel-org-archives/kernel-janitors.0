Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391482367AD
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758705712; cv=none; b=HCJMgUoLH1fCcfAndH5anEpWjWH8Hf4QktpN1lj2TXUQYWacRvAeukrzdHd+SduPJMPWSDDdSHJxsGUnvas4P/9CkweoJ7V7GEZhieoIutPR4NBBjwm/68TvyyFtw8VxqbqKb6u5M0KlOkWMmO93PjxM91lFSdv3v3ty0pGcXaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758705712; c=relaxed/simple;
	bh=7NNM8R5NxUh4SLUZIUUbqIsW2iUc5a409TK77C1tuyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dw5J2Vxt/yON3UEf2ljLWEk05tNZmOTYKiaq+VwjNmZiLm5ul5m2lrdYphGj3cv0Fhea484dCS+mp00UMiZZs2zOSRc/bKkXeG2R7r4ch6/9hYneuEldkLvN72JIfg1Kej32nYDXJXaAFKb3T6Niap8gMd6gN5ghmuGxobQPrxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wtxX12zZ; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtxX12zZ"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6236479c8d6so3152790eaf.3
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758705706; x=1759310506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxVruqv640FOouJsJqQA7LKvaemFmmPlp5hTqabzSp4=;
        b=wtxX12zZMCbYJ4SaQu86TeoIgpI+rduA9BSMMNzhgxyyxY46tnLzIAV/grdzH1EAek
         62fWfgsE1BpTdS8vkMF5puLRWog3J/LKyd37ZeMw00HxKpe0XO4GxZGvhm3wOZ238nbj
         Wy2iVu9FgG6a17jdYZEnDIaKXpbL6d64cpEFq1vuHhzlBNBfh9HV3xcrayFjJOOm6L7M
         vWQ71SOMcQoTl/B/BKk0VJtszwbzV5oQsHFLjbWKCsk5/AEFlqUt8yBTjhl5lR1gFbc0
         US1oSH9oXdFJulRd/0dW2Hj/+vunUQB6OYdQRRxT8MGFgVLkHsQqSTqQuNi5cQIY+N5X
         S+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758705706; x=1759310506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxVruqv640FOouJsJqQA7LKvaemFmmPlp5hTqabzSp4=;
        b=NPf6Wvm1kq+NivRp+dkRziZPS2KonM92AbLg2plOLDdqJ3edYfCit3EBq746LrBU/2
         IQ2s4LZKJZVhSk/52+0RrL1lRmWW0IvPK01D7eAZwOFUo9y1MDiExFI4C+IiQ3wHIqhJ
         2Pdh7bL3xbfSlIgP4xjUmRMw72urWvhGxxMgv14e5LUeRq2AiJn1154+6NoNpNIwrW34
         CUkVP5j4fmj8BygfyJhYozZllvWbQSyjLrOFtJhYvEh+9LgSoGVHcrGsfgt8VoZ4W7f7
         3E1oB1FgcGzAfFyxRpnrwUo/xPU2ZMN1YC2inkx4qxgHV085plw4nHJF9mYvJnF3QG5t
         L/RA==
X-Forwarded-Encrypted: i=1; AJvYcCWxhkUlA9KgCU6eolGuCqADj+nE8wjKfmKtPhgKHGXE9Vq8/sv8EPfZhNFcBMq4KN9WJ1yl0squruM+cslC/DY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaKNgfqUeLt2ed4PP51rGOc4AIgk1jghlZXHNxpW63xsP1rrbe
	pm66hxqK0mikjLEH5EGIFthc3imcSjIHPdZy9PXPsnN6Bf3tLejGVW+NHZOScwMe96KEieC92pP
	I3WUTJbAlY+IqEfAz7/VfDqz+oGv4GQvSONHcvzi4dQ==
X-Gm-Gg: ASbGncvLYqSZORq3FAVqCWg7M2h9aIM73MpNJS7inUIz3xEK6bxzftYw7vZ/hRqGVW1
	p+bJ8VPuxrABXPVKuwiTvHlBb68w0tkpUbcE0wFktvOQuUA5qCswe7oHdURXwgF+EE2Q5627fIq
	Qwe3sWgVVCg98Y9myK9T7ZZwVqNLAjghV3cNS2lrjYPSiMb90DnjYURtpnn0sVTWheTE+HTtCpq
	qD56/tp
X-Google-Smtp-Source: AGHT+IF9MUcsTpqeMRCCkmOByiXncoZ6aC5AAkRn9kos4HYZSgn1UCyuiasgjldg/eI9Gic3np9EBS9bfwc5jv78a7A=
X-Received: by 2002:a05:6808:17a0:b0:43b:516a:6a3a with SMTP id
 5614622812f47-43f2d4a0853mr2953120b6e.46.1758705706106; Wed, 24 Sep 2025
 02:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aMvV4kK386Sni10i@stanley.mountain> <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
 <bb776102-310b-4a84-943a-86d4138592d8@oss.qualcomm.com> <aNOfXlG21HIBR18E@stanley.mountain>
In-Reply-To: <aNOfXlG21HIBR18E@stanley.mountain>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 24 Sep 2025 11:21:34 +0200
X-Gm-Features: AS18NWBAFawQ8-QtJaveVkFxCVFVwvIAoDOcJ1zhiDc0CJ08YKpktCHoZXO_RhA
Message-ID: <CAHUa44G2yaB28sd0FjkjyCNJKXjx2Jg9j-9HXytyvsmiQ3ThAA@mail.gmail.com>
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Sumit Garg <sumit.garg@kernel.org>, 
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 24, 2025 at 9:36=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Wed, Sep 24, 2025 at 08:58:45AM +1000, Amirreza Zarrabi wrote:
> >
> >
> > On 9/24/2025 8:48 AM, Amirreza Zarrabi wrote:
> > > On 9/18/2025 7:50 PM, Dan Carpenter wrote:
> > >> Re-order these checks to check if "i" is a valid array index before =
using
> > >> it.  This prevents a potential off by one read access.
> > >>
> > >> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> > >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > >> ---
> > >>  drivers/tee/qcomtee/call.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > >> index cc17a48d0ab7..ac134452cc9c 100644
> > >> --- a/drivers/tee/qcomtee/call.c
> > >> +++ b/drivers/tee/qcomtee/call.c
> > >> @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_p=
aram *params,
> > >>    }
> > >>
> > >>    /* Release any IO and OO objects not processed. */
> > >> -  for (; u[i].type && i < num_params; i++) {
> > >> +  for (; i < num_params && u[i].type; i++) {
> > >>            if (u[i].type =3D=3D QCOMTEE_ARG_TYPE_OO ||
> > >>                u[i].type =3D=3D QCOMTEE_ARG_TYPE_IO)
> > >>                    qcomtee_object_put(u[i].o);
> > >
> > > This is not required, considering the sequence of clean up, this
> > > would never happen. `i` at least have been accessed once in the
> > > switch above.
> > >
> > > Regards,
> > > Amir
> > >
> > >
> >
> > Also, size of u is always num_params + 1 for the ending 0.
> > (basically means `i < num_params` can be removed).
> >
>
> Yes.  This is true.

So this patch isn't needed. I'll drop it if no one objects.

Cheers,
Jens
