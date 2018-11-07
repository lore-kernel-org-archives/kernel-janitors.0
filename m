From: Colin King <colin.king@canonical.com>
Date: Wed, 07 Nov 2018 10:39:32 +0000
Subject: [PATCH] staging: rtl8192u: rename struct name _rt_firmare_seg_container
Message-Id: <20181107103932.20325-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Rename struct _rt_firmare_seg_container to _fw_seg_container to match
the typedef name of this structure. Also removes the spelling mistake
of 'firmare'.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/r8192U.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r8192U.h b/drivers/staging/rtl8192u/r8192U.h
index ec4de86933ba..ec33fb9122e9 100644
--- a/drivers/staging/rtl8192u/r8192U.h
+++ b/drivers/staging/rtl8192u/r8192U.h
@@ -364,7 +364,7 @@ typedef enum _firmware_status {
 	FW_STATUS_5_READY = 5,
 } firmware_status_e;
 
-typedef struct _rt_firmare_seg_container {
+typedef struct _fw_seg_container {
 	u16	seg_size;
 	u8	*seg_ptr;
 } fw_seg_container, *pfw_seg_container;
-- 
2.19.1
