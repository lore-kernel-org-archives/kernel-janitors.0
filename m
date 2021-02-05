From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 05 Feb 2021 03:38:24 +0000
Subject: Re: [PATCH] crypto: octeontx2 - fix signedness bug in cptvf_register_interrupts()
Message-Id: <20210205033824.GA14594@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBD5Z11GeYlJGuTh@mwanda>
In-Reply-To: <YBD5Z11GeYlJGuTh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Arnaud Ebalard <arno@natisbad.org>, Srujana Challa <schalla@marvell.com>, "David S. Miller" <davem@davemloft.net>, Suheil Chandran <schandran@marvell.com>, Lukasz Bartosik <lbartosik@marvell.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 27, 2021 at 08:25:59AM +0300, Dan Carpenter wrote:
> The "num_vec" has to be signed for the error handling to work.
> 
> Fixes: 19d8e8c7be15 ("crypto: octeontx2 - add virtual function driver support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
