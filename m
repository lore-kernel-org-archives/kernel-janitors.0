From: Reiner Herrmann <reiner@reiner-h.de>
Date: Sun, 13 Aug 2006 16:10:04 +0000
Subject: [KJ] [PATCH] input: fix detection of special buttons in
Message-Id: <200608131810.04219.reiner@reiner-h.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If either a wifi or a bluetooth button has been detected, the code
would leave the loop. But there are laptops that have both types of buttons,
so the loop has to continue and resume checking.

Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
---
diff -uprN -X linux-2.6.18-rc4/Documentation/dontdiff linux-2.6.18-rc4/drivers/input/misc/wistron_btns.c linux-work/drivers/input/misc/wistron_btns.c
--- linux-2.6.18-rc4/drivers/input/misc/wistron_btns.c	2006-08-13 16:30:17.000000000 +0200
+++ linux-work/drivers/input/misc/wistron_btns.c	2006-08-13 17:14:28.000000000 +0200
@@ -248,13 +248,10 @@ static int __init dmi_matched(struct dmi
 
 	keymap = dmi->driver_data;
 	for (key = keymap; key->type != KE_END; key++) {
-		if (key->type = KE_WIFI) {
+		if (key->type = KE_WIFI)
 			have_wifi = 1;
-			break;
-		} else if (key->type = KE_BLUETOOTH) {
+		else if (key->type = KE_BLUETOOTH)
 			have_bluetooth = 1;
-			break;
-		}
 	}
 	return 1;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
