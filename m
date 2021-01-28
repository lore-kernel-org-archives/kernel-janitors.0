From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jan 2021 09:36:17 +0000
Subject: [PATCH] Input: sur40 - Fix an error code in sur40_probe()
Message-Id: <YBKFkbATXa5fA3xj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Echtler <floe@butterbrot.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

If v4l2_ctrl_handler_setup() fails then probe() should return an error
code instead of returning success.

Fixes: cee1e3e2ef39 ("media: add video control handlers using V4L2 control framework")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/touchscreen/sur40.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 620cdd7d214a..12f2562b0141 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -787,6 +787,7 @@ static int sur40_probe(struct usb_interface *interface,
 		dev_err(&interface->dev,
 			"Unable to register video controls.");
 		v4l2_ctrl_handler_free(&sur40->hdl);
+		error = sur40->hdl.error;
 		goto err_unreg_v4l2;
 	}
 
-- 
2.29.2
