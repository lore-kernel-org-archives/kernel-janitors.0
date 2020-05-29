From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 29 May 2020 14:25:45 +0000
Subject: Re: [PATCH net-next] net: phy: marvell: unlock after phy_select_page() failure
Message-Id: <20200529142545.GB869823@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200529100207.GB1304852@mwanda>
In-Reply-To: <20200529100207.GB1304852@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 29, 2020 at 01:02:07PM +0300, Dan Carpenter wrote:
> We need to call phy_restore_page() even if phy_select_page() fails.
> Otherwise we are holding the phy_lock_mdio_bus() lock.  This requirement
> is documented at the start of the phy_select_page() function.
> 
> Fixes: a618e86da91d ("net : phy: marvell: Speedup TDR data retrieval by only changing page once")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
