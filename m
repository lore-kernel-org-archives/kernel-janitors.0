From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 22 Feb 2018 15:13:41 +0000
Subject: Re: [PATCH] crypto: bfin_crc: Delete an error message for a failed memory allocation in bfin_crypto_
Message-Id: <20180222151340.GK29815@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601995f-79fd-8365-5dd3-4438a3515c28@users.sourceforge.net>
In-Reply-To: <1601995f-79fd-8365-5dd3-4438a3515c28@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 14, 2018 at 09:42:26PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Feb 2018 21:34:54 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
