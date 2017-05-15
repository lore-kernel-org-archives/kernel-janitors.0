From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:18:31 +0000
Subject: [PATCH 4/6] PNP: Delete an error message for a failed memory allocation in pnp_clone_dependent_set()
Message-Id: <77feb0e9-ef3b-15bb-bc0b-666c9632c9e0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
In-Reply-To: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 20:00:38 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pnp/quirks.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pnp/quirks.c b/drivers/pnp/quirks.c
index 215a50723243..34e2d4563bbd 100644
--- a/drivers/pnp/quirks.c
+++ b/drivers/pnp/quirks.c
@@ -159,8 +159,5 @@ static struct pnp_option *pnp_clone_dependent_set(struct pnp_dev *dev,
-			if (!new_option) {
-				dev_err(&dev->dev, "couldn't clone dependent "
-					"set %d\n", set);
+			if (!new_option)
 				return NULL;
-			}
 
 			*new_option = *option;
 			new_option->flags = flags;
-- 
2.13.0

