From: Dan Carpenter <error27@gmail.com>
Date: Wed, 05 Jan 2011 07:03:44 +0000
Subject: [patch 2/2] dcb: use after free in dcb_flushapp()
Message-Id: <20110105070344.GB24847@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: John Fastabend <john.r.fastabend@intel.com>, Shmulik Ravid <shmulikr@broadcom.com>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

The original code has a use after free bug because it's not using the
_safe() version of the list_for_each_entry() macro.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/dcb/dcbnl.c b/net/dcb/dcbnl.c
index 8881cb5..11bf6a2 100644
--- a/net/dcb/dcbnl.c
+++ b/net/dcb/dcbnl.c
@@ -1650,9 +1650,10 @@ EXPORT_SYMBOL(dcb_setapp);
 static void dcb_flushapp(void)
 {
 	struct dcb_app_type *app;
+	struct dcb_app_type *tmp;
 
 	spin_lock(&dcb_lock);
-	list_for_each_entry(app, &dcb_app_list, list) {
+	list_for_each_entry_safe(app, tmp, &dcb_app_list, list) {
 		list_del(&app->list);
 		kfree(app);
 	}
