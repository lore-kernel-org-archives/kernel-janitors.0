From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 20 Jun 2014 18:42:43 +0000
Subject: Re: [patch] crypto: caam - remove duplicate FIFOST_CONT_MASK define
Message-Id: <20140620184243.GJ3169@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609151941.GN9600@mwanda>
 <20140612181812.cbc7c9b0adfe42d74ea2f636@freescale.com>
In-Reply-To: <20140612181812.cbc7c9b0adfe42d74ea2f636@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kim Phillips <kim.phillips@freescale.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alex Porosanu <alexandru.porosanu@freescale.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 12, 2014 at 06:18:12PM -0500, Kim Phillips wrote:
> On Mon, 9 Jun 2014 18:19:41 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > The FIFOST_CONT_MASK define is cut and pasted twice so we can delete the
> > second instance.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Kim Phillips <kim.phillips@freescale.com>

Patch applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
