From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 15 Feb 2018 15:52:25 +0000
Subject: Re: [PATCH] crypto: chelsio - Make function aead_ccm_validate_input static
Message-Id: <20180215155225.GN7352@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206230920.13764-1-colin.king@canonical.com>
In-Reply-To: <20180206230920.13764-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Harsh Jain <harsh@chelsio.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 06, 2018 at 11:09:20PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Function aead_ccm_validate_input is local to the source and does not
> need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/crypto/chelsio/chcr_algo.c:2627:5: warning: symbol
> 'aead_ccm_validate_input' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
