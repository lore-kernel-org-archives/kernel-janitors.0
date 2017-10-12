From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Oct 2017 15:47:14 +0000
Subject: [PATCH] agp: fix clang warning on unread variable num_segments
Message-Id: <20171012154714.30666-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently variable num_segments is being assigned but never actually
used.  Fix this actually using it in the for-loop. Also clean up the
code a little by assigning num_segments at declaration time.

Cleans up clang warning: Value stored to 'num_segments' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/agp/frontend.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
index f6955888e676..6476beba43b0 100644
--- a/drivers/char/agp/frontend.c
+++ b/drivers/char/agp/frontend.c
@@ -102,16 +102,15 @@ agp_segment_priv *agp_find_seg_in_client(const struct agp_client *client,
 					    int size, pgprot_t page_prot)
 {
 	struct agp_segment_priv *seg;
-	int num_segments, i;
+	int i, num_segments = client->num_segments;
 	off_t pg_start;
 	size_t pg_count;
 
 	pg_start = offset / 4096;
 	pg_count = size / 4096;
 	seg = *(client->segments);
-	num_segments = client->num_segments;
 
-	for (i = 0; i < client->num_segments; i++) {
+	for (i = 0; i < num_segments; i++) {
 		if ((seg[i].pg_start = pg_start) &&
 		    (seg[i].pg_count = pg_count) &&
 		    (pgprot_val(seg[i].prot) = pgprot_val(page_prot))) {
-- 
2.14.1

