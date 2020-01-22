From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jan 2020 23:44:37 +0000
Subject: [PATCH] usb: cdns3: fix spelling mistake and rework grammar in text
Message-Id: <20200122234437.2829803-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The text contains a spelling mistake, "to" should be "too"
so fix this and re-work the grammar to make it more readable.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/debug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/debug.h b/drivers/usb/cdns3/debug.h
index 2c9afbfe988b..a5c6a29e1340 100644
--- a/drivers/usb/cdns3/debug.h
+++ b/drivers/usb/cdns3/debug.h
@@ -140,7 +140,7 @@ static inline char *cdns3_dbg_ring(struct cdns3_endpoint *priv_ep,
 		trb_per_sector = TRBS_PER_SEGMENT;
 
 	if (trb_per_sector > TRBS_PER_SEGMENT) {
-		sprintf(str + ret, "\t\tTo big transfer ring %d\n",
+		sprintf(str + ret, "\t\tTransfer ring %d too big\n",
 			trb_per_sector);
 		return str;
 	}
-- 
2.24.0
