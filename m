From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 27 Nov 2020 06:27:00 +0000
Subject: Re: [PATCH] crypto: cavium/zip - Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201127062700.GG11448@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121073131.1321343-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201121073131.1321343-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, miaoqinglang@huawei.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 21, 2020 at 08:31:31AM +0100, Christophe JAILLET wrote:
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/cavium/zip/zip_main.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
