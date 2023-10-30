Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1CC13FE2
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BxxX/yaH"
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0ACC5
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 04:56:53 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-77774120c6eso305869285a.2
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 04:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1698667013; x=1699271813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQKrKJYeQqI408ZiaZJRkmFH/H0/KalWqC8BKV3SRh4=;
        b=BxxX/yaH3N0SnoY3YHlM/FgUnbyQ3wwunyVaEo6W1A7FFcOQv10Jzpk8T5xc7mtSvT
         /pBBQ/eaH4eZr46j7f12ANQX+SK+6gQJhS8WRR3hpyIYIQ/7hMl+fLy03JTc+jbwhZwG
         HYh2y+dIHiTzIv5b9d4l0ZKmeK62dFuAwGwrBcx4I92unMRLYT9XCWPWC6ANa1V5JZnK
         7AMrVsqT+nrcPB2Nzyi8L2Lk2fYogAqzXdn63VVLFxJg6zMWNBaUnfqkvBSKLRyGw95M
         9bAPCot9dsFuw1wv8TetxrZZd6ZjwzAyBW3xKjHwshpgnc0lODN7shjC5eqPJvvdziO2
         XuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698667013; x=1699271813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQKrKJYeQqI408ZiaZJRkmFH/H0/KalWqC8BKV3SRh4=;
        b=fxQIvZ32TUuXUeeCBJk/SFAV7Y/Bus8kgS9IL6jIDvI4mdkMEsv92McbQP//qeezx1
         LqEnKwpW3N0waufSZOhEVsJ9SjJTzvAvzU0Y+iDT1311qxcnMYcGX8u2FDirAmFa3/a7
         HgfXAltMGELkNCz2sC6XfBLs/dc2AZmB1YZ3/3TNc4ePLc40Cbyf1ARh30/zUjYhUsTY
         alRP4nM1CJK4NsRfkVzLuWYBJoqWaOooserC1/+KUt70GLz2JNDe5GQzg1MP4nIOhCOS
         awrS0D6kdxchR4Wy/eO+lrA7C8T0kRUZACg3OZPOYzlvfEtrGn6rcOWu9/OHW2mxEgmh
         oy1Q==
X-Gm-Message-State: AOJu0YzY/YhLalXUf4t1xo/6ZbswU+h5HxChmu7VJ1HwvEy7wKFI1vpu
	UONKmiW71rDlPo4tIqDEfcxoKysESx8eLPP4baM=
X-Google-Smtp-Source: AGHT+IGlo1N1nWgqEHCTfKHD4x4QvCUlpDbIj3E4lfEj8khCJx1F+5pIBfZ7gBWPby1i734LKGkdUg==
X-Received: by 2002:a05:620a:4395:b0:778:909b:58c8 with SMTP id a21-20020a05620a439500b00778909b58c8mr8857446qkp.78.1698667012846;
        Mon, 30 Oct 2023 04:56:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id r29-20020a05620a03dd00b00767da9b6ae9sm3242228qkm.11.2023.10.30.04.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 04:56:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qxQt0-006eIL-QP;
	Mon, 30 Oct 2023 08:56:50 -0300
Date: Mon, 30 Oct 2023 08:56:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/dart: Fix return code in
 apple_dart_domain_alloc_paging()
Message-ID: <20231030115650.GC691768@ziepe.ca>
References: <b85e0715-3224-4f45-ad6b-ebb9f08c015d@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b85e0715-3224-4f45-ad6b-ebb9f08c015d@moroto.mountain>

On Mon, Oct 30, 2023 at 12:03:12PM +0300, Dan Carpenter wrote:
> The apple_dart_domain_alloc_paging() function is supposed to return NULL
> on error.  Returning an error pointer will lead to an Oops in
> __iommu_domain_alloc().
> 
> Fixes: 482feb5c6492 ("iommu/dart: Call apple_dart_finalize_domain() as part of alloc_paging()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/iommu/apple-dart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Really need to fix this so the function does return ERR_PTR..

Thanks,
Jason
