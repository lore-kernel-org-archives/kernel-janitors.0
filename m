From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 28 Jan 2017 09:34:59 +0000
Subject: [PATCH 2/4] dcbnl: Adjust four function calls together with a variable assignment
Message-Id: <f50af266-107e-aa09-4fc9-8a3a8ad6904f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab981a3f-e73e-9bef-09c5-9c6d077aef00@users.sourceforge.net>
In-Reply-To: <ab981a3f-e73e-9bef-09c5-9c6d077aef00@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Pan Bian <bianpan2016@163.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 28 Jan 2017 09:19:58 +0100

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/dcb/dcbnl.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/net/dcb/dcbnl.c b/net/dcb/dcbnl.c
index 76fd727e2eb4..f29e19d962ec 100644
--- a/net/dcb/dcbnl.c
+++ b/net/dcb/dcbnl.c
@@ -1799,7 +1799,8 @@ u8 dcb_getapp(struct net_device *dev, struct dcb_app *app)
 	u8 prio = 0;
 
 	spin_lock_bh(&dcb_lock);
-	if ((itr = dcb_app_lookup(app, dev->ifindex, 0)))
+	itr = dcb_app_lookup(app, dev->ifindex, 0);
+	if (itr)
 		prio = itr->app.priority;
 	spin_unlock_bh(&dcb_lock);
 
@@ -1827,7 +1828,8 @@ int dcb_setapp(struct net_device *dev, struct dcb_app *new)
 
 	spin_lock_bh(&dcb_lock);
 	/* Search for existing match and replace */
-	if ((itr = dcb_app_lookup(new, dev->ifindex, 0))) {
+	itr = dcb_app_lookup(new, dev->ifindex, 0);
+	if (itr) {
 		if (new->priority)
 			itr->app.priority = new->priority;
 		else {
@@ -1860,7 +1862,8 @@ u8 dcb_ieee_getapp_mask(struct net_device *dev, struct dcb_app *app)
 	u8 prio = 0;
 
 	spin_lock_bh(&dcb_lock);
-	if ((itr = dcb_app_lookup(app, dev->ifindex, 0)))
+	itr = dcb_app_lookup(app, dev->ifindex, 0);
+	if (itr)
 		prio |= 1 << itr->app.priority;
 	spin_unlock_bh(&dcb_lock);
 
@@ -1920,7 +1923,8 @@ int dcb_ieee_delapp(struct net_device *dev, struct dcb_app *del)
 
 	spin_lock_bh(&dcb_lock);
 	/* Search for existing match and remove it. */
-	if ((itr = dcb_app_lookup(del, dev->ifindex, del->priority))) {
+	itr = dcb_app_lookup(del, dev->ifindex, del->priority);
+	if (itr) {
 		list_del(&itr->list);
 		kfree(itr);
 		err = 0;
-- 
2.11.0

