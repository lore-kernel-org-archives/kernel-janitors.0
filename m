From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 22 Dec 2015 13:22:26 +0000
Subject: Re: [PATCH] crypto: qat - fix CTX_ENABLES bits shift direction issue
Message-Id: <20151222132226.GA25829@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450233580-58266-1-git-send-email-pingchao.yang@intel.com>
In-Reply-To: <1450233580-58266-1-git-send-email-pingchao.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yang Pingchao <pingchao.yang@intel.com>
Cc: dan.carpenter@oracle.com, tadeusz.struk@intel.com, linux-crypto@vger.kernel.org, qat-linux@intel.com, kernel-janitors@vger.kernel.org

On Wed, Dec 16, 2015 at 10:39:40AM +0800, Yang Pingchao wrote:
> AE CTX bits should be 8-15 in CTX_ENABLES, so the mask
> value 0xff should be left shifted 0x8.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Yang Pingchao <pingchao.yang@intel.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
