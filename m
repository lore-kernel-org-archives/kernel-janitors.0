From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 20 Sep 2019 15:08:29 +0000
Subject: Re: [PATCH 2/2] net: dsa: vsc73xx: Return an error code as a constant in vsc73xx_platform_probe()
Message-Id: <20190920150829.GF3530@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
 <738c12c8-f51e-d2e5-f31e-7f726cf6325d@web.de>
In-Reply-To: <738c12c8-f51e-d2e5-f31e-7f726cf6325d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Dembicki <paweldembicki@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Sep 20, 2019 at 04:30:13PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 20 Sep 2019 16:07:07 +0200
> 
> * Return an error code without storing it in an intermediate variable.
> 
> * Delete the local variable “ret” which became unnecessary
>   with this refactoring.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
