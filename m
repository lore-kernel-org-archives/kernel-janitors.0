From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Mar 2018 10:34:44 +0000
Subject: [PATCH] apparmor: signedness bug in aa_xattrs_match()
Message-Id: <20180319103444.GC8543@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

The "size" variable needs to be signed ssize_t so that the error
handling works correctly.

Fixes: 8e51f9087f40 ("apparmor: Add support for attaching profiles via xattr, presence and value")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index 57cc892e05a2..590b7e8cd21c 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -314,7 +314,7 @@ static int aa_xattrs_match(const struct linux_binprm *bprm,
 			   struct aa_profile *profile, unsigned int state)
 {
 	int i;
-	size_t size;
+	ssize_t size;
 	struct dentry *d;
 	char *value = NULL;
 	int value_size = 0, ret = profile->xattr_count;
