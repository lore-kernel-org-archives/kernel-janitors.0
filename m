From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 28 Feb 2019 06:39:10 +0000
Subject: Re: [PATCH 08/12] crypto: add missing of_node_put after of_device_is_available
Message-Id: <20190228063910.yntbq4s7mdinp2ao@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-1-git-send-email-Julia.Lawall@lip6.fr>
 <1550928043-14889-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 23, 2019 at 02:20:39PM +0100, Julia Lawall wrote:
> Add an of_node_put when a tested device node is not available.
> 
> The semantic patch that fixes this problem is as follows
> (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @@
> identifier f;
> local idexpression e;
> expression x;
> @@
> 
> e = f(...);
> ... when != of_node_put(e)
>     when != x = e
>     when != e = x
>     when any
> if (<+...of_device_is_available(e)...+>) {
>   ... when != of_node_put(e)
> (
>   return e;
> |
> + of_node_put(e);
>   return ...;
> )
> }
> // </smpl>
> 
> Fixes: 5343e674f32fb ("crypto4xx: integrate ppc4xx-rng into crypto4xx")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/crypto/amcc/crypto4xx_trng.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
