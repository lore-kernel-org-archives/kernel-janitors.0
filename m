From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:17:52 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/4] w1/dscore: replace
Message-Id: <20040927231752.GX1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43125053688194614=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221217.GZ2270@us.ibm.com>
In-Reply-To: <20040920221217.GZ2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============43125053688194614==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/w1/dscore.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/w1/dscore.c	2004-09-27 16:16:47.000000000 -0700
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
 #include <linux/usb.h>
+#include <linux/delay.h>
 
 #include "dscore.h"
 
@@ -731,7 +732,7 @@ void ds_disconnect(struct usb_interface 
 	usb_set_intfdata (intf, NULL);
 
 	while(atomic_read(&dev->refcnt))
-		schedule_timeout(HZ);
+		msleep_interruptible(1000);
 
 	usb_put_dev(dev->udev);
 	kfree(dev);

--===============43125053688194614==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43125053688194614==--
