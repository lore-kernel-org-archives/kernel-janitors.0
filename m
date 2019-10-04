From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 04 Oct 2019 15:44:46 +0000
Subject: Re: [PATCH] crypto: chtls - simplify a bit 'create_flowc_wr_skb()'
Message-Id: <20191004154445.GY5148@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190919200428.2664-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190919200428.2664-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: atul.gupta@chelsio.com, davem@davemloft.net, akpm@linux-foundation.org, willy@infradead.org, kirill.shutemov@linux.intel.com, kstewart@linuxfoundation.org, yuehaibing@huawei.com, tglx@linutronix.de, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 19, 2019 at 10:04:28PM +0200, Christophe JAILLET wrote:
> Use '__skb_put_data()' instead of rewritting it.
> This improves readability.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/chelsio/chtls/chtls_io.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
