From: Colin King <colin.king@canonical.com>
Date: Sat, 02 Feb 2019 22:56:27 +0000
Subject: [PATCH] staging: rtl8192u: fix a null pointer dereference on a null dev pointer
Message-Id: <20190202225627.27116-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an earlier null check on pointer dev which implies it may be null,
however the assignment of pointer pref and the call to free_ieee82011 on
a null dev can cause null pointer dereference errors.  Fix this by moving
the assignment of priv and the the call to free_ieee80211 into the block of
code that performs the null dev sanity check.

Detected by CoverityScan, CID#143078 ("Dereference after null check")

Fixes: 8fc8598e61f6 ("Staging: Added Realtek rtl8192u driver to staging")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 0ac0bbf7d923..4741a29326ea 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -4955,9 +4955,10 @@ static void rtl8192_cancel_deferred_work(struct r8192_priv *priv)
 static void rtl8192_usb_disconnect(struct usb_interface *intf)
 {
 	struct net_device *dev = usb_get_intfdata(intf);
-	struct r8192_priv *priv = ieee80211_priv(dev);
 
 	if (dev) {
+		struct r8192_priv *priv = ieee80211_priv(dev);
+
 		unregister_netdev(dev);
 
 		RT_TRACE(COMP_DOWN,
@@ -4969,8 +4970,8 @@ static void rtl8192_usb_disconnect(struct usb_interface *intf)
 		priv->pFirmware = NULL;
 		rtl8192_usb_deleteendpoints(dev);
 		usleep_range(10000, 11000);
+		free_ieee80211(dev);
 	}
-	free_ieee80211(dev);
 	RT_TRACE(COMP_DOWN, "wlan driver removed\n");
 }
 
-- 
2.20.1
