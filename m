From: Dan Carpenter <error27@gmail.com>
Date: Thu, 10 Mar 2011 08:31:33 +0000
Subject: [patch] USB: ene_ub6250: fix memory leak in ene_load_bincode()
Message-Id: <20110310083133.GL3416@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"buf" gets allocated twice in a row.  It's the second allocation which
is correct.  The first one should be removed.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index 058c5d5..08e0374 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -491,10 +491,6 @@ static int ene_load_bincode(struct us_data *us, unsigned char flag)
 	if (info->BIN_FLAG = flag)
 		return USB_STOR_TRANSPORT_GOOD;
 
-	buf = kmalloc(ENE_BIN_CODE_LEN, GFP_KERNEL);
-	if (buf = NULL)
-		return USB_STOR_TRANSPORT_ERROR;
-
 	switch (flag) {
 	/* For SD */
 	case SD_INIT1_PATTERN:
