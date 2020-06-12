From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 12 Jun 2020 06:48:40 +0000
Subject: Re: [PATCH] crypto: marvell/octeontx - Fix a potential NULL dereference
Message-Id: <20200612064840.GE16987@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200605110339.GE978434@mwanda>
In-Reply-To: <20200605110339.GE978434@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, SrujanaChalla <schalla@marvell.com>, Arnaud Ebalard <arno@natisbad.org>, "David S. Miller" <davem@davemloft.net>, Lukasz Bartosik <lbartosik@marvell.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 05, 2020 at 02:03:39PM +0300, Dan Carpenter wrote:
> Smatch reports that:
> 
>     drivers/crypto/marvell/octeontx/otx_cptvf_algs.c:132 otx_cpt_aead_callback()
>     warn: variable dereferenced before check 'cpt_info' (see line 121)
> 
> This function is called from process_pending_queue() as:
> 
> drivers/crypto/marvell/octeontx/otx_cptvf_reqmgr.c
>    599                  /*
>    600                   * Call callback after current pending entry has been
>    601                   * processed, we don't do it if the callback pointer is
>    602                   * invalid.
>    603                   */
>    604                  if (callback)
>    605                          callback(res_code, areq, cpt_info);
> 
> It does appear to me that "cpt_info" can be NULL so this could lead to
> a NULL dereference.
> 
> Fixes: 10b4f09491bf ("crypto: marvell - add the Virtual Function driver for CPT")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/crypto/marvell/octeontx/otx_cptvf_algs.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
