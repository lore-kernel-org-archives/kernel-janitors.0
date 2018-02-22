From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 22 Feb 2018 15:12:49 +0000
Subject: Re: [PATCH] crypto: nx-842: Delete an error message for a failed memory allocation in nx842_pseries_
Message-Id: <20180222151249.GH29815@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8261d041-ccd9-c0f8-4530-a4afb43ee7ab@users.sourceforge.net>
In-Reply-To: <8261d041-ccd9-c0f8-4530-a4afb43ee7ab@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Dan Streetman <ddstreet@ieee.org>, linux-crypto@vger.kernel.org

On Wed, Feb 14, 2018 at 05:17:08PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Feb 2018 17:05:13 +0100
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
