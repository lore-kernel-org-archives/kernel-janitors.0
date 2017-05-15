From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:22:00 +0000
Subject: [PATCH 6/6] PNP: Delete an error message for a failed memory allocation in quirk_awe32_add_ports()
Message-Id: <72ac25c7-93b8-49ad-bdb2-173aa2863aba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
In-Reply-To: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 20:36:35 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pnp/quirks.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pnp/quirks.c b/drivers/pnp/quirks.c
index f9be5f3fb7ea..ae7fbf105e0a 100644
--- a/drivers/pnp/quirks.c
+++ b/drivers/pnp/quirks.c
@@ -33,8 +33,5 @@ static void quirk_awe32_add_ports(struct pnp_dev *dev,
-	if (!new_option) {
-		dev_err(&dev->dev, "couldn't add ioport region to option set "
-			"%d\n", pnp_option_set(option));
+	if (!new_option)
 		return;
-	}
 
 	*new_option = *option;
 	new_option->u.port.min += offset;
-- 
2.13.0

