From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sun, 09 Feb 2014 09:22:29 +0000
Subject: Re: [patch] hw_random: cleanup in hwrng_register()
Message-Id: <20140209092229.GG19429@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140130114943.GB12734@elgon.mountain>
 <87k3dgvgzg.fsf@rustcorp.com.au>
In-Reply-To: <87k3dgvgzg.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Matt Mackall <mpm@selenic.com>, Satoru Takeuchi <satoru.takeuchi@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 31, 2014 at 04:18:51PM +1030, Rusty Russell wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> > My static checker complains that:
> >
> > 	drivers/char/hw_random/core.c:341 hwrng_register()
> > 	warn: we tested 'old_rng' before and it was 'false'
> >
> > The problem is that sometimes we test "if (!old_rng)" and sometimes we
> > test "if (must_register_misc)".  The static checker knows they are
> > equivalent but a human being reading the code could easily be confused.
> >
> > I have simplified the code by removing the "must_register_misc" variable
> > and I have removed the redundant check on "if (!old_rng)".
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Yeah, clearer too.
> 
> Reviewed-by: Rusty Russell <rusty@rustcorp.com.au>

Patch applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
