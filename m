From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Aug 2019 17:33:14 +0000
Subject: [PATCH] USB: storage: isd200: remove redundant assignment to variable sendToTransport
Message-Id: <20190809173314.4623-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable sendToTransport is being initialized with a value that is
never read and is being re-assigned a little later on. The assignment
is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/storage/isd200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/isd200.c b/drivers/usb/storage/isd200.c
index 2b474d60b4db..28e1128d53a4 100644
--- a/drivers/usb/storage/isd200.c
+++ b/drivers/usb/storage/isd200.c
@@ -1511,7 +1511,7 @@ static int isd200_Initialization(struct us_data *us)
 
 static void isd200_ata_command(struct scsi_cmnd *srb, struct us_data *us)
 {
-	int sendToTransport = 1, orig_bufflen;
+	int sendToTransport, orig_bufflen;
 	union ata_cdb ataCdb;
 
 	/* Make sure driver was initialized */
-- 
2.20.1
