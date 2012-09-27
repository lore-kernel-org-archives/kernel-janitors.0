From: Ian Abbott <abbotti@mev.co.uk>
Date: Thu, 27 Sep 2012 09:46:48 +0000
Subject: Re: drivers/staging/comedi/drivers/ni_pcimio.c:1694 pcimio_attach_pci() warn: 'dev->irq' was not rel
Message-Id: <50642088.2090208@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927005432.GA7205@localhost>
In-Reply-To: <20120927005432.GA7205@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2012-09-27 01:54, Fengguang Wu wrote:
> Hi Bill, Ian,
>
> FYI, this smatch warning probably exists from day 0 of the driver
> code:
>
> + drivers/staging/comedi/drivers/ni_pcimio.c:1694 pcimio_attach_pci() warn: 'dev->irq' was not released on error
>
> vim +1694 drivers/staging/comedi/drivers/ni_pcimio.c
>    1678		dev->irq = mite_irq(devpriv->mite);
>    1679	
>    1680		if (dev->irq = 0) {
>    1681			pr_warn("unknown irq (bad)\n");
>    1682		} else {
>    1683			pr_debug("( irq = %u )\n", dev->irq);
>    1684			ret = request_irq(dev->irq, ni_E_interrupt, NI_E_IRQ_FLAGS,
>    1685					  DRV_NAME, dev);
>    1686			if (ret < 0) {
>    1687				pr_warn("irq not available\n");
>    1688				dev->irq = 0;
>    1689			}
>    1690		}
>    1691	
>    1692		ret = ni_E_init(dev);
>    1693		if (ret < 0)
>> 1694			return ret;
>    1695	
>    1696		dev->subdevices[NI_AI_SUBDEV].buf_change = &pcimio_ai_change;
>    1697		dev->subdevices[NI_AO_SUBDEV].buf_change = &pcimio_ao_change;
>    1698		dev->subdevices[NI_GPCT_SUBDEV(0)].buf_change = &pcimio_gpct0_change;
>    1699		dev->subdevices[NI_GPCT_SUBDEV(1)].buf_change = &pcimio_gpct1_change;
>    1700		dev->subdevices[NI_DIO_SUBDEV].buf_change = &pcimio_dio_change;
>    1701	
>    1702		return ret;

It should be fine.  `pcimio_attach_pci()` doesn't clean up after itself, 
but if it returns an error, `pcimio_detach()` will be called to clean up 
afterwards.  `pcimio_detach()` always executes the following statement:

	if (dev->irq)
		free_irq(dev->irq, dev);

where `dev` is the same `dev` that was passed to `pcimio_attach_pci()`.

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
