From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 29 Sep 2016 09:16:17 +0000
Subject: [PATCH 08/10] dm snapshot: Delete an unnecessary variable initialisation in remove_single_exception_
Message-Id: <e0fe796f-5588-8341-8905-2374de777390@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <080668d9-1e1e-e208-f9ea-ff718e8070e5@users.sourceforge.net>
In-Reply-To: <080668d9-1e1e-e208-f9ea-ff718e8070e5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@redhat.com, linux-raid@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 29 Sep 2016 09:06:37 +0200

The local variable "b" will be set to an appropriate pointer a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/dm-snap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 1d90131..4966584 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -904,7 +904,7 @@ static void flush_bios(struct bio *bio);
 
 static int remove_single_exception_chunk(struct dm_snapshot *s)
 {
-	struct bio *b = NULL;
+	struct bio *b;
 	int r;
 	chunk_t old_chunk = s->first_merging_chunk + s->num_merging_chunks - 1;
 
-- 
2.10.0

