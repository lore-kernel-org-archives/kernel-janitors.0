From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 22 May 2013 18:53:09 +0000
Subject: [PATCH] staging: speakup: fix warnings by adding __user annotations
Message-Id: <1369248789-25957-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: w.d.hubbs@gmail.com, chris@the-brannons.com, kirk@reisers.ca, samuel.thibault@ens-lyon.org, gregkh@linuxfoundation.org, ben@decadent.org.uk
Cc: speakup@braille.uwo.ca, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch fixes the following sparse warnings by adding
__user annotations.

drivers/staging/speakup/speakup_soft.c:248:34: warning:
        incorrect type in argument 1 (different address spaces)
        drivers/staging/speakup/speakup_soft.c:248:34:
        expected void [noderef] <asn:1>*dst
        drivers/staging/speakup/speakup_soft.c:248:34:
        got char *[assigned] cp
drivers/staging/speakup/speakup_soft.c:272:40: warning:
        incorrect type in argument 1 (different address spaces)
        drivers/staging/speakup/speakup_soft.c:272:40:
        expected char const [noderef] <asn:1>*s
        drivers/staging/speakup/speakup_soft.c:272:40:
        got char const *buf
drivers/staging/speakup/speakup_soft.c:306:17: warning:
        incorrect type in initializer (incompatible argument 2
        (different address spaces))
        drivers/staging/speakup/speakup_soft.c:306:17:
        expected long ( *read )( ... )
        drivers/staging/speakup/speakup_soft.c:306:17:
        got long ( static [toplevel] *<noident> )( ... )
drivers/staging/speakup/speakup_soft.c:307:18: warning:
        incorrect type in initializer (incompatible argument 2
        (different address spaces))
        drivers/staging/speakup/speakup_soft.c:307:18:
        expected long ( *write )( ... )
        drivers/staging/speakup/speakup_soft.c:307:18:
        got long ( static [toplevel] *<nfile_operationsoident> )( ... )

drivers/staging/speakup/devsynth.c:29:41: warning:
        incorrect type in argument 2 (different address spaces)
        drivers/staging/speakup/devsynth.c:29:41:
        expected void const [noderef] <asn:1>*from
        drivers/staging/speakup/devsynth.c:29:41:    got char const *ptr
drivers/staging/speakup/devsynth.c:62:17: warning:
        incorrect type in initializer (incompatible argument 2
        (different address spaces))
        drivers/staging/speakup/devsynth.c:62:17:
        expected long ( *read )( ... )
        drivers/staging/speakup/devsynth.c:62:17:
        got long ( static [toplevel] *<noident> )( ... )
drivers/staging/speakup/devsynth.c:63:18: warning:
        incorrect type in initializer (incompatible argument 2
        (different address spaces))
        drivers/staging/speakup/devsynth.c:63:18:
        expected long ( *write )( ... )
        drivers/staging/speakup/devsynth.c:63:18:
        got long ( static [toplevel] *<noident> )( ... )

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/speakup/devsynth.c     |   10 +++++-----
 drivers/staging/speakup/speakup_soft.c |    8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/speakup/devsynth.c b/drivers/staging/speakup/devsynth.c
index 7d32748..71c728a 100644
--- a/drivers/staging/speakup/devsynth.c
+++ b/drivers/staging/speakup/devsynth.c
@@ -13,11 +13,11 @@
 static int misc_registered;
 static int dev_opened;
 
-static ssize_t speakup_file_write(struct file *fp, const char *buffer,
-		   size_t nbytes, loff_t *ppos)
+static ssize_t speakup_file_write(struct file *fp, const char __user *buffer,
+				  size_t nbytes, loff_t *ppos)
 {
 	size_t count = nbytes;
-	const char *ptr = buffer;
+	const char __user *ptr = buffer;
 	size_t bytes;
 	unsigned long flags;
 	u_char buf[256];
@@ -37,8 +37,8 @@ static ssize_t speakup_file_write(struct file *fp, const char *buffer,
 	return (ssize_t) nbytes;
 }
 
-static ssize_t speakup_file_read(struct file *fp, char *buf, size_t nbytes,
-	loff_t *ppos)
+static ssize_t speakup_file_read(struct file *fp, char __user *buf,
+				 size_t nbytes, loff_t *ppos)
 {
 	return 0;
 }
diff --git a/drivers/staging/speakup/speakup_soft.c b/drivers/staging/speakup/speakup_soft.c
index 83e0845..243c3d5 100644
--- a/drivers/staging/speakup/speakup_soft.c
+++ b/drivers/staging/speakup/speakup_soft.c
@@ -201,11 +201,11 @@ static int softsynth_close(struct inode *inode, struct file *fp)
 	return 0;
 }
 
-static ssize_t softsynth_read(struct file *fp, char *buf, size_t count,
+static ssize_t softsynth_read(struct file *fp, char __user *buf, size_t count,
 			      loff_t *pos)
 {
 	int chars_sent = 0;
-	char *cp;
+	char __user *cp;
 	char *init;
 	char ch;
 	int empty;
@@ -263,8 +263,8 @@ static ssize_t softsynth_read(struct file *fp, char *buf, size_t count,
 
 static int last_index;
 
-static ssize_t softsynth_write(struct file *fp, const char *buf, size_t count,
-			       loff_t *pos)
+static ssize_t softsynth_write(struct file *fp, const char __user *buf,
+			       size_t count, loff_t *pos)
 {
 	unsigned long supplied_index = 0;
 	int converted;
-- 
1.7.10.4

