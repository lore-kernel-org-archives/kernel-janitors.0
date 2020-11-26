From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Nov 2020 11:49:32 +0000
Subject: [PATCH][next] media: ov2740: fix dereference before null check on pointer nvm
Message-Id: <20201126114932.1984730-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tianshu Qiu <tian.shu.qiu@intel.com>, Shawn Tu <shawnx.tu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Qingwu Zhang <qingwu.zhang@intel.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer nvm is being dereferenced before it is being null
checked.  Fix this by moving the assignments of pointers client and
ov2740 so that are after the null check hence avoiding any potential
null pointer dereferences on pointer nvm.

Fixes: 5e6fd339b68d ("media: ov2740: allow OTP data access during streaming")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/ov2740.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 99016546cbec..b41a90c2aed5 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -600,8 +600,8 @@ static void ov2740_update_pad_format(const struct ov2740_mode *mode,
 
 static int ov2740_load_otp_data(struct nvm_data *nvm)
 {
-	struct i2c_client *client = nvm->client;
-	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
+	struct i2c_client *client;
+	struct ov2740 *ov2740;
 	u32 isp_ctrl00 = 0;
 	u32 isp_ctrl01 = 0;
 	int ret;
@@ -612,6 +612,9 @@ static int ov2740_load_otp_data(struct nvm_data *nvm)
 	if (nvm->nvm_buffer)
 		return 0;
 
+	client = nvm->client;
+	ov2740 = to_ov2740(i2c_get_clientdata(client));
+
 	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
 	if (!nvm->nvm_buffer)
 		return -ENOMEM;
-- 
2.29.2
