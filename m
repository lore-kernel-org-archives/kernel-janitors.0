From: David Miller <davem@davemloft.net>
Date: Wed, 12 Sep 2018 06:00:47 +0000
Subject: Re: [PATCH net-next] net: dsa: b53: Uninitialized variable in b53_adjust_link()
Message-Id: <20180911.230047.2222510073931936095.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180908083925.i5j23wi67m5by2ew@kili.mountain>
In-Reply-To: <20180908083925.i5j23wi67m5by2ew@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: f.fainelli@gmail.com, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 8 Sep 2018 11:39:25 +0300

> The "pause" variable is only initialized on BCM5301x.
> 
> Fixes: 5e004460f874 ("net: dsa: b53: Add helper to set link parameters")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
