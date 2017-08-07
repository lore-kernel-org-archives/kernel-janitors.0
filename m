From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 07 Aug 2017 19:02:32 +0000
Subject: [PATCH] [media] vs6624: constify vs6624_default_fmt
Message-Id: <1502132552-2131-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Jiang <scott.jiang.linux@gmail.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, adi-buildroot-devel@lists.sourceforge.net, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The structure vs6624_default_fmt is only copied into another
structure field, so it can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/i2c/vs6624.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vs6624.c b/drivers/media/i2c/vs6624.c
index f0741ab..5607382 100644
--- a/drivers/media/i2c/vs6624.c
+++ b/drivers/media/i2c/vs6624.c
@@ -58,7 +58,7 @@ struct vs6624 {
 	},
 };
 
-static struct v4l2_mbus_framefmt vs6624_default_fmt = {
+static const struct v4l2_mbus_framefmt vs6624_default_fmt = {
 	.width = VGA_WIDTH,
 	.height = VGA_HEIGHT,
 	.code = MEDIA_BUS_FMT_UYVY8_2X8,

