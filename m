From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2018 11:03:08 +0000
Subject: Re: [PATCH] PCI: imx: Fix an IS_ERR() vs NULL bug
Message-Id: <20181218110308.GI19692@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218082329.GB440@kadam>
 <20181218105742.GA22156@e107981-ln.cambridge.arm.com>
In-Reply-To: <20181218105742.GA22156@e107981-ln.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Leonard Crestez <leonard.crestez@nxp.com>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>

On Tue, Dec 18, 2018 at 10:57:42AM +0000, Lorenzo Pieralisi wrote:
> On Tue, Dec 18, 2018 at 11:23:29AM +0300, Dan Carpenter wrote:
> > The device_link_add() function doesn't return error pointers, it returns
> > NULL if there is an error.
> > 
> > Fixes: 7a6991159bcd ("PCI: imx: Add multi-pd support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Thanks Dan, if you do not mind I will squash this in the initial
> commit given that it is not upstream yet.
> 

I don't mind at all.  Thanks.

regards,
dan carpenter
