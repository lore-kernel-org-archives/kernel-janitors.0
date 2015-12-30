From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 30 Dec 2015 11:11:19 +0000
Subject: [PATCH] Input: bma150 - constify bma150_cfg structure
Message-Id: <1451473879-10443-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

The bma150_cfg structure is never modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/input/misc/bma150.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
index 1d0e61d..b0d4453 100644
--- a/drivers/input/misc/bma150.c
+++ b/drivers/input/misc/bma150.c
@@ -147,7 +147,7 @@ struct bma150_data {
  * are stated and verified by Bosch Sensortec where they are configured
  * to provide a generic sensitivity performance.
  */
-static struct bma150_cfg default_cfg = {
+static const struct bma150_cfg default_cfg = {
 	.any_motion_int = 1,
 	.hg_int = 1,
 	.lg_int = 1,

