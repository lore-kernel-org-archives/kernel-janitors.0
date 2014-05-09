From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 May 2014 11:59:16 +0000
Subject: [patch] applicom: dereferencing NULL on error path
Message-Id: <20140509115916.GD32027@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Christophe Lucas <clucas@rotomalug.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a static checker fix.  The "dev" variable is always NULL after
the while statement so we would be dereferencing a NULL pointer here.

Fixes: 819a3eba4233 ('[PATCH] applicom: fix error handling')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/char/applicom.c b/drivers/char/applicom.c
index 974321a..1479030 100644
--- a/drivers/char/applicom.c
+++ b/drivers/char/applicom.c
@@ -345,7 +345,6 @@ out:
 			free_irq(apbs[i].irq, &dummy);
 		iounmap(apbs[i].RamIO);
 	}
-	pci_disable_device(dev);
 	return ret;
 }
 
