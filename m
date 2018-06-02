From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 02 Jun 2018 07:53:58 +0000
Subject: [PATCH] drm/i2c: tda998x: remove an unecessary check
Message-Id: <20180602075358.7f63ojsndur5rzgf@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@armlinux.org.uk>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

cec_read() returns a u8 so "val" can't be negative.  If there is an
error in cec_read() then it returns zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 6ebd8842dbcc..86e3aee44686 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -436,9 +436,6 @@ static void cec_enamods(struct tda998x_priv *priv, u8 mods, bool enable)
 {
 	int val = cec_read(priv, REG_CEC_ENAMODS);
 
-	if (val < 0)
-		return;
-
 	if (enable)
 		val |= mods;
 	else
