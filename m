From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Jan 2013 06:41:42 +0000
Subject: [patch] qlcnic: silence false positive overflow warning
Message-Id: <20130125064141.GB4882@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jitendra Kalsaria <jitendra.kalsaria@qlogic.com>
Cc: Sony Chacko <sony.chacko@qlogic.com>, linux-driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We actually store the MAC address as well as the board_name here.  The
longest board_name is 75 characters so there is more than enough room
to hold the 17 character MAC and the ": " divider.  But making this
buffer larger silences a static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not sure if this is worth sending.  Feel free to drop this if you
want.

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index 7f63b5f..09870d4 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -1724,7 +1724,7 @@ qlcnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct qlcnic_adapter *adapter = NULL;
 	struct qlcnic_hardware_context *ahw;
 	int err, pci_using_dac = -1;
-	char board_name[QLCNIC_MAX_BOARD_NAME_LEN];
+	char board_name[QLCNIC_MAX_BOARD_NAME_LEN + 19]; /* MAC + ": " + name */
 
 	err = pci_enable_device(pdev);
 	if (err)
