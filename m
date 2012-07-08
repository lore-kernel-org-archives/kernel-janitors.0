From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 08 Jul 2012 13:19:42 +0000
Subject: [PATCH] fs/ubifs/orphan.c: remove invalid reference to list iterator variable
Message-Id: <1341753582-3943-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341753582-3943-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1341753582-3943-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

If list_for_each_entry, etc complete a traversal of the list, the iterator
variable ends up pointing to an address at an offset from the list head,
and not a meaningful structure.  Thus this value should not be used after
the end of the iterator.  Replace a field access from orphan by NULL.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier c;
expression E;
iterator name list_for_each_entry;
statement S;
@@

list_for_each_entry(c,...) { ... when != break;
                                 when forall
                                 when strict
}
...
(
c = E
|
*c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/ubifs/orphan.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index b02734d..4b7860a 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -176,7 +176,7 @@ int ubifs_orphan_start_commit(struct ubifs_info *c)
 		*last = orphan;
 		last = &orphan->cnext;
 	}
-	*last = orphan->cnext;
+	*last = NULL;
 	c->cmt_orphans = c->new_orphans;
 	c->new_orphans = 0;
 	dbg_cmt("%d orphans to commit", c->cmt_orphans);

