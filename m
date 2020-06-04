From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 04 Jun 2020 12:18:35 +0000
Subject: Re: [PATCH v2] crypto: cavium/nitrox - Fix 'nitrox_get_first_device()' when ndevlist is fully iterat
Message-Id: <20200604121835.GB24286@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530133537.582843-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530133537.582843-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, phemadri@marvell.com, jsrikanth@marvell.com, horia.geanta@nxp.com, gustavo@embeddedor.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 30, 2020 at 03:35:37PM +0200, Christophe JAILLET wrote:
> When a list is completely iterated with 'list_for_each_entry(x, ...)', x is
> not NULL at the end.
> 
> While at it, remove a useless initialization of the ndev variable. It
> is overridden by 'list_for_each_entry'.
> 
> Fixes: f2663872f073 ("crypto: cavium - Register the CNN55XX supported crypto algorithms.")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: Do not introduce an extra variable to check if the list has been fully
>     iterated. Test with "if (&ndev->list = &ndevlist)" instead
> ---
>  drivers/crypto/cavium/nitrox/nitrox_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
