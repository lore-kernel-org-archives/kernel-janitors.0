From: Julia Lawall <julia@diku.dk>
Date: Sun, 30 May 2010 20:27:28 +0000
Subject: [PATCH 1/3] kernel: Use GFP_ATOMIC when a lock is held
Message-Id: <Pine.LNX.4.64.1005302227130.19253@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Eric Paris <eparis@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The containing function is called from several places.  At one of them, in
the function untag_chunk, the spin lock &entry->lock is held.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@gfp exists@
identifier fn;
position p;
@@

fn(...) {
... when != spin_unlock
    when any
  GFP_KERNEL@p
 ... when any
}

@locked@
identifier gfp.fn;
@@

spin_lock(...)
... when != spin_unlock
fn(...)

@depends on locked@
position gfp.p;
@@

- GFP_KERNEL@p
+ GFP_ATOMIC
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 kernel/audit_tree.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/kernel/audit_tree.c b/kernel/audit_tree.c
--- a/kernel/audit_tree.c
+++ b/kernel/audit_tree.c
@@ -147,7 +147,7 @@ static struct audit_chunk *alloc_chunk(i
 	int i;
 
 	size = offsetof(struct audit_chunk, owners) + count * sizeof(struct node);
-	chunk = kzalloc(size, GFP_KERNEL);
+	chunk = kzalloc(size, GFP_ATOMIC);
 	if (!chunk)
 		return NULL;
 
