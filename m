From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jun 2012 18:34:24 +0000
Subject: [patch] qlcnic: off by one in qlcnic_init_pci_info()
Message-Id: <20120614183424.GC6383@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Cc: Sony Chacko <sony.chacko@qlogic.com>, linux-driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The adapter->npars[] array has QLCNIC_MAX_PCI_FUNC elements.  We
allocate it that way a few lines earlier in the function.  So this test
is off by one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index 33c3e46..212c121 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -479,7 +479,7 @@ qlcnic_init_pci_info(struct qlcnic_adapter *adapter)
 
 	for (i = 0; i < QLCNIC_MAX_PCI_FUNC; i++) {
 		pfn = pci_info[i].id;
-		if (pfn > QLCNIC_MAX_PCI_FUNC) {
+		if (pfn >= QLCNIC_MAX_PCI_FUNC) {
 			ret = QL_STATUS_INVALID_PARAM;
 			goto err_eswitch;
 		}
