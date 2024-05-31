Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85C1422DC
	for <kernel-janitors@vger.kernel.org>; Fri, 31 May 2024 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717155994; cv=none; b=er05mdTT6UTP1DN8IYbHMILUu1C7Jl/PkTUv4iZPWs1DJaQqczK21heZ8g8BvlWnFL9mtQsd+R4fC44TEaoxPWedynXKPSgz+oMGFf+Z2DqBlV3Mh/rEQnBG3LB6kHdscKU1FQJadoIh9IuMs+/j565iiMSxpFlNhzN1COHGm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717155994; c=relaxed/simple;
	bh=cZzInqUviBTYy37ASxA9p9wWZvIhStkg53piCJBUU3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Emu9lm4WKSFzzDVOb/5k5xYIyXz5k1yX1ld1Iu53cfutkPUic2rqy4gHSiOg0rEzvDeVC6sVvHQdlaVwx4V9ae3kmxLOAIprtl0fNRs18i3t7QCRCBevvGmywmPMEtY+EGpFsUV9VmNkMn1drlIlGli0i/5d0/70YTqayUnPqHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YFH+bIWg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YFH+bIWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717155992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gr8k/Vm02ygPW32aJTJ9dTPWwg2hxQoQtvUykdUgDb4=;
	b=YFH+bIWgrlK3omp36Gogj48UX9ZLf0dcnOEwDx1CQjylWB1NK9rE72GYI2y2/Qu4ppeZcL
	0//qhJCjfEw8oWH4ZsX70gppPtm/YKGnEqT+1ruV6850ySZbz1K9kOJK/3xemTWtRZZwrC
	tmzjSzZSFbZNwPCiDQ0BRM1YU/PJ0j0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-GlLT5NudNIyp80dEzVZ_bA-1; Fri, 31 May 2024 07:46:30 -0400
X-MC-Unique: GlLT5NudNIyp80dEzVZ_bA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2c1977f75d2so1635786a91.3
        for <kernel-janitors@vger.kernel.org>; Fri, 31 May 2024 04:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717155989; x=1717760789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gr8k/Vm02ygPW32aJTJ9dTPWwg2hxQoQtvUykdUgDb4=;
        b=imXQPi0tO+M6GlGA8BrNdCmAKNRt5xiBE2zrpSvjAVTgNJrRxjjUMlEsM1kqTTRgFW
         RwtxuM0gIDCoibjzLSZojPqA8xxWiIyGSCxTdAwYmYakMuhjsWwY1MiFqt4lALQ5+ZIJ
         gQJpo9yTxngDJvNvgYMQlo0cRmFupqNhu5JvSdsV0zPaCTjOOaEhT0FJLlnXQHstCD+g
         gMsqKzd09DwbJ/USL7yXQOlQp3CTYYUMTKyBjpXW2ZDujCqbwNAsKwpWgOK0jCWlJodg
         oP1ZA3oDjuA25UpCWQvKxfCCR3TPmiI21fjFF2osmAuf851ZBKYPYpJWtgVuJcGCE5+S
         2Ugw==
X-Forwarded-Encrypted: i=1; AJvYcCXBukOO1GfZkg04IdjeI3vp7LJxgGwii9/XYdURzYYkGtFACXnPfDu9CpHO7zMOvcaoTPB3OMnh/3jLSV6FRIn956BtRFxmHmBBFxRDNesV
X-Gm-Message-State: AOJu0Ywm8zd7FdRmnpms+pfMOYj8mL+w9rvgmREYVUs3Lj/WaLbycfE7
	1sBELoU5E+Ka12QvqSOXOq5lWAnobnQyy5MJeAGxXOUNJeM/27UMJTBBCUNXdSzAznFmLJZiF88
	3gq1r6nbaDs4qxJUp1igffaYNKouGPBmeAcUWRZCfbSMhLiiR4GEb5OUBGBKRMZJs9oYVwrCQ9L
	6ldK6zO58pwNaQ+moOATcqAZzVPvG6QIIrSUd+FO9o
X-Received: by 2002:a17:90a:aa94:b0:2bd:f049:932a with SMTP id 98e67ed59e1d1-2c1dc5c8832mr1704308a91.34.1717155989414;
        Fri, 31 May 2024 04:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTq1sroVC/zyco89stsGzLWmiBt5HeZSFTphj0DZrCDCYOHtXNSLNxvKpXEsf8gGnY0WWV2gmiczJH02FvAx4=
X-Received: by 2002:a17:90a:aa94:b0:2bd:f049:932a with SMTP id
 98e67ed59e1d1-2c1dc5c8832mr1704291a91.34.1717155988960; Fri, 31 May 2024
 04:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530-md-nvme-apple-v1-1-b8b7ca569660@quicinc.com>
In-Reply-To: <20240530-md-nvme-apple-v1-1-b8b7ca569660@quicinc.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Fri, 31 May 2024 12:45:53 +0100
Message-ID: <CAOgh=Fwfab2W=6QzhuBfm4fazXMnNLudSQpWw3rmX5ZcSo36yA@mail.gmail.com>
Subject: Re: [PATCH] nvme-apple: add missing MODULE_DESCRIPTION()
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 May 2024 at 06:25, Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
>
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-apple.o
>
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/nvme/host/apple.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index dd6ec0865141..0cfa39361d3b 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -1602,4 +1602,5 @@ static struct platform_driver apple_nvme_driver = {
>  module_platform_driver(apple_nvme_driver);
>
>  MODULE_AUTHOR("Sven Peter <sven@svenpeter.dev>");
> +MODULE_DESCRIPTION("Apple ANS NVM Express device driver");
>  MODULE_LICENSE("GPL");
>
> ---
> base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
> change-id: 20240530-md-nvme-apple-e0edb9b98c45
>
>

