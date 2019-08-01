From: Colin King <colin.king@canonical.com>
Date: Thu, 01 Aug 2019 16:09:58 +0000
Subject: [PATCH] media: drxj: remove redundant assignment to variable rc
Message-Id: <20190801160958.28392-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is never
read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index a6876fa48753..8716a167917a 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -4201,7 +4201,7 @@ int drxj_dap_scu_atomic_read_reg16(struct i2c_device_addr *dev_addr,
 					 u16 *data, u32 flags)
 {
 	u8 buf[2] = { 0 };
-	int rc = -EIO;
+	int rc;
 	u16 word = 0;
 
 	if (!data)
-- 
2.20.1
