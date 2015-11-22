From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 22 Nov 2015 07:22:10 +0000
Subject: [PATCH] nfsd: recover: constify nfsd4_client_tracking_ops structures
Message-Id: <1448176930-15173-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: kernel-janitors@vger.kernel.org, Jeff Layton <jlayton@poochiereds.net>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

The nfsd4_client_tracking_ops structures are never modified, so declare
them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/nfsd/netns.h       |    2 +-
 fs/nfsd/nfs4recover.c |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
index d8b16c2..5fbf3bb 100644
--- a/fs/nfsd/netns.h
+++ b/fs/nfsd/netns.h
@@ -92,7 +92,7 @@ struct nfsd_net {
 
 	struct file *rec_file;
 	bool in_grace;
-	struct nfsd4_client_tracking_ops *client_tracking_ops;
+	const struct nfsd4_client_tracking_ops *client_tracking_ops;
 
 	time_t nfsd4_lease;
 	time_t nfsd4_grace;
diff --git a/fs/nfsd/nfs4recover.c b/fs/nfsd/nfs4recover.c
index e3d4709..79f0307 100644
--- a/fs/nfsd/nfs4recover.c
+++ b/fs/nfsd/nfs4recover.c
@@ -631,7 +631,7 @@ nfsd4_check_legacy_client(struct nfs4_client *clp)
 	return -ENOENT;
 }
 
-static struct nfsd4_client_tracking_ops nfsd4_legacy_tracking_ops = {
+static const struct nfsd4_client_tracking_ops nfsd4_legacy_tracking_ops = {
 	.init		= nfsd4_legacy_tracking_init,
 	.exit		= nfsd4_legacy_tracking_exit,
 	.create		= nfsd4_create_clid_dir,
@@ -1050,7 +1050,7 @@ out_err:
 		printk(KERN_ERR "NFSD: Unable to end grace period: %d\n", ret);
 }
 
-static struct nfsd4_client_tracking_ops nfsd4_cld_tracking_ops = {
+static const struct nfsd4_client_tracking_ops nfsd4_cld_tracking_ops = {
 	.init		= nfsd4_init_cld_pipe,
 	.exit		= nfsd4_remove_cld_pipe,
 	.create		= nfsd4_cld_create,
@@ -1394,7 +1394,7 @@ nfsd4_umh_cltrack_grace_done(struct nfsd_net *nn)
 	kfree(legacy);
 }
 
-static struct nfsd4_client_tracking_ops nfsd4_umh_tracking_ops = {
+static const struct nfsd4_client_tracking_ops nfsd4_umh_tracking_ops = {
 	.init		= nfsd4_umh_cltrack_init,
 	.exit		= NULL,
 	.create		= nfsd4_umh_cltrack_create,

