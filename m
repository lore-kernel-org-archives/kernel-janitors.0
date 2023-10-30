Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EAC8BE0
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5sJ1tPT"
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63C0B6
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:20:33 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso33208235e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698657632; x=1699262432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XLvSJ4WILzCQbRai7VhjkCmCDbJmlR0hsNCXw7/mMsA=;
        b=l5sJ1tPTSJVi9/tNni9tbb5Ip0Sb4Ykr6Kuv8xjwKoBnSdYOZf6cm00DdhZlAylfxI
         j3/I5g6Kq8scKj03j+wfwZQMRZiEmBG9Ic6zw74irf4gJWQpIfY0cAj4L2CH3KIY227B
         q9LtX9JdYep3T13u5oKUOsvFD98R6GASF6qcCuD9t1Da98WC+2S9jxkRteBfIOC0Aulh
         OXkIaiM5zVd5BQ68DIBBr0OuHVSMryYqOHVPBGjlMKMtADGQzUcxAAA3TeaPzihEkzIM
         rVAdUgW23Ce0F50c5cZG0tS7nZLjYi2F8odNIQw9wM+Xz9tuXgQf1XC9AkQLWx5LeJqi
         tKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698657632; x=1699262432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLvSJ4WILzCQbRai7VhjkCmCDbJmlR0hsNCXw7/mMsA=;
        b=n/niTjHe5fAGG3vo1/fwpYUA9vmcTouq3KPCWo9RuO8DypSvoOfBRCigLMjAoDeMj0
         wFpF/RsId7ryuDIhlAOppJoYTOGc/szt4nLcG7W8u5fQxa5yoF3Azx9pw/gXKimj/tIM
         6wh6wz8QCA4qxVd6L6aHEPP3coPOX87IObUADGP1EF5Iin2nN84teuPJm2C4VLB2x+5w
         KLX3CMo/eDn4ddtj0EAPHbWorXhLG2qLYDg643GoDmqORQE1BrthS3yg6acVvpyx1+cP
         sx/Jn3pY7LD2EsQzhAVDm6Fh2Wl0kIROKZ95CEvrs6jVH9qau9Mlt+bJLo6RwWfXYCLq
         ahfw==
X-Gm-Message-State: AOJu0Yzh7dnL4wWNd0E02PJZkkE37NGwh4E9Wy2kjsk+SbNVfoVR18Iu
	u3qKi7ILPcVqzsr03pXCGyD8Cg==
X-Google-Smtp-Source: AGHT+IHGsT/YTW07JZa6BB2LlyG3+WAKOizPA0kax+aj3lRWAFPbwJUUPk0n3MXi8E1VhVfV1XAu2Q==
X-Received: by 2002:a5d:6dad:0:b0:32f:7d21:fd7b with SMTP id u13-20020a5d6dad000000b0032f7d21fd7bmr4342284wrs.39.1698657632132;
        Mon, 30 Oct 2023 02:20:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ba13-20020a0560001c0d00b0032db4825495sm7979207wrb.22.2023.10.30.02.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:20:31 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:20:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Mahmoud Adam <mngyadam@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: rsa - add a check for allocation failure
Message-ID: <6f0902b8-f323-4534-9ad5-90c4ff92b677@kadam.mountain>
References: <d870c278-3f0e-4386-a58d-c9e2c97a7c6c@moroto.mountain>
 <ZT9zRaTmFp6xl9x3@gondor.apana.org.au>
 <43d34a02-fc43-4ce8-b3ca-d996cf605ba2@kadam.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43d34a02-fc43-4ce8-b3ca-d996cf605ba2@kadam.mountain>

On Mon, Oct 30, 2023 at 12:15:19PM +0300, Dan Carpenter wrote:
> On Mon, Oct 30, 2023 at 05:11:33PM +0800, Herbert Xu wrote:
> > On Mon, Oct 30, 2023 at 12:02:59PM +0300, Dan Carpenter wrote:
> > > Static checkers insist that the mpi_alloc() allocation can fail so add
> > > a check to prevent a NULL dereference.  Small allocations like this
> > > can't actually fail in current kernels, but adding a check is very
> > > simple and makes the static checkers happy.
> > > 
> > > Fixes: 6637e11e4ad2 ("crypto: rsa - allow only odd e and restrict value in FIPS mode")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  crypto/rsa.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > Nack.  Please fix the static checker instead.
> 
> The checker is not wrong.  Kernel policy is that every allocation has
> to be checked for failure.  In *current* kernels it won't but we have
> discussed changing this so the policy makes sense.

One way to fix the code would be to take gfp parameter and let people
pass a GFP_NOFAIL.  Unless there is a GFP_NOFAIL then the policy is that
the allocation can fail.

Or you could take the brtfs v1 approach and follow every kmalloc() with
a:
	p = kmalloc();
	BUG_on(!p);

regards,
dan carpenter

