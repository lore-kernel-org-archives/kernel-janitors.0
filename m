From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Jul 2020 13:20:17 +0000
Subject: [PATCH][next] staging: wfx: fix uninitialized variable bytes_done
Message-Id: <20200706132017.487627-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable bytes_done is not initialized and hence the first
FIFO size check on bytes_done may be breaking prematurely from
the loop if bytes_done contains a large bogus uninitialized value.
Fix this by initializing bytes_done to zero.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: a9408ad79ff3 ("staging: wfx: load the firmware faster")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wfx/fwio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/fwio.c b/drivers/staging/wfx/fwio.c
index d9a886f3e64b..206c6cf6511c 100644
--- a/drivers/staging/wfx/fwio.c
+++ b/drivers/staging/wfx/fwio.c
@@ -177,7 +177,7 @@ static int wait_ncp_status(struct wfx_dev *wdev, u32 status)
 static int upload_firmware(struct wfx_dev *wdev, const u8 *data, size_t len)
 {
 	int ret;
-	u32 offs, bytes_done;
+	u32 offs, bytes_done = 0;
 	ktime_t now, start;
 
 	if (len % DNLD_BLOCK_SIZE) {
-- 
2.27.0
