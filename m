From: Jiri Pirko <jpirko@redhat.com>
Date: Fri, 24 Dec 2010 08:45:39 +0000
Subject: Re: [patch] skfp: testing the wrong variable in skfp_driver_init()
Message-Id: <20101224084538.GA2791@psychotron.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101224051734.GO1936@bicker>
In-Reply-To: <20101224051734.GO1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: netdev@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

Fri, Dec 24, 2010 at 06:17:34AM CET, error27@gmail.com wrote:
>The intent here was to test if the allocation failed but we tested 
>"SharedMemSize" instead of "SharedMemAddr" by mistake.
>
>Signed-off-by: Dan Carpenter <error27@gmail.com>
>
>diff --git a/drivers/net/skfp/skfddi.c b/drivers/net/skfp/skfddi.c
>index 0a66fed..16c6265 100644
>--- a/drivers/net/skfp/skfddi.c
>+++ b/drivers/net/skfp/skfddi.c
>@@ -412,7 +412,7 @@ static  int skfp_driver_init(struct net_device *dev)
> 		bp->SharedMemAddr = pci_alloc_consistent(&bp->pdev,
> 							 bp->SharedMemSize,
> 							 &bp->SharedMemDMA);
>-		if (!bp->SharedMemSize) {
>+		if (!bp->SharedMemAddr) {
> 			printk("could not allocate mem for ");
> 			printk("hardware module: %ld byte\n",
> 			       bp->SharedMemSize);

Looks obvious.

Reviewed-by: Jiri Pirko <jpirko@redhat.com>

