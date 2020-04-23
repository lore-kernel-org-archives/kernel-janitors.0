From: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 23 Apr 2020 14:37:12 +0000
Subject: Re: [PATCH][next] net: phy: bcm54140: fix less than zero comparison on an unsigned
Message-Id: <20200423143712.GA1020784@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423141016.19666-1-colin.king@canonical.com>
In-Reply-To: <20200423141016.19666-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, Michael Walle <michael@walle.cc>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 23, 2020 at 03:10:16PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the unsigned variable tmp is being checked for an negative
> error return from the call to bcm_phy_read_rdb and this can never
> be true since tmp is unsigned.  Fix this by making tmp a plain int.
> 
> Addresses-Coverity: ("Unsigned compared against 0")

I thought 0 was unsigned?

> Fixes: 4406d36dfdf1 ("net: phy: bcm54140: add hwmon support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
