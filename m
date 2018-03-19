From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Mar 2018 14:57:11 +0000
Subject: [PATCH] qede:  fix spelling mistake: "registeration" -> "registration"
Message-Id: <20180319145711.6591-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistakes in DP_ERR error message text and
comments

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qede/qede_main.c | 4 ++--
 drivers/net/ethernet/qlogic/qede/qede_ptp.c  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qede/qede_main.c b/drivers/net/ethernet/qlogic/qede/qede_main.c
index 5c28209e97d0..a01e7d6e5442 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_main.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_main.c
@@ -288,7 +288,7 @@ int __init qede_init(void)
 	}
 
 	/* Must register notifier before pci ops, since we might miss
-	 * interface rename after pci probe and netdev registeration.
+	 * interface rename after pci probe and netdev registration.
 	 */
 	ret = register_netdevice_notifier(&qede_netdev_notifier);
 	if (ret) {
@@ -988,7 +988,7 @@ static int __qede_probe(struct pci_dev *pdev, u32 dp_module, u8 dp_level,
 	if (rc)
 		goto err3;
 
-	/* Prepare the lock prior to the registeration of the netdev,
+	/* Prepare the lock prior to the registration of the netdev,
 	 * as once it's registered we might reach flows requiring it
 	 * [it's even possible to reach a flow needing it directly
 	 * from there, although it's unlikely].
diff --git a/drivers/net/ethernet/qlogic/qede/qede_ptp.c b/drivers/net/ethernet/qlogic/qede/qede_ptp.c
index 9b2280badaf7..02adb513f475 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_ptp.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_ptp.c
@@ -485,7 +485,7 @@ int qede_ptp_enable(struct qede_dev *edev, bool init_tc)
 	ptp->clock = ptp_clock_register(&ptp->clock_info, &edev->pdev->dev);
 	if (IS_ERR(ptp->clock)) {
 		rc = -EINVAL;
-		DP_ERR(edev, "PTP clock registeration failed\n");
+		DP_ERR(edev, "PTP clock registration failed\n");
 		goto err2;
 	}
 
-- 
2.15.1

