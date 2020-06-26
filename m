From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 26 Jun 2020 06:07:55 +0000
Subject: Re: [PATCH] crypto: ccp: remove redundant assignment to variable ret
Message-Id: <20200626060755.GB20811@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200618101229.11772-1-colin.king@canonical.com>
In-Reply-To: <20200618101229.11772-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 18, 2020 at 11:12:29AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned with a value that is never read
> and it is being updated later with a new value.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/ccp/ccp-ops.c | 1 -
>  1 file changed, 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
