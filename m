From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 14 Aug 2018 13:41:54 +0000
Subject: Re: [PATCH net-next] net: dsa: mv88e6xxx: bitwise vs logical bug
Message-Id: <20180814134154.GB2211@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814090643.ilis47jhsaa2sbhi@kili.mountain>
In-Reply-To: <20180814090643.ilis47jhsaa2sbhi@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 14, 2018 at 12:06:43PM +0300, Dan Carpenter wrote:
> We are trying to test if these flags are set but there are some && vs &
> typos.
> 
> Fixes: efd1ba6af93f ("net: dsa: mv88e6xxx: Add SERDES phydev_mac_change up for 6390")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
