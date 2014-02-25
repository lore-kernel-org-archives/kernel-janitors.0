From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 25 Feb 2014 12:18:58 +0000
Subject: Re: [patch] crypto: caam - writel() arguments are swapped
Message-Id: <20140225121857.GI12216@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140221085131.GB13078@elgon.mountain>
 <20140224184142.b8d3a2cfb35dfe5f31d332ee@freescale.com>
In-Reply-To: <20140224184142.b8d3a2cfb35dfe5f31d332ee@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kim Phillips <kim.phillips@freescale.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alex Porosanu <alexandru.porosanu@freescale.com>, Ruchika Gupta <ruchika.gupta@freescale.com>, Vakul Garg <vakul@freescale.com>, linux-crypto@vger.kernel.org, Steve Cornelius <sec@pobox.com>, kernel-janitors@vger.kernel.org

On Mon, Feb 24, 2014 at 06:41:42PM -0600, Kim Phillips wrote:
> On Fri, 21 Feb 2014 11:51:31 +0300
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > My guess is that this little endian configuration is never found in real
> > life, 
> 
> it is, but the code has not been upstreamed.  Steve?
> 
> > but if it were then the writel() arguments are in the wrong order
> > so the driver would crash immediately.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> 
> Meanwhile:
> 
> Acked-by: Kim Phillips <kim.phillips@freescale.com>

Patch applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
