From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2018 11:02:45 +0000
Subject: Re: [PATCH] PCI: imx: Fix an IS_ERR() vs NULL bug
Message-Id: <20181218110245.GH19692@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218082329.GB440@kadam>
 <9ba5927dd322732b73f1fa0852ec20fdf918ba7b.camel@nxp.com>
In-Reply-To: <9ba5927dd322732b73f1fa0852ec20fdf918ba7b.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, Richard Zhu <hongxing.zhu@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>

On Tue, Dec 18, 2018 at 08:54:36AM +0000, Leonard Crestez wrote:
> On Tue, 2018-12-18 at 11:23 +0300, Dan Carpenter wrote:
> > The device_link_add() function doesn't return error pointers, it returns
> > NULL if there is an error.
> > 
> > Fixes: 7a6991159bcd ("PCI: imx: Add multi-pd support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
> 
> I assume this was found with a static checker?

It's an unpublished Smatch check...  It complains about running IS_ERR()
on things which aren't an error pointer.  The problem is that that
happens all the time intentionally so i haven't published it.  I should
probably make a version which only complains if it is an assignment from
a function that returns NULL.

(Even then it's problematic because it can depend on the .config)

regards,
dan carpenter
