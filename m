From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 22 Dec 2015 13:23:05 +0000
Subject: Re: [PATCH] crypto: qat - fix some timeout tests
Message-Id: <20151222132305.GB25829@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450246190-60770-1-git-send-email-pingchao.yang@intel.com>
In-Reply-To: <1450246190-60770-1-git-send-email-pingchao.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yang Pingchao <pingchao.yang@intel.com>
Cc: dan.carpenter@oracle.com, tadeusz.struk@intel.com, linux-crypto@vger.kernel.org, qat-linux@intel.com, kernel-janitors@vger.kernel.org

On Wed, Dec 16, 2015 at 02:09:50PM +0800, Yang Pingchao wrote:
> Change the timeout condition since the times value would be -1 after
> running MAX_RETRY_TIMES.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yang Pingchao <pingchao.yang@intel.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
