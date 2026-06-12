Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F77393DC0
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jun 2026 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257163; cv=pass; b=ldY5A/cOChjlJUJmqu5blRAwB0Sth3Jzi1lalIS5Zv66pj5rn1SUVGe5HVXUQPA/24xLB4KlPDKhuL4heSoJu8+oJI4471ZLDHsPIpJ6GPfMis6LuyMj6fF/MmBkSfkjPy/g7S8YVgX88Luu/2qBwrzaBDJkJ9iPr9q3s2dTFMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257163; c=relaxed/simple;
	bh=CnU9qBZiI2d9l8PWlewTxxURPQrkvvHbexVentScxhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIPzqfbYkzmNpw3rsGOzzcHuIp889NWkFWZaQcXw0WRW3LhNBW2oMNIZneik8j8oWlk00snPhjPR3qo5BRTfU+GfoVD4ViuyFPrNsbW4RCRUczB4SiFamNXyevuX8ZOUSilEavgv5T6znxOCb+gu5bJ39wOfQyN/Eat9yJzOApM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=EIs556J2; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="EIs556J2"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-396aacc5bcfso7132871fa.3
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jun 2026 02:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781257158; cv=none;
        d=google.com; s=arc-20240605;
        b=CfDyV5f4w56uhLlh7OZjqDFNxqvptBPfnk04fyyobx7+jbNBARDHwtjqjzzLc5O3i0
         ITrr6dCIMENnRwDATPmMRyk7vlL9njCXBvTOJbJ4+lU9BWBmsmgRc6sXdCfV1oxscwMu
         W5oCkSkUbc0JJ4nwAxLXROGnSmXGMHJ50/62ISKfQfOIWQwSNmDNNtx+a4QONoAXNMHq
         4QZRJd78wgLektrQnKbshACVs8240OCVGevLt6uSb3doEiI8FOQGmNcdFimfmaNptW3E
         KmjxVnRgO39B1CBiOTsavGK2grgwAkizrPJfibhjqDaeJ25yog/Cn+Ov4l84dHmJ0NWX
         rOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F5QL6jsXXlrsglbd7oQwYpEsY1bNUh4psG4/A5eCDr8=;
        fh=Z35DmntZg05n2NdlCkItXKijjRC9xYaFtcjQ9M7dcnU=;
        b=DgxL5wjuOJeWqBTcBWKTklx45l/pcBaq/0gspG6UkSqERIjg8tUMkOmkariyt3efDC
         WDVI2McQI83DjfwGHDop4nzqHQUFK+QJsig8lslxKtpUAgu4/2xGLC+TqjRj6qrybSIm
         CFDCMng1juSvnZaxNogQPwq01DrZIbfiZfQpkz5De/J/ZUVg5G+WRz6sdmHoiUbUNIcd
         WI/+O4g83ZqHswZTviLT4p01ay931aYkco6xB5eNIdyuHssW4tC6vpcshGGTQW5P1l7P
         DlKyMB8TwZyhqLs4eGnAf69gvbGH+3ARcpXDhDvKNHZp3PDDLfXxZG3nOLuH6D6JlHb5
         yN3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1781257158; x=1781861958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5QL6jsXXlrsglbd7oQwYpEsY1bNUh4psG4/A5eCDr8=;
        b=EIs556J2m5Lcz5sKDBER3JbuCdLYJielTg6pS3JbmN0RsYEGvV5DSmjL3G3hT4ioxa
         PjJSCp+km9KgOJT5iG84mrFhEur7lIlH2ZwTjMsIpWoXvoRRJYqfyfsGLymX+ZnyIg2r
         8ib8uJFP5aJJvFgczZ9HhbII4dHqCF2NglnvsKAWvRBEk+T4OfDH+cMpetLyHzlsZmQr
         CbaEsMjv6SPsf7w9y3tZ5Zbau0gg3ET3gCDaUtF3NOJmR0lX9iQE9wWJJtDIhmW/cZwZ
         M3jI5W08h8gUEFYRQia81+cO9QD/dnwwCiUaOHxDyTJzl8TZkAY3tG032MYMmfejGNIE
         rUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781257158; x=1781861958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F5QL6jsXXlrsglbd7oQwYpEsY1bNUh4psG4/A5eCDr8=;
        b=U6IeiPEO7x8wgnBaBoTv9rsdVNZ3yRGoHJfkAtkkj7JQ2iIsYRuR1IbeZYbjOVdGRr
         poya+dRe2oeodmwhGVV46oJmEy1PCoGbLY5pCkfzErw0HKPTtfdCUm7Vqzd9ZKB9aObr
         fuNOLCEQY5R9M1a9tN8/K1zpHogPz7231tgweWBrL77EofcIkKlFRFpREzqajXfFBrys
         DWGXZuF4qjbotm5/8nYyWkUckKk+8Abl1CvEVc7vO4bjyrh/7EmPmQbSTattTEmZ7oS4
         nbieR2rv7OleeCIfS3zpvdzl9lAMw6j4vWbfxWeQOUxly30hyvbS6QOvxKrIKbudnY+m
         pDsA==
X-Forwarded-Encrypted: i=1; AFNElJ+nEMHJRw/zn5yRpx46ciiZgdhUTHuQW15kE0Grz+F4HE7R4wAgcZF8mo667pyh/P8xGeIS9tuSc5g3mkq1JYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJuhibSSQ4W4n8fNVRgZuGo9yzfiAbdmxVzrX25ZO5XaEoyixH
	Z40Zd02TZ+ad76W2JM38mpQNlxKkbcmN6qHzU6cW6ZnrDt61uinlp38fVVDTS6SX2xAkLjh6jiO
	Bq3CIIPd88/HhK60t40LK77O4Oiq/wwrZj8ZYLvIV0w==
X-Gm-Gg: Acq92OGSw9NTWS6xApSppzJs2VhVezLbBVK3sZ6183puX+Hjnybyj5q7P/zOy9MslCr
	6nPbj+C7DlTTnmv5/XKDB1k7Dr+OMW01hDY9+8Sc8COG6PRL/PJNW0rK4kimc6WcDWxn07M8Em4
	K/CUgbohhx7Un75K4RgsY2cFhLkGoAWGFBsHWhBRcTy3SsmeD6qwkehEFh0iheDYWJ2X3oiPWy2
	XlXpA5lbQa77OzahB9azjAQqEGr/Y0HvhQnhqLh+GniKQb4WB5SoKR8WqnuaRjdCzoPIVV9tNj1
	a330bPTAnswk/8M+eAOgDr/DoaXJdtSgjEbt20at6kBn0r3JznjiSu8eAOTexVASTXaJ
X-Received: by 2002:a2e:a989:0:b0:399:1ec3:eba7 with SMTP id
 38308e7fff4ca-3992b160959mr7302881fa.20.1781257157667; Fri, 12 Jun 2026
 02:39:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c9f86f0b-331d-4cb1-b8a2-00bc1e857ec7@web.de>
In-Reply-To: <c9f86f0b-331d-4cb1-b8a2-00bc1e857ec7@web.de>
From: Haris Iqbal <haris.iqbal@ionos.com>
Date: Fri, 12 Jun 2026 11:39:05 +0200
X-Gm-Features: AVVi8CdiaXrm1U290JlCGFSnQfH0BBbjtNNWl211mNib7KONSEM1txH-98N6PwY
Message-ID: <CAJpMwygBw3meeMj9mS+0N1p9mM2cOrYo81jf9toBkmD+rREkRQ@mail.gmail.com>
Subject: Re: [PATCH] rnbd-clt: Use common error handling code in rnbd_get_iu()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-block@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>, 
	Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 9:03=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 10 Jun 2026 20:58:47 +0200
>
> Use an additional label so that a bit of exception handling can be better
> reused at the end of an if branch.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.=
c
> index 4d6725a0035e..d8e3f145ee2f 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -329,10 +329,8 @@ static struct rnbd_iu *rnbd_get_iu(struct rnbd_clt_s=
ession *sess,
>                 return NULL;
>
>         permit =3D rnbd_get_permit(sess, con_type, wait);
> -       if (!permit) {
> -               kfree(iu);
> -               return NULL;
> -       }
> +       if (!permit)
> +               goto free_iu;
>
>         iu->permit =3D permit;
>         /*
> @@ -349,6 +347,7 @@ static struct rnbd_iu *rnbd_get_iu(struct rnbd_clt_se=
ssion *sess,
>
>         if (sg_alloc_table(&iu->sgt, 1, GFP_KERNEL)) {
>                 rnbd_put_permit(sess, permit);
> +free_iu:

Thanks for the patch.
It does what it mentioned in the commit description, but maybe we do
not need to do this?

If there was a kfree before the last "return iu;", it would have made
more sense. But jumping to the middle of a conditional block to reuse
the free and return seems forced.

>                 kfree(iu);
>                 return NULL;
>         }
> --
> 2.54.0
>
