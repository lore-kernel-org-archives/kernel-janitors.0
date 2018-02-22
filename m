From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 22 Feb 2018 13:42:31 +0000
Subject: Re: [PATCH 2/2] crypto: bcm: One function call less in do_shash() after error detection
Message-Id: <20180222134231.GC28447@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <68946b12-83d6-ab74-fd54-71b23cf9b7ef@users.sourceforge.net>
 <55bdcf76-f1c9-180d-6798-959e617b10ac@users.sourceforge.net>
In-Reply-To: <55bdcf76-f1c9-180d-6798-959e617b10ac@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-crypto@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>, Rob Rice <rob.rice@broadcom.com>, Steve Lin <steven.lin1@broadcom.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 14, 2018 at 10:40:26PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Feb 2018 22:22:20 +0100
> 
> The kfree() function was called in one case by the do_shash() function
> during error handling even if the passed variable contained a null pointer.
> 
> * Reorder two function calls at the end.
> 
> * Add a jump target.

This patch is pointless as kfree on NULL is a no-op.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
