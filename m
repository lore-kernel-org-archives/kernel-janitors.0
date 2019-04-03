From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Apr 2019 07:13:51 +0000
Subject: [PATCH 2/2 net] nfc: nci: Potential off by one in ->pipes[] array
Message-Id: <20190403071351.GB5758@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190403071248.GA5758@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Christophe Ricard <christophe.ricard@gmail.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org

This is similar to commit e285d5bfb7e9 ("NFC: Fix the number of pipes")
where we changed NFC_HCI_MAX_PIPES from 127 to 128.

As the comment next to the define explains, the pipe identifier is 7
bits long.  The highest possible pipe is 127, but the number of possible
pipes is 128.  As the code is now, then there is potential for an
out of bounds array access:

    net/nfc/nci/hci.c:297 nci_hci_cmd_received() warn: array off by one?
    'ndev->hci_dev->pipes[pipe]' '0-127 = 127'

Fixes: 11f54f228643 ("NFC: nci: Add HCI over NCI protocol support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 include/net/nfc/nci_core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 87499b6b35d6..df5c69db68af 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -166,7 +166,7 @@ struct nci_conn_info {
  * According to specification 102 622 chapter 4.4 Pipes,
  * the pipe identifier is 7 bits long.
  */
-#define NCI_HCI_MAX_PIPES          127
+#define NCI_HCI_MAX_PIPES          128
 
 struct nci_hci_gate {
 	u8 gate;
-- 
2.17.1
