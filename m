From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 27 Nov 2019 05:12:31 +0000
Subject: Re: [PATCH] crypto: hisilicon - fix a NULL vs IS_ERR() bug in sec_create_qp_ctx()
Message-Id: <20191127051231.a3i34iawq666rbwc@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126122120.vnf6mxmvf25ppyeo@kili.mountain>
In-Reply-To: <20191126122120.vnf6mxmvf25ppyeo@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Zaibo Xu <xuzaibo@huawei.com>, "David S. Miller" <davem@davemloft.net>, Longfang Liu <liulongfang@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 26, 2019 at 03:21:20PM +0300, Dan Carpenter wrote:
> The hisi_acc_create_sgl_pool() function returns error pointers, it never
> returns NULL pointers.
> 
> Fixes: 416d82204df4 ("crypto: hisilicon - add HiSilicon SEC V2 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/hisilicon/sec2/sec_crypto.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
