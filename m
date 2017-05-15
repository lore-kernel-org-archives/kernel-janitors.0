From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:20:10 +0000
Subject: [PATCH 5/6] PNP: Improve a size determination in quirk_awe32_add_ports()
Message-Id: <0ee3d21a-98c7-be4a-d2c6-9256622e183a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
In-Reply-To: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 20:32:12 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pnp/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pnp/quirks.c b/drivers/pnp/quirks.c
index 34e2d4563bbd..f9be5f3fb7ea 100644
--- a/drivers/pnp/quirks.c
+++ b/drivers/pnp/quirks.c
@@ -29,5 +29,5 @@ static void quirk_awe32_add_ports(struct pnp_dev *dev,
 {
 	struct pnp_option *new_option;
 
-	new_option = kmalloc(sizeof(struct pnp_option), GFP_KERNEL);
+	new_option = kmalloc(sizeof(*new_option), GFP_KERNEL);
 	if (!new_option) {
-- 
2.13.0

