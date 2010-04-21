From: David Howells <dhowells@redhat.com>
Date: Wed, 21 Apr 2010 11:01:23 +0000
Subject: [PATCH] AFS: Don't pass error value to page_cache_release() in error
Message-Id: <20100421110123.25523.71216.stgit@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the error handling in afs_mntpt_do_automount(), we pass an error pointer to
page_cache_release() if read_mapping_page() failed.  Instead, we should extend
the gotos around the error handling we don't need.

Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/mntpt.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/afs/mntpt.c b/fs/afs/mntpt.c
index b0e030d..1820d58 100644
--- a/fs/afs/mntpt.c
+++ b/fs/afs/mntpt.c
@@ -145,9 +145,9 @@ static struct vfsmount *afs_mntpt_do_automount(struct dentry *mntpt)
 {
 	struct afs_super_info *super;
 	struct vfsmount *mnt;
-	struct page *page = NULL;
+	struct page *page;
 	size_t size;
-	char *buf, *devname = NULL, *options = NULL;
+	char *buf, *devname, *options;
 	int ret;
 
 	_enter("{%s}", mntpt->d_name.name);
@@ -157,22 +157,22 @@ static struct vfsmount *afs_mntpt_do_automount(struct dentry *mntpt)
 	ret = -EINVAL;
 	size = mntpt->d_inode->i_size;
 	if (size > PAGE_SIZE - 1)
-		goto error;
+		goto error_no_devname;
 
 	ret = -ENOMEM;
 	devname = (char *) get_zeroed_page(GFP_KERNEL);
 	if (!devname)
-		goto error;
+		goto error_no_devname;
 
 	options = (char *) get_zeroed_page(GFP_KERNEL);
 	if (!options)
-		goto error;
+		goto error_no_options;
 
 	/* read the contents of the AFS special symlink */
 	page = read_mapping_page(mntpt->d_inode->i_mapping, 0, NULL);
 	if (IS_ERR(page)) {
 		ret = PTR_ERR(page);
-		goto error;
+		goto error_no_page;
 	}
 
 	ret = -EIO;
@@ -203,12 +203,12 @@ static struct vfsmount *afs_mntpt_do_automount(struct dentry *mntpt)
 	return mnt;
 
 error:
-	if (page)
-		page_cache_release(page);
-	if (devname)
-		free_page((unsigned long) devname);
-	if (options)
-		free_page((unsigned long) options);
+	page_cache_release(page);
+error_no_page:
+	free_page((unsigned long) options);
+error_no_options:
+	free_page((unsigned long) devname);
+error_no_devname:
 	_leave(" = %d", ret);
 	return ERR_PTR(ret);
 }

