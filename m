From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 24 Apr 2020 07:46:29 +0000
Subject: Re: [PATCH] crypto: chelsio: remove redundant assignment to variable error
Message-Id: <20200424074629.GB24682@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200415224947.1565311-1-colin.king@canonical.com>
In-Reply-To: <20200415224947.1565311-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 15, 2020 at 11:49:47PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable error is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/chelsio/chcr_algo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
