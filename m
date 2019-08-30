From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Aug 2019 10:49:12 +0000
Subject: [PATCH] afs: use BIT_ULL for shifting to fix integer overflow
Message-Id: <20190830104912.1090-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The expression 1 << nr_slots is evaluated with 32 bit integer arithmetic
and can overflow before it is widened. Instead, use BIT_ULL to avoid
overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 63a4681ff39c ("afs: Locally edit directory data for mkdir/create/unlink/...")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/dir_edit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/afs/dir_edit.c b/fs/afs/dir_edit.c
index d4fbe5f85f1b..f360119923aa 100644
--- a/fs/afs/dir_edit.c
+++ b/fs/afs/dir_edit.c
@@ -36,7 +36,7 @@ static int afs_find_contig_bits(union afs_xdr_dir_block *block, unsigned int nr_
 	bitmap |= (u64)block->hdr.bitmap[7] << 7 * 8;
 	bitmap >>= 1; /* The first entry is metadata */
 	bit = 1;
-	mask = (1 << nr_slots) - 1;
+	mask = BIT_ULL(nr_slots) - 1;
 
 	do {
 		if (sizeof(unsigned long) = 8)
@@ -70,7 +70,7 @@ static void afs_set_contig_bits(union afs_xdr_dir_block *block,
 {
 	u64 mask, before, after;
 
-	mask = (1 << nr_slots) - 1;
+	mask = BIT_ULL(nr_slots) - 1;
 	mask <<= bit;
 
 	before = *(u64 *)block->hdr.bitmap;
@@ -95,7 +95,7 @@ static void afs_clear_contig_bits(union afs_xdr_dir_block *block,
 {
 	u64 mask, before, after;
 
-	mask = (1 << nr_slots) - 1;
+	mask = BIT_ULL(nr_slots) - 1;
 	mask <<= bit;
 
 	before = *(u64 *)block->hdr.bitmap;
-- 
2.20.1
