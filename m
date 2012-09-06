From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 15:23:59 +0000
Subject: [PATCH 2/14] drivers/media/platform/soc_camera/mx2_camera.c: fix error return code
Message-Id: <1346945041-26676-12-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}

// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/media/platform/soc_camera/mx2_camera.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/soc_camera/mx2_camera.c b/drivers/media/platform/soc_camera/mx2_camera.c
index 256187f..f8884a7 100644
--- a/drivers/media/platform/soc_camera/mx2_camera.c
+++ b/drivers/media/platform/soc_camera/mx2_camera.c
@@ -1800,13 +1800,16 @@ static int __devinit mx2_camera_probe(struct platform_device *pdev)
 
 		if (!res_emma || !irq_emma) {
 			dev_err(&pdev->dev, "no EMMA resources\n");
+			err = -ENODEV;
 			goto exit_free_irq;
 		}
 
 		pcdev->res_emma = res_emma;
 		pcdev->irq_emma = irq_emma;
-		if (mx27_camera_emma_init(pcdev))
+		if (mx27_camera_emma_init(pcdev)) {
+			err = -ENODEV;
 			goto exit_free_irq;
+		}
 	}
 
 	pcdev->soc_host.drv_name	= MX2_CAM_DRV_NAME,

