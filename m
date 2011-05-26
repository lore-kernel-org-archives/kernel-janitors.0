From: Dan Carpenter <error27@gmail.com>
Date: Thu, 26 May 2011 08:44:52 +0000
Subject: [patch] [media] DVB: dvb_frontend: off by one in dtv_property_dump()
Message-Id: <20110526084452.GB14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Andreas Oberritter <obi@linuxtv.org>, Arnd Bergmann <arnd@arndb.de>, Steven Toth <stoth@kernellabs.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

If the tvp->cmd = DTV_MAX_COMMAND then we read past the end of the
array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/dvb-core/dvb_frontend.c b/drivers/media/dvb/dvb-core/dvb_frontend.c
index 9827804..607e293 100644
--- a/drivers/media/dvb/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb/dvb-core/dvb_frontend.c
@@ -981,7 +981,7 @@ static void dtv_property_dump(struct dtv_property *tvp)
 {
 	int i;
 
-	if (tvp->cmd <= 0 || tvp->cmd > DTV_MAX_COMMAND) {
+	if (tvp->cmd <= 0 || tvp->cmd >= DTV_MAX_COMMAND) {
 		printk(KERN_WARNING "%s: tvp.cmd = 0x%08x undefined\n",
 			__func__, tvp->cmd);
 		return;
