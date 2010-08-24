From: David Miller <davem@davemloft.net>
Date: Tue, 24 Aug 2010 21:50:58 +0000
Subject: Re: [patch 3/4] pxa168_eth: update call to phy_mii_ioctl()
Message-Id: <20100824.145058.245415208.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100824165420.GJ29330@bicker>
In-Reply-To: <20100824165420.GJ29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: ssanap@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 18:54:20 +0200

> The phy_mii_ioctl() function changed recently.  It now takes a struct
> ifreq pointer directly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
