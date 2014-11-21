From: David Miller <davem@davemloft.net>
Date: Fri, 21 Nov 2014 20:16:34 +0000
Subject: Re: [PATCH 1/1] net: USB: Deletion of unnecessary checks before the function call "kfree"
Message-Id: <20141121.151634.1089029823236332120.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<546E05C0.9030703@users.sourceforge.net>
In-Reply-To: <546E05C0.9030703@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: j.dumon@option.com, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Nov 2014 16:16:16 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Nov 2014 16:11:56 +0100
> 
> The kfree() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
