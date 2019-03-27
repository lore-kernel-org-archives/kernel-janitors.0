From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 27 Mar 2019 16:21:23 +0000
Subject: Re: [PATCH] net: phy: mdio-bcm-unimac: remove redundant !timeout check
Message-Id: <f0cc34fe-c692-d414-dc1e-9d03c8da8dc2@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190327161520.23064-1-colin.king@canonical.com>
In-Reply-To: <20190327161520.23064-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/27/19 9:15 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for zero timeout is always true at the end of the proceeding
> while loop; the only other exit path in the loop is if the unimac MDIO
> is not busy.  Remove the redundant zero timeout check and always
> return -ETIMEDOUT on this timeout return path.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
