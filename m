From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Apr 2018 13:26:13 +0000
Subject: [PATCH][next] afs: fix integer overflow when shifting 1 more than 32 places
Message-Id: <20180411132613.18974-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting 1 (a 32 bit signed int) more than 32 places will overflow
the int, so explicitly use 1ULL to avoid this overflow.

Detected by CoverityScan, CID#1467808 ("Uninitentional integer overflow")

Fixes: 63a4681ff39c ("afs: Locally edit directory data for mkdir/create/unlink/...")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/dir_edit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/afs/dir_edit.c b/fs/afs/dir_edit.c
index 8b400f5aead5..42a63f9467c5 100644
--- a/fs/afs/dir_edit.c
+++ b/fs/afs/dir_edit.c
@@ -40,7 +40,7 @@ static int afs_find_contig_bits(union afs_xdr_dir_block *block, unsigned int nr_
 	bitmap |= (u64)block->hdr.bitmap[7] << 7 * 8;
 	bitmap >>= 1; /* The first entry is metadata */
 	bit = 1;
-	mask = (1 << nr_slots) - 1;
+	mask = (1ULL << nr_slots) - 1;
 
 	do {
 		if (sizeof(unsigned long) = 8)
@@ -74,7 +74,7 @@ static void afs_set_contig_bits(union afs_xdr_dir_block *block,
 {
 	u64 mask, before, after;
 
-	mask = (1 << nr_slots) - 1;
+	mask = (1ULL << nr_slots) - 1;
 	mask <<= bit;
 
 	before = *(u64 *)block->hdr.bitmap;
@@ -99,7 +99,7 @@ static void afs_clear_contig_bits(union afs_xdr_dir_block *block,
 {
 	u64 mask, before, after;
 
-	mask = (1 << nr_slots) - 1;
+	mask = (1ULL << nr_slots) - 1;
 	mask <<= bit;
 
 	before = *(u64 *)block->hdr.bitmap;
-- 
2.17.0

