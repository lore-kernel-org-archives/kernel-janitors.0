From: Andy Duan <fugang.duan@nxp.com>
Date: Thu, 04 Jun 2020 02:36:28 +0000
Subject: RE: [EXT] [PATCH net-next] net: ethernet: dwmac: Fix an error code in imx_dwmac_probe()
Message-Id: <AM6PR0402MB360703C2D2EAC8A58D7BEF2DFF890@AM6PR0402MB3607.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603175025.GA19353@mwanda>
In-Reply-To: <20200603175025.GA19353@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

From: Dan Carpenter <dan.carpenter@oracle.com> Sent: Thursday, June 4, 2020 1:50 AM
> The code is return PTR_ERR(NULL) which is zero or success.  We should
> return -ENOMEM instead.
> 
> Fixes: 94abdad6974a5 ("net: ethernet: dwmac: add ethernet glue logic for
> NXP imx8 chip")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks!

Acked-by: Fugang Duan <fugang.duan@nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index 5010af7dab4af..3c5df5eeed6c8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -225,7 +225,7 @@ static int imx_dwmac_probe(struct platform_device
> *pdev)
> 
>         dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac),
> GFP_KERNEL);
>         if (!dwmac)
> -               return PTR_ERR(dwmac);
> +               return -ENOMEM;
> 
>         plat_dat = stmmac_probe_config_dt(pdev, &stmmac_res.mac);
>         if (IS_ERR(plat_dat))
> --
> 2.26.2
