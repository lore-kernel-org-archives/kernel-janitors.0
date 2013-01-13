From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 13 Jan 2013 19:31:33 +0000
Subject: [media] tuners/xc5000: fix MODE_AIR in xc5000_set_params()
Message-Id: <20130113193133.GA5907@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Michael Krufky <mkrufky@kernellabs.com>, Devin Heitmueller <dheitmueller@kernellabs.com>, Tim Gardner <tim.gardner@canonical.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing break so we use XC_RF_MODE_CABLE instead of
XC_RF_MODE_AIR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Untested.

diff --git a/drivers/media/tuners/xc5000.c b/drivers/media/tuners/xc5000.c
index dc93cf3..d6be1b6 100644
--- a/drivers/media/tuners/xc5000.c
+++ b/drivers/media/tuners/xc5000.c
@@ -785,6 +785,7 @@ static int xc5000_set_params(struct dvb_frontend *fe)
 			return -EINVAL;
 		}
 		priv->rf_mode = XC_RF_MODE_AIR;
+		break;
 	case SYS_DVBC_ANNEX_A:
 	case SYS_DVBC_ANNEX_C:
 		dprintk(1, "%s() QAM modulation\n", __func__);
