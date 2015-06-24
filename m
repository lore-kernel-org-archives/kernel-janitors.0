From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2015 09:19:07 +0000
Subject: Re: [PATCH] crypto-jitterentropy: Delete unnecessary checks before the function call "kzfree"
Message-Id: <20150624091907.GS28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <3056833.hq1kqBmzGz@myon.chronox.de>
 <20150624074819.GR28762@mwanda>
 <20504077.rM6dY01J5R@tauon.atsec.com>
In-Reply-To: <20504077.rM6dY01J5R@tauon.atsec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Mueller <smueller@chronox.de>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Ah.  I should have read the whole thread.  I sort of assumed we were
just adding abstractions for the fun of it (because I have worked in
staging for too long).

regards,
dan carpenter

