From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:16:39 +0000
Subject: [PATCH 12/37] drivers/net/wireless/wl12xx: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152316220.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Coelho <luciano.coelho@nokia.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/wireless/wl12xx/wl1271_main.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff -u -p a/drivers/net/wireless/wl12xx/wl1271_main.c b/drivers/net/wireless/wl12xx/wl1271_main.c
--- a/drivers/net/wireless/wl12xx/wl1271_main.c
+++ b/drivers/net/wireless/wl12xx/wl1271_main.c
@@ -573,7 +573,7 @@ static int wl1271_fetch_nvs(struct wl127
 		goto out;
 	}
 
-	wl->nvs = kmalloc(sizeof(struct wl1271_nvs_file), GFP_KERNEL);
+	wl->nvs = kmemdup(fw->data, sizeof(struct wl1271_nvs_file), GFP_KERNEL);
 
 	if (!wl->nvs) {
 		wl1271_error("could not allocate memory for the nvs file");
@@ -581,8 +581,6 @@ static int wl1271_fetch_nvs(struct wl127
 		goto out;
 	}
 
-	memcpy(wl->nvs, fw->data, sizeof(struct wl1271_nvs_file));
-
 out:
 	release_firmware(fw);
 
@@ -2350,15 +2348,13 @@ struct ieee80211_hw *wl1271_alloc_hw(voi
 		goto err_hw_alloc;
 	}
 
-	plat_dev = kmalloc(sizeof(wl1271_device), GFP_KERNEL);
+	plat_dev = kmemdup(&wl1271_device, sizeof(wl1271_device), GFP_KERNEL);
 	if (!plat_dev) {
 		wl1271_error("could not allocate platform_device");
 		ret = -ENOMEM;
 		goto err_plat_alloc;
 	}
 
-	memcpy(plat_dev, &wl1271_device, sizeof(wl1271_device));
-
 	wl = hw->priv;
 	memset(wl, 0, sizeof(*wl));
 
