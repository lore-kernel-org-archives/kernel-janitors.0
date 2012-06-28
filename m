From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jun 2012 06:44:25 +0000
Subject: [patch 1/3] vfio: signedness bug in vfio_config_do_rw()
Message-Id: <20120628064425.GA11107@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1340686552.1207.128.camel@bling.home>
In-Reply-To: <1340686552.1207.128.camel@bling.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "count" variable is unsigned here so the test for errors doesn't
work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index a4f7321..10bc6a8 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -1487,7 +1487,7 @@ static ssize_t vfio_config_do_rw(struct vfio_pci_device *vdev, char __user *buf,
 		if (perm->readfn) {
 			count = perm->readfn(vdev, *ppos, count,
 					     perm, offset, &val);
-			if (count < 0)
+			if ((ssize_t)count < 0)
 				return count;
 		}
 
