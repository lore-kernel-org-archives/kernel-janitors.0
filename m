From: Eduardo Valentin <edubezval@gmail.com>
Date: Mon, 03 Jun 2019 02:09:03 +0000
Subject: Re: [PATCH] thermal: mmio: remove some dead code
Message-Id: <20190603020901.GA7918@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190515093420.GC3409@mwanda>
 <87257cd4-a7c8-3531-1033-84a6f79e6588@amazon.com>
In-Reply-To: <87257cd4-a7c8-3531-1033-84a6f79e6588@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Shenhar, Talel" <talel@amazon.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

hey Dan, Talel,

On Mon, May 20, 2019 at 05:26:51PM +0300, Shenhar, Talel wrote:
> 
> On 5/15/2019 12:34 PM, Dan Carpenter wrote:
> >The platform_get_resource() function doesn't return error pointers, it
> >returns NULL.  The way this is normally done, is that we pass the NULL
> >resource to devm_ioremap_resource() and then check for errors from that.
> >See the comment in front of devm_ioremap_resource() for more details.
> >
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Talel Shenhar <talel@amazon.com>

Cool. I will be collecting this. The only change I will do while
applying this is that the subject will look like this:
"thermal: thermal_mmio: remove some dead code"

Just to match the file / driver name.


> >---
> >  drivers/thermal/thermal_mmio.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> >diff --git a/drivers/thermal/thermal_mmio.c b/drivers/thermal/thermal_mmio.c
> >index de3cceea23bc..40524fa13533 100644
> >--- a/drivers/thermal/thermal_mmio.c
> >+++ b/drivers/thermal/thermal_mmio.c
> >@@ -53,13 +53,6 @@ static int thermal_mmio_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  	resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >-	if (IS_ERR(resource)) {
> >-		dev_err(&pdev->dev,
> >-			"fail to get platform memory resource (%ld)\n",
> >-			PTR_ERR(resource));
> >-		return PTR_ERR(resource);
> >-	}
> >-
> >  	sensor->mmio_base = devm_ioremap_resource(&pdev->dev, resource);
> >  	if (IS_ERR(sensor->mmio_base)) {
> >  		dev_err(&pdev->dev, "failed to ioremap memory (%ld)\n",
