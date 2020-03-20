From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 20 Mar 2020 03:51:27 +0000
Subject: Re: [PATCH -next] crypto: chelsio - remove set but not used variable 'adap'
Message-Id: <20200320035127.GG27372@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200314104441.79953-1-yuehaibing@huawei.com>
In-Reply-To: <20200314104441.79953-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Mar 14, 2020 at 10:44:41AM +0000, YueHaibing wrote:
> drivers/crypto/chelsio/chcr_algo.c: In function 'chcr_device_init':
> drivers/crypto/chelsio/chcr_algo.c:1440:18: warning:
>  variable 'adap' set but not used [-Wunused-but-set-variable]
>  
> commit 567be3a5d227 ("crypto: chelsio - Use multiple txq/rxq per tfm
> to process the requests") involved this unused variable.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/chelsio/chcr_algo.c | 2 --
>  1 file changed, 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
