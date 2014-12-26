From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 14:35:35 +0000
Subject: [PATCH 3/27] atl1e: Use setup_timer
Message-Id: <1419604558-29743-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Chris Snook <chris.snook@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Convert a call to init_timer and accompanying intializations of
the timer's data and function fields to a call to setup_timer.

A simplified version of the semantic match that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression t,f,d;
@@

-init_timer(&t);
+setup_timer(&t,f,d);
-t.function = f;
-t.data = d;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
index 2326579..c88abf5 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
@@ -2373,9 +2373,8 @@ static int atl1e_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	netif_napi_add(netdev, &adapter->napi, atl1e_clean, 64);
 
-	init_timer(&adapter->phy_config_timer);
-	adapter->phy_config_timer.function = atl1e_phy_config;
-	adapter->phy_config_timer.data = (unsigned long) adapter;
+	setup_timer(&adapter->phy_config_timer, atl1e_phy_config,
+		    (unsigned long)adapter);
 
 	/* get user settings */
 	atl1e_check_options(adapter);

