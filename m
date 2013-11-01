From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Nov 2013 10:24:48 +0000
Subject: [patch] compat_ioctl: fix an underflow issue (harmless)
Message-Id: <20131101102448.GE29795@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We cap "nmsgs" at I2C_RDRW_IOCTL_MAX_MSGS (42) but the current code
allows negative values.  It's harmless but it makes my static checker
upset so I've made nsmgs unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 5d19acf..2cb2fd2 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -680,7 +680,8 @@ static int do_i2c_rdwr_ioctl(unsigned int fd, unsigned int cmd,
 	struct i2c_msg			__user *tmsgs;
 	struct i2c_msg32		__user *umsgs;
 	compat_caddr_t			datap;
-	int				nmsgs, i;
+	u32				nmsgs;
+	int				i;
 
 	if (get_user(nmsgs, &udata->nmsgs))
 		return -EFAULT;
