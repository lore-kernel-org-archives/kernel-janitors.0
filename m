From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 27 Nov 2020 06:27:05 +0000
Subject: Re: [PATCH] crypto: marvell/octeontx - Use dma_set_mask_and_coherent to simplify code
Message-Id: <20201127062705.GH11448@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201121074916.1322898-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201121074916.1322898-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com, davem@davemloft.net, lbartosik@marvell.com, akpm@linux-foundation.org, hannes@cmpxchg.org, longman@redhat.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 21, 2020 at 08:49:16AM +0100, Christophe JAILLET wrote:
> 'pci_set_dma_mask()' + 'pci_set_consistent_dma_mask()' can be replaced by
> an equivalent 'dma_set_mask_and_coherent()' which is much less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/marvell/octeontx/otx_cptpf_main.c | 10 ++--------
>  drivers/crypto/marvell/octeontx/otx_cptvf_main.c | 10 ++--------
>  2 files changed, 4 insertions(+), 16 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
