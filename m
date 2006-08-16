From: Brandon Philips <brandon@ifup.org>
Date: Wed, 16 Aug 2006 17:04:45 +0000
Subject: [KJ] [PATCH] Y/N value import/export
Message-Id: <20060816170423.GA5897@plankton.ifup.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello-

I am wanting to export a single Y/N value via sysfs like
debugfs_create_bool does.

But, I can't find an exported method for parsing/exporting the Y/N
values and copying and pasting the debugfs code doesn't seem right.  If
I was to create my own method there would be three routines for doing
this parsing:

1) kernel/params.c: param_set_bool param_get_bool
2) fs/debugfs/file.c: write_file_bool read_file_bool
3) mine

Attached is a trivial patch to create get_bool and set_bool in
lib/strings.c.  Is that the right place to put this?

	Brandon

Compile tested patch.

---
 fs/debugfs/file.c      |   18 ++----------------
 include/linux/string.h |    4 ++++
 kernel/params.c        |   13 ++-----------
 lib/string.c           |   24 ++++++++++++++++++++++++
 4 files changed, 32 insertions(+), 27 deletions(-)

Index: linux-mm-clean/lib/string.c
=================================--- linux-mm-clean.orig/lib/string.c
+++ linux-mm-clean/lib/string.c
@@ -634,3 +634,27 @@ void *memchr(const void *s, int c, size_
 }
 EXPORT_SYMBOL(memchr);
 #endif
+
+int set_bool(int * val, const char * c)
+{
+	/* One of =[yYnN01] */
+	switch (*c) {
+	case 'y': case 'Y': case '1':
+		*val = 1;
+		return 0;
+	case 'n': case 'N': case '0':
+		*val = 0;
+		return 0;
+	}
+	return -EINVAL;
+}
+EXPORT_SYMBOL(set_bool);
+
+char get_bool(int val)
+{
+	if (val)
+		return 'Y';
+	else
+		return 'N';
+}
+EXPORT_SYMBOL(get_bool);
Index: linux-mm-clean/kernel/params.c
=================================--- linux-mm-clean.orig/kernel/params.c
+++ linux-mm-clean/kernel/params.c
@@ -225,22 +225,13 @@ int param_set_bool(const char *val, stru
 	/* No equals means "set"... */
 	if (!val) val = "1";
 
-	/* One of =[yYnN01] */
-	switch (val[0]) {
-	case 'y': case 'Y': case '1':
-		*(int *)kp->arg = 1;
-		return 0;
-	case 'n': case 'N': case '0':
-		*(int *)kp->arg = 0;
-		return 0;
-	}
-	return -EINVAL;
+	return set_bool((int *)kp->arg, val);
 }
 
 int param_get_bool(char *buffer, struct kernel_param *kp)
 {
 	/* Y and N chosen as being relatively non-coder friendly */
-	return sprintf(buffer, "%c", (*(int *)kp->arg) ? 'Y' : 'N');
+	return sprintf(buffer, "%c", get_bool(*(int *)kp->arg));
 }
 
 int param_set_invbool(const char *val, struct kernel_param *kp)
Index: linux-mm-clean/fs/debugfs/file.c
=================================--- linux-mm-clean.orig/fs/debugfs/file.c
+++ linux-mm-clean/fs/debugfs/file.c
@@ -176,10 +176,7 @@ static ssize_t read_file_bool(struct fil
 	char buf[3];
 	u32 *val = file->private_data;
 	
-	if (*val)
-		buf[0] = 'Y';
-	else
-		buf[0] = 'N';
+	buf[0] = get_bool(*val);
 	buf[1] = '\n';
 	buf[2] = 0x00;
 	return simple_read_from_buffer(user_buf, count, ppos, buf, 2);
@@ -197,18 +194,7 @@ static ssize_t write_file_bool(struct fi
 		return -EFAULT;
 
 	
-	switch (buf[0]) {
-	case 'y':
-	case 'Y':
-	case '1':
-		*val = 1;
-		break;
-	case 'n':
-	case 'N':
-	case '0':
-		*val = 0;
-		break;
-	}
+	set_bool(val, &buf[0]);
 	
 	return count;
 }
Index: linux-mm-clean/include/linux/string.h
=================================--- linux-mm-clean.orig/include/linux/string.h
+++ linux-mm-clean/include/linux/string.h
@@ -100,6 +100,10 @@ extern void * memchr(const void *,int,__
 
 extern char *kstrdup(const char *s, gfp_t gfp);
 
+extern int set_bool(int * val, const char * c);
+
+extern char get_bool(int val);
+
 #ifdef __cplusplus
 }
 #endif

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
