From: Sylvain Lemieux <slemieux.tyco@gmail.com>
Date: Thu, 09 May 2019 14:15:54 +0000
Subject: Re: [PATCH -next] usb: gadget: udc: lpc32xx: fix return value check in lpc32xx_udc_probe()
Message-Id: <CA+rxa6oh+Qxo5aLgW11vrAvuu7t7JAFONC6b0+kxRx9rwCmjhg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190504070407.56915-1-weiyongjun1@huawei.com>
 <5a3a89cf-eee3-136c-1c5a-58024e946a24@mleia.com>
In-Reply-To: <5a3a89cf-eee3-136c-1c5a-58024e946a24@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Felipe Balbi <balbi@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>

Thanks

Acked-by: Sylvain Lemieux <slemieux.tyco@gmail.com>

On Sat, May 4, 2019 at 8:17 AM Vladimir Zapolskiy <vz@mleia.com> wrote:
>
> Hi Wei Yongjun,
>
> On 05/04/2019 10:04 AM, Wei Yongjun wrote:
> > In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> > and never returns NULL. The NULL test in the return value check should
> > be replaced with IS_ERR().
> >
> > This issue was detected by using the Coccinelle software.
> >
> > Fixes: 408b56ca5c8e ("usb: gadget: udc: lpc32xx: simplify probe")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/usb/gadget/udc/lpc32xx_udc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
> > index d8f1c60793ed..00fb79c6d025 100644
> > --- a/drivers/usb/gadget/udc/lpc32xx_udc.c
> > +++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
> > @@ -3070,9 +3070,9 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
> >       }
> >
> >       udc->udp_baseaddr = devm_ioremap_resource(dev, res);
> > -     if (!udc->udp_baseaddr) {
> > +     if (IS_ERR(udc->udp_baseaddr)) {
> >               dev_err(udc->dev, "IO map failure\n");
> > -             return -ENOMEM;
> > +             return PTR_ERR(udc->udp_baseaddr);
> >       }
> >
> >       /* Get USB device clock */
>
> thank you for the change, it is a correct fix.
>
> I do suppose that dev_err() in the context can be evenly removed, but
> likely it should be another change.
>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
>
> --
> Best wishes,
> Vladimir
