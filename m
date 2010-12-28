From: David Miller <davem@davemloft.net>
Date: Tue, 28 Dec 2010 21:55:15 +0000
Subject: Re: [patch] skfp: testing the wrong variable in skfp_driver_init()
Message-Id: <20101228.135515.48512926.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101224051734.GO1936@bicker>
	<20101224084538.GA2791@psychotron.redhat.com>
In-Reply-To: <20101224084538.GA2791@psychotron.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jpirko@redhat.com
Cc: error27@gmail.com, netdev@vger.kernel.org, eric.dumazet@gmail.com, hsweeten@visionengravers.com, kernel-janitors@vger.kernel.org

From: Jiri Pirko <jpirko@redhat.com>
Date: Fri, 24 Dec 2010 09:45:39 +0100

> Fri, Dec 24, 2010 at 06:17:34AM CET, error27@gmail.com wrote:
>>The intent here was to test if the allocation failed but we tested 
>>"SharedMemSize" instead of "SharedMemAddr" by mistake.
>>
>>Signed-off-by: Dan Carpenter <error27@gmail.com>
>>
>>diff --git a/drivers/net/skfp/skfddi.c b/drivers/net/skfp/skfddi.c
>>index 0a66fed..16c6265 100644
>>--- a/drivers/net/skfp/skfddi.c
>>+++ b/drivers/net/skfp/skfddi.c
>>@@ -412,7 +412,7 @@ static  int skfp_driver_init(struct net_device *dev)
>> 		bp->SharedMemAddr = pci_alloc_consistent(&bp->pdev,
>> 							 bp->SharedMemSize,
>> 							 &bp->SharedMemDMA);
>>-		if (!bp->SharedMemSize) {
>>+		if (!bp->SharedMemAddr) {
>> 			printk("could not allocate mem for ");
>> 			printk("hardware module: %ld byte\n",
>> 			       bp->SharedMemSize);
> 
> Looks obvious.
> 
> Reviewed-by: Jiri Pirko <jpirko@redhat.com>

Applied, thanks.
