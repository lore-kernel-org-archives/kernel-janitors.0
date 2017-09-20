From: Colin King <colin.king@canonical.com>
Date: Wed, 20 Sep 2017 21:19:57 +0000
Subject: [PATCH] staging: rtl8723bs: add missing range check on id
Message-Id: <20170920211957.5232-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, Larry Finger <Larry.Finger@lwfinger.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The value of the u8 id needs to be upper bounds checked to ensure
the cam_cache array on the adapter dvobj is not indexed outside
of the allowed range of 0..TOTAL_CAM_ENTRY-1. This can currently
occur if id is >= TOTAL_CAM_ENTRY when calling write_cam_from_cache.
Fix this by adding an upper range check.

Detected by CoverityScan, CID#1428464 ("Use of untrusted scalar value")

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/os_dep/rtw_proc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
index 92277457aba4..ce1dd6f9036f 100644
--- a/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
+++ b/drivers/staging/rtl8723bs/os_dep/rtw_proc.c
@@ -311,6 +311,8 @@ static ssize_t proc_set_cam(struct file *file, const char __user *buffer, size_t
 
 		if (num < 2)
 			return count;
+		if (id >= TOTAL_CAM_ENTRY)
+			return -EINVAL;
 
 		if (strcmp("c", cmd) = 0) {
 			_clear_cam_entry(adapter, id);
-- 
2.14.1

