From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 07 Dec 2016 12:07:29 +0000
Subject: Re: [patch] crypto: chcr - checking for IS_ERR() instead of NULL
Message-Id: <20161207120729.GA20680@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161201204937.GA10701@mwanda>
In-Reply-To: <20161201204937.GA10701@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Harsh Jain <harsh@chelsio.com>, Jitendra Lulla <JLULLA@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>, Hariprasad Shenai <hariprasad@chelsio.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 01, 2016 at 11:49:37PM +0300, Dan Carpenter wrote:
> The create_hash_wr() function never returns error pointers.  It returns
> NULL on error.
> 
> Fixes: 358961d1cd1e ("crypto: chcr - Added new structure chcr_wr")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
