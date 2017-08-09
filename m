From: David Miller <davem@davemloft.net>
Date: Wed, 09 Aug 2017 04:07:59 +0000
Subject: Re: [PATCH][next] net: phy: mdio-bcm-unimac: fix unsigned wrap-around when decrementing timeout
Message-Id: <20170808.210759.2297833203309664275.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170808095232.13490-1-colin.king@canonical.com>
In-Reply-To: <20170808095232.13490-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue,  8 Aug 2017 10:52:32 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Change post-decrement compare to pre-decrement to avoid an
> unsigned integer wrap-around on timeout. This leads to the following
> !timeout check to never to be true so -ETIMEDOUT is never returned.
> 
> Detected by CoverityScan, CID#1452623 ("Logically dead code")
> 
> Fixes: 69a60b0579a4 ("net: phy: mdio-bcm-unimac: factor busy polling loop")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
