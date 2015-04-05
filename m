From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Apr 2015 12:06:23 +0000
Subject: [PATCH 4/16] [media] as102: fix error return code
Message-Id: <1428235596-4757-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
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

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/usb/as102/as102_drv.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 8be1474..9dd7c7c 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -337,6 +337,7 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 				       &as102_dev->bus_adap,
 				       as102_dev->elna_cfg);
 	if (!as102_dev->dvb_fe) {
+		ret = -ENODEV;
 		dev_err(dev, "%s: as102_attach() failed: %d",
 		    __func__, ret);
 		goto efereg;

