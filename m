From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 17 Nov 2015 13:48:48 +0000
Subject: Re: [PATCH 3/4] crypto-ixp4xx: Reduce assignment for a variable in init_ixp_crypto()
Message-Id: <20151117134848.GA9452@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <5648D2C1.8050603@users.sourceforge.net>
 <5648D466.10307@users.sourceforge.net>
In-Reply-To: <5648D466.10307@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Nov 15, 2015 at 07:52:22PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 15 Nov 2015 19:06:44 +0100
> 
> The variable "ret" was set more often than necessary by the
> init_ixp_crypto() function.
> 
> * Omit its initialisation at the beginning.
> 
> * Use an error return code in two cases directly.
> 
> * Improve compliance with the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Again I don't see how this is making the code better so nack.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
