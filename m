From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 27 Apr 2012 01:31:52 +0000
Subject: Re: [PATCH] drivers/crypto/amcc/crypto4xx_core.c: move up err_request_irq label
Message-Id: <20120427013152.GA32567@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1334436521-28622-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1334436521-28622-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 14, 2012 at 10:48:41PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Move the err_request_irq error label up to reflect that tasklet_init and
> irq_of_parse_and_map have taken place.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
