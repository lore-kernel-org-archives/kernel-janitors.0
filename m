From: Domen Puncer <domen@coderock.org>
Date: Sat, 23 Oct 2004 18:14:57 +0000
Subject: [KJ] [patch] fs/devpts: use lib/parser
Message-Id: <20041023181457.GA3628@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45240976856384663=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45240976856384663==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Use lib/parser.c for parsing mount options (item from "2.6 should fix").
 inode.c |   76 +++++++++++++++++++++++++++++++++++++++++-----------------------
 1 files changed, 49 insertions(+), 27 deletions(-)

Compile & boot tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/fs/devpts/inode.c	2004-10-23 18:02:13.000000000 +0200
+++ a/fs/devpts/inode.c	2004-10-23 19:46:29.000000000 +0200
@@ -19,6 +19,7 @@
 #include <linux/tty.h>
 #include <linux/devpts_fs.h>
 #include <linux/xattr.h>
+#include <linux/parser.h>
 
 #define DEVPTS_SUPER_MAGIC 0x1cd1
 
@@ -51,39 +52,60 @@ static struct {
 	umode_t mode;
 } config = {.mode = 0600};
 
+enum {
+	Opt_uid, Opt_gid, Opt_mode,
+	Opt_err
+};
+
+static match_table_t tokens = {
+	{Opt_uid, "uid=%u"},
+	{Opt_gid, "gid=%u"},
+	{Opt_mode, "mode=%o"},
+	{Opt_err, NULL}
+};
+
 static int devpts_remount(struct super_block *sb, int *flags, char *data)
 {
-	int setuid = 0;
-	int setgid = 0;
-	uid_t uid = 0;
-	gid_t gid = 0;
-	umode_t mode = 0600;
-	char *this_char;
-
-	this_char = NULL;
-	while ((this_char = strsep(&data, ",")) != NULL) {
-		int n;
-		char dummy;
-		if (!*this_char)
+	char *p;
+
+	config.setuid  = 0;
+	config.setgid  = 0;
+	config.uid     = 0;
+	config.gid     = 0;
+	config.mode    = 0600;
+
+	while ((p = strsep(&data, ",")) != NULL) {
+		substring_t args[MAX_OPT_ARGS];
+		int token;
+		int option;
+
+		if (!*p)
 			continue;
-		if (sscanf(this_char, "uid=%i%c", &n, &dummy) == 1) {
-			setuid = 1;
-			uid = n;
-		} else if (sscanf(this_char, "gid=%i%c", &n, &dummy) == 1) {
-			setgid = 1;
-			gid = n;
-		} else if (sscanf(this_char, "mode=%o%c", &n, &dummy) == 1)
-			mode = n & ~S_IFMT;
-		else {
-			printk("devpts: called with bogus options\n");
+
+		token = match_token(p, tokens, args);
+		switch (token) {
+		case Opt_uid:
+			if (match_int(&args[0], &option))
+				return -EINVAL;
+			config.uid = option;
+			config.setuid = 1;
+			break;
+		case Opt_gid:
+			if (match_int(&args[0], &option))
+				return -EINVAL;
+			config.gid = option;
+			config.setgid = 1;
+			break;
+		case Opt_mode:
+			if (match_octal(&args[0], &option))
+				return -EINVAL;
+			config.mode = option & ~S_IFMT;
+			break;
+		default:
+			printk(KERN_ERR "devpts: called with bogus options\n");
 			return -EINVAL;
 		}
 	}
-	config.setuid  = setuid;
-	config.setgid  = setgid;
-	config.uid     = uid;
-	config.gid     = gid;
-	config.mode    = mode;
 
 	return 0;
 }

--===============45240976856384663==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45240976856384663==--
