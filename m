From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 18:20:24 +0000
Subject: [PATCH 1/16] drivers/net/atl1c: remove exceptional & on function
Message-Id: <Pine.LNX.4.64.0911181920010.20943@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, Jie Yang <jie.yang@atheros.com>, atl1-devel@lists.sourceforge.net, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In this file, function names are otherwise used as pointers without &.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier f;
@@

f(...) { ... }

@@
identifier r.f;
@@

- &f
+ f
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/atl1c/atl1c_main.c      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/atl1c/atl1c_main.c b/drivers/net/atl1c/atl1c_main.c
index 5ef9e23..1e2f57d 100644
--- a/drivers/net/atl1c/atl1c_main.c
+++ b/drivers/net/atl1c/atl1c_main.c
@@ -2135,7 +2135,7 @@ static int atl1c_request_irq(struct atl1c_adapter *adapter)
 
 	if (!adapter->have_msi)
 		flags |= IRQF_SHARED;
-	err = request_irq(adapter->pdev->irq, &atl1c_intr, flags,
+	err = request_irq(adapter->pdev->irq, atl1c_intr, flags,
 			netdev->name, netdev);
 	if (err) {
 		if (netif_msg_ifup(adapter))
