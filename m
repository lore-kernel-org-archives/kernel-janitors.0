Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AC17E77B
	for <kernel-janitors@vger.kernel.org>; Mon, 13 May 2024 20:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715630585; cv=none; b=eS8+U9fsFTb6Acsz4xN4HbPSydNP+2eVOzMwTfZ745uUXo+ycmYWW6dlNVjK/Zc9WFfe3drjFQQyAl0yNFPQQ3TQ9u7UkUwQ3TPCtO0nTRi9UxyAD93bsKiBV5McGbPgvlZhB16WGgMWZrwKDflO+ZyP+p5jYmY6x2N+rozkyUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715630585; c=relaxed/simple;
	bh=s1hXVf6tyL8uq55NXv8OQrk/qgk5wctwVrIENTgbzus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XEwcMTItx8bbZk8HWmYW/z072GJHMxkoUsRodXpof2UjESNE5yKhfir+5Te6cfZJvSlxoH/O6A4OPBbBpoGTWyH9YHeFNIIluepq47hmIkN1Wx1dg+2G/+qXPPIzlo5m5QjtU4ZpH4OM47n17u2njCAhVm/fSTfb9Qp5w+4h9ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=RfVuyz35; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="RfVuyz35"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5b28c209095so1981686eaf.0
        for <kernel-janitors@vger.kernel.org>; Mon, 13 May 2024 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1715630583; x=1716235383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/mC8iHyEmlHpwqktNUilmvaxLB5nXIdCTUQODGPwBk=;
        b=RfVuyz35LfglAVOIwUtsA9iQZYEWDGQTmQEh6h2L4OPk2VqLbrWnDWFrE5heLsGTaJ
         8mKkQnBoY5rttBzbfPUqmmggKu4gO4QbEcBKcu8zGWtTSuX9Qvj0K9j8rteqlkR1PB6o
         y9FLJIpN4sBLLxUsMUn6Pcxq3h8CMmyTXRHTlM5uztiYsJSyXfo1O85tmdECBqdVmR+G
         PtQG4Rkv/jLeVVcZfVfiONnYBlK4Tpjc8GGzK2pnGyUT1DOHDghAGYWJV2PxhiaaK61f
         24GnvLpCXClUCfAC60XEQ/8JLYLrM9X/uD0FBZ+Py90j+WF73hoXPl5Cc1cAVRYSywaZ
         9p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715630583; x=1716235383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/mC8iHyEmlHpwqktNUilmvaxLB5nXIdCTUQODGPwBk=;
        b=rFyJD4y3ENfJV/kNJMHeOimo3GmSLxzvoCxGWfZjPmvUdme1jRSxxansjqyse+0z+m
         RDdtOFLsar0H9LrYcXDpoBLsEuncoZyJ+LxGax1LPj/5q501ZfkHbePL67zsNsfWOBLe
         DJtXKhPt1yI0xBlGmesBzn2NYeR5u0L+8T973GRoNU2LYCat74/uYWKFtVhLDJ/1E+1C
         Xc84ciLYBQOlfDwacp/kW8i3753SZEB6dzvhuP/eIaAaXwDgu609yUCRZfM3pxr5iC83
         q/5SBGQY5YK/FOjUSFORAYLzSLOJjhZBQ1f+n2TNVErUiW8IY59xFW1GQp05CcwORr53
         2w0g==
X-Forwarded-Encrypted: i=1; AJvYcCVSz4AecSusiI1LCD1tJ+kZsxS5LeNmj5rhB6r39QdQF9lQvYDsxiUIksh4GjeIXneKl7LGDWEIgEqkgHf8zVEBslii0C/aLSc9aQGENlIn
X-Gm-Message-State: AOJu0YyNzembVwkEhbDEx7SeHSHHGX5Rtaxm4aaEamF2EQVYgh5XjiOZ
	EKlHUz5e/VbfMElnP1g9Wy2JvYu90WtUj3Rkdh5Bni9Qt12+ig7U0CEij8fkIDjm0moKuiW12t+
	H8IM8/+iEc6phZbodU+SH57mmXN/gQT4Rb5qYml0GeV3iRCBIUw==
X-Google-Smtp-Source: AGHT+IHMvY4NwUqw059de60Gzl/JLpgWiP6Cdv3/1rHDK4v1S2yPxePJas+PW6SFNOzXbZEEw2kevniOpnmdQuaVQcA=
X-Received: by 2002:a05:6871:b27:b0:244:bb9e:bdbc with SMTP id
 586e51a60fabf-244bb9ed677mr6392251fac.10.1715630582870; Mon, 13 May 2024
 13:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240513184514.3200222-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240513184514.3200222-1-harshit.m.mogalapalli@oracle.com>
From: Crt Mori <cmo@melexis.com>
Date: Mon, 13 May 2024 22:02:26 +0200
Message-ID: <CAKv63uvAe=RkZ6ytWfNkM5exy5ys5n2NwcJER=VMVAP+61-+rw@mail.gmail.com>
Subject: Re: [PATCH] iio: temperature: mlx90635: Fix ERR_PTR dereference in mlx90635_probe()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org, 
	kernel-janitors@vger.kernel.org, error27@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi,
I agree it is is copy-paste error. Minor remark below and a few typo
fixes in commit message. Thanks for your contribution.

Reviewed-by: Crt Mori<cmo@melexis.com>

On Mon, 13 May 2024 at 20:47, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> When devm_regmap_init_i2c() fails, ragmap_ee could be error pointer,
When devm_regmap_init_i2c() fails, regmap_ee could be error pointer,

> instead of checking for IS_ERR(ragmap_ee), regmap is checked which looks
instead of checking for IS_ERR(regmap_ee), regmap is checked which looks
> like a copy paste error.
>
> Fixes: a1d1ba5e1c28 ("iio: temperature: mlx90635 MLX90635 IR Temperature sensor")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is found using smatch, only compile tested.
> ---
>  drivers/iio/temperature/mlx90635.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iio/temperature/mlx90635.c b/drivers/iio/temperature/mlx90635.c
> index 1f5c962c1818..2b61489d5ee0 100644
> --- a/drivers/iio/temperature/mlx90635.c
> +++ b/drivers/iio/temperature/mlx90635.c
> @@ -947,8 +947,8 @@ static int mlx90635_probe(struct i2c_client *client)
>                                      "failed to allocate regmap\n");
>
>         regmap_ee = devm_regmap_init_i2c(client, &mlx90635_regmap_ee);
> -       if (IS_ERR(regmap))
> -               return dev_err_probe(&client->dev, PTR_ERR(regmap),
> +       if (IS_ERR(regmap_ee))
> +               return dev_err_probe(&client->dev, PTR_ERR(regmap_ee),
>                                      "failed to allocate regmap\n");

Maybe fix her would also be to this regmap error message to include
regmap EEPROM?

>
>         mlx90635 = iio_priv(indio_dev);
> --
> 2.39.3
>
