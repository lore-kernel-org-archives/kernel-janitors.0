From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 25 Sep 2020 08:17:04 +0000
Subject: Re: [PATCH] crypto/chcr: fix minor indentation issue
Message-Id: <20200925081704.GR6381@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918215659.49825-1-colin.king@canonical.com>
In-Reply-To: <20200918215659.49825-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 18, 2020 at 10:56:59PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a statement that is indented by one whitespace too deeply,
> fix this by removing the whitespace.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/chelsio/chcr_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
