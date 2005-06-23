From: Carlo Perassi <carlo@linux.it>
Date: Thu, 23 Jun 2005 19:19:57 +0000
Subject: [KJ] [PATCH] (2/4) ieee1394 - uninitialize static variables
Message-Id: <20050623191957.GB4398@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69781243742598908=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69781243742598908==
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
 drivers/ieee1394/nodemgr.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6.12/drivers/ieee1394/nodemgr.c
===================================================================
--- linux-2.6.12.orig/drivers/ieee1394/nodemgr.c
+++ linux-2.6.12/drivers/ieee1394/nodemgr.c
@@ -30,7 +30,7 @@
 #include "csr.h"
 #include "nodemgr.h"
 
-static int ignore_drivers = 0;
+static int ignore_drivers;
 module_param(ignore_drivers, int, 0444);
 MODULE_PARM_DESC(ignore_drivers, "Disable automatic probing for drivers.");
 
-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============69781243742598908==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69781243742598908==--
