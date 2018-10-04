From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Oct 2018 14:02:14 +0000
Subject: [PATCH] media: ivtv: make const array addr_list static
Message-Id: <20181004140214.20512-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Walls <awalls@md.metrocast.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The const array addr_list can be made static, saves populating it on
the stack and will make it read-only.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/ivtv/ivtv-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index 5e4e52147fb7..55ef1385519e 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -239,7 +239,7 @@ struct i2c_client *ivtv_i2c_new_ir_legacy(struct ivtv *itv)
 	 * allocations, so this function must be called after all other i2c
 	 * devices we care about are registered.
 	 */
-	const unsigned short addr_list[] = {
+	static const unsigned short addr_list[] = {
 		0x1a,	/* Hauppauge IR external - collides with WM8739 */
 		0x18,	/* Hauppauge IR internal */
 		I2C_CLIENT_END
-- 
2.17.1
