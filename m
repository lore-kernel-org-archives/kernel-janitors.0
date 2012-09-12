From: Aristeu Rozanski <aris@redhat.com>
Date: Wed, 12 Sep 2012 14:31:13 +0000
Subject: [PATCH] xattr: mark variable as uninitialized to make both gcc and smatch happy
Message-Id: <20120912143112.GE19694@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

new_xattr in __simple_xattr_set() is only initialized with a valid
pointer if value is not NULL, which only happens if this function is
called directly with the intention to remove an existing extended
attribute. Even being safe to be this way, smatch warns about possible
NULL dereference. Dan Carpenter suggested using uninitialized_var()
which will make both gcc and smatch happy.

Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Aristeu Rozanski <aris@redhat.com>

---
 fs/xattr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/fs/xattr.c	2012-09-12 09:57:35.000000000 -0400
+++ b/fs/xattr.c	2012-09-12 09:58:25.619387047 -0400
@@ -845,7 +845,7 @@ static int __simple_xattr_set(struct sim
 			      const void *value, size_t size, int flags)
 {
 	struct simple_xattr *xattr;
-	struct simple_xattr *new_xattr = NULL;
+	struct simple_xattr *uninitialized_var(new_xattr);
 	int err = 0;
 
 	/* value = NULL means remove */
