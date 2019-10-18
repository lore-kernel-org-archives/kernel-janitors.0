From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 18 Oct 2019 08:02:16 +0000
Subject: Re: [PATCH][V2][next] crypto: inside-secure: fix spelling mistake "algorithmn" -> "algorithm"
Message-Id: <20191018080216.GA25128@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008082428.19839-1-colin.king@canonical.com>
In-Reply-To: <20191008082428.19839-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Antoine Tenart <antoine.tenart@bootlin.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 08, 2019 at 09:24:28AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err message. Fix it. Add in missing
> newline.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Add in newline \n
> 
> ---
>  drivers/crypto/inside-secure/safexcel_cipher.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
