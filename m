From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Feb 2019 13:49:21 +0000
Subject: [PATCH] tools: ffs-aio-example: fix uninitialized boolean variable 'ready'
Message-Id: <20190211134921.11975-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Baldyga <r.baldyga@samsung.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The boolean variable is uninitialized and is only set if file
descriptor ep0 is ready. Fix this by ensuring the variable is
initialized by setting it to false.

Fixes: b34e08d5c706 ("tools: usb: aio example applications")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/usb/ffs-aio-example/multibuff/device_app/aio_multibuff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/usb/ffs-aio-example/multibuff/device_app/aio_multibuff.c b/tools/usb/ffs-aio-example/multibuff/device_app/aio_multibuff.c
index aaca1f44e788..1dda6e816b3c 100644
--- a/tools/usb/ffs-aio-example/multibuff/device_app/aio_multibuff.c
+++ b/tools/usb/ffs-aio-example/multibuff/device_app/aio_multibuff.c
@@ -246,7 +246,7 @@ int main(int argc, char *argv[])
 
 	struct io_buffer iobuf[2];
 	int actual = 0;
-	bool ready;
+	bool ready = false;
 
 	if (argc != 2) {
 		printf("ffs directory not specified!\n");
-- 
2.20.1
