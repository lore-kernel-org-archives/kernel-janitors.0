From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:12:26 +0000
Subject: [PATCH 1/6] PNP: Delete an error message for a failed memory allocation in pnp_alloc()
Message-Id: <8e1a8099-5f0b-d8f4-d039-7c3ecdf8b508@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
In-Reply-To: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 19:35:29 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pnp/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pnp/core.c b/drivers/pnp/core.c
index b54620e53830..27945a2d9c4e 100644
--- a/drivers/pnp/core.c
+++ b/drivers/pnp/core.c
@@ -35,10 +35,8 @@ void *pnp_alloc(long size)
 	void *result;
 
 	result = kzalloc(size, GFP_KERNEL);
-	if (!result) {
-		printk(KERN_ERR "pnp: Out of Memory\n");
+	if (!result)
 		return NULL;
-	}
 	return result;
 }
 
-- 
2.13.0

