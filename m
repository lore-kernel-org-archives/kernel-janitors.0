From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 13:48:36 +0000
Subject: Re: [patch] pcrypt: handle crypto_get_attr_type() errors
Message-Id: <20100322134836.GP21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100321092847.GJ5331@bicker> <20100322132342.GJ20508@secunet.com>
In-Reply-To: <20100322132342.GJ20508@secunet.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 22, 2010 at 02:23:42PM +0100, Steffen Klassert wrote:
> On Sun, Mar 21, 2010 at 12:28:47PM +0300, Dan Carpenter wrote:
> > crypto_get_attr_type() can returns ERR_PTRs if there is a problem. 
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > 
> > diff --git a/crypto/pcrypt.c b/crypto/pcrypt.c
> > index 8020124..41bd80f 100644
> > --- a/crypto/pcrypt.c
> > +++ b/crypto/pcrypt.c
> > @@ -322,6 +322,8 @@ static struct crypto_instance *pcrypt_alloc_aead(struct rtattr **tb)
> >  	struct crypto_attr_type *algt;
> >  
> >  	algt = crypto_get_attr_type(tb);
> > +	if (IS_ERR(algt))
> > +		return ERR_CAST(algt);
> >  
> >  	alg = crypto_get_attr_alg(tb, algt->type,
> >  				  (algt->mask & CRYPTO_ALG_TYPE_MASK));
> 
> I've just noticed that we are calling crypto_get_attr_type already in
> pcrypt_alloc, so perhaps we could just pass the type and mask to
> pcrypt_alloc_aead. Then we can remove this second call to
> crypto_get_attr_type completely.
> 

Yup.  That works too.  I will send an updated patch.

regards,
dan carpenter

> Steffen
