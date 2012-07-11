From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 06:40:40 +0000
Subject: [patch] tty: double unlock on error in ptmx_open()
Message-Id: <20120711064040.GH11812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>, kernel-janitors@vger.kernel.org

The problem here is that we called mutex_unlock(&devpts_mutex) on the
error path when we weren't holding the lock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/tty/pty.c b/drivers/tty/pty.c
index d855883..a0ca083 100644
--- a/drivers/tty/pty.c
+++ b/drivers/tty/pty.c
@@ -618,13 +618,12 @@ static int ptmx_open(struct inode *inode, struct file *filp)
 	/* find a device that is not in use. */
 	mutex_lock(&devpts_mutex);
 	index = devpts_new_index(inode);
+	mutex_unlock(&devpts_mutex);
 	if (index < 0) {
 		retval = index;
 		goto err_file;
 	}
 
-	mutex_unlock(&devpts_mutex);
-
 	mutex_lock(&tty_mutex);
 	tty = tty_init_dev(ptm_driver, index);
 
@@ -659,7 +658,6 @@ out:
 	mutex_unlock(&tty_mutex);
 	devpts_kill_index(inode, index);
 err_file:
-        mutex_unlock(&devpts_mutex);
 	tty_free_file(filp);
 	return retval;
 }
