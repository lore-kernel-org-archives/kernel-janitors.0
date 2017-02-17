From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Feb 2017 16:17:30 +0000
Subject: [PATCH] [media] Staging: media/lirc: don't call put_ir_rx on rx twice
Message-Id: <20170217161730.31908-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarod Wilson <jarod@wilsonet.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mihaela Muraru <mihaela.muraru21@gmail.com>, RitwikGopi <ritwikgopi@gmail.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an exit path where rx is kfree'd on put_ir_rx and then
a jump to label out_put_xx will again kfree it with another
call to put_ir_rx.  Fix this by adding a new label that avoids
this 2nd call to put_ir_rx for this specific case.

Detected with CoverityScan, CID#145119 ("Use after free")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/lirc/lirc_zilog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/lirc/lirc_zilog.c b/drivers/staging/media/lirc/lirc_zilog.c
index 34aac3e..5dd1e62 100644
--- a/drivers/staging/media/lirc/lirc_zilog.c
+++ b/drivers/staging/media/lirc/lirc_zilog.c
@@ -1597,7 +1597,7 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
 			i2c_set_clientdata(client, NULL);
 			put_ir_rx(rx, true);
 			ir->l.features &= ~LIRC_CAN_REC_LIRCCODE;
-			goto out_put_xx;
+			goto out_put_tx;
 		}
 
 		/* Proceed only if the Tx client is also ready */
@@ -1637,6 +1637,7 @@ static int ir_probe(struct i2c_client *client, const struct i2c_device_id *id)
 out_put_xx:
 	if (rx != NULL)
 		put_ir_rx(rx, true);
+out_put_tx:
 	if (tx != NULL)
 		put_ir_tx(tx, true);
 out_put_ir:
-- 
2.10.2

