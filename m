From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 16 Mar 2005 13:48:31 +0000
Subject: [KJ] [PATCH] printk : drivers/char/watchdog/wdt285.c
Message-Id: <20050316134831.GG17405@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZRyEpB+iJ+qUx0kp"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
printk() calls should include appropriate KERN_* constant.

Have a nice day,

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-printk-linux-2.6.11_drivers_char_watchdog_wdt285.c.diff"

diff -urpN -X dontdiff linux-2.6.11-vanilla/drivers/char/watchdog/wdt285.c linux-2.6.11/drivers/char/watchdog/wdt285.c
--- linux-2.6.11-vanilla/drivers/char/watchdog/wdt285.c	2005-03-02 08:37:50.000000000 +0100
+++ linux-2.6.11/drivers/char/watchdog/wdt285.c	2005-03-16 12:23:07.000000000 +0100
@@ -204,11 +204,11 @@ static int __init footbridge_watchdog_in
 	if (retval < 0)
 		return retval;
 
-	printk("Footbridge Watchdog Timer: 0.01, timer margin: %d sec\n",
+	printk(KERN_INFO "Footbridge Watchdog Timer: 0.01, timer margin: %d sec\n",
 	       soft_margin);
 
 	if (machine_is_cats())
-		printk("Warning: Watchdog reset may not work on this machine.\n");
+		printk(KERN_WARNING "Warning: Watchdog reset may not work on this machine.\n");
 	return 0;
 }
 

--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--ZRyEpB+iJ+qUx0kp--
