From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Jan 2020 17:11:07 +0000
Subject: [PATCH] media: drxj: remove redundant assignments to variable rc
Message-Id: <20200107171107.120294-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is never
read and it is being updated later with a new value.  The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index ac7be872f460..5de016412c42 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -2182,7 +2182,7 @@ int drxj_dap_atomic_read_reg32(struct i2c_device_addr *dev_addr,
 				     u32 *data, u32 flags)
 {
 	u8 buf[sizeof(*data)] = { 0 };
-	int rc = -EIO;
+	int rc;
 	u32 word = 0;
 
 	if (!data)
@@ -4229,7 +4229,7 @@ int drxj_dap_scu_atomic_write_reg16(struct i2c_device_addr *dev_addr,
 					  u16 data, u32 flags)
 {
 	u8 buf[2];
-	int rc = -EIO;
+	int rc;
 
 	buf[0] = (u8) (data & 0xff);
 	buf[1] = (u8) ((data >> 8) & 0xff);
-- 
2.24.0
