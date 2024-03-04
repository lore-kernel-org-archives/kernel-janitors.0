Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0681D1BDD9
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709543467; cv=none; b=Bufz/urOsrdkp0koeoB871WPwZ/JiZKQgJ/PJ5ZwtPY096DuFE3tJ7rZ/G+qKKepRfZVHcvBRBnuUqmzi8OLhfcCInK7DDqNNvFp8ueWlxAJDyx0ThAYx+mi0yJ4lJ1Ft6AZU/KmE3xPkwHgo93COvQaQzuZ/ubxrEmOybVUpSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709543467; c=relaxed/simple;
	bh=CUtZhKapsZY/xavUkp55/c+tMUGvUPzfYmx4hsetBuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5L/mldskj4NIgwfm+R4whwN0iWEfaWkngowBIriz2kRr83EqB+hCWiS5l7Ol/WLuM6BSIQ1k1Rv+Ks/0AzvS9zs01cYCH/ZTHNa2xUXAc2eDaioA3VSgIgSexCgi6W1sLc7TvQOq4NbaBjdIH+9YQpdyVS+K37a3QDfi6p9v4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wle3JIf2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wle3JIf2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412e84e6d2fso399365e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Mar 2024 01:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709543464; x=1710148264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MAS4NfgNmP0HvgF3U0o9wHMePf9MEveoKdtR6KEo+dA=;
        b=Wle3JIf2cCXXveWmsO+XQsfI6Wp0LQTBv0yAv9UfmuNDPSrpLITeSQRpdGphXW6PXv
         LzfdKadXWFohNf5bpwLXbu3iJv+winXnVqwnXi8LZ5CfbzS3KcR/uNIpxZpwHm/0m9nP
         xCdB1CPe5S4tOkrY40GLX2QT2K+F5OdHZIbjEZ6GZOep7AAEsT+qV19qxiyYONHZFrrz
         4AKI5/xgg1/9cu/uvH/Wc+wVyNMI3Xb+3zSQeWMZMiTKWz+MSyfRpZE0zo63el3vjBiX
         9/FoK2Yt/KGK56Y3aeiBW8z+NAonX2nPQfQx77Fa7acZFxOCxqemWX3w1S1MWpTKtE9e
         be/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709543464; x=1710148264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MAS4NfgNmP0HvgF3U0o9wHMePf9MEveoKdtR6KEo+dA=;
        b=f+ol+YfMKr4Q1hv3Pdzuy5qcoh/grbAhmmtV+KYGLJEocThoyv5VhBaZ3tBx0He5+r
         cNwUyL4zzfSYFu5+EwVLKZYNFClEfRI40jHFEttM+Tz7J1WYMAMtMsbqdLE9gX/fasnQ
         K8apkqDR9pPDmGPcw65iJRudRLoXfZSC4fSO0xOZyrgKe43vxG5x/AuEZPoqS2CEOUzP
         u5bNTfWFLEKytMY3dCI7oaULuVr8CxWhUSDAa176VZkGid5JcoItAGAN2JXIzP84yNxV
         EaQZQw9ExG8FRj1Rwkae7Pm0UG1wMPke2sqhMurzA325ttbS2CPbnI9pUtPRki2E+Nr0
         I3NA==
X-Forwarded-Encrypted: i=1; AJvYcCWvQpbJYB7pd3itxigt2zl8ItWz4ECL8oh9r8KRxwXETmsOOwsW+jPjEWxKfGG6xk+LLRDPd3K0g/M0Xinza48qQkwVN7WjMnzfx1OXTefE
X-Gm-Message-State: AOJu0Yw9cRu4HUUP69fDaM4fbYiWsLdYWwm7KLPDHGKOQ5WWROoY9x/P
	eImW0Z4TtljOhCoA4CJAiAyGlsU5uGec+yhj673ZPiTUVrCYrpVeBrGQXdcN2j8=
X-Google-Smtp-Source: AGHT+IFEmXB1YdPhR2t7PE+oBbpNOs7QcDk2q6Z7v8XjJnD94Ikv7TDFwaNIEDds2pPVHP4cpZUn0g==
X-Received: by 2002:a05:600c:3d91:b0:412:e555:f90e with SMTP id bi17-20020a05600c3d9100b00412e555f90emr938804wmb.35.1709543464434;
        Mon, 04 Mar 2024 01:11:04 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id j11-20020a5d604b000000b0033d9ee09b7asm11634328wrt.107.2024.03.04.01.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 01:11:04 -0800 (PST)
Message-ID: <9e4461ec-2207-42bb-a3a9-826eac1757da@linaro.org>
Date: Mon, 4 Mar 2024 09:11:02 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: core: correct type of i
Content-Language: en-US
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240304090103.818092-1-usama.anjum@collabora.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240304090103.818092-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Miquel,

Can you please queue this to mtd/next after you pull in the SPI NOR
changes? Thanks!

ta

On 3/4/24 09:01, Muhammad Usama Anjum wrote:
> The i should be signed to find out the end of the loop. Otherwise,
> i >= 0 is always true and loop becomes infinite. Make its type to be
> int.
> 
> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
> Changes since v1:
> - Make i int instead of u8
> ---
>  drivers/mtd/spi-nor/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 65b32ea59afc6..3e1f1913536bf 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3373,7 +3373,7 @@ static u32
>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>  			     const struct spi_nor_erase_type *erase_type)
>  {
> -	u8 i;
> +	int i;
>  
>  	if (region->overlaid)
>  		return region->size;
