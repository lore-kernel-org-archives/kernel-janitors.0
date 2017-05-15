From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:16:04 +0000
Subject: [PATCH 3/6] PNP: Improve a size determination in pnp_clone_dependent_set()
Message-Id: <2a61f08a-54f2-c8c9-1aa0-4cc9b51715db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
In-Reply-To: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:52:26 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pnp/quirks.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pnp/quirks.c b/drivers/pnp/quirks.c
index d28e3ab9479c..215a50723243 100644
--- a/drivers/pnp/quirks.c
+++ b/drivers/pnp/quirks.c
@@ -155,6 +155,5 @@ static struct pnp_option *pnp_clone_dependent_set(struct pnp_dev *dev,
 	list_for_each_entry(option, &dev->options, list) {
 		if (pnp_option_is_dependent(option) &&
 		    pnp_option_set(option) = set) {
-			new_option = kmalloc(sizeof(struct pnp_option),
-					     GFP_KERNEL);
+			new_option = kmalloc(sizeof(*new_option), GFP_KERNEL);
 			if (!new_option) {
-- 
2.13.0

