From: David Miller <davem@davemloft.net>
Date: Tue, 29 Oct 2019 23:18:22 +0000
Subject: Re: [PATCH -next] net: dsa: LAN9303: select REGMAP when LAN9303 enable
Message-Id: <20191029.161822.1063139909523659432.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191026022139.179166-1-maowenan@huawei.com>
In-Reply-To: <20191026022139.179166-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, jbe@pengutronix.de, robh@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Sat, 26 Oct 2019 10:21:39 +0800

> When NET_DSA_SMSC_LAN9303=y and NET_DSA_SMSC_LAN9303_MDIO=y,
> below errors can be seen:
> drivers/net/dsa/lan9303_mdio.c:87:23: error: REGMAP_ENDIAN_LITTLE
> undeclared here (not in a function)
>   .reg_format_endian = REGMAP_ENDIAN_LITTLE,
> drivers/net/dsa/lan9303_mdio.c:93:3: error: const struct regmap_config
> has no member named reg_read
>   .reg_read = lan9303_mdio_read,
> 
> It should select REGMAP in config NET_DSA_SMSC_LAN9303.
> 
> Fixes: dc7005831523 ("net: dsa: LAN9303: add MDIO managed mode support")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied.
