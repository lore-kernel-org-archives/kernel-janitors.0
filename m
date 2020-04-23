From: David Miller <davem@davemloft.net>
Date: Thu, 23 Apr 2020 22:57:09 +0000
Subject: Re: [PATCH][next] net: phy: bcm54140: fix less than zero comparison on an unsigned
Message-Id: <20200423.155709.424252739885282745.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423141016.19666-1-colin.king@canonical.com>
In-Reply-To: <20200423141016.19666-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, linux@armlinux.org.uk, michael@walle.cc, linux@roeck-us.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Apr 2020 15:10:16 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the unsigned variable tmp is being checked for an negative
> error return from the call to bcm_phy_read_rdb and this can never
> be true since tmp is unsigned.  Fix this by making tmp a plain int.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 4406d36dfdf1 ("net: phy: bcm54140: add hwmon support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
