From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Tue, 04 Oct 2005 07:45:34 +0000
Subject: [KJ] [PATCH] (replacement) kobject: fix gfp flags type
Message-Id: <20051004004534.0e00d067.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14044910962781954=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14044910962781954==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Randy Dunlap <rdunlap@xenotime.net>

Fix implicit nocast warnings in kobject_uevent code, including __nocast:
lib/kobject_uevent.c:78:37: warning: implicit cast to nocast type
lib/kobject_uevent.c:97:51: warning: implicit cast to nocast type
lib/kobject_uevent.c:120:27: warning: implicit cast to nocast type

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---

 include/linux/kobject.h |    2 +-
 lib/kobject.c           |    2 +-
 lib/kobject_uevent.c    |    6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff -Naurp linux-2614-rc2-git6/drivers/base/class.c~kobject_gfpmask linux-2614-rc2-git6/drivers/base/class.c
diff -Naurp linux-2614-rc2-git6/include/linux/kobject.h~kobject_gfpmask linux-2614-rc2-git6/include/linux/kobject.h
--- linux-2614-rc2-git6/include/linux/kobject.h~kobject_gfpmask	2005-08-28 16:41:01.000000000 -0700
+++ linux-2614-rc2-git6/include/linux/kobject.h	2005-10-03 21:32:47.000000000 -0700
@@ -65,7 +65,7 @@ extern void kobject_unregister(struct ko
 extern struct kobject * kobject_get(struct kobject *);
 extern void kobject_put(struct kobject *);
 
-extern char * kobject_get_path(struct kobject *, int);
+extern char * kobject_get_path(struct kobject *, unsigned int __nocast);
 
 struct kobj_type {
 	void (*release)(struct kobject *);
diff -Naurp linux-2614-rc2-git6/lib/kobject_uevent.c~kobject_gfpmask linux-2614-rc2-git6/lib/kobject_uevent.c
--- linux-2614-rc2-git6/lib/kobject_uevent.c~kobject_gfpmask	2005-09-27 21:36:13.000000000 -0700
+++ linux-2614-rc2-git6/lib/kobject_uevent.c	2005-10-03 21:27:50.000000000 -0700
@@ -62,7 +62,7 @@ static struct sock *uevent_sock;
  * @gfp_mask:
  */
 static int send_uevent(const char *signal, const char *obj,
-		       char **envp, int gfp_mask)
+		       char **envp, unsigned int __nocast gfp_mask)
 {
 	struct sk_buff *skb;
 	char *pos;
@@ -98,7 +98,7 @@ static int send_uevent(const char *signa
 }
 
 static int do_kobject_uevent(struct kobject *kobj, enum kobject_action action, 
-			     struct attribute *attr, int gfp_mask)
+			struct attribute *attr, unsigned int __nocast gfp_mask)
 {
 	char *path;
 	char *attrpath;
@@ -170,7 +170,7 @@ postcore_initcall(kobject_uevent_init);
 
 #else
 static inline int send_uevent(const char *signal, const char *obj,
-			      char **envp, int gfp_mask)
+			      char **envp, unsigned int __nocast gfp_mask)
 {
 	return 0;
 }
diff -Naurp linux-2614-rc2-git6/lib/kobject.c~kobject_gfpmask linux-2614-rc2-git6/lib/kobject.c
--- linux-2614-rc2-git6/lib/kobject.c~kobject_gfpmask	2005-08-28 16:41:01.000000000 -0700
+++ linux-2614-rc2-git6/lib/kobject.c	2005-10-03 21:32:18.000000000 -0700
@@ -100,7 +100,7 @@ static void fill_kobj_path(struct kobjec
  * @kobj:	kobject in question, with which to build the path
  * @gfp_mask:	the allocation type used to allocate the path
  */
-char *kobject_get_path(struct kobject *kobj, int gfp_mask)
+char *kobject_get_path(struct kobject *kobj, unsigned int __nocast gfp_mask)
 {
 	char *path;
 	int len;


---


--===============14044910962781954==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14044910962781954==--
