Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B015B97E
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728902340; cv=none; b=mJr6aWYgjVN7VMUVC09jKK14NhT5cpBR1ftiMQEq3AcYUwi2jqHerLKTCgZYaHeRI/32xy9X0J3PatqUkb+VuQT9i+oEfJ6mF5n7HOFtOzDff5iAJe33IITbaD01ynRFJX+dl+hagL7wFhEIaVpJ5U47/04xDtMHXF0Q+Fe408I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728902340; c=relaxed/simple;
	bh=FU0Do7UJmeA/jYmiITl348LdiZkVn1yygV3LnrY4fWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjegJv2DEP89+ZncP/C4EeKpNh2GMql72zVYg40PlSSoWh/OLVTRnx/aEE7Ou4BVHYY0ecG1vvDkwEyx8cCnEv3s4G2WbZTDmtdnVCAuxl+JGgecDgA68asiEStrISKcdgZHbJw/+yeu65L7CqNR8yEuiU6mPc6HOc8l4fFL9IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfH23soD; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfH23soD"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5e7ff0d4681so1483353eaf.1
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728902337; x=1729507137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DeVaZ8esBQhrSfyG6kHPEmxIglfj+ISJFZ4DMJuVbMQ=;
        b=LfH23soDTV+gSOcqY4Ca6oM7ZVxL32V46OBhaB+Xwt0dHOvC4LPp9lzf5KGcYSRHKs
         KOkoNe/OhkAksR7IXrwyFF598+3VIFMjROKZAyrnvHIqhBVDyube5auKYazvtikhtFA2
         YmtStbLpA1RczEAQa44HeftAQmaYpyHdOdDDOU8Eqzy00VbD6s9ThF0OcWUhWwbjivSs
         sVcB8pK/ugM/9YQVa/vpv6YOpbhF7fcuLrQU+jQb+jDc2n3qQ2pmeL4jGTV6CMykEwU1
         a+6HlszkmUpK96Cu3VZbE1OY8TrgKOjGD3gmmbM0wVMIu+C24lsPkG/jG7ka3xrs7rD9
         B+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902337; x=1729507137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeVaZ8esBQhrSfyG6kHPEmxIglfj+ISJFZ4DMJuVbMQ=;
        b=p7LQv/hEuNZZCfWni5zJWb27CnPc9lJGBWNpzQmNEK0PbfCjFLfHIhAOsTFqqSO9Fr
         ZWIHgfzul/jxO7Wo2u/DUN9a+xHUGWks4orwtFz3WDetgB3D+UW3adig3vLoHyKmKH39
         gxuonUf0Fn5JD1gBjjzw3YFDqw4+Aa4HdfposzHDVnd1b5E3QlxgKmkPKCeL4rGCuY8S
         PkgQ0kx66UOKDh5Jl07BtQpZPYm77LU5P26E6pO9TCRPdN9Sv/cQ+OyOrHWArFIRyQXu
         OR7VwiOCnCdnBvNExkyXqtGsN3GL8afqHX6qFk+9neOXCFyuO09iv28qo6TGQiBFOf/8
         Sj+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+K16d0+nxFx54vAAhQBndFaeJskjlHyndSefSZTtty5xDQOOVh/3t9iB1dWfBwJ2KIvC//Sic2R4UwUOUg+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJ99fUdItIBTSy7rT2bTjHdt7sTVhGfOmcL12lRQzeAlOHqor
	uiL+D6g687pWNdxRVOEKMtMkfAQ2zixWfwgYhQxnWMqa0q5xv7kkpj7+cKLoJdGxCauyKgcmmKI
	Rch4Dzv57JoL7vpALaEG51jpCxcyJjy1u/Hx+kg==
X-Google-Smtp-Source: AGHT+IHZNrqfdyioUZTjh8s6CK+TKTqUzsrBVI+6ovSzA5Pgf7K3SXa3zKJQJyQstral1yLaWPnUqAlKvYI9s7o+C5A=
X-Received: by 2002:a05:6871:706:b0:288:47f8:925c with SMTP id
 586e51a60fabf-288872c9d95mr4095779fac.1.1728902337054; Mon, 14 Oct 2024
 03:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <df8bfbe2a603c596566a4f967e37d10d208bbc3f.1728507153.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <df8bfbe2a603c596566a4f967e37d10d208bbc3f.1728507153.git.christophe.jaillet@wanadoo.fr>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 14 Oct 2024 12:38:45 +0200
Message-ID: <CAHUa44GU=SR9MgBaXJi1yEbvg5Bb73FV4n8erGhN4s_qioKNCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rpmb: Remove usage of the deprecated ida_simple_xx() API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 10:53=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> ida_alloc() and ida_free() should be preferred to the deprecated
> ida_simple_get() and ida_simple_remove().
>
> This is less verbose.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The ida_simple_get()/ida_simple_remove() API was close to be removed (see
> [1]). A usage has been re-introduced with this new driver :(
>
> [1]: https://lore.kernel.org/all/cover.1722853349.git.christophe.jaillet@=
wanadoo.fr/

I'm picking up this for v6.13. I guess your patch set now depends on
this patch. I can ack the patch instead and let you include it in your
patch set if it's more convenient. Please let me know what you prefer
to avoid potential conflicts.

Thanks,
Jens

> ---
>  drivers/misc/rpmb-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/rpmb-core.c b/drivers/misc/rpmb-core.c
> index bc68cde1a8bf..ad1b5c1a37fa 100644
> --- a/drivers/misc/rpmb-core.c
> +++ b/drivers/misc/rpmb-core.c
> @@ -64,7 +64,7 @@ static void rpmb_dev_release(struct device *dev)
>         struct rpmb_dev *rdev =3D to_rpmb_dev(dev);
>
>         mutex_lock(&rpmb_mutex);
> -       ida_simple_remove(&rpmb_ida, rdev->id);
> +       ida_free(&rpmb_ida, rdev->id);
>         mutex_unlock(&rpmb_mutex);
>         kfree(rdev->descr.dev_id);
>         kfree(rdev);
> @@ -176,7 +176,7 @@ struct rpmb_dev *rpmb_dev_register(struct device *dev=
,
>         }
>
>         mutex_lock(&rpmb_mutex);
> -       ret =3D ida_simple_get(&rpmb_ida, 0, 0, GFP_KERNEL);
> +       ret =3D ida_alloc(&rpmb_ida, GFP_KERNEL);
>         mutex_unlock(&rpmb_mutex);
>         if (ret < 0)
>                 goto err_free_dev_id;
> --
> 2.46.2
>
