From: Carlo Perassi <carlo@linux.it>
Date: Thu, 23 Jun 2005 19:21:26 +0000
Subject: [KJ] [PATCH] (3/4) ieee1394 - uninitialize static variables
Message-Id: <20050623192126.GC4398@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71585448930093709=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============71585448930093709==
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

This patch uninitializes a static int initialized to 0.

Signed-off-by: Carlo Perassi <carlo@linux.it>
---
 drivers/ieee1394/pcilynx.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6.12/drivers/ieee1394/pcilynx.c
===================================================================
--- linux-2.6.12.orig/drivers/ieee1394/pcilynx.c
+++ linux-2.6.12/drivers/ieee1394/pcilynx.c
@@ -76,7 +76,7 @@
 
 
 /* Module Parameters */
-static int skip_eeprom = 0;
+static int skip_eeprom;
 module_param(skip_eeprom, int, 0444);
 MODULE_PARM_DESC(skip_eeprom, "Use generic bus info block instead of serial eeprom (default = 0).");
 
-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============71585448930093709==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71585448930093709==--
