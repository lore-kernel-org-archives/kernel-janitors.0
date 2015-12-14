From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 14 Dec 2015 13:33:18 +0000
Subject: Re: [patch -next] crypto: qat - uint8_t is not large enough for accel_id
Message-Id: <20151214133318.GC1829@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151210220044.GA21797@mwanda>
 <5669FB47.60308@intel.com>
In-Reply-To: <5669FB47.60308@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tadeusz Struk <tadeusz.struk@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Bruce Allan <bruce.w.allan@intel.com>, Pingchao Yang <pingchao.yang@intel.com>, qat-linux@intel.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 10, 2015 at 02:23:03PM -0800, Tadeusz Struk wrote:
>
> accel_id has to be large enough to hold ADF_MAX_DEVICES + 1
> (which is > 1025) so uint8_t is too small.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Tadeusz Struk <tadeusz.struk@intel.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
