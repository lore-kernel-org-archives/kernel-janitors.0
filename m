From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Mar 2018 11:46:40 +0000
Subject: [PATCH] media: dvb-core: Check for allocation failure in dvb_module_probe()
Message-Id: <20180328114640.GA29050@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We should check if kzalloc() fails.

Fixes: 8f569c0b4e6b ("media: dvb-core: add helper functions for I2C binding")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index cf747d753a79..787fe06df217 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -953,6 +953,8 @@ struct i2c_client *dvb_module_probe(const char *module_name,
 	struct i2c_board_info *board_info;
 
 	board_info = kzalloc(sizeof(*board_info), GFP_KERNEL);
+	if (!board_info)
+		return NULL;
 
 	if (name)
 		strlcpy(board_info->type, name, I2C_NAME_SIZE);
