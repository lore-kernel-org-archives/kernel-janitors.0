From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Jul 2017 10:06:35 +0000
Subject: [PATCH] usb: storage: return on error to avoid a null pointer dereference
Message-Id: <20170706100635.16610-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

When us->extra is null the driver is not initialized, however, a
later call to osd200_scsi_to_ata is made that dereferences
us->extra, causing a null pointer dereference.  The code
currently detects and reports that the driver is not initialized;
add a return to avoid the subsequent dereference issue in this
check.

Detected by CoverityScan, CID#100308 ("Dereference after null check")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/storage/isd200.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/storage/isd200.c b/drivers/usb/storage/isd200.c
index fba4005dd737..174ad60679e7 100644
--- a/drivers/usb/storage/isd200.c
+++ b/drivers/usb/storage/isd200.c
@@ -1529,8 +1529,10 @@ static void isd200_ata_command(struct scsi_cmnd *srb, struct us_data *us)
 
 	/* Make sure driver was initialized */
 
-	if (us->extra = NULL)
+	if (us->extra = NULL) {
 		usb_stor_dbg(us, "ERROR Driver not initialized\n");
+		return;
+	}
 
 	scsi_set_resid(srb, 0);
 	/* scsi_bufflen might change in protocol translation to ata */
-- 
2.11.0

