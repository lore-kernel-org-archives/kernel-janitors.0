From: Joe Perches <joe@perches.com>
Date: Tue, 13 Feb 2018 20:40:31 +0000
Subject: Re: [PATCH 1/2] dma/ppc4xx: Delete an error message for a failed memory allocation in two functions
Message-Id: <1518554431.22190.56.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ce6646e3-dfb5-2496-2a3a-d41de4802de6@users.sourceforge.net>
In-Reply-To: <ce6646e3-dfb5-2496-2a3a-d41de4802de6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2018-02-13 at 21:25 +0100, SF Markus Elfring wrote:
> Omit an extra message for a memory allocation failure in these functions.
[]
> diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
[]
> @@ -4183,7 +4183,6 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
>  		INIT_LIST_HEAD(&ref->node);
>  		list_add_tail(&ref->node, &ppc440spe_adma_chan_list);
>  	} else {
> -		dev_err(&ofdev->dev, "failed to allocate channel reference!\n");
>  		ret = -ENOMEM;
>  		goto err_ref_alloc;
>  	}

Stop being mindless and think about the change
you are making.

Reverse the test and unindent the block above.
---
 drivers/dma/ppc4xx/adma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 4cf0d4d0cecf..1fc1a2f03aa4 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -4178,16 +4178,15 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 	}
 
 	ref = kmalloc(sizeof(*ref), GFP_KERNEL);
-	if (ref) {
-		ref->chan = &chan->common;
-		INIT_LIST_HEAD(&ref->node);
-		list_add_tail(&ref->node, &ppc440spe_adma_chan_list);
-	} else {
-		dev_err(&ofdev->dev, "failed to allocate channel reference!\n");
+	if (!ref) {
 		ret = -ENOMEM;
 		goto err_ref_alloc;
 	}
 
+	ref->chan = &chan->common;
+	INIT_LIST_HEAD(&ref->node);
+	list_add_tail(&ref->node, &ppc440spe_adma_chan_list);
+
 	ret = ppc440spe_adma_setup_irqs(adev, chan, &initcode);
 	if (ret)
 		goto err_irq;
