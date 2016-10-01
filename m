From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Oct 2016 19:46:21 +0000
Subject: [PATCH 04/15] lru_cache: improve function-level documentation
Message-Id: <1475351192-27079-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: kernel-janitors@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org

Use the actual function name and reorder the listed variables to correspond
to their order in the function parameter list.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 lib/lru_cache.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/lru_cache.c b/lib/lru_cache.c
index 28ba40b..07d3507 100644
--- a/lib/lru_cache.c
+++ b/lib/lru_cache.c
@@ -639,9 +639,9 @@ void lc_set(struct lru_cache *lc, unsigned int enr, int index)
 }
 
 /**
- * lc_dump - Dump a complete LRU cache to seq in textual form.
- * @lc: the lru cache to operate on
+ * lc_seq_dump_details - Dump a complete LRU cache to seq in textual form.
  * @seq: the &struct seq_file pointer to seq_printf into
+ * @lc: the lru cache to operate on
  * @utext: user supplied additional "heading" or other info
  * @detail: function pointer the user may provide to dump further details
  * of the object the lc_element is embedded in. May be NULL.

