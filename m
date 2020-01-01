From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:24 +0000
Subject: [PATCH 06/16] media: mt9v111: constify copied structure
Message-Id: <1577864614-5543-7-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The mt9v111_def_fmt structure is only copied into another structure,
so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/i2c/mt9v111.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index bb41bea950ac..61ae6a0d5679 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -103,7 +103,7 @@
 #define MT9V111_MAX_CLKIN				27000000
 
 /* The default sensor configuration at startup time. */
-static struct v4l2_mbus_framefmt mt9v111_def_fmt = {
+static const struct v4l2_mbus_framefmt mt9v111_def_fmt = {
 	.width		= 640,
 	.height		= 480,
 	.code		= MEDIA_BUS_FMT_UYVY8_2X8,
