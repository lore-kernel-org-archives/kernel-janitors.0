From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 16 Jul 2010 16:13:02 +0000
Subject: [PATCH 03/15] arch/tile: check kmalloc() result
Message-Id: <1279296783-24863-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Chris Metcalf <cmetcalf@tilera.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

If kmalloc() fails exit with -ENOMEM.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/tile/kernel/hardwall.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/tile/kernel/hardwall.c b/arch/tile/kernel/hardwall.c
index 7bf0627..584b965 100644
--- a/arch/tile/kernel/hardwall.c
+++ b/arch/tile/kernel/hardwall.c
@@ -364,6 +364,8 @@ static struct hardwall_info *hardwall_create(
 	/* Allocate a new rectangle optimistically. */
 	rect = kmalloc(sizeof(struct hardwall_info),
 			GFP_KERNEL | __GFP_ZERO);
+	if (rect = NULL)
+		return ERR_PTR(-ENOMEM);
 	INIT_LIST_HEAD(&rect->task_head);
 
 	/* Compute the rectangle size and validate that it's plausible. */
-- 
1.7.0.4

