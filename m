From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 May 2012 20:57:29 +0000
Subject: [patch] brcm80211: remove an unneeded NULL check
Message-Id: <20120514205729.GD20836@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Roland Vossen <rvossen@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This code causes a static checker warning because "pi" gets dereferenced
before it is checked.  The dereference is inside the write_phy_reg()
function which is called from wlc_phy_write_txmacreg_nphy().

This code is only called from wlc_phy_init_nphy() and "pi" is a
valid pointer so we can remove the check for NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c b/drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c
index 812b6e3..d6380f3 100644
--- a/drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c
+++ b/drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c
@@ -14358,7 +14358,7 @@ void wlc_phy_nphy_tkip_rifs_war(struct brcms_phy *pi, u8 rifs)
 
 	wlc_phy_write_txmacreg_nphy(pi, holdoff, delay);
 
-	if (pi && pi->sh && (pi->sh->_rifs_phy != rifs))
+	if (pi->sh && (pi->sh->_rifs_phy != rifs))
 		pi->sh->_rifs_phy = rifs;
 }
 
