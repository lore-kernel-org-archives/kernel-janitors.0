From: Herbert Xu <herbert@gondor.hengli.com.au>
Date: Fri, 08 Apr 2011 12:39:39 +0000
Subject: Re: [PATCH 2/6] drivers/crypto/caam/caamalg.c: introduce missing
Message-Id: <20110408123939.GA19398@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301667827-20056-2-git-send-email-julia@diku.dk> <20110401144205.b050c598.kim.phillips@freescale.com>
In-Reply-To: <20110401144205.b050c598.kim.phillips@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kim Phillips <kim.phillips@freescale.com>
Cc: Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Steve Cornelius <sec@pobox.com>, Dan Carpenter <error27@gmail.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 01, 2011 at 02:42:05PM -0500, Kim Phillips wrote:
> On Fri, 1 Apr 2011 16:23:43 +0200
> Julia Lawall <julia@diku.dk> wrote:
> 
> > Error handling code following a kmalloc should free the allocated data.
> 
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> > ---
> 
> Acked-by: Kim Phillips <kim.phillips@freescale.com>

Patch applied.  Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
