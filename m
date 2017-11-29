From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 29 Nov 2017 06:37:12 +0000
Subject: Re: [PATCH] crypto: cavium: fix memory leak on info
Message-Id: <20171129063712.GH21575@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171115123719.12667-1-colin.king@canonical.com>
In-Reply-To: <20171115123719.12667-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: George Cherian <george.cherian@cavium.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 15, 2017 at 12:37:19PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The object info is being leaked on an error return path, fix this
> by setting ret to -ENOMEM and exiting via the request_cleanup path
> that will free info.
> 
> Detected by CoverityScan, CID#1408439 ("Resource Leak")
> 
> Fixes: c694b233295b ("crypto: cavium - Add the Virtual Function driver for CPT")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
