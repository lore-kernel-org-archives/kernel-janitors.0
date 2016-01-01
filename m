From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 Jan 2016 08:49:12 +0000
Subject: [PATCH] dlm: constify kset_uevent_ops structures
Message-Id: <1451638152-30707-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>
Cc: kernel-janitors@vger.kernel.org, David Teigland <teigland@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org

This kset_uevent_ops structure is never modified, so declare it as const.
Other structures of this type are already const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/dlm/lockspace.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index f3e7278..2ea1b77 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -233,7 +233,7 @@ static int dlm_uevent(struct kset *kset, struct kobject *kobj,
 	return 0;
 }
 
-static struct kset_uevent_ops dlm_uevent_ops = {
+static const struct kset_uevent_ops dlm_uevent_ops = {
 	.uevent = dlm_uevent,
 };
 

