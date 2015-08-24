From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 24 Aug 2015 14:24:50 +0000
Subject: Re: [patch] crypto: qat - silence a static checker warning
Message-Id: <20150824142450.GD31146@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150821084745.GB25369@mwanda>
 <55D8955A.5010106@intel.com>
In-Reply-To: <55D8955A.5010106@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tadeusz Struk <tadeusz.struk@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, "Allan, Bruce W" <bruce.w.allan@intel.com>, Ahsan Atta <ahsan.atta@intel.com>, qat-linux@intel.com, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Aug 22, 2015 at 08:29:30AM -0700, Tadeusz Struk wrote:
>
> Add range check for ring number.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Tadeusz Struk <tadeusz.struk@intel.com>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
