From: Jan Weitzel <J.Weitzel@phytec.de>
Date: Fri, 17 Feb 2012 08:00:51 +0000
Subject: Antwort: [patch] net/ethernet: ks8851_mll: signedness bug in ks8851_probe()
Message-Id: <OF305A41EA.D95E3D10-ONC12579A7.002BCB7F-C12579A7.002C05CA@phytec.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120217064433.GC3666@elgon.mountain>
In-Reply-To: <20120217064433.GC3666@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Danny Kukawka <danny.kukawka@bisect.de>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Thomas Meyer <thomas@m3y3r.de>

Dan Carpenter <dan.carpenter@oracle.com> schrieb am 17.02.2012 07:44:33:

> Von: Dan Carpenter <dan.carpenter@oracle.com>
> An: Jan Weitzel <j.weitzel@phytec.de>
> Kopie: Alexey Dobriyan <adobriyan@gmail.com>, "David S. Miller" 
> <davem@davemloft.net>, Paul Gortmaker 
> <paul.gortmaker@windriver.com>, Thomas Meyer <thomas@m3y3r.de>, 
> Danny Kukawka <danny.kukawka@bisect.de>, netdev@vger.kernel.org, 
> kernel-janitors@vger.kernel.org
> Datum: 17.02.2012 07:45
> Betreff: [patch] net/ethernet: ks8851_mll: signedness bug in 
ks8851_probe()
> 
> netdev->irq is unsigned, so it's never less than zero.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Tested-by: Jan Weitzel <j.weitzel@phytec.de>

> diff --git a/drivers/net/ethernet/micrel/ks8851_mll.c b/drivers/net/
> ethernet/micrel/ks8851_mll.c
> index 10d5798..b8104d9 100644
> --- a/drivers/net/ethernet/micrel/ks8851_mll.c
> +++ b/drivers/net/ethernet/micrel/ks8851_mll.c
> @@ -1544,7 +1544,7 @@ static int __devinit ks8851_probe(struct 
> platform_device *pdev)
> 
>     netdev->irq = platform_get_irq(pdev, 0);
> 
> -   if (netdev->irq < 0) {
> +   if ((int)netdev->irq < 0) {
>        err = netdev->irq;
>        goto err_get_irq;
>     }

