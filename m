From: Julia Lawall <julia@diku.dk>
Date: Wed, 16 Jul 2008 14:34:54 +0000
Subject: [PATCH 2/2] net/ieee80211: adjust error handling
Message-Id: <Pine.LNX.4.64.0807161634310.28783@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeff@garzik.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Converts a test in error handling code to a sequence of labels.

The semantic match that found the problem is:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E,E1,E2;
@@

E = alloc_etherdev(...)
... when != E = E1
if (...) { ... free_netdev(E); ... return ...; }
... when != E = E2
(
  if (...)
   {
   ... when != free_netdev(E);
   return dev; }
|
* if (...)
   {
   ... when != free_netdev(E);
   return ...; }
|
register_netdev(E)
)

// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/net/ieee80211/ieee80211_module.c b/net/ieee80211/ieee80211_module.c
--- a/net/ieee80211/ieee80211_module.c
+++ b/net/ieee80211/ieee80211_module.c
@@ -157,7 +157,7 @@ struct net_device *alloc_ieee80211(int s
 	err = ieee80211_networks_allocate(ieee);
 	if (err) {
 		IEEE80211_ERROR("Unable to allocate beacon storage: %d\n", err);
-		goto failed;
+		goto failed_free_netdev;
 	}
 	ieee80211_networks_initialize(ieee);
 
@@ -193,9 +193,9 @@ struct net_device *alloc_ieee80211(int s
 
 	return dev;
 
-      failed:
-	if (dev)
-		free_netdev(dev);
+failed_free_netdev:
+	free_netdev(dev);
+failed:
 	return NULL;
 }
 
