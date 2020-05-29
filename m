From: David Miller <davem@davemloft.net>
Date: Fri, 29 May 2020 19:48:58 +0000
Subject: Re: [PATCH net-next] net: phy: marvell: unlock after phy_select_page() failure
Message-Id: <20200529.124858.1944254056553169947.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200529100207.GB1304852@mwanda>
In-Reply-To: <20200529100207.GB1304852@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2020 13:02:07 +0300

> We need to call phy_restore_page() even if phy_select_page() fails.
> Otherwise we are holding the phy_lock_mdio_bus() lock.  This requirement
> is documented at the start of the phy_select_page() function.
> 
> Fixes: a618e86da91d ("net : phy: marvell: Speedup TDR data retrieval by only changing page once")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
