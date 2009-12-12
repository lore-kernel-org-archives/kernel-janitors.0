From: Radu Voicilas <rvoicilas@gmail.com>
Date: Sat, 12 Dec 2009 09:06:10 +0000
Subject: [PATCH 2/4] Spelling fixes.
Message-Id: <1260608772-9839-3-git-send-email-rvoicilas@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

No change in functionality.

Signed-off-by: Radu Voicilas <rvoicilas@gmail.com>
---
 samples/kobject/kset-example.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/kobject/kset-example.c b/samples/kobject/kset-example.c
index 45b7d56..7c60881 100644
--- a/samples/kobject/kset-example.c
+++ b/samples/kobject/kset-example.c
@@ -127,7 +127,7 @@ static struct foo_attribute foo_attribute  	__ATTR(foo, 0666, foo_show, foo_store);
 
 /*
- * More complex function where we determine which varible is being accessed by
+ * More complex function where we determine which variable is being accessed by
  * looking at the attribute for the "baz" and "bar" files.
  */
 static ssize_t b_show(struct foo_obj *foo_obj, struct foo_attribute *attr,
@@ -161,7 +161,7 @@ static struct foo_attribute bar_attribute  	__ATTR(bar, 0666, b_show, b_store);
 
 /*
- * Create a group of attributes so that we can create and destory them all
+ * Create a group of attributes so that we can create and destroy them all
  * at once.
  */
 static struct attribute *foo_default_attrs[] = {
-- 
1.6.3.3

