From: David Miller <davem@davemloft.net>
Date: Sat, 06 Dec 2014 05:15:06 +0000
Subject: Re: [PATCH 1/1] net-PA Semi: Deletion of unnecessary checks before the function call "pci_dev_put"
Message-Id: <20141205.211506.1876864218962612094.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<547A09B1.9090102@users.sourceforge.net>
In-Reply-To: <547A09B1.9090102@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: olof@lixom.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 29 Nov 2014 19:00:17 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 29 Nov 2014 18:55:40 +0100
> 
> The pci_dev_put() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call
> is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
