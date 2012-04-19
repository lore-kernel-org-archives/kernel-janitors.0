From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Apr 2012 10:46:08 +0000
Subject: [patch] USB: bcma: suspend() only takes one argument now
Message-Id: <20120419104608.GA30011@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

We changed the API here a couple months ago.  It suspend() only takes
one argument now.  GCC complains about this:

    drivers/usb/host/bcma-hcd.c:320:2: warning: initialization from
        incompatible pointer type [enabled by default]
    drivers/usb/host/bcma-hcd.c:320:2: warning: (near initialization
        for ‘bcma_hcd_driver.suspend’) [enabled by default]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index afec047..0b35d42 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -286,7 +286,7 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
 #ifdef CONFIG_PM
 
-static int bcma_hcd_suspend(struct bcma_device *dev, pm_message_t state)
+static int bcma_hcd_suspend(struct bcma_device *dev)
 {
 	bcma_core_disable(dev, 0);
 
