From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 18 May 2017 05:25:26 +0000
Subject: Re: [PATCH] crypto: sha512-mb - add some missing unlock on error
Message-Id: <20170518052526.GB32485@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170425091854.6fryhkc2v4tf4dnl@mwanda>
In-Reply-To: <20170425091854.6fryhkc2v4tf4dnl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Megha Dey <megha.dey@linux.intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Greg Tucker <greg.b.tucker@intel.com>, Xiaodong Liu <xiaodong.liu@intel.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 25, 2017 at 12:18:54PM +0300, Dan Carpenter wrote:
> We recently added some new locking but missed the unlocks on these
> error paths in sha512_ctx_mgr_submit().
> 
> Fixes: c459bd7beda0 ("crypto: sha512-mb - Protect sha512 mb ctx mgr access")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
