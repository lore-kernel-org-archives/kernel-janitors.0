From: Julia Lawall <julia@diku.dk>
Date: Mon, 29 Mar 2010 15:35:24 +0000
Subject: [PATCH 7/12] drivers/pcmcia: Add missing local_irq_restore
Message-Id: <Pine.LNX.4.64.1003291735050.21896@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use local_irq_restore in this error-handling case just like in the one just
below.

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
 drivers/pcmcia/db1xxx_ss.c          |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/pcmcia/db1xxx_ss.c b/drivers/pcmcia/db1xxx_ss.c
index a520193..a3fec01 100644
--- a/drivers/pcmcia/db1xxx_ss.c
+++ b/drivers/pcmcia/db1xxx_ss.c
@@ -165,8 +165,10 @@ static int db1x_pcmcia_setup_irqs(struct db1x_pcmcia_sock *sock)
 
 		ret = request_irq(sock->insert_irq, db1200_pcmcia_cdirq,
 				  IRQF_DISABLED, "pcmcia_insert", sock);
-		if (ret)
+		if (ret) {
+			local_irq_restore(flags);
 			goto out1;
+		}
 
 		ret = request_irq(sock->eject_irq, db1200_pcmcia_cdirq,
 				  IRQF_DISABLED, "pcmcia_eject", sock);
