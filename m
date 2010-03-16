From: Dan Carpenter <error27@gmail.com>
Date: Tue, 16 Mar 2010 10:19:51 +0000
Subject: bug report: frontier: use after free
Message-Id: <20100316101951.GD5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

drivers/staging/frontier/alphatrack.c +854 usb_alphatrack_disconnect()
   845          /* if the device is not opened, then we clean up right now */
   846          if (!dev->open_count) {
   847                  up(&dev->sem);
   848                  usb_alphatrack_delete(dev);

	We free "dev" here.

   849          } else {
   850                  dev->intf = NULL;
   851                  up(&dev->sem);
   852          }
   853  
   854          atomic_set(&dev->writes_pending, 0);

	We use it here.

regards,
dan carpenter
