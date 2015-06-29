From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 29 Jun 2015 08:18:04 +0000
Subject: Re: [PATCH] crypto-qat: Deletion of unnecessary checks before two function calls
Message-Id: <20150629081804.GB12005@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <558D9DC8.2000603@users.sourceforge.net>
In-Reply-To: <558D9DC8.2000603@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "David S. Miller" <davem@davemloft.net>, Tadeusz Struk <tadeusz.struk@intel.com>, qat-linux@intel.com, linux-crypto@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Fri, Jun 26, 2015 at 08:45:28PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 26 Jun 2015 20:30:11 +0200
> 
> The functions kfree() and release_firmware() test whether their argument
> is NULL and then return immediately.
> Thus the test around the calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
