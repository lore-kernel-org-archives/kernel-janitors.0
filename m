From: Dan Carpenter <error27@gmail.com>
Date: Wed, 19 Jan 2011 14:28:27 +0000
Subject: [patch 1/2] [media] dib9000: fix return type in
Message-Id: <20110119142827.GP2721@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Patrick Boettcher <patrick.boettcher@dibcom.fr>, Olivier Grenie <olivier.grenie@dibcom.fr>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

dib9000_mbx_send_attr() returns an int.  It doesn't work to save
negative error codes in an unsigned char, so I've made "ret" an int
type.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/frontends/dib9000.c b/drivers/media/dvb/frontends/dib9000.c
index 43fb6e4..9151876 100644
--- a/drivers/media/dvb/frontends/dib9000.c
+++ b/drivers/media/dvb/frontends/dib9000.c
@@ -486,10 +486,11 @@ static int dib9000_mbx_host_init(struct dib9000_state *state, u8 risc_id)
 #define MAX_MAILBOX_TRY 100
 static int dib9000_mbx_send_attr(struct dib9000_state *state, u8 id, u16 * data, u8 len, u16 attr)
 {
-	u8 ret = 0, *d, b[2];
+	u8 *d, b[2];
 	u16 tmp;
 	u16 size;
 	u32 i;
+	int ret = 0;
 
 	if (!state->platform.risc.fw_is_running)
 		return -EINVAL;
