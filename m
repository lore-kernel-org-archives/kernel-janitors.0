From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Nov 2011 06:42:05 +0000
Subject: [patch] isdn: make sure strings are null terminated
Message-Id: <20111123064204.GA6871@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

These strings come from the user.  We strcpy() them inside
cf_command() so we should check that they are NULL terminated and
return an error if not.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/isdn/divert/divert_procfs.c b/drivers/isdn/divert/divert_procfs.c
index 33ec9e4..0c16687 100644
--- a/drivers/isdn/divert/divert_procfs.c
+++ b/drivers/isdn/divert/divert_procfs.c
@@ -242,6 +242,10 @@ static int isdn_divert_ioctl_unlocked(struct file *file, uint cmd, ulong arg)
 		case IIOCDOCFINT:
 			if (!divert_if.drv_to_name(dioctl.cf_ctrl.drvid))
 				return (-EINVAL);	/* invalid driver */
+			if (strlen(dioctl.cf_ctrl.msn) >= sizeof(dioctl.cf_ctrl.msn))
+				return -EINVAL;
+			if (strlen(dioctl.cf_ctrl.fwd_nr) >= sizeof(dioctl.cf_ctrl.fwd_nr))
+				return -EINVAL;
 			if ((i = cf_command(dioctl.cf_ctrl.drvid,
 					    (cmd = IIOCDOCFACT) ? 1 : (cmd = IIOCDOCFDIS) ? 0 : 2,
 					    dioctl.cf_ctrl.cfproc,
