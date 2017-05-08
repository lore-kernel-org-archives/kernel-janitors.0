From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 07:58:53 +0000
Subject: [PATCH 3/3] block-aoe: Add spaces for better code readability
Message-Id: <4068e22e-3d11-0d57-eedf-8eb696224cfb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <705a2cf5-90fe-ec8a-95f9-a27bccbc3f3f@users.sourceforge.net>
In-Reply-To: <705a2cf5-90fe-ec8a-95f9-a27bccbc3f3f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, "Ed L. Cashin" <ed.cashin@acm.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 09:35:25 +0200

The script "checkpatch.pl" pointed information out like the following.

CHECK: spaces preferred around that '-' (ctx:VxV)

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/aoe/aoeblk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/block/aoe/aoeblk.c b/drivers/block/aoe/aoeblk.c
index a52555984e73..66adb2fb66d3 100644
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@ -87,10 +87,10 @@ static ssize_t aoedisk_show_netif(struct device *dev,
 	if (!*nd)
 		return snprintf(page, PAGE_SIZE, "none\n");
 	for (p = page; nd < ne; nd++)
-		p += snprintf(p, PAGE_SIZE - (p-page), "%s%s",
-			p = page ? "" : ",", (*nd)->name);
-	p += snprintf(p, PAGE_SIZE - (p-page), "\n");
-	return p-page;
+		p += snprintf(p, PAGE_SIZE - (p - page), "%s%s",
+			      p = page ? "" : ",", (*nd)->name);
+	p += snprintf(p, PAGE_SIZE - (p - page), "\n");
+	return p - page;
 }
 /* firmware version */
 static ssize_t aoedisk_show_fwver(struct device *dev,
-- 
2.12.2

