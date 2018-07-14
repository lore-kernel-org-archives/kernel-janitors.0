From: Jan Harkes <jaharkes@cs.cmu.edu>
Date: Sat, 14 Jul 2018 02:24:36 +0000
Subject: [PATCH v3] fs/coda: potential buffer overflow in coda_psdev_write()
Message-Id: <20180714022435.5lzzhzmpyn5cge5q@cs.cmu.edu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180712123255.rkcszmwdmrloxaki@kili.mountain>
 <20180713151017.lxbv4eljvd6olziq@kili.mountain>
 <20180713161630.olrwa2n2tnpqbmlt@cs.cmu.edu>
 <20180713190503.eei3axzltm7pt4aa@mwanda>
In-Reply-To: <20180713190503.eei3axzltm7pt4aa@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org

Add checks to make sure the downcall message we got from the Coda cache
manager is large enough to contain the data it is supposed to have.
i.e. when we get a CODA_ZAPDIR we can access &out->coda_zapdir.CodaFid.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com
Signed-off-by: Jan Harkes <jaharkes@cs.cmu.edu>


diff --git a/fs/coda/psdev.c b/fs/coda/psdev.c
index c5234c21b539..43e8cc8dbf26 100644
--- a/fs/coda/psdev.c
+++ b/fs/coda/psdev.c
@@ -105,8 +105,12 @@ static ssize_t coda_psdev_write(struct file *file, const char __user *buf,
 	ssize_t retval = 0, count = 0;
 	int error;
 
+        /* make sure there is enough to copy out the (opcode, unique) values */
+        if (nbytes < (2 * sizeof(u_int32_t)))
+                return -EINVAL;
+
         /* Peek at the opcode, uniquefier */
-	if (copy_from_user(&hdr, buf, 2 * sizeof(u_long)))
+	if (copy_from_user(&hdr, buf, 2 * sizeof(u_int32_t)))
 	        return -EFAULT;
 
         if (DOWNCALL(hdr.opcode)) {
@@ -132,7 +136,7 @@ static ssize_t coda_psdev_write(struct file *file, const char __user *buf,
 		}
 
 		/* what downcall errors does Venus handle ? */
-		error = coda_downcall(vcp, hdr.opcode, dcbuf);
+		error = coda_downcall(vcp, hdr.opcode, dcbuf, nbytes);
 
 		CODA_FREE(dcbuf, nbytes);
 		if (error) {
diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
index 1175a1722411..c3c35a80659b 100644
--- a/fs/coda/upcall.c
+++ b/fs/coda/upcall.c
@@ -804,12 +804,42 @@ static int coda_upcall(struct venus_comm *vcp,
  *
  * CODA_REPLACE -- replace one CodaFid with another throughout the name cache */
 
-int coda_downcall(struct venus_comm *vcp, int opcode, union outputArgs *out)
+int coda_downcall(struct venus_comm *vcp, int opcode, union outputArgs *out,
+                  size_t nbytes)
 {
 	struct inode *inode = NULL;
 	struct CodaFid *fid = NULL, *newfid;
 	struct super_block *sb;
 
+        /* make sure we have received enough data from the cache
+         * manager to populate the necessary fields in the buffer */
+	switch (opcode) {
+	case CODA_PURGEUSER:
+                if (nbytes < sizeof(struct coda_purgeuser_out))
+                        return -EINVAL;
+                break;
+
+	case CODA_ZAPDIR:
+                if (nbytes < sizeof(struct coda_zapdir_out))
+                        return -EINVAL;
+		break;
+
+	case CODA_ZAPFILE:
+                if (nbytes < sizeof(struct coda_zapfile_out))
+                        return -EINVAL;
+		break;
+
+	case CODA_PURGEFID:
+                if (nbytes < sizeof(struct coda_purgefid_out))
+                        return -EINVAL;
+		break;
+
+	case CODA_REPLACE:
+                if (nbytes < sizeof(struct coda_replace_out))
+                        return -EINVAL;
+		break;
+	}
+
 	/* Handle invalidation requests. */
 	mutex_lock(&vcp->vc_mutex);
 	sb = vcp->vc_sb;
diff --git a/include/linux/coda_psdev.h b/include/linux/coda_psdev.h
index 15170954aa2b..a553242b30c1 100644
--- a/include/linux/coda_psdev.h
+++ b/include/linux/coda_psdev.h
@@ -60,7 +60,8 @@ int venus_symlink(struct super_block *sb, struct CodaFid *fid,
 int venus_access(struct super_block *sb, struct CodaFid *fid, int mask);
 int venus_pioctl(struct super_block *sb, struct CodaFid *fid,
 		 unsigned int cmd, struct PioctlData *data);
-int coda_downcall(struct venus_comm *vcp, int opcode, union outputArgs *out);
+int coda_downcall(struct venus_comm *vcp, int opcode, union outputArgs *out,
+                  size_t nbytes);
 int venus_fsync(struct super_block *sb, struct CodaFid *fid);
 int venus_statfs(struct dentry *dentry, struct kstatfs *sfs);
 
