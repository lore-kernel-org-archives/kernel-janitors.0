From: Clemens Buchacher <drizzd@aon.at>
Date: Sun, 19 Sep 2004 15:15:54 +0000
Subject: [Kernel-janitors] [PATCH] __FUNCTION__ string concatenation
Message-Id: <20040920150745.GC12577@kzelldran>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53073439753912632=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040705120057.GA22161@moley.homelinux.net>
In-Reply-To: <20040705120057.GA22161@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

--===============53073439753912632==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description: __FUNCTION__ string concatenation is deprecated

Diff against linux-2.6 up to ChangeSet@1.1938 (04/09/18 20:30:01)

 drivers/net/wireless/prism54/islpci_mgt.h |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Status: compile time tested

Signed-off-by: Clemens Buchacher <drizzd@aon.at>

# drivers/net/wireless/prism54/islpci_mgt.h
#   2004/09/20 14:52:26+02:00 drizzd@aon.at +1 -1
#   __FUNCTION__ string concatenation is deprecated
diff -Nru a/drivers/net/wireless/prism54/islpci_mgt.h b/drivers/net/wireless/prism54/islpci_mgt.h
--- a/drivers/net/wireless/prism54/islpci_mgt.h	2004-09-20 15:14:54 +02:00
+++ b/drivers/net/wireless/prism54/islpci_mgt.h	2004-09-20 15:14:54 +02:00
@@ -31,7 +31,7 @@
 #define K_DEBUG(f, m, args...) do { if(f & m) printk(KERN_DEBUG args); } while(0)
 #define DEBUG(f, args...) K_DEBUG(f, pc_debug, args)
 
-#define TRACE(devname)   K_DEBUG(SHOW_TRACING, VERBOSE, "%s:  -> " __FUNCTION__ "()\n", devname)
+#define TRACE(devname)   K_DEBUG(SHOW_TRACING, VERBOSE, "%s:  -> %s()\n", devname, __FUNCTION__)
 
 extern int pc_debug;
 #define init_wds 0	/* help compiler optimize away dead code */

--===============53073439753912632==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53073439753912632==--
