From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:33:00 +0000
Subject: [PATCH 11/14] ubifs: check return code of ubifs_lpt_lookup
Message-Id: <1283711580-7546-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Vasiliy Kulikov <segooon@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>

From: Vasiliy Kulikov <segooon@gmail.com>

Function ubifs_lpt_lookup may return ERR_PTR(...). Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 fs/ubifs/lpt.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 0084a33..841bb36 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -1351,6 +1351,7 @@ static int read_lsave(struct ubifs_info *c)
 {
 	int err, i;
 	void *buf;
+	struct ubifs_lprops *perr;
 
 	buf = vmalloc(c->lsave_sz);
 	if (!buf)
@@ -1370,7 +1371,11 @@ static int read_lsave(struct ubifs_info *c)
 		 */
 		if (lnum >= c->leb_cnt)
 			continue;
-		ubifs_lpt_lookup(c, lnum);
+		perr = ubifs_lpt_lookup(c, lnum);
+		if (IS_ERR(perr)) {
+			err = PTR_ERR(perr);
+			goto out;
+		}
 	}
 out:
 	vfree(buf);
-- 
1.7.0.4

