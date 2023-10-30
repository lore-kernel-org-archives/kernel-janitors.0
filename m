Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EC9D50F
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8kvBOdk"
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58968AB
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:15:24 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40853c639abso33268245e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698657323; x=1699262123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTNUjRX3ECq7ehIr2zP5G3ay0ebpeMQRBEnNy7LpYnE=;
        b=R8kvBOdk/MfBmNP/ljYZOMDZKjVhydlqzZaWsz0ehUtyqhBmhhnINmTNRvORkWw42n
         gEQhb19DYL1Sn/L0WvUEBB3BFjV7vlUJbA8INyR1+xiLrU7zuZV4yoO1SI3DcXtBYrbv
         XPqkHAz5IMoFAQ6mLR/PN1ZT1otchLgU20811PF1zpgjd6Ut8g6gd8Hh1YDO6LeSI4oG
         AnbgpZVAW32/rPn7b8+DedB98JgrfKs14/KIS6DBP6iTNvMxG0G41gsSAZSGarZUF1fp
         tLSdXS8OLFC4uTP7Z0HdZ2AZtJMWwe/1guwBos+hybv7+VfxCi9KV63T6POHLRVx7tOd
         VSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698657323; x=1699262123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTNUjRX3ECq7ehIr2zP5G3ay0ebpeMQRBEnNy7LpYnE=;
        b=aVVpRLbunCl7pKgB0yvS+lyQD6mB64YIjqn7JRPCtnaqLiKJAB2B2YSkBNJXFLvNyg
         j2RMaYM3siNlPChFB3qWg8dDT+BzDVXwHtrXGoEG923Nex5eXJIKIN4nZ2WIDibwRPCH
         /7hpr5jSH+BTVqzjy+daNDU7DIdxoRtBTPc/EHQZfZ9mUREdQYOpXNFRZiqyAhJ2UntJ
         2L2M8TXMITx01M1Ta3tdNPgP/EloRcCJK1iNMqDJKGj7gHtTCBQtj6I/xGlhv3Ps+glS
         CKvQGBul8ld5uo8nVmvWQSz8kUO5G6AcFYGGjJQsTeGkCqZ9ZkGFKDQPdy6rydvoQXVF
         UByg==
X-Gm-Message-State: AOJu0YxNtAXD/7amg14MkAa27YgkStVySYpGQz4nlNCJGVo2kbW6cN7o
	QGcNF+TsfqFovgApxH4vSeezZg==
X-Google-Smtp-Source: AGHT+IFWqfiqIA5CXsh+JANuT5+BV8FcjUfQ6nP3L+Rkd93JFQGo+1+6aEMAKj4wrjDNjY2PchllmQ==
X-Received: by 2002:a05:600c:4750:b0:408:3d91:8251 with SMTP id w16-20020a05600c475000b004083d918251mr7344980wmo.5.1698657322727;
        Mon, 30 Oct 2023 02:15:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c1c0700b003fefb94ccc9sm8681319wms.11.2023.10.30.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:15:22 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:15:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Mahmoud Adam <mngyadam@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: rsa - add a check for allocation failure
Message-ID: <43d34a02-fc43-4ce8-b3ca-d996cf605ba2@kadam.mountain>
References: <d870c278-3f0e-4386-a58d-c9e2c97a7c6c@moroto.mountain>
 <ZT9zRaTmFp6xl9x3@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZT9zRaTmFp6xl9x3@gondor.apana.org.au>

On Mon, Oct 30, 2023 at 05:11:33PM +0800, Herbert Xu wrote:
> On Mon, Oct 30, 2023 at 12:02:59PM +0300, Dan Carpenter wrote:
> > Static checkers insist that the mpi_alloc() allocation can fail so add
> > a check to prevent a NULL dereference.  Small allocations like this
> > can't actually fail in current kernels, but adding a check is very
> > simple and makes the static checkers happy.
> > 
> > Fixes: 6637e11e4ad2 ("crypto: rsa - allow only odd e and restrict value in FIPS mode")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  crypto/rsa.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Nack.  Please fix the static checker instead.

The checker is not wrong.  Kernel policy is that every allocation has
to be checked for failure.  In *current* kernels it won't but we have
discussed changing this so the policy makes sense.

I have tested this some years back and I don't think it's so infeasible
as people think to allow these allocations to fail.

regards,
dan carpenter

