From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 Jan 2016 09:01:52 +0000
Subject: [PATCH] OrangeFS: constify export_operations structures
Message-Id: <1451638912-6613-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>
Cc: kernel-janitors@vger.kernel.org

This export_operations structure is never modified, so declare it as const.
Most other structures of this type are already const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

Mike, I saw your name on all of the patches for this driver, but you aren't
in the MAINTAINERS file.  If you are the maintainer of this file, maybe you
should add yourself there.

 fs/orangefs/super.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/super.c b/fs/orangefs/super.c
index 52bc522..bee67b3 100644
--- a/fs/orangefs/super.c
+++ b/fs/orangefs/super.c
@@ -342,7 +342,7 @@ out:
 	return type;
 }
 
-static struct export_operations orangefs_export_ops = {
+static const struct export_operations orangefs_export_ops = {
 	.encode_fh = orangefs_encode_fh,
 	.fh_to_dentry = orangefs_fh_to_dentry,
 };

