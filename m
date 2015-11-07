From: David Miller <davem@davemloft.net>
Date: Sat, 07 Nov 2015 04:33:11 +0000
Subject: Re: [PATCH] DWC Ethernet QoS: Delete an unnecessary check before the function call "of_node_put"
Message-Id: <20151106.233311.2260896695923603885.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<563C5392.6030309@users.sourceforge.net>
In-Reply-To: <563C5392.6030309@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: lars.persson@axis.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 6 Nov 2015 08:15:30 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 6 Nov 2015 08:00:22 +0100
> 
> The of_node_put() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Please resubmit this with a more appropriate Subject line.

The subsystem prefix should be all lower-case and typically
indicate the most specific subsystem or area being changed.

In this case it's a driver, therefore simply use the driver
name "dwc_eth_qos: ".
