From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Nov 2011 08:25:24 +0000
Subject: [patch -next] [media] Staging: as102: pass device to dev_err()
Message-Id: <20111116082524.GC10264@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

We'd oops if we hit this dev_err() and also gcc complains:

drivers/staging/media/as102/as102_drv.c: In function ‘as102_dvb_register’:
drivers/staging/media/as102/as102_drv.c:223:3:
	warning: passing argument 1 of ‘dev_err’ from incompatible pointer type [enabled by default]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/as102/as102_drv.c b/drivers/staging/media/as102/as102_drv.c
index b8adfd2..beacb2c 100644
--- a/drivers/staging/media/as102/as102_drv.c
+++ b/drivers/staging/media/as102/as102_drv.c
@@ -220,7 +220,7 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 
 	ret = dvb_dmx_init(&as102_dev->dvb_dmx);
 	if (ret < 0) {
-		dev_err("%s: dvb_dmx_init() failed: %d\n", __func__, ret);
+		dev_err(dev, "%s: dvb_dmx_init() failed: %d\n", __func__, ret);
 		goto edmxinit;
 	}
 
