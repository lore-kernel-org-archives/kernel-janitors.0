From: Carlo Perassi <carlo@linux.it>
Date: Thu, 23 Jun 2005 19:22:33 +0000
Subject: [KJ] [PATCH] (4/4) ieee1394 - uninitialize static variables
Message-Id: <20050623192233.GD4398@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23358861518619878=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23358861518619878==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

One of the tasks at http://janitor.kernelnewbies.org/TODO
is described as
"
uninitialize static variables initialized to 0, to make it go to the
.bss, instead of .data.
"

To proof that it is still guaranteed that those variables will be
initialized to zero

Tom Bradley <tojabr@gmail.com> (on the kernel-janitors mailing list)
wrote
"
the default for gcc is `-fzero-initialized-in-bss', the kernel
makefile does not change this therefore bss is zeroed, this is
documented in the gcc manpage.
"

and David P Howell <david.p.howell@intel.com> added that
"
By definition .bss is always zero'ed by the implementation.
"

This patch uninitializes two static int initialized to 0.

Signed-off-by: Carlo Perassi <carlo@linux.it>
---
 drivers/ieee1394/sbp2.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6.12/drivers/ieee1394/sbp2.c
===================================================================
--- linux-2.6.12.orig/drivers/ieee1394/sbp2.c
+++ linux-2.6.12/drivers/ieee1394/sbp2.c
@@ -104,7 +104,7 @@
  * down to us at a time (debugging). This might be necessary for very
  * badly behaved sbp2 devices.
  */
-static int serialize_io = 0;
+static int serialize_io;
 module_param(serialize_io, int, 0444);
 MODULE_PARM_DESC(serialize_io, "Serialize all I/O coming down from the scsi drivers (default = 0)");
 
@@ -145,7 +145,7 @@
  * please submit the logged sbp2_firmware_revision value of this device to
  * the linux1394-devel mailing list.
  */
-static int force_inquiry_hack = 0;
+static int force_inquiry_hack;
 module_param(force_inquiry_hack, int, 0444);
 MODULE_PARM_DESC(force_inquiry_hack, "Force SCSI inquiry hack (default = 0)");
 
-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============23358861518619878==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23358861518619878==--
