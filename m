From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Oct 2019 13:33:39 +0000
Subject: [PATCH] media: flexcop-usb: ensure -EIO is returned on error condition
Message-Id: <20191025133339.26666-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An earlier commit hard coded a return 0 to function flexcop_usb_i2c_req
even though the an -EIO was intended to be returned in the case where
ret != buflen.  Fix this by replacing the return 0 with the return of
ret to return the error return code

Addresses-Coverity: ("Unused value")
Fixes: b430eaba0be5 ("[media] flexcop-usb: don't use stack for DMA")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 4bf85e9b78b8..917cf4bc08ec 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -295,7 +295,7 @@ static int flexcop_usb_i2c_req(struct flexcop_i2c_adapter *i2c,
 
 	mutex_unlock(&fc_usb->data_mutex);
 
-	return 0;
+	return ret;
 }
 
 /* actual bus specific access functions,
-- 
2.20.1
