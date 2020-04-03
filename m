From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 03 Apr 2020 04:41:56 +0000
Subject: Re: [PATCH][next] crypto: marvell: fix double free of ptr
Message-Id: <20200403044156.GB26315@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200401231012.407946-1-colin.king@canonical.com>
In-Reply-To: <20200401231012.407946-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Arnaud Ebalard <arno@natisbad.org>, Srujana Challa <schalla@marvell.com>, "David S . Miller" <davem@davemloft.net>, Lukasz Bartosik <lbartosik@marvell.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 02, 2020 at 12:10:12AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently in the case where eq->src != req->ds, the allocation of
> ptr is kfree'd at the end of the code block. However later on in
> the case where enc is not null any of the error return paths that
> return via the error handling return path end up performing an
> erroneous second kfree of ptr.
> 
> Fix this by adding an error exit label error_free and only jump to
> this when ptr needs kfree'ing thus avoiding the double free issue.
> 
> Addresses-Coverity: ("Double free")
> Fixes: 10b4f09491bf ("crypto: marvell - add the Virtual Function driver for CPT")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/crypto/marvell/octeontx/otx_cptvf_algs.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
