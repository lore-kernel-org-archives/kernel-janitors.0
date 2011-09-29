From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Sep 2011 06:10:06 +0000
Subject: [patch] [media] dib9000: release a lock on error
Message-Id: <20110929061006.GB4104@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Patrick Boettcher <Patrick.Boettcher@dibcom.fr>, Olivier Grenie <olivier.grenie@dibcom.fr>, Jesper Juhl <jj@chaosbits.net>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This lock should be released as well on the error path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb/frontends/dib9000.c b/drivers/media/dvb/frontends/dib9000.c
index e276b11..660f806 100644
--- a/drivers/media/dvb/frontends/dib9000.c
+++ b/drivers/media/dvb/frontends/dib9000.c
@@ -2169,6 +2169,7 @@ static int dib9000_read_ber(struct dvb_frontend *fe, u32 * ber)
 	DibAcquireLock(&state->demod_lock);
 	DibAcquireLock(&state->platform.risc.mem_mbx_lock);
 	if (dib9000_fw_memmbx_sync(state, FE_SYNC_CHANNEL) < 0) {
+		DibReleaseLock(&state->platform.risc.mem_mbx_lock);
 		ret = -EIO;
 		goto error;
 	}
