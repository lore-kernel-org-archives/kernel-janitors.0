From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:25:26 +0000
Subject: [PATCH 17] drivers/md/dm-path-selector.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311925.26938.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/md/dm-path-selector.c | 2666 -> 2636 (-30 bytes)
 drivers/md/dm-path-selector.o | 101207 -> 101031 (-176 bytes)

 drivers/md/dm-path-selector.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/md/dm-path-selector.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/md/dm-path-selector.c	2007-07-31 11:26:53.000000000 +0200
@@ -94,12 +94,11 @@ out:

 static struct ps_internal *_alloc_path_selector(struct path_selector_type *pst)
 {
-	struct ps_internal *psi = kmalloc(sizeof(*psi), GFP_KERNEL);
-
-	if (psi) {
-		memset(psi, 0, sizeof(*psi));
+	struct ps_internal *psi;
+
+	psi = kzalloc(sizeof(*psi), GFP_KERNEL);
+	if (psi)
 		psi->pst = *pst;
-	}

 	return psi;
 }
