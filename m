From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 20 Aug 2012 08:31:44 +0000
Subject: Re: [PATCH 3/6] drivers/char/hw_random/octeon-rng.c: drop frees of devm allocated data
Message-Id: <20120820083143.GC22951@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344099049-15212-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344099049-15212-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Matt Mackall <mpm@selenic.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Aug 04, 2012 at 06:50:46PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> devm_kfree and devm_iounmap should not have to be explicitly used.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,d;
> @@
> 
> x = devm_kzalloc(...)
> ...
> ?-devm_kfree(d,x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
