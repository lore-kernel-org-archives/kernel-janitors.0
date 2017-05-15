From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:14:08 +0000
Subject: [PATCH 2/6] PNP: Improve a size determination in pnp_alloc_dev()
Message-Id: <85dba381-3e7d-7df1-9fac-458fe625d2f5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
In-Reply-To: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:45:23 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pnp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pnp/core.c b/drivers/pnp/core.c
index 27945a2d9c4e..6ccec10aed11 100644
--- a/drivers/pnp/core.c
+++ b/drivers/pnp/core.c
@@ -141,7 +141,7 @@ struct pnp_dev *pnp_alloc_dev(struct pnp_protocol *protocol, int id,
 	struct pnp_dev *dev;
 	struct pnp_id *dev_id;
 
-	dev = kzalloc(sizeof(struct pnp_dev), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return NULL;
 
-- 
2.13.0

