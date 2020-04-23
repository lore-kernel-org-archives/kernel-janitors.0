From: Michael Walle <michael@walle.cc>
Date: Thu, 23 Apr 2020 14:48:05 +0000
Subject: Re: [PATCH][next] net: phy: bcm54140: fix less than zero comparison on an unsigned
Message-Id: <cbb5132b022cd5e954c0fb5aa285dd0a@walle.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423141016.19666-1-colin.king@canonical.com>
In-Reply-To: <20200423141016.19666-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am 2020-04-23 16:10, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the unsigned variable tmp is being checked for an negative
> error return from the call to bcm_phy_read_rdb and this can never
> be true since tmp is unsigned.  Fix this by making tmp a plain int.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 4406d36dfdf1 ("net: phy: bcm54140: add hwmon support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

FWIW since Andrew already reviewed it:

Reviewed-by: Michael Walle <michael@walle.cc>

-michael
