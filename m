From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Aug 2017 21:35:50 +0000
Subject: [PATCH net-next] phylink: Fix an uninitialized variable bug
Message-Id: <20170809213550.rga6tlohagu2pm2y@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" isn't necessarily initialized here.

Fixes: 9525ae83959b ("phylink: add phylink infrastructure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 32917bdd1432..bcb4755bcd95 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -958,7 +958,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 	}
 	mutex_unlock(&pl->state_mutex);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(phylink_ethtool_ksettings_set);
 
