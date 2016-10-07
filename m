From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 07 Oct 2016 19:45:05 +0000
Subject: [PATCH 1/2] [media] dvb-tc90522: Use kmalloc_array() in tc90522_master_xfer()
Message-Id: <78258072-609a-c887-11d9-7206c3e4d2a8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <906cc86f-bac0-fd47-8a6f-d3310b10fd08@users.sourceforge.net>
In-Reply-To: <906cc86f-bac0-fd47-8a6f-d3310b10fd08@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Akihiro Tsukada <tskd08@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Ira Krufky <mkrufky@linuxtv.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 7 Oct 2016 21:07:43 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/tc90522.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/tc90522.c b/drivers/media/dvb-frontends/tc90522.c
index 31cd325..c2d45f0 100644
--- a/drivers/media/dvb-frontends/tc90522.c
+++ b/drivers/media/dvb-frontends/tc90522.c
@@ -656,7 +656,7 @@ tc90522_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	for (i = 0; i < num; i++)
 		if (msgs[i].flags & I2C_M_RD)
 			rd_num++;
-	new_msgs = kmalloc(sizeof(*new_msgs) * (num + rd_num), GFP_KERNEL);
+	new_msgs = kmalloc_array(num + rd_num, sizeof(*new_msgs), GFP_KERNEL);
 	if (!new_msgs)
 		return -ENOMEM;
 
-- 
2.10.1

