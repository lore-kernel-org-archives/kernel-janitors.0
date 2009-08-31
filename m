From: Julia Lawall <julia@diku.dk>
Date: Mon, 31 Aug 2009 19:12:07 +0000
Subject: [PATCH] drivers/char/amiserial.c: Add local_irq_restore in error
Message-Id: <Pine.LNX.4.64.0908312111400.17886@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The gotos to the labels fail_free_irq and fail_unregister only occur
between local_irq_save and local_irq_restore, so it would seem that this
code should also call local_irq_restore.

The semantic match that detects this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@rl@
expression l;
position p;
expression E,E1,E2;
@@

local_irq_save(l);
<... when != local_irq_restore(l)
     when != spin_unlock_irqrestore(E,l)
if (...) { ... when != local_irq_restore(l)
               when != spin_unlock_irqrestore(E1,l)
*    return@p ...;
}
...>
(
spin_unlock_irqrestore(E2,l);
|
local_irq_restore(l);
)
</smpl>

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
