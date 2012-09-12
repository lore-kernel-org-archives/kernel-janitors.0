From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 17:03:21 +0000
Subject: [PATCH 14/15] fs/jffs2/wbuf.c: removes unnecessary semicolon
Message-Id: <1347469402-27557-14-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 fs/jffs2/wbuf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index a6597d6..bea0487 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1275,7 +1275,7 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
 	if ((c->flash_size % c->sector_size) != 0) {
 		c->flash_size = (c->flash_size / c->sector_size) * c->sector_size;
 		pr_warn("flash size adjusted to %dKiB\n", c->flash_size);
-	};
+	}
 
 	c->wbuf_ofs = 0xFFFFFFFF;
 	c->wbuf = kmalloc(c->wbuf_pagesize, GFP_KERNEL);

