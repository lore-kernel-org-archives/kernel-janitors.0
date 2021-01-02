From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sat, 02 Jan 2021 22:08:56 +0000
Subject: Re: [PATCH] hwrng: ingenic - Fix a resource leak in an error handling path
Message-Id: <20210102220856.GQ12767@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201219075207.176279-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201219075207.176279-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mpm@selenic.com, zhouyanjie@wanyeetech.com, aric.pzqi@ingenic.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Dec 19, 2020 at 08:52:07AM +0100, Christophe JAILLET wrote:
> In case of error, we should call 'clk_disable_unprepare()' to undo a
> previous 'clk_prepare_enable()' call, as already done in the remove
> function.
> 
> Fixes: 406346d22278 ("hwrng: ingenic - Add hardware TRNG for Ingenic X1830")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/char/hw_random/ingenic-trng.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
