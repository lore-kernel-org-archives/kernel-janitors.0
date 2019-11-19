From: David Miller <davem@davemloft.net>
Date: Tue, 19 Nov 2019 01:23:58 +0000
Subject: Re: [PATCH][next] net: phy: dp83869: fix return of uninitialized variable ret
Message-Id: <20191118.172358.1651088156867288729.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191118114835.39494-1-colin.king@canonical.com>
In-Reply-To: <20191118114835.39494-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, dmurphy@ti.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Nov 2019 11:48:35 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where the call to phy_interface_is_rgmii returns zero
> the variable ret is left uninitialized and this is returned at
> the end of the function dp83869_configure_rgmii.  Fix this by
> returning 0 instead of the uninitialized value in ret.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 01db923e8377 ("net: phy: dp83869: Add TI dp83869 phy")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
