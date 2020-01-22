From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 22 Jan 2020 10:14:17 +0000
Subject: Re: [PATCH][next][V2] tee: fix memory allocation failure checks on drv_data and amdtee
Message-Id: <20200122101417.fi22dzeehugxgsnk@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200116154852.84532-1-colin.king@canonical.com>
In-Reply-To: <20200116154852.84532-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Devaraj Rangasamy <Devaraj.Rangasamy@amd.com>, Gary R Hook <gary.hook@amd.com>, Rijo Thomas <Rijo-john.Thomas@amd.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 16, 2020 at 03:48:52PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the memory allocation failure checks on drv_data and
> amdtee are using IS_ERR rather than checking for a null pointer.
> Fix these checks to use the conventional null pointer check.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> V2: update to apply against cryptodev-2.6 tree tip
> ---
>  drivers/tee/amdtee/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
