From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 31 Jan 2020 13:57:46 +0000
Subject: Re: [PATCH net] device property: change device_get_phy_mode() to prevent signedess bugs
Message-Id: <20200131135746.GF9639@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
In-Reply-To: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ajay Gupta <ajayg@nvidia.com>, "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Steve Glendinning <steve.glendinning@shawell.net>, Jassi Brar <jaswinder.singh@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

> diff --git a/drivers/net/ethernet/apm/xgene-v2/main.c b/drivers/net/ethernet/apm/xgene-v2/main.c
> index c48f60996761..706602918dd1 100644
> --- a/drivers/net/ethernet/apm/xgene-v2/main.c
> +++ b/drivers/net/ethernet/apm/xgene-v2/main.c
> @@ -15,7 +15,7 @@ static int xge_get_resources(struct xge_pdata *pdata)
>  {
>  	struct platform_device *pdev;
>  	struct net_device *ndev;
> -	int phy_mode, ret = 0;
> +	int ret = 0;
>  	struct resource *res;
>  	struct device *dev;

Hi Dan

DaveM likes reverse christmas tree. So you need to move ret later to
keep the tree.

Apart from that:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
