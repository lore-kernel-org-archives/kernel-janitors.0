From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 02 Oct 2020 11:55:51 +0000
Subject: Re: [PATCH 06/18] hwrng: iproc-rng200 - use semicolons rather than commas to separate statements
Message-Id: <20201002115551.GK1205@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <1601233948-11629-7-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-7-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Scott Branden <sbranden@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org, Matt Mackall <mpm@selenic.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org

On Sun, Sep 27, 2020 at 09:12:16PM +0200, Julia Lawall wrote:
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/char/hw_random/iproc-rng200.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
