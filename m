From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 21 Apr 2017 11:36:41 +0000
Subject: Re: [PATCH 2/2] n2rng: Combine substrings for two messages in n2rng_probe()
Message-Id: <20170421113641.GA14100@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4d9fbb01-e12f-eb5c-7ecd-5a2a10fd5110@users.sourceforge.net>
 <fef1883c-4338-5f8a-5dfe-e970b424fbc5@users.sourceforge.net>
In-Reply-To: <fef1883c-4338-5f8a-5dfe-e970b424fbc5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Matt Mackall <mpm@selenic.com>, Shannon Nelson <shannon.nelson@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 19, 2017 at 11:11:35AM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 19 Apr 2017 10:50:04 +0200
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> WARNING: quoted string split across lines
> 
> Thus fix the affected source code places.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This patch doesn't seem to add any value so I'm not taking it.

Please don't send patches based purely on a checkpatch complaint.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
