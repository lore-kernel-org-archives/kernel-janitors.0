From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 22 Apr 2012 12:44:15 +0000
Subject: [PATCH] drivers/parport/parport_gsc.c: add missing kfree
Message-Id: <1335098655-18387-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Free ops as done just below.
Adjust some spacing to please checkpatch.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/parport/parport_gsc.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
index 5d6de38..d2dcb27 100644
--- a/drivers/parport/parport_gsc.c
+++ b/drivers/parport/parport_gsc.c
@@ -270,15 +270,16 @@ struct parport *__devinit parport_gsc_probe_port (unsigned long base,
 	p->physport = p;
 	if (!parport_SPP_supported (p)) {
 		/* No port. */
-		kfree (priv);
+		kfree(priv);
+		kfree(ops);
 		return NULL;
 	}
 	parport_PS2_supported (p);
 
 	if (!(p = parport_register_port(base, PARPORT_IRQ_NONE,
 					PARPORT_DMA_NONE, ops))) {
-		kfree (priv);
-		kfree (ops);
+		kfree(priv);
+		kfree(ops);
 		return NULL;
 	}
 

