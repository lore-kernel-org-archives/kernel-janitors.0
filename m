From: David Miller <davem@davemloft.net>
Date: Tue, 14 Aug 2018 17:05:29 +0000
Subject: Re: [PATCH net-next] net: dsa: mv88e6xxx: bitwise vs logical bug
Message-Id: <20180814.100529.720386686903807480.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814090643.ilis47jhsaa2sbhi@kili.mountain>
In-Reply-To: <20180814090643.ilis47jhsaa2sbhi@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 12:06:43 +0300

> We are trying to test if these flags are set but there are some && vs &
> typos.
> 
> Fixes: efd1ba6af93f ("net: dsa: mv88e6xxx: Add SERDES phydev_mac_change up for 6390")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
