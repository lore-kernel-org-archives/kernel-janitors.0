From: Clemens Buchacher <drizzd@aon.at>
Date: Mon, 05 Jul 2004 12:00:57 +0000
Subject: [Kernel-janitors] [patch] __FUNCTION__ string concatenation
Message-Id: <20040705120057.GA22161@moley.homelinux.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've replaced the __FUNCTION__ string concatenation with the
%s placeholder and a printf parameter in
drivers/net/wireless/prism65/islpci_mgt.h, as suggested in the TODO
list.

I don't have the hardware to do a run-time check. It should not pose any
problems though.

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="func_cat.patch"

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/07/04 22:08:37+02:00 drizzd@aon.at 
#   __FUNCTION__ string concatenation is deprecated
# 
# drivers/net/wireless/prism54/islpci_mgt.h
#   2004/07/03 17:18:20+02:00 drizzd@aon.at +1 -1
#   __FUNCTION__ string concatenation is deprecated
# 
diff -Nru a/drivers/net/wireless/prism54/islpci_mgt.h b/drivers/net/wireless/prism54/islpci_mgt.h
--- a/drivers/net/wireless/prism54/islpci_mgt.h	2004-07-05 13:33:10 +02:00
+++ b/drivers/net/wireless/prism54/islpci_mgt.h	2004-07-05 13:33:10 +02:00
@@ -31,7 +31,7 @@
 #define K_DEBUG(f, m, args...) do { if(f & m) printk(KERN_DEBUG args); } while(0)
 #define DEBUG(f, args...) K_DEBUG(f, pc_debug, args)
 
-#define TRACE(devname)   K_DEBUG(SHOW_TRACING, VERBOSE, "%s:  -> " __FUNCTION__ "()\n", devname)
+#define TRACE(devname)   K_DEBUG(SHOW_TRACING, VERBOSE, "%s:  -> %s()\n", devname, __FUNCTION__)
 
 extern int pc_debug;
 #define init_wds 0	/* help compiler optimize away dead code */

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--dDRMvlgZJXvWKvBx--
