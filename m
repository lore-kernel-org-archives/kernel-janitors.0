From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 11:18:31 +0000
Subject: [PATCH 3/3] HSI: omap_ssi: Delete an error message for a failed memory allocation in ssi_add_control
Message-Id: <e6102bce-0b27-68e6-8247-f87851f7f9b9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
In-Reply-To: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 12:42:14 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such a statement here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/controllers/omap_ssi_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hsi/controllers/omap_ssi_core.c b/drivers/hsi/controllers/omap_ssi_core.c
index fb7ed8fce83a..88e48b346916 100644
--- a/drivers/hsi/controllers/omap_ssi_core.c
+++ b/drivers/hsi/controllers/omap_ssi_core.c
@@ -384,10 +384,8 @@ static int ssi_add_controller(struct hsi_controller *ssi,
 	int err;
 
 	omap_ssi = devm_kzalloc(&ssi->device, sizeof(*omap_ssi), GFP_KERNEL);
-	if (!omap_ssi) {
-		dev_err(&pd->dev, "not enough memory for omap ssi\n");
+	if (!omap_ssi)
 		return -ENOMEM;
-	}
 
 	err = ida_simple_get(&platform_omap_ssi_ida, 0, 0, GFP_KERNEL);
 	if (err < 0)
-- 
2.12.2

