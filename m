Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD75D280
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0A7EE;
	Mon, 30 Oct 2023 02:25:57 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qxOWl-00CSLu-P2; Mon, 30 Oct 2023 17:25:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 30 Oct 2023 17:25:50 +0800
Date: Mon, 30 Oct 2023 17:25:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mahmoud Adam <mngyadam@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] crypto: rsa - add a check for allocation failure
Message-ID: <ZT92nv/HG5LBTnND@gondor.apana.org.au>
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
>
> The checker is not wrong.  Kernel policy is that every allocation has
> to be checked for failure.  In *current* kernels it won't but we have
> discussed changing this so the policy makes sense.

Nevermind, I misread it as kmalloc(0).  mpi_alloc(0) can indeed
fail because it's not allocating nothing.

I'll take this patch.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
