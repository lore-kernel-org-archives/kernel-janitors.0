From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 06 Nov 2020 07:02:39 +0000
Subject: Re: [PATCH resend] hwrng: imx-rngc - irq already prints an error
Message-Id: <20201106070239.GH11620@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201029005217.GA28008@fedora-project>
In-Reply-To: <20201029005217.GA28008@fedora-project>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nigel Christian <nigel.l.christian@gmail.com>
Cc: dan.carpenter@oracle.com, martin@kaiser.cx, mpm@selenic.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, linux-crypto@vger.kernel.org, prasannatsmkumar@gmail.com, m.felsch@pengutronix.de, kernel-janitors@vger.kernel.org

On Wed, Oct 28, 2020 at 08:52:17PM -0400, Nigel Christian wrote:
> Clean up the check for irq. dev_err() is superfluous as
> platform_get_irq() already prints an error. Check for zero
> would indicate a bug. Remove curly braces to conform to
> styling requirements.
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
>  drivers/char/hw_random/imx-rngc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
