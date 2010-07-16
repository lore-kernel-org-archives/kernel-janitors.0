From: Herbert Xu <herbert@gondor.hengli.com.au>
Date: Fri, 16 Jul 2010 02:27:24 +0000
Subject: Re: [patch] crypto/ablkcipher: missing return statement
Message-Id: <20100716022724.GA28251@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100715075736.GC5164@bicker> <20100715.192141.242121343.davem@davemloft.net> <20100716022311.GA28155@gondor.apana.org.au>
In-Reply-To: <20100716022311.GA28155@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: error27@gmail.com, richih.mailinglist@gmail.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 16, 2010 at 10:23:11AM +0800, Herbert Xu wrote:
> On Thu, Jul 15, 2010 at 07:21:41PM -0700, David Miller wrote:
> > From: Dan Carpenter <error27@gmail.com>
> > Date: Thu, 15 Jul 2010 09:57:36 +0200
> > 
> > > The intent was to return here.  In the original an allocation failure
> > > would lead to a NULL dereference.
> > > 
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > 
> > Acked-by: David S. Miller <davem@davemloft.net>
> 
> Thanks, applied to crypto-2.6.

Oops I'd already applied the same patch but forgot to push to
Linus.  I've done the push now.

Sorry,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
