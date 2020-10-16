From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Oct 2020 22:33:03 +0000
Subject: [PATCH] staging: wfx: make a const array static, makes object smaller
Message-Id: <20201016223303.687278-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array filter_ies on the stack but instead
make it static. Makes the object code smaller by 261 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  21674	   3166	    448	  25288	   62c8	drivers/staging/wfx/sta.o

After:
   text	   data	    bss	    dec	    hex	filename
  21349	   3230	    448	  25027	   61c3	drivers/staging/wfx/sta.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wfx/sta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
index 2320a81eae0b..196779a1b89a 100644
--- a/drivers/staging/wfx/sta.c
+++ b/drivers/staging/wfx/sta.c
@@ -63,7 +63,7 @@ void wfx_suspend_hot_dev(struct wfx_dev *wdev, enum sta_notify_cmd cmd)
 
 static void wfx_filter_beacon(struct wfx_vif *wvif, bool filter_beacon)
 {
-	const struct hif_ie_table_entry filter_ies[] = {
+	static const struct hif_ie_table_entry filter_ies[] = {
 		{
 			.ie_id        = WLAN_EID_VENDOR_SPECIFIC,
 			.has_changed  = 1,
-- 
2.27.0
