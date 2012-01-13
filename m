From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 13 Jan 2012 05:36:33 +0000
Subject: Re: [PATCH 5/6] drivers/char/hw_random/tx4939-rng.c: use devm_request_and_ioremap
Message-Id: <20120113053633.GD13918@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324994491-21828-1-git-send-email-julia@diku.dk> <1324994491-21828-6-git-send-email-julia@diku.dk>
In-Reply-To: <1324994491-21828-6-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Matt Mackall <mpm@selenic.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 27, 2011 at 03:01:30PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Reimplement a call to devm_request_mem_region followed by a call to ioremap
> or ioremap_nocache by a call to devm_request_and_ioremap.

Patch applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
