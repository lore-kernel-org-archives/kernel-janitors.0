From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jan 2013 08:14:10 +0000
Subject: [patch v2] qlcnic: silence false positive overflow warning
Message-Id: <20130131081410.GA14542@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127.203851.2157088853751625559.davem@davemloft.net>
In-Reply-To: <20130127.203851.2157088853751625559.davem@davemloft.net>
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
Acked-By: Jitendra Kalsaria <jitendra.kalsaria@qlogic.com>
---
v2: Rebased on current net-next.

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index f3deef0..6a59a11 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -1813,7 +1813,7 @@ qlcnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct qlcnic_hardware_context *ahw;
 	int err, pci_using_dac = -1;
 	u32 capab2;
-	char board_name[QLCNIC_MAX_BOARD_NAME_LEN];
+	char board_name[QLCNIC_MAX_BOARD_NAME_LEN + 19]; /* MAC + ": " + name */
 
 	err = pci_enable_device(pdev);
 	if (err)
