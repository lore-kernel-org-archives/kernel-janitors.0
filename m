From: Colin King <colin.king@canonical.com>
Date: Wed, 09 Oct 2019 09:46:02 +0000
Subject: [PATCH][next] staging: wfx: fix swapped arguments in memset call
Message-Id: <20191009094602.19663-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The memset appears to have the 2nd and 3rd arguments in the wrong
order, fix this by swapping these around into the correct order.

Addresses-Coverity: ("Memset fill truncated")
Fixes: 4f8b7fabb15d ("staging: wfx: allow to send commands to chip")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wfx/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wfx/debug.c b/drivers/staging/wfx/debug.c
index 8de16ad7c710..761ad9b4f27e 100644
--- a/drivers/staging/wfx/debug.c
+++ b/drivers/staging/wfx/debug.c
@@ -226,7 +226,7 @@ static ssize_t wfx_send_hif_msg_write(struct file *file, const char __user *user
 	// wfx_cmd_send() chekc that reply buffer is wide enough, but do not
 	// return precise length read. User have to know how many bytes should
 	// be read. Filling reply buffer with a memory pattern may help user.
-	memset(context->reply, sizeof(context->reply), 0xFF);
+	memset(context->reply, 0xFF, sizeof(context->reply));
 	request = memdup_user(user_buf, count);
 	if (IS_ERR(request))
 		return PTR_ERR(request);
-- 
2.20.1
