From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 27 Jul 2018 16:06:20 +0000
Subject: Re: [PATCH] lib/mpi: remove redundant variable esign
Message-Id: <20180727160620.qa6jj657gjvjpxq3@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180720174358.20588-1-colin.king@canonical.com>
In-Reply-To: <20180720174358.20588-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 20, 2018 at 06:43:58PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable esign is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'esign' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Please resend this via linux-crypto.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
