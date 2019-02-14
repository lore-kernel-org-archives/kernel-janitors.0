From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Feb 2019 08:38:22 +0000
Subject: [PATCH 2] coda: get rid of CODA_FREE()
Message-Id: <20190214083822.GA28623@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.1902140804170.2466@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Harkes <jaharkes@cs.cmu.edu>
Cc: coda@cs.cmu.edu, codalist@telemann.coda.cs.cmu.edu, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

The CODA_FREE() macro just calls kvfree().  We can call that directly
instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/coda/coda_linux.h |  2 --
 fs/coda/psdev.c      |  8 ++++----
 fs/coda/upcall.c     | 36 ++++++++++++++++++------------------
 3 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/fs/coda/coda_linux.h b/fs/coda/coda_linux.h
index 1ea9521e79d7..517a363245c9 100644
--- a/fs/coda/coda_linux.h
+++ b/fs/coda/coda_linux.h
@@ -63,8 +63,6 @@ unsigned short coda_flags_to_cflags(unsigned short);
 void coda_sysctl_init(void);
 void coda_sysctl_clean(void);
 
-#define CODA_FREE(ptr, size) kvfree((ptr))
-
 /* inode to cnode access functions */
 
 static inline struct coda_inode_info *ITOC(struct inode *inode)
diff --git a/fs/coda/psdev.c b/fs/coda/psdev.c
index 49d44a485c9a..decfbfda6bc4 100644
--- a/fs/coda/psdev.c
+++ b/fs/coda/psdev.c
@@ -130,7 +130,7 @@ static ssize_t coda_psdev_write(struct file *file, const char __user *buf,
 			goto out;
 		}
 		if (copy_from_user(dcbuf, buf, nbytes)) {
-			CODA_FREE(dcbuf, nbytes);
+			kvfree(dcbuf);
 			retval = -EFAULT;
 			goto out;
 		}
@@ -138,7 +138,7 @@ static ssize_t coda_psdev_write(struct file *file, const char __user *buf,
 		/* what downcall errors does Venus handle ? */
 		error = coda_downcall(vcp, hdr.opcode, dcbuf);
 
-		CODA_FREE(dcbuf, nbytes);
+		kvfree(dcbuf);
 		if (error) {
 			pr_warn("%s: coda_downcall error: %d\n",
 				__func__, error);
@@ -261,7 +261,7 @@ static ssize_t coda_psdev_read(struct file * file, char __user * buf,
 		goto out;
 	}
 
-	CODA_FREE(req->uc_data, sizeof(struct coda_in_hdr));
+	kvfree(req->uc_data);
 	kfree(req);
 out:
 	mutex_unlock(&vcp->vc_mutex);
@@ -323,7 +323,7 @@ static int coda_psdev_release(struct inode * inode, struct file * file)
 
 		/* Async requests need to be freed here */
 		if (req->uc_flags & CODA_REQ_ASYNC) {
-			CODA_FREE(req->uc_data, sizeof(struct coda_in_hdr));
+			kvfree(req->uc_data);
 			kfree(req);
 			continue;
 		}
diff --git a/fs/coda/upcall.c b/fs/coda/upcall.c
index 203f029bcdc3..9fa12118f1bc 100644
--- a/fs/coda/upcall.c
+++ b/fs/coda/upcall.c
@@ -85,7 +85,7 @@ int venus_rootfid(struct super_block *sb, struct CodaFid *fidp)
 	if (!error)
 		*fidp = outp->coda_root.VFid;
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }
 
@@ -104,7 +104,7 @@ int venus_getattr(struct super_block *sb, struct CodaFid *fid,
 	if (!error)
 		*attr = outp->coda_getattr.attr;
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
         return error;
 }
 
@@ -123,7 +123,7 @@ int venus_setattr(struct super_block *sb, struct CodaFid *fid,
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-        CODA_FREE(inp, insize);
+	kvfree(inp);
         return error;
 }
 
@@ -153,7 +153,7 @@ int venus_lookup(struct super_block *sb, struct CodaFid *fid,
 		*type = outp->coda_lookup.vtype;
 	}
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }
 
@@ -173,7 +173,7 @@ int venus_close(struct super_block *sb, struct CodaFid *fid, int flags,
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
         return error;
 }
 
@@ -194,7 +194,7 @@ int venus_open(struct super_block *sb, struct CodaFid *fid,
 	if (!error)
 		*fh = outp->coda_open_by_fd.fh;
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }	
 
@@ -224,7 +224,7 @@ int venus_mkdir(struct super_block *sb, struct CodaFid *dirfid,
 		*newfid = outp->coda_mkdir.VFid;
 	}
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;        
 }
 
@@ -262,7 +262,7 @@ int venus_rename(struct super_block *sb, struct CodaFid *old_fid,
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }
 
@@ -295,7 +295,7 @@ int venus_create(struct super_block *sb, struct CodaFid *dirfid,
 		*newfid = outp->coda_create.VFid;
 	}
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;        
 }
 
@@ -318,7 +318,7 @@ int venus_rmdir(struct super_block *sb, struct CodaFid *dirfid,
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }
 
@@ -340,7 +340,7 @@ int venus_remove(struct super_block *sb, struct CodaFid *dirfid,
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }
 
@@ -370,7 +370,7 @@ int venus_readlink(struct super_block *sb, struct CodaFid *fid,
 		*(buffer + retlen) = '\0';
 	}
 
-        CODA_FREE(inp, insize);
+	kvfree(inp);
         return error;
 }
 
@@ -398,7 +398,7 @@ int venus_link(struct super_block *sb, struct CodaFid *fid,
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
         return error;
 }
 
@@ -433,7 +433,7 @@ int venus_symlink(struct super_block *sb, struct CodaFid *fid,
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
         return error;
 }
 
@@ -449,7 +449,7 @@ int venus_fsync(struct super_block *sb, struct CodaFid *fid)
 	inp->coda_fsync.VFid = *fid;
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }
 
@@ -467,7 +467,7 @@ int venus_access(struct super_block *sb, struct CodaFid *fid, int mask)
 
 	error = coda_upcall(coda_vcp(sb), insize, &outsize, inp);
 
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }
 
@@ -543,7 +543,7 @@ int venus_pioctl(struct super_block *sb, struct CodaFid *fid,
 	}
 
  exit:
-	CODA_FREE(inp, insize);
+	kvfree(inp);
 	return error;
 }
 
@@ -565,7 +565,7 @@ int venus_statfs(struct dentry *dentry, struct kstatfs *sfs)
 		sfs->f_ffree  = outp->coda_statfs.stat.f_ffree;
 	}
 
-        CODA_FREE(inp, insize);
+	kvfree(inp);
         return error;
 }
 
-- 
2.17.1
