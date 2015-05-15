From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 May 2015 08:23:02 +0000
Subject: Re: mfd: Support 88pm80x in 80x driver
Message-Id: <20150515082302.GA14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150514103124.GA21248@mwanda>
In-Reply-To: <20150514103124.GA21248@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 15, 2015 at 09:06:55AM +0800, Qiao Zhou wrote:
> >>@@ -360,8 +366,14 @@ static inline int pm80x_dev_resume(struct device *dev)
> >>  	struct pm80x_chip *chip = dev_get_drvdata(pdev->dev.parent);
> >>  	int irq = platform_get_irq(pdev, 0);
> >>
> >>+	if ((irq < 0) || (irq >= 24)) {
> >>+		dev_err(dev, "pm80x: wrong irq 0x%x\n", irq);
> >>+
> >
> >Superfluous '\n'.
> Will refine it.

The \n is ok isn't it?

regards,
dan carpenter

