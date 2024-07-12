Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EDB171E66
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794604; cv=none; b=HCumTbx55oZhNkpu78Fkx+lfz47sWPyA064KrKD2dLz6v++8Og/FOs3QGfNUTKsisX00uYXz2pT0froIOWyVfv2rBGjdgbPjMGQOtFVt4FJ3Xxs1ZOe1Y7iAuvb3iI7Flq6A2wT3Y/po7/DPT043SWyqhPKeGfh5gT19k0Q0JZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794604; c=relaxed/simple;
	bh=xNf1tJFXF2XZo5kA4RL74P4CbwPpLhsf5gbnmAkL9hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nu3hFRbqX8hygH7cRRDsfk1yAkSl875L9/SuVflH+lYtrNxVqSllKY2MR6KnMoWYp+MNDFDQcL5UwpMH093ipMAGa0EFG4Obhb0pwQ6J1an2+mXneWgt2yHMn3R81Jcu3g7uqHK1tef6LhoYG5G/fHnRLiw9BDfDY0608/awxk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RrwJRrf6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RrwJRrf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720794601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Em+4lpr48F+sTPUkNgk9R0TQyrZ2qwV17RRP7sfDWpk=;
	b=RrwJRrf6qQZFqsmqrQDIB5iOjrNtPDDyjBNr9QpCMapUI54rZCbCb8MJgbNC9372OChGMs
	NQcm8RtYEg8ddcmTS1y9Z8TmGPIZ9fQ+m9Wn4QoMeSLozQTWLk5P3GsnDtMsZQ/PHa19OR
	jeOXQtkG1bHMQTyyKlUt6G0WSFE4Sy4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-LPiQKhbUN9SwTrPf08YYtA-1; Fri, 12 Jul 2024 10:30:00 -0400
X-MC-Unique: LPiQKhbUN9SwTrPf08YYtA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2c96cb48a8bso1843511a91.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 07:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720794599; x=1721399399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Em+4lpr48F+sTPUkNgk9R0TQyrZ2qwV17RRP7sfDWpk=;
        b=LsHJAWCW1yvaWM2Y2DT/xV61q06WFRayYdiqnoSfsrcKQlXxPP3iR3AjRMC882E46B
         OliyUIcSoZ6+f58XlTa4JTd2uVidOFQzX1Xje4f8cbQu9bdMYEzQhtfyBq2/EewPjy8H
         sNqTj5VSyPQ+uDg4KXDYc3bbRchwDmHJw8qLjz31tvi7IEjckAuoXaj6BXuQpSPBKVoZ
         X1/ZAyVMQ+Lj+mhdpVEiquY7eQ1COwdlWpuy7SYFlnP+jDH4s/duRpi7NwafUDtnNJtz
         Q9ZztJI3zXXByzNU65fBfBglGan5QHTTUQXeegbRZKodj1qjSyR5TKMvw98k+4NMl4ZK
         4dCw==
X-Forwarded-Encrypted: i=1; AJvYcCVsjm1XswR04ui0umEGovpqkhUua1FE1GF56HoCynaKNlwueYx3lZufCydR/mo6D1pRr9Iw4xUwlRKKYh1IItjwVWTQ1F4VA0PrRrTGk3hV
X-Gm-Message-State: AOJu0YzmzRteUTrHKrdM1wE+WUpdtIL5qC6eMNDCgRjd0I3hOqenASyd
	9rS05v9cVpWj2ewzDWIWWK6c4M1wv+v0D0O0yCD4HCfkEWuKNy8RVUilJfjfVd7C4+h7spwzjTD
	8MUsdxFtK2Gf03/vQtdXSl11ePxp3wWkKyMBdoVqwnPm/so6R8xgfr4uK2vo797GrNX4ebG3meC
	CG/Fj5htCmYmrZb54MKrelJXWN3jb7g8t6/4mHQbJf
X-Received: by 2002:a17:90a:70c6:b0:2c8:87e:c2d9 with SMTP id 98e67ed59e1d1-2ca35d43887mr9092100a91.39.1720794599172;
        Fri, 12 Jul 2024 07:29:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEyEXCNphbXM4G/rPhQQo3eVo3TcpH/vUgTlLXnK+HK0NsMDnIjoeWz76/qY2/k2Ca8KWUcmscnLjrUmqi++Q=
X-Received: by 2002:a17:90a:70c6:b0:2c8:87e:c2d9 with SMTP id
 98e67ed59e1d1-2ca35d43887mr9092063a91.39.1720794598057; Fri, 12 Jul 2024
 07:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <124bbda3-7ccf-4e6b-b30d-7115e1c2620f@stanley.mountain>
In-Reply-To: <124bbda3-7ccf-4e6b-b30d-7115e1c2620f@stanley.mountain>
From: Eric Curtin <ecurtin@redhat.com>
Date: Fri, 12 Jul 2024 15:29:21 +0100
Message-ID: <CAOgh=Fx6hcJdbQpna2JJhnzp=YG_nyg-gpd=ZH7CewudtgDhAA@mail.gmail.com>
Subject: Re: [PATCH] nvme: apple: remove some dead code
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2024 at 15:13, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> platform_get_irq() never returns zero so we can remove his dead code.
> Checking for zero is a historical artifact from over ten years ago.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

There's quite a few return paths in platform_get_irq_optional, are we
sure it can never be zero?

Not calling out a specific case here, but it's not so clear to me how
we can guarantee platform_get_irq() is never zero,

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/nvme/host/apple.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index b1387dc459a3..f5a3a4e8b1e5 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -1417,10 +1417,6 @@ static struct apple_nvme *apple_nvme_alloc(struct platform_device *pdev)
>                 ret = anv->irq;
>                 goto put_dev;
>         }
> -       if (!anv->irq) {
> -               ret = -ENXIO;
> -               goto put_dev;
> -       }
>
>         anv->mmio_coproc = devm_platform_ioremap_resource_byname(pdev, "ans");
>         if (IS_ERR(anv->mmio_coproc)) {
> --
> 2.43.0
>
>

