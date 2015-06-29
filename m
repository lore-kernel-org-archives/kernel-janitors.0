From: David Miller <davem@davemloft.net>
Date: Mon, 29 Jun 2015 16:28:23 +0000
Subject: Re: [PATCH] net-Liquidio: Delete unnecessary checks before the function call "vfree"
Message-Id: <20150629.092823.165902372857729782.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <55912270.4030201@users.sourceforge.net>
In-Reply-To: <55912270.4030201@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Jun 2015 12:48:16 +0200

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 29 Jun 2015 12:22:24 +0200
> 
> The vfree() function performs also input parameter validation.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
