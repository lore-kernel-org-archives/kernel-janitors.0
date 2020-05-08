From: David Miller <davem@davemloft.net>
Date: Fri, 08 May 2020 01:07:58 +0000
Subject: Re: [PATCH][next] net: phy: fix less than zero comparison with unsigned variable val
Message-Id: <20200507.180758.1608657964463079833.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507143430.50507-1-colin.king@canonical.com>
In-Reply-To: <20200507143430.50507-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk, linux@rempel-privat.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  7 May 2020 15:34:30 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The unsigned variable val is being checked for an error by checking
> if it is less than zero. This can never occur because val is unsigned.
> Fix this by making val a plain int.
> 
> Addresses-Coverity: ("Unsigned compared against zero")
> Fixes: bdbdac7649fa ("ethtool: provide UAPI for PHY master/slave configuration.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
