From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Nov 2014 10:10:03 +0000
Subject: Re: net: xfrm: Deletion of an unnecessary check before the function call "ipcomp_free_tfms"
Message-Id: <20141119101003.GL4905@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <546BAFF5.5020603@users.sourceforge.net>
 <20141119084542.GK4905@mwanda>
 <546C6823.50900@users.sourceforge.net>
In-Reply-To: <546C6823.50900@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Steffen Klassert <steffen.klassert@secunet.com>, netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

I have come to view you as a very clever troll.  You will say
infuriating things like "That is an interesting background information
but the function implementation update suggestion is correct" and
pretend to not see the bug for nine emails.  Then you'll say something
"Ha ha, I audited all the call trees and it can't actually be NULL so
you were getting angry for no reason."  Except you'll say it in a
more obfuscated way than that.  This is what you did last time.

regards,
dan carpenter

