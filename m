From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 13:00:17 +0000
Subject: [PATCH 2/2] NFC: digital: Delete an error message for a failed memory allocation in digital_in_send(
Message-Id: <94b99b09-8f6f-3532-0738-b2edba96dd26@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7e27a76c-de7a-22ec-cf8a-31aee2000e29@users.sourceforge.net>
In-Reply-To: <7e27a76c-de7a-22ec-cf8a-31aee2000e29@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Samuel Ortiz <sameo@linux.intel.com>, Thierry Escande <thierry.escande@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 14:24:24 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/nfc/digital_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
index 3baf91f3ef80..8e02a3e1b319 100644
--- a/net/nfc/digital_core.c
+++ b/net/nfc/digital_core.c
@@ -710,7 +710,5 @@ static int digital_in_send(struct nfc_dev *nfc_dev, struct nfc_target *target,
-	if (!data_exch) {
-		pr_err("Failed to allocate data_exch struct\n");
+	if (!data_exch)
 		return -ENOMEM;
-	}
 
 	data_exch->cb = cb;
 	data_exch->cb_context = cb_context;
-- 
2.13.0

