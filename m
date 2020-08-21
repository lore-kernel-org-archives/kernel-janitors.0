From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 21 Aug 2020 07:56:02 +0000
Subject: Re: [PATCH] crypto: ingenic - Drop kfree for memory allocated with devm_kzalloc
Message-Id: <20200821075602.GF25143@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804081153.45342-1-weiyongjun1@huawei.com>
In-Reply-To: <20200804081153.45342-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: mpm@selenic.com, arnd@arndb.de, gregkh@linuxfoundation.org, zhouyanjie@wanyeetech.com, prasannatsmkumar@gmail.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Tue, Aug 04, 2020 at 08:11:53AM +0000, Wei Yongjun wrote:
> It's not necessary to free memory allocated with devm_kzalloc
> and using kfree leads to a double free.
> 
> Fixes: 190873a0ea45 ("crypto: ingenic - Add hardware RNG for Ingenic JZ4780 and X1000")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/char/hw_random/ingenic-rng.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
