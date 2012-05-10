From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 May 2012 15:19:04 +0000
Subject: [patch 2/2] Staging: ipack: dereferencing freed memory
Message-Id: <20120510151904.GB31515@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We free "dev" then dereference it on the next line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ipack/bridges/tpci200.c b/drivers/staging/ipack/bridges/tpci200.c
index ab6ea0a..08cd851 100644
--- a/drivers/staging/ipack/bridges/tpci200.c
+++ b/drivers/staging/ipack/bridges/tpci200.c
@@ -867,8 +867,8 @@ static int tpci200_slot_unregister(struct ipack_device *dev)
 		return -ERESTARTSYS;
 
 	ipack_device_unregister(dev);
-	kfree(dev);
 	tpci200->slots[dev->slot].dev = NULL;
+	kfree(dev);
 	mutex_unlock(&tpci200->mutex);
 
 	return 0;
