From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2011 08:48:47 +0000
Subject: [patch] [media] xc5000: unlock on error in
Message-Id: <20111130084847.GH6268@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Eddi De Pieri <eddi@depieri.net>, "Igor M. Liplianin" <liplianin@netup.ru>, "Beholder Intl. Ltd. Dmitry Belimov" <d.belimov@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently added locking to this function, but we missed an error path
which needs an unlock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/common/tuners/xc5000.c b/drivers/media/common/tuners/xc5000.c
index 048f489..a3fcc59 100644
--- a/drivers/media/common/tuners/xc5000.c
+++ b/drivers/media/common/tuners/xc5000.c
@@ -1009,7 +1009,7 @@ static int xc_load_fw_and_init_tuner(struct dvb_frontend *fe)
 	if (xc5000_is_firmware_loaded(fe) != XC_RESULT_SUCCESS) {
 		ret = xc5000_fwupload(fe);
 		if (ret != XC_RESULT_SUCCESS)
-			return ret;
+			goto out;
 	}
 
 	/* Start the tuner self-calibration process */
@@ -1025,6 +1025,7 @@ static int xc_load_fw_and_init_tuner(struct dvb_frontend *fe)
 	/* Default to "CABLE" mode */
 	ret |= xc_write_reg(priv, XREG_SIGNALSOURCE, XC_RF_MODE_CABLE);
 
+out:
 	mutex_unlock(&xc5000_list_mutex);
 
 	return ret;
