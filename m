From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Mon, 25 Jan 2021 13:23:07 +0000
Subject: Re: [PATCH 2/2 net-next] net: mscc: ocelot: fix error code in mscc_ocelot_probe()
Message-Id: <20210125132306.czc7thwgd3o3lbnw@skbuf>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA59en4lJCiYsPHv@mwanda> <YA59n5DbO0BkK7rv@mwanda>
In-Reply-To: <YA59n5DbO0BkK7rv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Jan 25, 2021 at 11:13:19AM +0300, Dan Carpenter wrote:
> Probe should return an error code if platform_get_irq_byname() fails
> but it returns success instead.
> 
> Fixes: 6c30384eb1de ("net: mscc: ocelot: register devlink ports")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
