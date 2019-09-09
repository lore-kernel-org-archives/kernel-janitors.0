From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 09 Sep 2019 07:54:05 +0000
Subject: Re: [PATCH] crypto: cavium/zip - Add missing single_release()
Message-Id: <20190909075405.GE21364@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904141809.170277-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904141809.170277-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Eric Biggers <ebiggers@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Glauber <jglauber@cavium.com>, Mahipal Challa <mahipalreddy2006@gmail.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 04, 2019 at 02:18:09PM +0000, Wei Yongjun wrote:
> When using single_open() for opening, single_release() should be
> used instead of seq_release(), otherwise there is a memory leak.
> 
> Fixes: 09ae5d37e093 ("crypto: zip - Add Compression/Decompression statistics")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/crypto/cavium/zip/zip_main.c | 3 +++
>  1 file changed, 3 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
