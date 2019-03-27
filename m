From: David Miller <davem@davemloft.net>
Date: Wed, 27 Mar 2019 21:27:50 +0000
Subject: Re: [PATCH] net: phy: mdio-bcm-unimac: remove redundant !timeout check
Message-Id: <20190327.142750.390720588003321523.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190327161520.23064-1-colin.king@canonical.com>
In-Reply-To: <20190327161520.23064-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 27 Mar 2019 16:15:20 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for zero timeout is always true at the end of the proceeding
> while loop; the only other exit path in the loop is if the unimac MDIO
> is not busy.  Remove the redundant zero timeout check and always
> return -ETIMEDOUT on this timeout return path.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
