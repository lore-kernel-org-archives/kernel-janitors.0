From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 07 Aug 2018 09:53:12 +0000
Subject: Re: [PATCH][RESEND] lib/mpi: remove redundant variable esign
Message-Id: <20180807095311.g35txtn7hzbqt6yj@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180730085936.10050-1-colin.king@canonical.com>
In-Reply-To: <20180730085936.10050-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-crypto@vger.kernel.org, Eric Biggers <ebiggers@google.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 30, 2018 at 09:59:36AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable esign is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'esign' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
