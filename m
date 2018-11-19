From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Nov 2018 16:43:54 +0000
Subject: [PATCH] USB: ene_usb6250: add missing indentation
Message-Id: <20181119164354.17304-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a missing indentation before the return statement. Add it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/storage/ene_ub6250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index 4d261e4de9ad..c26129d5b943 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -1131,7 +1131,7 @@ static int ms_lib_alloc_writebuf(struct us_data *us)
 
 	ms_lib_clear_writebuf(us);
 
-return 0;
+	return 0;
 }
 
 static int ms_lib_force_setlogical_pair(struct us_data *us, u16 logblk, u16 phyblk)
-- 
2.19.1
