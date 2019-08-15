From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 15 Aug 2019 05:00:50 +0000
Subject: Re: [PATCH] crypto: chtls - use 'skb_put_zero()' instead of re-implementing it
Message-Id: <20190815050050.GA24863@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190807154014.22548-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190807154014.22548-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: atul.gupta@chelsio.com, zhongjiang@huawei.com, ganeshgr@chelsio.com, davem@davemloft.net, tglx@linutronix.de, bigeasy@linutronix.de, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 07, 2019 at 05:40:14PM +0200, Christophe JAILLET wrote:
> 'skb_put()+memset()' is equivalent to 'skb_put_zero()'
> Use the latter because it is less verbose and it hides the internals of the
> sk_buff structure.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/chelsio/chtls/chtls_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/chelsio/chtls/chtls_main.c b/drivers/crypto/chelsio/chtls/chtls_main.c
> index 635bb4b447fb..830b238da77e 100644
> --- a/drivers/crypto/chelsio/chtls/chtls_main.c
> +++ b/drivers/crypto/chelsio/chtls/chtls_main.c
> @@ -218,9 +218,8 @@ static int chtls_get_skb(struct chtls_dev *cdev)
>  	if (!cdev->askb)
>  		return -ENOMEM;
>  
> -	skb_put(cdev->askb, sizeof(struct tcphdr));
> +	skb_put_zero(cdev->askb, sizeof(struct tcphdr));
>  	skb_reset_transport_header(cdev->askb);
> -	memset(cdev->askb->data, 0, cdev->askb->len);

These two are NOT equivalent.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
