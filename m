From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Thu, 30 Apr 2020 19:51:32 +0000
Subject: [PATCH] dp83640: reverse arguments to list_add_tail
Message-Id: <1588276292-19166-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Cochran <richardcochran@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Nic Volanschi <eugene.volanschi@inria.fr>

In this code, it appears that phyter_clocks is a list head, based on
the previous list_for_each, and that clock->list is intended to be a
list element, given that it has just been initialized in
dp83640_clock_init.  Accordingly, switch the arguments to
list_add_tail, which takes the list head as the second argument.

Fixes: cb646e2b02b27 ("ptp: Added a clock driver for the National Semiconductor PHYTER.")
Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
Not tested.

 drivers/net/phy/dp83640.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/dp83640.c b/drivers/net/phy/dp83640.c
index 415c27310982..ecbd5e0d685c 100644
--- a/drivers/net/phy/dp83640.c
+++ b/drivers/net/phy/dp83640.c
@@ -1120,7 +1120,7 @@ static struct dp83640_clock *dp83640_clock_get_bus(struct mii_bus *bus)
 		goto out;
 	}
 	dp83640_clock_init(clock, bus);
-	list_add_tail(&phyter_clocks, &clock->list);
+	list_add_tail(&clock->list, &phyter_clocks);
 out:
 	mutex_unlock(&phyter_clocks_lock);
 
