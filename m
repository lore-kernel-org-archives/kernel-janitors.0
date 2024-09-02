Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4372113C3F9
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Sep 2024 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271364; cv=none; b=Pz/GmCfSfmZK62OSXY4uo7fJSU0YCo8+5IjVJOSAC2VzXDcFBnHd8/blWiWhY4YI2jBHfdyJOL6C6xM0tv1gJtGBLs2GIBsyNr3mfWHJJUMnhAT82l9aRvgouzA8z4oACHmKSxO0+NG/bGhN7X+IMqFPfnVB9LPxf3eInkR2CsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271364; c=relaxed/simple;
	bh=wC8xzMzlPnO+dBRVKjjK7/vcblbhPFJgSsSulGtzCnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4yQ5YAi/9fr5sm3Zy+1ssSFCzXulVfpRRthlQQpqJahuLSTShOKho3zWuiEB5exdrR1zAw0Av9tCStwuDH0QeWG72vAKWkBnYMP9Oazwi5/JdWAHWkkOcFRyf6maNfCytGX7X8rWuRctEQdb/UOzjy9v2nySwwrePBnZYUOsik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=glPQpsGC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="glPQpsGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725271362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3aVhs1qCJ5nn1n2tspBSfh84wUHtxtOt96DO1P3PGc=;
	b=glPQpsGC7otGQvE5YN/1P2Xi4TK/OgdDx6h41DGl0TwT6z0orwSuxQAFblTQ9PtGQBHRcJ
	pZcr5cSpLJDslpNIvdUK1olKrrBoiACzteXanHBZr0kmNYqv4D9Ry/HXwqJn4mzrgovdBS
	VmFv75MJMj1msf4NsggBPaPwnykjn28=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-xzmen2ydOCGS73ucFQgAgQ-1; Mon, 02 Sep 2024 06:02:41 -0400
X-MC-Unique: xzmen2ydOCGS73ucFQgAgQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5334efaf344so4716440e87.0
        for <kernel-janitors@vger.kernel.org>; Mon, 02 Sep 2024 03:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271359; x=1725876159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3aVhs1qCJ5nn1n2tspBSfh84wUHtxtOt96DO1P3PGc=;
        b=IrC0RqBVvsQYmxKh/7VvwZg+eGS4JfhXC2Bi6ZRnAALsEHTVgSpA0jI5yVG3fmwuQs
         xnEq6Q+i+kbJLjm1UWFTWqJD5vib1SaK3EWDFle9U/meda8a+254+ieamFle/K8VnQqD
         l35N4V9Zpk+JhRTKNV2+S4/HC9I0+5+vd0PyccQJfclAMbSxKxcRm3tRiG4ZTn/sIcmF
         No1bMPr2SuSzxuNHo7MCrDTyolB6uCDw4H4Hpz7YmeHroAD3+tNMQQBUpBEL+075ZdMj
         iNGIDSzXDMvMJRDUjFPBXNQ5mG949DAuzwBUifBOAtWFAQ0aqlSQueMSFyWD6Ig6u1uF
         khxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmS8wi7wOTDIOROgJbNb3Ej5mKxNl3exI3z1YaLztkDF0nIZLyaCslBI22GSOWdDm9vUjorE6/aMAOOZqbwJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSj6uW7UPzx4QRKanMBSHeiW0iSrg4lxTiMBUvByGvyr++Rofi
	R2EQC6P398I1h6/22PT9XdycdpxGfcqQGpuN52Gli+aSBbUj8+ebmi3uuxUKd8/BNh4LnseKAHK
	VBOdeRcqk5nOp6pFEBDqLJkJLBdH/rxIH6CYuSntKA6darsJfqvV494BdYdgHAl2ZLQ==
X-Received: by 2002:a05:6512:1393:b0:52d:b150:b9b3 with SMTP id 2adb3069b0e04-53546b34943mr5680987e87.32.1725271359437;
        Mon, 02 Sep 2024 03:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJCNAGd+SrVXjSEva/aZdp2Lloeq7/9W4it/yjaPnbxuCUm8K7pqO6fFS5xhVESu8DRVSaLA==
X-Received: by 2002:a05:6512:1393:b0:52d:b150:b9b3 with SMTP id 2adb3069b0e04-53546b34943mr5680960e87.32.1725271358848;
        Mon, 02 Sep 2024 03:02:38 -0700 (PDT)
Received: from [192.168.171.203] ([109.38.145.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb410sm538863666b.21.2024.09.02.03.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 03:02:38 -0700 (PDT)
Message-ID: <96b95366-ebbc-444e-ae77-ccfe87a10dd5@redhat.com>
Date: Mon, 2 Sep 2024 12:02:35 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Use clamp_t() in
 ia_css_eed1_8_vmem_encode()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 David.Laight@ACULAB.COM, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
References: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <155aba6ab759e98f66349e6bb4f69e2410486c09.1722084704.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/27/24 2:51 PM, Christophe JAILLET wrote:
> Using clamp_t() instead of min_t(max_t()) is easier to read.
> 
> It also reduces the size of the preprocessed files by ~ 193 ko.
> (see [1] for a discussion about it)
> 
> $ ls -l ia_css_eed1_8.host*.i
>  4829993 27 juil. 14:36 ia_css_eed1_8.host.old.i
>  4636649 27 juil. 14:42 ia_css_eed1_8.host.new.i
> 
> [1]: https://lore.kernel.org/all/23bdb6fc8d884ceebeb6e8b8653b8cfe@AcuMS.aculab.com/
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thank you for your patch(es).

I have merged this/these in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this/these will be included in my next pull-request to
Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  .../isp/kernels/eed1_8/ia_css_eed1_8.host.c   | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> index e4fc90f88e24..96c13ebc4331 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/eed1_8/ia_css_eed1_8.host.c
> @@ -172,25 +172,25 @@ ia_css_eed1_8_vmem_encode(
>  		base = shuffle_block * i;
>  
>  		for (j = 0; j < IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS; j++) {
> -			to->e_dew_enh_x[0][base + j] = min_t(int, max_t(int,
> -							     from->dew_enhance_seg_x[j], 0),
> -							     8191);
> -			to->e_dew_enh_y[0][base + j] = min_t(int, max_t(int,
> -							     from->dew_enhance_seg_y[j], -8192),
> -							     8191);
> +			to->e_dew_enh_x[0][base + j] = clamp_t(int,
> +							       from->dew_enhance_seg_x[j],
> +							       0, 8191);
> +			to->e_dew_enh_y[0][base + j] = clamp_t(int,
> +							       from->dew_enhance_seg_y[j],
> +							       -8192, 8191);
>  		}
>  
>  		for (j = 0; j < (IA_CSS_NUMBER_OF_DEW_ENHANCE_SEGMENTS - 1); j++) {
> -			to->e_dew_enh_a[0][base + j] = min_t(int, max_t(int,
> -							     from->dew_enhance_seg_slope[j],
> -							     -8192), 8191);
> +			to->e_dew_enh_a[0][base + j] = clamp_t(int,
> +							       from->dew_enhance_seg_slope[j],
> +							       -8192, 8191);
>  			/* Convert dew_enhance_seg_exp to flag:
>  			 * 0 -> 0
>  			 * 1...13 -> 1
>  			 */
> -			to->e_dew_enh_f[0][base + j] = (min_t(int, max_t(int,
> -							      from->dew_enhance_seg_exp[j],
> -							      0), 13) > 0);
> +			to->e_dew_enh_f[0][base + j] = (clamp_t(int,
> +							        from->dew_enhance_seg_exp[j],
> +							        0, 13) > 0);
>  		}
>  
>  		/* Hard-coded to 0, in order to be able to handle out of

