From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Aug 2011 08:01:51 +0000
Subject: [patch] [media] dib9000: return error code on failure
Message-Id: <20110806080151.GB28348@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Patrick Boettcher <patrick.boettcher@dibcom.fr>, Olivier Grenie <olivier.grenie@dibcom.fr>, "open list:MEDIA INPUT INFRA..." <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

The ret = -EIO needs to be before the goto.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/frontends/dib9000.c b/drivers/media/dvb/frontends/dib9000.c
index a085588..01e6b0c 100644
--- a/drivers/media/dvb/frontends/dib9000.c
+++ b/drivers/media/dvb/frontends/dib9000.c
@@ -1167,8 +1167,8 @@ static int dib9000_fw_get_channel(struct dvb_frontend *fe, struct dvb_frontend_p
 
 	DibAcquireLock(&state->platform.risc.mem_mbx_lock);
 	if (dib9000_fw_memmbx_sync(state, FE_SYNC_CHANNEL) < 0) {
-		goto error;
 		ret = -EIO;
+		goto error;
 	}
 
 	dib9000_risc_mem_read(state, FE_MM_R_CHANNEL_UNION,
