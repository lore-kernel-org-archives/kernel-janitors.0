From: <alex.bou9@gmail.com>
Date: Fri, 21 Jun 2019 01:08:43 +0000
Subject: RE: [PATCH] rapidio/mport_cdev: NUL terminate some strings
Message-Id: <001101d527cd$e03b0180$a0b10480$@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190529110601.GB19119@mwanda>
In-Reply-To: <20190529110601.GB19119@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, 'Andrew Morton' <akpm@linux-foundation.org>
Cc: 'Ira Weiny' <ira.weiny@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Matt Porter' <mporter@kernel.crashing.org>

Acked-by: Alexandre Bounine <alex.bou9@gmail.com>  

-----Original Message-----
From: Dan Carpenter <dan.carpenter@oracle.com> 
Sent: Wednesday, May 29, 2019 7:06 AM
To: Matt Porter <mporter@kernel.crashing.org>
Cc: Alexandre Bounine <alex.bou9@gmail.com>; Andrew Morton
<akpm@linux-foundation.org>; Ira Weiny <ira.weiny@intel.com>;
linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
Subject: [PATCH] rapidio/mport_cdev: NUL terminate some strings

The dev_info.name[] array has space for RIO_MAX_DEVNAME_SZ + 1
characters.  But the problem here is that we don't ensure that the user
put a NUL terminator on the end of the string.  It could lead to an out
of bounds read.

Fixes: e8de370188d0 ("rapidio: add mport char device driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rapidio/devices/rio_mport_cdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c
b/drivers/rapidio/devices/rio_mport_cdev.c
index 4a4a75fa26d5..3440b3e8e578 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -1690,6 +1690,7 @@ static int rio_mport_add_riodev(struct mport_cdev_priv
*priv,
 
 	if (copy_from_user(&dev_info, arg, sizeof(dev_info)))
 		return -EFAULT;
+	dev_info.name[sizeof(dev_info.name) - 1] = '\0';
 
 	rmcd_debug(RDEV, "name:%s ct:0x%x did:0x%x hc:0x%x", dev_info.name,
 		   dev_info.comptag, dev_info.destid, dev_info.hopcount);
@@ -1821,6 +1822,7 @@ static int rio_mport_del_riodev(struct mport_cdev_priv
*priv, void __user *arg)
 
 	if (copy_from_user(&dev_info, arg, sizeof(dev_info)))
 		return -EFAULT;
+	dev_info.name[sizeof(dev_info.name) - 1] = '\0';
 
 	mport = priv->md->mport;
 
-- 
2.20.1
