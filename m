From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 19:17:13 +0000
Subject: [PATCH 2/2] [media] drxd: Adjust a null pointer check in three functions
Message-Id: <7c1d8396-bd00-8656-c105-596bb47405ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <62e6221c-226c-3b25-08bb-4baff9b23cbb@users.sourceforge.net>
In-Reply-To: <62e6221c-226c-3b25-08bb-4baff9b23cbb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-media@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 20:55:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/dvb-frontends/drxd_hard.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxd_hard.c b/drivers/media/dvb-frontends/drxd_hard.c
index 47b0d37e70ba..3bdf9b1f4e7c 100644
--- a/drivers/media/dvb-frontends/drxd_hard.c
+++ b/drivers/media/dvb-frontends/drxd_hard.c
@@ -328,7 +328,7 @@ static int WriteTable(struct drxd_state *state, u8 * pTable)
 {
 	int status = 0;
 
-	if (pTable = NULL)
+	if (!pTable)
 		return 0;
 
 	while (!status) {
@@ -909,7 +909,7 @@ static int load_firmware(struct drxd_state *state, const char *fw_name)
 	}
 
 	state->microcode = kmemdup(fw->data, fw->size, GFP_KERNEL);
-	if (state->microcode = NULL) {
+	if (!state->microcode) {
 		release_firmware(fw);
 		return -ENOMEM;
 	}
@@ -2629,7 +2629,7 @@ static int DRXD_init(struct drxd_state *state, const u8 *fw, u32 fw_size)
 			break;
 
 		/* Apply I2c address patch to B1 */
-		if (!state->type_A && state->m_HiI2cPatch != NULL) {
+		if (!state->type_A && state->m_HiI2cPatch) {
 			status = WriteTable(state, state->m_HiI2cPatch);
 			if (status < 0)
 				break;
-- 
2.14.1

