From: Herbert Xu <herbert@gondor.hengli.com.au>
Date: Mon, 14 Feb 2011 22:47:12 +0000
Subject: Re: [PATCH 2/5] drivers/char/hw_random/omap-rng.c: Convert
Message-Id: <20110214224712.GA25913@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1297599132-7226-1-git-send-email-julia@diku.dk> <1297599132-7226-3-git-send-email-julia@diku.dk> <1297723344.5929.28.camel@calx>
In-Reply-To: <1297723344.5929.28.camel@calx>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>
Cc: Julia Lawall <julia@diku.dk>, Deepak Saxena <dsaxena@plexity.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 14, 2011 at 04:42:24PM -0600, Matt Mackall wrote:
> On Sun, 2011-02-13 at 13:12 +0100, Julia Lawall wrote:
> > Request_region should be used with release_region, not release_resource.
> > 
> > The local variable mem, storing the result of request_mem_region, is
> > dropped and instead the pointer res is stored in the drvdata field of the
> > platform device.  This information is retrieved in omap_rng_remove to
> > release the region.  The drvdata field is not used elsewhere.
> > 
> > The semantic match that finds this problem is as follows:
> > (http://coccinelle.lip6.fr/)
> 
> Looks ok to me, Herbert?

Yes I will apply it today.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
