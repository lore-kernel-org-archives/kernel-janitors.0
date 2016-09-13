From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 20:44:55 +0000
Subject: [PATCH 3/7] AGPGART: Rename jump labels in compat_agp_ioctl()
Message-Id: <c837dfb6-1346-9368-e4a7-caed19a27eb3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
In-Reply-To: <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 21:12:02 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/agp/compat_ioctl.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/char/agp/compat_ioctl.c b/drivers/char/agp/compat_ioctl.c
index 68d4dc7..4220956 100644
--- a/drivers/char/agp/compat_ioctl.c
+++ b/drivers/char/agp/compat_ioctl.c
@@ -209,24 +209,24 @@ long compat_agp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	if ((agp_fe.current_controller = NULL) &&
 	    (cmd != AGPIOC_ACQUIRE32)) {
 		ret_val = -EINVAL;
-		goto ioctl_out;
+		goto unlock;
 	}
 	if ((agp_fe.backend_acquired != true) &&
 	    (cmd != AGPIOC_ACQUIRE32)) {
 		ret_val = -EBUSY;
-		goto ioctl_out;
+		goto unlock;
 	}
 	if (cmd != AGPIOC_ACQUIRE32) {
 		if (!(test_bit(AGP_FF_IS_CONTROLLER, &curr_priv->access_flags))) {
 			ret_val = -EPERM;
-			goto ioctl_out;
+			goto unlock;
 		}
 		/* Use the original pid of the controller,
 		 * in case it's threaded */
 
 		if (agp_fe.current_controller->pid != curr_priv->my_pid) {
 			ret_val = -EBUSY;
-			goto ioctl_out;
+			goto unlock;
 		}
 	}
 
@@ -274,8 +274,7 @@ long compat_agp_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case AGPIOC_CHIPSET_FLUSH32:
 		break;
 	}
-
-ioctl_out:
+ unlock:
 	DBG("ioctl returns %d\n", ret_val);
 	mutex_unlock(&(agp_fe.agp_mutex));
 	return ret_val;
-- 
2.10.0

