From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 25 Apr 2019 02:36:47 +0000
Subject: [PATCH -next] HID: logitech-dj: check return value of hid_hw_raw_request()
Message-Id: <20190425023647.67463-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hid_hw_raw_request may fails, we should return the
return value to callers.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/hid/hid-logitech-dj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 64e68ac871cb..a3e94f15213a 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1131,7 +1131,7 @@ static int logi_dj_recv_query_hidpp_devices(struct dj_receiver_dev *djrcv_dev)
 				    HID_REQ_SET_REPORT);
 
 	kfree(hidpp_report);
-	return 0;
+	return retval;
 }
 
 static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
