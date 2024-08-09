Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7498198E89
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723216700; cv=none; b=CnNpRhOAH4QbdxZAU6FYunFrr/gV/I325Z4cvwerKbKr/kng7QbAVoukkQ4K9FhvOx1kHdN87my+iDUuNA8P5Ln/Y44ibaEPR23v6WzUebpXIN0xYYUeINOYhUiRlD7AUhRpsT8bhp+c5+LItkDtDcsFRd2w13QWCgFR6EA49mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723216700; c=relaxed/simple;
	bh=/EM3q5IlSCIFwsDkAPs+OHdl+L/TU8svrKcRrbqMQTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS+up5/1LrsYxtjVUqO4BwnANcQH1sqJuemJgRS9pxZET8LG/KC0E9NG6NBhN22OD4dEayxvJsX4n64J1FBZfnM1+R6pOZMSWyBRYr5+6Hbsatnry+R8+tey+WY+exx9+61+Pd5m0vAgZvniSKf3/JhgZc6CRKuFRO0b7XYY5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d0s2K0Y6; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d0s2K0Y6"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5b3fff87e6bso2409303a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723216697; x=1723821497; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SkAuA0TQuIJubT/gzLo1Ew+hKYWcgbM1/4Xh7Rdb5UY=;
        b=d0s2K0Y6uIqM9P6nqLFJuRuy0OUbu1ExNw0/yrPW2670lWk0xYE94V/NQhq7QF5uLS
         /k/+AtdWfIMbWXDVszAFSRayB4inp1K2Ow7yfHOKQhEAWavHUrMo6kW3Wa56GoRehwmj
         Ujui2BgbGmfESX3tN3JNkPxS3Ee38TvPKNZ+Ks7jI/5y6ENHDlUeCuf8XW2cM5vlXmm3
         OZKgSpWZpH712A65quA0a6lwMS5llhvrD4oiTAUmJvhAeJv6fnTw5R0rxsZzHBJW5qHa
         PnuY8RvJCsb04a+FVFUdempeVXmXhzY9cw8Tg4BHtVbdVqQ+9FPvPL9gSluRUtN2kQWI
         w/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723216697; x=1723821497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkAuA0TQuIJubT/gzLo1Ew+hKYWcgbM1/4Xh7Rdb5UY=;
        b=j6xj2OgHW5SkxHwmLxVUettSmakqbAZd2kFC8NXZvm1ccCZMyUVj/0DVtA3uGvszvT
         f7ipG7BN5B7+ws1VdW74G0cqKy/rfiwyZL1oaAuKlbDV9zXO96it/bkDVZ9LBkVMjEH1
         +792nTW3SE4FO0ZfSgHcsILwqs0jqGywhVfdWnUwPsbMLICI/Y4LdYkcfbVEptIAX54w
         YCoCm6idH2wZakll2POJLr2hX0oZUys+t+dCaMvGXkDtPebs2v2bQs7wT292QbM8D+lM
         iVHrV25CA50g65QnDPK362+JvH/lrby1LX6xsTTmGpvrI6JqQiH4abtoaBoUqq4ninPo
         enUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+/jTzwG3vIRWu5MjIF0cVG646ZyE5nLNJRmkCsnkC42tIvWhFJDueSOauFr3FDohqdaU6SPHzxZZjuDI8eOUffX0sRhSraHtWBSBISIhK
X-Gm-Message-State: AOJu0YzZdCQLmZrguDUidXb4Y1C+yqCeOrXvmDzAruPgDFesPbo7RsEK
	JJuAmFRC+zbpWqZ3mRokpnEH2Zcg3/4iQUj2fSVqn2CI8RZ5g1vd+RnNfCuBJMUykNyL2MiX+wl
	u
X-Google-Smtp-Source: AGHT+IE3BF3RiUwYRs8zj48//qSl3fhqZ7h+NxAGnToZ43JzPUYNcvOhzjSvbMJ6Al5z5IWbyrhHjg==
X-Received: by 2002:a17:907:e663:b0:a7a:a7b8:ada3 with SMTP id a640c23a62f3a-a80aa5568b0mr149264366b.3.1723216696813;
        Fri, 09 Aug 2024 08:18:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d4392bsm850371766b.108.2024.08.09.08.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:18:16 -0700 (PDT)
Date: Fri, 9 Aug 2024 18:18:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matteo Martelli <matteomartelli3@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jic23@kernel.org,
	kernel-janitors@vger.kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: pac1921: add missing error return in probe()
Message-ID: <9a98aab5-bb68-4206-9ecf-32fbf6c9c7ef@stanley.mountain>
References: <1fa4ab12-0939-477d-bc92-306fd32e4fd9@stanley.mountain>
 <36b1a47a-7af2-4baf-8188-72f6eed78529@wanadoo.fr>
 <66b5c5df76766_133d37031@njaxe.notmuch>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66b5c5df76766_133d37031@njaxe.notmuch>

On Fri, Aug 09, 2024 at 09:31:43AM +0200, Matteo Martelli wrote:
> Christophe JAILLET wrote:
> > Le 08/08/2024 à 21:28, Dan Carpenter a écrit :
> > > This error path was intended to return, and not just print an error.  The
> > > current code will lead to an error pointer dereference.
> > > 
> > > Fixes: 371f778b83cd ("iio: adc: add support for pac1921")
> > > Signed-off-by: Dan Carpenter <dan.carpenter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > > ---
> > >   drivers/iio/adc/pac1921.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iio/adc/pac1921.c b/drivers/iio/adc/pac1921.c
> > > index d04c6685d780..8200a47bdf21 100644
> > > --- a/drivers/iio/adc/pac1921.c
> > > +++ b/drivers/iio/adc/pac1921.c
> > > @@ -1168,8 +1168,8 @@ static int pac1921_probe(struct i2c_client *client)
> > >   
> > >   	priv->regmap = devm_regmap_init_i2c(client, &pac1921_regmap_config);
> > >   	if (IS_ERR(priv->regmap))
> > > -		dev_err_probe(dev, (int)PTR_ERR(priv->regmap),
> > > -			      "Cannot initialize register map\n");
> > > +		return dev_err_probe(dev, (int)PTR_ERR(priv->regmap),
> > 
> > The (int) is unusual.
> >
> The (int) explicit cast is to address Wconversion warnings since dev_err_probe
> takes an int as argument.

I don't want to remove the int because it's unrelated, but Christophe is right
that the int is unusual.  We really would want to discourage that.

regards,
dan carpenter

