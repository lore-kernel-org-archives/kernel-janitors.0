From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 12:38:11 +0000
Subject: [PATCH 16/17] s390/debug: Improve determination of sizes in debug_info_alloc()
Message-Id: <79188cdc-317f-7abd-d543-7d4935a3c41d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
In-Reply-To: <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Joe Perches <joe@perches.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Sep 2016 14:39:00 +0200

* Replace two multiplications by references for an array in a local
  data structure as the parameter for the operator "sizeof" to make
  the corresponding size determination a bit safer.

* Improve source code layout for one function call.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/s390/kernel/debug.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/s390/kernel/debug.c b/arch/s390/kernel/debug.c
index ff8e705..408a8da 100644
--- a/arch/s390/kernel/debug.c
+++ b/arch/s390/kernel/debug.c
@@ -269,9 +269,8 @@ debug_info_alloc(const char *name, int pages_per_area, int nr_areas,
 	rc->buf_size       = buf_size;
 	rc->entry_size     = sizeof(debug_entry_t) + buf_size;
 	strlcpy(rc->name, name, sizeof(rc->name));
-	memset(rc->views, 0, DEBUG_MAX_VIEWS * sizeof(struct debug_view *));
-	memset(rc->debugfs_entries, 0, DEBUG_MAX_VIEWS *
-		sizeof(struct dentry*));
+	memset(rc->views, 0, sizeof(rc->views));
+	memset(rc->debugfs_entries, 0, sizeof(rc->debugfs_entries));
 	atomic_set(&(rc->ref_count), 0);
 
 	return rc;
-- 
2.9.3

