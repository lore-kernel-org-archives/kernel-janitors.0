Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3A9D529
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="oG99BPfM"
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF10A2
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 05:38:25 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6705379b835so15526726d6.1
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1698669504; x=1699274304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PnuIYwmSwa+S4XlLT3QvUcDtJ9g3YgN2fZ+LLWa8C7o=;
        b=oG99BPfMZybkj6u24AruhJ0xkXKFcgrx1mmspYsSUMjM6ik7kjuNc7zGYA6tJ94VRM
         ghQJl86pIRyDFtaORpOaU2me3xqxVDLZ2CfIc1U6zENWFGniMMd1Q6CR1wQKjq44UD4H
         fhk5QwoT0UJAoLQep7mmgfrvkrLW/1cz3Pjcg8zaV0n25wVnR/VJsFQcoEtRqr5kw236
         yP23k04xc2rX3Y++zOS0GISDEva4hpaWktXNvADDJsgWT260NCVxAeIMup/spWiy4z2Z
         /4LSzJJW6tH52rPGqvJJvNt90rpzvpXk+0Vu5OQslMtdyWYN3zvw6FQtQ/y0/ZXnOmf0
         vrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698669504; x=1699274304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnuIYwmSwa+S4XlLT3QvUcDtJ9g3YgN2fZ+LLWa8C7o=;
        b=Ocmhw/xswUTQT8TSH9eKgpqH5GX9eM6oIADmcCf1EcZPojeSCAEkEp2D7PaK1SXYpO
         Qk+uTDuz2tzMua7gbngF6FXOUcjmhRw6LDCa0P/93UcVlQ+zd13I2l9Lpq0BKUBIGedE
         mb2KG85g+RQdFLYK3BaT+81rBRN1785jdWtqYsa2lDjLBekr21d1e5WizgnE9flUuQg1
         D4T6sa5LcNEqAzNqNMKeFAGXvIEvNG5Vno8/08gsY5rVZFASJ/WbpcIZ6+AwIHaZxNR8
         3ICYbx69mUUqMO8TxOstmM3olfWUXYX1h/KPTsw2Me1/+vbor10JfVAO51xm6kwi/PlP
         aV/g==
X-Gm-Message-State: AOJu0YwxFwyCi3BOarFRwSH+SmGlQ7O//NfLUkk+qzWXaxu8Gq2QkoD6
	JW3MpqLtDv0QOYcV5sNTCYSDTA==
X-Google-Smtp-Source: AGHT+IFzZsEpO/RvvLS1iMDezad+WvzdwmrIgbedQy9A5of3lpQHjn7moFPfQR8WitI3jcfQDCqOxQ==
X-Received: by 2002:a05:6214:2a87:b0:66d:138f:95df with SMTP id jr7-20020a0562142a8700b0066d138f95dfmr12128949qvb.56.1698669504669;
        Mon, 30 Oct 2023 05:38:24 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id es16-20020a056214193000b0065b0554ae78sm3321400qvb.100.2023.10.30.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 05:38:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qxRXD-006etA-C1;
	Mon, 30 Oct 2023 09:38:23 -0300
Date: Mon, 30 Oct 2023 09:38:23 -0300
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
Message-ID: <20231030123823.GD691768@ziepe.ca>
References: <b85e0715-3224-4f45-ad6b-ebb9f08c015d@moroto.mountain>
 <20231030115650.GC691768@ziepe.ca>
 <d42a8cb4-dd0d-407e-8659-915ca821e1f6@kadam.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d42a8cb4-dd0d-407e-8659-915ca821e1f6@kadam.mountain>

On Mon, Oct 30, 2023 at 03:00:56PM +0300, Dan Carpenter wrote:
> On Mon, Oct 30, 2023 at 08:56:50AM -0300, Jason Gunthorpe wrote:
> > On Mon, Oct 30, 2023 at 12:03:12PM +0300, Dan Carpenter wrote:
> > > The apple_dart_domain_alloc_paging() function is supposed to return NULL
> > > on error.  Returning an error pointer will lead to an Oops in
> > > __iommu_domain_alloc().
> > > 
> > > Fixes: 482feb5c6492 ("iommu/dart: Call apple_dart_finalize_domain() as part of alloc_paging()")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/iommu/apple-dart.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > Really need to fix this so the function does return ERR_PTR..
> 
> It's called as a function pointer.  Changing that will create a
> backporting hazard unless we rename the pointer or something.

You can make that argument about almost any change in the kernel..

IMHO we needed an annotation like __user/__iomem/etc to indicate
ERR_PTR so at least there is some hope of trivially finding it.

Jason
