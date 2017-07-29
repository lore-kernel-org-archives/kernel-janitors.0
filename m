From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Jul 2017 08:51:09 +0000
Subject: [PATCH] dlm: constify kset_uevent_ops structure
Message-Id: <1501318269-18990-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, David Teigland <teigland@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org

The kset_uevent_ops structure is only passed as the second argument
to kset_create_and_add, which is declared as const.  Thus the
kset_uevent_ops structure itself can be const.

Done with the help of Coccinelle.

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct kset_uevent_ops i@p = { ... };

@ok1@
identifier r.i;
expression e;
position p;
@@
 kset_create_and_add(e,&i@p,...)

@bad@
position p != {r.p,ok1.p};
identifier r.i;
struct kset_uevent_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct kset_uevent_ops i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/dlm/lockspace.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 9ebfa05..78a7c85 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -235,7 +235,7 @@ static int dlm_uevent(struct kset *kset, struct kobject *kobj,
 	return 0;
 }
 
-static struct kset_uevent_ops dlm_uevent_ops = {
+static const struct kset_uevent_ops dlm_uevent_ops = {
 	.uevent = dlm_uevent,
 };
 

