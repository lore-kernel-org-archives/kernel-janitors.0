From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Feb 2019 15:18:43 +0000
Subject: [PATCH][V2] staging: rtl8192u: remove redundant nul check on pointer dev
Message-Id: <20190204151843.15915-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a null check on pointer dev which implies it may be null, however
dev can never be null as it is set in rtl8192_usb_probe via the call
to usb_set_intfdata.

Detected by CoverityScan, CID#143078 ("Dereference after null check")

Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: 
1. change title of commit from "staging: rtl8192u: fix a null pointer 
   dereference on a null dev pointer"
2. remove null check, thanks to Dan Carpenter for spotting this

---

 drivers/staging/rtl8192u/r8192U_core.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 0ac0bbf7d923..f1eaab337dca 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -4957,20 +4957,18 @@ static void rtl8192_usb_disconnect(struct usb_interface *intf)
 	struct net_device *dev = usb_get_intfdata(intf);
 	struct r8192_priv *priv = ieee80211_priv(dev);
 
-	if (dev) {
-		unregister_netdev(dev);
-
-		RT_TRACE(COMP_DOWN,
-			 "=======>wlan driver to be removed\n");
-		rtl8192_proc_remove_one(dev);
-
-		rtl8192_down(dev);
-		kfree(priv->pFirmware);
-		priv->pFirmware = NULL;
-		rtl8192_usb_deleteendpoints(dev);
-		usleep_range(10000, 11000);
-	}
+	unregister_netdev(dev);
+
+	RT_TRACE(COMP_DOWN, "=======>wlan driver to be removed\n");
+	rtl8192_proc_remove_one(dev);
+
+	rtl8192_down(dev);
+	kfree(priv->pFirmware);
+	priv->pFirmware = NULL;
+	rtl8192_usb_deleteendpoints(dev);
+	usleep_range(10000, 11000);
 	free_ieee80211(dev);
+
 	RT_TRACE(COMP_DOWN, "wlan driver removed\n");
 }
 
-- 
2.20.1
