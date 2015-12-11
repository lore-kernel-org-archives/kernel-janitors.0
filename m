From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 11 Dec 2015 03:00:27 +0000
Subject: Re: [PATCH] crypto: constify drbg_state_ops structures
Message-Id: <20151211030027.GA10399@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449520617-1964-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1449520617-1964-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 07, 2015 at 09:36:57PM +0100, Julia Lawall wrote:
> The drbg_state_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
