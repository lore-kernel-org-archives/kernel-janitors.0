From: Lars Noschinski <lars@public.noschinski.de>
Date: Mon, 24 Jul 2006 20:20:41 +0000
Subject: [KJ] [PATCH] dib3000 documentation reference fixup
Message-Id: <20060724202041.2668.15122.stgit@vertikal.home.noschinski.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Lars Noschinski <lars@public.noschinski.de>

dib3000 source files refered to a documentation file which was removed a year
ago by b6a235b1186dda0800c8bedc2526830a4a36b44e. Fix this up.

Signed-off-by: Lars Noschinski <lars@public.noschinski.de>
---

 drivers/media/dvb/frontends/dib3000-common.h |    4 ++--
 drivers/media/dvb/frontends/dib3000.h        |    4 ++--
 drivers/media/dvb/frontends/dib3000mb.c      |    4 ++--
 drivers/media/dvb/frontends/dib3000mc.c      |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/dvb/frontends/dib3000-common.h b/drivers/media/dvb/frontends/dib3000-common.h
index be1c0d3..03a22a7 100644
--- a/drivers/media/dvb/frontends/dib3000-common.h
+++ b/drivers/media/dvb/frontends/dib3000-common.h
@@ -17,9 +17,9 @@
  * Acknowledgements
  *
  *  Amaury Demol (ademol@dibcom.fr) from DiBcom for providing specs and driver
- *  sources, on which this driver (and the dvb-dibusb) are based.
+ *  sources, on which this driver (and dibusb) are based.
  *
- * see Documentation/dvb/README.dibusb for more information
+ * see Documentation/dvb/README.dvb-usb for more information
  *
  */
 
diff --git a/drivers/media/dvb/frontends/dib3000.h b/drivers/media/dvb/frontends/dib3000.h
index ec92762..9353518 100644
--- a/drivers/media/dvb/frontends/dib3000.h
+++ b/drivers/media/dvb/frontends/dib3000.h
@@ -15,9 +15,9 @@
  * Acknowledgements
  *
  *  Amaury Demol (ademol@dibcom.fr) from DiBcom for providing specs and driver
- *  sources, on which this driver (and the dvb-dibusb) are based.
+ *  sources, on which this driver (and dibusb) are based.
  *
- * see Documentation/dvb/README.dibusb for more information
+ * see Documentation/dvb/README.dvb-usb for more information
  *
  */
 
diff --git a/drivers/media/dvb/frontends/dib3000mb.c b/drivers/media/dvb/frontends/dib3000mb.c
index 5302e11..a5211b1 100644
--- a/drivers/media/dvb/frontends/dib3000mb.c
+++ b/drivers/media/dvb/frontends/dib3000mb.c
@@ -15,9 +15,9 @@
  * Acknowledgements
  *
  *  Amaury Demol (ademol@dibcom.fr) from DiBcom for providing specs and driver
- *  sources, on which this driver (and the dvb-dibusb) are based.
+ *  sources, on which this driver (and dibusb) are based.
  *
- * see Documentation/dvb/README.dibusb for more information
+ * see Documentation/dvb/README.dvb-usb for more information
  *
  */
 
diff --git a/drivers/media/dvb/frontends/dib3000mc.c b/drivers/media/dvb/frontends/dib3000mc.c
index 9867347..c41059c 100644
--- a/drivers/media/dvb/frontends/dib3000mc.c
+++ b/drivers/media/dvb/frontends/dib3000mc.c
@@ -15,9 +15,9 @@
  * Acknowledgements
  *
  *  Amaury Demol (ademol@dibcom.fr) from DiBcom for providing specs and driver
- *  sources, on which this driver (and the dvb-dibusb) are based.
+ *  sources, on which this driver (and dibusb) are based.
  *
- * see Documentation/dvb/README.dibusb for more information
+ * see Documentation/dvb/README.dvb-usb for more information
  *
  */
 #include <linux/kernel.h>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
