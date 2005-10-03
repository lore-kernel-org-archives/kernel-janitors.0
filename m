From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Mon, 03 Oct 2005 05:41:25 +0000
Subject: [KJ] [PATCH 8/13] kobject: fix gfp flags type
Message-Id: <20051002224125.47b9b98a.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53337515710527827=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53337515710527827==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: Randy Dunlap <rdunlap@xenotime.net>

Fix implicit nocast warnings in kobject_uevent code:
lib/kobject_uevent.c:78:37: warning: implicit cast to nocast type
lib/kobject_uevent.c:97:51: warning: implicit cast to nocast type
lib/kobject_uevent.c:120:27: warning: implicit cast to nocast type

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---

 lib/kobject_uevent.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff -Naurp linux-2614-rc2-git6/lib/kobject_uevent.c~kobject_gfpmask linux-2614-rc2-git6/lib/kobject_uevent.c
--- linux-2614-rc2-git6/lib/kobject_uevent.c~kobject_gfpmask	2005-09-27 21:36:13.000000000 -0700
+++ linux-2614-rc2-git6/lib/kobject_uevent.c	2005-10-02 20:48:03.000000000 -0700
@@ -62,7 +62,7 @@ static struct sock *uevent_sock;
  * @gfp_mask:
  */
 static int send_uevent(const char *signal, const char *obj,
-		       char **envp, int gfp_mask)
+		       char **envp, unsigned int gfp_mask)
 {
 	struct sk_buff *skb;
 	char *pos;
@@ -98,7 +98,7 @@ static int send_uevent(const char *signa
 }
 
 static int do_kobject_uevent(struct kobject *kobj, enum kobject_action action, 
-			     struct attribute *attr, int gfp_mask)
+			     struct attribute *attr, unsigned int gfp_mask)
 {
 	char *path;
 	char *attrpath;
@@ -170,7 +170,7 @@ postcore_initcall(kobject_uevent_init);
 
 #else
 static inline int send_uevent(const char *signal, const char *obj,
-			      char **envp, int gfp_mask)
+			      char **envp, unsigned int gfp_mask)
 {
 	return 0;
 }

--===============53337515710527827==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53337515710527827==--
