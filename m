From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 13 Nov 2018 00:18:01 +0000
Subject: Re: [PATCH][net-next] net: phy: check if advertising is zero using linkmode_empty
Message-Id: <20181113001801.GD14047@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181112234556.5291-1-colin.king@canonical.com>
In-Reply-To: <20181112234556.5291-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 12, 2018 at 11:45:56PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A recent change modified variable advertising from a u32 to a link mode
> array and left the u32 zero comparison, so essential we now have an array
> being compared to null which is not the intention. Fix this by using the
> call to linkmode_empty to check if advertising is all zero.
> 
> Detected by CoverityScan, CID#1475424 ("Array compared against 0")
> 
> Fixes: 3c1bcc8614db ("net: ethernet: Convert phydev advertize and supported from u32 to link mode")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks Colin.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
