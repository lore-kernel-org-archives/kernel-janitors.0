From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 May 2016 11:44:43 +0000
Subject: Re: [patch] crypto: omap-sham - potential Oops on error in probe
Message-Id: <20160518114443.GG11011@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160518103905.GA10470@mwanda>
 <21712178-666f-e2e2-24f3-fb0c513acc83@ti.com>
In-Reply-To: <21712178-666f-e2e2-24f3-fb0c513acc83@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 18, 2016 at 01:42:36PM +0300, Peter Ujfalusi wrote:
> On 05/18/16 13:39, Dan Carpenter wrote:
> > This if statement is reversed so we end up either leaking or Oopsing on
> > error.
> 
> Oops, sorry for that.
> Probably the other omap-* crypto drivers have the same issue? Can you send a
> patch for them or should I do it?

I didn't see those static checker warnings so probably it means I can't
compile the drivers.  Could you do it?

regards,
dan carpenter

