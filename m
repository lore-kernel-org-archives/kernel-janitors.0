From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2015 07:48:19 +0000
Subject: Re: [PATCH] crypto-jitterentropy: Delete unnecessary checks before the function call "kzfree"
Message-Id: <20150624074819.GR28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <5317A59D.4@users.sourceforge.net>
 <5589CD95.9080508@users.sourceforge.net>
 <3056833.hq1kqBmzGz@myon.chronox.de>
In-Reply-To: <3056833.hq1kqBmzGz@myon.chronox.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephan Mueller <smueller@chronox.de>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

The other NULL assignment isn't useful either.  Also If
"entropy_collector" is NULL then we would oops calling
kzfree(entropy_collector->mem);
       ^^^^^^^^^^^^^^^^^^^^^^
Dereference.

I don't understand the patch that you sent.  We shouldn't be introducing
jent_zalloc() or jent_zfree().  Why are you adding abstractions there?
Quite bad ones as well.

regards,
dan carpenter

