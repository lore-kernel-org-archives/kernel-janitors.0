Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54054404
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Mar 2024 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312503; cv=none; b=LIjO7TYexh/NZeDcliSRvEeSasC3MIo3Jd+TXypKOL/AU6OARLa+7guSo6SUJfy+C6JhCb1e+7BfDeCdp0RuhYuUzhs7fSULpSQfcLPEbTEOb3TX7E8L7q5HmrndsI+/HAazzr7RZq2ZWfpuf7vkO8NmRSlaqA4j70+9y2sSFYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312503; c=relaxed/simple;
	bh=4n8ceEv6Q5ediHfdFs5AkThnNMy3m/KB032Gll00g78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1M/CcbXsfPFki/aB9Q8n6/kA4/OWFCpaJSmzTD0o3aI+5dpEW/2io/GWSobKY0dMmGEllTpxP8YUlJeHFRQ+U07SEA5/mcmOhdnIChQjIfNhxIngeEmglcbyLA/l/4d3by2E/Q+oqYAm/4CDr+VQ0ArX5ZpPh3pRa8gIKGJKFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x4McovRZ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4McovRZ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e552eff09so326094866b.3
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Mar 2024 09:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709312500; x=1709917300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yXl+fhGWmqpXUkYfoGJfgxrC/Y54D2lC6NLr66whDt4=;
        b=x4McovRZ1YgPqBq+Xg+Uy8IN19QebV34fUrnyPR/x8BofSbhWWD9ZXelAWtO6bplKf
         6esODOpseYFFhbtklasHCUII8E1mzh+dDSDF5kUhDr9WcGmSuZSMfAHVerrC6BGefFlb
         bkYB/LZ8z62x86LpgQ7ehZCoD0fZhMTYkh9FzRcojn4MuI0sTrK9Ut0JMhldDD6JYFKC
         OA5TvXhweH0ZguQGJrdGo/b+iG5qOq0lq3ftSrRH1b6j3qqZMa0fMUjpKedRbrn6ReDS
         tYL13Mxrz20NabsVeNz3v2KABt0naiQo4Mm3l9e9vu6koL/Fnt+GA28Ax5Zk8EXsF2jx
         oxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709312500; x=1709917300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXl+fhGWmqpXUkYfoGJfgxrC/Y54D2lC6NLr66whDt4=;
        b=V+f5pLUOrZeKEacGems6nO3fxOQhABPkt6uV/ZBUFKN0mHiJpgIVNDhQ1QjH9zrmoc
         sfwXSXs2BWXSSpxBeGVCUqflOZx+zWmcciRVmIUN0mS0Y8FaVQdJzCuxL6SR3VmkE5SC
         dhx5yKBQG/6oNZuSz5ge9O/cFTEoKVB9oHw3uAPthpXkQwG03/eSc9T1M6pbkI2iMBmw
         MtuZlwrKBTGadVKvbRkTiMM0sbfZMk48Wayc32Tjr/xZiSoHSAaVSrLSP12QXaTyI2hZ
         Zly6ZzxBG+MQg2T7alCypuC1UN03mvdD/K5Qo7fYtmxSj12WDHXXV9ck+DvUxhJfl1L2
         LcYg==
X-Forwarded-Encrypted: i=1; AJvYcCUAlom8Z5X3Z2wiZQNsbw7kkKNf8m2XcjIAWcchvuJmR8WQjLzPhM4I7Y0Sy79sTUmLM0hZhcYyaMiRfXggDl/EirX3kTJSN4Aq9qWie7xi
X-Gm-Message-State: AOJu0YzHt1TbJSmt159w59aVXfbRhSPer1abqaVUXhnCUFjqFjI4Y9wO
	JBDB3tCC5FWJG+104Yx5KW5JVJGGg+iEljLqTXqXAdFGiQE/ugCNcPSZsQaCOcc=
X-Google-Smtp-Source: AGHT+IFGat9UXgkHbrn1IFjTtMxIE8O4RGfV+O/IUsZ8Ep40Xr1elDiVdFGMlUy74J4zM3dAirtmhQ==
X-Received: by 2002:a17:906:f355:b0:a3e:c738:afa2 with SMTP id hg21-20020a170906f35500b00a3ec738afa2mr1843445ejb.76.1709312500414;
        Fri, 01 Mar 2024 09:01:40 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q12-20020a1709066acc00b00a440846650bsm1856780ejs.184.2024.03.01.09.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 09:01:40 -0800 (PST)
Date: Fri, 1 Mar 2024 20:01:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	kernel@collabora.com, kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Message-ID: <c7db3fa0-d5a2-43aa-8038-0a722f2b8f26@moroto.mountain>
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301144517.2811370-1-usama.anjum@collabora.com>

On Fri, Mar 01, 2024 at 07:45:16PM +0500, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65b32ea59afc6..46bc45b80883f 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3373,7 +3373,7 @@ static u32
>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>  			     const struct spi_nor_erase_type *erase_type)
>  {
> -	u8 i;
> +	s8 i;

I have a patch in my output which also addresses this bug but you beat
me to the punch.  Declaring iterators as "u8 i;" is a canonical bug.

https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/

regards,
dan carpenter

