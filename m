From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Dec 2011 19:24:41 +0000
Subject: [smatch stuff] xshm: release misc device on error
Message-Id: <20111208192441.GB8810@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Sjur,

Smatch complains that we don't release the misc device on error.

drivers/xshm/xshm_chr.c +1057 cfshm_probe(75)
	warn: '&dev->misc' was not released on error

  1043          /* Register the device. */
  1044          dev->misc.parent = &xshm->pdev.dev;
  1045          result = misc_register(&dev->misc);
  1046  
  1047          /* Lock in order to try to stop someone from opening the device
  1048           * too early. The misc device has its own lock. We cannot take our
  1049           * lock until misc_register() is finished, because in open() the
  1050           * locks are taken in this order (misc first and then dev).
  1051           * So anyone managing to open the device between the misc_register
  1052           * and the mutex_lock will get a "device not found" error. Don't
  1053           * think it can be avoided.
  1054           */
  1055          if (mutex_lock_interruptible(&dev->mutex)) {
  1056                  xdev_dbg(dev, "mutex_lock_interruptible got signalled\n");

-> if result is 0 here we should release it.  Should we call
xshmchr_put() or misc_deregister()?

  1057                  return -ERESTARTSYS;
  1058          }
  1059  
  1060          if (result < 0) {
  1061                  pr_warn("XSHMCHR: chnl_chr: error - %d, can't register misc.\n",
  1062                                result);
  1063                  mutex_unlock(&dev->mutex);
  1064                  goto err_failed;
  1065          }

regards,
dan carpenter
