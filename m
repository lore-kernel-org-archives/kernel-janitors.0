From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Feb 2020 14:58:44 +0000
Subject: [PATCH] media: lmedm04: remove redundant assignment to variable gate
Message-Id: <20200210145844.438478-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Malcolm Priestley <tvboxspy@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable gate is being initialized and also checked and re-assigned
with values that are never read as it is being re-assigned later in a
for-loop with a new value.  The assignments are redundant and can be
removed.

Addresses Coverity ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/dvb-usb-v2/lmedm04.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 62d3566bf7ee..fd8b42bb9a84 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -486,13 +486,10 @@ static int lme2510_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
 	static u8 obuf[64], ibuf[64];
 	int i, read, read_o;
 	u16 len;
-	u8 gate = st->i2c_gate;
+	u8 gate;
 
 	mutex_lock(&d->i2c_mutex);
 
-	if (gate = 0)
-		gate = 5;
-
 	for (i = 0; i < num; i++) {
 		read_o = msg[i].flags & I2C_M_RD;
 		read = i + 1 < num && msg[i + 1].flags & I2C_M_RD;
-- 
2.25.0
