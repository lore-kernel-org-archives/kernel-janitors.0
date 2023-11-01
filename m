Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32500627
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Nov 2023 00:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EYD23sd3"
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921E7EA
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 17:47:49 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6707401e22eso25388656d6.2
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 17:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1698799668; x=1699404468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KtTZeU1qyZPr5NnJG5tqBE/Hw8vzn/1VxFwr17IS4sA=;
        b=EYD23sd3v847ta7jMHm5JMo1RAdnvLiWwSAwwY0mdG4SAClFN6D6wm7BH8KC/trhkt
         YHkLQ4pxyAVqZbSup7fqvMPbUt1zigYnPAij9iqFp1Mi00j/18zBzTzMrTOO92J6rJuh
         6Sdb2wzs8AphI/TWQKSBFztuJ6Scu6FlqrEggT0uHL9//F9YET6T1em42h03yRr8tg8P
         GkuHlBT92NUy4NRoqYri8bMWVCZPgrnuoENcWEBzYeIXQPVqUG8+ZXBfUQIN6s6sQ2B6
         Ho9hj02NC/8DHInmNNUeFi546D9Gvs4DqANaU6uMOyTYt6W1lctDdGPMIxvml7rmNiQH
         LVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698799668; x=1699404468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtTZeU1qyZPr5NnJG5tqBE/Hw8vzn/1VxFwr17IS4sA=;
        b=AbytX062sqpwagAI3UsCGVnUUmwGdWuuLH8Hvid2CWCkwxD6DD3gXwPUg1J1mtzA/F
         KJp6pdReOPkHBJyKYX0SuKyh2OTgCN6JnIGitqevs7yW+l4ufrf4KQXMBlC58a9ByunQ
         MHClE8ccvpdNEzF2wkd24M54wEZfz5rbMliSJiEz1MCNbJnWOvMCES3aitXeO831Gg6j
         OapFa5ijS2GKmdv+oVoQYEPLzgDvvvl8Y03Mf4T/MwHQwB64TX33nASQsJLkwtk/8X1P
         vyvR2zkRH61hYpYRHvRUlTp//mA1YXv2wsobwXc4/jN7cGt8psPvuYPq+Qhzl64JIlOA
         EjzA==
X-Gm-Message-State: AOJu0YyZeT5ken+9tINg2wlsjTpt9Cb5Xo9vSLfWfonsIffK0yWrZmxY
	BzmLk8qzvNB9ZWC1+cZVq0xzGA==
X-Google-Smtp-Source: AGHT+IGBoZF6m4BoEcXMbgmscTRORzSW7sDdPYnhLQJDO7yeyyH3b7tmen41fCbsn0gHL99uZVHZtw==
X-Received: by 2002:ad4:574b:0:b0:66d:775:d1af with SMTP id q11-20020ad4574b000000b0066d0775d1afmr17062290qvx.59.1698799668692;
        Tue, 31 Oct 2023 17:47:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id i5-20020ad44ba5000000b0065b22afe53csm997511qvw.94.2023.10.31.17.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:47:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qxzOd-0080uo-GZ;
	Tue, 31 Oct 2023 21:47:47 -0300
Date: Tue, 31 Oct 2023 21:47:47 -0300
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
Message-ID: <20231101004747.GK691768@ziepe.ca>
References: <b85e0715-3224-4f45-ad6b-ebb9f08c015d@moroto.mountain>
 <20231030115650.GC691768@ziepe.ca>
 <d42a8cb4-dd0d-407e-8659-915ca821e1f6@kadam.mountain>
 <20231030123823.GD691768@ziepe.ca>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231030123823.GD691768@ziepe.ca>

On Mon, Oct 30, 2023 at 09:38:23AM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 30, 2023 at 03:00:56PM +0300, Dan Carpenter wrote:
> > On Mon, Oct 30, 2023 at 08:56:50AM -0300, Jason Gunthorpe wrote:
> > > On Mon, Oct 30, 2023 at 12:03:12PM +0300, Dan Carpenter wrote:
> > > > The apple_dart_domain_alloc_paging() function is supposed to return NULL
> > > > on error.  Returning an error pointer will lead to an Oops in
> > > > __iommu_domain_alloc().
> > > > 
> > > > Fixes: 482feb5c6492 ("iommu/dart: Call apple_dart_finalize_domain() as part of alloc_paging()")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > ---
> > > >  drivers/iommu/apple-dart.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > > 
> > > Really need to fix this so the function does return ERR_PTR..
> > 
> > It's called as a function pointer.  Changing that will create a
> > backporting hazard unless we rename the pointer or something.
> 
> You can make that argument about almost any change in the kernel..
> 
> IMHO we needed an annotation like __user/__iomem/etc to indicate
> ERR_PTR so at least there is some hope of trivially finding it.

I was thinking about this some more, I think I prefer we fix the core
code to accept the ERR_PTR and just start moving gently in that
direction. I was working on some other stuff and it is starting to get
really confusing that only this op is different.

I'll send a patch

Jason
