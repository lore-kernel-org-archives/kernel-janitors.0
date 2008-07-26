From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:45:02 +0000
Subject: [PATCH 8/14] drivers/isdn/hisax/hfc_pci.c: fix warning
Message-Id: <1217101502.6107.134.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/hfc_pci.c: In function ‘setup_hfcpci’:
drivers/isdn/hisax/hfc_pci.c:1661: warning: ‘pci_find_device’ is
deprecated (declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/hfc_pci.c b/drivers/isdn/hisax/hfc_pci.c
index f126566..64b9dc8 100644
--- a/drivers/isdn/hisax/hfc_pci.c
+++ b/drivers/isdn/hisax/hfc_pci.c
@@ -1658,7 +1658,7 @@ setup_hfcpci(struct IsdnCard *card)
 
 	i = 0;
 	while (id_list[i].vendor_id) {
-		tmp_hfcpci = pci_find_device(id_list[i].vendor_id,
+		tmp_hfcpci = pci_get_device(id_list[i].vendor_id,
 					     id_list[i].device_id,
 					     dev_hfcpci);
 		i++;


