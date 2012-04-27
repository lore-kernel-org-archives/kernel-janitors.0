From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 27 Apr 2012 01:32:09 +0000
Subject: Re: [PATCH] drivers/char/hw_random/omap-rng.c: use devm_request_and_ioremap
Message-Id: <20120427013208.GB32567@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334855948-31146-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1334855948-31146-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Deepak Saxena <dsaxena@plexity.net>, kernel-janitors@vger.kernel.org, Matt Mackall <mpm@selenic.com>, linux-kernel@vger.kernel.org

On Thu, Apr 19, 2012 at 07:19:08PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Using devm_request_and_ioremap is more concise.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Also applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
