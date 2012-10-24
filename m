From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Oct 2012 07:11:47 +0000
Subject: [patch] compat_ioctl: cleanup a type in do_i2c_rdwr_ioctl()
Message-Id: <20121024071146.GA2536@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We check that:

        if (nmsgs > I2C_RDRW_IOCTL_MAX_MSGS)
                return -EINVAL;

Since "nmsgs" is signed, it means the check can underflow.  It's
harmless, but messy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index f505402..f4222a4 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -680,7 +680,8 @@ static int do_i2c_rdwr_ioctl(unsigned int fd, unsigned int cmd,
 	struct i2c_msg			__user *tmsgs;
 	struct i2c_msg32		__user *umsgs;
 	compat_caddr_t			datap;
-	int				nmsgs, i;
+	unsigned int			nmsgs;
+	int				i;
 
 	if (get_user(nmsgs, &udata->nmsgs))
 		return -EFAULT;
