From: Dan Carpenter <error27@gmail.com>
Date: Fri, 04 Jun 2010 10:39:51 +0000
Subject: [patch] Staging: rc2860: return -EFAULT on copy_to_user errors
Message-Id: <20100604103951.GE5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bytes remaining but we want to
return a negative error code.  This is in the ioctl handler and the
error code gets passed to userspace.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rt2860/sta_ioctl.c b/drivers/staging/rt2860/sta_ioctl.c
index 112da7a..6b8268d 100644
--- a/drivers/staging/rt2860/sta_ioctl.c
+++ b/drivers/staging/rt2860/sta_ioctl.c
@@ -2522,6 +2522,8 @@ int rt28xx_sta_ioctl(IN struct net_device *net_dev,
 			Status  			    copy_to_user(erq->pointer, pAd->nickname,
 					 erq->length);
+			if (Status)
+				Status = -EFAULT;
 			break;
 		}
 	case SIOCGIWRATE:	/*get default bit rate (bps) */
