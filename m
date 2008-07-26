From: Michael Borisov <niro@tut.by>
Date: Sat, 26 Jul 2008 19:45:16 +0000
Subject: [PATCH 13/14] drivers/isdn/hisax/w6692.c: fix warning
Message-Id: <1217101516.6107.139.camel@inlin>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

This patch fixes the following compile warning:

drivers/isdn/hisax/w6692.c: In function ‘setup_w6692’:
drivers/isdn/hisax/w6692.c:1012: warning: ‘pci_find_device’ is
deprecated (declared at include/linux/pci.h:535)

Signed-off-by: Michael Borisov <niro@tut.by>
---
diff --git a/drivers/isdn/hisax/w6692.c b/drivers/isdn/hisax/w6692.c
index bb1c8dd..4f39ddd 100644
--- a/drivers/isdn/hisax/w6692.c
+++ b/drivers/isdn/hisax/w6692.c
@@ -1009,7 +1009,7 @@ setup_w6692(struct IsdnCard *card)
 		return (0);
 
 	while (id_list[id_idx].vendor_id) {
-		dev_w6692 = pci_find_device(id_list[id_idx].vendor_id,
+		dev_w6692 = pci_get_device(id_list[id_idx].vendor_id,
 					    id_list[id_idx].device_id,
 					    dev_w6692);
 		if (dev_w6692) {


