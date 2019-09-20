From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 20 Sep 2019 19:09:08 +0000
Subject: Re: [PATCH 1/2] net/phy/mdio-mscc-miim: Use devm_platform_ioremap_resource() in mscc_miim_probe()
Message-Id: <20190920190908.GH3530@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
 <506889a6-4148-89f9-302e-4be069595bb4@web.de>
In-Reply-To: <506889a6-4148-89f9-302e-4be069595bb4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 20, 2019 at 09:02:40PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Sep 2019 20:20:34 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
