From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 22 Apr 2012 11:37:09 +0000
Subject: [PATCH] drivers/staging/comedi/comedi_fops.c: add missing vfree
Message-Id: <1335094629-15879-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>
Cc: kernel-janitors@vger.kernel.org, Mori Hess <fmhess@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

aux_free is freed on all other exits from the function.  By removing the
return, we can benefit from the vfree already at the end of the function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/comedi/comedi_fops.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/comedi_fops.c b/drivers/staging/comedi/comedi_fops.c
index a0861fb..06fc656 100644
--- a/drivers/staging/comedi/comedi_fops.c
+++ b/drivers/staging/comedi/comedi_fops.c
@@ -301,7 +301,7 @@ static int do_devconfig_ioctl(struct comedi_device *dev,
 	if (ret = 0) {
 		if (!try_module_get(dev->driver->module)) {
 			comedi_device_detach(dev);
-			return -ENOSYS;
+			ret = -ENOSYS;
 		}
 	}
 

