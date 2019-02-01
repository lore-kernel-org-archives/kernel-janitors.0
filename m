From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 01 Feb 2019 06:48:27 +0000
Subject: Re: [PATCH -next] crypto: seqiv - Use kmemdup in seqiv_aead_encrypt()
Message-Id: <20190201064827.kphyyt7kmfelgoby@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548057420-140382-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1548057420-140382-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jan 21, 2019 at 07:57:00AM +0000, YueHaibing wrote:
> Use kmemdup rather than duplicating its implementation
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
