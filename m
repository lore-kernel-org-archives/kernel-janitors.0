From: Radu Voicilas <rvoicilas@gmail.com>
Date: Sat, 12 Dec 2009 09:06:09 +0000
Subject: [PATCH 1/4] Spelling fixes.
Message-Id: <1260608772-9839-2-git-send-email-rvoicilas@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

No change in functionality.

Signed-off-by: Radu Voicilas <rvoicilas@gmail.com>
---
 samples/kobject/kobject-example.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/kobject/kobject-example.c b/samples/kobject/kobject-example.c
index 8d9b55a..86ea0c3 100644
--- a/samples/kobject/kobject-example.c
+++ b/samples/kobject/kobject-example.c
@@ -44,7 +44,7 @@ static struct kobj_attribute foo_attribute  	__ATTR(foo, 0666, foo_show, foo_store);
 
 /*
- * More complex function where we determine which varible is being accessed by
+ * More complex function where we determine which variable is being accessed by
  * looking at the attribute for the "baz" and "bar" files.
  */
 static ssize_t b_show(struct kobject *kobj, struct kobj_attribute *attr,
@@ -79,7 +79,7 @@ static struct kobj_attribute bar_attribute  
 
 /*
- * Create a group of attributes so that we can create and destory them all
+ * Create a group of attributes so that we can create and destroy them all
  * at once.
  */
 static struct attribute *attrs[] = {
-- 
1.6.3.3

