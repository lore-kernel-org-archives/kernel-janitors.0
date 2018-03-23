From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 23 Mar 2018 15:58:12 +0000
Subject: Re: [PATCH -next] crypto: fix missing unlock on error in safexcel_ahash_send_req()
Message-Id: <20180323155812.GB2186@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1520952843-68436-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1520952843-68436-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 13, 2018 at 02:54:03PM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function
> safexcel_ahash_send_req() in the error handling case.
> 
> Fixes: cff9a17545a3 ("crypto: inside-secure - move cache result dma mapping to request")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
