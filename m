From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 28 Sep 2020 01:42:40 +0000
Subject: Re: [PATCH 06/18] hwrng: iproc-rng200 - use semicolons rather than commas to separate statements
Message-Id: <793939ba-520a-8041-b3c7-20900a21f308@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <1601233948-11629-7-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-7-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Matt Mackall <mpm@selenic.com>
Cc: =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org



On 9/27/2020 12:12 PM, Julia Lawall wrote:
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

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
