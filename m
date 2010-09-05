From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:33:04 +0000
Subject: [PATCH 12/14] ubifs: check return code of pnode_lookup
Message-Id: <1283711584-7587-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Vasiliy Kulikov <segooon@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>

From: Vasiliy Kulikov <segooon@gmail.com>

Function pnode_lookup may return ERR_PTR(...). Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 fs/ubifs/lpt_commit.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index d12535b..5c90dec 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -705,6 +705,9 @@ static int make_tree_dirty(struct ubifs_info *c)
 	struct ubifs_pnode *pnode;
 
 	pnode = pnode_lookup(c, 0);
+	if (IS_ERR(pnode))
+		return PTR_ERR(pnode);
+
 	while (pnode) {
 		do_make_pnode_dirty(c, pnode);
 		pnode = next_pnode_to_dirty(c, pnode);
-- 
1.7.0.4

