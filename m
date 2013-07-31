From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2013 09:10:10 +0000
Subject: [patch] ecryptfs: remove check for if an array is NULL
Message-Id: <20130731091010.GA2131@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It doesn't make sense to check if an array is NULL.  The compiler just
removes the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Or perhaps "if (!strlen(crypt_stat->cipher))" was intended?  I'm not
very familiar with this code.

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index d107576..3bd35e2 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -609,10 +609,6 @@ int ecryptfs_init_crypt_ctx(struct ecryptfs_crypt_stat *crypt_stat)
 	char *full_alg_name;
 	int rc = -EINVAL;
 
-	if (!crypt_stat->cipher) {
-		ecryptfs_printk(KERN_ERR, "No cipher specified\n");
-		goto out;
-	}
 	ecryptfs_printk(KERN_DEBUG,
 			"Initializing cipher [%s]; strlen = [%d]; "
 			"key_size_bits = [%zd]\n",
