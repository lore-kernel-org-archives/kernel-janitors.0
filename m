From: Julia Lawall <julia@diku.dk>
Date: Thu, 12 Nov 2009 07:49:24 +0000
Subject: [PATCH 3/4] security/selinux: decrement sizeof size in strncmp
Message-Id: <Pine.LNX.4.64.0911120849050.16627@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Smalley <sds@tycho.nsa.gov>, James Morris <jmorris@namei.org>, Eric Paris <eparis@parisplace.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As observed by Joe Perches, sizeof of a constant string includes the
trailing 0.  If what is wanted is to check the initial characters of
another string, this trailing 0 should not be taken into account.  If an
exact match is wanted, strcmp should be used instead.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression foo;
constant char *abc;
@@

strncmp(foo, abc, 
- sizeof(abc)
+ sizeof(abc)-1
 )
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 security/selinux/hooks.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/security/selinux/hooks.c b/security/selinux/hooks.c
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -448,7 +448,7 @@ static int sb_finish_set_opts(struct sup
 		sbsec->flags &= ~SE_SBLABELSUPP;
 
 	/* Special handling for sysfs. Is genfs but also has setxattr handler*/
-	if (strncmp(sb->s_type->name, "sysfs", sizeof("sysfs")) = 0)
+	if (strncmp(sb->s_type->name, "sysfs", sizeof("sysfs") - 1) = 0)
 		sbsec->flags |= SE_SBLABELSUPP;
 
 	/* Initialize the root inode. */
