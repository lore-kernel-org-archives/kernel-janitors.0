From: Florian Fainelli <f.fainelli@gmail.com>
Date: Thu, 26 Sep 2019 03:18:05 +0000
Subject: Re: [PATCH net] net: broadcom/bcmsysport: Fix signedness in bcm_sysport_probe()
Message-Id: <2424620c-7e8f-43ad-498f-966f26dc7e9f@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105604.GD3264@mwanda>
In-Reply-To: <20190925105604.GD3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 9/25/2019 3:56 AM, Dan Carpenter wrote:
> The "priv->phy_interface" variable is an enum and in this context GCC
> will treat it as unsigned so the error handling will never be
> triggered.
> 
> Fixes: 80105befdb4b ("net: systemport: add Broadcom SYSTEMPORT Ethernet MAC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
