Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17BD1BC49
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Jun 2024 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717279176; cv=none; b=taYYH4Ydg5h2vpkyIzrjED8bTIp38p774UHRmTI+sq28QUSj+rPb864iZC52ilgt4fyYZRtM97Iu507mmT6DYY8CJUzjlviustMoA1Tg3PsGPVSIYrBTuUpH3JVUY4khYoZNvQdhX67bGEIX3rH5kPJOTbg+UavAql4wvfQv7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717279176; c=relaxed/simple;
	bh=PcYw8B0OwC576QVkyVNdU/zXFIKFiVP1GIPmCPuMW1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnD9/L2RfSQEFqwB61qdbsKSKZCXNybCHi+yWgmftRVdVOtDxEFz3ZxN4w4Yn8V5YlccJG01Pl+mZx1e0++dYkq9Ul75BOK7Uf7k0wR7yhXQLCJmPr+MnFAaIKiaYZKO5BK3BLeQnBUd4bGr2EP8sbfi5F6zC60/LO3teI+77qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk; spf=pass smtp.mailfrom=philpotter.co.uk; dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b=yOsDUIe1; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b="yOsDUIe1"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35dce6102f4so1983049f8f.3
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Jun 2024 14:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1717279172; x=1717883972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sTOsbAZo8vNm0CKh7Mt5V21qlJPe4ljx7b2MR8QJYT0=;
        b=yOsDUIe1Iv8XcIMWamR0N2hA3FtND21E3YUmg2Tr4LfFQNcZ2wsaibO7mvmWC8s88p
         UW2z8Z1b9wggwW/mjfiFDhxIqVryoiRYzJef0bfCCA3d8BLNJxXJnvXG2XgThHBU8maB
         +W8OoAGRf2Smk/QetTA/RNr8FzspvVYgHrPKmqS4Qr83Jlz4m7s6dvho4Rmo8D76V7da
         shNiMQdNAo+em3B1mGh8M8LxtFW80LFI/l3taqgnS+JnFrfnd7fdmhrkXfB8e46E7uq6
         cUVCD5UgMrL649kGsbHV7N0VQPyHYgEh8Yj6vxWL61Pk+kEelHQAeVClXTJARozh/I/g
         H0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717279172; x=1717883972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTOsbAZo8vNm0CKh7Mt5V21qlJPe4ljx7b2MR8QJYT0=;
        b=SEuN8znb7NcYoZ9V7p1tdr2XOTyLdOifpuYQj2TpYJyrSjVzHyPaVdeUpdmR+mjZLA
         /MWzNlshw82+4lh2N75HgwqCWyQuJ9GZOr9hEK89F/aJGSJak3FlETWd0Wpsy30rsTmQ
         CtO07X4uP3CsfVtmndJUly7c6lzxzYvLfqMxObXLqDPuOdNrpvTlnK5NBpa+wWc+FMRR
         +i0mMyyFHzL04rOiyjoAwJ3pEWOJWEAbgoJ0SWi4Q84YnFK8jdQhCMbvxOLL4DtQPpJI
         ORWxQR/98c4YcrW97tbAok8kRIUgn70F0q7cCdXiV0KxpXn8Dhi+zMjb3LZBcmXPxlT2
         bcvw==
X-Forwarded-Encrypted: i=1; AJvYcCUn6e3bSQ/HG9aAA6OkauLR2k4oa2KCT4UkFPj8yXNp6uqfjqjTLhUE4s5z9BmD2WoZC5Aj4CdLPXeBaoF8cClwq/CbwCDKZovY1BPbVDf2
X-Gm-Message-State: AOJu0YypfjUBWpj1W+2xNIuGluMoM6galv9Bi0aa8yyBCkJDKcXWgyiW
	1CFdqmp5HRomQtKXyD0HQOVKUJacGRxYPD9ZZvEoclz1NHBvBCl1142T1w1BWA3Sa3gOpcREzRs
	r
X-Google-Smtp-Source: AGHT+IEA7wwDn+BdfBi/5KDwizeC8T0MeZncA4PG97jlcNb4dxq2IwYiWK6daHMf25J7vxM6Wc3kCg==
X-Received: by 2002:a5d:4a0b:0:b0:355:3cf:49b1 with SMTP id ffacd0b85a97d-35e0f271884mr3457651f8f.19.1717279172011;
        Sat, 01 Jun 2024 14:59:32 -0700 (PDT)
Received: from KernelVM (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c9d26sm4750470f8f.25.2024.06.01.14.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 14:59:31 -0700 (PDT)
Date: Sat, 1 Jun 2024 22:59:29 +0100
From: Phillip Potter <phil@philpotter.co.uk>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Phillip Potter <phil@philpotter.co.uk>, Jens Axboe <axboe@kernel.dk>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH] cdrom: Add missing MODULE_DESCRIPTION()
Message-ID: <ZluYQbvrJkRlhnJC@KernelVM>
References: <20240530-cdrom-v1-1-51579c5c240a@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-cdrom-v1-1-51579c5c240a@quicinc.com>

On Thu, May 30, 2024 at 08:23:34PM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
> 
> Add the missing MODULE_DESCRIPTION() macro invocation.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/cdrom/cdrom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> index 20c90ebb3a3f..b6ee9ae36653 100644
> --- a/drivers/cdrom/cdrom.c
> +++ b/drivers/cdrom/cdrom.c
> @@ -3708,4 +3708,5 @@ static void __exit cdrom_exit(void)
>  
>  module_init(cdrom_init);
>  module_exit(cdrom_exit);
> +MODULE_DESCRIPTION("Uniform CD-ROM driver for Linux");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 4a4be1ad3a6efea16c56615f31117590fd881358
> change-id: 20240530-cdrom-543cdcf21da4
> 

Hi Jeff,

Thank you for the patch, looks good to me. I will send on for inclusion.

Reviewed-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
