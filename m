From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Jul 2012 08:32:59 +0000
Subject: [patch 2/2] [media] tuner-xc2028: unlock on error in xc2028_get_afc()
Message-Id: <20120721083259.GB13454@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Gianluca Gennari <gennarone@gmail.com>, Thomas Meyer <thomas@m3y3r.de>, Miroslav Slugen <thunder.mmm@gmail.com>, Thierry Reding <thierry.reding@avionic-design.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to do a mutex_unlock(&priv->lock) before returning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/common/tuners/tuner-xc2028.c b/drivers/media/common/tuners/tuner-xc2028.c
index 9e60285..ea0550e 100644
--- a/drivers/media/common/tuners/tuner-xc2028.c
+++ b/drivers/media/common/tuners/tuner-xc2028.c
@@ -978,7 +978,7 @@ static int xc2028_get_afc(struct dvb_frontend *fe, s32 *afc)
 	/* Get AFC */
 	rc = xc2028_get_reg(priv, XREG_FREQ_ERROR, &afc_reg);
 	if (rc < 0)
-		return rc;
+		goto ret;
 
 	*afc = afc_reg * 15625; /* Hz */
 
