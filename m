From: David Miller <davem@davemloft.net>
Date: Thu, 05 Feb 2015 08:37:30 +0000
Subject: Re: [PATCH] net: ep93xx_eth: Delete unnecessary checks before the function call "kfree"
Message-Id: <20150205.003730.1411687823089677821.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<54D23415.6070005@users.sourceforge.net>
In-Reply-To: <54D23415.6070005@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: hsweeten@visionengravers.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Feb 2015 16:00:37 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 4 Feb 2015 15:56:58 +0100
> 
> The kfree() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
