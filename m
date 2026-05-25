Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70B0383C74
	for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 13:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715338; cv=pass; b=dqDnBQ6oWeGiWtM6F7HwujZDVooatzUHHQ+pNat3R6Hh1k1Maa80dRR7ix5jlY7iZ2RDYbZbMlkQb2TTkeyPNrwbYZW6fa12/pSYrEHjBAetTzI6SuYZeSCUPHO2BoGNn83EuVDQvnoxnJOgjQEnxMvq0QNBMGv7B8xC2flM/cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715338; c=relaxed/simple;
	bh=5vadwd1NT4LYH/6j75FTMd9Led9+b6Zc0Qn0mpQdLPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2h+AcKONkzKmI+3SoecHaNBrLiK/2Nc5DD1nWYhonHi9rAZLKlCg/zitsO+odmvNTFdesnZqm72AUq3EvqBECvJvIEt6KWzkxCRr8F+PiU55YWaEqtUdL1p6t0WDwx/+w+Vg/lgDIQ9qpFoDr8aLXPJJ9hgy9vVHAuGD2VKRMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSNcvgwH; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSNcvgwH"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7c0dea734b8so89814847b3.3
        for <kernel-janitors@vger.kernel.org>; Mon, 25 May 2026 06:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779715336; cv=none;
        d=google.com; s=arc-20240605;
        b=IiQ0/Jt2DGDPEHg/JIhAzaX1A8XZASdK0Iit4UAS3RL58gRvGgDP0K0nthy6ruozAl
         i32BoSS6zZK7yPT79i5plwRBHyUfLR+94MsD0/EFod9+vOdHy4nFScIdjmHzWULfF0Ih
         5n/ZyutQrFh8yZJqGwTL4QLUSJ93J0h7HyLK4lQJm0GgLmmO21xIc1WsRmyQFBBFvZVw
         92NYy/9GuoMC/Ex8MIC24iNsS1hPCnCG9tA2kOVrophLj81xfyUHMMfRFyswCg1LYSvm
         xa4BniElE+GcRQEyP+ETMKAROxfFsP0CSUOhYfzwZMKwzaEHRMuIxKcBeS5Pzbhdz9MS
         Ma1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/6MFRTZKfm7Sb4pZlWDCvdf22hIS8g937dw+Nz2lPPE=;
        fh=/KFB/V5JPi1QcBwsyMmkR1ZcBKPLKWO9lVZmDgkVsks=;
        b=JaGrWUksjsDSLJSlTWHvuijRkdERJbySPkR5BZAcTe+1ufrXoKcHBsJifjOq6bH0mE
         UJVAxiPx/6N84b3KUsXWfMGIxtZu809duJaqzJDY0+IYsO7E2IypFWw9NQNE9b6BMExu
         RhJjFa8BjUUeB81T0pMv/5+UyJV5IHw2JLdrt/EAe0qFUF88fWOEu8HAJRr3MEl4Qp3z
         r+bRB39gi8QUmv2xGfUsoOT1TA6JJVH3DpGz5btMOCm86GGGCCSJHVfkwe3e6bpzLCDv
         Xll+6Je6yatsLL+O5l3MxQ8s5mMS6HAKim5pHSUY2/Jq9v8LYuKYHl3KAKjFnkpY6PCN
         kFKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779715336; x=1780320136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6MFRTZKfm7Sb4pZlWDCvdf22hIS8g937dw+Nz2lPPE=;
        b=bSNcvgwH1Jr0Vupc9cnVVo5sgEztWkx7xTI66xrm/bPuP8sY3quWacoMpf2cWYlsDy
         DqPhdlbuD7JpMwjDTal9K3Y2MuJjO4DC5eLDrk9ty4J3YbwpRThB9kqzc/DJCPIia7PJ
         4Va56XT7fhkGWQJa/0aq6JVlJbwUOGVXH4QGHaARymVurX5uhYANFhahWgcrXIEDpI1E
         eSbi1sSvkt1a/c+HGqYCrrDHK1XIBjUd9PnBY5Maoy3XqKz8PCGvjjf7Rtcsyfg+tOhA
         39kdFHGYRvEy7BQjdEYZX+6eO6//hZSSEvXAGKWRyoooTMeU+OmGVnPWBHT/N2PM9RXs
         Zajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715336; x=1780320136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/6MFRTZKfm7Sb4pZlWDCvdf22hIS8g937dw+Nz2lPPE=;
        b=r9lxsjRM38wnk9okvFeaOzGv7U3Ps//0x+6gTqo15GVPymlNfVcRg8ucdNuQ3luQ24
         sp/SHSh7EZ2l2wDrxt7H02uHzApWsCjezVCR16gmqMHCMwC7mMLgY7zh7aSbbLMto1Iv
         +nEjurLkPMLX4B8QhvdblSzEPUhGkDvgwxx1zOvg7KVjNjTBS/HslZvwnJcyK37L7Sd0
         SyPvWHvYeEVpan3GzuqQr29KleYtRVGT0jyeLXepsX8OUsCR+7TXvXkaNln3HOHigGUg
         pb2gWLeCmvWZ7S3MRYX/2eYhy74TxxKM8Z3PUrd3qj1iNEWGPdbz7F1bm50uVQNP0RaM
         1oXw==
X-Forwarded-Encrypted: i=1; AFNElJ9urYTWvDXbOEsVRaesyVpun9He+XVNSycCQSDRv5uf4LVdyg7YqWgKEnyk8leIdAyfvjSx7jnmpL/Tiz+EzHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44doWAqivjPfLJFxgUpzOWLP9rHergN4gJw0B2tuxRoxK/xg2
	7l8bL3xXBEwtA3qwqY0FTwPkDIh0oWEfTKyE3wF7g7qJYtI4a1WUvcvEzcgiW5HIFkuMMhc2w4A
	ilah5XFMAx9Qs8NYOuh2SVpSE4laLN3Y=
X-Gm-Gg: Acq92OHsTmWeRkI+x5tSe2S7AWTCwpzbZSrg1nr+ZzSjVxvbbkmKRveTYp/I3eAflhK
	u4XzronYzFJjmmV1C/bCqi3W4dwBWbLl0A2arQfWOvjOuRntdpqDIPcJO8Ak17BgtO9YSZT3hd7
	myEX9HfxBgshjaAjM8sKWQUxMMr1vtRVmKweH01rT81MZkuHkDxsvxrE8pFA5+409clRyQ5TPI1
	N7YJt2VdiizIjjm2ealKz5xbNQ92qsgVLJFtxRejh0eumCVlg0yMl4GJCrMoaOw7c4KrheO0BFP
	MLLWa+U=
X-Received: by 2002:a05:690c:4b0c:b0:799:198d:8c5a with SMTP id
 00721157ae682-7d335fbc537mr157076197b3.34.1779715335747; Mon, 25 May 2026
 06:22:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahP3O2tQdu4dNx_c@stanley.mountain>
In-Reply-To: <ahP3O2tQdu4dNx_c@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Mon, 25 May 2026 08:20:31 -0500
X-Gm-Features: AVHnY4Ln2oRkoa1-22uMDmFE_zBvuUlsey06Dkg0x_igMH6mKJTzwvAP3cl2ceg
Message-ID: <CAKqfh0En4pHqSfxfd2FHSDTxfWx6BfJLfeQ3xup4bwfLSTrZRA@mail.gmail.com>
Subject: Re: [PATCH] iio: backend: fix uninitialized data in debugfs
To: Dan Carpenter <error27@gmail.com>
Cc: Nuno Sa <nuno.sa@analog.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 2:17=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> If the *ppos value is non-zero then simple_write_to_buffer() will not
> initialize the start of the buf[] buffer.  Non-zero ppos values aren't
> going to work at all.  Check for that at the start of the function and
> return -EINVAL.
>

Commit message is incorrect, it looks like you're returning -ENOSPC here...

>
> Fixes: cdf01e0809a4 ("iio: backend: add debugFs interface")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/iio/industrialio-backend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industriali=
o-backend.c
> index 138ebebc9c0d..4763e224ebc6 100644
> --- a/drivers/iio/industrialio-backend.c
> +++ b/drivers/iio/industrialio-backend.c
> @@ -156,7 +156,7 @@ static ssize_t iio_backend_debugfs_write_reg(struct f=
ile *file,
>         ssize_t rc;
>         int ret;
>
> -       if (count >=3D sizeof(buf))
> +       if (*ppos !=3D 0 || count >=3D sizeof(buf))
>                 return -ENOSPC;
>

See above comment.

best regards,
max


>
>         rc =3D simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf=
, count);
> --
> 2.53.0
>
>
