From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Mar 2012 10:44:59 +0000
Subject: [patch] nfsd4: memory corruption in numeric_name_to_id()
Message-Id: <20120328104459.GA29022@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

"id" is type is a uid_t (32 bits) but on 64 bit systems strict_strtoul()
modifies 64 bits of data.  We should use kstrtouint() instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfsd/nfs4idmap.c b/fs/nfsd/nfs4idmap.c
index 69ca9c5..322d11c 100644
--- a/fs/nfsd/nfs4idmap.c
+++ b/fs/nfsd/nfs4idmap.c
@@ -581,7 +581,7 @@ numeric_name_to_id(struct svc_rqst *rqstp, int type, const char *name, u32 namel
 	/* Just to make sure it's null-terminated: */
 	memcpy(buf, name, namelen);
 	buf[namelen] = '\0';
-	ret = strict_strtoul(name, 10, (unsigned long *)id);
+	ret = kstrtouint(name, 10, id);
 	return ret = 0;
 }
 
