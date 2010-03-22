From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Mon, 22 Mar 2010 14:53:57 +0000
Subject: Re: [patch v2] pcrypt: handle crypto_get_attr_type() errors
Message-Id: <20100322145357.GK20508@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100321092847.GJ5331@bicker>
 <20100322132342.GJ20508@secunet.com>
 <20100322135319.GQ21571@bicker>
In-Reply-To: <20100322135319.GQ21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.orgkern

On Mon, Mar 22, 2010 at 04:53:19PM +0300, Dan Carpenter wrote:
>  
> -static struct crypto_instance *pcrypt_alloc_aead(struct rtattr **tb)
> +static struct crypto_instance *pcrypt_alloc_aead(struct rtattr **tb,
> +						 struct crypto_attr_type *algt)
>  {
>  	struct crypto_instance *inst;
>  	struct crypto_alg *alg;
> -	struct crypto_attr_type *algt;
> -
> -	algt = crypto_get_attr_type(tb);
>  
>  	alg = crypto_get_attr_alg(tb, algt->type,
>  				  (algt->mask & CRYPTO_ALG_TYPE_MASK));
> @@ -365,7 +363,7 @@ static struct crypto_instance *pcrypt_alloc(struct rtattr **tb)
>  
>  	switch (algt->type & algt->mask & CRYPTO_ALG_TYPE_MASK) {
>  	case CRYPTO_ALG_TYPE_AEAD:
> -		return pcrypt_alloc_aead(tb);
> +		return pcrypt_alloc_aead(tb, algt);
>  	}
>  

I thought about passing the type and mask values separately to
pcrypt_alloc_aead, like type and mask values are passed to
crypto_get_attr_alg. This is the usual way to do this in the
crypto layer.

Thanks,

Steffen
