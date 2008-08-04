From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Mon, 04 Aug 2008 18:39:15 +0000
Subject: [PATCH] Remove redundant condition from map_buffer_to_page
Message-Id: <ea11fea30808041127u3c35b268l7ad193c415e9af5a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, trivial@kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: mkatiyar@gmail.com

Currently the only caller to this function is do_mpage_readpage()
which already checks if the buffer is uptodate, so a check inside is
not required.

Signed-off-by:- "Manish Katiyar" <mkatiyar@gmail.com>

---
 fs/mpage.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/mpage.c b/fs/mpage.c
index dbcc7af..a797de1 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -135,8 +135,7 @@ map_buffer_to_page(struct page *page, struct
buffer_head *bh, int page_block)
 		 * don't make any buffers if there is only one buffer on
 		 * the page and the page just needs to be set up to date
 		 */
-		if (inode->i_blkbits = PAGE_CACHE_SHIFT &&
-		    buffer_uptodate(bh)) {
+		if (inode->i_blkbits = PAGE_CACHE_SHIFT) {
 			SetPageUptodate(page);
 			return;
 		}
-- 
1.5.4.3



Thanks -
Manish
