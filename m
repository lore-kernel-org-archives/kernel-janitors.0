From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Sep 2012 12:30:42 +0000
Subject: [patch] x86, microcode, AMD: use after free in free_cache()
Message-Id: <20120905123042.GB6128@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

list_for_each_entry_reverse() dereferences the iterator, but we already
freed it.  I don't see a reason that this has to be done in reverse
order so I've changed it to use list_for_each_entry_safe().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is only needed on linux-next.  Sorry, it turns out that I don't
have any AMD systems right now, so I have not tested this.

diff --git a/arch/x86/kernel/microcode_amd.c b/arch/x86/kernel/microcode_amd.c
index 5511216..7720ff5 100644
--- a/arch/x86/kernel/microcode_amd.c
+++ b/arch/x86/kernel/microcode_amd.c
@@ -150,9 +150,9 @@ static void update_cache(struct ucode_patch *new_patch)
 
 static void free_cache(void)
 {
-	struct ucode_patch *p;
+	struct ucode_patch *p, *tmp;
 
-	list_for_each_entry_reverse(p, &pcache, plist) {
+	list_for_each_entry_safe(p, tmp, &pcache, plist) {
 		__list_del(p->plist.prev, p->plist.next);
 		kfree(p->data);
 		kfree(p);
