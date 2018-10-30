From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Oct 2018 14:15:43 +0000
Subject: [PATCH] uwb: clean an indentation issue, remove extraneous tab
Message-Id: <20181030141543.3440-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue, remove tab

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/uwb/i1480/dfu/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uwb/i1480/dfu/usb.c b/drivers/uwb/i1480/dfu/usb.c
index c0430a41e24b..b1b466cbc33e 100644
--- a/drivers/uwb/i1480/dfu/usb.c
+++ b/drivers/uwb/i1480/dfu/usb.c
@@ -309,7 +309,7 @@ int i1480_usb_cmd(struct i1480 *i1480, const char *cmd_name, size_t cmd_size)
 	if (result < 0) {
 		dev_err(dev, "%s: cannot submit NEEP read: %d\n",
 			cmd_name, result);
-			goto error_submit_ep1;
+		goto error_submit_ep1;
 	}
 	/* Now post the command on EP0 */
 	result = usb_control_msg(
-- 
2.19.1
