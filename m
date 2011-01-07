From: Dan Carpenter <error27@gmail.com>
Date: Fri, 07 Jan 2011 05:12:27 +0000
Subject: [patch] vga_switcheroo: comparing too few characters in strncmp()
Message-Id: <20110107051227.GD1717@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>
Cc: Jiri Slaby <jslaby@suse.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a copy-and-paste bug.  We should be comparing 4 characters here
instead of 3.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index d2d8543..e01cacb 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -346,11 +346,11 @@ vga_switcheroo_debugfs_write(struct file *filp, const char __user *ubuf,
 	if (strncmp(usercmd, "DIS", 3) = 0)
 		client_id = VGA_SWITCHEROO_DIS;
 
-	if (strncmp(usercmd, "MIGD", 3) = 0) {
+	if (strncmp(usercmd, "MIGD", 4) = 0) {
 		just_mux = true;
 		client_id = VGA_SWITCHEROO_IGD;
 	}
-	if (strncmp(usercmd, "MDIS", 3) = 0) {
+	if (strncmp(usercmd, "MDIS", 4) = 0) {
 		just_mux = true;
 		client_id = VGA_SWITCHEROO_DIS;
 	}
