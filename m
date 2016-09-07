From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 07 Sep 2016 13:21:30 +0000
Subject: Re: [PATCH] crypto: ccp - add missing release in ccp_dmaengine_register
Message-Id: <20160907132130.GJ17176@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160902094853.21376-1-lambert.quentin@gmail.com>
In-Reply-To: <20160902094853.21376-1-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Gary Hook <gary.hook@amd.com>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Sep 02, 2016 at 11:48:53AM +0200, Quentin Lambert wrote:
> ccp_dmaengine_register used to return with an error code before
> releasing all resource. This patch adds a jump to the appropriate label
> ensuring that the resources are properly released before returning.
> 
> This issue was found with Hector.
> 
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
