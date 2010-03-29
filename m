From: Julia Lawall <julia@diku.dk>
Date: Mon, 29 Mar 2010 15:34:11 +0000
Subject: [PATCH 3/12] drivers/char/amiserial.c: Add missing local_irq_restore
Message-Id: <Pine.LNX.4.64.1003291733530.21896@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Add local_irq_restore after the labels that can be reached after a
local_irq_save.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E1;
identifier f;
@@

f (...) { <+...
* local_irq_save (E1,...);
... when != E1
* return ...;
...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/amiserial.c            |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/amiserial.c b/drivers/char/amiserial.c
index 6c32fbf..2131ecb 100644
--- a/drivers/char/amiserial.c
+++ b/drivers/char/amiserial.c
@@ -2056,6 +2056,7 @@ fail_free_irq:
 	free_irq(IRQ_AMIGA_TBE, state);
 fail_unregister:
 	tty_unregister_driver(serial_driver);
+	local_irq_restore(flags);
 fail_release_mem_region:
 	release_mem_region(CUSTOM_PHYSADDR+0x30, 4);
 fail_put_tty_driver:
