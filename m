From: Herbert Xu <herbert@gondor.hengli.com.au>
Date: Wed, 23 Mar 2011 13:22:19 +0000
Subject: Re: [patch] crypto: caam - ARRAY_SIZE() vs sizeof()
Message-Id: <20110323132219.GC4374@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110315065955.GP2008@bicker> <20110315172037.f212db80.kim.phillips@freescale.com>
In-Reply-To: <20110315172037.f212db80.kim.phillips@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kim Phillips <kim.phillips@freescale.com>
Cc: Dan Carpenter <error27@gmail.com>, "David S. Miller" <davem@davemloft.net>, Steve Cornelius <sec@pobox.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 15, 2011 at 05:20:37PM -0500, Kim Phillips wrote:
> On Tue, 15 Mar 2011 09:59:55 +0300
> Dan Carpenter <error27@gmail.com> wrote:
> 
> > ARRAY_SIZE() was intended here instead of sizeof().  sizeof() is four
> > times larger than ARRAY_SIZE().  outstr is normally 256 chars so 
> > printing garbage to it could overfill the buffer and corrupt memory.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Acked-by: Kim Phillips <kim.phillips@freescale.com>

Also applied.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
