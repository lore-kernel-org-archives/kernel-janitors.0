From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 20 Sep 2019 15:08:17 +0000
Subject: Re: [PATCH 1/2] net: dsa: vsc73xx: Use devm_platform_ioremap_resource() in vsc73xx_platform_probe()
Message-Id: <20190920150817.GE3530@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
 <dbc78014-6ed4-5080-8208-0a5930a3bf6e@web.de>
In-Reply-To: <dbc78014-6ed4-5080-8208-0a5930a3bf6e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Dembicki <paweldembicki@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 20, 2019 at 04:28:00PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Sep 2019 15:23:39 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
