From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 06:47:05 +0000
Subject: [patch] wireless: at76c50x: allocating too much data
Message-Id: <20120420064705.GE22649@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a cut and paste mistake, sizeof(struct mib_local) was intended
instead of sizeof(struct mib_phy).  The call to at76_get_mib() uses
sizeof(struct mib_local) correctly.

The current code works fine because mib_phy structs are larger than
mib_local structs.  But we may as well clean it up.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/at76c50x-usb.c b/drivers/net/wireless/at76c50x-usb.c
index faa8bcb..0bba5ea 100644
--- a/drivers/net/wireless/at76c50x-usb.c
+++ b/drivers/net/wireless/at76c50x-usb.c
@@ -1122,7 +1122,7 @@ exit:
 static void at76_dump_mib_local(struct at76_priv *priv)
 {
 	int ret;
-	struct mib_local *m = kmalloc(sizeof(struct mib_phy), GFP_KERNEL);
+	struct mib_local *m = kmalloc(sizeof(struct mib_local), GFP_KERNEL);
 
 	if (!m)
 		return;
