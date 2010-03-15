From: Dan Carpenter <error27@gmail.com>
Date: Mon, 15 Mar 2010 08:21:13 +0000
Subject: [patch] udf: potential integer overflow
Message-Id: <20100315082113.GC18181@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Hannes Eder <hannes@hanneseder.net>, Akinobu Mita <akinobu.mita@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

bloc->logicalBlockNum is unsigned so it's never less than zero.

When I saw that, it made me worry that "bloc->logicalBlockNum + count"
could overflow.  That's why I changed the check for less than zero
to an overflow check.  (The test works because "count" is also 
unsigned.)

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
GCC 4.1 apparently optimizes overflow checks like this away, but it should
work for other versions of gcc.  I tested with GCC 4.3.
http://www.fefe.de/intof.html

diff --git a/fs/udf/balloc.c b/fs/udf/balloc.c
index 19626e2..9a9378b 100644
--- a/fs/udf/balloc.c
+++ b/fs/udf/balloc.c
@@ -125,9 +125,8 @@ static void udf_bitmap_free_blocks(struct super_block *sb,
 
 	mutex_lock(&sbi->s_alloc_mutex);
 	partmap = &sbi->s_partmaps[bloc->partitionReferenceNum];
-	if (bloc->logicalBlockNum < 0 ||
-	    (bloc->logicalBlockNum + count) >
-		partmap->s_partition_len) {
+	if (bloc->logicalBlockNum + count < count ||
+	    (bloc->logicalBlockNum + count) > partmap->s_partition_len) {
 		udf_debug("%d < %d || %d + %d > %d\n",
 			  bloc->logicalBlockNum, 0, bloc->logicalBlockNum,
 			  count, partmap->s_partition_len);
@@ -393,9 +392,8 @@ static void udf_table_free_blocks(struct super_block *sb,
 
 	mutex_lock(&sbi->s_alloc_mutex);
 	partmap = &sbi->s_partmaps[bloc->partitionReferenceNum];
-	if (bloc->logicalBlockNum < 0 ||
-	    (bloc->logicalBlockNum + count) >
-		partmap->s_partition_len) {
+	if (bloc->logicalBlockNum + count < count ||
+	    (bloc->logicalBlockNum + count) > partmap->s_partition_len) {
 		udf_debug("%d < %d || %d + %d > %d\n",
 			  bloc->logicalBlockNum, 0, bloc->logicalBlockNum, count,
 			  partmap->s_partition_len);
