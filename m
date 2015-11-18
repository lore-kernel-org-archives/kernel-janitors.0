From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Nov 2015 07:28:26 +0000
Subject: Re: crypto-ixp4xx: Deletion of a few unnecessary checks
Message-Id: <564C289A.5010507@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <5648D2C1.8050603@users.sourceforge.net>
 <564B489F.10308@users.sourceforge.net>
 <20151118000358.GA13894@gondor.apana.org.au>
In-Reply-To: <20151118000358.GA13894@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>>   Delete unnecessary checks before the function call "dma_pool_destroy"

It seems that you accepted this specific update suggestion, didn't you?
https://lkml.org/lkml/2015/11/17/391
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1021951.html


>>   Reduce assignment for a variable in init_ixp_crypto()
>>   crypto-ixp4xx: Less function calls in init_ixp_crypto() after error detection
> 
> You completely ignored my comments.  Nack.

Will it be useful to clarify the proposed changes a bit more?

Regards,
Markus
