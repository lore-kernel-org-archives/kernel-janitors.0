From: David Miller <davem@davemloft.net>
Date: Sat, 07 Nov 2015 18:19:38 +0000
Subject: Re: [PATCH] dwc_eth_qos: Delete an unnecessary check before the function call "of_node_put"
Message-Id: <20151107.131938.1320322327069111312.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <563C5392.6030309@users.sourceforge.net>
	<20151106.233311.2260896695923603885.davem@davemloft.net>
	<563E1A18.101@users.sourceforge.net>
In-Reply-To: <563E1A18.101@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: lars.persson@axis.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Nov 2015 16:34:48 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 7 Nov 2015 16:30:34 +0100
> 
> The of_node_put() function tests whether its argument is NULL
> and then returns immediately.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.
