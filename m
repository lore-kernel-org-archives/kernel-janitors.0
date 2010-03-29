From: Julia Lawall <julia@diku.dk>
Date: Mon, 29 Mar 2010 15:33:34 +0000
Subject: [PATCH 1/12] arch/powerpc/kernel: Add missing unlock
Message-Id: <Pine.LNX.4.64.1003291733150.21896@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Add an unlock before exiting the function.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E1;
identifier f;
@@

f (...) { <+...
* spin_lock_irq (E1,...);
... when != E1
* return ...;
...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/kernel/vio.c           |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/kernel/vio.c b/arch/powerpc/kernel/vio.c
index 77f6421..2ca69fa 100644
--- a/arch/powerpc/kernel/vio.c
+++ b/arch/powerpc/kernel/vio.c
@@ -644,8 +644,10 @@ void vio_cmo_set_dev_desired(struct vio_dev *viodev, size_t desired)
 			found = 1;
 			break;
 		}
-	if (!found)
+	if (!found) {
+		spin_unlock_irqrestore(&vio_cmo.lock, flags);
 		return;
+	}
 
 	/* Increase/decrease in desired device entitlement */
 	if (desired >= viodev->cmo.desired) {
