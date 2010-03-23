From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Tue, 23 Mar 2010 10:34:31 +0000
Subject: Re: [patch v3] pcrypt: handle crypto_get_attr_type() errors
Message-Id: <20100323103431.GA27822@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100321092847.GJ5331@bicker>
 <20100322132342.GJ20508@secunet.com>
 <20100322135319.GQ21571@bicker>
 <20100322145357.GK20508@secunet.com>
 <20100322152845.GT21571@bicker>
In-Reply-To: <20100322152845.GT21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.orgkern

On Mon, Mar 22, 2010 at 06:28:45PM +0300, Dan Carpenter wrote:
> I was concerned about the error handling for crypto_get_attr_type() in
> pcrypt_alloc_aead().  Steffen Klassert pointed out that we could simply
> avoid calling crypto_get_attr_type() if we passed the type and mask as a
> parameters.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Steffen Klassert <steffen.klassert@secunet.com>

Thanks a lot!

> ---
> All three versions have basically been the same except for style issues.
> I will confess that this (hopefully final :P) version looks much nicer 
> than the earlier ones.
> 

It's not only style issues. We also got some additional benefit from
this version. We got rid of a superfluous call to crypto_get_attr_type
and we are able to change type and mask before we pass it to
pcrypt_alloc_aead if this becomes necessary.

Steffen
