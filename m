From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 16 Jul 2020 11:56:39 +0000
Subject: Re: [PATCH 2/2] Crypto/chcr: Fix some pr_xxx messages
Message-Id: <20200716115639.GI31166@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200712211424.276263-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200712211424.276263-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ayush.sawal@chelsio.com, vinay.yadav@chelsio.com, rohitm@chelsio.com, davem@davemloft.net, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jul 12, 2020 at 11:14:24PM +0200, Christophe JAILLET wrote:
> At the top this file, we have:
>    #define pr_fmt(fmt) "chcr:" fmt
> 
> So there is no need to repeat "chcr : " in some error message when the
> pr_xxx macro is used.
> This would lead to log "chcr:chcr : blabla"
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/crypto/chelsio/chcr_algo.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
