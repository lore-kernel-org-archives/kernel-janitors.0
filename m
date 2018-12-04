From: Aisheng DONG <aisheng.dong@nxp.com>
Date: Tue, 04 Dec 2018 12:35:06 +0000
Subject: RE: [PATCH net-next] can: flexcan: flexcan_chip_start(): fix the error return code in flexcan_setup_
Message-Id: <AM0PR04MB4211A1D868406816D7AB570A80AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543904780-30235-1-git-send-email-weiyongjun1@huawei.com>
 <AM0PR04MB42112B975149B031A0ECA71F80AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB42112B975149B031A0ECA71F80AF0@AM0PR04MB4211.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Joakim Zhang <qiangqing.zhang@nxp.com>, dl-linux-imx <linux-imx@nxp.com>

Copy Joakim.

> > From: Wei Yongjun [mailto:weiyongjun1@huawei.com]
[...]
> > Subject: [PATCH net-next] can: flexcan: flexcan_chip_start(): fix the
> > error return code in flexcan_setup_stop_mode()
> >
> > The error return code PTR_ERR(gpr_np) is always 0 since gpr_np is
> > equal to NULL in this error handling case. Fix it by return -ENOENT.
> >
> > Fixes: de3578c198c6 ("can: flexcan: add self wakeup support")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/net/can/flexcan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/can/flexcan.c b/drivers/net/can/flexcan.c
> > index
> > 0f36eaf..f412d84 100644
> > --- a/drivers/net/can/flexcan.c
> > +++ b/drivers/net/can/flexcan.c
> > @@ -1432,7 +1432,7 @@ static int flexcan_setup_stop_mode(struct
> > platform_device *pdev)
> >  	gpr_np = of_find_node_by_phandle(phandle);
> >  	if (!gpr_np) {
> >  		dev_dbg(&pdev->dev, "could not find gpr node by phandle\n");
> > -		return PTR_ERR(gpr_np);
> > +		return -ENOENT;
> 
> Good catch.
> 
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> 
> Regards
> Dong Aisheng
> 
> >  	}
> >
> >  	priv = netdev_priv(dev);
> >
> >
