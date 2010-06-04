From: Dan Carpenter <error27@gmail.com>
Date: Fri, 04 Jun 2010 10:20:46 +0000
Subject: [patch] vt_ioctl: return -EFAULT on copy_from_user errors
Message-Id: <20100604102046.GY5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Alan Cox <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_from_user() returns the number of bytes remaining but we want to
return a negative error code here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/vt_ioctl.c b/drivers/char/vt_ioctl.c
index 6aa1028..cb19dbc 100644
--- a/drivers/char/vt_ioctl.c
+++ b/drivers/char/vt_ioctl.c
@@ -1303,7 +1303,9 @@ int vt_ioctl(struct tty_struct *tty, struct file * file,
 		if (!perm)
 			goto eperm;
 		ret = copy_from_user(&ui, up, sizeof(struct unimapinit));
-		if (!ret)
+		if (ret)
+			ret = -EFAULT;
+		else
 			con_clear_unimap(vc, &ui);
 		break;
 	      }
