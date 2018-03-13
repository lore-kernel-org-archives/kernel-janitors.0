From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Tue, 13 Mar 2018 06:09:15 +0000
Subject: [PATCH] staging: rtl8723bs: core: rtw_cmd: remove unnecessary initialization
Message-Id: <1520921355-31348-1-git-send-email-ji_hun.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180313060927epcas1p4a11e5ed88c7760b5a54b5c2bdf753b66@epcas1p4.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: julia.lawall@lip6.fr, shreeya.patel23498@gmail.com, arnd@arndb.de, himanshujha199640@gmail.com, joe@perches.com, hdegoede@redhat.com, srishtishar@gmail.com, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ji-Hun Kim <ji_hun.kim@samsung.com>

Clean up checkpatch error:
ERROR: do not initialise globals to 0

Signed-off-by: Ji-Hun Kim <ji_hun.kim@samsung.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index af0a9e0..9e132f9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1742,7 +1742,7 @@ u8 rtw_ps_cmd(struct adapter *padapter)
 	return res;
 }
 
-u32 g_wait_hiq_empty = 0;
+u32 g_wait_hiq_empty;
 
 static void rtw_chk_hi_queue_hdl(struct adapter *padapter)
 {
-- 
1.9.1

