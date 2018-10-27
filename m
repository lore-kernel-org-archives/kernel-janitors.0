From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 12:16:40 +0000
Subject: [PATCH 2/2] media: ov5645: constify v4l2_ctrl_ops structure
Message-Id: <1540642600-25840-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540642600-25840-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540642600-25840-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The v4l2_ctrl_ops structure is only passed as the second argument to
functions such as v4l2_ctrl_new_std for which the corresponding
parameter is const, so make the v4l2_ctrl_ops structure const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/i2c/ov5645.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -886,7 +886,7 @@ static int ov5645_s_ctrl(struct v4l2_ctr
 	return ret;
 }
 
-static struct v4l2_ctrl_ops ov5645_ctrl_ops = {
+static const struct v4l2_ctrl_ops ov5645_ctrl_ops = {
 	.s_ctrl = ov5645_s_ctrl,
 };
 
