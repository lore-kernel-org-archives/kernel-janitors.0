From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 12:49:05 +0000
Subject: [PATCH 2/2] media: vimc: constify structures stored in fields of v4l2_subdev_ops structure
Message-Id: <1540644545-26184-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540644545-26184-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540644545-26184-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helen Koike <helen.koike@collabora.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The fields of a v4l2_subdev_ops structure are all const, so the
structures that are stored there and are not used elsewhere can be
const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/platform/vimc/vimc-sensor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/vimc/vimc-sensor.c b/drivers/media/platform/vimc/vimc-sensor.c
index edf4c85ae63d..32ca9c6172b1 100644
--- a/drivers/media/platform/vimc/vimc-sensor.c
+++ b/drivers/media/platform/vimc/vimc-sensor.c
@@ -286,7 +286,7 @@ static int vimc_sen_s_stream(struct v4l2_subdev *sd, int enable)
 	return 0;
 }
 
-static struct v4l2_subdev_core_ops vimc_sen_core_ops = {
+static const struct v4l2_subdev_core_ops vimc_sen_core_ops = {
 	.log_status = v4l2_ctrl_subdev_log_status,
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
