From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 May 2017 08:26:22 +0000
Subject: [PATCH 2/3] zswap: Improve a size determination in zswap_frontswap_init()
Message-Id: <19f9da22-092b-f867-bdf6-f4dbad7ccf1f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05101843-91f6-3243-18ea-acac8e8ef6af@users.sourceforge.net>
In-Reply-To: <05101843-91f6-3243-18ea-acac8e8ef6af@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Dan Streetman <ddstreet@ieee.org>, Seth Jennings <sjenning@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 22:44:03 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 mm/zswap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index 18d8e87119a6..a6e67633be03 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1156,5 +1156,5 @@ static void zswap_frontswap_init(unsigned type)
 {
 	struct zswap_tree *tree;
 
-	tree = kzalloc(sizeof(struct zswap_tree), GFP_KERNEL);
+	tree = kzalloc(sizeof(*tree), GFP_KERNEL);
 	if (!tree) {
-- 
2.13.0

