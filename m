From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 08 Apr 2019 06:40:50 +0000
Subject: Re: [PATCH -next] crypto: ccp - Use kmemdup in ccp_copy_and_save_keypart()
Message-Id: <20190408064050.tbcp6pk3e5iddg7i@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330014316.174072-1-yuehaibing@huawei.com>
In-Reply-To: <20190330014316.174072-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Gary Hook <gary.hook@amd.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Mar 30, 2019 at 01:43:16AM +0000, YueHaibing wrote:
> Use kmemdup rather than duplicating its implementation
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/crypto/ccp/ccp-crypto-rsa.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
