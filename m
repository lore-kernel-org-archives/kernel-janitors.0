From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Thu, 22 May 2014 20:11:06 +0000
Subject: [PATCH] ioat: Use time_before()
Message-Id: <1400789466-11156-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: vinod.koul@intel.com
Cc: dan.j.williams@intel.com, b.zolnierkie@samsung.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are modi=
fied
to use time_before() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/dma/ioat/dma_v2.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ioat/dma_v2.c b/drivers/dma/ioat/dma_v2.c
index 8d10580..fdd60c7 100644
--- a/drivers/dma/ioat/dma_v2.c
+++ b/drivers/dma/ioat/dma_v2.c
@@ -735,7 +735,8 @@ int ioat2_check_space_lock(struct ioat2_dma_chan *ioat,=
 int num_descs)
 	 * called under bh_disabled so we need to trigger the timer
 	 * event directly
 	 */
-	if (jiffies > chan->timer.expires && timer_pending(&chan->timer)) {
+	if (time_before(chan->timer.expires, jiffies)
+	    && timer_pending(&chan->timer)) {
 		struct ioatdma_device *device =3D chan->device;
=20
 		mod_timer(&chan->timer, jiffies + COMPLETION_TIMEOUT);
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
