From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 13 Mar 2012 16:58:37 +0000
Subject: [PATCH] scripts/coccinelle/api/simple_open.cocci: semantic patch for simple_open()
Message-Id: <1331657917-4552-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sboyd@codeaurora.org
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, mmarek@suse.cz

From: Julia Lawall <Julia.Lawall@lip6.fr>

Find instances of an open-coded simple_open() and replace them
with calls to simple_open().

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Reported-by: Stephen Boyd <sboyd@codeaurora.org>

---
 scripts/coccinelle/api/simple_open.cocci |   70 +++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/scripts/coccinelle/api/simple_open.cocci b/scripts/coccinelle/api/simple_open.cocci
new file mode 100644
index 0000000..05962f7
--- /dev/null
+++ b/scripts/coccinelle/api/simple_open.cocci
@@ -0,0 +1,70 @@
+/// This removes an open coded simple_open() function
+/// and replaces file operations references to the function
+/// with simple_open() instead.
+///
+// Confidence: High
+// Comments:
+// Options: -no_includes -include_headers
+
+virtual patch
+virtual report
+
+@ open depends on patch @
+identifier open_f != simple_open;
+identifier i, f;
+@@
+-int open_f(struct inode *i, struct file *f)
+-{
+(
+-if (i->i_private)
+-f->private_data = i->i_private;
+|
+-f->private_data = i->i_private;
+)
+-return 0;
+-}
+
+@ has_open depends on open @
+identifier fops;
+identifier open.open_f;
+@@
+struct file_operations fops = {
+...,
+-.open = open_f,
++.open = simple_open,
+...
+};
+
+@ openr depends on report @
+identifier open_f != simple_open;
+identifier i, f;
+position p;
+@@
+int open_f@p(struct inode *i, struct file *f)
+{
+(
+if (i->i_private)
+f->private_data = i->i_private;
+|
+f->private_data = i->i_private;
+)
+return 0;
+}
+
+@ has_openr depends on openr @
+identifier fops;
+identifier openr.open_f;
+position p;
+@@
+struct file_operations fops = {
+...,
+.open = open_f@p,
+...
+};
+
+@script:python@
+pf << openr.p;
+ps << has_openr.p;
+@@
+
+coccilib.report.print_report(pf[0],"WARNING opportunity for simple_open, see also structure on line %s"%(ps[0].line))

