From: Leonard Crestez <leonard.crestez@nxp.com>
Date: Mon, 11 May 2020 13:20:26 +0000
Subject: Re: [PATCH -next] interconnect: imx: Fix return value check in imx_icc_node_init_qos()
Message-Id: <VI1PR04MB694150C03CC158988F7124A4EEA10@VI1PR04MB6941.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509030214.14435-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Georgi Djakov <georgi.djakov@linaro.org>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexandre Bailon <abailon@baylibre.com>

On 2020-05-09 5:58 AM, Wei Yongjun wrote:
> In case of error, the function of_parse_phandle() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: f0d8048525d7 ("interconnect: Add imx core driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/interconnect/imx/imx.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/interconnect/imx/imx.c b/drivers/interconnect/imx/imx.c
> index 6884212511f0..ac420f86008e 100644
> --- a/drivers/interconnect/imx/imx.c
> +++ b/drivers/interconnect/imx/imx.c
> @@ -90,10 +90,10 @@ static int imx_icc_node_init_qos(struct icc_provider *provider,
>   			node->name, node->id);
>   	} else {
>   		dn = of_parse_phandle(dev->of_node, adj->phandle_name, 0);
> -		if (IS_ERR(dn)) {
> -			dev_warn(dev, "Failed to parse %s: %ld\n",
> -				 adj->phandle_name, PTR_ERR(dn));
> -			return PTR_ERR(dn);
> +		if (!dn) {
> +			dev_warn(dev, "Failed to parse %s\n",
> +				 adj->phandle_name);
> +			return -ENODEV;
>   		}
>   		/* Allow scaling to be disabled on a per-node basis */
>   		if (!dn || !of_device_is_available(dn)) {

Reviewed-by: Leonard Crestez <leonard.crestez@nxp.com>
