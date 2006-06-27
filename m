From: "Brian Jung Myeng Lee" <jm3lee@gmail.com>
Date: Tue, 27 Jun 2006 07:22:05 +0000
Subject: [KJ] [patch 1/1] kernel/resource.c: __request_region argument check
Message-Id: <c7cf77ad0606270022g174a2fbdje69d94ebebd32363@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add argument check for parameters n and name.

Signed-off-by: Brian Jung Myeng Lee <jm3lee@gmail.com>

---

--- linux-2.6.17-rc6/kernel/resource.c	2006-06-05 20:57:02.000000000 -0400
+++ linux-2.6.17-rc6-modified/kernel/resource.c	2006-06-27
03:06:41.000000000 -0400
@@ -430,7 +430,12 @@
  */
 struct resource * __request_region(struct resource *parent, unsigned
long start, unsigned long n, const char *name)
 {
-	struct resource *res = kzalloc(sizeof(*res), GFP_KERNEL);
+	struct resource *res = NULL;
+
+	if (n = 0 || name = NULL)
+		return NULL;
+
+	res = kzalloc(sizeof(struct resource), GFP_KERNEL);

 	if (res) {
 		res->name = name;

---

This is my attempt at starting with Kernel Janitor's TODO list. I am
not so sure if I should be checking if parent = NULL. I think the
code runs just fine even if parent = NULL.

-- 
Brian Jung Myeng Lee
Homepage: http://koreanbrian.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
