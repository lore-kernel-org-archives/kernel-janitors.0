From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2012 06:56:00 +0000
Subject: [patch 1/2] Staging: silicom: add some range checks to proc functions
Message-Id: <20120914065600.GF11886@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If you tried to cat more than 255 characters (the last character is for
the terminator) to these proc files then it would corrupt kernel memory.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/silicom/bp_mod.c b/drivers/staging/silicom/bp_mod.c
index 6e999c7..1b3f5e7 100644
--- a/drivers/staging/silicom/bp_mod.c
+++ b/drivers/staging/silicom/bp_mod.c
@@ -8227,6 +8227,9 @@ set_dis_bypass_pfs(struct file *file, const char *buffer,
 
 	int bypass_param = 0, length = 0;
 
+	if (count >= sizeof(kbuf))
+		return -EINVAL;
+
 	if (copy_from_user(&kbuf, buffer, count)) {
 		return -1;
 	}
@@ -8256,6 +8259,9 @@ set_dis_tap_pfs(struct file *file, const char *buffer,
 
 	int tap_param = 0, length = 0;
 
+	if (count >= sizeof(kbuf))
+		return -EINVAL;
+
 	if (copy_from_user(&kbuf, buffer, count)) {
 		return -1;
 	}
@@ -8285,6 +8291,9 @@ set_dis_disc_pfs(struct file *file, const char *buffer,
 
 	int tap_param = 0, length = 0;
 
+	if (count >= sizeof(kbuf))
+		return -EINVAL;
+
 	if (copy_from_user(&kbuf, buffer, count)) {
 		return -1;
 	}
@@ -8374,6 +8383,9 @@ set_bypass_pwup_pfs(struct file *file, const char *buffer,
 
 	int bypass_param = 0, length = 0;
 
+	if (count >= sizeof(kbuf))
+		return -EINVAL;
+
 	if (copy_from_user(&kbuf, buffer, count)) {
 		return -1;
 	}
@@ -8403,6 +8415,9 @@ set_bypass_pwoff_pfs(struct file *file, const char *buffer,
 
 	int bypass_param = 0, length = 0;
 
+	if (count >= sizeof(kbuf))
+		return -EINVAL;
+
 	if (copy_from_user(&kbuf, buffer, count)) {
 		return -1;
 	}
@@ -8432,6 +8447,9 @@ set_tap_pwup_pfs(struct file *file, const char *buffer,
 
 	int tap_param = 0, length = 0;
 
+	if (count >= sizeof(kbuf))
+		return -EINVAL;
+
 	if (copy_from_user(&kbuf, buffer, count)) {
 		return -1;
 	}
@@ -8461,6 +8479,9 @@ set_disc_pwup_pfs(struct file *file, const char *buffer,
 
 	int tap_param = 0, length = 0;
 
+	if (count >= sizeof(kbuf))
+		return -EINVAL;
+
 	if (copy_from_user(&kbuf, buffer, count)) {
 		return -1;
 	}
@@ -8570,6 +8591,9 @@ set_std_nic_pfs(struct file *file, const char *buffer,
 
 	int bypass_param = 0, length = 0;
 
+	if (count >= sizeof(kbuf))
+		return -EINVAL;
+
 	if (copy_from_user(&kbuf, buffer, count)) {
 		return -1;
 	}
