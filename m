Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B215499
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VgXjy7Cr"
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEC3E4
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 05:01:00 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4083f61312eso34156965e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 05:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698667259; x=1699272059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EoSNs9EZy8FjXofhAFGXrcuEgy2S3k0/mRHsu+JGg+o=;
        b=VgXjy7Crsi3lJumtI3xllzEIetsVncPWlvgNTiIhgE3NHduRLfsEJgx023ZdpFndbm
         cGnZRLQGHok+d/JMMxrokpa9yeNPJ4nSwh6jINFiKqHPn58Y+hipCmc3iewz0sGYIxW4
         vCqf0VQ43SjOHKy94u2gAbz49mVaX+wfCMuYMBHVz4ESPmygkvNafZ+rEKCHdUmnxgQ/
         75q5/UfzHiGK88PDriVWed5F9T2wl1Lh4u+GSwKGOp5F3BJfWdAjeZLwvJamd2keEpPG
         vmLH0GbJ7pyfi5O6qnngHEtDQXt8fdY8jAbTvfUSI5LWQvGGs8ATy5p5fWfhGnih19iO
         RumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698667259; x=1699272059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoSNs9EZy8FjXofhAFGXrcuEgy2S3k0/mRHsu+JGg+o=;
        b=Ow4Lv1d4eDg/RjefwsBnlO9U8uTbUjZEl2KHRFfSrgGjH4LZTp8xHX2DdKuSRqgrgV
         QeZ3l78FomB+eisE57MC/BHqnwQKXqrN7nLK0vTx6s6YUAhyxZyDcAUubOwmSUk3acjf
         Kv92EzSHoknLhtXikKEzyUfwpIe34peXR70PUb8MdimZJrIU3Jg1YB006EWn5Nqkwm5U
         lmyLDDU8lFppbvqUZ2xs+pG3VD7a2YUtvaVgRpckX1sDzjgTu3mujBeMjxR5lE2JbAhj
         +yIVax+3DJMNklnWkPyW2bAqfH9FSV5NvbAPbTXR8SDBDZ72Z4FPSfgjxjJJTI+SeArT
         Pldw==
X-Gm-Message-State: AOJu0YzcBtDWvDB7pAmrO6/OKYu3hlAVIcFic2/PgfMgMZaz8hbN96d/
	UnB5zsZ3SfMELu/WxNrdXz0lPQ==
X-Google-Smtp-Source: AGHT+IEHoMWYLrdiInS+Ryyqg0WeP4bGW1pIEoKS/odTJNy57DBtLeVnqhfxJHH9SxRsxYXg5KZzgg==
X-Received: by 2002:a05:600c:3146:b0:406:53ab:a9af with SMTP id h6-20020a05600c314600b0040653aba9afmr8298697wmo.10.1698667258881;
        Mon, 30 Oct 2023 05:00:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hj19-20020a05600c529300b0040841e79715sm8903405wmb.27.2023.10.30.05.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 05:00:58 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:00:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/dart: Fix return code in
 apple_dart_domain_alloc_paging()
Message-ID: <d42a8cb4-dd0d-407e-8659-915ca821e1f6@kadam.mountain>
References: <b85e0715-3224-4f45-ad6b-ebb9f08c015d@moroto.mountain>
 <20231030115650.GC691768@ziepe.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030115650.GC691768@ziepe.ca>

On Mon, Oct 30, 2023 at 08:56:50AM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 30, 2023 at 12:03:12PM +0300, Dan Carpenter wrote:
> > The apple_dart_domain_alloc_paging() function is supposed to return NULL
> > on error.  Returning an error pointer will lead to an Oops in
> > __iommu_domain_alloc().
> > 
> > Fixes: 482feb5c6492 ("iommu/dart: Call apple_dart_finalize_domain() as part of alloc_paging()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/iommu/apple-dart.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Really need to fix this so the function does return ERR_PTR..

It's called as a function pointer.  Changing that will create a
backporting hazard unless we rename the pointer or something.

regards,
dan carpenter

