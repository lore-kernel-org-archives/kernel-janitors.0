From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 03 Aug 2017 06:22:40 +0000
Subject: Re: [PATCH] Crypto: atmel-ecc: Make a couple of local functions static
Message-Id: <20170803062239.GE12039@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719092415.9553-1-colin.king@canonical.com>
In-Reply-To: <20170719092415.9553-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 19, 2017 at 10:24:15AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Functions atmel_ecc_i2c_client_alloc and atmel_ecc_i2c_client_free are
> local to the source and no not need to be in the global scope. Make
> them static.
> 
> Cleans up sparse warnings:
> symbol 'atmel_ecc_i2c_client_alloc' was not declared. Should it be static?
> symbol 'atmel_ecc_i2c_client_free' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
