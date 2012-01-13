From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 13 Jan 2012 05:39:07 +0000
Subject: Re: [PATCH 3/4] drivers/crypto/ixp4xx_crypto.c: convert GFP_KERNEL to GFP_ATOMIC
Message-Id: <20120113053907.GF13918@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326102050-30265-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1326102050-30265-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 09, 2012 at 10:40:49AM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia.lawall@lip6.fr>
> 
> The function is called with locks held and thus should not use GFP_KERNEL.
> 
> The semantic patch that makes this report is available
> in scripts/coccinelle/locks/call_kern.cocci.
> 
> More information about semantic patching is available at
> http://coccinelle.lip6.fr/
> 
> Signed-off-by: Julia Lawall <julia.lawall@lip6.fr>

Also applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
