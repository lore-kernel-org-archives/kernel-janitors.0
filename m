From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2012 08:35:33 +0000
Subject: [patch] [media] mxl111sf: remove an unused variable
Message-Id: <20120323083532.GB18239@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>, Michael Krufky <mkrufky@linuxtv.org>
Cc: Steven Toth <stoth@kernellabs.com>, Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't use this any more after 3be5bb71fb "[media] mxl111sf: fix error
on stream stop in mxl111sf_ep6_streaming_ctrl()" and it makes GCC
complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb/dvb-usb/mxl111sf.c b/drivers/media/dvb/dvb-usb/mxl111sf.c
index 81305de..91834c5 100644
--- a/drivers/media/dvb/dvb-usb/mxl111sf.c
+++ b/drivers/media/dvb/dvb-usb/mxl111sf.c
@@ -340,7 +340,6 @@ static int mxl111sf_ep6_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
 	struct mxl111sf_state *state = d->priv;
 	struct mxl111sf_adap_state *adap_state = adap->fe_adap[adap->active_fe].priv;
 	int ret = 0;
-	u8 tmp;
 
 	deb_info("%s(%d)\n", __func__, onoff);
 
