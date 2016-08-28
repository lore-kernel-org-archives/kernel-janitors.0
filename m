From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 28 Aug 2016 20:36:55 +0000
Subject: [PATCH] nfsd: constify reply_cache_stats_operations structure
Message-Id: <1472416615-24079-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: kernel-janitors@vger.kernel.org, Jeff Layton <jlayton@poochiereds.net>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

reply_cache_stats_operations, of type struct file_operations, is never
modified, so declare it as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/nfsd/nfsctl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
index 65ad016..3bc9693 100644
--- a/fs/nfsd/nfsctl.c
+++ b/fs/nfsd/nfsctl.c
@@ -217,7 +217,7 @@ static const struct file_operations pool_stats_operations = {
 	.release	= nfsd_pool_stats_release,
 };
 
-static struct file_operations reply_cache_stats_operations = {
+static const struct file_operations reply_cache_stats_operations = {
 	.open		= nfsd_reply_cache_stats_open,
 	.read		= seq_read,
 	.llseek		= seq_lseek,

