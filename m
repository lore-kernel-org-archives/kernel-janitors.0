From: Colin King <colin.king@canonical.com>
Date: Wed, 01 May 2019 12:43:17 +0000
Subject: [PATCH][next] kobject: fix dereference before null check on kobj
Message-Id: <20190501124317.1759-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The kobj pointer is being null-checked so potentially it could be null,
however, the ktype declaration before the null check is dereferencing kobj
hence we have a potential null pointer deference. Fix this by moving the
assignment of ktype after kobj has been null checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: aa30f47cf666 ("kobject: Add support for default attribute groups to kobj_type")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/kobject.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/kobject.c b/lib/kobject.c
index a30ee0467942..095bcb55c2ba 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -603,12 +603,13 @@ EXPORT_SYMBOL_GPL(kobject_move);
 void kobject_del(struct kobject *kobj)
 {
 	struct kernfs_node *sd;
-	const struct kobj_type *ktype = get_ktype(kobj);
+	const struct kobj_type *ktype;
 
 	if (!kobj)
 		return;
 
 	sd = kobj->sd;
+	ktype = get_ktype(kobj);
 
 	if (ktype)
 		sysfs_remove_groups(kobj, ktype->default_groups);
-- 
2.20.1
