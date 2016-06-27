From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jun 2016 14:29:46 +0000
Subject: [patch] [media] dvb-usb: silence an uninitialized variable warning
Message-Id: <20160627142946.GA19889@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that if adap->props.num_frontends is 0 then
"ret" is uninitialized.  I don't think that can happen.  But "ret" is
always zero here so we can just remove the condition.

This extra check was added in commit 0d3ab8410dcb ('[media] dvb core:
must check dvb_create_media_graph()').

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
index 6477b04..a04c0a2 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
@@ -320,8 +320,6 @@ int dvb_usb_adapter_frontend_init(struct dvb_usb_adapter *adap)
 
 		adap->num_frontends_initialized++;
 	}
-	if (ret)
-		return ret;
 
 	ret = dvb_create_media_graph(&adap->dvb_adap, true);
 	if (ret)
